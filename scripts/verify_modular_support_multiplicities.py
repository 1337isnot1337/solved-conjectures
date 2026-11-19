#!/usr/bin/env python3
"""Fresh source, all-owned audit and exact stock replay of multiplicity coverage.

Both complete initial-support pilots are regenerated from the frozen original
producer. Their exact multiplicity tables exercise deficits one and two. The
generic binary-tree interpretation is checked as a conditional theorem; this
gate supplies no binary trace or complete integer-direction classification.
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

import generate_modular_initial_support as initial
import generate_modular_support_multiplicities as producer
import verify_six_speed_prime_batches as gate


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-support-multiplicities-sources.json"
CONTROLLER = "scripts/verify_modular_support_multiplicities.py"
WORKFLOW = ".github/workflows/lean-modular-support-multiplicities.yml"
PRODUCER = "scripts/generate_modular_support_multiplicities.py"
INITIAL_PRODUCER = "scripts/generate_modular_initial_support.py"
SCHEMA = "modular-support-multiplicities-sources-v1"
RECEIPT_SCHEMA = "modular-support-multiplicities-receipt-v1"
BASE_ROOTS = ["Conjectures.LonelinessModularSupportFiniteSound",
              "Conjectures.LonelinessModularInitialMemo",
              "Conjectures.LonelinessModularCoverFastCuts"]
PILOTS = [
    {"id": "n09d10p0017", "speeds": 9, "denominator": 10, "prime": 17,
     "support": list(range(1, 9)), "frames": 19, "representatives": 8},
    {"id": "n05d06p0007", "speeds": 5, "denominator": 6, "prime": 7,
     "support": [1, 2, 3], "frames": 4, "representatives": 6},
]
GENERATION = {"block_size": 4, "max_nodes": 10000, "max_seconds": 30,
              "max_rows": 1000, "max_representatives": 1000}
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "exact_stock_prefix_replay": True}
SCOPE = {"generic_initial_support_lists": True, "arbitrary_support_deficit_multiplicities": True,
         "conditional_binary_tree_consumer": True,
         "complete_initial_lists": [{k: p[k] for k in ("speeds", "denominator", "prime")} for p in PILOTS],
         "complete_multiplicity_lists": True, "actual_tuple_representation": True,
         "binary_lifting_verified": False, "integer_direction_classification_verified": False,
         "complete_runner_classification_verified": False, "accepted_registry_changed": False}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200, "producer_timeout_seconds": 120,
             "controller_timeout_seconds": 19800, "job_timeout_minutes": 350}
CONTROLS = (PRODUCER, INITIAL_PRODUCER, CONTROLLER, WORKFLOW,
            "scripts/verify_six_speed_prime_batches.py", "scripts/verify_six_speed_prime_pipeline.py",
            *gate.pilot.PRODUCERS, *gate.pilot.HELPERS, *gate.pilot.CONFIGURATION)
require, sha, encoded, module_path = gate.require, gate.sha, gate.encoded, gate.module_path


def payload():
    datasets, generated = [], {}
    for spec in PILOTS:
        parent = initial.produce(spec["speeds"], spec["denominator"], spec["prime"],
            max_nodes=GENERATION["max_nodes"], max_seconds=GENERATION["max_seconds"],
            max_rows=GENERATION["max_rows"])
        require(parent["status"] == "complete", "An initial pilot stopped before complete coverage")
        require([r["b"] for r in parent["roots"]] == list(range(2, spec["prime"] // 2 + 1)),
                "An initial pilot omitted a minimum pair")
        mask = str(sum(1 << a for a in spec["support"]))
        require(parent["rows"] == [{"mask": mask, "support": spec["support"]}],
                "A pilot no longer has its exact smaller support")
        require(sum(len(r["frames"]) for r in parent["roots"]) == spec["frames"],
                "An initial state inventory changed")
        data = producer.produce(parent, max_representatives=GENERATION["max_representatives"])
        require(data["status"] == "complete" and len(data["representatives"]) == spec["representatives"],
                "A pilot multiplicity inventory is incomplete or changed")
        parent_sources = initial.lean_sources(parent, GENERATION["block_size"])
        multiplicity_sources = producer.lean_sources(data, parent)
        for module, text in {**parent_sources, **multiplicity_sources}.items():
            require(module not in generated, "Duplicate generated module")
            generated[module] = text
        datasets.append({"spec": spec, "initial": parent, "multiplicities": data,
                         "initial_sources": parent_sources, "multiplicity_sources": multiplicity_sources})
    return datasets, generated


def required_theorems(datasets):
    required = ["Loneliness.Modular.SupportLists." + name for name in (
        "terminal_sound", "covers_times_iff_no_rational_witness", "survivor_no_rational_witness",
        "checked_survivor_mem", "checked_survivor_iff", "checked_list_cover")]
    required += ["Loneliness.Modular.SupportMultiplicity." + name for name in (
        "representative_length", "representative_sorted", "representative_support",
        "exists_perm_representative", "representatives_spec", "mem_representatives_iff",
        "representatives_unique", "exists_perm_representative_iff", "ofFn_tuple", "tuple_reindex")]
    required += ["Loneliness.Modular.SupportFiniteSound." + name for name in (
        "represented_root_of_retained", "retained_classification", "checked_prime_classification")]
    required += ["Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_sound"]
    for item in datasets:
        _, ns = initial.names(item["initial"])
        required += [ns + "." + name for name in (
            "inverse_valid", "cover_checked", "row000000_valid", "rows_valid",
            "initial_checked", "exact_survivors", "normalized_cover")]
        required += [ns + f".B{r['b']:04d}.root_checked" for r in item["initial"]["roots"]]
        _, ns = producer.names(item["multiplicities"])
        required += [ns + "." + name for name in (
            "source_index_checked", "representative_lengths", "roots_ofFn", "representatives_exact",
            "root_member", "roots_support", "roots_sorted", "representative_cover", "normalized_tuple_cover")]
    return sorted(required)


def data_packets(datasets):
    result = {}
    for item in datasets:
        for key in ("initial", "multiplicities"):
            result[f"producer-data/{item['spec']['id']}-{key}.json"] = producer.encoded(item[key])
    return result


def stage_sources(stage, datasets, generated, base_hashes):
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
    for relative, content in data_packets(datasets).items():
        path = stage / relative
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)
    roots = [producer.names(item["multiplicities"])[0] for item in datasets]
    modules = gate.source_order(roots, stage / "src")
    require(set(modules) == set(base_hashes) | set(generated), "Unexpected exact source closure")
    return roots, modules


def model_recipe():
    datasets, generated = payload()
    base = gate.source_order(BASE_ROOTS, ROOT / "lean")
    base_hashes = {module: sha(module_path(ROOT / "lean", module)) for module in base}
    with tempfile.TemporaryDirectory(prefix="support-multiplicities-model-") as directory:
        roots, modules = stage_sources(Path(directory), datasets, generated, base_hashes)
    return {"schema": SCHEMA, "pilots": PILOTS, "generation": GENERATION,
            "source_policy": POLICY, "proof_scope": SCOPE, "resources": RESOURCES,
            "base_roots": BASE_ROOTS, "project_modules": modules, "roots": roots,
            "required_theorems": required_theorems(datasets), "base_source_sha256": base_hashes,
            "generated_source_sha256": {m: hashlib.sha256(s.encode()).hexdigest() for m,s in generated.items()},
            "producer_data_sha256": {p: hashlib.sha256(b).hexdigest() for p,b in data_packets(datasets).items()},
            "root_frames": {item["spec"]["id"]: {str(r["b"]): len(r["frames"]) for r in item["initial"]["roots"]}
                            for item in datasets},
            "support_deficits": {item["spec"]["id"]: [g["deficit"] for g in item["multiplicities"]["groups"]]
                                 for item in datasets},
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


def producer_commands(stage, datasets):
    result = []
    for item in datasets:
        spec = item["spec"]
        parent_command = [sys.executable, str(ROOT / INITIAL_PRODUCER), "--speeds", str(spec["speeds"]),
            "--denominator", str(spec["denominator"]), "--prime", str(spec["prime"]),
            "--max-nodes", str(GENERATION["max_nodes"]), "--max-seconds", str(GENERATION["max_seconds"]),
            "--max-rows", str(GENERATION["max_rows"]), "--block-size", str(GENERATION["block_size"]),
            "--lean-dir", str(stage / "generated"), "--check"]
        multiplicity_command = [sys.executable, str(ROOT / PRODUCER), "--input-json",
            str(stage / f"producer-data/{spec['id']}-initial.json"), "--max-representatives",
            str(GENERATION["max_representatives"]), "--json-out",
            str(stage / f"producer-data/{spec['id']}-multiplicities.json"),
            "--lean-dir", str(stage / "generated"), "--check"]
        for label, command, producer_summary, sources, flag in (
            (spec["id"] + "-initial", parent_command, initial.summary(item["initial"]),
             item["initial_sources"], "global_theorem_emitted"),
            (spec["id"] + "-multiplicities", multiplicity_command, producer.summary(item["multiplicities"]),
             item["multiplicity_sources"], "actual_tuple_cover_emitted")):
            expected = {**producer_summary, "generated_sha256": {
                module: hashlib.sha256(text.encode()).hexdigest() for module,text in sources.items()}, flag: True}
            result.append((label, command, expected))
    return result


def verify(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    gate.fresh_stage(stage)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "source_checks": {},
               "artifact_root": str(stage), "axiom_whitelist": list(gate.audit.ALLOWED),
               "complete_initial_lists_verified": False, "complete_multiplicity_lists_verified": False,
               "actual_tuple_representation_verified": False, "binary_lifting_verified": False,
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
        datasets, generated = payload()
        roots, modules = stage_sources(stage, datasets, generated, model["base_source_sha256"])
        require(roots == model["roots"] and modules == model["project_modules"], "Source inventory changed")
        source_hashes = {**model["base_source_sha256"], **model["generated_source_sha256"]}
        for module, digest in source_hashes.items():
            require(sha(module_path(stage / "src", module)) == digest, "Regenerated source differs: " + module)
        for path, digest in model["producer_data_sha256"].items():
            require(sha(stage / path) == digest, "Regenerated packet differs")
        modern = {module: next(gate.pilot.header_tokens(module_path(stage / "src", module).read_text()), None) == "module"
                  for module in modules}
        compiler, external, identity = gate.runtime.resolve_runtime(runtime_path)
        require(identity["lean_sha256"] == gate.pilot.LEAN_SHA256
                and identity["checker_sha256"] == gate.pilot.CHECKER_SHA256, "Pinned runtime differs")
        env = gate.environment(compiler, external, stage)
        required = required_theorems(datasets)
        receipt.update({"git_commit": commit, "ci": ci, "ci_job": os.environ.get("GITHUB_JOB", ""),
                        "commit_input_sha256": inputs, "gate_sha256": controls, "toolchain": identity,
                        "external_lean_path": external, "roots": roots, "project_modules": modules,
                        "required_theorems": required, "source_sha256": source_hashes,
                        "modern_modules": modern, "generated_modules": sorted(generated),
                        "producer_data_sha256": model["producer_data_sha256"],
                        "untrusted_producer_summaries": {item["spec"]["id"]: {
                            "initial": initial.summary(item["initial"]),
                            "multiplicities": producer.summary(item["multiplicities"])} for item in datasets},
                        "producer_reproductions": {}})
        gate.save_receipt(stage, receipt)
        commands = producer_commands(stage, datasets)
        for label, command, expected in commands:
            reproduction = gate.run_profile(command, stage, env, label,
                                            RESOURCES["producer_timeout_seconds"], deadline)
            reproduced = json.loads((stage / reproduction["log_relative"]).read_text())
            require(reproduced == json.loads(encoded(expected)), "Producer --check output differs: " + label)
            receipt["producer_reproductions"][label] = reproduction
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
        for path, digest in model["producer_data_sha256"].items():
            require(sha(stage / path) == digest, "Numerical packet changed")
        require({".".join(p.relative_to(stage / "src").with_suffix("").parts)
                 for p in (stage / "src/Conjectures").rglob("*.lean")} == set(modules),
                "Staged project source inventory changed")
        for label, command, _expected in commands:
            gate.check_profile(stage, receipt["producer_reproductions"][label], command, label)
        gate.validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True,
                        "complete_initial_lists_verified": True, "complete_multiplicity_lists_verified": True,
                        "actual_tuple_representation_verified": True,
                        "checked_pilots": PILOTS, "checked_support_deficits": model["support_deficits"]})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "modules": len(modules), "required_theorems": len(required),
                      "complete_multiplicity_lists_verified": True, "actual_tuple_representation_verified": True,
                      "integer_direction_classification_verified": False,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--runtime-json", type=Path)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/modular-support-multiplicities")
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
