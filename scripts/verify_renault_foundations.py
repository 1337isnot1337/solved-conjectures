#!/usr/bin/env python3
"""Fresh strict-source, private-declaration and stock-kernel foundation gate.

This checkpoint covers the explicitly frozen Renault foundations. It does not
assert the five-speed bound and does not edit an accepted-module registry.
Every project dependency is rebuilt and replayed as an exact kernel target.
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
import sys

import audit_lean_all_owned as audit
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/renault-foundations-sources.json"
CONTROLLER = "scripts/verify_renault_foundations.py"
WORKFLOW = ".github/workflows/lean-renault-foundations.yml"
PRODUCERS = (
    "scripts/generate_renault_phase_certificates.py",
    "scripts/generate_renault_small_phase_certificates.py",
)
HELPERS = (
    "scripts/audit_lean_all_owned.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/replay_lean.py", "scripts/plan_lean_candidates.py",
    "scripts/verify_lean_candidate.py", "scripts/build_lean_parallel.py",
    "scripts/plan_accepted_lean.py",
)
CONFIGURATION = ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
POLICY = {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True}
SCOPE = {"checkpoint": "frozen_renault_foundations", "complete_five_speed_bound": False,
         "accepted_registry_changed": False}
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")
TIMEOUT = 1800
MEMORY = 4500
ROOT_ENDPOINTS = {
    "PhaseCells": (
        "distance_strict_of_cell", "distance_eq_min_fract", "distance_nat_mul_distance",
        "distance_mul_fract_eq", "distance_of_unit_interval", "distance_add_half",
        "three_five_distance_band", "double_half_strict_of_outer", "two_odd_phase_improvement",
        "PhaseAction.good_fract_iff", "phaseActionCheck_sound", "phaseMaskCheck_sound",
        "PhaseCover.check_sound", "exists_set_bit", "phaseTripleCheck_sound", "phase_three_covers",
    ),
    "PhaseCertificates": tuple("phase_lemma_" + name for name in
                               ("5_1", "5_2", "5_3", "6_1", "6_2", "6_3", "6_4", "6_5")),
    "SmallPhases": ("exists_small_multiplier_unsafe", "three_even_shift_phase"),
    "Maximizer": (
        "exists_constrained_maximum", "exists_positive_feasible", "exists_positive_maximizer",
        "maximizer_has_upper_boundary", "exists_maximizer_with_upper_boundary",
    ),
    "Affine": (
        "distance_time_affine_six", "fract_time_affine_six", "fract_int_mul_fract",
        "fract_nat_mul_fract", "distance_time_add_of_dvd", "fract_time_add_of_dvd",
    ),
    "TwoMultiples": (
        "exists_phase_fiber_maximum", "distance_div_nat_eq_zero_iff",
        "phase_fiber_zero_divisibility", "two_multiple_final_times",
    ),
    "TwoMultiplesPhase": (
        "small_multiple_distance_gt", "ordered_phase_band", "phase_fiber_affine_six",
        "phase_fiber_odd_multiple", "phase_fiber_multiplier_distance",
    ),
    "Preliminaries": (
        "exists_nearby_safe", "distance_rational_shift_of_dvd", "distance_third_shift_of_dvd",
        "third_unsafe_unique", "endpoint_third_shift_safe", "endpoint_runner_third_shift_safe",
        "exists_third_shift_of_at_most_two", "exists_third_shift_of_two_unsafe",
        "exists_third_shift_of_endpoint",
    ),
    "GcdOrbit": ("gcd_orbit_point",),
    "ThirdObstructions": ("third_shift_safe_of_initial_le", "exists_third_shift_of_three_close"),
    "Reindex": (
        "allSafe_reindex_iff", "exists_allSafe_reindex_iff", "foldr_gcd_ofFn_reindex",
        "primitive_reindex_iff", "card_filter_equiv", "exists_reindex_two",
    ),
}
ROOTS = ["Conjectures.LonelinessRenault" + suffix for suffix in ROOT_ENDPOINTS]
COMMON = {
    "Conjectures.Loneliness", "Conjectures.LonelinessContinuity", "Conjectures.LonelinessFiveFamily",
    "Conjectures.LonelinessCriticalBase", "Conjectures.LonelinessCriticalSecond",
    "Conjectures.LonelinessCriticalFamilies", "Conjectures.LonelinessNormalization",
}
REQUIRED = sorted("Loneliness.Renault." + name
                  for names in ROOT_ENDPOINTS.values() for name in names)


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def source(base, module):
    return base / (module.replace(".", "/") + ".lean")


def validate_model(model):
    require(model["schema"] == "renault-foundations-sources-v1", "Unexpected source model")
    require(model["source_policy"] == POLICY and model["proof_scope"] == SCOPE,
            "Foundation policy or claimed scope changed")
    require(model["roots"] == ROOTS and model["required_theorems"] == REQUIRED,
            "Frozen roots or required theorem inventory changed")
    require(len(REQUIRED) == len(set(REQUIRED)), "Duplicate required theorem")
    require(tuple(audit.ALLOWED) == ALLOWED, "Standard axiom whitelist changed")
    require(model["runtime_sha256"] == {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256},
            "Pinned runtime model changed")
    modules = runtime.dependency_order(ROOTS)
    require(set(modules) == set(ROOTS) | COMMON, "Unreviewed foundation dependency closure")
    require(set(model["source_sha256"]) == set(modules), "Source model has missing or extra modules")
    for module in modules:
        path = source(ROOT / "lean", module)
        require(path.is_file() and not path.is_symlink(), "Missing or linked source: " + module)
        require(sha(path) == model["source_sha256"][module], "Frozen source changed: " + module)
    controls = set(PRODUCERS + HELPERS + CONFIGURATION + (CONTROLLER, WORKFLOW))
    require(set(model["control_sha256"]) == controls, "Gate control inventory changed")
    for path, digest in model["control_sha256"].items():
        actual = ROOT / path
        require(actual.is_file() and not actual.is_symlink(), "Missing or linked control: " + path)
        require(sha(actual) == digest, "Frozen gate control changed: " + path)
    return modules


def object_hashes(stage, modules, modern):
    result = {}
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        result[module] = {}
        for facet in FACETS:
            path = Path(str(stem) + facet)
            require(not path.is_symlink(), "Linked project object: " + str(path))
            if path.is_file():
                result[module][facet] = sha(path)
        expected = set(FACETS[:3]) if modern[module] else {".olean"}
        require(expected <= set(result[module]), "Missing object facets: " + module)
        require((".olean.private" in result[module]) == (".olean.server" in result[module]),
                "Incomplete private/server pair: " + module)
    found = set()
    for path in (stage / "lib/lean/Conjectures").rglob("*"):
        require(not path.is_symlink(), "Linked entry in project object tree: " + str(path))
        if path.is_file():
            for facet in FACETS:
                if path.name.endswith(facet):
                    name = str(path.relative_to(stage / "lib/lean"))[:-len(facet)]
                    found.add(name.replace(os.sep, "."))
                    break
    require(found == set(modules), "Project object closure has missing or extra modules")
    return result


def verify(model, modules, model_digest, stage, runtime_path):
    require(not stage.is_symlink(), "Artifact directory must not be a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for name in ("controls", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "renault-foundations-receipt-v1", "status": "running", "proof_scope": SCOPE,
        "source_policy": POLICY, "roots": ROOTS, "project_modules": modules,
        "required_theorems": REQUIRED, "axiom_whitelist": list(ALLOWED),
        "source_workers": 1, "kernel_threads": 1, "memory_megabytes": MEMORY,
        "phase_timeout_seconds": TIMEOUT, "source_checks": {}, "kernel_checks": {},
        "reproduction_checks": {}, "complete_five_speed_bound_verified": False,
        "accepted_registry_changed": False,
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
        controls = {**model["control_sha256"], MODEL: model_digest}
        commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
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
        save()
        for path in PRODUCERS:
            result = check([sys.executable, str(ROOT / path), "--repo", str(ROOT), "--check"],
                           ROOT, environment, Path(path).stem + ".reproduction")
            receipt["reproduction_checks"][path] = result
            save()
            successful(result, "Certificate payload reproduction")
        for module in modules:
            output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY), "-DwarningAsError=true",
                       "-o", str(output), module.replace(".", "/") + ".lean"]
            result = check(command, stage / "src", environment, module + ".source")
            receipt["source_checks"][module] = result
            save()
            successful(result, "Strict source " + module)
        frozen_objects = object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        audit_text = audit.audit_source(modules, REQUIRED, ["Loneliness."])
        audit_path = stage / "src/RenaultFoundationsAudit.lean"
        audit_path.write_text(audit_text)
        result = check([str(compiler / "bin/lean"), "-j1", "-M" + str(MEMORY),
                        "-DwarningAsError=true", audit_path.name], stage / "src", environment, "all-owned-audit")
        receipt["axiom_audit"] = result
        save()
        successful(result, "All-owned private declaration audit")
        spec = {"modules": modules, "required": REQUIRED, "legacy_prefixes": ["Loneliness."]}
        inventory = audit.validate_log(Path(result["log"]).read_text(), spec, modern, allowed=ALLOWED)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in REQUIRED),
                "Required endpoint is not a theorem")
        inventory_path = stage / "declaration-inventory.json"
        inventory_path.write_bytes(encoded(inventory))
        result.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                       "complete_serialized_private_import": True, "summary": inventory["summary"],
                       "audit_source_sha256": sha(audit_path),
                       "declaration_inventory_sha256": sha(inventory_path)})
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
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", Path(result["log"]).read_text(), re.M)
            require(actual == [module], "Stock checker replay inventory differs: " + module)
            result.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Incomplete exact kernel closure")
        require(object_hashes(stage, modules, modern) == frozen_objects, "Compiled object bytes changed")
        found_sources = {".".join(path.relative_to(stage / "src").with_suffix("").parts)
                         for path in (stage / "src/Conjectures").rglob("*.lean")}
        require(found_sources == set(modules), "Copied source inventory changed")
        for module, digest in source_hashes.items():
            require(sha(source(stage / "src", module)) == digest, "Copied source changed: " + module)
            require(sha(source(ROOT / "lean", module)) == digest, "Original source changed: " + module)
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest and sha(stage / "controls" / path) == digest,
                    "Gate control changed: " + path)
        all_checks = [*receipt["reproduction_checks"].values(), *receipt["source_checks"].values(),
                      receipt["axiom_audit"], *receipt["kernel_checks"].values()]
        for result in all_checks:
            require(sha(result["log"]) == result["log_sha256"], "Verification log changed")
            require(sha(result["progress"]) == result["progress_sha256"], "Verification profile changed")
        require(audit_path.read_text() == audit_text and sha(inventory_path) ==
                receipt["axiom_audit"]["declaration_inventory_sha256"], "Audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or unchanged stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Frozen checkout commit changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "kernel_replay": {"replayed_modules": replayed, "exact_project_closure": True,
                                          "all_modules_replayed_as_targets": True, "fresh_process_per_module": True}})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "roots": len(ROOTS), "modules": len(modules),
                      "required_theorems": len(REQUIRED), "complete_five_speed_bound_verified": False,
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
                          "required_theorems": len(REQUIRED), "complete_five_speed_bound_verified": False}))
        return
    stage = args.artifact_dir or ROOT / ".candidate-artifacts/renault-foundations"
    verify(model, modules, hashlib.sha256(model_bytes).hexdigest(), stage.resolve(), args.runtime)


if __name__ == "__main__":
    main()
