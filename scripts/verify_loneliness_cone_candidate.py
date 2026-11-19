#!/usr/bin/env python3
"""Check one exact rational-cone counting proof closure.

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


TASKS = {'optimal-existence': ('Conjectures.LonelinessHyperplaneRationalConeOptimalExistence',
                       ['Loneliness.Hyperplane.RationalCone.exists_nonincreasing_support_step',
                        'Loneliness.Hyperplane.RationalCone.exists_feasible_independent_le_of_positive_height',
                        'Loneliness.Hyperplane.RationalCone.independent_feasible_set_finite',
                        'Loneliness.Hyperplane.RationalCone.exists_optimal_of_positive_height',
                        'Loneliness.Hyperplane.RationalCone.exists_unique_optimal_of_positive_height',
                        'Loneliness.Hyperplane.RationalCone.exists_admissibleSupport_of_feasible']),
 'fan': ('Conjectures.LonelinessHyperplaneRationalConeFan',
         ['Loneliness.Hyperplane.RationalCone.AdmissibleSupport.mono',
          'Loneliness.Hyperplane.RationalCone.admissibleSupport_independent',
          'Loneliness.Hyperplane.RationalCone.feasible_iff_mem_admissibleSupport',
          'Loneliness.Hyperplane.RationalCone.intersectionSupport_admissible',
          'Loneliness.Hyperplane.RationalCone.mem_supportedCone_intersectionSupport_iff',
          'Loneliness.Hyperplane.RationalCone.exists_finite_simplicial_cover_of_positive_height']),
 'remainder': ('Conjectures.LonelinessHyperplaneFundamentalRemainder',
               ['Loneliness.Hyperplane.FundamentalRemainder.remainder_coordinate_bound',
                'Loneliness.Hyperplane.FundamentalRemainder.recompose_surjective',
                'Loneliness.Hyperplane.FundamentalRemainder.recompose_injective']),
 'remainder-counting': ('Conjectures.LonelinessHyperplaneFundamentalRemainderCounting',
                        ['Loneliness.Hyperplane.FundamentalRemainder.remainder_height_nonneg',
                         'Loneliness.Hyperplane.FundamentalRemainder.remainder_height_lt',
                         'Loneliness.Hyperplane.FundamentalRemainder.heightFiber_card_eq_sum',
                         'Loneliness.Hyperplane.FundamentalRemainder.heightFiber_isQuasipolynomial',
                         'Loneliness.Hyperplane.FundamentalRemainder.heightFiber_card_of_isEmpty',
                         'Loneliness.Hyperplane.FundamentalRemainder.heightFiber_card_eq_zero_of_isEmpty']),
 'degree': ('Conjectures.LonelinessHyperplaneQuasipolynomialDegree',
            ['Loneliness.Hyperplane.QuasipolynomialArithmetic.natDegree_le_of_nat_abs_eval_le',
             'Loneliness.Hyperplane.QuasipolynomialArithmetic.IsQuasipolynomial.degree_of_power_bound',
             'Loneliness.Hyperplane.QuasipolynomialArithmetic.IsQuasipolynomial.degree_of_nat_count_bound']),
 'homogeneous-box': ('Conjectures.LonelinessHyperplaneHomogeneousBox',
                     ['Loneliness.Hyperplane.RationalCone.homogeneousBoxMonoid_subtractive',
                      'Loneliness.Hyperplane.RationalCone.homogeneousBoxMonoid_fg',
                      'Loneliness.Hyperplane.RationalCone.homogeneousBox_height_pos',
                      'Loneliness.Hyperplane.RationalCone.exists_positive_height_generators',
                      'Loneliness.Hyperplane.RationalCone.homogeneousBox_card_eq',
                      'Loneliness.Hyperplane.RationalCone.homogeneousBox_mem_of_rational_combination']),
 'system-cone': ('Conjectures.LonelinessHyperplaneSystemCone',
                 ['Loneliness.Hyperplane.RationalCone.mem_supportedCone_iff_subtype',
                  'Loneliness.Hyperplane.RationalCone.homogeneousBox_feasible_of_generators',
                  'Loneliness.Hyperplane.RationalCone.conePoint_nonneg',
                  'Loneliness.Hyperplane.RationalCone.conePointNat_mem_homogeneousBox',
                  'Loneliness.Hyperplane.RationalCone.supportedSystemBoxToCone_injective',
                  'Loneliness.Hyperplane.RationalCone.supportedSystemBoxToCone_surjective',
                  'Loneliness.Hyperplane.RationalCone.supportedSystemBox_card_eq'])}

DEFAULT_TASKS = ("fan", "remainder-counting", "degree", "system-cone")

GATE_INPUTS = {'.github/workflows/lean-loneliness-cone-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_loneliness_cone_candidate.py',
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

    This exposes independent component errors even if a later assembly is
    still being repaired. Any source error or blocked dependency fails the task;
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
    parser.add_argument("--requested-task", choices=("affected", *TASKS), default="affected")
    args = parser.parse_args()
    if args.plan_ci:
        changed = set(args.files) if args.files is not None else changed_sources()
        selected = DEFAULT_TASKS if args.requested_task == "affected" else [args.requested_task]
        tasks = [task for task in selected if affected(task, changed)]
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
    destination = ROOT / ".candidate-artifacts" / ("loneliness-cone-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "loneliness-cone-" + args.task)
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
    print(f"PASS loneliness-cone-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
