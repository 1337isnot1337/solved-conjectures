#!/usr/bin/env python3
"""Check one unregistered Hadamard fixed-border symmetry proof closure.

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


TASKS = {'arithmetic': ('Conjectures.HadamardBorderSymmetryArithmetic',
                ['HadamardBorderSymmetry.baseline_equation_odd_d',
                 'HadamardBorderSymmetry.baseline_l1_impossible',
                 'HadamardBorderSymmetry.baseline_fiber_abs_le13',
                 'HadamardBorderSymmetry.energy608_abs_lt25',
                 'HadamardBorderSymmetry.energy608_card16_mod37_impossible']),
 'prime': ('Conjectures.HadamardBorderSymmetryPrime',
           ['HadamardBorderSymmetry.prime_permutation_card_modEq',
            'HadamardBorderSymmetry.order37_support_card_modEq',
            'HadamardBorderSymmetry.order37_fiber_sum_modEq_zero',
            'HadamardBorderSymmetry.order37_fiber_sum_modEq']),
 'orbits': ('Conjectures.HadamardBorderSymmetryOrbits',
            ['HadamardBorderSymmetry.automorphism_preserves_zero_fiber',
             'HadamardBorderSymmetry.nonzero_zero_fiber_orbit_card_le_two',
             'HadamardBorderSymmetry.automorphism_orbit_count_ge_151']),
 'core': ('Conjectures.HadamardBorderSymmetryCore',
          ['HadamardBorderSymmetry.compressed_correlation149',
           'HadamardBorderSymmetry.compressed_correlation_zero149',
           'HadamardBorderSymmetry.compressed_correlation_nonzero149',
           'HadamardBorderSymmetry.compressed_energy149',
          'HadamardBorderSymmetry.order37_fiber_symmetry_impossible']),
 'pairs': ('Conjectures.HadamardBorderSymmetryPairs',
           ['HadamardBorderSymmetry.moved_point_order_four_pairs',
            'HadamardBorderSymmetry.nontrivial_order_four_automorphism_pairs']),
 'weighted': ('Conjectures.HadamardBorderSymmetryWeighted',
              ['HadamardBorderSymmetry.abs_sum_mul_le48',
               'HadamardBorderSymmetry.small_pair_sum_correlation_impossible']),
 'projection': ('Conjectures.HadamardBorderSymmetryProjection',
                ['HadamardBorderSymmetry.automorphism_product_apply149',
                 'HadamardBorderSymmetry.projections149_jointly_injective',
                 'HadamardBorderSymmetry.order37_automorphism_apply149',
                 'HadamardBorderSymmetry.units149_card']),
 'group-arithmetic': ('Conjectures.HadamardBorderSymmetryGroupArithmetic',
                      ['HadamardBorderSymmetry.card_dvd_four_of_injective_units149',
                       'HadamardBorderSymmetry.subgroup_card_dvd_four_of_injective_multiplier149']),
 'kernel': ('Conjectures.HadamardBorderSymmetryKernel',
            ['HadamardBorderSymmetry.paired_fiber_abs_bound149',
             'HadamardBorderSymmetry.quotient_automorphism_symmetry_impossible']),
 'domain': ('Conjectures.HadamardBorderSymmetryDomain',
            ['HadamardBorderSymmetry.borderDomainEquiv149_fst',
             'HadamardBorderSymmetry.borderDomainEquiv149_map_subgroup',
             'HadamardBorderSymmetry.exists_border_domain_equiv149']),
 'main': ('Conjectures.HadamardBorderSymmetryMain',
          ['HadamardBorderSymmetry.symmetry_subgroup_multiplier_injective149',
           'HadamardBorderSymmetry.symmetry_subgroup_no_order37_149',
           'HadamardBorderSymmetry.symmetry_subgroup_card_dvd_four149',
           'HadamardBorderSymmetry.symmetry_subgroup_orbit_count_ge_151',
           'HadamardBorderSymmetry.common_multiplier_card_dvd_four',
           'HadamardBorderSymmetry.common_multiplier_card_le_four',
           'HadamardBorderSymmetry.common_multiplier_isCyclic',
           'HadamardBorderSymmetry.common_multiplier_orbit_count_ge_151']),
 'transfer': ('Conjectures.HadamardBorderSymmetryTransfer',
              ['HadamardBorderSymmetry.rowsInProduct149_isBorderCore',
               'HadamardBorderSymmetry.conjugated_multiplier_mem_iff',
               'HadamardBorderSymmetry.card_multiplierOrbitOn_eq',
               'HadamardBorderSymmetry.common_multiplier_card_dvd_four_on_subgroup149',
               'HadamardBorderSymmetry.common_multiplier_card_le_four_on_subgroup149',
               'HadamardBorderSymmetry.common_multiplier_isCyclic_on_subgroup149',
               'HadamardBorderSymmetry.common_multiplier_orbit_count_ge_151_on_subgroup149',
               'HadamardBorderSymmetry.symmetry_subgroup_card_dvd_four_on_subgroup149',
               'HadamardBorderSymmetry.symmetry_subgroup_isCyclic_on_subgroup149',
               'HadamardBorderSymmetry.symmetry_subgroup_orbit_count_ge_151_on_subgroup149'])}

# Check the final assemblies first so their dependency diagnostics are available
# before independent component jobs finish. Every selected gate remains strict.
TASKS = {task: TASKS[task] for task in (
    'transfer', 'main', 'kernel', 'domain', 'group-arithmetic', 'projection',
    'weighted', 'core', 'prime', 'orbits', 'pairs', 'arithmetic',
)}

GATE_INPUTS = {'.github/workflows/lean-hadamard-border-symmetry-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_hadamard_border_symmetry_candidate.py',
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
    destination = ROOT / ".candidate-artifacts" / ("hadamard-border-symmetry-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "hadamard-border-symmetry-" + args.task)
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
    print(f"PASS hadamard-border-symmetry-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
