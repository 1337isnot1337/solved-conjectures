#!/usr/bin/env python3
"""Preserve exact passed Frankl component receipts and original proof evidence."""
from __future__ import annotations
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import subprocess
import tempfile
import zipfile
import verify_frankl_orbit_batches as short_gate
from preserve_frankl_arithmetic_receipts import ROOT, REPO, api, request, require, sha, encoded, git_bytes

PROFILES = {
    "Lean Frankl boundary configuration fibers": {
        "inventory": "docs/frankl-boundary-fibers-sources.json", "group": "boundary-fibers"},
    "Lean Frankl literal ten-point weight bridge": {
        "inventory": "docs/frankl-literal-ten-bridge-sources.json", "task_prefix": "literal-weights-"},
    "Lean Frankl actual tree configuration counts": {
        "inventory": "docs/frankl-tree-configurations-sources.json", "group": "tree-configurations"},
    "Lean Frankl graph-ball recursive unfolding": {
        "inventory": "docs/frankl-tree-unfolding-sources.json", "group": "tree-unfolding"},
}
BACKFILL = [
    {"id": 44508646093, "head": "887ddbd9f534f2a19712c81bda65468b7dca25ec",
     "workflow": "Lean Frankl boundary configuration fibers"},
    {"id": 44506147903, "head": "a00306b9b7324a29afdf383ad49b99e7258f452e",
     "workflow": "Lean Frankl literal ten-point weight bridge"},
]

def component_specs(profile):
    inventory = json.loads((ROOT / profile["inventory"]).read_text())
    for path, expected in inventory["sources"].items():
        require(short_gate.digest(ROOT / path) == expected, "Reviewed source differs: " + path)
    tasks = inventory["tasks"] if "task_prefix" in profile else {"": inventory}
    specs = {}
    for task, selected in tasks.items():
        name = profile["task_prefix"] + task if "task_prefix" in profile else profile["group"]
        modules = short_gate.dependency_order([selected["root"]])
        private = []
        for module in modules:
            source = short_gate.source(module).read_text()
            names = re.findall(r"^private theorem (checked\d+)\b", source, re.M)
            if names:
                namespaces = re.findall(r"^namespace ([A-Za-z0-9_.]+)\s*$", source, re.M)
                require(len(namespaces) == 1 and len(names) == len(set(names)),
                        "Unexpected private-proof layout: " + module)
                private += [namespaces[0] + "." + name for name in names]
        require(len(private) == len(set(private)), "Duplicate private proof")
        group = {"id": name, "rows": 0, "roots": [selected["root"]], "private_chunks": len(private)}
        specs[name] = (group, modules, selected["required_endpoints"], private)
    return inventory, specs

def validate_receipt(record, artifact, payload, inventory, specs, receipt_path):
    require("sha256:" + sha(payload) == artifact["digest"], "Artifact ZIP hash mismatch")
    archive = zipfile.ZipFile(io.BytesIO(payload))
    require(sum(info.file_size for info in archive.infolist()) <= 512 * 1024 * 1024,
            "Uncompressed evidence exceeds bound")
    names = archive.namelist()
    require(len(names) == len(set(names)), "Duplicate archive member")
    require(receipt_path in names and PurePosixPath(receipt_path).name == "receipt.json",
            "Expected an archived component receipt")
    raw = archive.read(receipt_path)
    receipt = json.loads(raw)
    if receipt.get("status") != "passed":
        return None
    require(receipt["git_commit"] == record["head"], "Receipt source commit mismatch")
    group_name = receipt["group"]["id"]
    require(group_name in specs, "Unspecified component group")
    group, modules, required, private = specs[group_name]
    require(receipt["reviewed_inventory"] == inventory, "Reviewed inventory differs")
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
        print("No successful component receipts", flush=True)
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
                    "Never overwrite a different historical component receipt: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All selected component receipts already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="frankl-component-receipt-") as directory:
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
            message = ("Preserve exact checked Frankl component receipts\n\n"
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
    records = list(BACKFILL)
    if os.environ.get("GITHUB_EVENT_NAME") == "workflow_run":
        finished = event["workflow_run"]
        if finished["name"] not in PROFILES or finished["conclusion"] != "success":
            print("No successful profiled component completed", flush=True)
            return
        if finished["id"] not in {record["id"] for record in records}:
            records.append({"id": finished["id"], "head": finished["head_sha"],
                            "workflow": finished["name"]})
    files, frozen_sources = {}, {}
    for record in records:
        run = api("/actions/runs/" + str(record["id"]))
        require(run["head_sha"] == record["head"] and run["name"] == record["workflow"],
                "Run identity mismatch")
        require(run["head_repository"]["full_name"] == REPO and run["head_branch"] == "main",
                "Run came from a different repository or branch")
        require(run["status"] == "completed" and run["conclusion"] == "success",
                "Component run did not finish successfully")
        profile = PROFILES[record["workflow"]]
        inventory, specs = component_specs(profile)
        listing = api("/actions/runs/" + str(record["id"]) + "/artifacts?per_page=100")
        require(listing["total_count"] == len(listing["artifacts"]), "Artifact pagination required")
        found = {}
        for artifact in listing["artifacts"]:
            require(not artifact["expired"], "Component archive expired")
            require(artifact["workflow_run"]["id"] == record["id"]
                    and artifact["workflow_run"]["head_sha"] == record["head"],
                    "Artifact ownership mismatch")
            payload = request(artifact["archive_download_url"])
            require("sha256:" + sha(payload) == artifact["digest"], "Artifact ZIP hash mismatch")
            archive = zipfile.ZipFile(io.BytesIO(payload))
            names = [name for name in archive.namelist() if PurePosixPath(name).name == "receipt.json"]
            for receipt_path in names:
                checked = validate_receipt(record, artifact, payload, inventory, specs, receipt_path)
                require(checked is not None, "Successful component run contains a non-passed receipt")
                name, raw, receipt = checked
                require(name not in found, "Duplicate successful component receipt")
                destination = ("docs/verification/frankl-components-" + str(record["id"])
                               + "/" + name + ".json")
                files[destination] = raw
                found[name] = {
                    "receipt": destination, "receipt_sha256": sha(raw),
                    "artifact_id": artifact["id"], "artifact_name": artifact["name"],
                    "archive_sha256": sha(payload), "project_modules": len(receipt["project_modules"]),
                    "private_chunks": receipt["group"]["private_chunks"],
                    "required_endpoints": len(receipt["required_endpoints"])}
                frozen_sources.update({"lean/" + module.replace(".", "/") + ".lean": expected
                                       for module, expected in receipt["source_sha256"].items()})
        require(set(found) == set(specs), "Not every expected component group was archived")
        summary = {
            "schema": "frankl-exact-component-receipts-v1", "source_run_id": record["id"],
            "source_commit": record["head"], "workflow": record["workflow"],
            "profile_inventory": profile["inventory"],
            "profile_inventory_sha256": short_gate.digest(ROOT / profile["inventory"]),
            "passed_groups": found, "accepted_registry_changed": False, "scope": inventory["scope"]}
        files["docs/verification/frankl-components-" + str(record["id"]) + "/summary.json"] = encoded(summary)
        print(json.dumps({"run": record["id"], "passed_groups": sorted(found),
                          "modules": {name: value["project_modules"] for name, value in found.items()}}),
              flush=True)
    publish(files, frozen_sources)

if __name__ == "__main__":
    main()
