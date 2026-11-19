#!/usr/bin/env python3
"""Check one unregistered Erdos-Gyarfas sharp-example proof closure.

Each successful task is a component receipt. It does not register the sources
in the accepted package or establish that every claim in the note is complete.
"""

from __future__ import annotations

import argparse
from graphlib import TopologicalSorter
import json
import os
import subprocess

from plan_lean_candidates import changed_sources
from replay_lean import imports_of, local_closure
from verify_lean_candidate import (
    ROOT, LEAN, audit, digest, revision, run, source, source_hashes,
)


TASKS = {
    'main': ('Conjectures.ErdosGyarfasSharpMain', [
        'ErdosGyarfasSharp.cycle_length_not_four_eight_sixteen',
        'ErdosGyarfasSharp.power_of_two_cycle_length_ge32',
        'ErdosGyarfasSharp.least_power_of_two_cycle_length',
        'ErdosGyarfasSharp.sharp95_connected_and_least_power_cycle',
        'ErdosGyarfasSharp.sharp95_cyclic_cover_and_least_power_cycle',
    ]),
    'certificate': ('Conjectures.ErdosGyarfasSharpCertificate', [
        'ErdosGyarfasSharp.dfs_root_zero',
        'ErdosGyarfasSharp.dfs_root_one',
        'ErdosGyarfasSharp.dfs_root_two',
        'ErdosGyarfasSharp.dfs_root_three',
        'ErdosGyarfasSharp.dfs_root_four',
        'ErdosGyarfasSharp.dfs_all_roots',
    ]),
    'graph': ('Conjectures.ErdosGyarfasSharpGraph', [
        'ErdosGyarfasSharp.mem_neighbors_iff',
        'ErdosGyarfasSharp.sheetTranslation_neg_apply',
        'ErdosGyarfasSharp.card_vertices',
        'ErdosGyarfasSharp.sharpGraph_connected',
    ]),
    'cover': ('Conjectures.ErdosGyarfasSharpCover', [
        'ErdosGyarfasSharp.sharpGraph_adj_iff_base',
        'ErdosGyarfasSharp.baseProjection_neighbor_bijective',
        'ErdosGyarfasSharp.projectionFiber_card',
        'ErdosGyarfasSharp.projectionFiber_vadd_coe',
        'ErdosGyarfasSharp.projectionFiber_unique_sheetTranslation',
        'ErdosGyarfasSharp.sharpGraph_cyclic19_cover',
    ]),
    'search': ('Conjectures.ErdosGyarfasSharpSearch', [
        'ErdosGyarfasSharp.dfsSafe_excludes_path',
        'ErdosGyarfasSharp.dfsSafe_excludes_cycle',
        'ErdosGyarfasSharp.dfsSafe_excludes_cycle_of_length',
    ]),
    'split': ('Conjectures.ErdosGyarfasSharpSplit', [
        'ErdosGyarfasSharp.dfsSafe_of_frontier',
        'ErdosGyarfasSharp.dfsSafe_of_frontier_all',
    ]),
    'witness': ('Conjectures.ErdosGyarfasSharpWitness', [
        'ErdosGyarfasSharp.sharpCycle32_isCycle',
        'ErdosGyarfasSharp.sharpCycle32_length',
        'ErdosGyarfasSharp.sharpGraph_has_cycle32',
    ]),
}

GATE_INPUTS = {'.github/workflows/lean-erdos-gyarfas-sharp-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_erdos_gyarfas_sharp_candidate.py',
 'scripts/verify_lean_candidate.py'}


def dependency_order(target: str) -> list[str]:
    """Use the replay helper's header parser, including public imports."""
    modules = local_closure(LEAN, {target})
    graph = {
        module: sorted(dep for dep in imports_of(source(module)) if dep in modules)
        for module in sorted(modules)
    }
    return list(TopologicalSorter(graph).static_order())


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    target, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order(target)}
    return bool(changed & paths)


def gate_hashes() -> dict[str, str]:
    return {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)}


def check_sources(modules: list[str], receipt: dict) -> None:
    """Check independent sources after an error, but never use a failed object.

    This exposes arithmetic-leaf errors even if the compact bridge is still
    being repaired. Any source error or blocked dependency fails the task;
    axiom and kernel checks run only after every source has passed.
    """
    failed: dict[str, str] = {}
    checked: list[str] = []
    receipt["source_failures"] = failed
    receipt["checked_sources"] = checked
    for module in modules:
        blocked = [dep for dep in imports_of(source(module)) if dep in failed]
        if blocked:
            failed[module] = "blocked by failed dependencies: " + ", ".join(blocked)
            print(f"SKIP {module}: {failed[module]}", flush=True)
            continue
        obj = LEAN / ".lake/build/lib/lean" / (module.replace(".", "/") + ".olean")
        obj.parent.mkdir(parents=True, exist_ok=True)
        try:
            run("lake", "env", "lean", "-j1", "-M4500", "-DwarningAsError=true",
                str(source(module).relative_to(LEAN)), "-o", str(obj.relative_to(LEAN)))
        except subprocess.CalledProcessError as exc:
            failed[module] = f"strict source check exited {exc.returncode}"
        else:
            checked.append(module)
    if failed:
        raise RuntimeError(f"{len(failed)} sources failed or have failed dependencies")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("task", nargs="?", choices=TASKS)
    parser.add_argument("--plan", action="store_true")
    parser.add_argument("--plan-ci", action="store_true")
    parser.add_argument("--files", nargs="*")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        tasks = [task for task in TASKS if affected(task, changed)]
        print(json.dumps({"tasks": tasks, "changed": sorted(changed)
                          if changed is not None else "all"}, indent=2))
        if output := os.environ.get("GITHUB_OUTPUT"):
            with open(output, "a") as handle:
                handle.write("tasks=" + json.dumps(tasks, separators=(",", ":")) + "\n")
        return
    if args.task is None:
        parser.error("a task or --plan-ci is required")
    target, required = TASKS[args.task]
    modules = dependency_order(target)
    if args.plan:
        print(json.dumps({"task": args.task, "target": target, "required": required,
                          "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "required_theorems": required, "project_modules": modules,
        "source_sha256": initial, "gate_sha256": initial_gate,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("erdos-gyarfas-sharp-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "erdos-gyarfas-sharp-" + args.task)
        receipt["completed_checks"].append("module-ownership axiom whitelist and required theorems")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("candidate sources or verification inputs changed during checks")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS erdos-gyarfas-sharp-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
