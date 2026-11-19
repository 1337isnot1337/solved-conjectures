#!/usr/bin/env python3
"""Verify generic unit-orbit transport for every support multiplicity class.

All project sources are rebuilt strictly in an empty stage. The complete owned
declaration inventory, including serialized private declarations, is audited.
Every project module is then an explicit unchanged-stock-checker target.
Initial support checks and orbit witnesses remain explicit theorem premises.
This gate supplies no numerical orbit table, binary trace or classification,
and does not edit an accepted-module registry.
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
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens
from verify_renault_foundations import encoded, object_hashes, require, sha, source


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-support-orbits-sources.json"
CONTROLLER = "scripts/verify_modular_support_orbits.py"
WORKFLOW = ".github/workflows/lean-modular-support-orbits.yml"
HELPERS = (
    "scripts/audit_lean_all_owned.py", "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_renault_foundations.py", "scripts/replay_lean.py",
    "scripts/plan_lean_candidates.py", "scripts/verify_lean_candidate.py",
    "scripts/build_lean_parallel.py", "scripts/plan_accepted_lean.py",
)
CONFIGURATION = ("lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json")
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
ALLOWED = ("propext", "Classical.choice", "Quot.sound")
POLICY = {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True}
SCOPE = {"checkpoint": "modular_support_orbits", "conditional_transport_only": True,
         "arbitrary_tuple_length": True, "arbitrary_support_deficit": True,
         "initial_support_checks_retained": True, "unit_orbit_witnesses_retained": True,
         "numerical_orbit_tables_verified": False, "binary_lifting_verified": False,
         "integer_direction_classification_verified": False, "accepted_registry_changed": False}
TIMEOUT = 1800
MEMORY = 4500
ROOTS = ["Conjectures.LonelinessModularSupportOrbits"]
COMMON = {
    'Conjectures.Loneliness',
    'Conjectures.LonelinessContinuity',
    'Conjectures.LonelinessCriticalBase',
    'Conjectures.LonelinessCriticalFamilies',
    'Conjectures.LonelinessCriticalSecond',
    'Conjectures.LonelinessFiveFamily',
    'Conjectures.LonelinessFourSpeedCertificate',
    'Conjectures.LonelinessFourSpeedEnumeration',
    'Conjectures.LonelinessModularCoverBits',
    'Conjectures.LonelinessModularCoverChunks',
    'Conjectures.LonelinessModularCoverSearch',
    'Conjectures.LonelinessModularCoverTape',
    'Conjectures.LonelinessModularFoldedSearch',
    'Conjectures.LonelinessModularInitialSupport',
    'Conjectures.LonelinessModularLift',
    'Conjectures.LonelinessModularMultiplicity',
    'Conjectures.LonelinessModularNormalize',
    'Conjectures.LonelinessModularRationalWitness',
    'Conjectures.LonelinessModularSearch',
    'Conjectures.LonelinessModularStrictWitness',
    'Conjectures.LonelinessModularSupportLists',
    'Conjectures.LonelinessModularSupportMultiplicity',
    'Conjectures.LonelinessModularWitness',
    'Conjectures.LonelinessNormalization',
    'Conjectures.LonelinessRational',
}
REQUIRED = sorted("Loneliness.Modular.SupportOrbits." + name for name in (
    'Witness.sound',
    'hasRepresentative_of_perm',
    'WitnessCover.sound',
    'orbitCover_support_classified',
    'normalized_represents',
    'represented_root_of_orbit_retained',
    'represented_root_of_witness_retained',
    'checked_initial_represents',
))


def validate_model(model):
    require(model["schema"] == "modular-support-orbits-sources-v1", "Unexpected source model")
    require(model["source_policy"] == POLICY and model["proof_scope"] == SCOPE,
            "Orbit transport policy or claimed scope changed")
    require(model["roots"] == ROOTS and model["required_theorems"] == REQUIRED,
            "Frozen roots or required theorem inventory changed")
    require(len(REQUIRED) == len(set(REQUIRED)) == 8, "Required theorem inventory is not exact")
    require(tuple(audit.ALLOWED) == ALLOWED, "Standard axiom whitelist changed")
    require(model["runtime_sha256"] == {"lean": LEAN_SHA256, "leanchecker": CHECKER_SHA256},
            "Pinned runtime model changed")
    modules = runtime.dependency_order(ROOTS)
    require(len(modules) == 26 and set(modules) == set(ROOTS) | COMMON,
            "Unreviewed orbit transport dependency closure")
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


def verify(model, modules, model_digest, stage, runtime_path):
    require(not stage.is_symlink(), "Artifact directory must not be a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for name in ("controls", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    receipt = {
        "schema": "modular-support-orbits-receipt-v1", "status": "running", "proof_scope": SCOPE,
        "source_policy": POLICY, "roots": ROOTS, "project_modules": modules,
        "required_theorems": REQUIRED, "axiom_whitelist": list(ALLOWED),
        "source_workers": 1, "kernel_threads": 1, "memory_megabytes": MEMORY,
        "phase_timeout_seconds": TIMEOUT, "source_checks": {}, "kernel_checks": {},
        "orbit_transport_theorems_verified": False, "accepted_registry_changed": False,
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
        audit_path = stage / "src/ModularSupportOrbitsAudit.lean"
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
        all_checks = [*receipt["source_checks"].values(), receipt["axiom_audit"],
                      *receipt["kernel_checks"].values()]
        for result in all_checks:
            require(sha(result["log"]) == result["log_sha256"], "Verification log changed")
            require(sha(result["progress"]) == result["progress_sha256"], "Verification profile changed")
        require(audit_path.read_text() == audit_text and sha(inventory_path) ==
                receipt["axiom_audit"]["declaration_inventory_sha256"], "Audit evidence changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or unchanged stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Frozen checkout commit changed")
        receipt.update({"status": "passed", "orbit_transport_theorems_verified": True,
                        "all_frozen_hashes_unchanged": True,
                        "kernel_replay": {"replayed_modules": replayed, "exact_project_closure": True,
                                          "all_modules_replayed_as_targets": True, "fresh_process_per_module": True}})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "roots": len(ROOTS), "modules": len(modules),
                      "required_theorems": len(REQUIRED), "orbit_transport_theorems_verified": True,
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
                          "required_theorems": len(REQUIRED), "orbit_transport_theorems_verified": False}))
        return
    stage = args.artifact_dir or ROOT / ".candidate-artifacts/modular-support-orbits"
    verify(model, modules, hashlib.sha256(model_bytes).hexdigest(), stage.resolve(), args.runtime)


if __name__ == "__main__":
    main()
