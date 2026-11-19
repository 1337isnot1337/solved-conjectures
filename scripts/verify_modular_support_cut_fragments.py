#!/usr/bin/env python3
"""Fresh exact gate for a complete small cut table and a bounded p251 sample.

The small n5/den6/p11 fixture proves its complete initial support list. The
p251 packet is regenerated in full, but Lean checks only its nineteen row
validity statements and four bounded cuts from the large minimum-pair-four
tape. No complete p251 initial cover or integer classification is claimed.
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
import generate_modular_support_cut_fragments as producer
import verify_six_speed_prime_batches as gate


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/modular-support-cut-fragments-sources.json"
CONTROLLER = "scripts/verify_modular_support_cut_fragments.py"
WORKFLOW = ".github/workflows/lean-modular-support-cut-fragments.yml"
PRODUCER = "scripts/generate_modular_support_cut_fragments.py"
INITIAL_PRODUCER = "scripts/generate_modular_initial_support.py"
SCHEMA = "modular-support-cut-fragments-sources-v1"
RECEIPT_SCHEMA = "modular-support-cut-fragments-receipt-v1"
BASE_ROOTS = ["Conjectures.LonelinessModularSupportLists",
              "Conjectures.LonelinessModularInitialMemo",
              "Conjectures.LonelinessModularCoverFastCuts"]
FIXTURES = [
    {"id": "n05d06p0011", "speeds": 5, "denominator": 6, "prime": 11,
     "fragment_limit": 3, "cuts_per_module": 2, "only_pairs": None,
     "max_nodes": 10000, "max_seconds": 30, "max_rows": 1000},
    {"id": "n07d08p0251", "speeds": 7, "denominator": 8, "prime": 251,
     "fragment_limit": 31, "cuts_per_module": 4, "only_pairs": [4],
     "max_nodes": 200000, "max_seconds": 120, "max_rows": 1000},
]
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_project_objects": True, "exact_stock_prefix_replay": True}
SCOPE = {
    "unchanged_support_tape_and_cut_soundness": True,
    "complete_initial_list": {"speeds": 5, "denominator": 6, "prime": 11},
    "p251_row_validity": {"rows": 19, "speeds": 7, "denominator": 8},
    "p251_checked_minimum_pair": 4, "p251_checked_cut_indices": [0, 1, 2, 3],
    "p251_initial_support_cover_verified": False,
    "p251_all_cut_obligations_verified": False,
    "binary_lifting_verified": False,
    "integer_direction_classification_verified": False,
    "complete_runner_classification_verified": False,
    "accepted_registry_changed": False,
}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200, "producer_timeout_seconds": 300,
             "controller_timeout_seconds": 19800, "job_timeout_minutes": 350}
CONTROLS = (PRODUCER, INITIAL_PRODUCER, CONTROLLER, WORKFLOW,
            "scripts/verify_six_speed_prime_batches.py", "scripts/verify_six_speed_prime_pipeline.py",
            *gate.pilot.PRODUCERS, *gate.pilot.HELPERS, *gate.pilot.CONFIGURATION)
require, sha, encoded, module_path = gate.require, gate.sha, gate.encoded, gate.module_path


def payload():
    datasets, generated = [], {}
    for spec in FIXTURES:
        data = initial.produce(spec["speeds"], spec["denominator"], spec["prime"],
            max_nodes=spec["max_nodes"], max_seconds=spec["max_seconds"], max_rows=spec["max_rows"])
        require(data["status"] == "complete", "Initial numerical search is incomplete")
        require([r["b"] for r in data["roots"]] == list(range(2, spec["prime"] // 2 + 1)),
                "Initial numerical packet omitted a minimum pair")
        cuts = producer.produce(data, spec["fragment_limit"], spec["cuts_per_module"])
        sources = producer.lean_sources(data, cuts, spec["only_pairs"])
        require(not set(sources) & set(generated), "Generated namespace collision")
        generated.update(sources)
        datasets.append({"spec": spec, "initial": data, "cuts": cuts, "sources": sources})
    small, large = datasets
    require(small["initial"]["rows"] == [{"mask": "62", "support": [1, 2, 3, 4, 5]}],
            "The small fixture's exact retained list changed")
    require(sum(len(r["frames"]) for r in small["initial"]["roots"]) == 10
            and sum(len(r["cuts"]) for r in small["cuts"]["roots"]) == 6,
            "Small fixture no longer has the frozen ten-instruction/six-cut layout")
    require(len(large["initial"]["rows"]) == 19
            and all(len(r["support"]) == 7 for r in large["initial"]["rows"]),
            "The large fixture's nineteen seven-element rows changed")
    require(sum(len(r["frames"]) for r in large["initial"]["roots"]) == 102190
            and sum(len(r["cuts"]) for r in large["cuts"]["roots"]) == 3856,
            "The complete p251 numerical instruction/cut inventory changed")
    large_b4 = next(r for r in large["cuts"]["roots"] if r["b"] == 4)
    require(large_b4["original_frames"] == 11335 and len(large_b4["cuts"]) == 419,
            "The large minimum-pair-four tape changed")
    return datasets, generated


def selected_roots(datasets):
    small = producer.names(datasets[0]["initial"], 3)[0]
    large = producer.names(datasets[1]["initial"], 31)[0]
    return [small, large + "Rows", large + "B0004Checks0000"]


def required_theorems(datasets):
    required = ["Loneliness.Modular.SupportLists." + name for name in (
        "terminal_sound", "covers_times_iff_no_rational_witness", "survivor_no_rational_witness",
        "checked_survivor_mem", "checked_survivor_iff", "checked_list_cover")]
    required += ["Loneliness.Modular.SupportSearch.Bits.Cuts." + name for name in (
        "fragmentCheck_sound", "boundedCheck_sound", "table_sound")]
    required += ["Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_sound"]
    for item in datasets:
        _, ns = producer.names(item["initial"], item["spec"]["fragment_limit"])
        required += [ns + "." + name for name in ("inverse_valid", "cover_checked", "rows_valid")]
        required += [ns + f".row{i:06d}_valid" for i in range(len(item["initial"]["rows"]))]
    small_ns = producer.names(datasets[0]["initial"], 3)[1]
    required += [small_ns + "." + name for name in
                 ("initial_checked", "exact_survivors", "normalized_cover")]
    required += [small_ns + f".B{b:04d}.root_checked" for b in range(2, 6)]
    large_ns = producer.names(datasets[1]["initial"], 31)[1] + ".B0004"
    required += [large_ns + "." + name for name in
                 ("compatible_checked", "selected_mask_checked", "available_mask_checked",
                  "uncovered_mask_checked", "block0000_checked")]
    required += [large_ns + f".cut{i:06d}_checked" for i in range(4)]
    return sorted(required)


def data_packets(datasets):
    return {f"producer-data/{item['spec']['id']}-{key}.json": producer.encoded(item[key])
            for item in datasets for key in ("initial", "cuts")}


def stage_sources(stage, datasets, generated, base_hashes):
    # All reproduced sources are evidence. Only the explicit root closure is
    # placed in src and accepted as compiled/audited/replayed project source.
    for module, text in generated.items():
        for directory in ("src", "generated"):
            target = module_path(stage / directory, module)
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text)
    for module, digest in base_hashes.items():
        origin, target = module_path(ROOT / "lean", module), module_path(stage / "src", module)
        require(origin.is_file() and not origin.is_symlink() and sha(origin) == digest,
                "Base source changed: " + module)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(origin, target)
        require(sha(target) == digest, "Copied base source changed")
    for relative, raw in data_packets(datasets).items():
        target = stage / relative
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(raw)
    roots = selected_roots(datasets)
    modules = gate.source_order(roots, stage / "src")
    require(set(base_hashes) <= set(modules), "A frozen base module is outside the checked closure")
    require(set(modules) <= set(base_hashes) | set(generated), "Unexpected project import")
    large = producer.names(datasets[1]["initial"], 31)[0]
    require(large not in modules and large + "B0004" not in modules,
            "The bounded pilot imported an unproved complete p251 cover")
    require({m for m in modules if m.startswith(large + "B0004Checks")} ==
            {large + "B0004Checks0000"}, "The p251 sample changed its four checked cuts")
    for module in set(generated) - set(modules):
        module_path(stage / "src", module).unlink()
    return roots, modules


def model_recipe():
    datasets, generated = payload()
    base = gate.source_order(BASE_ROOTS, ROOT / "lean")
    base_hashes = {module: sha(module_path(ROOT / "lean", module)) for module in base}
    with tempfile.TemporaryDirectory(prefix="support-cut-fragment-model-") as directory:
        roots, modules = stage_sources(Path(directory), datasets, generated, base_hashes)
    checked_generated = {m: hashlib.sha256(generated[m].encode()).hexdigest()
                         for m in modules if m in generated}
    return {"schema": SCHEMA, "fixtures": FIXTURES, "source_policy": POLICY,
            "proof_scope": SCOPE, "resources": RESOURCES, "base_roots": BASE_ROOTS,
            "roots": roots, "project_modules": modules, "base_source_sha256": base_hashes,
            "generated_source_sha256": checked_generated,
            "reproduced_generated_source_sha256": {
                m: hashlib.sha256(text.encode()).hexdigest() for m,text in generated.items()},
            "uncompiled_generated_modules": sorted(set(generated) - set(modules)),
            "required_theorems": required_theorems(datasets),
            "producer_data_sha256": {name: hashlib.sha256(raw).hexdigest()
                                     for name,raw in data_packets(datasets).items()},
            "numerical_layouts": {item["spec"]["id"]: {
                "original_frames": {str(r["b"]): len(r["frames"]) for r in item["initial"]["roots"]},
                "cut_frames": {str(r["b"]): len(r["cuts"]) for r in item["cuts"]["roots"]},
                "survivor_masks": [r["mask"] for r in item["initial"]["rows"]]}
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
    commands = []
    for item in datasets:
        spec, data, cuts = item["spec"], item["initial"], item["cuts"]
        reproduced = f"reproduced/{spec['id']}-initial.json"
        command = [sys.executable, str(ROOT / INITIAL_PRODUCER),
                   "--speeds", str(spec["speeds"]), "--denominator", str(spec["denominator"]),
                   "--prime", str(spec["prime"]), "--max-nodes", str(spec["max_nodes"]),
                   "--max-seconds", str(spec["max_seconds"]), "--max-rows", str(spec["max_rows"]),
                   "--json-out", str(stage / reproduced)]
        commands.append((spec["id"] + "-initial", command, initial.summary(data), reproduced))
        command = [sys.executable, str(ROOT / PRODUCER),
                   "--initial-json", str(stage / f"producer-data/{spec['id']}-initial.json"),
                   "--fragment-limit", str(spec["fragment_limit"]),
                   "--cuts-per-module", str(spec["cuts_per_module"]),
                   "--json-out", str(stage / f"producer-data/{spec['id']}-cuts.json"),
                   "--lean-dir", str(stage / "generated"), "--check"]
        for pair in spec["only_pairs"] or []:
            command += ["--only-b", str(pair)]
        expected = {**producer.summary(data, cuts), "generated_modules": len(item["sources"]),
                    "generated_source_bytes": sum(len(text.encode()) for text in item["sources"].values()),
                    "generated_source_sha256": {m: hashlib.sha256(text.encode()).hexdigest()
                                                for m,text in item["sources"].items()},
                    "global_theorem_emitted": producer.names(data, spec["fragment_limit"])[0] in item["sources"]}
        commands.append((spec["id"] + "-cuts", command, expected, None))
    return commands


def verify(model, model_digest, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    gate.fresh_stage(stage)
    receipt = {"schema": RECEIPT_SCHEMA, "status": "running", "proof_scope": SCOPE,
               "source_policy": POLICY, "resources": RESOURCES, "source_checks": {},
               "artifact_root": str(stage), "axiom_whitelist": list(gate.audit.ALLOWED),
               "small_complete_initial_list_verified": False,
               "p251_row_validity_verified": False, "p251_checked_cut_indices": [],
               "p251_initial_support_cover_verified": False,
               "p251_all_cut_obligations_verified": False, "binary_lifting_verified": False,
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
            target = stage / "controls" / path
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(ROOT / path, target)
            require(sha(target) == digest, "Copied verification control changed")
        datasets, generated = payload()
        roots, modules = stage_sources(stage, datasets, generated, model["base_source_sha256"])
        require(roots == model["roots"] and modules == model["project_modules"], "Exact source closure changed")
        source_hashes = {**model["base_source_sha256"], **model["generated_source_sha256"]}
        require(set(source_hashes) == set(modules), "An unchecked source entered the acceptance inventory")
        for module, digest in source_hashes.items():
            require(sha(module_path(stage / "src", module)) == digest, "Staged source differs: " + module)
        for module, digest in model["reproduced_generated_source_sha256"].items():
            require(sha(module_path(stage / "generated", module)) == digest, "Reproduced source differs")
        for relative, digest in model["producer_data_sha256"].items():
            require(sha(stage / relative) == digest, "Regenerated packet differs: " + relative)
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
                        "modern_modules": modern, "generated_modules": sorted(model["generated_source_sha256"]),
                        "reproduced_generated_source_sha256": model["reproduced_generated_source_sha256"],
                        "uncompiled_generated_modules": model["uncompiled_generated_modules"],
                        "producer_data_sha256": model["producer_data_sha256"],
                        "numerical_layouts": model["numerical_layouts"],
                        "untrusted_producer_summaries": {item["spec"]["id"]:
                            producer.summary(item["initial"], item["cuts"]) for item in datasets},
                        "producer_reproductions": {}})
        gate.save_receipt(stage, receipt)
        commands = producer_commands(stage, datasets)
        for label, command, expected, reproduced_packet in commands:
            reproduction = gate.run_profile(command, stage, env, label,
                                            RESOURCES["producer_timeout_seconds"], deadline)
            observed = json.loads((stage / reproduction["log_relative"]).read_text())
            require(observed == json.loads(encoded(expected)), "Producer reproduction differs: " + label)
            if reproduced_packet:
                frozen_packet = "producer-data/" + Path(reproduced_packet).name
                require(sha(stage / reproduced_packet) == model["producer_data_sha256"][frozen_packet],
                        "Fresh initial search differs from the frozen full packet")
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
        for module, digest in model["reproduced_generated_source_sha256"].items():
            require(sha(module_path(stage / "generated", module)) == digest, "Reproduced source changed")
        for relative, digest in model["producer_data_sha256"].items():
            require(sha(stage / relative) == digest, "Frozen numerical packet changed")
        require({".".join(p.relative_to(stage / "src").with_suffix("").parts)
                 for p in (stage / "src/Conjectures").rglob("*.lean")} == set(modules),
                "Checked project source inventory changed")
        require({".".join(p.relative_to(stage / "generated").with_suffix("").parts)
                 for p in (stage / "generated/Conjectures").rglob("*.lean")} == set(generated),
                "Reproduced generated inventory changed")
        for label, command, _expected, reproduced_packet in commands:
            gate.check_profile(stage, receipt["producer_reproductions"][label], command, label)
            if reproduced_packet:
                require(sha(stage / reproduced_packet) ==
                        model["producer_data_sha256"]["producer-data/" + Path(reproduced_packet).name],
                        "Reproduced initial packet changed")
        gate.validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True,
                        "small_complete_initial_list_verified": True,
                        "small_checked_minimum_pairs": [2, 3, 4, 5], "small_checked_survivor_masks": ["62"],
                        "p251_row_validity_verified": True, "p251_checked_row_count": 19,
                        "p251_checked_cut_indices": [0, 1, 2, 3], "p251_checked_minimum_pair": 4})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        gate.save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "modules": len(modules), "required_theorems": len(required),
                      "small_complete_initial_list_verified": True, "p251_row_validity_verified": True,
                      "p251_checked_cut_indices": [0, 1, 2, 3], "p251_initial_support_cover_verified": False,
                      "integer_direction_classification_verified": False,
                      "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--preflight", action="store_true")
    parser.add_argument("--runtime-json", type=Path)
    parser.add_argument("--artifact-dir", type=Path,
                        default=ROOT / ".candidate-artifacts/modular-support-cut-fragments")
    args = parser.parse_args()
    model_bytes = (ROOT / MODEL).read_bytes()
    model = json.loads(model_bytes)
    model_digest = hashlib.sha256(model_bytes).hexdigest()
    modules = validate_model(model)
    if args.preflight:
        print(json.dumps({"status": "preflight_passed", "modules": len(modules),
                          "compiled_generated_modules": len(model["generated_source_sha256"]),
                          "reproduced_generated_modules": len(model["reproduced_generated_source_sha256"]),
                          "required_theorems": len(model["required_theorems"]),
                          "source_model_sha256": model_digest, "lean_verified": False}))
        return
    verify(model, model_digest, args.artifact_dir.resolve(), args.runtime_json)


if __name__ == "__main__":
    main()
