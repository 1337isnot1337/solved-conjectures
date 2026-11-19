#!/usr/bin/env python3
"""Fresh exact gate for the literal tight-seven binary-root checkpoint.

Every one of the original seventeen primes, three stated shapes and 128
ordered Boolean choices is checked by the unchanged closed folded engine.
The semantic recovery theorem retains the six-speed runner bound and an
explicit Represents premise. Initial support exhaustiveness is not claimed.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import time

import generate_tight_seven_binary_roots as producer
import verify_six_speed_prime_batches as gate


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/tight-seven-binary-roots-sources.json"
CONTROLLER = "scripts/verify_tight_seven_binary_roots.py"
WORKFLOW = ".github/workflows/lean-tight-seven-binary-roots.yml"
PRODUCER = "scripts/generate_tight_seven_binary_roots.py"
SCHEMA = "tight-seven-binary-roots-sources-v1"
RECEIPT_SCHEMA = "tight-seven-binary-roots-receipt-v1"
ROOTS = ["Conjectures.LonelinessTightSevenBinaryRoots"]
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "exact_stock_prefix_replay": True}
SCOPE = {"original_prime_count": 17, "literal_shape_count": 3, "represented_roots": 51,
         "patterns_per_root": 128, "total_boolean_patterns": 6528,
         "full_ordered_boolean_branches": True, "conditional_LRC6_direction_recovery": True,
         "six_speed_bound_discharged": False, "initial_support_coverage_verified": False,
         "complete_seven_speed_classification": False, "accepted_registry_changed": False}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200, "producer_timeout_seconds": 120,
             "controller_timeout_seconds": 19800, "job_timeout_minutes": 350}
CONTROLS = (PRODUCER, CONTROLLER, WORKFLOW, "scripts/verify_six_speed_prime_batches.py",
            "scripts/verify_six_speed_prime_pipeline.py", *gate.pilot.PRODUCERS,
            *gate.pilot.HELPERS, *gate.pilot.CONFIGURATION)
require, sha, encoded, module_path = gate.require, gate.sha, gate.encoded, gate.module_path


def payload():
    data = producer.produce()
    producer.validate(data)
    summary = producer.summary(data)
    require(summary["prime_count"] == 17 and summary["shape_count"] == 3
            and summary["roots"] == 51 and summary["patterns_per_root"] == 128
            and summary["total_patterns"] == 6528, "The fixed root/branch inventory changed")
    require(summary["leaf_counts"] == {"strict_witness": 6426, "all_even": 51, "direction": 51},
            "The full literal branch inventory changed")
    source = producer.render(data)
    require(producer.MODULE == ROOTS[0], "The generated root module changed")
    require(module_path(ROOT / "lean", producer.MODULE).read_text() == source,
            "The committed numeric source differs from exact producer output")
    return data, source


def required_theorems():
    prefix = "Loneliness.Modular.TightSevenBinaryRoots."
    names = ["prime_set_exact", "primes_gt_one", "root_lists_exact", "all_checked",
             "classify_root", "classify_original_prime_root", "classify_original_shape"]
    names += [f"checked_{p:04d}_{j}" for p in producer.PRIMES for j in range(3)]
    result = sorted(prefix + name for name in names)
    require(len(result) == 58 and len(set(result)) == 58, "Required theorem inventory changed")
    return result


def stage_sources(stage, data, source, hashes):
    for module, digest in hashes.items():
        origin, destination = module_path(ROOT / "lean", module), module_path(stage / "src", module)
        require(origin.is_file() and not origin.is_symlink() and sha(origin) == digest,
                "Exact source changed: " + module)
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(origin, destination)
        require(sha(destination) == digest, "Copied proof source changed")
    generated = module_path(stage / "generated", producer.MODULE)
    generated.parent.mkdir(parents=True, exist_ok=True)
    generated.write_text(source)
    (stage / "producer-data.json").write_bytes(producer.encoded(data))
    modules = gate.source_order(ROOTS, stage / "src")
    require(set(modules) == set(hashes), "Unexpected exact source closure")
    return modules


def model_recipe():
    data, source = payload()
    modules = gate.source_order(ROOTS, ROOT / "lean")
    require(len(modules) == 34, "The fixed complete dependency closure changed")
    hashes = {module: sha(module_path(ROOT / "lean", module)) for module in modules}
    with tempfile.TemporaryDirectory(prefix="tight-seven-binary-roots-") as directory:
        require(stage_sources(Path(directory), data, source, hashes) == modules,
                "Staged source order differs")
    return {"schema": SCHEMA, "source_policy": POLICY, "proof_scope": SCOPE, "resources": RESOURCES,
            "roots": ROOTS, "project_modules": modules, "required_theorems": required_theorems(),
            "base_source_sha256": hashes, "generated_module": producer.MODULE,
            "generated_source_sha256": hashlib.sha256(source.encode()).hexdigest(),
            "producer_data_sha256": hashlib.sha256(producer.encoded(data)).hexdigest(),
            "literal_primes": data["primes"], "literal_shapes": data["shapes"],
            "untrusted_producer_summary": producer.summary(data),
            "runtime_sha256": {"lean": gate.pilot.LEAN_SHA256, "leanchecker": gate.pilot.CHECKER_SHA256},
            "control_sha256": {name: sha(ROOT / name) for name in CONTROLS}}


def validate_model(model):
    require(model["schema"] == SCHEMA, "Unexpected source model")
    require(tuple(gate.audit.ALLOWED) == ("propext", "Classical.choice", "Quot.sound"),
            "Standard axiom whitelist changed")
    require(len(CONTROLS) == len(set(CONTROLS)), "Duplicate frozen control")
    require(model == model_recipe(), "Exact source, data, scope or verification model changed")
    for name in CONTROLS:
        require((ROOT / name).is_file() and not (ROOT / name).is_symlink(), "Missing or linked control")
    return model["project_modules"]


def ci_identity():
    require(os.environ.get("GITHUB_ACTIONS") == "true", "Hosted proof requires GitHub Actions provenance")
    names = ("GITHUB_REPOSITORY", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT", "GITHUB_SHA",
             "GITHUB_WORKFLOW", "GITHUB_WORKFLOW_REF")
    result = {name: os.environ.get(name, "") for name in names}
    require(all(result.values()), "Missing GitHub run identity")
    require(result["GITHUB_REPOSITORY"] == "1337isnot1337/solved-conjectures", "Unexpected repository")
    require(result["GITHUB_RUN_ID"].isdigit() and result["GITHUB_RUN_ATTEMPT"].isdigit(), "Invalid run identity")
    require(result["GITHUB_WORKFLOW_REF"].startswith(result["GITHUB_REPOSITORY"] + "/" + WORKFLOW + "@"),
            "Workflow differs from the frozen controller")
    return result


def producer_command(stage):
    return [sys.executable, str(ROOT / PRODUCER), "--check", "--lean-dir", str(stage / "src"),
            "--json-out", str(stage / "producer-data.json")]


def verify(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    gate.fresh_stage(stage)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "source_checks": {},
               "artifact_root": str(stage), "axiom_whitelist": list(gate.audit.ALLOWED),
               "complete_literal_root_checks_verified": False, "six_speed_bound_discharged": False,
               "initial_support_coverage_verified": False, "complete_seven_speed_classification": False,
               "accepted_registry_changed": False}
    gate.save_receipt(stage, receipt)
    try:
        require(sha(ROOT / MODEL) == model_digest, "Source model changed after preflight")
        ci, commit = ci_identity(), gate.git_commit()
        require(ci["GITHUB_SHA"] == commit, "Checkout differs from recorded workflow commit")
        controls = {**model["control_sha256"], MODEL: model_digest}
        inputs = {**controls, **{"lean/" + m.replace(".", "/") + ".lean": digest
                                for m,digest in model["base_source_sha256"].items()}}
        for path, digest in inputs.items():
            require(sha(ROOT / path) == digest, "Frozen input changed: " + path)
            blob = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
            require(hashlib.sha256(blob).hexdigest() == digest, "Input differs from recorded Git commit: " + path)
        for path, digest in controls.items():
            destination = stage / "controls" / path
            destination.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ROOT / path, destination)
            require(sha(destination) == digest, "Copied verification control changed")
        data, source = payload()
        source_hashes = model["base_source_sha256"]
        modules = stage_sources(stage, data, source, source_hashes)
        require(modules == model["project_modules"], "Topological source inventory changed")
        require(sha(stage / "producer-data.json") == model["producer_data_sha256"], "Regenerated packet differs")
        require(sha(module_path(stage / "generated", producer.MODULE)) == model["generated_source_sha256"],
                "Regenerated numeric source differs")
        modern = {module: next(gate.pilot.header_tokens(module_path(stage / "src", module).read_text()), None) == "module"
                  for module in modules}
        compiler, external, identity = gate.runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == gate.pilot.LEAN_SHA256
                and identity["checker_sha256"] == gate.pilot.CHECKER_SHA256, "Pinned runtime differs")
        env = gate.environment(compiler, external, stage)
        required = required_theorems()
        receipt.update({"git_commit": commit, "ci": ci, "ci_job": os.environ.get("GITHUB_JOB", ""),
                        "commit_input_sha256": inputs, "gate_sha256": controls, "toolchain": identity,
                        "external_lean_path": external, "roots": ROOTS, "project_modules": modules,
                        "required_theorems": required, "source_sha256": source_hashes,
                        "modern_modules": modern, "generated_modules": [producer.MODULE],
                        "producer_data_sha256": model["producer_data_sha256"],
                        "untrusted_producer_summary": producer.summary(data)})
        gate.save_receipt(stage, receipt)
        reproduction = gate.run_profile(producer_command(stage), stage, env, "producer-reproduction",
                                        RESOURCES["producer_timeout_seconds"], deadline)
        reproduced = json.loads((stage / reproduction["log_relative"]).read_text())
        expected = {**producer.summary(data), "module": producer.MODULE,
                    "source_sha256": model["generated_source_sha256"],
                    "numeric_packet_sha256": model["producer_data_sha256"],
                    "source_bytes": len(source.encode())}
        require(reproduced == json.loads(encoded(expected)), "The producer --check result differs")
        receipt["producer_reproduction"] = reproduction
        for module in modules:
            receipt["source_checks"][module] = gate.compile_source(module, compiler, stage, env, deadline)
            gate.save_receipt(stage, receipt)
        objects = gate.object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = objects
        receipt["axiom_audit"] = gate.audit_closure(modules, required, modern, compiler, stage, env, deadline)
        gate.save_receipt(stage, receipt)
        receipt["kernel_replay"] = gate.replay("Conjectures", modules, compiler, stage, env, deadline)
        gate.recheck_inputs(inputs, controls, model, commit, compiler, stage, source_hashes,
                            {producer.MODULE: source}, modules, modern, objects)
        require(sha(stage / "producer-data.json") == model["producer_data_sha256"], "Numerical packet changed")
        require({".".join(p.relative_to(stage / "src").with_suffix("").parts)
                 for p in (stage / "src/Conjectures").rglob("*.lean")} == set(modules),
                "Staged project source inventory changed")
        gate.check_profile(stage, reproduction, producer_command(stage), "producer-reproduction")
        gate.validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True,
                        "complete_literal_root_checks_verified": True,
                        "checked_root_count": 51, "checked_boolean_patterns": 6528,
                        "checked_primes": data["primes"], "checked_shapes": data["shapes"]})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "modules": len(modules), "required_theorems": len(required),
                      "complete_literal_root_checks_verified": True,
                      "initial_support_coverage_verified": False, "complete_seven_speed_classification": False,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--runtime-json", type=Path)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/tight-seven-binary-roots")
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model = json.loads(model_bytes)
    model_digest = hashlib.sha256(model_bytes).hexdigest()
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "modules": len(modules),
                          "required_theorems": len(model["required_theorems"]),
                          "source_model_sha256": model_digest, "lean_verified": False}))
        return
    verify(model, model_digest, args.artifact_dir.resolve(), args.runtime_json)


if __name__ == "__main__":
    main()
