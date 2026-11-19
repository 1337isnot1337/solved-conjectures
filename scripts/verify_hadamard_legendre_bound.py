#!/usr/bin/env python3
"""Compose the verified quotient-133 component with the original multiplier bound.

The finite component is authenticated by its exact raw receipt and complete
sealed evidence. Its original source, audit, replay and CI provenance are kept.
The other 28 sources are compiled freshly. All 243 modules then receive a new
owned/private audit, a complete raw dependency graph with zero-trust kernel
checks of differing theorem bodies, and exact unchanged stock replay. Unpinned
or failed finite evidence cannot produce a verification receipt.
"""
from __future__ import annotations

import argparse
from collections import Counter
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import time

import audit_lean_all_owned as owned
import audit_lean_raw_occurrences as raw_owned
from build_lean_parallel import modern_module
from plan_lean_candidates import changed_sources
import verify_hadamard_quotient133_staged as finite

gate = finite.gate
ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/hadamard-legendre-bound-sources.json"
WORKFLOW = ".github/workflows/lean-hadamard-legendre-bound.yml"
CONTROLLER = "scripts/verify_hadamard_legendre_bound.py"
TESTS = "scripts/test_hadamard_legendre_bound.py"
TARGET = "Conjectures.HadamardLegendreMultiplierBound"
REQUIRED = [
    "HadamardLegendre.quotientData133_false",
    "HadamardLegendre.common_multiplier_card_ne_twenty_seven",
    "HadamardLegendre.common_multiplier_card_le_nine",
]
PREFIXES = ["HadamardLegendre.", "HadamardQuotient133.",
            "HadamardAutomorphism", "HadamardBorder"]
CONTROLS = finite.INPUTS | {CONTROLLER, TESTS, WORKFLOW,
                          "scripts/audit_lean_raw_occurrences.py"}
AUDIT_SOURCE = "src/HadamardLegendreBoundAudit.lean"
SCHEMA = 1
require = finite.require
digest = gate.digest


def finite_ready(spec):
    require(type(spec.get("run_id")) is int and spec["run_id"] > 0, "Invalid finite run")
    require(isinstance(spec.get("commit"), str)
            and re.fullmatch(r"[0-9a-f]{40}", spec["commit"]), "Invalid finite commit")
    require(spec.get("artifact_name") == "hadamard-quotient133-main-receipt",
            "Unexpected finite artifact name")
    pending = ("artifact_id", "receipt_sha256", "run_attempt", "workflow_ref")
    if all(spec.get(key) is None for key in pending):
        return False
    require(type(spec.get("artifact_id")) is int and spec["artifact_id"] > 0,
            "Invalid finite artifact ID")
    require(type(spec.get("run_attempt")) is int and spec["run_attempt"] > 0,
            "Invalid finite run attempt")
    require(isinstance(spec.get("receipt_sha256"), str)
            and re.fullmatch(r"[0-9a-f]{64}", spec["receipt_sha256"]),
            "Missing exact finite receipt digest")
    require(isinstance(spec.get("workflow_ref"), str)
            and spec["workflow_ref"].startswith(finite.REPOSITORY + "/" +
                ".github/workflows/lean-hadamard-quotient133-candidates.yml@"),
            "Unexpected finite workflow")
    return True


def preflight(*, require_ready=False):
    require(gate.ROOT == ROOT, "Imported gate resolves another checkout")
    model = json.loads((ROOT / MODEL).read_text())
    require(model.get("schema") == SCHEMA and model.get("target") == TARGET,
            "Wrong bound source model")
    require(model.get("required_theorems") == REQUIRED, "Changed bound endpoints")
    modules = gate.dependency_order(TARGET)
    finite_modules = gate.dependency_order(gate.TASKS["main"][0])
    require(model.get("project_modules") == modules and len(modules) == 243,
            "Changed complete bound closure")
    require(model.get("finite_modules") == finite_modules and len(finite_modules) == 215,
            "Changed finite dependency closure")
    require(set(finite_modules) <= set(modules), "Finite component outside bound closure")
    fresh = [module for module in modules if module not in set(finite_modules)]
    require(model.get("fresh_modules") == fresh and len(fresh) == 28
            and TARGET in fresh, "Changed fresh-source coverage")
    require(not any(module.endswith(("OrderNineGroup", "OrderNineOrbits"))
                    for module in modules), "Unrelated auxiliary scope imported")
    sources = {module: digest(gate.source(module)) for module in modules}
    controls = {path: digest(ROOT / path) for path in sorted(CONTROLS)}
    require(model.get("source_sha256") == sources, "Source differs from frozen bound model")
    require(model.get("gate_sha256") == controls, "Control differs from frozen bound model")
    require(model.get("runtime") == {
        "lean_sha256": finite.LEAN_SHA256, "checker_sha256": finite.CHECKER_SHA256},
        "Changed bound runtime")
    require(model.get("accepted_registry_changed") is False,
            "Candidate model overstates registration")
    ready = finite_ready(model["finite_dependency"])
    require(not require_ready or ready, "Finite dependency has not been authenticated and pinned")
    return model, modules, finite_modules, fresh, sources, controls, ready


def ci_identity(commit):
    require(os.environ.get("GITHUB_REPOSITORY") == finite.REPOSITORY
            and os.environ.get("GITHUB_SHA") == commit, "Workflow/checkout identity mismatch")
    result = {"repository": finite.REPOSITORY, "sha": commit}
    for variable, key in (("GITHUB_RUN_ID", "run_id"), ("GITHUB_RUN_ATTEMPT", "run_attempt")):
        text = os.environ.get(variable, "")
        require(text.isascii() and text.isdecimal() and int(text) > 0,
                "Missing bound workflow identity")
        result[key] = int(text)
    workflow = os.environ.get("GITHUB_WORKFLOW_REF", "")
    require(workflow.startswith(finite.REPOSITORY + "/" + WORKFLOW + "@"),
            "Unexpected bound workflow")
    result["workflow_ref"] = workflow
    return result


def expected_finite_ci(spec):
    return {"repository": finite.REPOSITORY, "sha": spec["commit"],
            "run_id": spec["run_id"], "run_attempt": spec["run_attempt"],
            "workflow_ref": spec["workflow_ref"]}


def validate_finite_header(receipt, spec, modules, sources, controls, modern):
    require(finite_ready(spec), "Unpinned finite dependency")
    require(receipt.get("schema") == finite.SCHEMA
            and receipt.get("phase") == "complete-verification"
            and receipt.get("task") == "main"
            and receipt.get("status") == "passed", "Finite complete verification did not pass")
    require(receipt.get("commit") == spec["commit"]
            and receipt.get("ci") == expected_finite_ci(spec), "Finite provenance mismatch")
    require(receipt.get("target") == gate.TASKS["main"][0]
            and receipt.get("required_theorems") == gate.TASKS["main"][1],
            "Finite theorem scope mismatch")
    require(receipt.get("project_modules") == modules
            and receipt.get("checked_sources") == modules, "Incomplete finite source closure")
    require(receipt.get("source_sha256") == sources
            and receipt.get("gate_sha256") == controls
            and receipt.get("modern_modules") == modern,
            "Finite source/control/facet metadata mismatch")
    require(receipt.get("source_failures") == {}
            and receipt.get("accepted_registry_changed") is False,
            "Finite failure or registration overclaim")
    runtime = receipt.get("runtime", {})
    require(runtime.get("lean_sha256") == finite.LEAN_SHA256
            and runtime.get("checker_sha256") == finite.CHECKER_SHA256,
            "Finite runtime is not the pinned runtime")
    for name in ("producer_reproduction", "axiom_audit", "kernel_replay"):
        require(finite.successful(receipt.get(name, {})), "Unsuccessful finite check: " + name)
    audit = receipt["axiom_audit"]
    require(all(audit.get(key) is True for key in
                ("all_owned_declarations_audited", "exact_raw_private_visibility",
                 "complete_serialized_private_import")), "Incomplete finite declaration audit")
    replay = receipt["kernel_replay"]
    require(replay.get("exact_target_multiset") is True
            and replay.get("unchanged_stock_checker") is True
            and replay.get("stock_prefix") == "Conjectures"
            and Counter(replay.get("replayed_modules", [])) == Counter(modules),
            "Incomplete finite kernel replay")


def replay_command(compiler):
    command = [str(compiler / "bin/leanchecker"), "-v", "Conjectures"]
    if buffer := shutil.which("stdbuf"):
        command = [buffer, "-oL", "-eL", *command]
    return command


def replay_names(log, modules):
    actual = re.findall(r"^replaying (\S+)$", log, re.M)
    require(Counter(actual) == Counter(modules) and len(actual) == len(set(actual)),
            "Exact stock replay module multiset mismatch")
    return actual


def verify_source_inventory(stage, modules, audit_relative=None):
    expected = {module.replace(".", "/") + ".lean" for module in modules}
    if audit_relative is not None:
        require(isinstance(audit_relative, str) and audit_relative.startswith("src/")
                and audit_relative.count("/") == 1 and audit_relative.endswith(".lean")
                and "\\" not in audit_relative,
                "Invalid authorized audit source path")
        expected.add(audit_relative[len("src/"):])
    for directory, authorized in (("src", expected), ("generated", set())):
        folder = stage / directory
        require(not folder.is_symlink(), "Indirect source directory")
        if not folder.exists():
            require(not authorized, "Missing source directory")
            continue
        require(folder.is_dir(), "Source directory is not a directory")
        actual = set()
        for path in folder.rglob("*"):
            require(not path.is_symlink(), "Indirect staged source path")
            if path.is_file():
                actual.add(path.relative_to(folder).as_posix())
        require(actual == authorized, "Exact whole-directory source inventory differs: " + directory)


def audit_text(modules, required, prefixes):
    """Keep the original finite gate's visible-declaration auditor unchanged."""
    text = owned.audit_source(modules, required, prefixes)
    options = "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n"
    require(text.count(options) == 1, "Audit renderer option policy changed")
    return text.replace(options, "")


def bound_audit_text(modules, modern):
    return raw_owned.augment_source(audit_text(modules, REQUIRED, PREFIXES),
        modules, modern, flavor="all_owned", legacy_prefixes=PREFIXES)


def bound_audit_command(compiler, source_name):
    return [str(compiler / "bin/lean"), "-t0", "-j1", "-M4500",
            "-DwarningAsError=true", source_name]


def require_raw_audit(inventory):
    graph = inventory.get("raw_occurrence_graph")
    require(isinstance(graph, dict), "Bound audit lacks the complete raw dependency graph")
    flags = ("all_serialized_occurrences_audited", "all_reachable_raw_variants_audited",
             "all_nonidentical_raw_theorems_kernel_checked",
             "all_mixed_family_selected_theorems_kernel_checked", "foreign_raw_variants_included",
             "axiom_cache_bypassed", "checked_kernel_negative_control_rejected")
    require(inventory.get("all_serialized_occurrences_audited") is True
            and all(graph.get(flag) is True for flag in flags),
            "Bound audit lacks complete checked raw-proof coverage")
    summary = graph.get("summary", {})
    require(type(summary.get("trust_level")) is int and summary["trust_level"] == 0
            and type(summary.get("pending")) is int and summary["pending"] == 0
            and summary.get("audit_root_modern") is False,
            "Bound raw audit did not finish with complete private imports at kernel trust zero")
    return graph


def check_evidence_record(folder, record):
    require(finite.successful(record), "Unsuccessful preserved check")
    for field, prefix, digest_field in (
            ("log_relative", "logs/", "log_sha256"),
            ("progress_relative", "progress/", "progress_sha256")):
        relative = record[field]
        require(isinstance(relative, str) and relative.startswith(prefix)
                and "\\" not in relative
                and all(part not in ("", ".", "..") for part in relative.split("/")),
                "Invalid check evidence path")
        path = folder / relative
        require(path.is_file() and not path.is_symlink()
                and digest(path) == record[digest_field], "Check evidence changed")
    profile = json.loads((folder / record["progress_relative"]).read_text())
    require(profile == {key: value for key, value in record.items()
                        if key != "progress_sha256" and key in profile},
            "Profile differs from its recorded check")


def verify_finite_seal(folder, spec, receipt):
    for name, expected in (("receipt.json", spec["receipt_sha256"]),
                           ("receipt.sha256", None)):
        path = folder / name
        require(path.is_file() and not path.is_symlink(), "Indirect finite receipt evidence")
        if expected is not None:
            require(digest(path) == expected, "Finite raw receipt changed")
        else:
            require(path.read_text() == spec["receipt_sha256"] + "\n",
                    "Finite receipt sidecar changed")
    require(finite.file_inventory(folder) == receipt.get("evidence_sha256"),
            "Finite sealed member inventory mismatch")


def authenticate_finite(folder, spec, modules, sources, controls, modern):
    require(folder.is_dir() and not folder.is_symlink(), "Missing finite artifact directory")
    raw = folder / "receipt.json"
    require(raw.is_file() and not raw.is_symlink()
            and digest(raw) == spec["receipt_sha256"], "Finite raw receipt digest mismatch")
    require((folder / "receipt.sha256").read_text() == spec["receipt_sha256"] + "\n",
            "Finite receipt sidecar mismatch")
    receipt = json.loads(raw.read_text())
    validate_finite_header(receipt, spec, modules, sources, controls, modern)
    verify_finite_seal(folder, spec, receipt)
    for module in modules:
        relative = "src/" + module.replace(".", "/") + ".lean"
        require(digest(folder / relative) == sources[module], "Finite source bytes changed")
    for path, expected in controls.items():
        require(digest(folder / "controls" / path) == expected, "Finite control bytes changed")
    verify_source_inventory(folder, modules, "src/HadamardQuotient133Audit.lean")
    objects = finite.object_hashes(folder, modules, modern)
    require(objects == receipt.get("object_sha256"), "Finite checked objects changed")
    require(set(receipt.get("source_stage_receipt_sha256", {})) == set(finite.STAGES),
            "Missing finite source-stage receipts")
    require(set(receipt.get("source_stage_provenance", {})) == set(finite.STAGES),
            "Missing finite source-stage provenance")
    covered = set()
    shared = {}
    for name in finite.STAGES:
        stage_folder = folder / "source-stages" / name
        stage_receipt_path = stage_folder / "receipt.json"
        require(digest(stage_receipt_path) == receipt["source_stage_receipt_sha256"][name],
                "Finite source-stage receipt changed")
        prior = json.loads(stage_receipt_path.read_text())
        stage_modules = gate.dependency_order(finite.STAGE_TARGETS[name])
        stage_sources = {module: sources[module] for module in stage_modules}
        stage_modern = {module: modern[module] for module in stage_modules}
        stage_objects = finite.validate_manifest(prior, name, spec["commit"],
            stage_modules, stage_sources, controls, receipt["ci"], receipt["runtime"], stage_modern)
        finite.authenticate_stage(stage_folder, prior, name, stage_modules,
                                  stage_sources, controls, stage_objects)
        verify_source_inventory(stage_folder, stage_modules)
        require(receipt["source_stage_provenance"][name] == prior["ci"],
                "Finite source-stage provenance record changed")
        for path, expected in stage_objects.items():
            require(path not in shared or shared[path] == expected,
                    "Finite shared source objects disagree")
            require(objects[path] == expected, "Finite aggregate uses another source-stage object")
            shared[path] = expected
        covered.update(stage_modules)
    remaining = [module for module in modules if module not in covered]
    require(receipt.get("source_stage_modules") == sorted(covered)
            and receipt.get("assembly_checked_sources") == remaining,
            "Finite source/assembly coverage mismatch")
    checks = receipt.get("source_checks", {})
    require(set(checks) == set(remaining) and all(finite.successful(row) for row in checks.values()),
            "Missing successful finite assembly sources")
    compiler = Path(receipt["runtime"]["lean_path"]).parent.parent
    original = ROOT / ".candidate-artifacts/hadamard-quotient133-main"
    for module in remaining:
        require(checks[module]["command"] == finite.source_command(compiler, original, module),
                "Finite assembly source command changed")
    finite.recheck_evidence(folder, receipt)
    require(receipt["producer_reproduction"]["command"] ==
            ["node", str(ROOT / "scripts/generate_hadamard_quotient133.mjs"), "--check"],
            "Finite producer command changed")
    expected_audit = audit_text(modules, gate.TASKS["main"][1], ["HadamardQuotient133."])
    require((folder / "src/HadamardQuotient133Audit.lean").read_text() == expected_audit,
            "Finite audit source differs from frozen renderer")
    audit = receipt["axiom_audit"]
    inventory = owned.validate_log((folder / audit["log_relative"]).read_text(),
        {"modules": modules, "required": gate.TASKS["main"][1],
         "legacy_prefixes": ["HadamardQuotient133."]}, modern)
    require(json.loads((folder / "declaration-inventory.json").read_text()) == inventory
            and audit["summary"] == inventory["summary"],
            "Finite declaration inventory differs from its raw audit")
    require(all(inventory["declarations"][name]["kind"] == "theorem"
                for name in gate.TASKS["main"][1]), "Finite required endpoint is not a theorem")
    replay = receipt["kernel_replay"]
    actual = replay_names((folder / replay["log_relative"]).read_text(), modules)
    require(actual == replay["replayed_modules"], "Finite replay record differs from its stock log")
    command = replay["command"]
    expected = [receipt["runtime"]["checker_path"], "-v", "Conjectures"]
    require(command == expected or
            (len(command) == 6 and Path(command[0]).name == "stdbuf"
             and command[1:3] == ["-oL", "-eL"] and command[3:] == expected),
            "Finite replay command differs from the stock prefix command")
    return receipt, objects


def audit_and_replay(stage, modules, modern, compiler, env, receipt, deadline):
    path = stage / AUDIT_SOURCE
    path.write_text(bound_audit_text(modules, modern))
    verify_source_inventory(stage, modules, AUDIT_SOURCE)
    result = finite.check(bound_audit_command(compiler, path.name),
                          stage, env, "all-owned-audit", deadline)
    require(finite.successful(result), "Bound owned/private and checked raw-proof audit failed")
    inventory = raw_owned.validate_all_owned_log((stage / result["log_relative"]).read_text(),
        {"modules": modules, "required": REQUIRED, "legacy_prefixes": PREFIXES}, modern)
    graph = require_raw_audit(inventory)
    require(all(inventory["declarations"][name]["kind"] == "theorem" for name in REQUIRED),
            "Bound endpoint is not a theorem")
    finite.write_json(stage / "declaration-inventory.json", inventory)
    result.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                   "complete_serialized_private_import": True, "summary": inventory["summary"],
                   "all_serialized_occurrences_audited": True,
                   "all_reachable_raw_variants_audited": True,
                   "all_nonidentical_raw_theorems_kernel_checked": True,
                   "all_mixed_family_selected_theorems_kernel_checked": True,
                   "foreign_raw_variants_included": True, "axiom_cache_bypassed": True,
                   "checked_kernel_negative_control_rejected": True, "kernel_trust_level": 0,
                   "raw_graph_summary": graph["summary"],
                   "audit_source_sha256": digest(path),
                   "declaration_inventory_sha256": digest(stage / "declaration-inventory.json")})
    receipt["axiom_audit"] = result
    receipt["completed_checks"].append(
        "complete 243-module owned/private and raw-variant dependency audit with zero-trust kernel checks")
    finite.save_receipt(stage, receipt)
    result = finite.check(replay_command(compiler), stage, env, "kernel-replay", deadline)
    require(finite.successful(result), "Bound stock kernel replay failed")
    actual = replay_names((stage / result["log_relative"]).read_text(), modules)
    result.update({"replayed_modules": actual, "exact_target_multiset": True,
                   "unchanged_stock_checker": True, "stock_prefix": "Conjectures"})
    receipt["kernel_replay"] = result
    receipt["completed_checks"].append("exact 243-module unchanged stock kernel replay")


def recheck_bound_evidence(stage, receipt):
    for row in receipt["source_checks"].values():
        check_evidence_record(stage, row)
    for key in ("axiom_audit", "kernel_replay"):
        check_evidence_record(stage, receipt[key])
    for relative, key in ((AUDIT_SOURCE, "audit_source_sha256"),
                           ("declaration-inventory.json", "declaration_inventory_sha256")):
        path = stage / relative
        require(path.is_file() and not path.is_symlink()
                and digest(path) == receipt["axiom_audit"][key],
                "Bound audit source/inventory changed")


def composed_object_hashes(stage, modules, modern, reused):
    objects = finite.object_hashes(stage, modules, modern)
    require({path: objects.get(path) for path in reused} == reused,
            "Authenticated finite objects changed during fresh compilation")
    return objects


def verify(folder):
    model, modules, finite_modules, fresh, sources, controls, _ = preflight(require_ready=True)
    inputs = {**controls, MODEL: digest(ROOT / MODEL)}
    commit = gate.revision()
    ci = ci_identity(commit)
    finite.assert_head_inputs(commit, modules, sources, inputs)
    compiler, external, runtime = finite.resolve_runtime()
    modern = {module: modern_module(gate.source(module)) for module in modules}
    stage = ROOT / ".candidate-artifacts/hadamard-legendre-bound"
    finite.prepare(stage, modules, sources, inputs)
    verify_source_inventory(stage, modules)
    env = finite.environment(compiler, external, stage)
    receipt = {"schema": SCHEMA, "task": "legendre-multiplier-bound",
        "phase": "authenticated-component-composition", "status": "running",
        "commit": commit, "ci": ci, "target": TARGET, "required_theorems": REQUIRED,
        "project_modules": modules, "source_sha256": sources, "gate_sha256": inputs,
        "modern_modules": modern, "runtime": runtime, "completed_checks": [],
        "source_verification": {"reused_complete_component": finite_modules,
                                "fresh_source_checks": fresh},
        "accepted_registry_changed": False, "hadamard_existence_claimed": False}
    finite.save_receipt(stage, receipt)
    deadline = time.monotonic() + finite.JOB_SECONDS
    finite_sources = {module: sources[module] for module in finite_modules}
    finite_controls = {path: controls[path] for path in sorted(finite.INPUTS)}
    finite_modern = {module: modern[module] for module in finite_modules}
    spec = model["finite_dependency"]
    try:
        prior, objects = authenticate_finite(folder, spec, finite_modules, finite_sources,
                                             finite_controls, finite_modern)
        archived = stage / "finite-dependency"
        shutil.copytree(folder, archived)
        verify_finite_seal(archived, spec, prior)
        for relative, expected in objects.items():
            source = archived / "lib/lean" / relative
            destination = stage / "lib/lean" / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, destination)
            require(digest(destination) == expected, "Authenticated object changed during copy")
        receipt["finite_dependency"] = {**spec, "original_ci": prior["ci"],
            "original_runtime": prior["runtime"],
            "authentication": "exact raw receipt SHA256 and complete sealed member inventory",
            "source_gate_schema": prior["schema"],
            "source_stage_provenance": prior["source_stage_provenance"],
            "owned_audit_summary": prior["axiom_audit"]["summary"],
            "original_audit_scope": "selected owned declarations and serialized name/private visibility",
            "raw_bodies_rechecked_by": "fresh complete-closure raw graph and zero-trust kernel aliases"}
        receipt["completed_checks"].append("authenticated complete passing 215-module finite component")
        finite.compile_sources(fresh, compiler, stage, env, receipt, deadline)
        receipt["fresh_checked_sources"] = list(receipt["checked_sources"])
        receipt["source_covered_modules"] = modules
        receipt["completed_checks"].append("28 fresh strict sources, warnings treated as errors")
        all_objects = composed_object_hashes(stage, modules, modern, objects)
        receipt["object_sha256"] = all_objects
        audit_and_replay(stage, modules, modern, compiler, env, receipt, deadline)
        finite.recheck(stage, modules, sources, inputs, all_objects, modern, compiler, commit)
        verify_source_inventory(stage, modules, AUDIT_SOURCE)
        recheck_bound_evidence(stage, receipt)
        verify_finite_seal(archived, spec, prior)
        receipt["status"] = "passed"
        finite.save_receipt(stage, receipt, seal=True)
    except BaseException as error:
        receipt["status"] = "failed"
        receipt["error"] = str(error)
        finite.save_receipt(stage, receipt)
        raise
    print("PASS original length-1197 common multiplier bound: authenticated finite component, "
          "28 fresh sources, complete 243-module audit and stock replay", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("artifact", nargs="?", type=Path)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    args = parser.parse_args()
    if args.preflight or args.plan_ci:
        model, modules, finite_modules, fresh, _, _, ready = preflight()
        selected = ready
        if args.plan_ci and os.environ.get("GITHUB_EVENT_NAME") != "workflow_dispatch":
            changed = changed_sources()
            watched = CONTROLS | {MODEL} | {
                str(gate.source(module).relative_to(ROOT)) for module in modules}
            selected = ready and (changed is None or bool(set(changed) & watched))
        result = {"ready": ready, "selected": selected, "project_modules": len(modules),
                  "authenticated_dependency_modules": len(finite_modules),
                  "fresh_modules": len(fresh), "required_theorems": len(REQUIRED),
                  "finite_dependency": model["finite_dependency"],
                  "verification_receipt_created": False}
        print(json.dumps(result, sort_keys=True))
        if args.plan_ci and (output := os.environ.get("GITHUB_OUTPUT")):
            with open(output, "a") as handle:
                handle.write("selected=" + str(selected).lower() + "\n")
                handle.write("artifact_id=" + str(model["finite_dependency"]["artifact_id"] or "") + "\n")
                handle.write("run_id=" + str(model["finite_dependency"]["run_id"]) + "\n")
        return
    if args.artifact is None:
        parser.error("a complete finite artifact directory is required")
    verify(args.artifact)


if __name__ == "__main__":
    main()
