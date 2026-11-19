#!/usr/bin/env python3
"""Audit raw proof occurrences in the authenticated, previously checked Li44 artifact.

This is a supplement to run 44599210697. It rechecks the literal statements and
the complete union of reachable raw proof bodies. It neither compiles the 44
project sources nor claims another stock replay of those sources.
"""
from __future__ import annotations

import argparse
import errno
import hashlib
import importlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
SELF = "scripts/verify_li_hosted44_raw.py"
WORKFLOW = ".github/workflows/lean-li-hosted44-raw.yml"
AUTHENTICATOR = "scripts/authenticate_li_hosted44.py"
AUTHENTICATOR_SHA256 = "8dd2d36c204285551fd148dcc8f7e5f334bc855c1fa91d2fc70e19b61a5f1e79"
BASELINE_COMMIT = "20e0e95eb421cf8ea728d34aa29a6d0eb1137789"
BASELINE_METADATA = {
    "run_id": 44599210697,
    "job_id": 135825706963,
    "artifact_id": 14568527194,
    "head_sha": BASELINE_COMMIT,
}
ARCHIVE_SHA256 = "281b57fd87cf7d6123cdcabff4a5803f3d426116dbb4a9aa01370318b2a138ed"
BASELINE_RECEIPT_SHA256 = "da585dbd99530825af7bac8c4730c1a6666bfa151ce98ad4c6f52b9d537aa09d"
BASELINE_CONTROLS = {
    "scripts/verify_li_exact.py": "5533b789c681e32b3894994e937d6313757faeccdd078d6c68ea87bb9832b67c",
    "docs/li-exact-sources.json": "6625ba9585caba15395d604d208b6577866a071622e6694ab0a94fd3be683724",
    ".github/workflows/lean-li-exact.yml": "f384d9a2e6e814ed061d9e75b6fbb683ed29c88623739b512e1d1ccc5f45c816",
}
RAW_HELPER = "scripts/audit_lean_raw_occurrences.py"
RAW_HELPER_SHA256 = "7c366fa3983ed26b2356c417552b861ff235c5bb34848810191c13b5322c9cea"


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def digest(path):
    path = Path(path)
    require(path.is_file() and not path.is_symlink(), "Expected regular file: " + str(path))
    return hashlib.sha256(path.read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def tree_hashes(root):
    require(root.is_dir() and not root.is_symlink(), "Expected materialized directory: " + str(root))
    result = {}
    for path in sorted(root.rglob("*")):
        require(not path.is_symlink(), "Artifact symlink: " + str(path))
        if path.is_file():
            result[path.relative_to(root).as_posix()] = digest(path)
        else:
            require(path.is_dir(), "Unexpected artifact entry: " + str(path))
    return result


def freeze_controls():
    for path, expected in BASELINE_CONTROLS.items():
        require(digest(ROOT / path) == expected, "Pinned baseline control differs: " + path)
    model = json.loads((ROOT / "docs/li-exact-sources.json").read_text())
    controls = {
        **BASELINE_CONTROLS,
        **model["configuration_sha256"],
        **model["helper_sha256"],
        RAW_HELPER: RAW_HELPER_SHA256,
        AUTHENTICATOR: AUTHENTICATOR_SHA256,
    }
    for path, expected in controls.items():
        require(digest(ROOT / path) == expected, "Pinned helper/configuration differs: " + path)
    controls[SELF] = digest(ROOT / SELF)
    if (ROOT / WORKFLOW).exists():
        controls[WORKFLOW] = digest(ROOT / WORKFLOW)
    return model, controls


def load_helpers(controls):
    sys.path.insert(0, str(ROOT / "scripts"))
    names = ("verify_li_exact", "audit_lean_all_owned", "audit_lean_raw_occurrences", "verify_frankl_orbit_batches")
    helpers = tuple(importlib.import_module(name) for name in names)
    for module in list(sys.modules.values()):
        filename = getattr(module, "__file__", None)
        if filename is None:
            continue
        path = Path(filename).resolve()
        if path.is_relative_to(ROOT / "scripts") and path.suffix == ".py":
            relative = path.relative_to(ROOT).as_posix()
            require(relative in controls and digest(path) == controls[relative],
                    "Unfrozen imported project helper: " + relative)
    for name, module in zip(names, helpers):
        require(Path(module.__file__).resolve() == ROOT / "scripts" / (name + ".py"),
                "Imported helper resolved outside the pinned checkout: " + name)
    return helpers


def authenticate_inputs(artifact, authentication_path, model, baseline):
    auth_hash = digest(authentication_path)
    authentication = json.loads(authentication_path.read_text())
    require(authentication.get("schema") == "li-hosted44-authentication-v1"
            and authentication.get("status") == "passed", "Missing successful baseline authentication")
    require(authentication.get("authentication_script_sha256") == AUTHENTICATOR_SHA256,
            "Baseline authentication used another controller")
    for key, value in BASELINE_METADATA.items():
        require(authentication["metadata"].get(key) == value, "Different baseline metadata: " + key)
    require(authentication.get("archive_sha256") == ARCHIVE_SHA256
            and authentication.get("original_receipt_sha256") == BASELINE_RECEIPT_SHA256,
            "Different authenticated archive/receipt")
    require(authentication.get("baseline_verification_authenticated") is True
            and authentication.get("raw_proof_occurrence_coverage") is False,
            "Unexpected baseline verification scope")
    files = tree_hashes(artifact)
    require(files == authentication["artifact_files_sha256"], "Extracted baseline files changed")
    require(files.get("receipt.json") == BASELINE_RECEIPT_SHA256, "Baseline receipt bytes differ")
    receipt = json.loads((artifact / "receipt.json").read_text())
    modules, required, modern = baseline.preflight(model)
    require(len(modules) == 44 and len(required) == 71, "Li44/71 scope differs")
    require(receipt.get("status") == "passed" and receipt.get("git_commit") == BASELINE_COMMIT,
            "Baseline is not the fixed successful run")
    for key, expected in (("project_modules", modules), ("required_theorems", required),
                          ("source_sha256", model["source_sha256"])):
        require(receipt[key] == expected and authentication[key] == expected,
                "Baseline scope differs: " + key)
    require(receipt["modern_modules"] == modern, "Baseline module formats differ")
    require(receipt.get("source_failures") == {} and receipt.get("blocked_sources") == {},
            "Baseline source closure was incomplete")
    objects = baseline.objects(artifact, modules, modern)
    require(objects == receipt["artifact_sha256"] == authentication["artifact_sha256"],
            "Baseline object facets differ")
    require(receipt["kernel_replay"]["replayed_modules"] == modules
            and receipt["kernel_replay"].get("all_modules_replayed_as_targets") is True,
            "Baseline stock replay scope differs")
    require(receipt["gate_sha256"] == {
        **BASELINE_CONTROLS, **model["configuration_sha256"], **model["helper_sha256"]},
        "Baseline controller/configuration provenance differs")
    expected_files = {"receipt.json", "declaration-inventory.json",
                      "src/LiExactStatements.lean", "src/LiExactAudit.lean"}
    checks = [receipt["literal_statements"], receipt["axiom_audit"]]
    for module in modules:
        stem = module.replace(".", "/")
        source = artifact / "src" / (stem + ".lean")
        expected_files.add("src/" + stem + ".lean")
        expected_files.update("lib/lean/" + stem + suffix for suffix in objects[module])
        require(digest(source) == model["source_sha256"][module], "Archived proof source differs: " + module)
        check = receipt["source_checks"][module]
        require(check["exit_code"] == 0 and check["timed_out"] is False
                and check["source_sha256"] == model["source_sha256"][module]
                and check["artifact_sha256"] == objects[module], "Invalid baseline source record: " + module)
        imports = [dep for dep in baseline.imports_of(source) if dep in modules]
        expected_imports = {dep: {"source_sha256": model["source_sha256"][dep],
                                  "artifact_sha256": objects[dep]} for dep in imports}
        require(check["direct_project_imports"] == expected_imports,
                "Baseline direct import binding differs: " + module)
        kernel = receipt["kernel_checks"][module]
        require(kernel["exit_code"] == 0 and kernel["timed_out"] is False
                and kernel["replayed_modules"] == [module]
                and kernel["exact_singleton_target"] is True, "Invalid baseline stock record: " + module)
        checks.extend((check, kernel))
    require(len(checks) == 90, "Baseline process inventory differs")
    for check in checks:
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "Baseline process did not succeed")
        for field, folder in (("log", "logs"), ("progress", "progress")):
            relative = folder + "/" + Path(check[field]).name
            require(relative not in expected_files, "Repeated baseline process evidence: " + relative)
            expected_files.add(relative)
            require(files.get(relative) == check[field + "_sha256"],
                    "Baseline process evidence differs: " + relative)
    require(set(files) == expected_files, "Unexpected baseline artifact file inventory")
    require(files["declaration-inventory.json"] == receipt["axiom_audit"]["declaration_inventory_sha256"]
            and files["src/LiExactAudit.lean"] == receipt["axiom_audit"]["audit_source_sha256"],
            "Baseline audit evidence differs")
    statements_hash = hashlib.sha256(baseline.STATEMENTS.encode()).hexdigest()
    require(statements_hash == model["literal_statements_sha256"]
            == files.get("src/LiExactStatements.lean"), "Baseline literal statements differ")
    return {"authentication_sha256": auth_hash, "files": files, "receipt": receipt,
            "modules": modules, "required": required, "modern": modern, "objects": objects}


def materialize(source, target, expected):
    require(digest(source) == expected, "Source changed before staging: " + str(source))
    require(not target.exists() and not target.is_symlink(), "Staged target already exists: " + str(target))
    target.parent.mkdir(parents=True, exist_ok=True)
    try:
        os.link(source, target)
    except OSError as error:
        if error.errno != errno.EXDEV:
            raise
        with source.open("rb") as reader, target.open("xb") as writer:
            shutil.copyfileobj(reader, writer)
    require(digest(target) == expected, "Staged bytes differ: " + str(target))


def verify(artifact, authentication_path, stage, runtime_path, model, controls, helpers, inputs):
    baseline, audit, raw, runtime = helpers
    modules, required, modern = (inputs[key] for key in ("modules", "required", "modern"))
    require(not stage.exists() or not any(stage.iterdir()), "Choose an empty supplemental stage")
    require(not stage.is_relative_to(artifact) and not artifact.is_relative_to(stage),
            "Supplemental stage overlaps the authenticated baseline")
    for name in ("src", "lib/lean", "controls", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    for module in modules:
        stem = module.replace(".", "/")
        materialize(artifact / "src" / (stem + ".lean"), stage / "src" / (stem + ".lean"),
                    model["source_sha256"][module])
        for suffix, expected in inputs["objects"][module].items():
            materialize(artifact / "lib/lean" / (stem + suffix), stage / "lib/lean" / (stem + suffix), expected)
    for path, expected in controls.items():
        materialize(ROOT / path, stage / "controls" / path, expected)
    materialize(authentication_path, stage / "baseline-authentication.json", inputs["authentication_sha256"])
    materialize(artifact / "receipt.json", stage / "baseline-receipt.json", BASELINE_RECEIPT_SHA256)
    compiler, external, toolchain = runtime.resolve_runtime(runtime_path)
    require(toolchain["lean_sha256"] == baseline.LEAN_SHA256
            and toolchain["checker_sha256"] == baseline.CHECKER_SHA256,
            "Compiler/checker binary differs from the authenticated baseline")
    require(toolchain["lean_sha256"] == inputs["receipt"]["toolchain"]["lean_sha256"]
            and toolchain["checker_sha256"] == inputs["receipt"]["toolchain"]["checker_sha256"],
            "Supplemental toolchain differs from the baseline toolchain")
    commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    environment = {**os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
                   "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
                   "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
    receipt = {
        "schema": "li-hosted44-raw-supplement-v1", "status": "running",
        "scope": "Literal statements and all reachable serialized raw proof variants of authenticated Li44",
        "git_commit": commit, "baseline_metadata": BASELINE_METADATA,
        "baseline_archive_sha256": ARCHIVE_SHA256, "baseline_receipt_sha256": BASELINE_RECEIPT_SHA256,
        "authentication_sha256": inputs["authentication_sha256"],
        "baseline_artifact_files_sha256": inputs["files"],
        "baseline_verification_authenticated": True, "proof_sources_recompiled": False,
        "stock_replay_performed_by_this_supplement": False,
        "accepted_registry_changed": False, "project_modules": modules, "required_theorems": required,
        "modern_modules": modern, "source_sha256": model["source_sha256"],
        "artifact_sha256": inputs["objects"], "control_sha256": controls,
        "workflow_present": WORKFLOW in controls, "toolchain": toolchain, "external_lean_path": external,
        "literal_statements_sha256": model["literal_statements_sha256"],
        "raw_helper_sha256": RAW_HELPER_SHA256, "checks": {},
    }
    def save():
        temporary = stage / "receipt.json.tmp"
        temporary.write_bytes(encoded(receipt))
        temporary.replace(stage / "receipt.json")
    def unchanged():
        require(digest(authentication_path) == inputs["authentication_sha256"], "Authentication changed")
        require(tree_hashes(artifact) == inputs["files"], "Authenticated baseline changed")
        require(baseline.objects(stage, modules, modern) == inputs["objects"], "Staged objects changed")
        for module, expected in model["source_sha256"].items():
            relative = module.replace(".", "/") + ".lean"
            require(digest(stage / "src" / relative) == expected
                    and digest(ROOT / "lean" / relative) == expected, "Proof source changed: " + module)
        for path, expected in controls.items():
            require(digest(ROOT / path) == expected and digest(stage / "controls" / path) == expected,
                    "Control changed: " + path)
        require((ROOT / WORKFLOW).exists() == (WORKFLOW in controls), "Workflow presence changed")
        require(digest(compiler / "bin/lean") == baseline.LEAN_SHA256
                and digest(compiler / "bin/leanchecker") == baseline.CHECKER_SHA256, "Toolchain changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Checkout commit changed")
    def check_source(label, source_path, timeout, extra_flags=()):
        unchanged()
        source_hash = digest(source_path)
        command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                   *extra_flags, source_path.name]
        check = runtime.profile(command, stage / "src", environment,
            stage / "logs" / (label + ".log"), stage / "progress" / (label + ".json"), timeout)
        check.update({"source_sha256": source_hash, "progress": str(stage / "progress" / (label + ".json"))})
        check["progress_sha256"] = digest(check["progress"])
        receipt["checks"][label] = check
        save()
        unchanged()
        require(digest(source_path) == source_hash, "Audit/literal source changed")
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                label + " failed:\n" + Path(check["log"]).read_text()[-12000:])
        return check
    save()
    try:
        statements = stage / "src/LiHosted44Statements.lean"
        statements.write_bytes(baseline.STATEMENTS.encode())
        require(digest(statements) == model["literal_statements_sha256"], "Copied literal statements differ")
        check_source("literal-statements", statements, 900)
        specification = {"modules": modules, "required": required, "legacy_prefixes": model["legacy_prefixes"]}
        audit_source = raw.augment_source(audit.audit_source(modules, required, model["legacy_prefixes"]),
            modules, modern, flavor="all_owned", legacy_prefixes=model["legacy_prefixes"])
        audit_path = stage / "src/LiHosted44RawAudit.lean"
        audit_path.write_bytes(audit_source.encode())
        check = check_source("raw-all-owned-audit", audit_path, 1800, ("-t0",))
        inventory = raw.validate_all_owned_log(Path(check["log"]).read_text(), specification, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                "Required endpoint is not a theorem")
        graph = inventory["raw_occurrence_graph"]
        for key in ("all_serialized_occurrences_audited", "all_reachable_raw_variants_audited",
                    "all_nonidentical_raw_theorems_kernel_checked", "all_mixed_family_selected_theorems_kernel_checked",
                    "foreign_raw_variants_included", "axiom_cache_bypassed", "checked_kernel_negative_control_rejected"):
            require(graph[key] is True, "Incomplete raw audit: " + key)
        inventory_path = stage / "declaration-inventory.json"
        inventory_path.write_bytes(encoded(inventory))
        receipt.update({"audit_summary": inventory["summary"], "raw_occurrence_summary": graph["summary"],
                        "declaration_inventory_sha256": digest(inventory_path),
                        "audit_source_sha256": digest(audit_path), "all_reachable_raw_variants_audited": True})
        unchanged()
        for check in receipt["checks"].values():
            require(digest(check["log"]) == check["log_sha256"]
                    and digest(check["progress"]) == check["progress_sha256"], "Process evidence changed")
        require(digest(statements) == model["literal_statements_sha256"]
                and audit_path.read_text() == audit_source
                and digest(inventory_path) == receipt["declaration_inventory_sha256"], "Generated evidence changed")
        require(digest(stage / "baseline-authentication.json") == inputs["authentication_sha256"]
                and digest(stage / "baseline-receipt.json") == BASELINE_RECEIPT_SHA256, "Baseline records changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "project_modules": len(modules), "required_theorems": len(required),
                      "audit_summary": receipt["audit_summary"], "raw_occurrence_summary": graph["summary"],
                      "receipt_sha256": digest(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--artifact-dir", type=Path, required=True)
    parser.add_argument("--authentication", type=Path)
    parser.add_argument("--runtime", type=Path)
    parser.add_argument("--stage", type=Path)
    parser.add_argument("--plan", action="store_true")
    args = parser.parse_args()
    artifact = args.artifact_dir.resolve()
    authentication_path = (args.authentication or artifact.parent / "authentication.json").resolve()
    stage = (args.stage or ROOT / ".candidate-artifacts/li-hosted44-raw").resolve()
    model, controls = freeze_controls()
    helpers = load_helpers(controls)
    inputs = authenticate_inputs(artifact, authentication_path, model, helpers[0])
    if args.plan:
        print(json.dumps({"modules": inputs["modules"], "required": inputs["required"],
                          "modern": inputs["modern"], "baseline_receipt_sha256": BASELINE_RECEIPT_SHA256,
                          "raw_helper_sha256": RAW_HELPER_SHA256,
                          "proof_sources_recompiled": False, "stock_replay_performed_by_this_supplement": False}, indent=2))
        return
    verify(artifact, authentication_path, stage, args.runtime, model, controls, helpers, inputs)


if __name__ == "__main__":
    main()
