#!/usr/bin/env python3
"""Preserve one authenticated failed C4096 experiment; assert no proof success."""
from __future__ import annotations
import hashlib
import json
import os
from pathlib import Path
import subprocess
import tempfile
import preserve_five_speed_root199 as fixed

ROOT = Path(__file__).resolve().parents[1]
HELPER_SHA256 = "56a2481552dd5d45de6224d83a7fd7b8a949f02a58be4d032ce7a8c6af393536"
RECORD = {
    "run": 44535201546, "job": 135598646185,
    "head": "f581e515221aec50c91ef3741e8e380a7ae6ac43",
    "workflow": "Lean p199 contiguous C4096 root cover",
    "artifact": 14536750675, "name": "five-speed-root-cblock4096",
    "zip_bytes": 3723969,
    "zip_sha256": "ba2766ae88b152617a478935b4f1d73c1aeee193e6a5000ae54670f3f804f84a",
}
FAILED = "Conjectures.LonelinessFiveSpeedRootCBlockP0199B4096Part00"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def publish(files):
    for _ in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, raw in files.items():
            old = fixed.git_bytes(latest, path)
            require(old is None or old == raw, "Different preserved evidence already exists: " + path)
        if all(fixed.git_bytes(latest, path) == raw for path, raw in files.items()):
            return
        with tempfile.TemporaryDirectory(prefix="cblock4096-failure-index-") as temporary:
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
                cwd=ROOT, env=env, text=True,
                input="Preserve the original failed C4096 memory experiment\n\nAuthenticated failure receipt and process evidence. No complete proof, axiom-audit or stock-replay success is claimed.\n").strip()
            if subprocess.run(["git", "push", "origin", commit + ":refs/heads/main"], cwd=ROOT).returncode == 0:
                print(json.dumps({"preservation_commit": commit, "files": len(files)}), flush=True)
                return
        require(fixed.api("/git/ref/heads/main")["object"]["sha"] != latest,
                "Publication failed without a concurrent main update")
    raise RuntimeError("Concurrent updates prevented all bounded publication attempts")


def main():
    require(sha(Path(fixed.__file__).read_bytes()) == HELPER_SHA256, "Frozen transport helper differs")
    fixed.self_test()
    run = fixed.api("/actions/runs/" + str(RECORD["run"]))
    require(run["id"] == RECORD["run"] and run["head_sha"] == RECORD["head"]
            and run["name"] == RECORD["workflow"] and run["run_attempt"] == 1
            and run["head_branch"] == "main" and run["head_repository"]["full_name"] == fixed.REPO
            and run["status"] == "completed" and run["conclusion"] == "failure",
            "Original failed run identity differs")
    jobs = fixed.api("/actions/runs/" + str(RECORD["run"]) + "/jobs?per_page=100")
    require(jobs["total_count"] == len(jobs["jobs"]) == 1
            and jobs["jobs"][0]["id"] == RECORD["job"]
            and jobs["jobs"][0]["conclusion"] == "failure", "Original failed job differs")
    artifact = fixed.api("/actions/artifacts/" + str(RECORD["artifact"]))
    require(artifact["id"] == RECORD["artifact"] and artifact["name"] == RECORD["name"]
            and artifact["expired"] is False and artifact["workflow_run"]["id"] == RECORD["run"]
            and artifact["workflow_run"]["head_sha"] == RECORD["head"]
            and artifact["size_in_bytes"] == RECORD["zip_bytes"]
            and artifact["digest"] == "sha256:" + RECORD["zip_sha256"]
            and artifact["archive_download_url"] ==
                fixed.API + "/actions/artifacts/" + str(RECORD["artifact"]) + "/zip",
            "Failure archive binding differs")
    payload = fixed.request(artifact["archive_download_url"], fixed.MAX_ZIP)
    require(len(payload) == RECORD["zip_bytes"] and sha(payload) == RECORD["zip_sha256"],
            "Actual original failure ZIP differs")
    archive, names = fixed.safe_archive(payload)
    files = {n: archive.read(n) for n in names if not n.endswith("/")}
    require(len(files) == 195 and "checked/receipt.json" in files, "Partial archive layout differs")
    raw = files["checked/receipt.json"]
    receipt = json.loads(raw)
    require(receipt["schema"] == "five-speed-root-cblock4096-receipt-v1"
            and receipt["status"] == "failed" and receipt["git_commit"] == RECORD["head"]
            and receipt["c_work_budget"] == 4096 and receipt["prime"] == 199
            and receipt["accepted_registry_changed"] is False
            and receipt["source_policy"] == {
                "warning_as_error": True, "linter_override": False, "fresh_project_objects": True},
            "Original failure or strict policy differs")
    require(receipt["kernel_checks"] == {} and "kernel_replay" not in receipt
            and "axiom_audit" not in receipt and "all_frozen_hashes_unchanged" not in receipt
            and "global_root_cover_199_checked" not in receipt,
            "Failed receipt unexpectedly claims a completed gate")
    require(receipt["toolchain"]["lean_sha256"] == fixed.LEAN_SHA256
            and receipt["toolchain"]["checker_sha256"] == fixed.CHECKER_SHA256,
            "Original compiler/checker differs")
    modules = receipt["project_modules"]
    require(len(modules) == len(set(modules)) == 46
            and len(receipt["required_theorems"]) == 53, "Original candidate inventory differs")
    attempted = modules[:modules.index(FAILED) + 1]
    require(len(attempted) == 34 and set(receipt["source_checks"]) == set(attempted),
            "Partial source-check inventory differs")
    preserved = {"receipt.json": raw}
    for module in attempted:
        source = files["checked/src/" + module.replace(".", "/") + ".lean"]
        require(sha(source) == receipt["source_sha256"][module], "Attempted source digest differs")
        check = receipt["source_checks"][module]
        ending = "/logs/" + module + ".source.log"
        require(check["log"].endswith(ending), "Unexpected recorded process path")
        fixed.source_command(check, receipt["toolchain"]["lean_path"], module,
                             check["log"][:-len(ending)])
        require(check["timed_out"] is False and check["exit_code"] == (1 if module == FAILED else 0),
                "Original source outcome differs")
        logname, progressname = "logs/" + module + ".source.log", "progress/" + module + ".source.json"
        log, progress_raw = files["checked/" + logname], files["checked/" + progressname]
        progress = json.loads(progress_raw)
        require(sha(log) == check["log_sha256"] and set(progress) == fixed.PROFILE_FIELDS
                and all(progress[k] == check[k] for k in fixed.PROFILE_FIELDS),
                "Original process evidence differs")
        preserved[logname], preserved[progressname] = log, progress_raw
        if module == FAILED:
            require(b":63:2: error:" in log and b"(kernel) excessive memory consumption detected" in log,
                    "Original kernel-memory diagnostic differs")
    failed = receipt["source_checks"][FAILED]
    require(failed["seconds"] == 72.947 and failed["peak_rss_kib"] == 4610008,
            "Original failed-process measurements differ")
    for path, digest in receipt["gate_sha256"].items():
        control = files["checked/controls/" + path]
        require(sha(control) == digest and control == fixed.git_bytes(RECORD["head"], path),
                "Original frozen control differs: " + path)
        preserved["controls/" + path] = control
    inventory = files["generated-source-inventory.json"]
    require(sha(inventory) == receipt["generated_inventory"]["sha256"],
            "Original generated inventory differs")
    preserved["generated-source-inventory.json"] = inventory
    for name, digest in receipt["reproduction"]["file_sha256"].items():
        require(sha(files["generation/" + name]) == digest, "Original rendering byte differs")
        if not name.endswith(".lean"):
            preserved["generation/" + name] = files["generation/" + name]
    preserved["archive-file-inventory.json"] = encoded({
        name: {"sha256": sha(content), "bytes": len(content)} for name, content in sorted(files.items())})
    metadata = {
        "schema": "five-speed-cblock4096-failure-preservation-v1",
        "status": "original_failure_authenticated", "binding": RECORD,
        "receipt_sha256": sha(raw), "receipt_bytes_unchanged": True,
        "attempted_source_modules": attempted, "passed_source_count": 33, "failed_module": FAILED,
        "failed_source_seconds": failed["seconds"], "failed_peak_rss_kib": failed["peak_rss_kib"],
        "complete_candidate_source_pass": False, "axiom_audit_pass": False,
        "stock_kernel_replay_pass": False, "accepted_registry_changed": False,
        "actual_archive_files": len(files), "archive_bytes_authenticated": True,
        "preserver_sha256": sha(Path(__file__).read_bytes()), "helper_sha256": HELPER_SHA256,
        "preserved_file_sha256": {name: sha(content) for name, content in sorted(preserved.items())},
        "scope": "Preserve original failed-candidate evidence only; no proof success or new Lean execution.",
    }
    preserved["preservation.json"] = encoded(metadata)
    directory = "docs/verification/five-speed-cblock4096-failed-" + str(RECORD["run"]) + "/"
    output = {directory + name: content for name, content in preserved.items()}
    for path, content in output.items():
        target = ROOT / ".candidate-artifacts/five-speed-cblock4096-failure" / path
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(content)
    print(json.dumps({"receipt_sha256": sha(raw),
                      "preservation_sha256": sha(preserved["preservation.json"]),
                      "preserved_files": len(output), "complete_proof_checked": False}), flush=True)
    publish(output)


if __name__ == "__main__":
    main()
