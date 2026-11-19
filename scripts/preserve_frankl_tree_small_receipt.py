#!/usr/bin/env python3
"""Preserve the original exact K03--K14 source/audit/kernel receipt."""
from __future__ import annotations
import io
import json
from pathlib import PurePosixPath
import re
import subprocess
import zipfile
import verify_frankl_tree_small_candidate as gate
from preserve_frankl_arithmetic_receipts import (
    ROOT, REPO, api, request, require, sha, encoded, git_bytes,
)
from preserve_frankl_component_receipts import publish

RUN_ID = 44509402083
JOB_ID = 135509369415
HEAD = "d005e00878c09b74b2ca953d5c2d4c8327f53625"
WORKFLOW = "Lean Frankl exact small-degree tree candidate"
ARTIFACT_ID = 14523867506
ARTIFACT_NAME = "frankl-tree-small-exact-candidate"
ZIP_SHA256 = "baf5f70e7752be6ec1ab8f4635e0937aa8aff92d96c0c36c4e5f4f47b5976fce"
RECEIPT_SHA256 = "016135ced2a2ea248709ca5ed8e5c1914fe123573d90cda38332f15d9db2066a"
GATE_SHA256 = "f95ee83cfb9a78e45666d30247a011301f5aae19fbd9a5a77a3dd9dce35705da"
DESTINATION = "docs/verification/frankl-tree-small-44509402083"
DIGEST = re.compile(r"[0-9a-f]{64}")


def checked_git_bytes(path, expected):
    require(DIGEST.fullmatch(expected) is not None, "Malformed SHA256: " + path)
    raw = git_bytes(HEAD, path)
    require(raw is not None and sha(raw) == expected, "Checked-commit hash differs: " + path)
    return raw


def validate_archive(artifact, payload):
    require(sha(payload) == ZIP_SHA256 and artifact["digest"] == "sha256:" + ZIP_SHA256,
            "Original tree-small archive digest differs")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    require(sum(info.file_size for info in archive.infolist()) <= 2 * 1024 * 1024 * 1024,
            "Uncompressed tree-small evidence exceeds bound")
    names = archive.namelist()
    require(len(names) == len(set(names)), "Duplicate archive member")
    require(all(not PurePosixPath(name).is_absolute()
                and ".." not in PurePosixPath(name).parts for name in names), "Unsafe archive path")
    receipts = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(receipts) == 1, "Expected exactly one original small-degree receipt")
    receipt_path = receipts[0]
    prefix = str(PurePosixPath(receipt_path).parent)
    prefix = "" if prefix == "." else prefix + "/"
    raw = archive.read(receipt_path)
    require(sha(raw) == RECEIPT_SHA256, "Original receipt digest differs")
    receipt = json.loads(raw)
    require(receipt["status"] == "passed" and receipt["commit"] == HEAD
            and receipt["target"] == gate.TARGET, "Original tree-small receipt identity differs")
    modules, required = gate.preflight_sources()
    require(len(modules) == 29 and len(set(modules)) == 29
            and receipt["project_modules"] == modules, "Exact 29-module tree closure differs")
    require(receipt["required_theorems"] == required and len(required) == 173,
            "Required degree theorem inventory differs")
    require(receipt["checked_sources"] == modules and receipt["source_failures"] == {},
            "Not every project source passed its strict rebuild")
    require(receipt["completed_checks"] == [
        "strict source checks of all 29 modules",
        "all-owned-declaration import-all axiom audit",
        "exact materialized stock-kernel replay",
    ], "Original gate completion evidence differs")
    require(receipt["all_input_and_artifact_hashes_unchanged"] is True
            and receipt["certificate_data_unchanged"] is True,
            "Missing original immutability/value-preservation assertions")
    require(receipt["recursion_repair"] == gate.INVENTORY["repair"],
            "Scoped K10 recursion-budget repair differs")
    require(receipt["checker"]["sha256"] == gate.CHECKER_SHA256,
            "Wrong pinned stock checker")
    require("eb6cafb" in receipt["compiler"]["version"]
            and DIGEST.fullmatch(receipt["compiler"]["sha256"]) is not None,
            "Wrong or malformed pinned compiler identity")

    expected_sources = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    expected_sources |= {"lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}
    require(set(receipt["source_sha256"]) == expected_sources, "Incomplete checked-source inventory")
    frozen_sources = {}
    for path, expected in receipt["source_sha256"].items():
        checked_git_bytes(path, expected)
        require((ROOT / path).is_file() and gate.digest(ROOT / path) == expected,
                "Current mathematical source differs from the checked snapshot: " + path)
        frozen_sources[path] = expected
    require(set(receipt["gate_sha256"]) == set(gate.GATE_INPUTS),
            "Original gate-input inventory differs")
    for path, expected in receipt["gate_sha256"].items():
        checked_git_bytes(path, expected)
    own_gate = "scripts/verify_frankl_tree_small_candidate.py"
    require(receipt["gate_sha256"][own_gate] == GATE_SHA256
            and gate.digest(ROOT / own_gate) == GATE_SHA256, "Reviewed tree-small gate differs")
    inventory_hash = receipt["gate_sha256"][gate.INVENTORY_PATH]
    require(gate.digest(ROOT / gate.INVENTORY_PATH) == inventory_hash,
            "Current tree-small source inventory differs")
    frozen_sources[gate.INVENTORY_PATH] = inventory_hash

    artifacts = receipt["artifact_sha256"]
    require(set(artifacts) == set(modules), "Incomplete original object-hash inventory")
    required_facets = (".olean", ".olean.private", ".olean.server")
    expected_staged = {}
    for module, facets in artifacts.items():
        require(set(required_facets) <= set(facets), "Missing modern object facet: " + module)
        require(set(facets) <= {*required_facets, ".ir", ".ir.sig"}
                and all(DIGEST.fullmatch(value) for value in facets.values()),
                "Malformed original object inventory: " + module)
        for suffix in required_facets:
            relative = module.replace(".", "/") + suffix
            expected = facets[suffix]
            require(sha(archive.read(prefix + "lib/lean/" + relative)) == expected,
                    "Archived modern proof facet differs: " + relative)
            expected_staged[relative] = expected
    discovered = {name.removeprefix(prefix + "lib/lean/")
                  for name in names if name.startswith(prefix + "lib/lean/")}
    require(discovered == set(expected_staged), "Archived replay facet set differs")
    require(len(expected_staged) == 87, "Expected all 87 modern replay facets")

    audit_source = archive.read(prefix + "AxiomAudit.lean")
    audit_log = archive.read(prefix + "axiom-audit.log")
    audit = receipt["axiom_audit"]
    require(audit_source.decode("utf-8") == gate.audit_source(modules, required, {}),
            "Archived audit differs from the exact all-owned audit")
    require(sha(audit_source) == audit["audit_source_sha256"]
            and sha(audit_log) == audit["log_sha256"], "Archived audit hash differs")
    require(audit["project_modules"] == 29 and audit["required_endpoints"] == 173
            and audit["public_degree_certificate_theorems"] == 168
            and audit["private_certificate_nodes_visible"] == 0
            and audit["explicit_import_all"] is True
            and audit["all_owned_declarations_audited"] is True,
            "Incomplete original declaration audit")
    text = audit_log.decode("utf-8")
    counts = re.findall(r"PASS: (\d+) project theorems audited; all (\d+) private "
                        r"certificate-node proofs visible; only standard logical axioms", text)
    owned = re.findall(r"PASS: (\d+) owned declarations audited transitively", text)
    require(counts == [("293", "0")] and owned == ["594"]
            and audit["project_theorems"] == 293
            and audit["owned_declarations_audited"] == 594,
            "Archived all-owned audit result differs")

    replay_log = archive.read(prefix + "kernel-replay.log")
    replay = receipt["kernel_replay"]
    require(sha(replay_log) == replay["log_sha256"] and replay["exact_replay_set"] is True,
            "Archived stock replay evidence differs")
    replayed = gate.assert_exact_replay_set(replay_log.decode("utf-8"), modules)
    require(replayed == replay["replayed_modules"]
            and replay["materialized_project_facets"] == expected_staged
            and replay["workers"] == 1, "Original replay order/facet set differs")
    measurement = replay["measurement"]
    require(measurement["exit_code"] == 0 and measurement["timer_exit_code"] == 0
            and measurement["peak_rss_kib"] > 0 and measurement["elapsed_seconds"] > 0,
            "The original stock kernel did not finish successfully")
    metrics_raw = archive.read(prefix + "kernel-replay.metrics.json")
    require(json.loads(metrics_raw) == measurement, "Archived replay measurements differ")
    resource_raw = archive.read(prefix + "kernel-replay.resources.txt")
    resource = re.findall(r"^([0-9.]+) ([0-9]+) ([0-9]+)$",
                          resource_raw.decode("utf-8"), re.M)
    require(len(resource) == 1 and float(resource[0][0]) == measurement["timer_elapsed_seconds"]
            and int(resource[0][1]) == measurement["peak_rss_kib"]
            and int(resource[0][2]) == 0, "Archived independent resource timer differs")

    evidence = {"receipt.json": raw, "AxiomAudit.lean": audit_source,
                "axiom-audit.log": audit_log, "kernel-replay.log": replay_log,
                "kernel-replay.metrics.json": metrics_raw,
                "kernel-replay.resources.txt": resource_raw}
    files = {DESTINATION + "/" + name: contents for name, contents in evidence.items()}
    summary = {
        "schema": "frankl-original-tree-small-receipt-v1",
        "source_run_id": RUN_ID, "source_job_id": JOB_ID, "source_commit": HEAD,
        "workflow": WORKFLOW, "artifact_id": ARTIFACT_ID, "artifact_name": ARTIFACT_NAME,
        "archive_sha256": ZIP_SHA256, "receipt_sha256": sha(raw),
        "project_modules": 29, "required_endpoints": 173,
        "public_degree_certificate_theorems": 168,
        "owned_declarations_audited": 594, "project_theorems_audited": 293,
        "modern_replay_facets_rehashed": 87,
        "recorded_artifact_facets": sum(map(len, artifacts.values())),
        "exact_replay_set_checked_from_original_log": True,
        "original_receipt_bytes_unchanged": True,
        "source_and_gate_hashes_checked_against_source_commit": True,
        "current_mathematical_sources_match_checked_commit": True,
        "evidence_sha256": {name: sha(contents) for name, contents in evidence.items()},
        "kernel_measurement": measurement, "source_seconds": receipt["source_seconds"],
        "certificate_values_unchanged": True, "scope": receipt["scope"],
        "accepted_registry_changed": False,
    }
    files[DESTINATION + "/summary.json"] = encoded(summary)
    print(json.dumps(summary, sort_keys=True), flush=True)
    return files, frozen_sources


def main():
    run = api("/actions/runs/" + str(RUN_ID))
    require(run["head_sha"] == HEAD and run["name"] == WORKFLOW
            and run["path"] == ".github/workflows/lean-frankl-tree-small-candidate.yml",
            "Tree-small workflow identity differs")
    require(run["head_repository"]["full_name"] == REPO and run["head_branch"] == "main",
            "Tree-small run belongs to another repository or branch")
    require(run["status"] == "completed" and run["conclusion"] == "success",
            "The original tree-small run did not succeed")
    jobs = api("/actions/runs/" + str(RUN_ID) + "/jobs?per_page=100")
    matches = [job for job in jobs["jobs"] if job["id"] == JOB_ID]
    require(len(matches) == 1 and matches[0]["conclusion"] == "success",
            "The expected tree-small proof job did not pass")
    listing = api("/actions/runs/" + str(RUN_ID) + "/artifacts?per_page=100")
    matches = [artifact for artifact in listing["artifacts"] if artifact["id"] == ARTIFACT_ID]
    require(len(matches) == 1, "Exact original tree-small artifact unavailable")
    artifact = matches[0]
    require(not artifact["expired"] and artifact["name"] == ARTIFACT_NAME
            and artifact["workflow_run"]["id"] == RUN_ID
            and artifact["workflow_run"]["head_sha"] == HEAD, "Tree-small artifact ownership differs")
    payload = request(artifact["archive_download_url"])
    subprocess.run(["git", "fetch", "--no-tags", "--depth=1", "origin", HEAD],
                   cwd=ROOT, check=True)
    files, frozen_sources = validate_archive(artifact, payload)
    publish(files, frozen_sources)


if __name__ == "__main__":
    main()
