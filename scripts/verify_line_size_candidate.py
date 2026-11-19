#!/usr/bin/env python3
"""Check a separate, unregistered Erdős 607 candidate closure.

Successful jobs are component receipts. They neither register the component
in the accepted package nor establish the complete sharp asymptotic.
"""

from __future__ import annotations

import argparse
from graphlib import TopologicalSorter
import json
import os
from pathlib import Path
import subprocess

from plan_lean_candidates import changed_sources
from replay_lean import imports_of, local_closure
from verify_lean_candidate import (
    ROOT, LEAN, audit, digest, revision, run, source, source_hashes,
)


TASKS = {
    "geometry": (
        "Conjectures.LineSizeRecordCount",
        ["LineSize.exists_padded_carrier_realization",
         "LineSize.exists_large_record_iff",
         "LineSize.feasibleSizes_iff_realizable",
         "LineSize.lineSizeRecord_eq_of_large_eq",
         "LineSize.lineSizeCount_eq_tupleCount"],
    ),
    "profile": (
        "Conjectures.LineSizeAnalyticProfile",
        ["LineSize.Profile.saddle_profile_exact",
         "LineSize.Profile.Phi_le_gaussian",
         "LineSize.Profile.M_eq_Phi_sub_mul_deriv",
         "LineSize.Profile.V_eq_two_M_sub_mul_deriv"],
    ),
    "euler-kernel": (
        "Conjectures.LineSizeEulerKernel",
        ["LineSize.EulerKernel.meanExp_pos",
         "LineSize.EulerKernel.meanExp_analyticAt",
         "LineSize.EulerKernel.smoothLog_contDiff",
         "LineSize.EulerKernel.smoothLog_eq"],
    ),
    "euler-correction": (
        "Conjectures.LineSizeEulerProduct",
        ["LineSize.EulerKernel.regularSum_error_uniform",
         "LineSize.EulerKernel.stirlingError_le",
         "LineSize.EulerKernel.logEuler_correction_exact",
         "LineSize.EulerKernel.logEuler_correction_uniform",
         "LineSize.EulerKernel.exp_logEuler",
         "LineSize.EulerKernel.finiteProduct_correction_exact"],
    ),
    "analytic-estimates": (
        "Conjectures.LineSizeAnalyticEstimates",
        ["LineSize.EulerKernel.rightSum_error_uniform",
         "LineSize.EulerKernel.weightedMean_error_uniform",
         "LineSize.EulerKernel.weightedVariance_error_uniform",
         "LineSize.EulerKernel.logEuler_le_integral",
         "LineSize.EulerKernel.coreWeight_le_gaussian",
         "LineSize.EulerKernel.coreWeight_correction_exact"],
    ),
    "geometric-fourier": (
        "Conjectures.LineSizeGeometricTaylor",
        ["LineSize.Fourier.energy_bound",
         "LineSize.Fourier.geometric_product_bound",
         "LineSize.Geometric.scalarFactor_norm_majorant",
         "LineSize.Geometric.scalarFactor_eq_inv_one_sub",
         "LineSize.Geometric.phase_cubic_error",
         "LineSize.Geometric.scalarFactor_log_quadratic_error"],
    ),
    "tuples": (
        "Conjectures.LineSizeTuplesCandidate",
        ["LineSize.tupleCoreLength_zero_iff",
         "LineSize.tupleCost_eq_shiftedGapWeight",
         "LineSize.tupleTail_reconstruct",
         "LineSize.TupleBuild.tupleCoreLength_assemble",
         "LineSize.TupleBuild.tupleCost_assemble",
         "LineSize.TupleBuild.assemble_actual",
         "LineSize.TupleBuild.assemble_reduced_actual",
         "LineSize.tupleCount_eq_sum_exactCount",
         "LineSize.one_sub_X_mul_tupleCountSeries"],
    ),
    "generating-function": (
        "Conjectures.LineSizeGeneratingFunction",
        ["LineSize.TupleEncoding.decodeCode_injective",
         "LineSize.TupleEncoding.decodeCode_surjective",
         "LineSize.TupleEncoding.coreCodeEquiv_cost",
         "LineSize.TupleEncoding.zeroCodeEquiv_cost",
         "LineSize.TupleEncoding.oneCodeEquiv_cost",
         "LineSize.TupleEncoding.twoCodeEquiv_cost",
         "LineSize.Generating.geometric_mul_one_sub",
         "LineSize.Generating.coeff_gapSeries",
         "LineSize.Generating.coeff_codeSeries",
         "LineSize.Generating.coeff_coreTerm",
         "LineSize.Generating.tupleCostSeries_eq",
         "LineSize.Generating.one_sub_X_mul_tupleCountSeries_eq",
         "LineSize.Generating.exactCount_formula",
         "LineSize.Generating.gapSeries_mul_denominator",
         "LineSize.Generating.largeCoreTerm_mul_denominator"],
    ),
    "generating-evaluation": (
        "Conjectures.LineSizeGeneratingEvaluationUniform",
        ["LineSize.Generating.hasSeriesValue_geometric",
         "LineSize.Generating.summable_gaussianWeight",
         "LineSize.Generating.summable_coreMatrix",
         "LineSize.Generating.hasSeriesValue_tupleCostSeries_exact",
         "LineSize.Generating.hasSeriesValue_tupleCountSeries",
         "LineSize.Generating.summable_norm_lineSizeCount",
         "LineSize.Generating.hasSum_lineSizeCount",
         "LineSize.Generating.recordGenerating_eq_explicit",
         "LineSize.Generating.uniform_coreValue",
         "LineSize.Generating.uniform_recordGenerating"],
    ),
}
GATE_INPUTS = {
    ".github/workflows/lean-line-size-candidates.yml",
    "scripts/verify_line_size_candidate.py",
    "scripts/test_line_size_candidate.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "scripts/replay_lean.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
}


def dependency_order(targets: list[str]) -> list[str]:
    """Use the replay parser for ordinary, public, and meta project imports."""
    closure = local_closure(LEAN, set(targets))
    graph = {module: sorted(set(imports_of(source(module))) & closure)
             for module in sorted(closure)}
    return list(TopologicalSorter(graph).static_order())


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    target, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order([target])}
    return bool(changed & paths)


def gate_hashes() -> dict[str, str]:
    return {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)}


def check_sources(modules: list[str], receipt: dict) -> None:
    """Check independent files after errors, while rejecting their dependents.

    An error or a blocked source fails the whole task before the axiom and
    kernel gates. No stale object from a failed dependency can support a pass.
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
    modules = dependency_order([target])
    if args.plan:
        print(json.dumps({"task": args.task, "target": target,
                          "required": required, "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    initial_gate = gate_hashes()
    receipt = {
        "task": args.task, "commit": revision(), "target": target,
        "project_modules": modules, "source_sha256": initial, "gate_sha256": initial_gate,
        "required_theorems": required,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / ("line-size-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "line-size-" + args.task)
        receipt["completed_checks"].append("all-declaration axiom whitelist")
        run("lake", "env", "python3", "../scripts/replay_lean.py", "--root", target)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial or gate_hashes() != initial_gate:
            raise RuntimeError("candidate source or pinned configuration changed during checks")
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS line-size-{args.task}: source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
