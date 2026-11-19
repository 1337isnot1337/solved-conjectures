#!/usr/bin/env python3
"""Check unregistered runner geometry and hyperplane candidate closures.

The jobs produce component receipts. They do not register a proof or claim
that any complete classification or hyperplane counting theorem is finished.
"""

from __future__ import annotations

import argparse
import json
import os

from plan_lean_candidates import changed_sources
from verify_lean_candidate import (
    ROOT, audit, dependency_order, digest, export_artifacts, revision, run,
    source, source_hashes,
)


TASKS = {
    "prime-bounds": (
        ["Conjectures.LonelinessModularTightPrimeBounds"],
        ["Loneliness.Modular.exists_dvd_speed_of_tight",
         "Loneliness.Modular.forcedDivisor_dvd_product",
         "Loneliness.Modular.exists_prime_avoiding_forced_of_tight",
         "Loneliness.Modular.TightPrimeBounds.prefix_margin",
         "Loneliness.Modular.TightPrimeBounds.prime_data_valid",
         "Loneliness.Modular.TightPrimeBounds.exists_prime_of_tight_bound"],
    ),
    "basis": (
        ["Conjectures.LonelinessKZBasisReduction",
         "Conjectures.LonelinessPrimitiveSpeeds"],
        ["Loneliness.KZBasis.realFamily_prefix_independent",
         "Loneliness.KZBasis.gs_tail_product",
         "Loneliness.KZBasis.exists_ratio_basis",
         "Loneliness.PrimitiveBasis.primitive_speed_basis_extension"],
    ),
    "nearest-plane-value": (
        ["Conjectures.LonelinessNearestPlanePrefix"],
        ["Loneliness.NearestPlane.exists_integer_rounding_mod_prefix",
         "Loneliness.NearestPlane.exists_rounding_along_first_vector",
         "Loneliness.NearestPlane.prefix_spaceValue_le",
         "Loneliness.NearestPlane.runner_prefix_squared_lower"],
    ),
    "norm-geometry": (
        ["Conjectures.LonelinessNormGeometry"],
        ["Loneliness.NormGeometry.squaredNorm_eq_sum",
         "Loneliness.NormGeometry.exists_tight_gram_data",
         "Loneliness.NormGeometry.tight_norm_cutoff"],
    ),
    "small-norm": (
        ["Conjectures.LonelinessTightSmallNormBounds"],
        ["Loneliness.NormGeometry.natural_squaredNorm_le_of_product",
         "Loneliness.NormGeometry.small_product_lower_bound",
         "Loneliness.NormGeometry.tight_small_natural_squaredNorm_le",
         "Loneliness.NormGeometry.exists_small_prime_of_tight",
         "Loneliness.NormGeometry.six_squaredNorm_le"],
    ),
    "cube": (
        ["Conjectures.LonelinessModularCubeSearch"],
        ["Loneliness.Modular.FoldedSearch.Closed.Cube.check_sound",
         "Loneliness.Modular.FoldedSearch.Closed.Cube.checked_branch",
         "Loneliness.Modular.FoldedSearch.Closed.Cube.checked_value",
         "Loneliness.Modular.FoldedSearch.Closed.Cube.reference_terminal_sound",
         "Loneliness.Modular.FoldedSearch.Closed.Cube.example_checked",
         "Loneliness.Modular.FoldedSearch.Closed.Cube.example_branch_checked"],
    ),
    "cube-probe": (
        ["Conjectures.LonelinessTenSpeedCube127Probe"],
        ["Loneliness.Modular.TenSpeed.CubeProbe.all_checked",
         "Loneliness.Modular.TenSpeed.CubeProbe.excludes_closed_value"],
    ),
    "initial-cover": (
        ["Conjectures.LonelinessModularCoverTape",
         "Conjectures.LonelinessTenSpeedOrbit"],
        ["Loneliness.Modular.SupportSearch.coverage_card_le_capacity",
         "Loneliness.Modular.SupportSearch.check_sound",
         "Loneliness.Modular.SupportSearch.boundedCheck_sound",
         "Loneliness.Modular.SupportSearch.Chunks.check_sound",
         "Loneliness.Modular.SupportSearch.Tape.checked_state",
         "Loneliness.Modular.Multiplicity.perm_support_cons_of_length",
         "Loneliness.Modular.Multiplicity.reindex_of_ofFn_perm",
         "Loneliness.Modular.TenSpeed.Initial.closed_support_normalization",
         "Loneliness.Modular.TenSpeed.Initial.checked_initial_cover",
         "Loneliness.Modular.TenSpeed.Orbit.Row.sound",
         "Loneliness.Modular.TenSpeed.Orbit.normalized_represents",
         "Loneliness.Modular.TenSpeed.Orbit.checked_initial_represents"],
    ),
    "six-support": (
        ["Conjectures.LonelinessModularInitialBits",
         "Conjectures.LonelinessModularMemo",
         "Conjectures.LonelinessSixSpeedFiniteSound",
         "Conjectures.LonelinessModularInitialMemo"],
        ["Loneliness.Modular.InitialSupport.checked_initial_cover",
         "Loneliness.Modular.SupportSearch.Bits.checked_tape",
         "Loneliness.Modular.InitialBits.checked_tree_with_masks",
         "Loneliness.Modular.Memo.lookup_eq",
         "Loneliness.Modular.SixSpeed.checked_prime_classification",
         "Loneliness.Modular.SixSpeed.consecutive_value",
         "Loneliness.Modular.InitialMemo.checked_tree"],
    ),
    "six-support-probe": (
        ["Conjectures.LonelinessSixSpeedSupport257Probe"],
        ["Loneliness.Modular.SixSpeed.SupportProbe.inverse_checked",
         "Loneliness.Modular.SixSpeed.SupportProbe.cover_checked",
         "Loneliness.Modular.SixSpeed.SupportProbe.compatible_checked",
         "Loneliness.Modular.SixSpeed.SupportProbe.tape_checked",
         "Loneliness.Modular.SixSpeed.SupportProbe.tree_checked",
         "Loneliness.Modular.SixSpeed.SupportProbe.normalized_cover_impossible"],
    ),
    "small-sharp": (
        ["Conjectures.LonelinessKZSmallSharp"],
        ["Loneliness.KZSmall.SixSpectrum.norm_cutoff_21829",
         "Loneliness.KZSmall.SixSpectrum.concrete_four_parameter_bound",
         "Loneliness.KZSmall.SixSpectrum.concrete_five_parameter_bound"],
    ),
    "hyperplane": (
        ["Conjectures.LonelinessHyperplaneProbability"],
        ["Loneliness.Hyperplane.integral_mFourier_velocity",
         "Loneliness.Hyperplane.integer_annihilator_iff",
         "Loneliness.Hyperplane.torusRelation_character_trivial_iff",
         "Loneliness.Hyperplane.exists_finite_frequency_average_control",
         "Loneliness.Hyperplane.exists_finite_frequency_dense_velocity",
         "Loneliness.Hyperplane.positiveBoxExceptional_card_le",
         "Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower",
         "Loneliness.Hyperplane.exists_positive_distinct_integer_kernel",
         "Loneliness.Hyperplane.exists_admissible_box_denominator",
         "Loneliness.Hyperplane.exists_finite_frequency_uniform_gap_cover",
         "Loneliness.Hyperplane.torusVelocityValue_coe",
         "Loneliness.Hyperplane.torusUniformShiftGap_eq_real",
         "Loneliness.Hyperplane.exists_uniform_bad_count_bound",
         "Loneliness.Hyperplane.exceptional_count_mul_box_le",
         "Loneliness.Hyperplane.exists_uniform_probability_rate",
         "Loneliness.Hyperplane.exists_torus_uniform_probability_rate",
         "Loneliness.Hyperplane.uniformFailureProbability_tendsto_zero",
         "Loneliness.Hyperplane.uniformSuccessProbability_tendsto_one",
         "Loneliness.Hyperplane.exists_subthreshold_count_bound"],
    ),
}
GATE_INPUTS = {
    ".github/workflows/lean-loneliness-geometry.yml",
    "scripts/verify_loneliness_geometry.py",
    "scripts/verify_lean_candidate.py",
    "scripts/plan_lean_candidates.py",
    "lean/lean-toolchain", "lean/lakefile.toml", "lean/lake-manifest.json",
}


def affected(task: str, changed: set[str] | None) -> bool:
    if changed is None or changed & GATE_INPUTS:
        return True
    targets, _ = TASKS[task]
    paths = {str(source(m).relative_to(ROOT)) for m in dependency_order(targets)}
    return bool(changed & paths)


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
    targets, required = TASKS[args.task]
    modules = dependency_order(targets)
    if args.plan:
        print(json.dumps({"task": args.task, "targets": targets,
                          "required": required, "project_modules": modules}, indent=2))
        return
    initial = source_hashes(modules)
    gate_hashes = {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)}
    task = "geometry-" + args.task
    receipt = {
        "task": task, "commit": revision(), "targets": targets,
        "required_theorems": required, "project_modules": modules,
        "source_sha256": initial, "gate_sha256": gate_hashes,
        "status": "running", "completed_checks": [],
    }
    destination = ROOT / ".candidate-artifacts" / task
    try:
        for module in modules:
            run("lake", "build", module)
        receipt["completed_checks"].append("source build")
        audit(targets, required, modules, task)
        receipt["completed_checks"].append("all-declaration axiom whitelist")
        for module in modules:
            run("lake", "env", "leanchecker", module)
        receipt["completed_checks"].append("independent exact-closure kernel replay")
        if source_hashes(modules) != initial:
            raise RuntimeError("candidate source or pinned configuration changed during checks")
        if {path: digest(ROOT / path) for path in sorted(GATE_INPUTS)} != gate_hashes:
            raise RuntimeError("verification code changed during checks")
        export_artifacts(task, modules, modules)
        receipt["status"] = "passed"
    except BaseException as exc:
        receipt["status"] = "failed"
        receipt["error"] = str(exc)
        raise
    finally:
        destination.mkdir(parents=True, exist_ok=True)
        (destination / "receipt.json").write_text(
            json.dumps(receipt, indent=2, sort_keys=True) + "\n")
    print(f"PASS {task}: source, axiom, and kernel gates; unchanged sources", flush=True)


if __name__ == "__main__":
    main()
