#!/usr/bin/env python3
"""Fresh exact gate for all nineteen ordered closed-lift roots modulo 251.

The full initial packet and all multiplicity representatives are reproduced
numerically. This gate formally checks the binary trees and their conditional
semantic endpoints. It does not prove the initial support cover, discharge
the six-speed runner bound, or assert a global seven-speed classification.
"""
from __future__ import annotations

import argparse
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile
import time

import generate_modular_initial_support as initial
import generate_modular_support_multiplicities as multiplicities
import generate_modular_closed_lifts as producer
import verify_six_speed_prime_batches as gate


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-closed-lifts-sources.json"
CONTROLLER = "scripts/verify_modular_closed_lifts.py"
WORKFLOW = ".github/workflows/lean-modular-closed-lifts.yml"
PRODUCER = "scripts/generate_modular_closed_lifts.py"
INITIAL_PRODUCER = "scripts/generate_modular_initial_support.py"
MULTIPLICITY_PRODUCER = "scripts/generate_modular_support_multiplicities.py"
SCHEMA = "modular-closed-lifts-sources-v1"
RECEIPT_SCHEMA = "modular-closed-lifts-receipt-v1"
ROOTS = ["Conjectures.LonelinessTightSevenPrime251Binary"]
FIXTURE = {"speeds": 7, "denominator": 8, "prime": 251,
           "initial_max_nodes": 200000, "initial_max_seconds": 120, "initial_max_rows": 1000,
           "gap": [1, 7], "max_depth": 2, "max_nodes": 1000000,
           "module_prefix": "Conjectures.LonelinessTightSevenPrime251",
           "namespace": "Loneliness.Modular.TightSevenPrime251",
           "candidates": [[1, 2, 3, 4, 5, 6, 7], [1, 2, 3, 4, 5, 7, 12],
                          [1, 4, 5, 6, 7, 11, 13]]}
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "exact_stock_prefix_replay": True}
SCOPE = {"prime": 251, "speeds": 7, "denominator": 8, "ordered_multiplicity_roots": 19,
         "full_ordered_boolean_branches": True, "maximum_binary_depth": 2,
         "literal_candidates": FIXTURE["candidates"], "six_speed_bound_explicit": True,
         "initial_support_coverage_verified": False, "six_speed_bound_discharged": False,
         "complete_seven_speed_classification": False, "accepted_registry_changed": False}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200, "producer_timeout_seconds": 600,
             "controller_timeout_seconds": 19800, "job_timeout_minutes": 350}
CONTROLS = (PRODUCER, INITIAL_PRODUCER, MULTIPLICITY_PRODUCER, CONTROLLER, WORKFLOW,
            "scripts/verify_six_speed_prime_batches.py", "scripts/verify_six_speed_prime_pipeline.py",
            *gate.pilot.PRODUCERS, *gate.pilot.HELPERS, *gate.pilot.CONFIGURATION)
require, sha, encoded, module_path = gate.require, gate.sha, gate.encoded, gate.module_path


def payload():
    spec = FIXTURE
    parent = initial.produce(spec["speeds"], spec["denominator"], spec["prime"],
        max_nodes=spec["initial_max_nodes"], max_seconds=spec["initial_max_seconds"],
        max_rows=spec["initial_max_rows"])
    require(parent["status"] == "complete"
            and [root["b"] for root in parent["roots"]] == list(range(2, 126)),
            "The full initial numerical packet is incomplete")
    require(len(parent["rows"]) == 19 and all(len(row["support"]) == 7 for row in parent["rows"])
            and sum(len(root["frames"]) for root in parent["roots"]) == 102190,
            "The frozen initial root and instruction inventory changed")
    representatives = multiplicities.produce(parent)
    require(representatives["status"] == "complete"
            and representatives["representatives"] == [row["support"] for row in parent["rows"]]
            and representatives["source_indices"] == list(range(19)),
            "The complete ordered multiplicity inventory changed")
    data = producer.produce(parent, representatives, gap=Fraction(*spec["gap"]),
        candidates=spec["candidates"], max_depth=spec["max_depth"], max_nodes=spec["max_nodes"],
        module_prefix=spec["module_prefix"], namespace=spec["namespace"])
    producer.validate(data, parent, representatives)
    require(data["status"] == "complete" and not data["unresolved"], "A binary root is unresolved")
    require(data["census"]["nodes"] == 2451 and data["census"]["maximum_depth"] == 2
            and data["census"]["depths"] == {"0": 19, "1": 2048, "2": 384}
            and data["census"]["kinds"] == {"branch": 19, "strictWitness": 2298,
                "gridWitness": 0, "allEven": 16, "oneOdd": 112, "direction": 6, "unresolved": 0},
            "The full binary trace inventory changed")
    generated = producer.files(data)
    require(set(generated) == {ROOTS[0], ROOTS[0] + "Data", ROOTS[0] + "Checks"},
            "The generated module inventory changed")
    for module, source in generated.items():
        require(module_path(ROOT / "lean", module).read_text() == source,
                "Committed proof source differs from exact reproduction: " + module)
    return parent, representatives, data, generated


def packet_bytes(parent, representatives, data):
    return {"producer-data/initial.json": producer.encoded(parent),
            "producer-data/multiplicities.json": producer.encoded(representatives),
            "producer-data/closed-lifts.json": producer.encoded(data)}


def stage_sources(stage, packets, generated, hashes):
    for module, digest in hashes.items():
        origin, target = module_path(ROOT / "lean", module), module_path(stage / "src", module)
        require(origin.is_file() and not origin.is_symlink() and sha(origin) == digest,
                "Frozen source changed: " + module)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(origin, target)
        require(sha(target) == digest, "Copied source differs: " + module)
    for module, source in generated.items():
        target = module_path(stage / "generated", module)
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(source)
        require(sha(target) == hashes[module], "Generated proof differs from committed source")
    for name, raw in packets.items():
        target = stage / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(raw)
    modules = gate.source_order(ROOTS, stage / "src")
    require(set(modules) == set(hashes), "Unexpected exact project source closure")
    return modules


def model_recipe():
    parent, representatives, data, generated = payload()
    modules = gate.source_order(ROOTS, ROOT / "lean")
    require(len(modules) == 33, "The complete project closure changed")
    hashes = {module: sha(module_path(ROOT / "lean", module)) for module in modules}
    packets = packet_bytes(parent, representatives, data)
    with tempfile.TemporaryDirectory(prefix="modular-closed-lifts-model-") as directory:
        require(stage_sources(Path(directory), packets, generated, hashes) == modules,
                "Staged project source order differs")
    required = producer.required_theorems(data)
    require(len(required) == len(set(required)) == 23, "Required theorem inventory changed")
    return {"schema": SCHEMA, "fixture": FIXTURE, "source_policy": POLICY, "proof_scope": SCOPE,
            "resources": RESOURCES, "roots": ROOTS, "project_modules": modules,
            "base_source_sha256": hashes, "required_theorems": required,
            "generated_source_sha256": {module: hashlib.sha256(source.encode()).hexdigest()
                                        for module, source in generated.items()},
            "producer_data_sha256": {name: hashlib.sha256(raw).hexdigest() for name, raw in packets.items()},
            "ordered_root_lists": representatives["representatives"],
            "root_source_indices": representatives["source_indices"],
            "untrusted_initial_summary": json.loads(encoded(initial.summary(parent))),
            "untrusted_closed_lift_summary": producer.summary(data),
            "runtime_sha256": {"lean": gate.pilot.LEAN_SHA256, "leanchecker": gate.pilot.CHECKER_SHA256},
            "control_sha256": {name: sha(ROOT / name) for name in CONTROLS}}


def validate_model(model):
    require(model["schema"] == SCHEMA, "Unexpected source model")
    require(tuple(gate.audit.ALLOWED) == ("propext", "Classical.choice", "Quot.sound"),
            "Standard axiom whitelist changed")
    require(len(CONTROLS) == len(set(CONTROLS)), "Duplicate verification control")
    require(model == model_recipe(), "Exact source, data, scope or verification model changed")
    for name in CONTROLS:
        require((ROOT / name).is_file() and not (ROOT / name).is_symlink(), "Missing or linked control")
    watches = re.findall(r"^      - '([^']+)'$", (ROOT / WORKFLOW).read_text(), re.M)
    expected = set(CONTROLS) | {MODEL} | {
        "lean/" + module.replace(".", "/") + ".lean" for module in model["project_modules"]}
    require(len(watches) == len(set(watches)) and set(watches) == expected,
            "The workflow does not watch every exact source and verification input")
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


def producer_commands(stage, parent, data, generated):
    spec = FIXTURE
    initial_command = [sys.executable, str(ROOT / INITIAL_PRODUCER),
        "--speeds", str(spec["speeds"]), "--denominator", str(spec["denominator"]),
        "--prime", str(spec["prime"]), "--max-nodes", str(spec["initial_max_nodes"]),
        "--max-seconds", str(spec["initial_max_seconds"]), "--max-rows", str(spec["initial_max_rows"]),
        "--json-out", str(stage / "reproduced/initial.json")]
    lift_command = [sys.executable, str(ROOT / PRODUCER),
        "--initial-json", str(stage / "producer-data/initial.json"),
        "--multiplicity-out", str(stage / "producer-data/multiplicities.json"),
        "--load-json", str(stage / "producer-data/closed-lifts.json"),
        "--json-out", str(stage / "producer-data/closed-lifts.json"),
        "--lean-dir", str(stage / "src"), "--check"]
    expected = {**producer.summary(data), "numeric_packet_sha256": producer.digest(data),
        "generated_modules": sorted(generated), "required_theorems": producer.required_theorems(data),
        "source_sha256": {module: hashlib.sha256(source.encode()).hexdigest()
                          for module, source in generated.items()},
        "source_bytes": sum(len(source.encode()) for source in generated.values())}
    return [("initial-reproduction", initial_command, initial.summary(parent)),
            ("closed-lift-reproduction", lift_command, expected)]


def verify(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    gate.fresh_stage(stage)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "source_checks": {},
               "artifact_root": str(stage), "axiom_whitelist": list(gate.audit.ALLOWED),
               "complete_ordered_binary_traces_verified": False,
               "initial_support_coverage_verified": False, "six_speed_bound_discharged": False,
               "complete_seven_speed_classification": False, "accepted_registry_changed": False}
    gate.save_receipt(stage, receipt)
    try:
        require(sha(ROOT / MODEL) == model_digest, "Source model changed after preflight")
        ci, commit = ci_identity(), gate.git_commit()
        require(ci["GITHUB_SHA"] == commit, "Checkout differs from recorded workflow commit")
        controls = {**model["control_sha256"], MODEL: model_digest}
        inputs = {**controls, **{"lean/" + module.replace(".", "/") + ".lean": digest
                                for module, digest in model["base_source_sha256"].items()}}
        for path, digest in inputs.items():
            require(sha(ROOT / path) == digest, "Frozen input changed: " + path)
            blob = subprocess.check_output(["git", "show", commit + ":" + path], cwd=ROOT)
            require(hashlib.sha256(blob).hexdigest() == digest, "Input differs from recorded Git commit: " + path)
        for path, digest in controls.items():
            target = stage / "controls" / path
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ROOT / path, target)
            require(sha(target) == digest, "Copied verification control changed")
        parent, representatives, data, generated = payload()
        packets = packet_bytes(parent, representatives, data)
        source_hashes = model["base_source_sha256"]
        modules = stage_sources(stage, packets, generated, source_hashes)
        require(modules == model["project_modules"], "Topological source inventory changed")
        for name, digest in model["producer_data_sha256"].items():
            require(sha(stage / name) == digest, "Regenerated packet differs: " + name)
        for module, digest in model["generated_source_sha256"].items():
            require(sha(module_path(stage / "generated", module)) == digest, "Regenerated proof source differs")
        modern = {module: next(gate.pilot.header_tokens(module_path(stage / "src", module).read_text()), None) == "module"
                  for module in modules}
        compiler, external, identity = gate.runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == gate.pilot.LEAN_SHA256
                and identity["checker_sha256"] == gate.pilot.CHECKER_SHA256, "Pinned runtime differs")
        env = gate.environment(compiler, external, stage)
        required = producer.required_theorems(data)
        receipt.update({"git_commit": commit, "ci": ci, "ci_job": os.environ.get("GITHUB_JOB", ""),
                        "commit_input_sha256": inputs, "gate_sha256": controls, "toolchain": identity,
                        "external_lean_path": external, "roots": ROOTS, "project_modules": modules,
                        "required_theorems": required, "source_sha256": source_hashes,
                        "modern_modules": modern, "generated_modules": sorted(generated),
                        "producer_data_sha256": model["producer_data_sha256"],
                        "ordered_root_lists": model["ordered_root_lists"],
                        "untrusted_closed_lift_summary": producer.summary(data), "producer_reproductions": {}})
        gate.save_receipt(stage, receipt)
        commands = producer_commands(stage, parent, data, generated)
        for label, command, expected in commands:
            check = gate.run_profile(command, stage, env, label, RESOURCES["producer_timeout_seconds"], deadline)
            observed = json.loads((stage / check["log_relative"]).read_text())
            require(observed == json.loads(encoded(expected)), "Producer reproduction differs: " + label)
            receipt["producer_reproductions"][label] = check
            gate.save_receipt(stage, receipt)
        require(sha(stage / "reproduced/initial.json") == model["producer_data_sha256"]["producer-data/initial.json"],
                "Fresh complete initial search differs from the frozen packet")
        for module in modules:
            receipt["source_checks"][module] = gate.compile_source(module, compiler, stage, env, deadline)
            gate.save_receipt(stage, receipt)
        objects = gate.object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = objects
        receipt["axiom_audit"] = gate.audit_closure(modules, required, modern, compiler, stage, env, deadline)
        gate.save_receipt(stage, receipt)
        receipt["kernel_replay"] = gate.replay("Conjectures", modules, compiler, stage, env, deadline)
        gate.recheck_inputs(inputs, controls, model, commit, compiler, stage, source_hashes,
                            generated, modules, modern, objects)
        for name, digest in model["producer_data_sha256"].items():
            require(sha(stage / name) == digest, "Numerical packet changed")
        require(sha(stage / "reproduced/initial.json") == model["producer_data_sha256"]["producer-data/initial.json"],
                "Reproduced complete initial packet changed")
        require({".".join(path.relative_to(stage / "src").with_suffix("").parts)
                 for path in (stage / "src/Conjectures").rglob("*.lean")} == set(modules),
                "Checked project source inventory changed")
        require({".".join(path.relative_to(stage / "generated").with_suffix("").parts)
                 for path in (stage / "generated/Conjectures").rglob("*.lean")} == set(generated),
                "Reproduced proof source inventory changed")
        for label, command, _expected in commands:
            gate.check_profile(stage, receipt["producer_reproductions"][label], command, label)
        gate.validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True,
                        "complete_ordered_binary_traces_verified": True, "checked_root_count": 19,
                        "trace_nodes": 2451, "full_boolean_branch_nodes": 19, "maximum_binary_depth": 2})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "modules": len(modules), "required_theorems": len(required),
                      "complete_ordered_binary_traces_verified": True, "checked_root_count": 19,
                      "initial_support_coverage_verified": False, "six_speed_bound_discharged": False,
                      "complete_seven_speed_classification": False,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--runtime-json", type=Path)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/modular-closed-lifts")
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model, model_digest = json.loads(model_bytes), hashlib.sha256(model_bytes).hexdigest()
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "modules": len(modules),
                          "required_theorems": len(model["required_theorems"]),
                          "source_model_sha256": model_digest, "lean_verified": False}))
        return
    verify(model, model_digest, args.artifact_dir.resolve(), args.runtime_json)


if __name__ == "__main__":
    main()
