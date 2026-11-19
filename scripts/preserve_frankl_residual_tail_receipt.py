#!/usr/bin/env python3
"""Preserve original passed custom-format residual-tail evidence.

This historical ZIP contains audit/replay/reproduction evidence, not compiled
object bytes. Preserve the original full object-hash inventory without claiming
a new rehash or replay of unavailable compiled objects.
"""
from __future__ import annotations
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import subprocess
import tempfile
import zipfile
import verify_frankl_residual_tail as tail
from preserve_frankl_arithmetic_receipts import (
    ROOT, REPO, api, request, require, sha, encoded, git_bytes,
)

RUN_ID = 44504678765
JOB_ID = 135493067248
HEAD = "2d70d7816b07a475d3a5dd74a126ac2ac8764dca"
WORKFLOW = "Lean Frankl reconstructed residual tail"
ARTIFACT_ID = 14524240710
ARTIFACT_NAME = "frankl-reconstructed-residual-tail"
ZIP_SHA256 = "f2fbe9d08bfddaebbe47af74d97f6edba732cdb41817dbd6da551bb619ff802c"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
GATE_SHA256 = "1fbb2e912eb61d2146ae401d254fe97c05aa6b49d12512dcd69449f7f033524d"
DESTINATION = "docs/verification/frankl-residual-tail-44504678765"
DIGEST = re.compile(r"[0-9a-f]{64}")


def checked_git_bytes(path, expected):
    require(DIGEST.fullmatch(expected) is not None, "Malformed SHA256: " + path)
    raw = git_bytes(HEAD, path)
    require(raw is not None and sha(raw) == expected, "Checked-commit hash differs: " + path)
    return raw


def validate_archive(artifact, payload):
    require(sha(payload) == ZIP_SHA256 and artifact["digest"] == "sha256:" + ZIP_SHA256,
            "Original Tail archive digest differs")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    require(sum(info.file_size for info in archive.infolist()) <= 64 * 1024 * 1024,
            "Uncompressed Tail evidence exceeds bound")
    names = archive.namelist()
    require(len(names) == len(set(names)), "Duplicate archive member")
    require(all(not PurePosixPath(name).is_absolute()
                and ".." not in PurePosixPath(name).parts for name in names), "Unsafe archive path")
    receipts = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(receipts) == 1, "Expected exactly one original Tail receipt")
    receipt_path = receipts[0]
    prefix = str(PurePosixPath(receipt_path).parent)
    prefix = "" if prefix == "." else prefix + "/"
    raw = archive.read(receipt_path)
    receipt = json.loads(raw)
    require(receipt["status"] == "passed" and receipt["commit"] == HEAD
            and receipt["task"] == "tail", "Original Tail receipt did not pass at the expected commit")
    target, modules, covered, required = tail.task_spec("tail")
    require(receipt["target"] == target and receipt["project_modules"] == modules
            and len(modules) == 116 and len(set(modules)) == 116, "Exact Tail project closure differs")
    require(receipt["covered_tasks"] == covered and receipt["required_theorems"] == required,
            "Tail endpoint/task inventory differs")
    require(receipt["checked_sources"] == modules and receipt["source_failures"] == {},
            "Not every project source passed its strict rebuild")
    require(receipt["completed_checks"] == [
        "strict source checks, warnings treated as errors",
        "explicit import-all axiom whitelist and exact private-node visibility",
        "independent exact-closure kernel replay",
    ], "Original gate completion evidence differs")
    require(receipt["checker"]["sha256"] == CHECKER_SHA256, "Wrong pinned stock checker")

    expected_sources = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    expected_sources |= {"lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}
    require(set(receipt["source_sha256"]) == expected_sources, "Incomplete checked-source inventory")
    frozen_sources = {}
    for path, expected in receipt["source_sha256"].items():
        checked_git_bytes(path, expected)
        require((ROOT / path).is_file() and tail.digest(ROOT / path) == expected,
                "Current mathematical source differs from the checked snapshot: " + path)
        frozen_sources[path] = expected
    require(set(receipt["gate_sha256"]) == set(tail.GATE_INPUTS),
            "Original gate-input inventory differs")
    for path, expected in receipt["gate_sha256"].items():
        checked_git_bytes(path, expected)
    require(receipt["gate_sha256"]["scripts/verify_frankl_residual_tail.py"] == GATE_SHA256
            and tail.digest(ROOT / "scripts/verify_frankl_residual_tail.py") == GATE_SHA256,
            "The reviewed all-owned Tail gate differs")
    for path in (tail.INVENTORY_PATH, tail.BASE_INVENTORY_PATH, tail.REPRODUCER_PATH):
        expected = receipt["gate_sha256"][path]
        require(tail.digest(ROOT / path) == expected, "Current Tail data inventory differs: " + path)
        frozen_sources[path] = expected
    require(receipt["recovery_inventory_sha256"] == receipt["gate_sha256"][tail.INVENTORY_PATH],
            "Recovery inventory digest differs")
    tail.preflight_sources()

    artifacts = receipt["artifact_sha256"]
    require(set(artifacts) == set(modules), "Incomplete original object-hash inventory")
    facet_count = 0
    for module, facets in artifacts.items():
        require({".olean", ".olean.private", ".olean.server"} <= set(facets),
                "Missing modern proof facet in original receipt: " + module)
        require(set(facets) <= {".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"},
                "Unexpected object facet: " + module)
        require(all(DIGEST.fullmatch(value) for value in facets.values()),
                "Malformed original object hash: " + module)
        facet_count += len(facets)

    nodes = tail.private_nodes(modules)
    private_count = sum(map(len, nodes.values()))
    require(private_count == 1044, "Expected all 1044 private certificate nodes")
    audit_source = archive.read(prefix + "AxiomAudit.lean")
    audit_log = archive.read(prefix + "axiom-audit.log")
    audit = receipt["axiom_audit"]
    require(audit_source.decode("utf-8") == tail.audit_source(modules, required, nodes),
            "Archived audit is not the exact all-owned/private-node audit")
    require(sha(audit_source) == audit["audit_source_sha256"]
            and sha(audit_log) == audit["log_sha256"], "Archived audit hash differs")
    require(audit["project_modules"] == len(modules) and audit["required_endpoints"] == len(required)
            and audit["private_certificate_nodes_visible"] == private_count
            and audit["new_private_certificate_nodes"] == 447
            and audit["explicit_import_all"] is True
            and audit["all_owned_declarations_audited"] is True,
            "Incomplete original declaration/private-proof audit")
    text = audit_log.decode("utf-8")
    counts = re.findall(r"PASS: (\d+) project theorems audited; all (\d+) private "
                        r"certificate-node proofs visible; only standard logical axioms", text)
    owned = re.findall(r"PASS: (\d+) owned declarations audited transitively", text)
    require(len(counts) == 1 and len(owned) == 1
            and int(counts[0][0]) == audit["project_theorems"]
            and int(counts[0][1]) == private_count
            and int(owned[0]) == audit["owned_declarations_audited"]
            and audit["owned_declarations_audited"] >= audit["project_theorems"] > 0,
            "Archived all-owned audit result differs")

    replay_log = archive.read(prefix + "kernel-replay.log")
    replay = receipt["kernel_replay"]
    require(sha(replay_log) == replay["log_sha256"] and replay["exact_replay_set"] is True,
            "Archived stock replay evidence differs")
    replayed = tail.assert_exact_replay_set(replay_log.decode("utf-8"), modules)
    require(replayed == replay["replayed_modules"], "Original replay order/set differs")
    require(("PASS: the entire local import closure of " + target +
             " completed the pinned kernel replay") in replay_log.decode("utf-8"),
            "Missing successful stock-kernel conclusion")

    regeneration_raw = archive.read(prefix + "tail-regeneration.json")
    regeneration = json.loads(regeneration_raw)
    require(sha(regeneration_raw) == receipt["reproduction"]["sha256"],
            "Original finder reproduction evidence differs")
    require(regeneration["original_finder_stdout_sha256"] ==
            tail.INVENTORY["original_finder_stdout_sha256"]
            and regeneration["private_checked_nodes"] == 447
            and regeneration["original_replay_count"] == 31,
            "Original finite Tail reproduction differs")
    generated = regeneration["generated_source_sha256"]
    require(len(generated) == receipt["reproduction"]["generated_sources"],
            "Regenerated source count differs")
    for name, expected in generated.items():
        require("/" not in name and name.endswith(".lean"), "Unexpected regenerated filename")
        require(receipt["source_sha256"]["lean/Conjectures/" + name] == expected,
                "Regenerated source was not exactly source-checked: " + name)

    evidence = {"receipt.json": raw, "AxiomAudit.lean": audit_source,
                "axiom-audit.log": audit_log, "kernel-replay.log": replay_log,
                "tail-regeneration.json": regeneration_raw}
    files = {DESTINATION + "/" + name: contents for name, contents in evidence.items()}
    summary = {
        "schema": "frankl-original-residual-tail-receipt-v1",
        "source_run_id": RUN_ID, "source_job_id": JOB_ID, "source_commit": HEAD,
        "workflow": WORKFLOW, "artifact_id": ARTIFACT_ID, "artifact_name": ARTIFACT_NAME,
        "archive_sha256": ZIP_SHA256, "receipt_sha256": sha(raw),
        "project_modules": len(modules), "required_endpoints": len(required),
        "private_certificate_nodes": private_count, "new_tail_private_nodes": 447,
        "owned_declarations_audited": audit["owned_declarations_audited"],
        "project_theorems_audited": audit["project_theorems"],
        "recorded_object_facets": facet_count, "object_bytes_archived": False,
        "object_validation_scope": (
            "The successful original gate checked materialized modern facets, "
            "recorded their hashes before replay, and required them unchanged "
            "after exact stock replay. This ZIP has the original hashes but no "
            "object bytes; preservation does not independently rehash or replay them."),
        "exact_replay_set_checked_from_original_log": True,
        "original_receipt_bytes_unchanged": True,
        "source_and_gate_hashes_checked_against_source_commit": True,
        "current_mathematical_sources_match_checked_commit": True,
        "evidence_sha256": {name: sha(contents) for name, contents in evidence.items()},
        "scope": receipt["scope"], "accepted_registry_changed": False,
    }
    files[DESTINATION + "/summary.json"] = encoded(summary)
    print(json.dumps(summary, sort_keys=True), flush=True)
    return files, frozen_sources


def publish(files, frozen_sources):
    if not files:
        print("No successful Tail evidence", flush=True)
        return
    for attempt in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, expected in frozen_sources.items():
            require(sha(git_bytes(latest, path) or b"") == expected,
                    "Concurrent checked-source change: " + path)
        for path, raw in files.items():
            current = git_bytes(latest, path)
            require(current is None or current == raw,
                    "Never overwrite a different historical Tail evidence: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All selected Tail evidence already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="frankl-tail-receipt-") as directory:
            env = {**os.environ, "GIT_INDEX_FILE": str(Path(directory) / "index"),
                   "GIT_AUTHOR_NAME": "github-actions[bot]", "GIT_COMMITTER_NAME": "github-actions[bot]",
                   "GIT_AUTHOR_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
                   "GIT_COMMITTER_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com"}
            subprocess.run(["git", "read-tree", latest], cwd=ROOT, env=env, check=True)
            for path, raw in files.items():
                blob = subprocess.check_output(["git", "hash-object", "-w", "--stdin"],
                                               cwd=ROOT, input=raw).decode().strip()
                subprocess.run(["git", "update-index", "--add", "--cacheinfo", "100644", blob, path],
                               cwd=ROOT, env=env, check=True)
            tree = subprocess.check_output(["git", "write-tree"], cwd=ROOT, env=env, text=True).strip()
            message = ("Preserve the original successful residual-tail receipt\n\n"
                       "Validate the original archive, checked source/gate hashes, "
                       "all-declaration/private-node audit and exact stock replay evidence. "
                       "Object hashes are preserved from the successful gate; this older "
                       "archive contains no object bytes. No accepted registry changes.\n")
            commit = subprocess.check_output(["git", "commit-tree", tree, "-p", latest],
                                             cwd=ROOT, env=env, text=True, input=message).strip()
            pushed = subprocess.run(["git", "push", "origin", commit + ":refs/heads/main"], cwd=ROOT)
            if pushed.returncode == 0:
                print(json.dumps({"receipt_commit": commit, "parent": latest, "files": sorted(files)}),
                      flush=True)
                return
        fresh = api("/git/ref/heads/main")["object"]["sha"]
        require(fresh != latest, "Receipt push failed without a concurrent main update")
        print(json.dumps({"retry": attempt + 1, "new_head": fresh}), flush=True)
    raise RuntimeError("Main moved during every bounded receipt-publication attempt")

def main():
    run = api("/actions/runs/" + str(RUN_ID))
    require(run["head_sha"] == HEAD and run["name"] == WORKFLOW
            and run["path"] == ".github/workflows/lean-frankl-residual-tail.yml",
            "Tail workflow identity differs")
    require(run["head_repository"]["full_name"] == REPO and run["head_branch"] == "main",
            "Tail run belongs to another repository or branch")
    require(run["status"] == "completed" and run["conclusion"] == "success",
            "The original Tail run did not succeed")
    jobs = api("/actions/runs/" + str(RUN_ID) + "/jobs?per_page=100")
    matches = [job for job in jobs["jobs"] if job["id"] == JOB_ID]
    require(len(matches) == 1 and matches[0]["conclusion"] == "success",
            "The expected Tail proof job did not pass")
    listing = api("/actions/runs/" + str(RUN_ID) + "/artifacts?per_page=100")
    matches = [artifact for artifact in listing["artifacts"] if artifact["id"] == ARTIFACT_ID]
    require(len(matches) == 1, "Exact original Tail artifact unavailable")
    artifact = matches[0]
    require(not artifact["expired"] and artifact["name"] == ARTIFACT_NAME
            and artifact["workflow_run"]["id"] == RUN_ID
            and artifact["workflow_run"]["head_sha"] == HEAD, "Tail artifact ownership differs")
    payload = request(artifact["archive_download_url"])
    subprocess.run(["git", "fetch", "--no-tags", "--depth=1", "origin", HEAD],
                   cwd=ROOT, check=True)
    files, frozen_sources = validate_archive(artifact, payload)
    publish(files, frozen_sources)


if __name__ == "__main__":
    main()
