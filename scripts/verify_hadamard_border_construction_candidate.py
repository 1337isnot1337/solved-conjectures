#!/usr/bin/env python3
"""Check one exact fixed-border construction proof closure.

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
    'variance': ('Conjectures.HadamardBorderVariance', [
        'HadamardBorderVariance.variance_eq_pairwise',
        'HadamardBorderVariance.variance_nonneg',
        'HadamardBorderVariance.variance_mod_four',
        'HadamardBorderVariance.variance_eq_zero_iff',
        'HadamardBorderVariance.variance_eq_three_iff',
        'HadamardBorderVariance.variance_affine',
    ]),
    'variance-rows': ('Conjectures.HadamardBorderVarianceRows', [
        'HadamardBorderVariance.variances_of_total_nine',
        'HadamardBorderVariance.four_rows_of_total_nine',
        'HadamardBorderVariance.total_variance_eq_nine_of_common_parity',
        'HadamardBorderVariance.compression_shapes_of_energy',
        'HadamardBorderVariance.compression_shapes_of_mod_two',
        'HadamardBorderVariance.compression_shapes_of_card_four',
    ]),
    'core-algebra': ('Conjectures.HadamardBorderCoreAlgebra', [
        'HadamardBorderConstruction.convolution_mul_positiveHankel',
        'HadamardBorderConstruction.convolution_mul_negativeHankel',
        'HadamardBorderConstruction.positiveHankel_mul_negativeHankel_comm',
        'HadamardBorderConstruction.negativeHankel_mul_positiveHankel_comm',
        'HadamardBorderConstruction.positiveHankel_mul_positiveHankel',
        'HadamardBorderConstruction.convolution_gram',
        'HadamardBorderConstruction.negativeHankel_square',
        'HadamardBorderConstruction.positiveHankel_square',
    ]),
    'core': ('Conjectures.HadamardBorderCore', [
        'HadamardBorderConstruction.core_sign',
        'HadamardBorderConstruction.core_blocks_gram',
        'HadamardBorderConstruction.core_gram_apply',
        'HadamardBorderConstruction.core_gram_of_correlation_formula',
    ]),
    'compression': ('Conjectures.HadamardBorderCompression', [
        'HadamardBorderConstruction.fiber_natCard_eq_kernel_card',
        'HadamardBorderConstruction.fiber_card_eq_kernel_card',
        'HadamardBorderConstruction.card_eq_card_mul_kernel_card',
        'HadamardBorderConstruction.sum_mul_eq_sum_compress',
        'HadamardBorderConstruction.correlation_compress_eq_fiber_sum',
        'HadamardBorderConstruction.combinedCorrelation_compress_eq_fiber_sum',
        'HadamardBorderConstruction.compressed_parity',
        'HadamardBorderConstruction.sum_correlation_eq_square_sum',
        'HadamardBorderConstruction.sum_combinedCorrelation_eq_row_sum_squares',
        'HadamardBorderConstruction.combinedCorrelation_zero',
    ]),
    'compression-rows': ('Conjectures.HadamardBorderCompressionRows', [
        'HadamardBorderConstruction.compressed_correlation_nonzero',
        'HadamardBorderConstruction.compressed_correlation_zero',
        'HadamardBorderConstruction.compressed_correlation_formula',
        'HadamardBorderConstruction.compressed_energy',
        'HadamardBorderConstruction.compressed_row_sum_squares',
    ]),
    'normalization': ('Conjectures.HadamardBorderVarianceNormalization', [
        'HadamardBorderConstruction.compression_shapes_of_correlation',
        'HadamardBorderConstruction.exists_normalized_sign_rows_of_correlation',
        'HadamardBorderConstruction.exists_normalized_sign_rows_with_equation',
    ]),
    'core-action': ('Conjectures.HadamardBorderCoreAction', [
        'HadamardBorderConstruction.core_mul_inflateRows_of_normalized',
        'HadamardBorderConstruction.column_balance_of_blockOnes_mul_zero',
        'HadamardBorderConstruction.core_mul_inflate_transpose_of_normalized',
        'HadamardBorderConstruction.core_gram_of_two_level',
    ]),
}

DEFAULT_TASKS = ("normalization", "core-action")

GATE_INPUTS = {'.github/workflows/lean-hadamard-border-construction-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_hadamard_border_construction_candidate.py',
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
    destination = ROOT / ".candidate-artifacts" / ("hadamard-border-construction-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "hadamard-border-construction-" + args.task)
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
    print(f"PASS hadamard-border-construction-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
