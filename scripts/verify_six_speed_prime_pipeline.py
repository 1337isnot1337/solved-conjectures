#!/usr/bin/env python3
"""Generate and independently check complete six-speed support certificates.

The producer is untrusted. Every generated proposition is compiled from source,
every owned declaration is audited, and each original module is replayed by the
unchanged stock kernel. A selected-root pilot never receives full-prime status.
"""
from __future__ import annotations

import argparse
from graphlib import TopologicalSorter
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

import audit_lean_all_owned as audit
import generate_six_speed_prime_certificates as producer
import generate_six_speed_prime_fast as fast_producer
import verify_frankl_orbit_batches as runtime
from replay_lean import header_tokens, imports_of

ROOT = Path(__file__).resolve().parents[1]
MODEL = "docs/six-speed-prime-pipeline-sources.json"
CONTROLLER = "scripts/verify_six_speed_prime_pipeline.py"
WORKFLOW = ".github/workflows/lean-six-speed-prime-pipeline.yml"
PRODUCERS = (
    "scripts/generate_six_speed_prime_certificates.py",
    "scripts/generate_six_speed_prime_arithmetic.py",
    "scripts/generate_six_speed_prime_assembly.py",
    "scripts/generate_six_speed_prime_fast.py",
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
POLICY = {"warning_as_error": True, "linter_override": False, "fresh_project_objects": True}
FACETS = (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig")


def require(condition, message):
    if not condition:
        raise RuntimeError(message)


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + "\n").encode()


def module_path(base, module):
    return base / (module.replace(".", "/") + ".lean")


def validate_model(model):
    require(model["schema"] == "six-speed-prime-pipeline-v1", "Unexpected source model")
    require(model["source_policy"] == POLICY, "Strict source policy changed")
    require(model["base_roots"] == [
        "Conjectures.LonelinessSixSpeedFiniteSound",
        "Conjectures.LonelinessModularCoverCuts",
        "Conjectures.LonelinessModularInitialMemo",
        "Conjectures.LonelinessModularCoverFastCuts"], "Base roots changed")
    modules = runtime.dependency_order(model["base_roots"])
    require(set(modules) == set(model["base_source_sha256"]), "Common source closure differs")
    for module in modules:
        require(sha(module_path(ROOT / "lean", module)) == model["base_source_sha256"][module],
                "Pinned common source changed: " + module)
    expected_controls = set(PRODUCERS + HELPERS + CONFIGURATION)
    require(set(model["control_sha256"]) == expected_controls, "Control inventory changed")
    for path, digest in model["control_sha256"].items():
        require(sha(ROOT / path) == digest, "Pinned helper/producer/configuration changed: " + path)
    require(model["block_size"] == 32, "Fragment dispatch size changed")
    require(model["layout"] == "hybrid" and model["combined_frame_limit"] == 32,
            "Hybrid layout policy changed")
    require(model["numeric_checker"] == "proved_linear_population_count",
            "Numeric proof transport changed")
    jobs = model["jobs"]
    require(jobs and len({job["id"] for job in jobs}) == len(jobs), "Empty or duplicate jobs")
    for job in jobs:
        p, pairs = job["prime"], job["minimum_pairs"]
        require(p in (271, 307, 313, 359, 373, 379, 383), "Unreviewed modulus")
        require(pairs == sorted(set(pairs)) and pairs
                and all(2 <= b <= p // 2 for b in pairs), "Invalid minimum-pair inventory")
        complete = pairs == list(range(2, p // 2 + 1))
        require(job["complete_prime"] is complete, "Full-prime claim differs from root coverage")
        require(re.fullmatch(r"p[0-9]{4}-(pilot|complete)", job["id"]), "Invalid job name")
        require(job["id"] == f"p{p:04d}-" + ("complete" if complete else "pilot"),
                "Job identifier disagrees with scope")
    return modules


def produce(job, model, stage):
    p = job["prime"]
    data = producer.prime_data(p)
    data["roots"] = [producer.search_root(data, b) for b in job["minimum_pairs"]]
    for root in data["roots"]:
        producer.validate_root(data, root)
    (stage / "producer-data.json").write_bytes(encoded(data))
    generated = dict(fast_producer.fast_files(data, model["block_size"],
                    model["combined_frame_limit"], model["layout"]))
    base = f"Conjectures.LonelinessSixSpeedPrime{p:04d}"
    expected = {base + "Arithmetic", base + "Rows"}
    for root in data["roots"]:
        prefix = base + f"B{root['b']:03d}"
        expected.add(prefix)
        if len(root["frames"]) > model["combined_frame_limit"]:
            expected.update({prefix + "Arithmetic", prefix + "Data"})
            expected.update(prefix + f"Checks{i:03d}" for i in
                            range((len(root["frames"]) + model["block_size"] - 1) // model["block_size"]))
    if job["complete_prime"]:
        expected.add(base)
    require(set(generated) == expected, "Generated module inventory disagrees with selected roots")
    for module, text in generated.items():
        dest = module_path(stage / "generated", module)
        dest.parent.mkdir(parents=True, exist_ok=True)
        dest.write_text(text)
    roots = [base] if job["complete_prime"] else [base + f"B{b:03d}" for b in job["minimum_pairs"]]
    graph = {}
    def visit(module):
        if module in graph:
            return
        path = module_path(stage / "generated", module) if module in generated else module_path(ROOT / "lean", module)
        require(path.is_file(), "Missing proof source: " + module)
        dependencies = [name for name in imports_of(path) if name.startswith("Conjectures.")]
        graph[module] = sorted(set(dependencies))
        for name in dependencies:
            visit(name)
    for module in roots:
        visit(module)
    modules = list(TopologicalSorter(graph).static_order())
    require(set(modules) == set(generated) | set(model["base_source_sha256"]),
            "Generated proof closure has missing or unexpected common sources")
    ns = f"Loneliness.Modular.SixSpeed.Prime{p:04d}"
    required = [ns + ".inverse_valid", ns + ".rows_valid", ns + ".terminal_sound"]
    required += ["Loneliness.Modular.SupportSearch.Bits.Fast.count_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_eq",
                 "Loneliness.Modular.SupportSearch.Bits.FastCuts.boundedCheck_sound"]
    required += [ns + f".B{b:03d}.root_checked" for b in job["minimum_pairs"]]
    if job["complete_prime"]:
        required += [ns + ".initial_checked", ns + ".primitive_classification", ns + ".value_eq_of_tight"]
    source_hashes, modern = {}, {}
    for module in modules:
        origin = module_path(stage / "generated", module) if module in generated else module_path(ROOT / "lean", module)
        if module not in generated:
            require(sha(origin) == model["base_source_sha256"][module],
                    "Common source changed after preflight: " + module)
        dest = module_path(stage / "src", module)
        dest.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(origin, dest)
        source_hashes[module] = sha(dest)
        if module not in generated:
            require(source_hashes[module] == model["base_source_sha256"][module],
                    "Copied common source differs from the pinned model: " + module)
        modern[module] = next(header_tokens(dest.read_text()), None) == "module"
    return data, generated, roots, modules, required, source_hashes, modern


def object_hashes(stage, modules, modern):
    result = {}
    for module in modules:
        stem = stage / "lib/lean" / module.replace(".", "/")
        result[module] = {}
        for suffix in FACETS:
            path = Path(str(stem) + suffix)
            require(not path.is_symlink(), "Project object is a symlink: " + str(path))
            if path.is_file():
                result[module][suffix] = sha(path)
        needed = set(FACETS[:3]) if modern[module] else {".olean"}
        require(needed <= set(result[module]), "Missing object facet: " + module)
        require((".olean.private" in result[module]) == (".olean.server" in result[module]),
                "Partial private/server pair: " + module)
    actual = {".".join(p.relative_to(stage / "lib/lean").with_suffix("").parts)
              for p in (stage / "lib/lean/Conjectures").rglob("*.olean")}
    require(actual == set(modules), "Staged project object closure differs")
    return result


def verify(model, job, stage, runtime_path):
    require(not stage.exists() or not any(stage.iterdir()), "Use a fresh empty artifact directory")
    for name in ("generated", "src", "lib/lean", "logs", "progress"):
        (stage / name).mkdir(parents=True, exist_ok=True)
    compiler, external, identity = runtime.resolve_runtime(runtime_path)
    require(identity["lean_sha256"] == LEAN_SHA256 and identity["checker_sha256"] == CHECKER_SHA256,
            "Compiler or unchanged stock checker differs from pinned binary")
    controls = {**model["control_sha256"], **{p: sha(ROOT / p) for p in (MODEL, CONTROLLER, WORKFLOW)}}
    commit = subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
    receipt = {"schema": "six-speed-prime-pipeline-receipt-v1", "status": "running",
        "git_commit": commit, "job": job, "source_policy": POLICY, "gate_sha256": controls,
        "toolchain": identity, "axiom_whitelist": list(audit.ALLOWED),
        "source_workers": 1, "kernel_threads": 1, "source_checks": {}, "kernel_checks": {},
        "complete_prime_checked": False, "lower_runner_hypotheses_discharged": False,
        "accepted_registry_changed": False}
    def save():
        (stage / "receipt.json").write_bytes(encoded(receipt))
    environment = {**os.environ, "PATH": str(compiler / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_SYSROOT": str(compiler), "LEAN_NUM_THREADS": "1", "UV_USE_IO_URING": "0"}
    try:
        data, generated, roots, modules, required, source_hashes, modern = produce(job, model, stage)
        receipt.update({"roots": roots, "project_modules": modules, "required_theorems": required,
            "source_sha256": source_hashes, "modern_modules": modern,
            "generated_modules": sorted(generated), "producer_data_sha256": sha(stage / "producer-data.json"),
            "frame_count": sum(len(root["frames"]) for root in data["roots"])})
        save()
        for module in modules:
            output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), module.replace(".", "/") + ".lean"]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"), stage / "progress" / (module + ".source.json"), 1800)
            receipt["source_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Strict source failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
        frozen_objects = object_hashes(stage, modules, modern)
        receipt["artifact_sha256"] = frozen_objects
        audit_text = audit.audit_source(modules, required, ["Loneliness."])
        audit_path = stage / "src/SixSpeedPrimeAudit.lean"
        audit_path.write_text(audit_text)
        check = runtime.profile([str(compiler / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit_path.name],
            stage / "src", environment, stage / "logs/all-owned-audit.log", stage / "progress/all-owned-audit.json", 1800)
        receipt["axiom_audit"] = check
        save()
        require(check["exit_code"] == 0 and check["timed_out"] is False,
                "All-owned audit failed:\n" + Path(check["log"]).read_text()[-12000:])
        spec = {"modules": modules, "required": required, "legacy_prefixes": ["Loneliness."]}
        inventory = audit.validate_log(Path(check["log"]).read_text(), spec, modern)
        require(all(inventory["declarations"][name]["kind"] == "theorem" for name in required),
                "Required endpoint is not a theorem")
        (stage / "declaration-inventory.json").write_bytes(encoded(inventory))
        check.update({"all_owned_declarations_audited": True, "exact_raw_private_visibility": True,
            "complete_serialized_private_import": True, "summary": inventory["summary"],
            "audit_source_sha256": sha(audit_path),
            "declaration_inventory_sha256": sha(stage / "declaration-inventory.json")})
        replayed = []
        for module in modules:
            require([name for name in modules if name == module or name.startswith(module + ".")] == [module],
                    "Stock replay target is not an exact singleton")
            command = [str(compiler / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            check = runtime.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"), stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = check
            save()
            require(check["exit_code"] == 0 and check["timed_out"] is False,
                    "Stock kernel replay failed: " + module + "\n" + Path(check["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying (Conjectures\.[A-Za-z0-9_.]+)$", Path(check["log"]).read_text(), re.M)
            require(actual == [module], "Stock checker replay inventory differs")
            check.update({"replayed_modules": actual, "exact_singleton_target": True})
            replayed.extend(actual)
        require(replayed == modules, "Incomplete exact kernel closure")
        require(object_hashes(stage, modules, modern) == frozen_objects, "Compiled object bytes changed")
        for module, digest in source_hashes.items():
            require(sha(module_path(stage / "src", module)) == digest, "Copied source changed")
            if module in generated:
                require(sha(module_path(stage / "generated", module)) == digest, "Generated source changed")
            else:
                require(sha(module_path(ROOT / "lean", module)) == digest, "Common source changed")
        for path, digest in controls.items():
            require(sha(ROOT / path) == digest, "Gate control changed: " + path)
        for check in [*receipt["source_checks"].values(), receipt["axiom_audit"], *receipt["kernel_checks"].values()]:
            require(sha(check["log"]) == check["log_sha256"], "Verification log changed")
        require(audit_path.read_text() == audit_text and sha(stage / "declaration-inventory.json") ==
                receipt["axiom_audit"]["declaration_inventory_sha256"], "Audit evidence changed")
        require(sha(stage / "producer-data.json") == receipt["producer_data_sha256"], "Producer data changed")
        require(sha(compiler / "bin/lean") == LEAN_SHA256 and sha(compiler / "bin/leanchecker") == CHECKER_SHA256,
                "Compiler or unchanged stock checker changed")
        require(subprocess.check_output(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip() == commit,
                "Frozen checkout commit changed")
        receipt.update({"status": "passed", "all_frozen_hashes_unchanged": True,
            "initial_minimum_pairs_checked": job["minimum_pairs"], "complete_prime_checked": job["complete_prime"],
            "kernel_replay": {"replayed_modules": replayed, "exact_project_closure": True,
                "all_modules_replayed_as_targets": True, "fresh_process_per_module": True}})
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        save()
    print(json.dumps({"status": "passed", "job": job["id"], "modules": len(modules),
        "complete_prime_checked": job["complete_prime"], "receipt_sha256": sha(stage / "receipt.json")}), flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--job")
    parser.add_argument("--artifact-dir", type=Path)
    parser.add_argument("--runtime", type=Path)
    args = parser.parse_args()
    model = json.loads((ROOT / MODEL).read_text())
    validate_model(model)
    if args.plan:
        print(json.dumps({"include": [{"id": job["id"]} for job in model["jobs"]]}))
        return
    selected = [job for job in model["jobs"] if job["id"] == args.job]
    require(len(selected) == 1, "Select exactly one declared job")
    stage = args.artifact_dir or ROOT / ".candidate-artifacts/six-speed-prime-pipeline" / args.job
    verify(model, selected[0], stage.resolve(), args.runtime)


if __name__ == "__main__":
    main()
