#!/usr/bin/env python3
"""Preserve exact successful transport-group evidence from one frozen run.

This exporter does not rebuild Lean proofs. It validates the original GitHub
artifact digest, each archived source/object/log, the frozen source and gate
identities, every required endpoint/private proof, and the exact stock replay.
Only passed group receipts are preserved. Numeric integration, complete row
coverage and the span-four theorem remain separate obligations.
"""

from __future__ import annotations

from contextlib import contextmanager
import hashlib
import importlib
import io
import json
import os
from pathlib import Path, PurePosixPath
import re
import stat
import subprocess
import sys
import tempfile
import urllib.request
import zipfile


ROOT = Path(__file__).resolve().parents[1]
REPO = "1337isnot1337/solved-conjectures"
API = "https://api.github.com/repos/" + REPO
SOURCE_RUN_ID = 44513150579
SOURCE_WORKFLOW = "Lean Frankl source-grouped transport batches"
WORKFLOW_HEAD = "02e6fa16119ad69b25a61149eb72187b0f5d6389"
PUBLICATION_SHA = "bf955ba26a1946690b2de6a6e23be2957cbee36a"
MANIFEST_PATH = "results/frankl-generator-families/small_cyclic_weight_transport_batches.json"
MANIFEST_SHA256 = "e0451184f158248d06ce17db747903102c6d961ed8fcb751d6928c4ab6db180f"
G000_RECEIPT_SHA256 = "2d2bbd6f435c86b2253cba5ae644324f3f08679a819b28bc13bdba7307ff2118"
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
LEAN_VERSION = ("Lean (version 4.35.0, x86_64-unknown-linux-gnu, commit "
                "eb6cafb7290e8bd5f2937522d8d804f58f02bafc, Release)")
DESTINATION = "docs/verification/frankl-transport-receipts-" + str(SOURCE_RUN_ID)
EXPORT_INPUTS = (
    "scripts/preserve_frankl_transport_receipts.py",
    "scripts/test_frankl_transport_receipts.py",
    ".github/workflows/frankl-transport-receipts.yml",
)
ALLOWED_FACETS = {".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"}
REQUIRED_FACETS = {".olean", ".olean.private", ".olean.server"}
AUDIT_PATTERN = (
    r"PASS: (\d+) project modules; (\d+) owned declarations; (\d+) owned theorems; "
    r"(\d+) required endpoints; all (\d+) private arithmetic chunks visible"
)
SCOPE = (
    "Only the listed successful bounded transport groups, with all their source "
    "arithmetic premises included. The original indices and alternative transported "
    "weight vectors are those of the frozen manifest. Complete original-row coverage, "
    "the numeric integration root and the span-four theorem remain separate obligations."
)


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def git_bytes(commit, path):
    result = subprocess.run(["git", "show", commit + ":" + path], cwd=ROOT,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    return result.stdout if result.returncode == 0 else None


class PublicArtifactRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        redirected = super().redirect_request(req, fp, code, msg, headers, newurl)
        if redirected is not None:
            redirected.remove_header("Authorization")
        return redirected


OPENER = urllib.request.build_opener(PublicArtifactRedirect())


def request(url, limit=128 * 1024 * 1024):
    require(url.startswith(API + "/"), "Unexpected initial API origin")
    headers = {
        "Authorization": "Bearer " + os.environ["GH_TOKEN"],
        "Accept": "application/vnd.github+json",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "frankl-transport-receipt-export",
    }
    with OPENER.open(urllib.request.Request(url, headers=headers), timeout=60) as response:
        raw = response.read(limit + 1)
    require(len(raw) <= limit, "Response exceeds evidence bound")
    return raw


def api(path):
    return json.loads(request(API + path))


def list_artifacts(fetch=api):
    """Read a complete stable paginated listing, including more than 100 groups."""
    for _attempt in range(4):
        first = fetch(f"/actions/runs/{SOURCE_RUN_ID}/artifacts?per_page=100&page=1")
        total = first["total_count"]
        require(type(total) is int and 0 <= total <= 1024, "Unexpected artifact count")
        records = list(first["artifacts"])
        stable = True
        for page in range(2, (total + 99) // 100 + 1):
            following = fetch(
                f"/actions/runs/{SOURCE_RUN_ID}/artifacts?per_page=100&page={page}")
            stable = stable and following["total_count"] == total
            records.extend(following["artifacts"])
        ids = [record["id"] for record in records]
        if stable and len(records) == total and len(ids) == len(set(ids)):
            return sorted(records, key=lambda item: item["id"])
    raise RuntimeError("Artifact listing changed during every bounded pagination attempt")


@contextmanager
def frozen_gate():
    """Import the proof controller from its immutable publication, not current main."""
    with tempfile.TemporaryDirectory(prefix="frankl-transport-frozen-") as directory:
        snapshot = Path(directory) / "repo"
        subprocess.run(["git", "worktree", "add", "--detach", str(snapshot), PUBLICATION_SHA],
                       cwd=ROOT, check=True)
        sys.path.insert(0, str(snapshot / "scripts"))
        try:
            for name in ("verify_frankl_transport_batches", "verify_frankl_orbit_batches",
                         "replay_lean", "plan_lean_candidates"):
                require(name not in sys.modules, "A mutable gate module was imported too early")
            gate = importlib.import_module("verify_frankl_transport_batches")
            require(gate.ROOT.resolve() == snapshot.resolve(), "Gate loaded outside frozen snapshot")
            require(sha((snapshot / MANIFEST_PATH).read_bytes()) == MANIFEST_SHA256,
                    "Frozen transport manifest hash differs")
            manifest = gate.validate_sources()
            names = [group["id"] for group in manifest["groups"]]
            require(names == [f"g{i:03d}" for i in range(103)]
                    and manifest["target_count"] == 36352
                    and manifest["direct_source_reuse"] == 11020
                    and manifest["transport_check_count"] == 25332,
                    "Frozen group or target partition differs")
            yield gate, manifest, snapshot
        finally:
            sys.path.remove(str(snapshot / "scripts"))
            subprocess.run(["git", "worktree", "remove", "--force", str(snapshot)],
                           cwd=ROOT, check=True)


def expected_model(gate, manifest, snapshot):
    specs, source_hashes = {}, {}
    for declared in manifest["groups"]:
        group, modules, required, private = gate.group_spec(manifest, declared["id"])
        for module in modules:
            path = "lean/" + module.replace(".", "/") + ".lean"
            digest = sha((snapshot / path).read_bytes())
            previous = source_hashes.setdefault(path, digest)
            require(previous == digest, "Inconsistent frozen shared source")
        specs[group["id"]] = {
            "group": group, "modules": modules, "required": required, "private": private,
            "source_sha256": {module: source_hashes["lean/" + module.replace(".", "/") + ".lean"]
                              for module in modules},
            "audit_source": gate.arithmetic.audit_source(modules, required, private).encode(),
        }
    return {
        "groups": specs, "source_sha256": source_hashes,
        "gate_sha256": {path: sha((snapshot / path).read_bytes()) for path in gate.GATE_INPUTS},
    }


def validate_header(receipt, expected, group_name):
    modules, required, private = (expected["modules"], expected["required"], expected["private"])
    require(receipt["status"] == "passed", "Receipt has not passed")
    source_commit = WORKFLOW_HEAD if group_name == "g000" else PUBLICATION_SHA
    require(receipt["git_commit"] == source_commit, "Receipt source checkout differs")
    require(receipt["transport_manifest_sha256"] == MANIFEST_SHA256,
            "Receipt belongs to a different transport manifest")
    require(receipt["group"] == expected["group"], "Group differs from frozen manifest")
    require(receipt["project_modules"] == modules, "Exact project import closure differs")
    require(receipt["required_endpoints"] == required, "Required theorem inventory differs")
    require(receipt["required_private_endpoints"] == private, "Private proof inventory differs")
    require(receipt["target_private_endpoints"] == expected["group"]["target_private_endpoints"],
            "Target-private theorem inventory differs")
    require(receipt["target_count"] == expected["group"]["rows"]
            and receipt["direct_source_reuse"] == expected["group"]["direct_source_reuse"]
            and receipt["transport_check_count"] == expected["group"]["transport_checks"],
            "Receipt target/reuse/transport counts differ")
    require(receipt["integration_root_checked"] is False
            and receipt["canonical_graph_coverage_checked"] is False,
            "A bounded receipt overstates its formal scope")
    require(receipt["all_frozen_hashes_unchanged"] is True, "Missing immutable-evidence assertion")
    require(receipt["axiom_whitelist"] == ["propext", "Classical.choice", "Quot.sound"],
            "Unexpected axiom whitelist")
    toolchain = receipt["toolchain"]
    require(toolchain["checker_sha256"] == CHECKER_SHA256
            and toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["lean_version"] == LEAN_VERSION,
            "Compiler or stock kernel checker differs")
    require(receipt["source_workers"] == 4 and receipt["kernel_threads"] == 4,
            "Unexpected proof-worker profile")
    require(receipt["source_sha256"] == expected["source_sha256"],
            "Source inventory differs from immutable publication")
    require(set(receipt["artifact_sha256"]) == set(modules),
            "Object inventory differs from exact closure")
    require(set(receipt["source_checks"]) == set(modules), "Incomplete fresh source checks")
    for module, check in receipt["source_checks"].items():
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "Source did not pass: " + module)
        command = check["command"]
        require(command[0] == toolchain["lean_path"] and "-j1" in command
                and "-M4500" in command and "-DwarningAsError=true" in command
                and command[-1] == module.replace(".", "/") + ".lean",
                "Source was not checked with the strict frozen command: " + module)
    audit = receipt["axiom_audit"]
    require(audit["exit_code"] == 0 and audit["timed_out"] is False
            and audit["all_declarations_audited"] is True
            and audit["explicit_import_all"] is True
            and audit["project_module_count"] == len(modules)
            and audit["required_endpoint_count"] == len(required)
            and audit["private_arithmetic_chunks_visible"] == len(private)
            and audit["declaration_count"] >= audit["theorem_count"] > 0,
            "Incomplete all-owned declaration or private-node audit")
    require(audit["command"] == [toolchain["lean_path"], "-j1", "-M4500",
                                "-DwarningAsError=true", "OrbitGroupAudit.lean"],
            "Unexpected declaration-audit command")
    replay = receipt["kernel_replay"]
    require(replay["exit_code"] == 0 and replay["timed_out"] is False
            and replay["exact_project_closure"] is True
            and sorted(replay["replayed_modules"]) == sorted(modules)
            and len(set(replay["replayed_modules"])) == len(modules),
            "Incomplete exact stock kernel replay")
    command = replay["command"]
    require(command == [toolchain["checker_path"], "-v", "Conjectures"]
            or command == ["/usr/bin/stdbuf", "-oL", "-eL",
                           toolchain["checker_path"], "-v", "Conjectures"],
            "Unexpected stock kernel replay command")


def safe_archive(payload):
    archive = zipfile.ZipFile(io.BytesIO(payload))
    infos = archive.infolist()
    names = [info.filename for info in infos]
    require(len(names) == len(set(names)), "Duplicate archive member")
    require(sum(info.file_size for info in infos) <= 512 * 1024 * 1024,
            "Uncompressed evidence exceeds bound")
    for info in infos:
        name, path = info.filename, PurePosixPath(info.filename)
        require(not path.is_absolute() and ".." not in path.parts and "\\" not in name
                and path.as_posix() == name.rstrip("/") and str(path) != ".",
                "Unsafe archive member name")
        require(not stat.S_ISLNK(info.external_attr >> 16), "Symbolic link in proof evidence")
        require(info.compress_type in (zipfile.ZIP_STORED, zipfile.ZIP_DEFLATED),
                "Unexpected evidence compression")
    return archive, names


def validate_artifact(artifact, payload, model):
    require("sha256:" + sha(payload) == artifact["digest"], "Artifact ZIP digest differs")
    archive, names = safe_archive(payload)
    receipts = [name for name in names if PurePosixPath(name).name == "receipt.json"]
    require(len(receipts) == 1, "Expected one bounded-group receipt")
    receipt_path = receipts[0]
    raw = archive.read(receipt_path)
    receipt = json.loads(raw)
    if receipt.get("status") != "passed":
        return None
    group_name = receipt["group"]["id"]
    require(group_name in model["groups"] and re.fullmatch(r"g\d{3}", group_name),
            "Receipt names an unconfigured group")
    require(artifact["name"] == "frankl-transport-" + group_name,
            "Artifact/group label mismatch")
    expected = model["groups"][group_name]
    validate_header(receipt, expected, group_name)
    require(receipt["gate_sha256"] == model["gate_sha256"],
            "Gate/configuration/input hash inventory differs")
    if group_name == "g000":
        require(sha(raw) == G000_RECEIPT_SHA256, "Initial publication receipt differs")
    prefix = str(PurePosixPath(receipt_path).parent)
    prefix = "" if prefix == "." else prefix + "/"
    audit_raw = archive.read(prefix + "src/OrbitGroupAudit.lean")
    require(audit_raw == expected["audit_source"]
            and sha(audit_raw) == receipt["axiom_audit"]["audit_source_sha256"],
            "Archived declaration audit differs from the frozen generator")
    for module in expected["modules"]:
        source = archive.read(prefix + "src/" + module.replace(".", "/") + ".lean")
        require(sha(source) == expected["source_sha256"][module],
                "Archived checked source differs: " + module)
        facets = receipt["artifact_sha256"][module]
        require(REQUIRED_FACETS <= set(facets) <= ALLOWED_FACETS,
                "Missing or unknown materialized modern object facet")
        for suffix, digest in facets.items():
            obj = archive.read(prefix + "lib/lean/" + module.replace(".", "/") + suffix)
            require(sha(obj) == digest, "Archived proof object differs: " + module + suffix)
        log = archive.read(prefix + "logs/" + module + ".source.log")
        require(sha(log) == receipt["source_checks"][module]["log_sha256"],
                "Archived strict-source log differs: " + module)
    audit_log = archive.read(prefix + "logs/axiom-audit.log")
    kernel_log = archive.read(prefix + "logs/kernel-replay.log")
    require(sha(audit_log) == receipt["axiom_audit"]["log_sha256"]
            and sha(kernel_log) == receipt["kernel_replay"]["log_sha256"],
            "Archived audit or replay log differs")
    matches = re.findall(AUDIT_PATTERN, audit_log.decode())
    audit = receipt["axiom_audit"]
    require(len(matches) == 1 and tuple(map(int, matches[0])) == (
        len(expected["modules"]), audit["declaration_count"], audit["theorem_count"],
        len(expected["required"]), len(expected["private"])),
        "Original all-owned/private audit log does not match its receipt")
    replayed = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                          kernel_log.decode(), re.M)
    require(replayed == receipt["kernel_replay"]["replayed_modules"]
            and sorted(replayed) == sorted(expected["modules"])
            and len(replayed) == len(set(replayed)),
            "Original stock replay log does not match the exact closure")
    return {
        "group": group_name, "raw": raw, "receipt": receipt,
        "audit_source": audit_raw, "audit_log": audit_log, "kernel_log": kernel_log,
        "archive_sha256": sha(payload),
    }


def publish(files, frozen_sources):
    """Preserve immutable evidence using guarded bounded fast-forward retries."""
    if not files:
        print("No successful transport receipts available", flush=True)
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
                    "Never overwrite different historical transport evidence: " + path)
        if all(git_bytes(latest, path) == raw for path, raw in files.items()):
            print("All selected transport evidence is already preserved", flush=True)
            return
        with tempfile.TemporaryDirectory(prefix="frankl-transport-receipt-index-") as directory:
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
                "Preserve exact bounded Frankl transport proof evidence\n\n"
                "Validate the immutable source and manifest, original archive digests, "
                "all staged source/object/log hashes, required endpoints and private proofs, "
                "and exact pinned stock kernel replay. Keep missing groups explicit. "
                "Do not change accepted registries or complete-conjecture status.\n"
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
    if os.environ.get("GITHUB_EVENT_NAME") == "workflow_run":
        event = json.loads(Path(os.environ["GITHUB_EVENT_PATH"]).read_text())
        if event["workflow_run"]["id"] != SOURCE_RUN_ID:
            print("No configured frozen transport run completed", flush=True)
            return
    export_run = os.environ.get("GITHUB_RUN_ID", "")
    export_attempt = os.environ.get("GITHUB_RUN_ATTEMPT", "")
    require(export_run.isdigit() and export_attempt.isdigit(),
            "Immutable export snapshots require a hosted run and attempt")
    run = api("/actions/runs/" + str(SOURCE_RUN_ID))
    require(run["id"] == SOURCE_RUN_ID and run["head_sha"] == WORKFLOW_HEAD
            and run["name"] == SOURCE_WORKFLOW and run["head_branch"] == "main"
            and run["head_repository"]["full_name"] == REPO,
            "Frozen transport run identity differs")
    artifacts = list_artifacts()
    files, found, skipped = {}, {}, []
    exporter_hashes = {path: sha((ROOT / path).read_bytes()) for path in EXPORT_INPUTS}
    frozen_sources = dict(exporter_hashes)
    with frozen_gate() as (gate, manifest, snapshot):
        model = expected_model(gate, manifest, snapshot)
        expected_names = set(model["groups"])
        for artifact in artifacts:
            if not re.fullmatch(r"frankl-transport-g\d{3}", artifact["name"]):
                skipped.append({"artifact": artifact["id"], "reason": "not a bounded group artifact"})
                continue
            require(type(artifact["id"]) is int and artifact["id"] > 0,
                    "Invalid artifact identifier")
            require(artifact["name"].removeprefix("frankl-transport-") in expected_names,
                    "Artifact names an unconfigured source group")
            require(artifact["workflow_run"]["id"] == SOURCE_RUN_ID
                    and artifact["workflow_run"]["head_sha"] == WORKFLOW_HEAD,
                    "Artifact belongs to a different workflow execution")
            require(artifact["archive_download_url"] ==
                    API + "/actions/artifacts/" + str(artifact["id"]) + "/zip",
                    "Artifact download URL differs from its identity")
            if artifact["expired"]:
                skipped.append({"artifact": artifact["id"], "reason": "expired"})
                continue
            payload = request(artifact["archive_download_url"])
            checked = validate_artifact(artifact, payload, model)
            if checked is None:
                skipped.append({"artifact": artifact["id"], "reason": "group receipt did not pass"})
                continue
            name, receipt = checked["group"], checked["receipt"]
            directory = DESTINATION + "/artifacts/" + str(artifact["id"])
            paths = {
                "receipt": directory + "/" + name + ".json",
                "audit_source": directory + "/audit.lean",
                "audit_log": directory + "/axiom-audit.log",
                "kernel_log": directory + "/kernel-replay.log",
            }
            for field, key in (("receipt", "raw"), ("audit_source", "audit_source"),
                               ("audit_log", "audit_log"), ("kernel_log", "kernel_log")):
                files[paths[field]] = checked[key]
            evidence = {
                "schema": "frankl-transport-group-evidence-v1", "group": name,
                "source_run_id": SOURCE_RUN_ID, "workflow_head": WORKFLOW_HEAD,
                "source_checkout": receipt["git_commit"], "publication_sha": PUBLICATION_SHA,
                "manifest_sha256": MANIFEST_SHA256, "artifact_id": artifact["id"],
                "artifact_name": artifact["name"], "archive_sha256": checked["archive_sha256"],
                "created_at": artifact["created_at"],
                "receipt": paths["receipt"], "receipt_sha256": sha(checked["raw"]),
                "audit_source": paths["audit_source"], "audit_source_sha256": sha(checked["audit_source"]),
                "audit_log": paths["audit_log"], "audit_log_sha256": sha(checked["audit_log"]),
                "kernel_log": paths["kernel_log"], "kernel_log_sha256": sha(checked["kernel_log"]),
                "rows": receipt["group"]["rows"],
                "direct_source_reuse": receipt["group"]["direct_source_reuse"],
                "transport_checks": receipt["group"]["transport_checks"],
                "private_proofs": receipt["group"]["private_chunks"],
                "project_modules": len(receipt["project_modules"]),
                "source_objects_logs_and_exact_replay_verified": True,
                "scope": SCOPE,
            }
            evidence_path = directory + "/evidence.json"
            files[evidence_path] = encoded(evidence)
            found.setdefault(name, []).append({**evidence, "evidence": evidence_path})
            for module, digest in receipt["source_sha256"].items():
                path = "lean/" + module.replace(".", "/") + ".lean"
                require(frozen_sources.setdefault(path, digest) == digest,
                        "Successful artifacts disagree about a checked source")
            print(json.dumps({"validated_group": name, "artifact": artifact["id"],
                              "receipt_sha256": evidence["receipt_sha256"],
                              "rows": evidence["rows"]}), flush=True)
        for path, digest in model["gate_sha256"].items():
            require(frozen_sources.setdefault(path, digest) == digest,
                    "Successful artifacts disagree about a gate input")
        selected = {name: sorted(records, key=lambda record: record["artifact_id"])[0]
                    for name, records in sorted(found.items())}
        require(set(selected) <= expected_names, "Unspecified passed group")
        summary = {
            "schema": "frankl-transport-evidence-snapshot-v1",
            "source_run_id": SOURCE_RUN_ID, "workflow_head": WORKFLOW_HEAD,
            "publication_sha": PUBLICATION_SHA, "manifest_sha256": MANIFEST_SHA256,
            "export_run_id": int(export_run), "export_run_attempt": int(export_attempt),
            "exporter_sha256": exporter_hashes,
            "observed_workflow_status": run["status"],
            "observed_workflow_conclusion": run["conclusion"],
            "expected_groups": sorted(expected_names), "passed_groups": selected,
            "all_successful_artifacts": {name: records for name, records in sorted(found.items())},
            "missing_groups": sorted(expected_names - set(selected)),
            "skipped_artifacts": skipped,
            "verified_target_entries": sum(record["rows"] for record in selected.values()),
            "verified_direct_reuses": sum(record["direct_source_reuse"] for record in selected.values()),
            "verified_transport_checks": sum(record["transport_checks"] for record in selected.values()),
            "verified_private_proof_checks": sum(record["private_proofs"] for record in selected.values()),
            "complete_transport_partition": set(selected) == expected_names,
            "complete_row_coverage_checked": False, "numeric_integration_checked": False,
            "canonical_graph_coverage_checked": False, "accepted_registry_changed": False,
            "scope": SCOPE,
        }
        if summary["complete_transport_partition"]:
            require(summary["verified_target_entries"] == 36352
                    and summary["verified_direct_reuses"] == 11020
                    and summary["verified_transport_checks"] == 25332,
                    "Complete receipt partition has wrong target totals")
        destination = (DESTINATION + "/snapshots/" + export_run + "-attempt-" +
                       export_attempt + ".json")
        files[destination] = encoded(summary)
        print(json.dumps({"passed_groups": sorted(selected),
                          "missing_groups": summary["missing_groups"],
                          "verified_target_entries": summary["verified_target_entries"],
                          "snapshot": destination}), flush=True)
    publish(files, frozen_sources)


if __name__ == "__main__":
    main()
