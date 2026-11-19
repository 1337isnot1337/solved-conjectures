#!/usr/bin/env python3
"""Verify recovered and reconstructed graph helpers with fresh exact gates.

The source inventory distinguishes exact recoveries from new proof bodies.
All project declarations and the full stock replay closure are checked.
The concrete large graph and rank certificates remain separate obligations.
"""

from __future__ import annotations

import argparse
import json
import os
from pathlib import Path
import re
import subprocess

from plan_lean_candidates import changed_sources
from verify_frankl_fc_candidate import audit_exact_closure, maximal_tasks
from verify_lean_candidate import ROOT, LEAN, digest, revision, source_hashes
from verify_line_size_candidate import check_sources, dependency_order


INVENTORY_PATH = "docs/frankl-graph-helpers-sources.json"
INVENTORY = json.loads((ROOT / INVENTORY_PATH).read_text())
TASKS = {"helpers": (INVENTORY["root"], INVENTORY["required_theorems"])}


def preflight_sources():
    if INVENTORY["schema"] != "frankl-span-four-graph-helpers-recovery-v1":
        raise ValueError("Graph helper inventory schema differs")
    for path, record in INVENTORY["sources"].items():
        if digest(ROOT / path) != record["sha256"]:
            raise ValueError("Graph helper source differs from reviewed bytes: " + path)


GATE_INPUTS = (
    "scripts/verify_frankl_graph_helpers.py",
    INVENTORY_PATH,
    "scripts/verify_frankl_fc_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/verify_line_size_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    ".github/workflows/lean-frankl-graph-helpers.yml",
    "lean/lean-toolchain",
    "lean/lakefile.toml",
    "lean/lake-manifest.json",
)


def gate_hashes():
    return {path: digest(ROOT / path) for path in GATE_INPUTS}


def task_closures():
    return {task: frozenset(dependency_order([target]))
            for task, (target, _) in TASKS.items()}


def task_spec(task, closures=None):
    closures = task_closures() if closures is None else closures
    covered = sorted(name for name in TASKS if closures[name] <= closures[task])
    # A larger retained closure must also check every endpoint belonging to
    # its contained tasks, including tasks suppressed by maximal selection.
    required = sorted({endpoint for name in covered for endpoint in TASKS[name][1]})
    target = TASKS[task][0]
    return target, dependency_order([target]), covered, required


def ci_plan(changed):
    closures = task_closures()
    global_inputs = set(GATE_INPUTS) | {
        "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    }
    affected = []
    for task, modules in closures.items():
        paths = {"lean/" + module.replace(".", "/") + ".lean" for module in modules}
        if changed is None or changed & (global_inputs | paths):
            affected.append(task)
    retained = maximal_tasks(affected, closures)
    return {"tasks": retained, "affected_tasks": sorted(affected),
            "covered_tasks": {task: task_spec(task, closures)[2] for task in retained},
            "required_theorems": {task: task_spec(task, closures)[3] for task in retained}}



def logged_run(command, log_path):
    print("+ " + " ".join(command), flush=True)
    output = []
    with log_path.open("w") as log:
        process = subprocess.Popen(command, cwd=LEAN, text=True, stdout=subprocess.PIPE,
                                   stderr=subprocess.STDOUT,
                                   env={**os.environ, "LEAN_NUM_THREADS": "1"})
        assert process.stdout is not None
        for line in process.stdout:
            print(line, end="", flush=True)
            log.write(line)
            output.append(line)
        result = process.wait()
    if result:
        raise subprocess.CalledProcessError(result, command)
    return "".join(output)

def assert_exact_replay_set(output, modules):
    replayed = re.findall(r"^replaying ([A-Za-z0-9_.]+)$", output, re.MULTILINE)
    if len(replayed) != len(set(replayed)):
        raise RuntimeError("kernel replay reported duplicate project modules")
    if set(replayed) != set(modules):
        missing = sorted(set(modules) - set(replayed))
        extra = sorted(set(replayed) - set(modules))
        raise RuntimeError(f"kernel replay set mismatch: missing={missing}; extra={extra}")
    return replayed

def replay_exact_closure(target, modules, destination):
    log = destination / "kernel-replay.log"
    output = logged_run(["lake", "env", "python3", "../scripts/replay_lean.py", "--root", target], log)
    replayed = assert_exact_replay_set(output, modules)
    return {"replayed_modules": replayed, "exact_replay_set": True,
            "log_sha256": digest(log)}

def object_hashes(modules):
    result = {}
    for module in modules:
        stem = LEAN / ".lake/build/lib/lean" / module.replace(".", "/")
        artifacts = {}
        for suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"):
            path = Path(str(stem) + suffix)
            if path.is_symlink():
                raise RuntimeError(f"project proof artifacts must be materialized: {path}")
            if not path.is_file():
                if suffix.startswith(".olean"):
                    raise RuntimeError(f"missing modern Lean object facet: {path}")
                continue
            artifacts[suffix] = digest(path)
        result[module] = artifacts
    return result

def check_output_paths(modules):
    for module in modules:
        stem = LEAN / ".lake/build/lib/lean" / module.replace(".", "/")
        for suffix in (".olean", ".olean.private", ".olean.server", ".ir", ".ir.sig"):
            path = Path(str(stem) + suffix)
            if path.is_symlink():
                raise RuntimeError(f"refusing to overwrite a symlinked project artifact: {path}")

def check_pinned_checker():
    command = ["lake", "env", "python3", "-c",
               "import shutil; print(shutil.which('leanchecker') or '')"]
    path = subprocess.check_output(command, cwd=LEAN, text=True).strip()
    if not path or not Path(path).is_file():
        raise RuntimeError("pinned Lean checker is unavailable")
    actual = digest(Path(path))
    if actual != "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6":
        raise RuntimeError("Lean checker differs from the reviewed stock pinned binary")
    return {"path": path, "sha256": actual}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*", help="explicit changed paths for --plan-ci")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        plan = ci_plan(changed)
        print(json.dumps(plan, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(plan["tasks"], separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    if args.files is not None:
        parser.error("--files requires --plan-ci")
    target, modules, covered, required = task_spec(args.task)
    if args.plan:
        print(json.dumps({"task": args.task, "target": target,
                          "covered_tasks": covered, "required": required,
                          "project_modules": modules}, indent=2))
        return
    preflight_sources()
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial,
        "gate_sha256": initial_gate, "required_theorems": required,
        "covered_tasks": covered, "status": "running", "completed_checks": [],
        "scope": INVENTORY["scope"],
        "recovery_inventory": INVENTORY,
    }
    destination = ROOT / ".candidate-artifacts" / ("frankl-graph-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        receipt["checker"] = check_pinned_checker()
        check_output_paths(modules)
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        initial_objects = object_hashes(modules)
        receipt["artifact_sha256"] = initial_objects
        receipt["axiom_audit"] = audit_exact_closure(modules, required, destination)
        receipt["completed_checks"].append(
            "explicit import-all axiom whitelist and exact private-node visibility")
        receipt["kernel_replay"] = replay_exact_closure(target, modules, destination)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("source or gate changed during verification")
        if object_hashes(modules) != initial_objects or check_pinned_checker() != receipt["checker"]:
            raise RuntimeError("proof objects or stock checker changed during verification")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS frankl-graph-{args.task}: strict source, axiom and pinned kernel gates", flush=True)


if __name__ == "__main__":
    main()
