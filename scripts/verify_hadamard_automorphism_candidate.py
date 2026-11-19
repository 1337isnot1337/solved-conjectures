#!/usr/bin/env python3
"""Check one unregistered Hadamard automorphism proof closure.

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


TASKS = {'arithmetic': ('Conjectures.HadamardAutomorphismArithmeticCandidates',
                ['HadamardAutomorphism.residue_order',
                 'HadamardAutomorphism.unit_order',
                 'HadamardAutomorphism.no_norm_prime',
                 'HadamardAutomorphism.no_norm_cube',
                 'HadamardAutomorphism.no_norm_cube_rational',
                 'HadamardAutomorphism.norm_fifth_witness',
                 'HadamardAutomorphism.cyclotomic_coefficients_equal_of_bounds599']),
 'permutation': ('Conjectures.HadamardAutomorphismPermutationCandidates',
                 ['HadamardAutomorphism.normalize_signed_hadamard',
                  'HadamardAutomorphism.order2396_fixed_points_and_cycles',
                  'HadamardAutomorphism.exists_cyclic_reindex']),
 'fourier': ('Conjectures.HadamardAutomorphismFourierCandidates',
             ['HadamardAutomorphism.fourier_intertwine',
              'HadamardAutomorphism.indicator_gram_599',
              'HadamardAutomorphism.determinant_norm_of_gram',
              'HadamardAutomorphism.binaryAutocorrelation_modEq_forces_constant',
              'HadamardAutomorphism.det_divisible_of_two_primes',
              'HadamardAutomorphism.determinant_quotient_norm_cube']),
 'cyclotomic': ('Conjectures.HadamardAutomorphismCyclotomicCandidates',
                ['HadamardAutomorphism.frobenius479_order',
                 'HadamardAutomorphism.quadraticFixedField479_degree',
                 'HadamardAutomorphism.prime599_number_of_primes',
                 'HadamardAutomorphism.prime599_primes_eq_pair',
                 'HadamardAutomorphism.prime599_ideal_intersection',
                 'HadamardAutomorphism.quadraticGenerator479_sq',
                 'HadamardAutomorphism.cyclotomic_norm_cube_impossible',
                 'HadamardAutomorphism.integerCyclotomicChar479_star_norm']),
 'assembly': ('Conjectures.HadamardAutomorphismAssemblyCandidates',
              ['HadamardAutomorphism.support_norm_divisible_forces_constant',
               'HadamardAutomorphism.indicator_nonzero_mod_prime599',
               'HadamardAutomorphism.cyclic_integer_hadamard_impossible',
               'HadamardAutomorphism.hadamard_signed_pair_order_ne_479',
               'HadamardAutomorphism.hadamard_automorphism_card_not_dvd_479',
               'HadamardAutomorphism.isHadamard_automorphism_card_not_dvd_479']),
 'class_order': ('Conjectures.HadamardAutomorphismClassOrder',
                 ['HadamardAutomorphism.exists_prime_above599_class_order_five'])}

GATE_INPUTS = {'.github/workflows/lean-hadamard-automorphism-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_hadamard_automorphism_candidate.py',
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
    destination = ROOT / ".candidate-artifacts" / ("hadamard-automorphism-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "hadamard-automorphism-" + args.task)
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
    print(f"PASS hadamard-automorphism-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
