#!/usr/bin/env python3
"""Recover the eight original bounded-map receipts without rebuilding proofs.

Historical source compilation disabled linters. Its audit checked owned
theorems and project axioms. The fresh bridge gate has a separate policy.
"""
from __future__ import annotations

import argparse
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import stat
import subprocess
import tempfile
import zipfile

import preserve_frankl_transport_receipts as network

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/five-speed-bounded-coverage-candidate.json"
OLD_CONTROLS = (
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    "scripts/verify_five_speed_candidates.py", "scripts/verify_lean_candidate.py",
    "scripts/five_speed_candidate_tasks.json", ".github/workflows/five-speed-candidates.yml",
)
OLD_CHECKS = [
    "warning-as-error source compilation",
    "owned transitive axiom whitelist",
    "unmodified stock kernel replay for every local module",
]
OLD_SUFFIXES = (".olean", ".olean.private", ".olean.server", ".ilean")
OLD_FLAGS = ["-j1", "-M4500", "-DwarningAsError=true", "-Dlinter.all=false"]
OLD_AUDIT = "Owned theorem transitive axioms and project axioms; not an all-declaration/raw-private inventory."


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def relative_path(value):
    require(isinstance(value, str) and value != "", "Empty artifact path")
    path = PurePosixPath(value)
    require(not path.is_absolute() and ".." not in path.parts and "\\" not in value
            and path.as_posix() == value.rstrip("/") and str(path) != ".",
            "Unsafe artifact path: " + value)
    return path


def source_path(module):
    return "lean/" + module.replace(".", "/") + ".lean"


def validate_receipt(receipt, group, historical):
    require(historical["source_flags"] == OLD_FLAGS and historical["audit_scope"] == OLD_AUDIT,
            "Historical checking policy was upgraded or changed")
    modules = group["modules"]
    require(receipt["task"] == group["task"]
            and receipt["commit"] == historical["commit"]
            and receipt["status"] == "checked candidate; not registered in accepted roots"
            and receipt["targets"] == group["targets"]
            and receipt["checked_project_modules"] == modules
            and receipt["checks"] == OLD_CHECKS,
            "Historical receipt scope or identity differs")
    require(len(modules) == len(set(modules)), "Duplicate historical project module")
    paths = {source_path(module) for module in modules} | set(OLD_CONTROLS)
    require(receipt["source_sha256"] ==
            {path: historical["source_sha256"][path] for path in paths},
            "Historical source/configuration hashes differ")
    objects = receipt["artifact_sha256"]
    required = {"lib/lean/" + module.replace(".", "/") + ".olean" for module in modules}
    allowed = {"lib/lean/" + module.replace(".", "/") + suffix
               for module in modules for suffix in OLD_SUFFIXES}
    require(required <= set(objects) <= allowed, "Historical object inventory differs")
    for module in modules:
        stem = "lib/lean/" + module.replace(".", "/")
        pair = {stem + ".olean.private", stem + ".olean.server"} & set(objects)
        require(not pair or len(pair) == 2, "Incomplete historical private/server facet pair")


def validate_archive(artifact, payload, group, historical):
    require(artifact["id"] == group["artifact_id"]
            and artifact["name"] == group["artifact_name"]
            and artifact["workflow_run"]["id"] == historical["run_id"]
            and artifact["workflow_run"]["head_sha"] == historical["commit"]
            and artifact["expired"] is False
            and artifact["digest"] == "sha256:" + group["archive_sha256"]
            and digest(payload) == group["archive_sha256"]
            and len(payload) == group["archive_bytes"],
            "Historical archive binding or digest differs")
    require(len(payload) <= 16 * 1024 * 1024, "Historical archive exceeds compressed bound")
    with zipfile.ZipFile(io.BytesIO(payload)) as archive:
        infos = archive.infolist()
        names = [item.filename for item in infos]
        require(len(infos) <= 5000 and len(names) == len(set(names)),
                "Duplicate or excessive historical ZIP entries")
        require(sum(item.file_size for item in infos) <= 256 * 1024 * 1024,
                "Historical archive exceeds expanded bound")
        for item in infos:
            relative_path(item.filename)
            require(not stat.S_ISLNK(item.external_attr >> 16) and not item.flag_bits & 1
                    and item.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                    "Unsupported historical ZIP entry")
        suffix = "receipts/" + group["task"] + ".json"
        candidates = [name for name in names if name.endswith(suffix)]
        require(len(candidates) == 1, "Missing or duplicated original receipt")
        receipt_path = candidates[0]
        prefix = receipt_path.removesuffix(suffix)
        raw = archive.read(receipt_path)
        receipt = json.loads(raw)
        validate_receipt(receipt, group, historical)
        expected_files = {receipt_path} | {prefix + path for path in receipt["artifact_sha256"]}
        require({item.filename for item in infos if not item.is_dir()} == expected_files,
                "Unexpected or omitted original archive file")
        for path, expected in receipt["artifact_sha256"].items():
            relative_path(path)
            require(digest(archive.read(prefix + path)) == expected,
                    "Original proof-object hash differs: " + path)
        return {
            "raw": raw,
            "metadata": {
                "task": group["task"], "run_id": historical["run_id"],
                "job_id": group["job_id"], "commit": historical["commit"],
                "artifact_id": group["artifact_id"], "artifact_name": group["artifact_name"],
                "archive_sha256": group["archive_sha256"], "archive_bytes": len(payload),
                "archive_expanded_bytes": sum(item.file_size for item in infos),
                "receipt_sha256": digest(raw), "receipt_bytes": len(raw),
                "source_entries_validated": len(receipt["source_sha256"]),
                "object_facets_rehashed": len(receipt["artifact_sha256"]),
                "project_modules": modules_copy(group["modules"]),
                "source_flags": historical["source_flags"],
                "audit_scope": historical["audit_scope"],
                "historical_binary_hash_recorded": False,
                "new_source_compilation": False, "new_axiom_audit": False,
                "new_kernel_replay": False,
            },
        }


def modules_copy(modules):
    return list(modules)


def validate_historical_git(historical):
    commit = historical["commit"]
    for path, expected in historical["source_sha256"].items():
        raw = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
        require(digest(raw) == expected, "Pinned historical Git source differs: " + path)
    task_bytes = subprocess.check_output(
        ["git", "show", commit + ":scripts/five_speed_candidate_tasks.json"], cwd=ROOT)
    tasks = json.loads(task_bytes)
    for group in historical["groups"]:
        require(tasks[group["task"]] == [group["targets"], group["required_theorems"]],
                "Historical task obligations differ")
    union = {module for group in historical["groups"] for module in group["modules"]}
    require(len(union) == 211, "Historical bounded-map dependency union differs")
    targets = [module for group in historical["groups"] for module in group["targets"]]
    require(len(targets) == len(set(targets)) == 164,
            "Historical groups do not partition all 164 maps")


def recover(model, output):
    require(not output.exists() or not any(output.iterdir()), "Use a fresh history directory")
    historical = model["historical"]
    validate_historical_git(historical)
    run = network.api("/actions/runs/" + str(historical["run_id"]))
    require(run["head_sha"] == historical["commit"]
            and run["name"] == "Five-speed certificate candidates"
            and run["status"] == "completed" and run["conclusion"] == "success",
            "Original bounded workflow has not passed at the pinned commit")
    output.mkdir(parents=True, exist_ok=True)
    records = []
    for group in historical["groups"]:
        job = network.api("/actions/jobs/" + str(group["job_id"]))
        require(job["run_id"] == historical["run_id"]
                and job["head_sha"] == historical["commit"]
                and job["name"] == "Five-speed " + group["task"]
                and job["status"] == "completed" and job["conclusion"] == "success",
                "Original group job differs or has not passed")
        artifact = network.api("/actions/artifacts/" + str(group["artifact_id"]))
        url = network.API + "/actions/artifacts/" + str(group["artifact_id"]) + "/zip"
        require(artifact["archive_download_url"] == url, "Unexpected artifact download URL")
        payload = network.request(url, limit=16 * 1024 * 1024)
        checked = validate_archive(artifact, payload, group, historical)
        filename = group["task"] + ".json"
        (output / filename).write_bytes(checked["raw"])
        records.append({**checked["metadata"], "receipt": filename})
        print(json.dumps({"recovered": group["task"],
                          "receipt_sha256": checked["metadata"]["receipt_sha256"]}), flush=True)
    index = {
        "schema": "five-speed-bounded-history-v1", "status": "validated",
        "run_id": historical["run_id"], "commit": historical["commit"],
        "source_flags": historical["source_flags"], "audit_scope": historical["audit_scope"],
        "scope": "Original receipt bytes and archived object hashes; no new mathematical verification.",
        "groups": records,
    }
    (output / "index.json").write_bytes(encoded(index))
    history_inventory(output, model)
    print(json.dumps({"recovered_groups": len(records),
                      "index_sha256": digest((output / "index.json").read_bytes())}), flush=True)


def history_inventory(output, model):
    raw = (output / "index.json").read_bytes()
    index = json.loads(raw)
    historical = model["historical"]
    require(index["schema"] == "five-speed-bounded-history-v1"
            and index["status"] == "validated" and index["run_id"] == historical["run_id"]
            and index["commit"] == historical["commit"]
            and index["source_flags"] == historical["source_flags"]
            and index["audit_scope"] == historical["audit_scope"],
            "Historical index identity differs")
    profiles = {group["task"]: group for group in historical["groups"]}
    records = index["groups"]
    require(len(records) == len(profiles) == 8
            and {record["task"] for record in records} == set(profiles),
            "Historical group inventory differs")
    hashes = {"index.json": digest(raw)}
    for record in records:
        group = profiles[record["task"]]
        require(record["artifact_id"] == group["artifact_id"]
                and record["archive_sha256"] == group["archive_sha256"]
                and record["commit"] == historical["commit"]
                and record["source_flags"] == historical["source_flags"]
                and record["audit_scope"] == historical["audit_scope"]
                and record["receipt"] == group["task"] + ".json",
                "Historical index group binding differs")
        data = (output / record["receipt"]).read_bytes()
        require(digest(data) == record["receipt_sha256"], "Original receipt bytes changed")
        validate_receipt(json.loads(data), group, historical)
        hashes[record["receipt"]] = digest(data)
    require({path.name for path in output.iterdir() if path.is_file()} == set(hashes),
            "Unexpected historical evidence file")
    return hashes


def publish_files(files, guard_hashes, message):
    require(files and all(path.startswith("docs/verification/") for path in files),
            "Evidence publication cannot modify proof sources or registries")
    for path in files:
        relative_path(path)
    for attempt in range(4):
        subprocess.run(["git", "fetch", "--no-tags", "origin", "main"], cwd=ROOT, check=True)
        base = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, expected in guard_hashes.items():
            raw = subprocess.check_output(["git", "show", base + ":" + path], cwd=ROOT)
            require(digest(raw) == expected, "Current proof or controller changed: " + path)
        with tempfile.TemporaryDirectory(prefix="bounded-evidence-index-") as directory:
            environment = {**os.environ, "GIT_INDEX_FILE": str(Path(directory) / "index")}
            subprocess.run(["git", "read-tree", base], cwd=ROOT, env=environment, check=True)
            for path, raw in sorted(files.items()):
                existing = subprocess.run(["git", "show", base + ":" + path], cwd=ROOT,
                                          capture_output=True, check=False)
                require(existing.returncode != 0 or existing.stdout == raw,
                        "Refusing to overwrite an immutable evidence file: " + path)
                blob = subprocess.check_output(["git", "hash-object", "-w", "--stdin"],
                                               cwd=ROOT, input=raw).decode().strip()
                subprocess.run(["git", "update-index", "--add", "--cacheinfo",
                                "100644", blob, path], cwd=ROOT, env=environment, check=True)
            tree = subprocess.check_output(["git", "write-tree"], cwd=ROOT,
                                           env=environment, text=True).strip()
            old_tree = subprocess.check_output(["git", "rev-parse", base + "^{tree}"],
                                               cwd=ROOT, text=True).strip()
            if tree == old_tree:
                return base
            commit = subprocess.check_output([
                "git", "-c", "user.name=github-actions[bot]",
                "-c", "user.email=41898282+github-actions[bot]@users.noreply.github.com",
                "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null",
                "commit-tree", tree, "-p", base], cwd=ROOT, input=(message + "\n").encode()).decode().strip()
        pushed = subprocess.run(["git", "push", "origin", commit + ":refs/heads/main"],
                                cwd=ROOT, text=True, capture_output=True, check=False)
        if pushed.returncode == 0:
            return commit
        print(json.dumps({"publication_retry": attempt + 1,
                          "reason": pushed.stderr[-1000:]}), flush=True)
    raise RuntimeError("Main kept moving or rejected the bounded evidence publication")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    recover(model, args.output_dir.resolve())


if __name__ == "__main__":
    main()
