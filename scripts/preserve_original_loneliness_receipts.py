#!/usr/bin/env python3
"""Preserve two original loneliness receipts without claiming a fresh proof."""
from __future__ import annotations
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
HELPER = "scripts/preserve_frankl_transport_receipts.py"
HELPER_SHA256 = "2509cf8ff29420abeedb5df247f31529938387eb272a788349fb36056cb05ef7"
OWN_INPUTS = (
    "scripts/preserve_original_loneliness_receipts.py",
    ".github/workflows/preserve-original-loneliness-receipts.yml",
    HELPER,
)
PROFILES = (
    {
        "name": "loneliness-large-norm",
        "run_id": 44468683880, "job_id": 135372656702,
        "commit": "3f6ee74c8bc1f2aba43ccd1cb44f2e9941016fe8",
        "artifact_id": 14505111016, "artifact_name": "checked-extension-large-norm",
        "archive_sha256": "32a01447d08c54d6a47d145bb63624cb9c53cc38b4818ae66ebe53f09cdd29a7",
        "task": "geometry-large-norm", "module_count": 81, "required_count": 2,
        "root": "Conjectures.LonelinessTightNormBounds",
        "source_policy": "Historical lake builds allowed warnings; the old theorem-only axiom audit disabled linters. Current strict all-owned verification is separate.",
    },
    {
        "name": "hyperplane-main",
        "run_id": 44525844153, "job_id": 135566283170,
        "commit": "8693ec993867899aba0980caa1ad3e8cca7f1782",
        "artifact_id": 14531877063, "artifact_name": "loneliness-hyperplane-main-receipt",
        "archive_sha256": "4873ed645d8a687f3480071938b6ceca0e557746dd31e6644e1dbd94425a6e02",
        "task": "main", "module_count": 72, "required_count": 97,
        "root": "Conjectures.LonelinessHyperplaneMain",
        "source_policy": "Historical strict direct-Lean sources with warnings as errors, theorem-only axiom audit and complete stock replay. The original artifact is receipt-only. Current all-owned/raw-private verification is separate.",
    },
)


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def git_bytes(commit, path):
    value = subprocess.run(["git", "show", commit + ":" + path], cwd=ROOT,
                           stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return value.stdout if value.returncode == 0 else None


require(sha((ROOT / HELPER).read_bytes()) == HELPER_SHA256,
        "Frozen artifact-request helper differs")
import preserve_frankl_transport_receipts as network
api = network.api


def recover(profile, controls):
    aid = profile["artifact_id"]
    metadata = api("/actions/artifacts/" + str(aid))
    job = api("/actions/jobs/" + str(profile["job_id"]))
    require(job["id"] == profile["job_id"] and job["run_id"] == profile["run_id"]
            and job["head_sha"] == profile["commit"]
            and job["status"] == "completed" and job["conclusion"] == "success",
            "Original proof job is not the specified passed job")
    require(metadata["id"] == aid and metadata["name"] == profile["artifact_name"]
            and metadata["workflow_run"]["id"] == profile["run_id"]
            and metadata["workflow_run"]["head_sha"] == profile["commit"]
            and metadata["digest"] == "sha256:" + profile["archive_sha256"]
            and metadata["expired"] is False, "Original artifact identity differs")
    payload = network.request(network.API + "/actions/artifacts/" + str(aid) + "/zip",
                              limit=64 * 1024 * 1024)
    require(sha(payload) == profile["archive_sha256"], "Original archive digest differs")
    with zipfile.ZipFile(io.BytesIO(payload)) as archive:
        names = archive.namelist()
        require(len(names) == len(set(names)), "Duplicate archive path")
        for name in names:
            path = PurePosixPath(name)
            require(not path.is_absolute() and ".." not in path.parts,
                    "Unsafe original archive member")
        candidates = [name for name in names if name == "receipt.json"
                      or name.endswith("/receipt.json")]
        require(len(candidates) == 1, "Original receipt is not unique")
        require(archive.getinfo(candidates[0]).file_size < 4 * 1024 * 1024,
                "Original receipt exceeds bounded recovery")
        raw = archive.read(candidates[0])
    receipt = json.loads(raw)
    require(receipt["status"] == "passed" and receipt["commit"] == profile["commit"]
            and receipt["task"] == profile["task"], "Original receipt identity differs")
    modules = receipt["project_modules"]
    required = receipt["required_theorems"]
    require(len(modules) == len(set(modules)) == profile["module_count"]
            and profile["root"] in modules, "Original proof closure differs")
    require(len(required) == len(set(required)) == profile["required_count"],
            "Original required theorem inventory differs")
    require(all(path not in receipt["gate_sha256"] or
                receipt["gate_sha256"][path] == digest
                for path, digest in receipt["source_sha256"].items()),
            "Historical source and gate hash maps disagree")
    paths = {**receipt["source_sha256"], **receipt["gate_sha256"]}
    for path, digest in paths.items():
        require(not PurePosixPath(path).is_absolute()
                and ".." not in PurePosixPath(path).parts, "Unsafe historical source path")
        original = git_bytes(profile["commit"], path)
        require(original is not None and sha(original) == digest,
                "Historical source or gate bytes differ: " + path)
    expected = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
    expected |= {"lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json"}
    require(expected == set(receipt["source_sha256"]),
            "Original source inventory is not exact")
    log = network.request(network.API + "/actions/jobs/" + str(profile["job_id"]) + "/logs",
                          limit=16 * 1024 * 1024)
    require(b"PASS" in log and b"kernel" in log, "Original completed job log is missing")
    destination = "docs/verification/" + profile["name"] + "-original-" + str(profile["run_id"])
    recovery = {
        "schema": "original-loneliness-receipt-recovery-v1",
        "original": profile,
        "receipt_sha256": sha(raw), "job_log_sha256": sha(log),
        "original_archive_path": candidates[0],
        "original_archive_members": len(names),
        "historical_source_and_gate_paths_checked": len(paths),
        "exporter_control_sha256": controls,
        "original_receipt_bytes_preserved": True,
        "original_job_log_bytes_preserved": True,
        "archive_digest_validated": True,
        "historical_source_and_gate_bytes_validated": True,
        "all_original_object_facets_revalidated": False,
        "new_proof_verification": False,
        "accepted_registry_changed": False,
    }
    files = {destination + "/receipt.json": raw,
             destination + "/job.log": log,
             destination + "/recovery.json": encoded(recovery)}
    print(json.dumps({"name": profile["name"], "receipt_sha256": sha(raw),
                      "job_log_sha256": sha(log), "original_modules": len(modules),
                      "new_proof_verification": False}), flush=True)
    return files


def publish(files, frozen_sources):
    """Preserve immutable evidence using guarded bounded fast-forward retries."""
    if not files:
        print("No successful historical receipts available", flush=True)
        return
    for attempt in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(
            ["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, expected in frozen_sources.items():
            require(sha(git_bytes(latest, path) or b"") == expected,
                    "Concurrent checked-source or exporter-input change: " + path)
        for path, raw in files.items():
            current = git_bytes(latest, path)
            require(current is None or current == raw,
                    "Never overwrite different historical receipt evidence: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All selected historical evidence is already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="loneliness-original-receipt-index-") as directory:
            env = {
                **os.environ, "GIT_INDEX_FILE": str(Path(directory) / "index"),
                "GIT_AUTHOR_NAME": "github-actions[bot]",
                "GIT_COMMITTER_NAME": "github-actions[bot]",
                "GIT_AUTHOR_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
                "GIT_COMMITTER_EMAIL": "41898282+github-actions[bot]@users.noreply.github.com",
            }
            subprocess.run(["git", "read-tree", latest], cwd=ROOT, env=env, check=True)
            for path, raw in sorted(files.items()):
                blob = subprocess.check_output(
                    ["git", "hash-object", "-w", "--stdin"], cwd=ROOT, input=raw).decode().strip()
                subprocess.run(["git", "update-index", "--add", "--cacheinfo",
                                "100644", blob, path], cwd=ROOT, env=env, check=True)
            tree = subprocess.check_output(
                ["git", "write-tree"], cwd=ROOT, env=env, text=True).strip()
            message = (
                "Preserve original norm and hyperplane verification receipts\n\n"
                "Authenticate original artifact digests, passed job identities, "
                "unchanged receipt bytes and historical source/helper hashes. "
                "Preserve the original logs and source policies; do not claim "
                "a fresh proof, all-owned audit or new object verification.\n"
            )
            commit = subprocess.check_output(
                ["git", "commit-tree", tree, "-p", latest], cwd=ROOT, env=env,
                text=True, input=message).strip()
            pushed = subprocess.run(
                ["git", "push", "origin", commit + ":refs/heads/main"], cwd=ROOT)
            if pushed.returncode == 0:
                print(json.dumps({"receipt_commit": commit, "parent": latest,
                                  "files": sorted(files)}), flush=True)
                return
        fresh = api("/git/ref/heads/main")["object"]["sha"]
        require(fresh != latest, "Receipt push failed without a concurrent main update")
        print(json.dumps({"retry": attempt + 1, "new_head": fresh}), flush=True)
    raise RuntimeError("Main moved during every bounded evidence-publication attempt")



def main():
    controls = {path: sha((ROOT / path).read_bytes()) for path in OWN_INPUTS}
    files = {}
    for profile in PROFILES:
        recovered = recover(profile, controls)
        require(not (set(files) & set(recovered)), "Recovery destinations overlap")
        files.update(recovered)
    output = ROOT / ".candidate-artifacts/original-loneliness-receipts"
    for path, raw in files.items():
        destination = output / path
        destination.parent.mkdir(parents=True, exist_ok=True)
        destination.write_bytes(raw)
    require(controls == {path: sha((ROOT / path).read_bytes()) for path in OWN_INPUTS},
            "Recovery controls changed")
    publish(files, controls)


if __name__ == "__main__":
    main()
