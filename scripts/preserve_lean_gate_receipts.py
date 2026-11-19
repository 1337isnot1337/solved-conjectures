#!/usr/bin/env python3
"""Preserve fixed passing Lean fixture evidence and print one fixed source failure.

All run, artifact, ZIP and primary receipt hashes are immutable constants.
This operation copies original evidence bytes. It makes no new proof claim.
"""
from __future__ import annotations

import io
import json
import os
from pathlib import Path, PurePosixPath
import stat
import subprocess
import tempfile
import zipfile

from preserve_frankl_arithmetic_receipts import api, request, require, sha, encoded, REPO, git_bytes

ROOT = Path(__file__).resolve().parents[1]
RECORDS = [
    {"run": 44517460330, "head": "505bc263f929f5924286b2dd0e95b6ef86efb020",
     "workflow": "Lean bounded scheduler candidate", "artifact": 14527510218,
     "name": "lean-bounded-scheduler-candidate", "zip_bytes": 138294,
     "zip_sha256": "43893eaf40941202e4cab0c3a6e98dc1665498010fcff261df0177520c4da963",
     "receipt_sha256": "86ca10f8261ec8b4d371413b550c63e343b95f2de2af4cf3af78832a7529794d",
     "status": "passed", "conclusion": "success", "slug": "scheduler", "members": 96},
    {"run": 44520135112, "head": "743e0b324bbab2ce57970d8ab034d1a81aab40e0",
     "workflow": "Lean all-owned audit candidate", "artifact": 14527996952,
     "name": "lean-all-owned-candidate", "zip_bytes": 23274,
     "zip_sha256": "d48a8c0b0e3eaf361d8f374dfb01b846c2a6bf2c86e8e5b7d04db08467906ea5",
     "receipt_sha256": "a87c49005c52f3c8b4c0b46d31fce79b5f7b01c290757886d84c684744f47085",
     "status": "passed", "conclusion": "success", "slug": "all-owned", "members": 22},
    {"run": 44522390907, "head": "cbe45a20048aea2b0905f9f7681c9c4389106936",
     "workflow": "Lean scoped owned-extension audit candidate", "artifact": 14529105863,
     "name": "lean-owned-extension-candidate", "zip_bytes": 70275,
     "zip_sha256": "f074d0ca73dd9c00171adfdabf92e642e64f8863ff09ee4a4070406916bc5b49",
     "receipt_sha256": "8dedb933633e7912b2b3d1a062fb8b62859c72be7a8398750f030105c4696111",
     "status": "passed", "conclusion": "success", "slug": "owned-extension", "members": 44,
     "has_fixture_objects": True},
    {"run": 44523712230, "head": "7e516bfbdd0bb1a39c88d3df249f898a94819157",
     "workflow": "Lean all-owned audit candidate", "artifact": 14529761196,
     "name": "lean-all-owned-candidate", "zip_bytes": 33244,
     "zip_sha256": "8128d133d3c725edd3971eccdde8899837775f25c63af1e5aa3b83e754406b29",
     "receipt_sha256": "bf11e624033ce776161279db90af33863c2f685c1d4e0f7e88b255342ee057bf",
     "status": "passed", "conclusion": "success", "slug": "legacy-mathlib", "members": 23},
    {"run": 44521485169, "head": "b97465edd8ae631cd117f65a31db54f7ce73ef77",
     "workflow": "Lean full accepted all-owned candidate", "artifact": 14528550212,
     "name": "lean-full-accepted-all-owned-candidate", "zip_bytes": 6313165,
     "zip_sha256": "e06d298af79836c0f45894891be44c440896e3ba4f576b9107b82ecceda6a631",
     "receipt_sha256": "2d748ec26bba59bfdc9755375deae51780ebb5f8732b1fe6eaaa1076fce48cf5",
     "status": "failed", "conclusion": "failure", "slug": "accepted-source-failure", "members": 906},
]


def archive_files(payload):
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    require(len(infos) == len({info.filename for info in infos}), "Duplicate archive member")
    require(sum(info.file_size for info in infos) <= 256 * 1024 * 1024,
            "Uncompressed archive exceeds fixed evidence bound")
    result = {}
    for info in infos:
        path = PurePosixPath(info.filename)
        require(not path.is_absolute() and ".." not in path.parts
                and "\\" not in info.filename and "\x00" not in info.filename
                and str(path) == info.filename.rstrip("/"), "Unsafe archive member")
        require(not stat.S_ISLNK(info.external_attr >> 16), "Archive symlink")
        require(not info.flag_bits & 1, "Encrypted archive member")
        require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unexpected archive compression")
        if info.is_dir():
            continue
        require(info.file_size <= 32 * 1024 * 1024, "Oversized evidence member")
        result[info.filename] = archive.read(info)
    return result


def preserve(record):
    run = api("/actions/runs/" + str(record["run"]))
    require(run["id"] == record["run"] and run["head_sha"] == record["head"]
            and run["name"] == record["workflow"], "Frozen source run differs")
    require(run["status"] == "completed" and run["conclusion"] == record["conclusion"],
            "Frozen source run status differs")
    require(run["head_branch"] == "main" and run["head_repository"]["full_name"] == REPO,
            "Source run has another repository or branch")
    artifact = api("/actions/artifacts/" + str(record["artifact"]))
    require(artifact["id"] == record["artifact"] and artifact["name"] == record["name"]
            and not artifact["expired"], "Frozen artifact differs or expired")
    require(artifact["workflow_run"]["id"] == record["run"]
            and artifact["workflow_run"]["head_sha"] == record["head"],
            "Artifact belongs to another source run")
    require(artifact["size_in_bytes"] == record["zip_bytes"]
            and artifact["digest"] == "sha256:" + record["zip_sha256"],
            "Artifact size or digest differs")
    payload = request(artifact["archive_download_url"], limit=8 * 1024 * 1024)
    require(len(payload) == record["zip_bytes"] and sha(payload) == record["zip_sha256"],
            "Downloaded original ZIP bytes differ")
    members = archive_files(payload)
    require(len(members) == record["members"], "Original artifact member inventory differs")
    candidates = [(path, raw) for path, raw in members.items()
                  if path.endswith(".json") and sha(raw) == record["receipt_sha256"]]
    require(len(candidates) == 1, "Primary original receipt digest is absent or ambiguous")
    receipt_path, raw_receipt = candidates[0]
    receipt = json.loads(raw_receipt)
    require(receipt["status"] == record["status"] and receipt["git_head"] == record["head"],
            "Primary original receipt status or source differs")
    directory = "docs/verification/lean-gate-fixtures-" + str(record["run"]) + "/"
    files = {directory + "receipt.json": raw_receipt}
    selected = {}
    object_members = {path for path in members
                      if path.endswith((".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"))}
    object_hashes = {}
    if record["status"] == "passed":
        if record.get("has_fixture_objects"):
            source = receipt["source"]["source"]
            kernel = receipt["kernel"]["kernel"]
            modules = receipt["imported_modules"]
            require(len(modules) == len(set(modules)) == 3
                    and set(source["artifact_sha256"]) == set(modules)
                    and source["artifact_sha256"] == kernel["artifact_sha256"],
                    "Scoped fixture source/object inventories differ")
            require(len(kernel["exact_replay_set"]) == len(modules)
                    and set(kernel["exact_replay_set"]) == set(modules),
                    "Scoped fixture original replay set differs")
            prefix = str(PurePosixPath(receipt_path).parent)
            prefix = "" if prefix == "." else prefix + "/"
            for module in modules:
                stem = module.replace(".", "/")
                require(sha(members[prefix + "repo/lean/" + stem + ".lean"])
                        == source["input_sha256"]["lean/" + stem + ".lean"],
                        "Original fixture source hash differs")
                facets = kernel["artifact_sha256"][module]
                require(set(facets) == {".olean", ".olean.server", ".olean.private"},
                        "Original scoped fixture lacks an exact modern facet triple")
                for suffix, expected in facets.items():
                    path = prefix + "replay-1/lib/lean/" + stem + suffix
                    require(sha(members[path]) == expected, "Original fixture facet hash differs")
                    object_hashes[path] = expected
            require(set(object_hashes) == object_members, "Original fixture object set differs")
        else:
            require(not object_members, "Receipt-only artifact unexpectedly contains proof objects")
        for path, raw in members.items():
            if path in object_members:
                continue
            raw.decode("utf-8")
            files[directory + "archive/" + path] = raw
            selected[path] = sha(raw)
    else:
        logs = [(path, raw) for path, raw in members.items()
                if path.endswith("/source/Conjectures.Denominator.log")
                or path == "source/Conjectures.Denominator.log"]
        require(len(logs) == 1, "Expected one exact failed Denominator source log")
        path, raw = logs[0]
        require(len(raw) <= 1024 * 1024, "Diagnostic source log exceeds bound")
        print("FIXED-FAILED-SOURCE-LOG " + path, flush=True)
        print(raw.decode("utf-8"), flush=True)
        files[directory + "Denominator-source.log"] = raw
        selected[path] = sha(raw)
    metadata = {
        "schema": "lean-original-fixture-evidence-v1", "profile": record,
        "source_run_attempt": run["run_attempt"], "primary_receipt_member": receipt_path,
        "receipt": directory + "receipt.json", "receipt_bytes_unchanged": True,
        "original_archive_member_sha256": {path: sha(raw) for path, raw in members.items()},
        "preserved_archive_member_sha256": selected,
        "new_source_compilation": False, "new_axiom_audit": False, "new_kernel_replay": False,
        "archived_proof_objects": False, "accepted_gate_changed": False,
        "scope": "Preserve original fixed-run evidence without upgrading its status or audit scope.",
    }
    if record.get("has_fixture_objects"):
        metadata.update(original_archive_object_sha256=object_hashes,
                        original_archive_facets_rehashed=len(object_hashes),
                        proof_object_bytes_preserved_in_git=False)
    files[directory + "metadata.json"] = encoded(metadata)
    print(json.dumps({"run": record["run"], "original_status": record["status"],
                      "receipt_sha256": sha(raw_receipt), "preserved_files": len(files)}), flush=True)
    return files


def publish(files):
    for attempt in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, raw in files.items():
            require(path.startswith("docs/verification/lean-gate-fixtures-"), "Unexpected output path")
            current = git_bytes(latest, path)
            require(current is None or current == raw, "Refusing to replace historical evidence: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All fixed original Lean fixture evidence is already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="lean-fixture-evidence-") as temporary:
            env = {**os.environ, "GIT_INDEX_FILE": str(Path(temporary) / "index"),
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
            commit = subprocess.check_output(["git", "commit-tree", tree, "-p", latest],
                cwd=ROOT, env=env, text=True, input=(
                    "Preserve original bounded Lean fixture evidence\n\n"
                    "Bind original run, artifact, ZIP and receipt digests; copy receipt and log bytes "
                    "unchanged. Record one failed source diagnostic separately. No new proof "
                    "verification or accepted-registry change is claimed.\n")).strip()
            pushed = subprocess.run(["git", "push", "origin", commit + ":refs/heads/main"], cwd=ROOT)
            if pushed.returncode == 0:
                print(json.dumps({"evidence_commit": commit, "parent": latest, "files": len(files)}),
                      flush=True)
                return
        fresh = api("/git/ref/heads/main")["object"]["sha"]
        require(fresh != latest, "Evidence push failed without a concurrent main update")
        print(json.dumps({"retry": attempt + 1, "new_head": fresh}), flush=True)
    raise RuntimeError("Main moved during every bounded evidence publication attempt")


def main():
    files = {}
    for record in RECORDS:
        added = preserve(record)
        require(not set(files) & set(added), "Duplicate preservation destination")
        files.update(added)
    publish(files)


if __name__ == "__main__":
    main()
