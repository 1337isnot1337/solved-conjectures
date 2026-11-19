#!/usr/bin/env python3
"""Preserve successful bounded arithmetic receipts from the two frozen runs.

The exporter verifies archive SHA256, source and object hashes, exact replay
sets, all-declaration audit flags, and each expected bounded group. It records
only passed group receipts. Missing groups remain explicit in each summary.
"""
from __future__ import annotations
import hashlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import subprocess
import tempfile
import urllib.request
import zipfile
import verify_frankl_orbit_batches as short_gate
import verify_frankl_literal_orbit_batches as ten_gate

ROOT = Path(__file__).resolve().parents[1]
REPO = "1337isnot1337/solved-conjectures"
API = "https://api.github.com/repos/" + REPO
RUNS = [
    {"id": 44503050632, "head": "a48f80f5f0e7d5e27d9429c324ad07097d070161",
     "workflow": "Lean Frankl orbit arithmetic batches", "kind": "short"},
    {"id": 44505005993, "head": "050ec13ddc5c454c56ae081e82a2aa4f91fa1722",
     "workflow": "Lean Frankl literal ten-point orbit arithmetic", "kind": "ten"},
]

def require(condition, message):
    if not condition:
        raise RuntimeError(message)

def sha(raw):
    return hashlib.sha256(raw).hexdigest()

class PublicArtifactRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        redirected = super().redirect_request(req, fp, code, msg, headers, newurl)
        if redirected is not None:
            redirected.remove_header("Authorization")
        return redirected

OPENER = urllib.request.build_opener(PublicArtifactRedirect())

def request(url, limit=64 * 1024 * 1024):
    require(url.startswith(API + "/"), "Unexpected initial API origin")
    headers = {"Authorization": "Bearer " + os.environ["GH_TOKEN"],
               "Accept": "application/vnd.github+json",
               "X-GitHub-Api-Version": "2022-11-28",
               "User-Agent": "frankl-bounded-receipt-export"}
    with OPENER.open(urllib.request.Request(url, headers=headers), timeout=60) as response:
        raw = response.read(limit + 1)
    require(len(raw) <= limit, "Response exceeds evidence bound")
    return raw

def api(path):
    return json.loads(request(API + path))

def write(path, raw):
    path = ROOT / path
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(raw)

def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()

def git_bytes(commit, path):
    p = subprocess.run(["git", "show", commit + ":" + path], cwd=ROOT,
                       stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return p.stdout if p.returncode == 0 else None

def validate_receipt(record, artifact, payload, manifest):
    require("sha256:" + sha(payload) == artifact["digest"], "Artifact ZIP hash mismatch")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    require(sum(info.file_size for info in archive.infolist()) <= 512 * 1024 * 1024,
            "Uncompressed evidence exceeds bound")
    names = archive.namelist()
    require(len(names) == len(set(names)), "Duplicate archive member")
    receipts = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(receipts) == 1, "Expected one group receipt")
    receipt_path = receipts[0]
    raw = archive.read(receipt_path)
    receipt = json.loads(raw)
    if receipt.get("status") != "passed":
        return None
    require(receipt["git_commit"] == record["head"], "Receipt source commit mismatch")
    group_name = receipt["group"]["id"]
    pattern = r"g\d\d" if record["kind"] == "short" else r"p10g\d\d"
    require(re.fullmatch(pattern, group_name), "Unexpected arithmetic group name")
    group, modules, required, private = short_gate.group_spec(manifest, group_name)
    require(receipt["group"] == group, "Receipt group differs from frozen manifest")
    require(receipt["project_modules"] == modules, "Receipt import closure differs")
    require(receipt["required_endpoints"] == required, "Required theorem inventory differs")
    require(receipt["required_private_endpoints"] == private, "Private proof inventory differs")
    require(receipt["all_frozen_hashes_unchanged"] is True, "No immutable-evidence assertion")
    require(receipt["toolchain"]["checker_sha256"] == short_gate.CHECKER_SHA256,
            "Wrong stock kernel checker")
    require(receipt["axiom_whitelist"] == ["propext", "Classical.choice", "Quot.sound"],
            "Wrong axiom whitelist")
    checks = receipt["source_checks"]
    require(set(checks) == set(modules), "Incomplete fresh source checks")
    for name, check in checks.items():
        require(check["exit_code"] == 0 and check["timed_out"] is False
                and "-DwarningAsError=true" in check["command"],
                "Source was not strictly checked: " + name)
    audit = receipt["axiom_audit"]
    require(audit["exit_code"] == 0 and audit["all_declarations_audited"]
            and audit["explicit_import_all"]
            and audit["required_endpoint_count"] == len(required)
            and audit["private_arithmetic_chunks_visible"] == len(private),
            "Incomplete declaration or private-node audit")
    replay = receipt["kernel_replay"]
    require(replay["exit_code"] == 0 and replay["exact_project_closure"]
            and replay["timed_out"] is False
            and sorted(replay["replayed_modules"]) == sorted(modules)
            and len(set(replay["replayed_modules"])) == len(modules),
            "Incomplete exact kernel replay")
    prefix = str(PurePosixPath(receipt_path).parent)
    prefix = "" if prefix == "." else prefix + "/"
    require(set(receipt["source_sha256"]) == set(modules)
            and set(receipt["artifact_sha256"]) == set(modules),
            "Source/object inventory mismatch")
    for module in modules:
        source_path = prefix + "src/" + module.replace(".", "/") + ".lean"
        require(sha(archive.read(source_path)) == receipt["source_sha256"][module],
                "Archived source hash mismatch: " + module)
        require(short_gate.digest(short_gate.source(module)) == receipt["source_sha256"][module],
                "Current source differs from checked group: " + module)
        facets = receipt["artifact_sha256"][module]
        require({".olean", ".olean.private", ".olean.server"} <= set(facets),
                "Missing materialized modern object facets")
        for suffix, expected in facets.items():
            require(suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"),
                    "Unexpected object suffix")
            object_path = prefix + "lib/lean/" + module.replace(".", "/") + suffix
            require(sha(archive.read(object_path)) == expected,
                    "Archived proof object hash mismatch: " + module + suffix)
    return group_name, raw, receipt

def publish(files, frozen_sources):
    if not files:
        print("No passed bounded arithmetic receipts", flush=True)
        return
    for attempt in range(4):
        subprocess.run(["git", "fetch", "origin", "main"], cwd=ROOT, check=True)
        latest = subprocess.check_output(["git", "rev-parse", "FETCH_HEAD"], cwd=ROOT, text=True).strip()
        for path, expected in frozen_sources.items():
            require(sha(git_bytes(latest, path) or b"") == expected,
                    "Concurrent checked-source change: " + path)
        for path, raw in files.items():
            current = git_bytes(latest, path)
            if current is not None and current != raw and path.endswith("/summary.json"):
                previous = json.loads(current)
                proposed = json.loads(raw)
                require(all(previous[key] == proposed[key] for key in
                            ("schema", "source_run_id", "source_commit", "expected_groups")),
                        "Changed summary identity: " + path)
                require(set(previous["passed_groups"]) <= set(proposed["passed_groups"]),
                        "Refusing to regress a preserved group summary: " + path)
                for name, value in previous["passed_groups"].items():
                    require(proposed["passed_groups"][name] == value,
                            "Changed historical group evidence: " + path + ":" + name)
            else:
                require(current is None or current == raw,
                        "Never overwrite a different historical arithmetic receipt: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All selected arithmetic receipts already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="frankl-arithmetic-receipt-") as directory:
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
            message = ("Preserve exact bounded Frankl arithmetic receipts\n\n"
                       "Validate original archive digests, all staged source and object hashes, "
                       "every-declaration audits and exact pinned stock kernel replays. "
                       "No accepted registry or complete-conjecture status is changed.\n")
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
    event = json.loads(Path(os.environ["GITHUB_EVENT_PATH"]).read_text())
    if os.environ.get("GITHUB_EVENT_NAME") == "workflow_run":
        if event["workflow_run"]["id"] not in {record["id"] for record in RUNS}:
            print("No configured frozen run completed; nothing to export", flush=True)
            return
    manifests = {"short": short_gate.validate_layout(), "ten": ten_gate.validate_layout()}
    files, frozen_sources = {}, {}
    for record in RUNS:
        run = api("/actions/runs/" + str(record["id"]))
        require(run["head_sha"] == record["head"] and run["name"] == record["workflow"],
                "Frozen run identity mismatch")
        require(run["head_repository"]["full_name"] == REPO and run["head_branch"] == "main",
                "Frozen run came from a different repository or branch")
        listing = api("/actions/runs/" + str(record["id"]) + "/artifacts?per_page=100")
        require(listing["total_count"] == len(listing["artifacts"]), "Artifact pagination required")
        found, skipped = {}, []
        manifest = manifests[record["kind"]]
        for artifact in listing["artifacts"]:
            if artifact["expired"]:
                skipped.append({"artifact": artifact["id"], "reason": "expired"})
                continue
            require(artifact["workflow_run"]["id"] == record["id"]
                    and artifact["workflow_run"]["head_sha"] == record["head"],
                    "Artifact ownership mismatch")
            payload = request(artifact["archive_download_url"])
            checked = validate_receipt(record, artifact, payload, manifest)
            if checked is None:
                skipped.append({"artifact": artifact["id"], "reason": "group receipt did not pass"})
                continue
            name, raw, receipt = checked
            require(name not in found, "More than one successful artifact for a group")
            destination = "docs/verification/frankl-orbit-batches-" + str(record["id"]) + "/" + name + ".json"
            files[destination] = raw
            found[name] = {"receipt": destination, "receipt_sha256": sha(raw),
                           "artifact_id": artifact["id"], "artifact_name": artifact["name"],
                           "archive_sha256": sha(payload), "rows": receipt["group"]["rows"],
                           "private_chunks": receipt["group"]["private_chunks"],
                           "project_modules": len(receipt["project_modules"])}
            frozen_sources.update({"lean/" + module.replace(".", "/") + ".lean": expected
                                   for module, expected in receipt["source_sha256"].items()})
        expected = {group["id"] for group in manifest["groups"]}
        require(set(found) <= expected, "Unspecified passed group")
        summary = {
            "schema": "frankl-bounded-arithmetic-receipts-v1",
            "source_run_id": record["id"], "source_commit": record["head"],
            "workflow_status": run["status"], "workflow_conclusion": run["conclusion"],
            "expected_groups": sorted(expected), "passed_groups": found,
            "missing_groups": sorted(expected - set(found)), "skipped_artifacts": skipped,
            "verified_representative_rows": sum(item["rows"] for item in found.values()),
            "verified_private_arithmetic_chunks": sum(item["private_chunks"] for item in found.values()),
            "complete_arithmetic_partition": set(found) == expected,
            "accepted_registry_changed": False,
            "scope": "Only the listed bounded representative arithmetic groups. Full target transports, original-row coverage and the span-four theorem remain separate obligations.",
        }
        if found:
            destination = "docs/verification/frankl-orbit-batches-" + str(record["id"]) + "/summary.json"
            files[destination] = encoded(summary)
        print(json.dumps({"run": record["id"], "passed": sorted(found),
                          "missing": summary["missing_groups"],
                          "verified_rows": summary["verified_representative_rows"]}), flush=True)
    publish(files, frozen_sources)

if __name__ == "__main__":
    main()
