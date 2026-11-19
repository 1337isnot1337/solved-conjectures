#!/usr/bin/env python3
"""Fresh bounded gates and authenticated assembly for six-speed prime proofs.

The published producer and pilot controller remain unchanged. Each shard proves
its whole source closure and replays exactly that closure with the stock checker.
The assembly job accepts only byte-identical, same-run shard evidence, then checks
the full-prime module against the authenticated object union. It does not infer a
full-prime result from partial roots or discharge the separate five-speed bound.
"""
from __future__ import annotations

import argparse
from collections import Counter
import contextlib
from graphlib import TopologicalSorter
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

import verify_six_speed_prime_pipeline as pilot


ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/six-speed-prime-batches-sources.json"
CONTROLLER = "scripts/verify_six_speed_prime_batches.py"
WORKFLOW = ".github/workflows/lean-six-speed-prime-batches.yml"
PILOT_MODEL = "docs/six-speed-prime-pipeline-sources.json"
PILOT_CONTROLLER = "scripts/verify_six_speed_prime_pipeline.py"
PRIMES = (271, 307, 313)
BASE_ROOTS = [
    "Conjectures.LonelinessSixSpeedFiniteSound",
    "Conjectures.LonelinessModularCoverCuts",
    "Conjectures.LonelinessModularInitialMemo",
    "Conjectures.LonelinessModularCoverFastCuts",
]
CONTROLS = (*pilot.PRODUCERS, *pilot.HELPERS, *pilot.CONFIGURATION,
            PILOT_CONTROLLER, CONTROLLER, WORKFLOW)
POLICY = {"warning_as_error": True, "linter_override": False,
          "fresh_shard_project_objects": True, "authenticated_join_objects": True}
RESOURCES = {"source_workers": 1, "kernel_threads": 1, "lean_memory_mib": 4500,
             "max_shard_frames": 1400, "max_shard_roots": 24,
             "max_shard_modules": 150, "max_parallel_shards": 3,
             "job_timeout_minutes": 350, "controller_timeout_seconds": 19800,
             "source_timeout_seconds": 1800, "audit_timeout_seconds": 1800,
             "prefix_replay_timeout_seconds": 7200}
PROFILE_KEYS = {"command", "exit_code", "seconds", "peak_rss_kib", "user_seconds",
                "system_seconds", "timed_out", "log", "log_sha256"}
HASH = re.compile(r"[0-9a-f]{64}\Z")
SCHEMA = "six-speed-prime-batches-v1"
RECEIPT_SCHEMA = "six-speed-prime-batches-receipt-v1"
audit = pilot.audit
runtime = pilot.runtime
sha = pilot.sha
encoded = pilot.encoded
module_path = pilot.module_path
require = pilot.require


def bytes_sha(raw):
    return hashlib.sha256(raw).hexdigest()


def write_json(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(encoded(value))


def prime_base(p):
    return f"Conjectures.LonelinessSixSpeedPrime{p:04d}"


def expected_generated(p, pairs, root_frames, complete=False):
    base = prime_base(p)
    result = {base + "Arithmetic", base + "Rows"}
    for b in pairs:
        name = base + f"B{b:03d}"
        result.add(name)
        count = root_frames[str(b)]
        if count > 32:
            result.update((name + "Arithmetic", name + "Data"))
            result.update(name + f"Checks{i:03d}" for i in range((count + 31) // 32))
    if complete:
        result.add(base)
    return result


def required_theorems(p, pairs, complete=False):
    ns = f"Loneliness.Modular.SixSpeed.Prime{p:04d}"
    result = [ns + ".inverse_valid", ns + ".rows_valid", ns + ".terminal_sound",
              "Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
              "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_eq",
              "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_sound"]
    result += [ns + f".B{b:03d}.root_checked" for b in pairs]
    if complete:
        result += [ns + ".initial_checked", ns + ".primitive_classification",
                   ns + ".value_eq_of_tight"]
    return result


def partition(p, root_frames):
    """Deterministic whole-root packing; no root is divided between receipts."""
    buckets = []
    ordered = sorted(((int(b), count) for b, count in root_frames.items()),
                     key=lambda item: (-item[1], item[0]))
    for b, count in ordered:
        require(0 < count <= RESOURCES["max_shard_frames"], "A root exceeds the reviewed shard bound")
        choices = [(sum(n for _, n in group), len(group), i)
                   for i, group in enumerate(buckets)
                   if sum(n for _, n in group) + count <= RESOURCES["max_shard_frames"]
                   and len(group) < RESOURCES["max_shard_roots"]]
        if choices:
            buckets[min(choices)[2]].append((b, count))
        else:
            buckets.append([(b, count)])
    return [{"id": f"p{p:04d}-s{i:03d}", "prime": p,
             "minimum_pairs": sorted(b for b, _ in group),
             "frame_count": sum(n for _, n in group), "complete_prime": False}
            for i, group in enumerate(buckets)]


def model_recipe():
    """Author a frozen source model. This operation makes no Lean proof claim."""
    baseline = json.loads((ROOT / PILOT_MODEL).read_text())
    pilot.validate_model(baseline)
    model = {"schema": SCHEMA, "source_policy": POLICY, "resources": RESOURCES,
             "base_roots": BASE_ROOTS, "base_source_sha256": baseline["base_source_sha256"],
             "control_sha256": {path: sha(ROOT / path) for path in CONTROLS},
             "block_size": 32, "combined_frame_limit": 32, "layout": "hybrid",
             "numeric_checker": "proved_linear_population_count", "primes": []}
    for p in PRIMES:
        data = pilot.producer.prime_data(p)
        with contextlib.redirect_stdout(sys.stderr):
            data["roots"] = [pilot.producer.search_root(data, b) for b in range(2, p // 2 + 1)]
        files = dict(pilot.fast_producer.fast_files(data, 32, 32, "hybrid"))
        root_frames = {str(root["b"]): len(root["frames"]) for root in data["roots"]}
        model["primes"].append({
            "prime": p, "frame_count": sum(root_frames.values()),
            "root_frames": root_frames,
            "root_data_sha256": {str(root["b"]): bytes_sha(encoded(root)) for root in data["roots"]},
            "producer_data_sha256": bytes_sha(encoded(data)),
            "generated_source_sha256": {name: bytes_sha(source.encode()) for name, source in files.items()},
            "shards": partition(p, root_frames)})
    return model


def validate_model(model):
    require(model["schema"] == SCHEMA, "Unexpected batch source schema")
    require(model["source_policy"] == POLICY and model["resources"] == RESOURCES,
            "Reviewed source or resource policy changed")
    require(model["base_roots"] == BASE_ROOTS, "Common roots changed")
    modules = runtime.dependency_order(BASE_ROOTS)
    require(len(modules) == 45 and set(modules) == set(model["base_source_sha256"]),
            "Exact common source closure changed")
    require(model["block_size"] == 32 and model["combined_frame_limit"] == 32
            and model["layout"] == "hybrid"
            and model["numeric_checker"] == "proved_linear_population_count",
            "Published producer layout or proof transport changed")
    require(set(model["control_sha256"]) == set(CONTROLS), "Control inventory differs")
    for module, digest in model["base_source_sha256"].items():
        path = module_path(ROOT / "lean", module)
        require(not path.is_symlink() and sha(path) == digest, "Common source differs: " + module)
    for name, digest in model["control_sha256"].items():
        path = ROOT / name
        require(not path.is_symlink() and sha(path) == digest, "Pinned control differs: " + name)
    require([spec["prime"] for spec in model["primes"]] == list(PRIMES), "Prime inventory differs")
    for spec in model["primes"]:
        p = spec["prime"]
        pairs = list(range(2, p // 2 + 1))
        expected_keys = {str(b) for b in pairs}
        require(set(spec["root_frames"]) == expected_keys
                and set(spec["root_data_sha256"]) == expected_keys, "Incomplete root model")
        require(all(type(n) is int and n > 0 for n in spec["root_frames"].values()),
                "Invalid root frame count")
        require(spec["frame_count"] == sum(spec["root_frames"].values()), "Frame total differs")
        require(spec["shards"] == partition(p, spec["root_frames"]), "Shard partition differs")
        generated = expected_generated(p, pairs, spec["root_frames"], True)
        require(set(spec["generated_source_sha256"]) == generated, "Generated source inventory differs")
        for digest in [spec["producer_data_sha256"], *spec["root_data_sha256"].values(),
                       *spec["generated_source_sha256"].values()]:
            require(type(digest) is str and HASH.fullmatch(digest), "Invalid source digest")
        for job in spec["shards"]:
            count = 45 + len(expected_generated(p, job["minimum_pairs"], spec["root_frames"]))
            require(count <= RESOURCES["max_shard_modules"], "Shard exceeds its reviewed module bound")
        require(Counter(b for job in spec["shards"] for b in job["minimum_pairs"]) == Counter(pairs),
                "Missing or duplicated normalized minimum pair")
    return modules


def spec_for(model, p):
    return next(spec for spec in model["primes"] if spec["prime"] == p)


def source_order(roots, source_root):
    graph = {}
    def visit(module):
        if module in graph:
            return
        path = module_path(source_root, module)
        require(path.is_file() and not path.is_symlink(), "Missing exact source: " + module)
        dependencies = [name for name in pilot.imports_of(path) if name.startswith("Conjectures.")]
        graph[module] = sorted(set(dependencies))
        # Match the frozen pilot's DFS insertion order as well as its edges.
        # TopologicalSorter uses that insertion order when several nodes are ready.
        for name in dependencies:
            visit(name)
    for root in roots:
        visit(root)
    return list(TopologicalSorter(graph).static_order())


def produce(model, spec, job, stage):
    with contextlib.redirect_stdout(sys.stderr):
        result = pilot.produce(job, model, stage)
    data, generated, roots, modules, required, source_hashes, modern = result
    p = spec["prime"]
    pairs = job["minimum_pairs"]
    require(required == required_theorems(p, pairs, job["complete_prime"]), "Required theorem scope differs")
    require(set(generated) == expected_generated(p, pairs, spec["root_frames"], job["complete_prime"]),
            "Unexpected generated modules")
    for module in generated:
        require(source_hashes[module] == spec["generated_source_sha256"][module],
                "Generated source does not reproduce its frozen hash: " + module)
    for root in data["roots"]:
        b = str(root["b"])
        require(len(root["frames"]) == spec["root_frames"][b]
                and bytes_sha(encoded(root)) == spec["root_data_sha256"][b],
                "Numerical root does not reproduce its frozen input: " + b)
    if job["complete_prime"]:
        require(sha(stage / "producer-data.json") == spec["producer_data_sha256"],
                "Complete producer data differs")
    else:
        require(sum(len(root["frames"]) for root in data["roots"]) == job["frame_count"],
                "Shard frame count differs")
    return result


def ci_identity():
    require(os.environ.get("GITHUB_ACTIONS") == "true", "Proof jobs require GitHub Actions provenance")
    names = ("GITHUB_REPOSITORY", "GITHUB_RUN_ID", "GITHUB_RUN_ATTEMPT", "GITHUB_SHA",
             "GITHUB_WORKFLOW", "GITHUB_WORKFLOW_REF")
    result = {name: os.environ.get(name, "") for name in names}
    require(all(result.values()), "Missing GitHub run identity")
    require(result["GITHUB_RUN_ID"].isdigit() and result["GITHUB_RUN_ATTEMPT"].isdigit(),
            "Invalid GitHub run identity")
    require(result["GITHUB_WORKFLOW_REF"].startswith(result["GITHUB_REPOSITORY"] + "/" + WORKFLOW + "@"),
            "Workflow identity differs from the frozen controller")
    return result


def git_commit():
    return subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()


def frozen_inputs(model, commit):
    inputs = {**model["control_sha256"], MODEL: sha(ROOT / MODEL)}
    inputs.update({"lean/" + module.replace(".", "/") + ".lean": digest
                   for module, digest in model["base_source_sha256"].items()})
    for name, digest in inputs.items():
        require(sha(ROOT / name) == digest, "Input changed: " + name)
        raw = subprocess.check_output(["git", "show", commit + ":" + name], cwd=ROOT)
        require(bytes_sha(raw) == digest, "Input does not match the recorded Git commit: " + name)
    return inputs


def copy_controls(stage, model):
    controls = {**model["control_sha256"], MODEL: sha(ROOT / MODEL)}
    for name, digest in controls.items():
        target = stage / "controls" / name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT / name, target)
        require(sha(target) == digest, "Control snapshot differs: " + name)
    return controls


def fresh_stage(stage):
    require(not stage.is_symlink(), "Artifact directory is a symlink")
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for directory in ("generated", "src", "lib/lean", "logs", "progress", "controls"):
        (stage / directory).mkdir(parents=True, exist_ok=True)


def environment(compiler, external, stage):
    return {**os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
            "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
            "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}


def run_profile(command, stage, env, label, timeout, deadline):
    remaining = deadline - time.monotonic()
    require(remaining > 0, "Controller deadline reached")
    log = stage / "logs" / (label + ".log")
    progress = stage / "progress" / (label + ".json")
    result = runtime.profile(command, stage / "src", env, log, progress, min(timeout, remaining))
    result.update({"log_relative": log.relative_to(stage).as_posix(),
                   "progress_relative": progress.relative_to(stage).as_posix(),
                   "progress_sha256": sha(progress)})
    require(result["exit_code"] == 0 and result["timed_out"] is False,
            "Verification phase failed: " + label + "\n" + log.read_text()[-12000:])
    return result


def compile_source(module, compiler, stage, env, deadline):
    output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
    output.parent.mkdir(parents=True, exist_ok=True)
    command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
               "-o", str(output), module.replace(".", "/") + ".lean"]
    return run_profile(command, stage, env, module + ".source",
                       RESOURCES["source_timeout_seconds"], deadline)


def audit_closure(modules, required, modern, compiler, stage, env, deadline):
    text = audit.audit_source(modules, required, ["Loneliness."])
    path = stage / "src/SixSpeedBatchAudit.lean"
    path.write_text(text)
    check = run_profile([str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", path.name],
                        stage, env, "all-owned-audit", RESOURCES["audit_timeout_seconds"], deadline)
    spec = {"modules": modules, "required": required, "legacy_prefixes": ["Loneliness."]}
    inventory = audit.validate_log((stage / check["log_relative"]).read_text(), spec, modern)
    require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
            "Required endpoint is not a theorem")
    write_json(stage / "declaration-inventory.json", inventory)
    check.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
                  "complete_serialized_private_import": True, "summary": inventory["summary"],
                  "audit_source_sha256": sha(path),
                  "declaration_inventory_sha256": sha(stage / "declaration-inventory.json")})
    return check


def replay(target, expected, compiler, stage, env, deadline):
    command = [str(compiler / "bin/leanchecker"), "-v", target]
    if buffer := shutil.which("stdbuf"):
        command = [buffer, "-oL", "-eL", *command]
    check = run_profile(command, stage, env, "kernel-replay",
                        RESOURCES["prefix_replay_timeout_seconds"], deadline)
    actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                        (stage / check["log_relative"]).read_text(), re.M)
    require(Counter(actual) == Counter(expected) and len(actual) == len(set(actual)),
            "Stock kernel replay inventory differs from its exact target set")
    check.update({"replayed_modules": actual, "stock_prefix": target,
                  "exact_target_multiset": True, "unchanged_stock_checker": True})
    return check


def object_hashes(stage, modules, modern):
    result = pilot.object_hashes(stage, modules, modern)
    expected = {module.replace(".", "/") + suffix
                for module, facets in result.items() for suffix in facets}
    actual = {path.relative_to(stage / "lib/lean").as_posix()
              for path in (stage / "lib/lean").rglob("*") if path.is_file()}
    require(actual == expected, "Unexpected project object facet")
    return result


def file_inventory(stage):
    result = {}
    for path in sorted(stage.rglob("*")):
        require(not path.is_symlink(), "Artifact contains a symlink: " + str(path))
        if path.is_file():
            relative = path.relative_to(stage).as_posix()
            if relative not in {"receipt.json", "receipt.sha256"}:
                result[relative] = sha(path)
    return result


def save_receipt(stage, receipt, seal=False):
    if seal:
        receipt["evidence_sha256"] = file_inventory(stage)
    write_json(stage / "receipt.json", receipt)
    if seal:
        (stage / "receipt.sha256").write_text(sha(stage / "receipt.json") + "\n")


def recheck_inputs(inputs, controls, model, commit, compiler, stage, source_hashes,
                   generated, modules, modern, objects):
    require(git_commit() == commit, "Checkout commit changed during verification")
    for name, digest in inputs.items():
        require(sha(ROOT / name) == digest, "Frozen input changed: " + name)
    for name, digest in controls.items():
        require(sha(stage / "controls" / name) == digest, "Control snapshot changed: " + name)
    for module, digest in source_hashes.items():
        require(sha(module_path(stage / "src", module)) == digest, "Staged source changed: " + module)
        if module in generated:
            require(sha(module_path(stage / "generated", module)) == digest, "Generated source changed")
        else:
            require(digest == model["base_source_sha256"][module], "Unpinned common source")
    require(object_hashes(stage, modules, modern) == objects, "Compiled object bytes changed")
    require(sha(compiler / "bin/lean") == pilot.LEAN_SHA256
            and sha(compiler / "bin/leanchecker") == pilot.CHECKER_SHA256,
            "Compiler or stock checker binary changed")


def begin(model, job, stage, runtime_path, kind):
    fresh_stage(stage)
    commit = git_commit()
    ci = ci_identity()
    require(ci["GITHUB_SHA"] == commit, "Workflow checkout is not its recorded commit")
    inputs = frozen_inputs(model, commit)
    controls = copy_controls(stage, model)
    compiler, external, identity = runtime.resolve_runtime(runtime_path)
    require(identity["lean_sha256"] == pilot.LEAN_SHA256
            and identity["checker_sha256"] == pilot.CHECKER_SHA256, "Pinned runtime differs")
    receipt = {"schema": RECEIPT_SCHEMA, "kind": kind, "status": "running", "job": job,
               "git_commit": commit, "ci": ci, "ci_job": os.environ.get("GITHUB_JOB", ""),
               "artifact_root": str(stage), "gate_sha256": controls,
               "toolchain": identity, "source_policy": POLICY, "resources": RESOURCES,
               "axiom_whitelist": list(audit.ALLOWED), "source_checks": {},
               "complete_prime_checked": False, "lower_runner_hypotheses_discharged": False,
               "accepted_registry_changed": False}
    save_receipt(stage, receipt)
    return receipt, inputs, controls, compiler, environment(compiler, external, stage)


def run_shard(model, spec, job, stage, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    receipt, inputs, controls, compiler, env = begin(model, job, stage, runtime_path, "shard")
    try:
        data, generated, roots, modules, required, source_hashes, modern = produce(model, spec, job, stage)
        receipt.update({"roots": roots, "project_modules": modules, "required_theorems": required,
                        "source_sha256": source_hashes, "modern_modules": modern,
                        "generated_modules": sorted(generated), "frame_count": job["frame_count"],
                        "producer_data_sha256": sha(stage / "producer-data.json")})
        save_receipt(stage, receipt)
        for module in modules:
            receipt["source_checks"][module] = compile_source(module, compiler, stage, env, deadline)
            save_receipt(stage, receipt)
        objects = object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = objects
        receipt["axiom_audit"] = audit_closure(modules, required, modern, compiler, stage, env, deadline)
        save_receipt(stage, receipt)
        receipt["kernel_replay"] = replay("Conjectures", modules, compiler, stage, env, deadline)
        recheck_inputs(inputs, controls, model, receipt["git_commit"], compiler, stage,
                       source_hashes, generated, modules, modern, objects)
        require(sha(stage / "producer-data.json") == bytes_sha(encoded(data)), "Producer input changed")
        validate_checks(stage, receipt, modules, required, modern, modules)
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "initial_minimum_pairs_checked": job["minimum_pairs"],
                        "all_project_sources_fresh": True, "all_project_modules_replayed": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "shard": job["id"], "modules": len(modules),
                      "receipt_sha256": sha(stage / "receipt.json"), "complete_prime_checked": False}))


def check_profile(stage, check, expected_command, label):
    require(check["command"] == expected_command, "Recorded verification command differs: " + label)
    require(check["exit_code"] == 0 and check["timed_out"] is False, "Unsuccessful receipt phase")
    log_rel, progress_rel = "logs/" + label + ".log", "progress/" + label + ".json"
    require(check["log_relative"] == log_rel and check["progress_relative"] == progress_rel,
            "Unexpected verification evidence path")
    require(sha(stage / log_rel) == check["log_sha256"]
            and sha(stage / progress_rel) == check["progress_sha256"], "Verification evidence digest differs")
    raw = json.loads((stage / progress_rel).read_text())
    require(set(raw) == PROFILE_KEYS and raw == {key: check[key] for key in PROFILE_KEYS},
            "Profile record differs from the receipt")


def validate_checks(stage, receipt, modules, required, modern, source_modules, kernel_target="Conjectures"):
    artifact = Path(receipt["artifact_root"])
    compiler = Path(receipt["toolchain"]["lean_path"])
    require(set(receipt["source_checks"]) == set(source_modules), "Fresh source check inventory differs")
    for module in source_modules:
        command = [str(compiler), "-j1", "-M4500", "-DwarningAsError=true", "-o",
                   str(artifact / "lib/lean" / (module.replace(".", "/") + ".olean")),
                   module.replace(".", "/") + ".lean"]
        check_profile(stage, receipt["source_checks"][module], command, module + ".source")
    check = receipt["axiom_audit"]
    check_profile(stage, check, [str(compiler), "-j1", "-M4500", "-DwarningAsError=true",
                                "SixSpeedBatchAudit.lean"], "all-owned-audit")
    text = audit.audit_source(modules, required, ["Loneliness."])
    audit_path = stage / "src/SixSpeedBatchAudit.lean"
    require(audit_path.read_text() == text and sha(audit_path) == check["audit_source_sha256"],
            "All-owned audit source differs")
    spec = {"modules": modules, "required": required, "legacy_prefixes": ["Loneliness."]}
    inventory = audit.validate_log((stage / check["log_relative"]).read_text(), spec, modern)
    require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
            "Required declaration is not a theorem")
    inventory_path = stage / "declaration-inventory.json"
    require(json.loads(inventory_path.read_text()) == inventory
            and sha(inventory_path) == check["declaration_inventory_sha256"]
            and inventory["summary"] == check["summary"], "All-owned declaration inventory differs")
    check = receipt["kernel_replay"]
    command = check["command"]
    checker = receipt["toolchain"]["checker_path"]
    bare = [checker, "-v", kernel_target]
    if command != bare:
        require(len(command) == 6 and Path(command[0]).name == "stdbuf"
                and command[1:3] == ["-oL", "-eL"] and command[3:] == bare,
                "Unexpected stock checker command")
    check_profile(stage, check, command, "kernel-replay")
    actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$",
                        (stage / check["log_relative"]).read_text(), re.M)
    expected = modules if kernel_target == "Conjectures" else [kernel_target]
    require(Counter(actual) == Counter(expected) and len(actual) == len(set(actual))
            and check["replayed_modules"] == actual and check["stock_prefix"] == kernel_target,
            "Stock replay does not cover the exact required module multiset")


def authenticate_shard(path, receipt, model, spec, job, full_stage, full_data, ci, commit, controls):
    require(not path.is_symlink(), "Downloaded artifact is a symlink")
    require((path / "receipt.sha256").read_text() == sha(path / "receipt.json") + "\n",
            "Downloaded receipt digest differs")
    require(receipt["evidence_sha256"] == file_inventory(path), "Downloaded evidence inventory differs")
    require(receipt["schema"] == RECEIPT_SCHEMA and receipt["kind"] == "shard"
            and receipt["status"] == "passed" and receipt["job"] == job, "Wrong shard receipt scope")
    require(receipt["git_commit"] == commit and receipt["ci"] == ci and receipt["ci_job"] == "shards",
            "Shard evidence is not from this exact commit and workflow run attempt")
    require(receipt["source_policy"] == POLICY and receipt["resources"] == RESOURCES
            and receipt["gate_sha256"] == controls, "Shard policy or frozen controller differs")
    require(receipt["toolchain"]["lean_sha256"] == pilot.LEAN_SHA256
            and receipt["toolchain"]["checker_sha256"] == pilot.CHECKER_SHA256,
            "Shard compiler or stock checker identity differs")
    require(receipt["axiom_whitelist"] == list(audit.ALLOWED), "Shard axiom policy differs")
    for flag in ("all_frozen_hashes_unchanged", "all_project_sources_fresh", "all_project_modules_replayed"):
        require(receipt[flag] is True, "Shard lacks a completed proof gate")
    for flag in ("complete_prime_checked", "lower_runner_hypotheses_discharged", "accepted_registry_changed"):
        require(receipt[flag] is False, "Shard overstates its checked scope")
    p, pairs = spec["prime"], job["minimum_pairs"]
    roots = [prime_base(p) + f"B{b:03d}" for b in pairs]
    modules = source_order(roots, full_stage / "src")
    generated = expected_generated(p, pairs, spec["root_frames"])
    hashes = {module: (spec["generated_source_sha256"][module] if module in generated
                       else model["base_source_sha256"][module]) for module in modules}
    modern = {module: next(pilot.header_tokens(module_path(full_stage / "src", module).read_text()), None) == "module"
              for module in modules}
    required = required_theorems(p, pairs)
    require(receipt["roots"] == roots and receipt["project_modules"] == modules
            and receipt["generated_modules"] == sorted(generated)
            and receipt["required_theorems"] == required and receipt["modern_modules"] == modern,
            "Shard theorem or module inventory differs from regenerated source")
    require(receipt["source_sha256"] == hashes and receipt["frame_count"] == job["frame_count"]
            and receipt["initial_minimum_pairs_checked"] == pairs, "Shard input coverage differs")
    subset = {**full_data, "roots": [root for root in full_data["roots"] if root["b"] in pairs]}
    require((path / "producer-data.json").read_bytes() == encoded(subset)
            and receipt["producer_data_sha256"] == bytes_sha(encoded(subset)), "Shard numerical input differs")
    for module, digest in hashes.items():
        require(sha(module_path(path / "src", module)) == digest, "Downloaded source differs")
        if module in generated:
            require(sha(module_path(path / "generated", module)) == digest, "Downloaded generated source differs")
    for name, digest in controls.items():
        require(sha(path / "controls" / name) == digest, "Downloaded controller snapshot differs")
    objects = object_hashes(path, modules, modern)
    require(receipt["artifact_sha256"] == objects, "Downloaded proof object digest differs")
    validate_checks(path, receipt, modules, required, modern, modules)
    return objects


def run_join(model, spec, stage, artifacts, runtime_path):
    deadline = time.monotonic() + RESOURCES["controller_timeout_seconds"]
    p = spec["prime"]
    pairs = list(range(2, p // 2 + 1))
    job = {"id": f"p{p:04d}-complete", "prime": p, "minimum_pairs": pairs, "complete_prime": True}
    receipt, inputs, controls, compiler, env = begin(model, job, stage, runtime_path, "assembly")
    try:
        data, generated, roots, modules, required, source_hashes, modern = produce(model, spec, job, stage)
        receipt.update({"roots": roots, "project_modules": modules, "required_theorems": required,
                        "source_sha256": source_hashes, "modern_modules": modern,
                        "generated_modules": sorted(generated), "frame_count": spec["frame_count"],
                        "producer_data_sha256": sha(stage / "producer-data.json"), "upstream": {}})
        expected_names = {"six-speed-prime-shard-" + shard["id"] for shard in spec["shards"]}
        require(artifacts.is_dir() and not artifacts.is_symlink(), "Missing downloaded shard artifacts")
        require({path.name for path in artifacts.iterdir()} == expected_names,
                "Missing, duplicate, or unexpected shard artifact directory")
        union = {}
        for shard in spec["shards"]:
            name = "six-speed-prime-shard-" + shard["id"]
            original = artifacts / name
            shard_receipt = json.loads((original / "receipt.json").read_text())
            objects = authenticate_shard(original, shard_receipt, model, spec, shard, stage, data,
                                         receipt["ci"], receipt["git_commit"], controls)
            for module, facets in objects.items():
                if module in union:
                    require(union[module] == facets, "Duplicate shard object identity differs: " + module)
                    continue
                union[module] = facets
                for suffix, digest in facets.items():
                    relative = module.replace(".", "/") + suffix
                    source = original / "lib/lean" / relative
                    target = stage / "lib/lean" / relative
                    target.parent.mkdir(parents=True, exist_ok=True)
                    shutil.copyfile(source, target)
                    require(sha(target) == digest, "Copied shard object changed")
            preserved = stage / "upstream" / shard["id"]
            preserved.parent.mkdir(parents=True, exist_ok=True)
            shutil.copytree(original, preserved)
            require(file_inventory(preserved) == shard_receipt["evidence_sha256"]
                    and sha(preserved / "receipt.json") == sha(original / "receipt.json")
                    and (preserved / "receipt.sha256").read_text() == sha(preserved / "receipt.json") + "\n",
                    "Preserved upstream proof evidence differs")
            receipt["upstream"][shard["id"]] = {"artifact_name": name,
                "receipt_sha256": sha(preserved / "receipt.json"),
                "evidence_inventory_sha256": bytes_sha(encoded(shard_receipt["evidence_sha256"])),
                "project_modules": shard_receipt["project_modules"], "minimum_pairs": shard["minimum_pairs"]}
            save_receipt(stage, receipt)
        aggregate = prime_base(p)
        require(set(union) == set(modules) - {aggregate}, "Authenticated dependency union is incomplete or has extras")
        require(Counter(b for item in receipt["upstream"].values() for b in item["minimum_pairs"]) == Counter(pairs),
                "Full prime does not have exactly one checked owner for every minimum pair")
        require(object_hashes(stage, list(union), modern) == union, "Authenticated object union changed")
        receipt["authenticated_dependency_sha256"] = union
        receipt["source_checks"][aggregate] = compile_source(aggregate, compiler, stage, env, deadline)
        objects = object_hashes(stage, modules, modern)
        require({module: objects[module] for module in union} == union,
                "Aggregate compilation modified authenticated dependencies")
        receipt["artifact_sha256"] = objects
        receipt["axiom_audit"] = audit_closure(modules, required, modern, compiler, stage, env, deadline)
        save_receipt(stage, receipt)
        require([module for module in modules if module == aggregate or module.startswith(aggregate + ".")] == [aggregate],
                "Aggregate stock prefix does not select exactly one module")
        receipt["kernel_replay"] = replay(aggregate, [aggregate], compiler, stage, env, deadline)
        recheck_inputs(inputs, controls, model, receipt["git_commit"], compiler, stage,
                       source_hashes, generated, modules, modern, objects)
        require(sha(stage / "producer-data.json") == spec["producer_data_sha256"], "Full numerical input changed")
        validate_checks(stage, receipt, modules, required, modern, [aggregate], aggregate)
        for shard in spec["shards"]:
            preserved = stage / "upstream" / shard["id"]
            upstream = json.loads((preserved / "receipt.json").read_text())
            require(sha(preserved / "receipt.json") == receipt["upstream"][shard["id"]]["receipt_sha256"]
                    and file_inventory(preserved) == upstream["evidence_sha256"], "Upstream evidence changed during assembly")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
                        "initial_minimum_pairs_checked": pairs, "complete_prime_checked": True,
                        "every_dependency_has_fresh_source_and_exact_stock_replay": True,
                        "new_source_modules_checked": [aggregate], "new_kernel_modules_replayed": [aggregate],
                        "authenticated_exact_dependency_union": True})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save_receipt(stage, receipt, seal=receipt["status"] == "passed")
    print(json.dumps({"status": "passed", "prime": p, "modules": len(modules),
                      "complete_prime_checked": True, "lower_runner_hypotheses_discharged": False,
                      "receipt_sha256": sha(stage / "receipt.json")}))


def reproduce(model):
    for spec in model["primes"]:
        p = spec["prime"]
        data = pilot.producer.prime_data(p)
        with contextlib.redirect_stdout(sys.stderr):
            data["roots"] = [pilot.producer.search_root(data, b) for b in range(2, p // 2 + 1)]
        require(bytes_sha(encoded(data)) == spec["producer_data_sha256"], "Full data reproduction differs")
        files = dict(pilot.fast_producer.fast_files(data, 32, 32, "hybrid"))
        require({name: bytes_sha(source.encode()) for name, source in files.items()} == spec["generated_source_sha256"],
                "Full Lean source reproduction differs")
        for root in data["roots"]:
            require(bytes_sha(encoded(root)) == spec["root_data_sha256"][str(root["b"])], "Root reproduction differs")
    print(json.dumps({"status": "reproduction_passed", "primes": list(PRIMES),
                      "acceptance": "awaits all fresh shard and assembly gates"}))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    action = parser.add_mutually_exclusive_group(required=True)
    action.add_argument("--write-model", action="store_true")
    action.add_argument("--preflight", action="store_true")
    action.add_argument("--reproduce", action="store_true")
    action.add_argument("--plan", action="store_true")
    action.add_argument("--shard")
    action.add_argument("--join", type=int, choices=PRIMES)
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--shard-artifacts", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    if args.write_model:
        write_json(ROOT / MODEL, model_recipe())
    model = json.loads((ROOT / MODEL).read_text())
    validate_model(model)
    jobs = [job for spec in model["primes"] for job in spec["shards"]]
    if args.write_model or args.preflight:
        print(json.dumps({"status": "preflight_passed", "common_modules": 45,
                          "shards": len(jobs), "primes": list(PRIMES),
                          "complete_prime_checked": False}))
    elif args.plan:
        print(json.dumps({"include": [{"id": job["id"], "prime": job["prime"]} for job in jobs]}))
    elif args.reproduce:
        reproduce(model)
    elif args.shard:
        selected = [job for job in jobs if job["id"] == args.shard]
        require(len(selected) == 1, "Unknown or duplicate shard")
        job = selected[0]
        stage = (args.artifact_dir or ROOT / ".candidate-artifacts/six-speed-prime-batches" / job["id"]).resolve()
        run_shard(model, spec_for(model, job["prime"]), job, stage, args.runtime)
    else:
        require(args.shard_artifacts is not None, "Assembly requires --shard-artifacts")
        stage = (args.artifact_dir or ROOT / ".candidate-artifacts/six-speed-prime-batches" /
                 f"p{args.join:04d}-complete").resolve()
        run_join(model, spec_for(model, args.join), stage, args.shard_artifacts.resolve(), args.runtime)


if __name__ == "__main__":
    main()
