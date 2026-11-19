#!/usr/bin/env python3
"""Check one unregistered Motzkin proof closure.

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
    "compact": (
        "Conjectures.MotzkinCompact",
        ["exists_continuous_character_ne_one",
         "PontryaginDual.eval_surjective_of_discrete",
         "Motzkin.boxLift_eq_of_project_step",
         "Motzkin.box_measure_character",
         "Motzkin.denseRange_dual_map",
         "Motzkin.algebraic_character_le_characterValue",
         "Motzkin.compact_measure_le_characterValue",
         "Motzkin.compact_two_difference_theorem"],
    ),
    "relations": (
        "Conjectures.MotzkinRankTwoRelations",
        ["Motzkin.exists_annihilator_maximum",
         "Motzkin.rank_zero_density",
         "Motzkin.rank_one_attainment",
         "Motzkin.rank_one_density",
         "Motzkin.rank_two_grid_complete",
         "Motzkin.rank_two_density",
         "Motzkin.exists_character_maximum_of_finite_relations",
         "Motzkin.finite_relation_density_attained"],
    ),
    "cyclic": (
        "Conjectures.MotzkinCyclicCandidates",
        ["Motzkin.Cyclic.finite_cyclic_theorem",
         "Motzkin.Cyclic.finite_cyclic_theorem_all",
         "Motzkin.Cyclic.cyclic_Hermite_basis",
         "Motzkin.Cyclic.independenceNumber_gcd",
         "Motzkin.Cyclic.reduced_gcd_eq_one",
         "Motzkin.Cyclic.odd_closed_walk_sharpness_criterion",
         "Motzkin.Cyclic.example_exact_independence",
         "Motzkin.Cyclic.sevenCycle_injective",
         "Motzkin.Cyclic.sevenCycle_steps",
         "Motzkin.Cyclic.no_short_odd_closed_walk",
         "Motzkin.Cyclic.example_no_sharp_pair"],
    ),
    "evaluator": (
        "Conjectures.MotzkinEvaluatorCandidates",
        ["Motzkin.FloorSum.eval_eq_spec",
         "Motzkin.Evaluator.countPairs_eq_sum_rows",
         "Motzkin.Evaluator.feasible_spec",
         "Motzkin.Evaluator.firstRow_spec",
         "Motzkin.Evaluator.secondResidue_eq_python",
         "Motzkin.Evaluator.quotientOptimum_feasible",
         "Motzkin.Evaluator.quotientOptimum_optimal",
         "Motzkin.Evaluator.optimum_annihilator_maximum",
         "Motzkin.Hermite.card",
         "Motzkin.Hermite.quotientOptimum_independence",
         "Motzkin.Evaluator.density_eq_quotientOptimum",
         "Motzkin.Evaluator.quotientOptimum_attains",
         "Motzkin.Evaluator.evaluator_complexity",
         "Motzkin.Cyclic.circulantOptimum_correct",
         "Motzkin.Cyclic.circulantNumber_correct"],
    ),
}
GATE_INPUTS = {
    ".github/workflows/lean-motzkin-candidates.yml",
    "scripts/verify_motzkin_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
    "lean/Conjectures/MotzkinImported/LICENSE",
    "lean/Conjectures/MotzkinImported/LICENSE-complex-analysis",
    "lean/Conjectures/MotzkinImported/PROVENANCE.md",
}


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
    destination = ROOT / ".candidate-artifacts" / ("motzkin-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "motzkin-" + args.task)
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
    print(f"PASS motzkin-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
