#!/usr/bin/env python3
"""Fresh exact gate for generic support lists and the complete n9/p17 pilot.

This gate regenerates all numerical source and verifies its frozen hashes,
then compiles the entire isolated project closure, audits every owned/private
declaration, and stock-replays that exact closure. The verified pilot has an
eight-element support for lists of at most nine speeds. It does not certify
binary lifting or an integer-direction classification.
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

import generate_modular_initial_support as producer
import verify_six_speed_prime_batches as gate


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-support-lists-sources.json"
CONTROLLER = "scripts/verify_modular_support_lists.py"
WORKFLOW = ".github/workflows/lean-modular-support-lists.yml"
PRODUCER = "scripts/generate_modular_initial_support.py"
SCHEMA = "modular-support-lists-sources-v1"
RECEIPT_SCHEMA = "modular-support-lists-receipt-v1"
BASE_ROOTS = ["Conjectures.LonelinessModularSupportLists",
              "Conjectures.LonelinessModularInitialMemo",
              "Conjectures.LonelinessModularCoverFastCuts"]
PILOT = {"speeds": 9, "denominator": 10, "prime": 17, "block_size": 4,
         "max_nodes": 10000, "max_seconds": 30, "max_rows": 1000}
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "exact_stock_prefix_replay": True}
SCOPE = {"generic_initial_support_lists": True,
         "complete_initial_list": {"speeds": 9, "denominator": 10, "modulus": 17},
         "smaller_supports_retained": True, "binary_lifting_verified": False,
         "integer_direction_classification_verified": False,
         "complete_nine_speed_theorem_verified": False, "accepted_registry_changed": False}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200, "producer_timeout_seconds": 120,
             "controller_timeout_seconds": 19800, "job_timeout_minutes": 350}
CONTROLS = (PRODUCER, CONTROLLER, WORKFLOW, "scripts/verify_six_speed_prime_batches.py",
            "scripts/verify_six_speed_prime_pipeline.py", *gate.pilot.PRODUCERS,
            *gate.pilot.HELPERS, *gate.pilot.CONFIGURATION)
require, sha, encoded, module_path = gate.require, gate.sha, gate.encoded, gate.module_path


def payload():
    data = producer.produce(PILOT["speeds"], PILOT["denominator"], PILOT["prime"],
        max_nodes=PILOT["max_nodes"], max_seconds=PILOT["max_seconds"], max_rows=PILOT["max_rows"])
    require(data["status"] == "complete", "Pilot generation stopped before complete coverage")
    require([r["b"] for r in data["roots"]] == list(range(2, 9)), "Pilot omitted a minimum pair")
    require(data["rows"] == [{"mask": "510", "support": list(range(1, 9))}],
            "The pilot no longer exercises its exact eight-element survivor")
    require(sum(len(root["frames"]) for root in data["roots"]) == 19, "Pilot state inventory changed")
    return data, producer.lean_sources(data, PILOT["block_size"])


def required_theorems(data):
    _, ns = producer.names(data)
    required = ["Loneliness.Modular.SupportLists." + name for name in (
        "terminal_sound", "covers_times_iff_no_rational_witness", "survivor_no_rational_witness",
        "checked_survivor_mem", "checked_survivor_iff", "checked_list_cover")]
    required += [ns + "." + name for name in (
        "inverse_valid", "cover_checked", "row000000_valid", "rows_valid",
        "initial_checked", "exact_survivors", "normalized_cover")]
    required += [ns + f".B{b:04d}.root_checked" for b in range(2, 9)]
    required += ["Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_sound"]
    return sorted(required)


def stage_sources(stage, data, generated, base_hashes):
    for module, text in generated.items():
        for directory in ("src", "generated"):
            path = module_path(stage / directory, module)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(text)
    for module, digest in base_hashes.items():
        origin, destination = module_path(ROOT / "lean", module), module_path(stage / "src", module)
        require(origin.is_file() and not origin.is_symlink() and sha(origin) == digest,
                "Base source changed: " + module)
        destination.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(origin, destination)
        require(sha(destination) == digest, "Copied base source changed")
    (stage / "producer-data.json").write_bytes(encoded(data))
    roots = [producer.names(data)[0]]
    modules = gate.source_order(roots, stage / "src")
    require(set(modules) == set(base_hashes) | set(generated), "Unexpected exact source closure")
    return modules


def model_recipe():
    data, generated = payload()
    base = gate.source_order(BASE_ROOTS, ROOT / "lean")
    base_hashes = {module: sha(module_path(ROOT / "lean", module)) for module in base}
    with tempfile.TemporaryDirectory(prefix="support-lists-model-") as directory:
        modules = stage_sources(Path(directory), data, generated, base_hashes)
    return {"schema": SCHEMA, "pilot": PILOT, "source_policy": POLICY, "proof_scope": SCOPE,
            "resources": RESOURCES, "base_roots": BASE_ROOTS, "project_modules": modules,
            "roots": [producer.names(data)[0]], "required_theorems": required_theorems(data),
            "base_source_sha256": base_hashes,
            "generated_source_sha256": {m: hashlib.sha256(s.encode()).hexdigest() for m,s in generated.items()},
            "producer_data_sha256": hashlib.sha256(encoded(data)).hexdigest(),
            "root_frames": {str(r["b"]): len(r["frames"]) for r in data["roots"]},
            "survivor_masks": ["510"], "survivor_cardinalities": [8],
            "runtime_sha256": {"lean": gate.pilot.LEAN_SHA256, "leanchecker": gate.pilot.CHECKER_SHA256},
            "control_sha256": {name: sha(ROOT / name) for name in CONTROLS}}


def validate_model(model):
    require(model["schema"] == SCHEMA, "Unexpected source model")
    require(tuple(gate.audit.ALLOWED) == ("propext", "Classical.choice", "Quot.sound"),
            "Standard axiom whitelist changed")
    require(len(CONTROLS) == len(set(CONTROLS)), "Duplicate frozen control")
    require(model == model_recipe(), "Source, numerical payload, scope or verification model changed")
    require(len(model["required_theorems"]) == len(set(model["required_theorems"])),
            "Duplicate required theorem")
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
    return [sys.executable, str(ROOT / PRODUCER), "--speeds", "9", "--denominator", "10",
            "--prime", "17", "--max-nodes", str(PILOT["max_nodes"]),
            "--max-seconds", str(PILOT["max_seconds"]), "--max-rows", str(PILOT["max_rows"]),
            "--block-size", str(PILOT["block_size"]), "--lean-dir", str(stage / "generated"), "--check"]


def verify(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    gate.fresh_stage(stage)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "source_checks": {},
               "artifact_root": str(stage), "axiom_whitelist": list(gate.audit.ALLOWED),
               "complete_initial_list_verified": False, "binary_lifting_verified": False,
               "integer_direction_classification_verified": False, "accepted_registry_changed": False}
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
        data, generated = payload()
        modules = stage_sources(stage, data, generated, model["base_source_sha256"])
        require(modules == model["project_modules"], "Topological source inventory changed")
        source_hashes = {**model["base_source_sha256"], **model["generated_source_sha256"]}
        for module, digest in source_hashes.items():
            require(sha(module_path(stage / "src", module)) == digest, "Regenerated source differs: " + module)
        require(sha(stage / "producer-data.json") == model["producer_data_sha256"], "Regenerated packet differs")
        modern = {module: next(gate.pilot.header_tokens(module_path(stage / "src", module).read_text()), None) == "module"
                  for module in modules}
        compiler, external, identity = gate.runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == gate.pilot.LEAN_SHA256
                and identity["checker_sha256"] == gate.pilot.CHECKER_SHA256, "Pinned runtime differs")
        env = gate.environment(compiler, external, stage)
        required = required_theorems(data)
        receipt.update({"git_commit": commit, "ci": ci, "ci_job": os.environ.get("GITHUB_JOB", ""),
                        "commit_input_sha256": inputs, "gate_sha256": controls, "toolchain": identity,
                        "external_lean_path": external, "roots": model["roots"], "project_modules": modules,
                        "required_theorems": required, "source_sha256": source_hashes,
                        "modern_modules": modern, "generated_modules": sorted(generated),
                        "producer_data_sha256": model["producer_data_sha256"],
                        "untrusted_producer_summary": producer.summary(data)})
        gate.save_receipt(stage, receipt)
        reproduction = gate.run_profile(producer_command(stage), stage, env, "producer-reproduction",
                                        RESOURCES["producer_timeout_seconds"], deadline)
        reproduced = json.loads((stage / reproduction["log_relative"]).read_text())
        expected = {**producer.summary(data), "generated_sha256": model["generated_source_sha256"],
                    "global_theorem_emitted": True}
        require(reproduced == json.loads(encoded(expected)),
                "The producer --check result differs from the exact frozen packet")
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
                            generated, modules, modern, objects)
        require(sha(stage / "producer-data.json") == model["producer_data_sha256"], "Numerical packet changed")
        require({".".join(p.relative_to(stage / "src").with_suffix("").parts)
                 for p in (stage / "src/Conjectures").rglob("*.lean")} == set(modules),
                "Staged project source inventory changed")
        gate.check_profile(stage, reproduction, producer_command(stage), "producer-reproduction")
        gate.validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True,
                        "complete_initial_list_verified": True,
                        "checked_minimum_pairs": list(range(2, 9)), "checked_survivor_masks": ["510"],
                        "checked_survivor_cardinalities": [8]})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "modules": len(modules), "required_theorems": len(required),
                      "complete_initial_list_verified": True, "integer_direction_classification_verified": False,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--runtime-json", type=Path)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/modular-support-lists")
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model = json.loads(model_bytes)
    model_digest = hashlib.sha256(model_bytes).hexdigest()
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "modules": len(modules),
                          "generated_modules": len(model["generated_source_sha256"]),
                          "required_theorems": len(model["required_theorems"]),
                          "source_model_sha256": model_digest, "lean_verified": False}))
        return
    verify(model, model_digest, args.artifact_dir.resolve(), args.runtime_json)


if __name__ == "__main__":
    main()
