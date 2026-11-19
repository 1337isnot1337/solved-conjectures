#!/usr/bin/env python3
"""Verify the complete initial span-four graph with bounded kernel processes.

Every project source is freshly compiled. The full exact closure is audited
with import-all, including each named private numeric proof and all owned
definitions. Every module is then a singleton stock-kernel replay target in
its own process. Imported modules are not silently counted as replayed.
"""

from __future__ import annotations

import argparse
from concurrent.futures import FIRST_COMPLETED, ThreadPoolExecutor, wait
import gzip
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import sys
import time

import verify_frankl_graph_helpers as helpers
import verify_frankl_graph_pilot as pilot
import verify_frankl_orbit_batches as orbit
from replay_lean import imports_of


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
INVENTORY_PATH = "docs/frankl-full-graph-sources.json"
PRODUCER_PATH = "results/frankl-generator-families/generate_span_four_full_graph_lean.py"
GATE_INPUTS = (
    "scripts/verify_frankl_full_graph.py",
    "scripts/verify_frankl_graph_pilot.py",
    "scripts/verify_frankl_graph_helpers.py",
    "scripts/verify_frankl_orbit_batches.py",
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-full-graph.yml",
    INVENTORY_PATH,
    "docs/frankl-graph-helpers-sources.json",
    "lean/Conjectures/FranklSpanFourGraphHelpers.lean",
    PRODUCER_PATH,
    "results/frankl-generator-families/generate_span_four_graph_certificate.py",
    "results/frankl-generator-families/span_four.py",
    "results/frankl-generator-families/window_filter.cpp",
    "results/frankl-generator-families/window_replay.cpp",
    "results/frankl-generator-families/width_four_weight_candidates.json",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
)


def validate(inventory):
    if inventory["schema"] != "frankl-span-four-full-graph-v1":
        raise ValueError("Unexpected graph inventory schema")
    helpers.preflight_sources()
    modules = orbit.dependency_order([inventory["root"]])
    if set(modules) != set(inventory["source_sha256"]):
        raise ValueError("Inventory differs from the exact project import closure")
    for module in modules:
        if orbit.digest(orbit.source(module)) != inventory["source_sha256"][module]:
            raise ValueError("Pinned source changed: " + module)
        selected = [name for name in modules
                    if name == module or name.startswith(module + ".")]
        if selected != [module]:
            raise ValueError("Kernel target has strict component-prefix descendants: " + module)
    for path, expected in inventory["engine_sha256"].items():
        if orbit.digest(ROOT / path) != expected:
            raise ValueError("Reviewed engine changed: " + path)
    private_by_module = helpers.explicit_private_proofs(modules)
    private = sorted(name for names in private_by_module.values() for name in names)
    if private != inventory["required_explicit_private_proofs"]:
        raise ValueError("Explicit private-proof inventory differs")
    required = inventory["required_theorems"]
    if required != sorted(set(required)):
        raise ValueError("Required theorem list is not sorted and duplicate-free")
    if any("Vaughan" in module or "Matching" in module for module in modules):
        raise ValueError("Initial graph must not import the heavy FC branch")
    return modules, required, private


def reproduce(inventory, directory):
    if directory.exists() and any(directory.iterdir()):
        raise ValueError("Preserve existing reproduction evidence: " + str(directory))
    directory.mkdir(parents=True, exist_ok=True)
    rendered = directory / "Conjectures"
    command = [sys.executable, str(ROOT / PRODUCER_PATH),
        "--output", str(directory / "candidate.json.gz"),
        "--report", str(directory / "producer-report.json"),
        "--full-dir", str(rendered),
        "--checks-per-module", "8", "--extension-limit", "12000",
        "--table-leaf-size", "255", "--table-module-nodes", "4096",
        "--edge-limit", "1024"]
    result = orbit.profile(command, ROOT, dict(os.environ),
        directory / "producer.log", directory / "producer-progress.json", 1800)
    if result["exit_code"]:
        raise RuntimeError("Full graph producer failed: " +
            (directory / "producer.log").read_text()[-12000:])
    names = sorted(path.name for path in rendered.glob("*.lean"))
    if names != sorted(inventory["rendered_sources"]):
        raise ValueError("Unexpected generated module set")
    hashes = {}
    for name, expected in inventory["rendered_sources"].items():
        actual = orbit.digest(rendered / name)
        if actual != expected or (rendered / name).read_bytes() != (LEAN / "Conjectures" / name).read_bytes():
            raise ValueError("Producer output differs from published source: " + name)
        hashes[name] = actual
    raw = gzip.decompress((directory / "candidate.json.gz").read_bytes())
    if hashlib.sha256(raw).hexdigest() != inventory["candidate_snapshot_sha256"]:
        raise ValueError("Original graph candidate snapshot changed")
    report = json.loads((directory / "producer-report.json").read_text())
    full = report["full_graph"]
    observed = {key: full[key] for key in inventory["producer_layout"]}
    if observed != inventory["producer_layout"]:
        raise ValueError("Full producer layout differs")
    if full["root"] != inventory["root"] or sorted(full["required_endpoints"]) != inventory["generated_endpoints"]:
        raise ValueError("Producer root or endpoint inventory differs")
    evidence = {"status": "reproduced", "formal_status": "Untrusted witness reproduction only.",
        "producer": result, "rendered_source_sha256": hashes,
        "candidate_snapshot_sha256": inventory["candidate_snapshot_sha256"],
        "report_sha256": orbit.digest(directory / "producer-report.json")}
    (directory / "receipt.json").write_text(json.dumps(evidence, indent=2, sort_keys=True) + "\n")
    return evidence


def run(args, inventory, modules, required, private):
    stage = (args.artifact_dir or ROOT / ".candidate-artifacts/frankl-full-graph").resolve()
    if stage.exists() and any(stage.iterdir()):
        raise ValueError("Preserve existing proof evidence: " + str(stage))
    for suffix in ("src", "lib/lean", "logs", "progress"):
        (stage / suffix).mkdir(parents=True, exist_ok=True)
    initial_sources = {m: orbit.digest(orbit.source(m)) for m in modules}
    initial_gate = {path: orbit.digest(ROOT / path) for path in GATE_INPUTS}
    runtime, external, toolchain = orbit.resolve_runtime(args.runtime)
    environment = {**os.environ,
        "PATH": str(runtime / "bin") + os.pathsep + os.environ.get("PATH", ""),
        "LEAN_PATH": os.pathsep.join([str(stage / "lib/lean"), *external]),
        "LEAN_NUM_THREADS": "1"}
    receipt = {"status": "running", "scope": inventory["scope"],
        "root": inventory["root"], "project_modules": modules,
        "source_sha256": initial_sources, "gate_sha256": initial_gate,
        "required_endpoints": required, "required_private_endpoints": private,
        "toolchain": toolchain, "source_workers": args.jobs, "kernel_threads": 1,
        "kernel_mode": "fresh singleton stock-checker process for each exact project module",
        "lean_path": environment["LEAN_PATH"], "source_checks": {}, "kernel_checks": {},
        "axiom_whitelist": ["propext", "Classical.choice", "Quot.sound"]}
    try:
        receipt["git_commit"] = subprocess.check_output(
            ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True).strip()
        receipt["reproduction"] = reproduce(inventory, stage.with_name(stage.name + "-reproduction"))
        for module in modules:
            target = orbit.source(module, stage / "src")
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(orbit.source(module), target)
        if initial_sources != {m: orbit.digest(orbit.source(m, stage / "src")) for m in modules}:
            raise RuntimeError("Source changed before staged compilation")
        graph = {m: set(imports_of(orbit.source(m))) & set(modules) for m in modules}
        pending, done, running = set(modules), set(), {}
        began = time.monotonic()

        def compile_module(module):
            output = stage / "lib/lean" / (module.replace(".", "/") + ".olean")
            output.parent.mkdir(parents=True, exist_ok=True)
            command = [str(runtime / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true",
                       "-o", str(output), module.replace(".", "/") + ".lean"]
            return orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".source.log"),
                stage / "progress" / (module + ".source.json"), 1800)

        with ThreadPoolExecutor(max_workers=args.jobs) as pool:
            while pending or running:
                for module in modules:
                    if module in pending and graph[module] <= done and len(running) < args.jobs:
                        pending.remove(module)
                        running[pool.submit(compile_module, module)] = module
                if not running:
                    raise RuntimeError("Source dependency scheduler stalled")
                finished, _ = wait(running, return_when=FIRST_COMPLETED)
                for future in finished:
                    module = running.pop(future)
                    result = future.result()
                    receipt["source_checks"][module] = result
                    orbit.write_receipt(stage, receipt)
                    if result["exit_code"]:
                        raise RuntimeError("Strict source failed: " + module + "\n" +
                            Path(result["log"]).read_text()[-12000:])
                    done.add(module)
        if done != set(modules):
            raise RuntimeError("Not every project source was freshly checked")
        receipt["source_wall_seconds"] = round(time.monotonic() - began, 3)
        objects = orbit.artifact_hashes(stage, modules)
        receipt["artifact_sha256"] = objects
        audit = stage / "src/FullGraphAudit.lean"
        audit_text = pilot.audit_source(modules, required, private)
        audit.write_text(audit_text)
        audit_hash = orbit.digest(audit)
        receipt["audit_source_sha256"] = audit_hash
        command = [str(runtime / "bin/lean"), "-j1", "-M4500", "-DwarningAsError=true", audit.name]
        result = orbit.profile(command, stage / "src", environment,
            stage / "logs/axiom-audit.log", stage / "progress/axiom-audit.json", 900)
        receipt["axiom_audit"] = result
        if result["exit_code"]:
            raise RuntimeError("All-declaration audit failed: " + Path(result["log"]).read_text()[-12000:])
        receipt["declaration_inventory"] = pilot.declaration_inventory(stage, modules, required, private)
        result["audit_source_sha256"] = audit_hash
        result["all_declarations_audited"] = True
        result["explicit_import_all"] = True
        replayed = []
        verified = set()
        for module in modules:
            if not graph[module] <= verified:
                raise RuntimeError("A dependency has not completed its own replay: " + module)
            selected = [name for name in modules
                        if name == module or name.startswith(module + ".")]
            if selected != [module]:
                raise RuntimeError("Replay prefix is not an exact singleton: " + module)
            command = [str(runtime / "bin/leanchecker"), "-v", module]
            if buffer := shutil.which("stdbuf"):
                command = [buffer, "-oL", "-eL", *command]
            result = orbit.profile(command, stage / "src", environment,
                stage / "logs" / (module + ".kernel.log"),
                stage / "progress" / (module + ".kernel.json"), 1800)
            receipt["kernel_checks"][module] = result
            orbit.write_receipt(stage, receipt)
            if result["exit_code"]:
                raise RuntimeError("Stock kernel failed: " + module + "\n" +
                    Path(result["log"]).read_text()[-12000:])
            actual = re.findall(r"^replaying ([A-Za-z0-9_.]+)$",
                                Path(result["log"]).read_text(), re.M)
            if actual != [module]:
                raise RuntimeError("Kernel did not replay exactly its named module: " + module +
                                   "; actual=" + repr(actual))
            result["replayed_modules"] = actual
            result["exact_singleton_target"] = True
            replayed.extend(actual)
            verified.add(module)
        if sorted(replayed) != sorted(modules) or len(replayed) != len(set(replayed)):
            raise RuntimeError("Singleton replay union differs from the exact full import closure")
        receipt["kernel_replay"] = {
            "replayed_modules": replayed, "exact_project_closure": True,
            "all_modules_replayed_as_targets": True, "fresh_process_per_module": True,
            "singleton_target_guards": True,
            "seconds": round(sum(r["seconds"] for r in receipt["kernel_checks"].values()), 3),
            "peak_rss_kib": max(r["peak_rss_kib"] for r in receipt["kernel_checks"].values())}
        if initial_sources != {m: orbit.digest(orbit.source(m)) for m in modules}:
            raise RuntimeError("Repository source changed during the gate")
        if initial_sources != {m: orbit.digest(orbit.source(m, stage / "src")) for m in modules}:
            raise RuntimeError("Staged source changed during the gate")
        if initial_gate != {path: orbit.digest(ROOT / path) for path in GATE_INPUTS}:
            raise RuntimeError("Gate or candidate input changed during the gate")
        if audit.read_text() != audit_text or orbit.digest(audit) != audit_hash:
            raise RuntimeError("Generated all-declaration audit changed during verification")
        if orbit.digest(stage / "declaration-inventory.json") != receipt["declaration_inventory"]["declaration_inventory_sha256"]:
            raise RuntimeError("Generated declaration inventory changed during verification")
        for result in [*receipt["source_checks"].values(), receipt["axiom_audit"],
                       *receipt["kernel_checks"].values()]:
            if orbit.digest(Path(result["log"])) != result["log_sha256"]:
                raise RuntimeError("Recorded verification log changed: " + result["log"])
        if objects != orbit.artifact_hashes(stage, modules):
            raise RuntimeError("Modern proof facets changed after strict source compilation")
        if orbit.digest(runtime / "bin/leanchecker") != orbit.CHECKER_SHA256:
            raise RuntimeError("Pinned stock checker changed")
        if orbit.digest(runtime / "bin/lean") != toolchain["lean_sha256"]:
            raise RuntimeError("Compiler changed")
        receipt["all_frozen_hashes_unchanged"] = True
        receipt["status"] = "passed"
    except BaseException as error:
        receipt.update({"status": "failed", "error": str(error)})
        raise
    finally:
        orbit.write_receipt(stage, receipt)
    print(json.dumps({"status": "passed", "modules": len(modules),
        "required_endpoints": len(required), "private_proofs": len(private),
        "receipt": str(stage / "receipt.json"),
        "receipt_sha256": orbit.digest(stage / "receipt.json"),
        "kernel_replay": receipt["kernel_replay"]}, indent=2), flush=True)
    print("PASS: complete initial graph coverage, retained partition and pair/residual ranks.", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--jobs", type=int, default=4, choices=range(1, 5))
    parser.add_argument("--runtime", type=Path)
    parser.add_argument("--artifact-dir", type=Path)
    args = parser.parse_args()
    inventory = json.loads((ROOT / INVENTORY_PATH).read_text())
    modules, required, private = validate(inventory)
    if args.plan:
        print(json.dumps({"root": inventory["root"], "modules": modules,
            "required": required, "private": private,
            "source_workers": args.jobs, "kernel_threads": 1,
            "kernel_mode": "exact singleton target per fresh process"}, indent=2))
        return
    run(args, inventory, modules, required, private)


if __name__ == "__main__":
    main()
