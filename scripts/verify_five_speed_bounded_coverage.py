#!/usr/bin/env python3
"""Fresh exact source, all-declaration and stock-kernel bounded-map bridge gate."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

import audit_lean_all_owned as audit
import preserve_five_speed_bounded_receipts as historical
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/five-speed-bounded-coverage-candidate.json"
OWN_INPUTS = (
    "scripts/verify_five_speed_bounded_coverage.py",
    ".github/workflows/lean-five-speed-bounded-coverage.yml",
    MODEL,
    "scripts/preserve_five_speed_bounded_receipts.py",
    "scripts/test_five_speed_bounded_coverage.py",
)
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def source(module):
    return ROOT / "lean" / (module.replace(".", "/") + ".lean")


def exact_singleton(modules, target):
    selected = [m for m in modules if m == target or m.startswith(target + ".")]
    require(selected == [target], "Stock checker prefix is not an exact singleton: " + target)


def preflight(model):
    require(model["schema"] == "five-speed-bounded-coverage-v1", "Unexpected source model")
    modules = runtime.dependency_order(model["roots"])
    require(len(modules) == 340 and set(modules) == set(model["source_sha256"]),
            "Exact bounded-map bridge closure differs")
    required = model["required_theorems"]
    require(len(required) == len(set(required)) == 502, "Required theorem inventory differs")
    require(set(model["required_owner"]) == set(required), "Required ownership map differs")
    expected_private = model["numeric_private_theorems"]
    require(len(expected_private) == 164 and sum(map(len, expected_private.values())) == 4952,
            "Named numeric-private inventory differs")
    for i in range(164):
        module = "Conjectures.LonelinessFiveSpeedBoundedMap" + str(i).zfill(3)
        prefix = "Loneliness.FiveSpeedCertificate.BoundedMapCertificates.M" + str(i) + "."
        names = [prefix + name for name in re.findall(
            r"^private theorem ([A-Za-z0-9_]+)", source(module).read_text(), re.M)]
        require(names == expected_private[module], "Numeric proof source inventory differs: " + module)
    for module in modules:
        require(sha(source(module)) == model["source_sha256"][module],
                "Pinned proof source differs: " + module)
        exact_singleton(modules, module)
    for path, digest in {**model["configuration_sha256"], **model["helper_sha256"]}.items():
        require(sha(ROOT / path) == digest, "Pinned configuration/helper differs: " + path)
    modern = {m: next(header_tokens(source(m).read_text()), None) == "module" for m in modules}
    return modules, required, modern


def objects(stage, modules, modern):
    result = {}
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        facets = {}
        for suffix in FACETS:
            path = Path(str(stem) + suffix)
            require(not path.is_symlink(), "Proof object must be a regular file")
            if path.is_file():
                facets[suffix] = sha(path)
        needed = set(FACETS[:3]) if modern[module] else {".olean"}
        require(needed <= set(facets), "Missing required object facet: " + module)
        pair = {".olean.private", ".olean.server"} & set(facets)
        require(not pair or len(pair) == 2, "Incomplete private/server facet pair: " + module)
        result[module] = facets
    present = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
               for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(present == set(modules), "Extra or missing staged project object")
    return result


def verify(model, modules, required, modern, stage, history_dir):
    require(not stage.exists() or not any(stage.iterdir()), "Choose a fresh proof stage")
    for name in ("src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    historical_hashes = historical.history_inventory(history_dir, model)
    compiler, external, toolchain = runtime.resolve_runtime(None)
    require(toolchain["lean_sha256"] == LEAN_SHA256
            and toolchain["checker_sha256"] == CHECKER_SHA256,
            "Compiler or stock checker is not the pinned binary")
    controls = {**model["configuration_sha256"], **model["helper_sha256"],
                **{path: sha(ROOT / path) for path in OWN_INPUTS}}
    receipt = {
        "schema": "five-speed-bounded-coverage-receipt-v1",
        "status": "running", "scope": model["scope"],
        "git_commit": subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip(),
        "roots": model["roots"], "project_modules": modules,
        "required_theorems": required, "source_sha256": model["source_sha256"],
        "gate_sha256": controls, "toolchain": toolchain,
        "source_workers": 1, "kernel_threads": 1,
        "source_checks": {}, "kernel_checks": {}, "source_policy": model["source_policy"],
        "axiom_whitelist": list(audit.ALLOWED), "modern_modules": modern,
        "accepted_registry_changed": False, "full_five_speed_classification_checked": False,
        "historical_receipts_sha256": historical_hashes,
        "historical_source_policy": model["historical"]["source_flags"],
    }
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {
        **os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0",
    }
    try:
        for module in modules:
            stem = module.replace(".", "/")
            copied = stage / "src" / (stem + ".lean")
            copied.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(source(module), copied)
            require(sha(copied) == model["source_sha256"][module], "Copied proof source differs")
            output = stage / "lib/lean" / (stem + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), stem + ".lean"]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)
            receipt["source_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Strict source failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
        frozen_objects = objects(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        spec = {"modules": modules, "required": required,
                "legacy_prefixes": model["legacy_prefixes"]}
        audit_path = stage / "src/FiveSpeedBoundedCoverageAudit.lean"
        audit_raw = audit.audit_source(modules, required, model["legacy_prefixes"]).encode()
        audit_path.write_bytes(audit_raw)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name]
        check = runtime.profile(command, stage / "src", environment,
            stage / "logs/all-owned-audit.log", stage / "progress/all-owned-audit.json", 900)
        receipt["axiom_audit"] = check
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "All-owned audit failed:\n" + Path(check["log"]).read_text()[-12000:])
        inventory = audit.validate_log(Path(check["log"]).read_text(), spec, modern)
        validate_named_inventory(inventory, model)
        (stage / "declaration-inventory.json").write_bytes(encoded(inventory))
        check.update({
            "all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "complete_serialized_private_import": True, "summary": inventory["summary"],
            "named_numeric_private_theorems_visible": 4952,
            "required_theorem_ownership_checked": True,
            "audit_source_sha256": hashlib.sha256(audit_raw).hexdigest(),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json"),
        })
        replayed = []
        for module in modules:
            exact_singleton(modules, module)
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Stock kernel replay failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                                Path(check["log"]).read_text(), re.M)
            require(actual == [module], "Kernel target differs: " + module)
            check.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Complete bounded-map replay inventory differs")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_project_closure": True,
            "all_modules_replayed_as_targets": True, "fresh_process_per_module": True,
            "seconds": round(sum(c["seconds"] for c in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(c["peak_rss_kib"] for c in receipt["kernel_checks"].values()),
        }
        require(objects(stage, modules, modern) == frozen_objects, "Proof object bytes changed")
        for module, digest in model["source_sha256"].items():
            require(sha(source(module)) == digest and
                    sha(stage / "src" / (module.replace(".", "/") + ".lean")) == digest,
                    "Proof source changed during the gate")
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Gate input changed during the check: " + path)
        for check in [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Recorded process log changed")
        require(audit_path.read_bytes() == audit_raw
                and sha(stage / "declaration-inventory.json") ==
                    receipt["axiom_audit"]["declaration_inventory_sha256"],
                "Axiom audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256
                and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or stock checker changed")
        require(historical.history_inventory(history_dir, model) == historical_hashes,
                "Preserved original receipts changed during verification")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT,
                                        text=True).strip() == receipt["git_commit"],
                "Checkout commit changed during verification")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "bounded_map_coverage_checked": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({
        "status": "passed", "project_modules": len(modules),
        "required_theorems": len(required), "audit_summary": inventory["summary"],
        "receipt_sha256": sha(stage / "receipt.json"),
    }), flush=True)


def validate_named_inventory(inventory, model):
    required = model["required_theorems"]
    for name in required:
        require(inventory["declarations"][name]["kind"] == "theorem"
                and name in inventory["modules"][model["required_owner"][name]]["names"],
                "Required theorem kind or serialized ownership differs: " + name)
    by_user = {}
    for name, row in inventory["declarations"].items():
        if row["private_user_name"] is not None:
            by_user.setdefault(row["private_user_name"], []).append((name, row))
    count = 0
    for module, expected in model["numeric_private_theorems"].items():
        raw_names = set(inventory["modules"][module]["names"])
        for user_name in expected:
            found = by_user.get(user_name, [])
            require(len(found) == 1 and found[0][1]["kind"] == "theorem"
                    and found[0][0] in raw_names,
                    "Named numeric private theorem is missing or has wrong ownership: " + user_name)
            count += 1
    require(count == 4952, "Named numeric private theorem total differs")


def publish(model, stage, history_dir, artifact_id):
    raw = (stage / "receipt.json").read_bytes()
    receipt = json.loads(raw)
    require(receipt["status"] == "passed" and receipt["all_frozen_hashes_unchanged"] is True
            and receipt["bounded_map_coverage_checked"] is True
            and receipt["full_five_speed_classification_checked"] is False,
            "The fresh bounded bridge gate has not passed")
    require(historical.history_inventory(history_dir, model) ==
            receipt["historical_receipts_sha256"], "Preserved historical evidence changed")
    artifact = historical.network.api("/actions/artifacts/" + str(artifact_id))
    require(artifact["name"] == "five-speed-bounded-coverage"
            and artifact["workflow_run"]["id"] == int(os.environ["GITHUB_RUN_ID"])
            and artifact["workflow_run"]["head_sha"] == receipt["git_commit"]
            and artifact["expired"] is False
            and re.fullmatch(r"sha256:[0-9a-f]{64}", artifact["digest"]) is not None
            and artifact["size_in_bytes"] > 0,
            "Fresh artifact does not belong to the checked source run")
    require(receipt["required_theorems"] == model["required_theorems"]
            and receipt["source_sha256"] == model["source_sha256"]
            and receipt["roots"] == model["roots"]
            and receipt["source_policy"] == model["source_policy"],
            "Fresh publication obligations differ")
    expected_modules = set(model["source_sha256"])
    require(set(receipt["project_modules"]) == expected_modules
            and set(receipt["source_checks"]) == expected_modules
            and set(receipt["kernel_checks"]) == expected_modules
            and set(receipt["kernel_replay"]["replayed_modules"]) == expected_modules
            and len(receipt["kernel_replay"]["replayed_modules"]) == 340,
            "Fresh publication closure differs")
    require(objects(stage, receipt["project_modules"], receipt["modern_modules"]) ==
            receipt["artifact_sha256"], "Fresh archived proof facets changed")
    for module, expected in model["source_sha256"].items():
        require(sha(stage / "src" / (module.replace(".", "/") + ".lean")) == expected,
                "Fresh archived proof source changed")
    checks = [*receipt["source_checks"].values(), receipt["axiom_audit"],
              *receipt["kernel_checks"].values()]
    for check in checks:
        require(check["exit_code"] == 0 and check["timed_out"] is False
                and sha(check["log"]) == check["log_sha256"],
                "Fresh process evidence changed before publication")
    require(sha(stage / "src/FiveSpeedBoundedCoverageAudit.lean") ==
            receipt["axiom_audit"]["audit_source_sha256"]
            and sha(stage / "declaration-inventory.json") ==
                receipt["axiom_audit"]["declaration_inventory_sha256"],
            "Fresh audit evidence changed before publication")
    validate_named_inventory(json.loads((stage / "declaration-inventory.json").read_text()), model)
    old_prefix = "docs/verification/five-speed-bounded-history-44471625352/"
    files = {old_prefix + path.name: path.read_bytes()
             for path in history_dir.iterdir() if path.is_file()}
    new_prefix = "docs/verification/five-speed-bounded-coverage-" + receipt["git_commit"] + "/"
    files[new_prefix + "receipt.json"] = raw
    preserved_audit = {
        "declaration-inventory.json": (stage / "declaration-inventory.json").read_bytes(),
        "FiveSpeedBoundedCoverageAudit.lean":
            (stage / "src/FiveSpeedBoundedCoverageAudit.lean").read_bytes(),
        "all-owned-audit.log": Path(receipt["axiom_audit"]["log"]).read_bytes(),
    }
    files.update({new_prefix + name: data for name, data in preserved_audit.items()})
    files[new_prefix + "artifact.json"] = encoded({
        "schema": "five-speed-bounded-coverage-artifact-v1",
        "run_id": int(os.environ["GITHUB_RUN_ID"]), "source_commit": receipt["git_commit"],
        "artifact_id": artifact_id, "artifact_name": artifact["name"],
        "archive_sha256": artifact["digest"].removeprefix("sha256:"),
        "archive_bytes": artifact["size_in_bytes"],
        "receipt_sha256": hashlib.sha256(raw).hexdigest(),
        "preserved_audit_sha256":
            {name: hashlib.sha256(data).hexdigest() for name, data in preserved_audit.items()},
        "scope": receipt["scope"], "new_registry_registration": False,
    })
    guards = {**receipt["gate_sha256"],
              **{"lean/" + m.replace(".", "/") + ".lean": value
                 for m, value in model["source_sha256"].items()}}
    commit = historical.publish_files(files, guards,
        "Preserve exact bounded-map history and fresh coverage-bridge verification")
    require((stage / "receipt.json").read_bytes() == raw, "Fresh receipt bytes changed")
    print(json.dumps({"published_commit": commit,
                      "receipt_sha256": hashlib.sha256(raw).hexdigest()}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--publish", action="store_true")
    parser.add_argument("--artifact-id", type=int)
    parser.add_argument("--history-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/five-speed-bounded-coverage/history")
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/five-speed-bounded-coverage/proof")
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    modules, required, modern = preflight(model)
    if args.plan:
        print(json.dumps({"modules": modules, "required": required, "modern": modern,
                          "source_policy": model["source_policy"]}, indent=2))
        return
    if args.publish:
        require(args.artifact_id is not None, "Publishing needs the uploaded proof artifact ID")
        publish(model, args.artifact_dir.resolve(), args.history_dir.resolve(), args.artifact_id)
        return
    verify(model, modules, required, modern, args.artifact_dir.resolve(), args.history_dir.resolve())


if __name__ == "__main__":
    main()
