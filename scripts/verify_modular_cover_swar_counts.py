#!/usr/bin/env python3
"""Verify the universal SWAR population-count identity.

All project sources are rebuilt strictly in an empty stage. The complete owned
declaration inventory, including serialized private declarations, is audited.
Every project module is then an explicit unchanged-stock-checker target.
The result is a universal counter equality. This gate does not certify a
performance speedup, numerical support coverage or integer classification.
"""
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
import audit_lean_raw_occurrences as raw_audit
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens
from verify_renault_foundations import encoded, object_hashes as base_object_hashes, require, sha, source


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-cover-swar-counts-sources.json"
CONTROLLER = "scripts/verify_modular_cover_swar_counts.py"
WORKFLOW = ".github/workflows/lean-modular-cover-swar-counts.yml"
HELPERS = (
    "scripts/audit_lean_all_owned.py", "scripts/audit_lean_owned_extension.py",
    "scripts/audit_lean_raw_occurrences.py", "scripts/test_audit_lean_raw_occurrences.py",
    "scripts/test_modular_cover_swar_counts.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_renault_foundations.py", "scripts/replay_lean.py",
    "scripts/plan_lean_candidates.py", "scripts/verify_lean_candidate.py",
    "scripts/build_lean_parallel.py", "scripts/plan_accepted_lean.py",
)
CONFIGURATION = ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
POLICY = {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True, "zero_trust_source_and_raw_audit": True}
SCOPE = {"checkpoint": "modular_cover_swar_counts",
         "all_natural_population_counts_equal": True,
         "all_fuel_inputs_equal_to_original_byte_counter": True,
         "fast_branch_width": 512, "exact_original_fallback": True,
         "performance_speedup_verified": False,
         "initial_support_coverage_verified": False,
         "integer_classification_verified": False, "accepted_registry_changed": False}
TIMEOUT = 300
MEMORY = 3072
ROOTS = ["Conjectures.LonelinessModularCoverSwarCounts"]
COMMON = {"Conjectures.LonelinessModularCoverFastCounts",
          "Conjectures.LonelinessModularCoverByteCounts"}
REQUIRED = ['Loneliness.Modular.SupportSearch.Bits.Swar.masked_pair_chunk', 'Loneliness.Modular.SupportSearch.Bits.Swar.step_succ', 'Loneliness.Modular.SupportSearch.Bits.Swar.pair_sum_lt', 'Loneliness.Modular.SupportSearch.Bits.Swar.laneSum_step', 'Loneliness.Modular.SupportSearch.Bits.Swar.step_lt', 'Loneliness.Modular.SupportSearch.Bits.Swar.fast_count_mod_two', 'Loneliness.Modular.SupportSearch.Bits.Swar.laneSum_two_eq_count_mod', 'Loneliness.Modular.SupportSearch.Bits.Swar.swarSpec_eq_count_mod', 'Loneliness.Modular.SupportSearch.Bits.Swar.swar512_eq_spec', 'Loneliness.Modular.SupportSearch.Bits.Swar.swar512_eq_count_mod', 'Loneliness.Modular.SupportSearch.Bits.Swar.countWithFuel_eq', 'Loneliness.Modular.SupportSearch.Bits.Swar.count_eq_byte', 'Loneliness.Modular.SupportSearch.Bits.Swar.count_eq_fast', 'Loneliness.Modular.SupportSearch.Bits.Swar.count_eq', 'Loneliness.Modular.SupportSearch.Bits.Swar.count_eq_swar512']


def validate_model(model):
    require(model["schema"] == "modular-cover-swar-counts-sources-v1", "Unexpected source model")
    require(model["source_policy"] == POLICY and model["proof_scope"] == SCOPE,
            "SWAR count policy or claimed scope changed")
    require(model["roots"] == ROOTS and model["required_theorems"] == REQUIRED,
            "Frozen roots or required theorem inventory changed")
    require(len(REQUIRED) == len(set(REQUIRED)) == 15, "Required theorem inventory is not exact")
    require(tuple(audit.ALLOWED) == tuple(raw_audit.ALLOWED) == ALLOWED, "Standard axiom whitelist changed")
    require(model["runtime_sha256"] == {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256},
            "Pinned runtime model changed")
    modules = runtime.dependency_order(ROOTS)
    require(len(modules) == 3 and set(modules) == set(ROOTS) | COMMON,
            "Unreviewed SWAR-count dependency closure")
    require(set(model["source_sha256"]) == set(modules), "Source model has missing or extra modules")
    for module in modules:
        path = source(ROOT / "lean", module)
        require(path.is_file() and not path.is_symlink(), "Missing or linked source: " + module)
        require(sha(path) == model["source_sha256"][module], "Frozen source changed: " + module)
    controls = set(HELPERS + CONFIGURATION + (CONTROLLER, WORKFLOW))
    require(set(model["control_sha256"]) == controls, "Gate control inventory changed")
    for path, digest in model["control_sha256"].items():
        actual = ROOT / path
        require(actual.is_file() and not actual.is_symlink(), "Missing or linked control: " + path)
        require(sha(actual) == digest, "Frozen gate control changed: " + path)
    return modules



def file_names(root):
    result = set()
    for path in root.rglob("*"):
        require(not path.is_symlink(), "Linked stage entry: " + str(path))
        if path.is_file():
            result.add(path.relative_to(root).as_posix())
        else:
            require(path.is_dir(), "Special stage entry: " + str(path))
    return result


def source_inventory(stage, modules, audit_name=None):
    expected = {m.replace(".", "/") + ".lean" for m in modules}
    if audit_name is not None:
        expected.add(audit_name)
    require(file_names(stage / "src") == expected, "Whole staged source inventory differs")


def checked_objects(stage, modules, modern):
    objects = base_object_hashes(stage, modules, modern)
    expected = {m.replace(".", "/") + facet for m, facets in objects.items() for facet in facets}
    require(file_names(stage / "lib/lean") == expected, "Whole staged object inventory differs")
    return objects


def replay_names(text):
    return re.findall(r"^replaying (\S+)$", text, re.M)


def hosted_identity():
    keys = ("GITHUB_REPOSITORY", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT", "GITHUB_SHA",
            "GITHUB_WORKFLOW", "GITHUB_WORKFLOW_REF", "GITHUB_JOB")
    ci = {key: os.environ.get(key, "") for key in keys}
    require(os.environ.get("GITHUB_ACTIONS") == "true" and all(ci.values()),
            "Complete hosted run identity is required")
    require(ci["GITHUB_REPOSITORY"] == "1337isnot1337/solved-conjectures"
            and ci["GITHUB_RUN_ID"].isdigit() and ci["GITHUB_RUN_ATTEMPT"].isdigit()
            and re.fullmatch(r"[0-9a-f]{40}", ci["GITHUB_SHA"])
            and ci["GITHUB_WORKFLOW_REF"].startswith(ci["GITHUB_REPOSITORY"] + "/" + WORKFLOW + "@"),
            "Unexpected hosted repository, run, attempt or workflow")
    return ci


def audit_source(modules, modern):
    return raw_audit.augment_source(audit.audit_source(modules, REQUIRED, ["Loneliness."]),
        modules, modern, flavor="all_owned", legacy_prefixes=["Loneliness."])


def validate_audit(text, spec, modern):
    result = raw_audit.validate_all_owned_log(text, spec, modern)
    require(all(result.get(flag) is True for flag in ("all_owned_declarations_audited",
            "all_serialized_occurrences_audited", "exact_raw_private_visibility")),
            "Incomplete owned or serialized declaration audit")
    graph = result["raw_occurrence_graph"]
    require(all(graph.get(flag) is True for flag in ("all_reachable_raw_variants_audited",
            "all_nonidentical_raw_theorems_kernel_checked", "all_mixed_family_selected_theorems_kernel_checked",
            "foreign_raw_variants_included", "axiom_cache_bypassed", "checked_kernel_negative_control_rejected")),
            "Incomplete raw proof-family audit")
    require(graph["summary"]["trust_level"] == 0 and graph["summary"]["pending"] == 0
            and graph["summary"]["audit_root_modern"] is False, "Raw graph did not close at trust zero")
    require(all(result["declarations"][name]["kind"] == "theorem" for name in spec["required"]),
            "Required endpoint is not theorem-kind")
    return result


def inventory_bytes(payload, inventory, expected_sha):
    require(hashlib.sha256(payload).hexdigest() == expected_sha and payload == encoded(inventory),
            "Preserved raw inventory differs from exact canonical audit bytes")


def verify(model, modules, model_digest, stage, runtime_path):
    require(not stage.is_symlink(), "Artifact directory must not be a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for name in ("controls", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "modular-cover-swar-counts-receipt-v1", "status": "running", "proof_scope": SCOPE,
        "source_policy": POLICY, "roots": ROOTS, "project_modules": modules,
        "required_theorems": REQUIRED, "axiom_whitelist": list(ALLOWED),
        "source_workers": 1, "kernel_threads": 1, "memory_megabytes": MEMORY,
        "phase_timeout_seconds": TIMEOUT, "source_checks": {}, "kernel_checks": {},
        "swar_count_theorems_verified": False, "accepted_registry_changed": False,
    }

    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))

    def check(command, cwd, environment, label):
        log = stage / "logs" / (label + ".log")
        progress = stage / "progress" / (label + ".json")
        result = runtime.profile(command, cwd, environment, log, progress, TIMEOUT)
        result.update({"progress": str(progress), "progress_sha256": sha(progress)})
        return result

    def successful(result, label):
        require(result["exit_code"] == 0 and result["timed_out"] is False,
                label + " failed:\n" + Path(result["log"]).read_text()[-12000:])

    save()
    try:
        require(sha(ROOT / MODEL) == model_digest, "Source model changed after preflight")
        ci = hosted_identity()
        receipt["ci"] = ci
        controls = {**model["control_sha256"], MODEL: model_digest}
        commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
        require(commit == ci["GITHUB_SHA"], "Checkout differs from the hosted run")
        inputs = {**controls, **{"lean/" + module.replace(".", "/") + ".lean": digest
                                for module, digest in model["source_sha256"].items()}}
        for path, digest in inputs.items():
            blob = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
            require(hashlib.sha256(blob).hexdigest() == digest, "Input differs from recorded commit: " + path)
        receipt.update({"git_commit": commit, "commit_input_sha256": inputs, "gate_sha256": controls})
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Control changed after preflight: " + path)
            destination = stage / "controls" / path
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(ROOT / path, destination)
            require(sha(destination) == digest, "Copied control differs: " + path)
        source_hashes, modern = {}, {}
        for module in modules:
            origin, destination = source(ROOT / "lean", module), source(stage / "src", module)
            digest = model["source_sha256"][module]
            require(sha(origin) == digest, "Source changed after preflight: " + module)
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(origin, destination)
            require(sha(destination) == digest, "Copied source differs from model: " + module)
            source_hashes[module] = digest
            modern[module] = next(header_tokens(destination.read_text()), None) == "module"
        receipt.update({"source_sha256": source_hashes, "modern_modules": modern})
        compiler, external, identity = runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == LEAN_SHA256 and identity["checker_sha256"] == CHECKER_SHA256,
                "Compiler or unchanged stock checker differs from pinned binary")
        receipt.update({"toolchain": identity, "external_lean_path": external})
        environment = {**os.environ,
            "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
            "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
        source_inventory(stage, modules)
        save()
        for module in modules:
            output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY), "-DwarningAsError=true", "-t0",
                       "-o", str(output), module.replace(".", "/") + ".lean"]
            result = check(command, stage / "src", environment, module + ".source")
            receipt["source_checks"][module] = result
            save()
            successful(result, "Strict source " + module)
        frozen_objects = checked_objects(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        audit_text = audit_source(modules, modern)
        audit_path = stage / "src/ModularCoverSwarCountsAudit.lean"
        audit_path.write_text(audit_text)
        result = check([str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY),
                        "-DwarningAsError=true", "-t0", audit_path.name], stage / "src", environment, "all-owned-audit")
        receipt["axiom_audit"] = result
        save()
        successful(result, "All-owned private declaration audit")
        spec = {"modules": modules, "required": REQUIRED, "legacy_prefixes": ["Loneliness."]}
        inventory = validate_audit(Path(result["log"]).read_text(), spec, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in REQUIRED),
                "Required endpoint is not a theorem")
        inventory_path = stage / "declaration-inventory.json"
        inventory_path.write_bytes(encoded(inventory))
        result.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                       "complete_serialized_private_import": True, "summary": inventory["summary"],
                       "audit_source_sha256": sha(audit_path),
                       "declaration_inventory_sha256": sha(inventory_path),
                       "raw_graph_summary": inventory["raw_occurrence_graph"]["summary"],
                       "complete_raw_body_coverage": True})
        save()
        replayed = []
        for module in modules:
            require([name for name in modules if name == module or name.startswith(module + ".")] == [module],
                    "Stock checker target is not an exact singleton")
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            result = check(command, stage / "src", environment, module + ".kernel")
            receipt["kernel_checks"][module] = result
            save()
            successful(result, "Stock kernel replay " + module)
            actual = replay_names(Path(result["log"]).read_text())
            require(actual == [module], "Stock checker replay inventory differs: " + module)
            result.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Incomplete exact kernel closure")
        require(checked_objects(stage, modules, modern) == frozen_objects, "Compiled object bytes changed")
        source_inventory(stage, modules, audit_path.name)
        for module, digest in source_hashes.items():
            require(sha(source(stage / "src", module)) == digest, "Copied source changed: " + module)
            require(sha(source(ROOT / "lean", module)) == digest, "Original source changed: " + module)
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest and sha(stage / "controls" / path) == digest,
                    "Gate control changed: " + path)
        all_checks = [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]
        for result in all_checks:
            require(sha(result["log"]) == result["log_sha256"], "Verification log changed")
            require(sha(result["progress"]) == result["progress_sha256"], "Verification profile changed")
        revalidated = validate_audit(Path(receipt["axiom_audit"]["log"]).read_text(), spec, modern)
        inventory_bytes(inventory_path.read_bytes(), revalidated,
                        receipt["axiom_audit"]["declaration_inventory_sha256"])
        require(file_names(stage / "controls") == set(controls), "Copied control inventory changed")
        require(hosted_identity() == ci, "Hosted run identity changed")
        require(audit_path.read_text() == audit_text and sha(inventory_path) ==
                receipt["axiom_audit"]["declaration_inventory_sha256"], "Audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or unchanged stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Frozen checkout commit changed")
        receipt["evidence_sha256"] = {str(path.relative_to(stage)): sha(path)
            for path in stage.rglob("*") if path.is_file() and path.name != "receipt.json"}
        receipt.update({"status": "passed", "complete_raw_body_coverage": True,
                        "swar_count_theorems_verified": True,
                        "all_frozen_hashes_unchanged": True,
                        "kernel_replay": {"replayed_modules": replayed, "exact_project_closure": True,
                                          "all_modules_replayed_as_targets": True, "fresh_process_per_module": True}})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "roots": len(ROOTS), "modules": len(modules),
                      "required_theorems": len(REQUIRED), "swar_count_theorems_verified": True,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model = json.loads(model_bytes)
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "roots": len(ROOTS), "modules": len(modules),
                          "required_theorems": len(REQUIRED), "swar_count_theorems_verified": False}))
        return
    stage = args.artifact_dir or ROOT / ".candidate-artifacts/modular-cover-swar-counts"
    verify(model, modules, hashlib.sha256(model_bytes).hexdigest(), stage.resolve(), args.runtime)


if __name__ == "__main__":
    main()
