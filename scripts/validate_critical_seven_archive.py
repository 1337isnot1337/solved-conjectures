#!/usr/bin/env python3
"""Validate an unchanged critical-seven CI artifact against its frozen checkout."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import sys

parser = argparse.ArgumentParser()
parser.add_argument("--source-root", type=Path, required=True)
parser.add_argument("--stage", type=Path, required=True)
parser.add_argument("--commit", required=True)
parser.add_argument("--zip", type=Path, required=True)
parser.add_argument("--zip-sha256", required=True)
parser.add_argument("--report", type=Path)
args = parser.parse_args()


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    h = hashlib.sha256()
    with Path(path).open("rb") as stream:
        while block := stream.read(4 * 1024 * 1024):
            h.update(block)
    return h.hexdigest()


require(sha(args.zip) == args.zip_sha256, "Downloaded ZIP hash differs from GitHub")
receipt_path = args.stage / "receipt.json"
receipt_raw = receipt_path.read_bytes()
receipt = json.loads(receipt_raw)
require(receipt.get("status") == "passed", "The original CI receipt is not passed")
require(receipt["git_commit"] == args.commit, "The exact checked commit differs")
sys.path.insert(0, str(args.source_root / "scripts"))
import verify_critical_seven_exact as gate

model = json.loads((args.source_root / gate.MODEL).read_text())
modules, required, modern = gate.preflight(model)
require(receipt["schema"] == "critical-seven-exact-receipt-v1", "Receipt schema differs")
for key, expected in {
    "scope": model["scope"], "roots": model["roots"], "project_modules": modules,
    "required_theorems": required, "source_sha256": model["source_sha256"],
    "modern_modules": modern, "source_policy": model["source_policy"],
    "axiom_whitelist": list(gate.audit.ALLOWED), "source_workers": 1, "kernel_threads": 1,
    "source_failures": [], "source_skips": {}, "accepted_registry_changed": False,
    "all_frozen_hashes_unchanged": True,
    "conditional_critical_plane_and_family_scope_checked": True,
    "lower_runner_hypotheses_discharged": False,
    "unconditional_critical_plane_theorem_checked": False,
    "seven_speed_spectrum_classification_checked": False,
}.items():
    require(receipt[key] == expected, f"Receipt scope/inventory differs: {key}")
controls = {**model["configuration_sha256"], **model["helper_sha256"],
            **{path: sha(args.source_root / path) for path in gate.OWN_INPUTS}}
require(receipt["gate_sha256"] == controls, "Controller/configuration bytes differ")
require(receipt["toolchain"]["lean_sha256"] == gate.LEAN_SHA256, "Compiler hash differs")
require(receipt["toolchain"]["checker_sha256"] == gate.CHECKER_SHA256,
        "Stock checker hash differs")
require(set(receipt["source_checks"]) == set(modules), "Source coverage differs")
require(set(receipt["kernel_checks"]) == set(modules), "Replay coverage differs")


def process_evidence(check, phase):
    require(check["exit_code"] == 0 and check["timed_out"] is False,
            f"Failed or timed-out process: {phase}")
    log = args.stage / "logs" / (phase + ".log")
    require(sha(log) == check["log_sha256"], f"Process log hash differs: {phase}")
    progress = json.loads((args.stage / "progress" / (phase + ".json")).read_text())
    require(all(check.get(key) == value for key, value in progress.items()),
            f"Original progress record differs: {phase}")
    return log.read_text()


for module in modules:
    stem = module.replace(".", "/")
    require(sha(args.stage / "src" / (stem + ".lean")) == model["source_sha256"][module],
            f"Copied proof source differs: {module}")
    check = receipt["source_checks"][module]
    process_evidence(check, module + ".source")
    command = check["command"]
    require(Path(command[0]).name == "lean"
            and command[1:5] == ["-j1", "-M4500", "-DwarningAsError=true", "-o"]
            and command[-1] == stem + ".lean" and len(command) == 7,
            f"Strict source command differs: {module}")
    require(command[5].endswith("/lib/lean/" + stem + ".olean"),
            f"Source output target differs: {module}")
    check = receipt["kernel_checks"][module]
    log = process_evidence(check, module + ".kernel")
    command = check["command"]
    if Path(command[0]).name == "stdbuf":
        require(command[1:3] == ["-oL", "-eL"], "Unexpected replay wrapper")
        command = command[3:]
    require(len(command) == 3 and Path(command[0]).name == "leanchecker"
            and command[1:] == ["-v", module], f"Stock replay command differs: {module}")
    actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", log, re.M)
    require(actual == [module] and check["replayed_modules"] == [module]
            and check["exact_singleton_target"] is True,
            f"Exact replay target differs: {module}")
require(gate.objects(args.stage, modules, modern) == receipt["artifact_sha256"],
        "Original proof object hashes differ")

audit_check = receipt["axiom_audit"]
audit_log = process_evidence(audit_check, "all-owned-audit")
audit_command = audit_check["command"]
require(len(audit_command) == 5 and Path(audit_command[0]).name == "lean"
        and audit_command[1:] ==
        ["-j1", "-M4500", "-DwarningAsError=true", "CriticalSevenExactAudit.lean"],
        "Strict audit command differs")
audit_source = gate.audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
require((args.stage / "src/CriticalSevenExactAudit.lean").read_bytes() == audit_source,
        "Original audit source differs from the frozen generator")
require(hashlib.sha256(audit_source).hexdigest() == audit_check["audit_source_sha256"],
        "Audit source hash differs")
inventory = gate.audit.validate_log(audit_log, {
    "modules": modules, "required": required, "legacy_prefixes": model["legacy_prefixes"]}, modern)
inventory_path = args.stage / "declaration-inventory.json"
require(inventory_path.read_bytes() == gate.encoded(inventory),
        "Original all-owned/private inventory differs")
require(sha(inventory_path) == audit_check["declaration_inventory_sha256"],
        "Inventory hash differs")
require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
        "Required endpoint is not a theorem")
for key in ["all_owned_declarations_audited", "exact_raw_private_visibility",
            "complete_serialized_private_import"]:
    require(audit_check[key] is True, "Audit scope differs: " + key)
require(audit_check["summary"] == inventory["summary"], "Audit summary differs")
require(receipt["kernel_replay"]["replayed_modules"] == modules, "Replay order differs")
for key in ["exact_project_closure", "all_modules_replayed_as_targets", "fresh_process_per_module"]:
    require(receipt["kernel_replay"][key] is True, "Kernel replay scope differs: " + key)
require(receipt_path.read_bytes() == receipt_raw, "Original receipt was changed")
report = {
    "schema": "critical-seven-artifact-validation-v1",
    "status": "passed", "commit": args.commit,
    "archive_sha256": args.zip_sha256,
    "receipt_sha256": hashlib.sha256(receipt_raw).hexdigest(),
    "strict_source_modules": len(modules),
    "required_theorem_endpoints": len(required),
    "all_owned_private_audit": inventory["summary"],
    "exact_stock_kernel_targets": len(modules),
    "original_source_object_log_progress_audit_bytes_validated": True,
    "lower_runner_hypotheses_discharged": False,
    "unconditional_critical_plane_theorem_checked": False,
    "seven_speed_spectrum_classification_checked": False,
}
encoded = json.dumps(report, indent=2, sort_keys=True) + "\n"
if args.report:
    require(not args.report.exists(), "Refusing to overwrite a validation report")
    args.report.write_text(encoded)
print(encoded, end="")
