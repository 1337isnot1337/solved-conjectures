#!/usr/bin/env python3
"""Authenticate and preserve the original seven-spectrum component evidence."""
from pathlib import Path, PurePosixPath
import argparse
import hashlib
import json
import re
import subprocess
import sys
import zipfile


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--snapshot", type=Path, required=True)
parser.add_argument("--archive", type=Path, required=True)
parser.add_argument("--metadata-dir", type=Path, required=True)
parser.add_argument("--head", required=True)
parser.add_argument("--run", type=int, required=True)
parser.add_argument("--job", type=int, required=True)
parser.add_argument("--artifact", type=int, required=True)
parser.add_argument("--zip-sha256", required=True)
parser.add_argument("--receipt-sha256", required=True)
parser.add_argument("--out", type=Path, required=True)
args = parser.parse_args()
require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=args.snapshot,
                                text=True).strip() == args.head,
        "Snapshot is not the requested source commit")
metadata = {name: (args.metadata_dir / name).read_bytes()
            for name in ("run-api.json", "jobs-api.json", "artifact-api.json", "job.log")}
run = json.loads(metadata["run-api.json"])
require(run["id"] == args.run and run["head_sha"] == args.head
        and run["status"] == "completed" and run["conclusion"] == "success"
        and run["path"].split("@")[0] == ".github/workflows/lean-seven-spectrum-norm-exact.yml",
        "Hosted run identity or conclusion differs")
jobs = [job for job in json.loads(metadata["jobs-api.json"])["jobs"] if job["id"] == args.job]
require(len(jobs) == 1 and jobs[0]["run_id"] == args.run
        and jobs[0]["status"] == "completed" and jobs[0]["conclusion"] == "success",
        "Hosted job identity or conclusion differs")
steps = [step for step in jobs[0]["steps"]
         if step["name"] == "Fresh strict sources, all-owned audit and exact stock replay"]
require(len(steps) == 1 and steps[0]["conclusion"] == "success", "Hosted proof step did not pass")
artifacts = [artifact for artifact in json.loads(metadata["artifact-api.json"])["artifacts"]
             if artifact["id"] == args.artifact]
require(len(artifacts) == 1, "Hosted artifact identity differs")
artifact = artifacts[0]
require(artifact["name"] == "seven-spectrum-norm-exact" and artifact["expired"] is False
        and artifact["workflow_run"]["id"] == args.run
        and artifact["workflow_run"]["head_sha"] == args.head
        and artifact["digest"] == "sha256:" + args.zip_sha256
        and artifact["size_in_bytes"] == args.archive.stat().st_size,
        "Hosted artifact binding or digest differs")
job_log = metadata["job.log"].decode()
require(re.findall(r'"receipt_sha256":\s*"([a-f0-9]{64})"', job_log) == [args.receipt_sha256],
        "Original receipt digest does not match the hosted job log")
require(re.findall(r"SHA256 digest of uploaded artifact zip is ([a-f0-9]{64})", job_log)
        == [args.zip_sha256], "Original archive digest does not match the hosted job log")
require(sha(args.archive.read_bytes()) == args.zip_sha256, "Archive digest differs")
archive = zipfile.ZipFile(args.archive)
names = archive.namelist()
require(len(names) == len(set(names)), "Duplicate archive member")
require(all(not PurePosixPath(n).is_absolute() and ".." not in PurePosixPath(n).parts
            for n in names), "Unsafe archive member")
raw_receipt = archive.read("receipt.json")
require(sha(raw_receipt) == args.receipt_sha256, "Original receipt digest differs")
receipt = json.loads(raw_receipt)
require(receipt["status"] == "passed" and receipt["git_commit"] == args.head,
        "Receipt did not pass at the exact source commit")
require(receipt["schema"] == "seven-spectrum-norm-exact-receipt-v1", "Wrong receipt schema")
for key in ("all_frozen_hashes_unchanged", "stated_component_scope_checked"):
    require(receipt[key] is True, "Missing receipt invariant: " + key)
for key in ("universal_classification_claimed", "accepted_registry_changed"):
    require(receipt[key] is False, "Unexpected acceptance claim: " + key)
require(receipt["source_workers"] == receipt["kernel_threads"] == 1,
        "Source or kernel concurrency policy differs")
require(receipt["axiom_whitelist"] == ["propext", "Classical.choice", "Quot.sound"],
        "Axiom whitelist differs")
sys.path.insert(0, str(args.snapshot / "scripts"))
import audit_lean_all_owned as audit
import verify_seven_spectrum_norm_exact as gate

model = json.loads((args.snapshot / gate.MODEL).read_bytes())
modules, required, modern = gate.preflight(model)
for key in ("roots", "scope", "source_sha256", "required_theorems", "source_policy"):
    require(receipt[key] == model[key], "Receipt differs from source model: " + key)
require(receipt["project_modules"] == modules, "Exact topological source closure differs")
require(receipt["modern_modules"] == modern, "Module visibility inventory differs")
expected_controls = {
    **model["configuration_sha256"], **model["helper_sha256"],
    **{path: sha((args.snapshot / path).read_bytes()) for path in gate.OWN_INPUTS},
}
require(receipt["gate_sha256"] == expected_controls, "Exact gate input inventory differs")
for path, digest in receipt["gate_sha256"].items():
    require(sha((args.snapshot / path).read_bytes()) == digest, "Gate hash differs: " + path)
for module, digest in receipt["source_sha256"].items():
    path = module.replace(".", "/") + ".lean"
    raw = archive.read("src/" + path)
    require(sha(raw) == digest and raw == (args.snapshot / "lean" / path).read_bytes(),
            "Archived source differs: " + module)
require(set(receipt["artifact_sha256"]) == set(modules), "Object closure differs")
objects = set()
for module, facets in receipt["artifact_sha256"].items():
    needed = set(gate.FACETS[:3]) if modern[module] else {".olean"}
    require(needed <= set(facets) <= set(gate.FACETS), "Object facets differ: " + module)
    require((".olean.private" in facets) == (".olean.server" in facets),
            "Partial private/server pair: " + module)
    for extension, digest in facets.items():
        path = "lib/lean/" + module.replace(".", "/") + extension
        require(sha(archive.read(path)) == digest, "Object digest differs: " + path)
        objects.add(path)
require(objects == {n for n in names if n.startswith("lib/lean/") and not n.endswith("/")},
        "Unexpected archived project object")
require(receipt["toolchain"]["lean_sha256"] == gate.LEAN_SHA256
        and receipt["toolchain"]["checker_sha256"] == gate.CHECKER_SHA256,
        "Compiler or stock checker identity differs")
lean = receipt["toolchain"]["lean_path"]
checker = receipt["toolchain"]["checker_path"]
require(set(receipt["source_checks"]) == set(receipt["kernel_checks"]) == set(modules),
        "Missing source or stock replay process")
processes = []
for module in modules:
    source = receipt["source_checks"][module]
    stem = module.replace(".", "/")
    command = source["command"]
    require(len(command) == 7
            and command[:5] == [lean, "-j1", "-M4500", "-DwarningAsError=true", "-o"]
            and command[5].endswith("/lib/lean/" + stem + ".olean")
            and command[6] == stem + ".lean", "Strict source command differs: " + module)
    kernel = receipt["kernel_checks"][module]
    command = kernel["command"]
    if len(command) == 6 and PurePosixPath(command[0]).name == "stdbuf":
        require(command[1:3] == ["-oL", "-eL"], "Unexpected buffering wrapper")
        command = command[3:]
    require(command == [checker, "-v", module], "Stock replay command differs: " + module)
    log = archive.read("logs/" + module + ".kernel.log").decode()
    require(re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", log, re.M) == [module]
            and kernel["replayed_modules"] == [module]
            and kernel["exact_singleton_target"] is True, "Replay target differs: " + module)
    processes.extend((source, kernel))
replay = receipt["kernel_replay"]
require(replay["replayed_modules"] == modules, "Replay order differs")
for key in ("exact_project_closure", "all_modules_replayed_as_targets", "fresh_process_per_module"):
    require(replay[key] is True, "Replay invariant missing: " + key)
statements = receipt["literal_statements"]
require(statements["command"] == [lean, "-j1", "-M4500", "-DwarningAsError=true",
                                   "SevenSpectrumNormStatements.lean"],
        "Literal statement check command differs")
statement_raw = gate.STATEMENTS.encode()
require(archive.read("src/SevenSpectrumNormStatements.lean") == statement_raw
        and sha(statement_raw) == receipt["literal_statements_sha256"],
        "Literal quantified statements differ")
audit_check = receipt["axiom_audit"]
require(audit_check["command"] == [lean, "-j1", "-M4500", "-DwarningAsError=true",
                                    "SevenSpectrumNormAudit.lean"], "Axiom audit command differs")
for key in ("all_owned_declarations_audited", "exact_raw_private_visibility", "explicit_import_all"):
    require(audit_check[key] is True, "Axiom audit invariant missing: " + key)
processes.extend((statements, audit_check))
for process in processes:
    require(process["exit_code"] == 0 and process["timed_out"] is False, "Process did not pass")
    log_name = PurePosixPath(process["log"]).name
    progress_name = PurePosixPath(process["progress"]).name
    require(sha(archive.read("logs/" + log_name)) == process["log_sha256"],
            "Original log hash differs: " + log_name)
    progress_raw = archive.read("progress/" + progress_name)
    require(sha(progress_raw) == process["progress_sha256"],
            "Original progress hash differs: " + progress_name)
    require(all(process[key] == value for key, value in json.loads(progress_raw).items()),
            "Original process profile differs: " + progress_name)
audit_raw = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
require(archive.read("src/SevenSpectrumNormAudit.lean") == audit_raw
        and sha(audit_raw) == audit_check["audit_source_sha256"], "Original audit source differs")
spec = {"modules": modules, "required": required, "legacy_prefixes": model["legacy_prefixes"]}
inventory = audit.validate_log(archive.read("logs/all-owned-audit.log").decode(), spec, modern)
inventory_raw = archive.read("declaration-inventory.json")
require(inventory == json.loads(inventory_raw)
        and sha(inventory_raw) == audit_check["declaration_inventory_sha256"],
        "Declaration inventory differs")
require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
        "Required endpoint is not a theorem")
require(inventory["summary"] == audit_check["summary"], "Audit summary differs")
manifest = {name: {"bytes": len(archive.read(name)), "sha256": sha(archive.read(name))}
            for name in names if not name.endswith("/")}
keep = ["receipt.json", "declaration-inventory.json", "src/SevenSpectrumNormAudit.lean",
        "src/SevenSpectrumNormStatements.lean"]
keep += [n for n in names if n.startswith(("logs/", "progress/")) and not n.endswith("/")]
require(not args.out.exists() or not any(args.out.iterdir()), "Choose a fresh evidence directory")
args.out.mkdir(parents=True, exist_ok=True)
for name in keep:
    path = args.out / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(archive.read(name))
for name, raw in metadata.items():
    path = args.out / "github" / name
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(raw)
(args.out / "archive-members.json").write_bytes(encoded(manifest))
record = {
    "schema": "seven-spectrum-norm-original-evidence-preservation-v1",
    "source_commit": args.head, "run_id": args.run, "job_id": args.job,
    "artifact_id": args.artifact, "archive_sha256": args.zip_sha256,
    "archive_bytes": args.archive.stat().st_size, "raw_receipt_sha256": args.receipt_sha256,
    "checked_archive_files": len(manifest), "preserved_files": keep,
    "remote_metadata_sha256": {"github/" + name: sha(raw) for name, raw in metadata.items()},
    "run_job_artifact_and_head_binding_checked": True,
    "all_archived_source_and_object_hashes_checked": True,
    "all_process_records_and_logs_checked": True,
    "original_audit_reconstructed_and_validated": True,
    "literal_quantified_statements_checked": True, "new_lean_execution_performed": False,
    "universal_classification_claimed": False,
    "validator_path": "scripts/validate_seven_spectrum_norm_archive.py",
    "validator_sha256": sha(Path(__file__).read_bytes()),
}
(args.out / "preservation.json").write_bytes(encoded(record))
print(json.dumps({"status": "authenticated", "module_count": len(modules),
                  "required_theorem_count": len(required), "summary": inventory["summary"],
                  "out": str(args.out)}))
