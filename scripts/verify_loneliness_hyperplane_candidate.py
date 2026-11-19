#!/usr/bin/env python3
"""Check the complete fixed-hyperplane theorem closure.

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


TASKS = {'probability': ('Conjectures.LonelinessHyperplaneProbability',
                 ['Loneliness.Hyperplane.integral_mFourier_velocity',
                  'Loneliness.Hyperplane.integer_annihilator_iff',
                  'Loneliness.Hyperplane.torusRelation_character_trivial_iff',
                  'Loneliness.Hyperplane.exists_finite_frequency_average_control',
                  'Loneliness.Hyperplane.exists_finite_frequency_dense_velocity',
                  'Loneliness.Hyperplane.positiveBoxExceptional_card_le',
                  'Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower',
                  'Loneliness.Hyperplane.exists_positive_distinct_integer_kernel',
                  'Loneliness.Hyperplane.exists_admissible_box_denominator',
                  'Loneliness.Hyperplane.exists_finite_frequency_uniform_gap_cover',
                  'Loneliness.Hyperplane.torusVelocityValue_coe',
                  'Loneliness.Hyperplane.torusUniformShiftGap_eq_real',
                  'Loneliness.Hyperplane.exists_uniform_bad_count_bound',
                  'Loneliness.Hyperplane.exceptional_count_mul_box_le',
                  'Loneliness.Hyperplane.exists_uniform_probability_rate',
                  'Loneliness.Hyperplane.exists_torus_uniform_probability_rate',
                  'Loneliness.Hyperplane.uniformFailureProbability_tendsto_zero',
                  'Loneliness.Hyperplane.uniformSuccessProbability_tendsto_one',
                  'Loneliness.Hyperplane.exists_subthreshold_count_bound']),
 'haar-law': ('Conjectures.LonelinessHyperplaneHaarValue',
              ['Loneliness.Hyperplane.haar_predictedValue_distribution',
               'Loneliness.Hyperplane.haar_predictedValue_isUniform']),
 'shift-laws': ('Conjectures.LonelinessHyperplaneShiftLaw',
                ['Loneliness.Hyperplane.continuous_torusVelocityValue',
                 'Loneliness.Hyperplane.independentShiftLaw_isProbability',
                 'Loneliness.Hyperplane.independentShiftLaw_cdf',
                 'Loneliness.Hyperplane.independentShiftCDF_lower',
                 'Loneliness.Hyperplane.independentShiftCDF_upper',
                 'Loneliness.Hyperplane.independentShiftCDF_tendsto',
                 'Loneliness.Hyperplane.independentShiftLaw_cdf_tendsto_uniform']),
 'endpoint-density': ('Conjectures.LonelinessHyperplaneEndpointDensity',
                      ['Loneliness.Hyperplane.positiveBoxEndpoint_eq_hitsResidue',
                       'Loneliness.Hyperplane.endpointFrequency_tendsto',
                       'Loneliness.Hyperplane.unshifted_endpoint_iff_sign_point',
                       'Loneliness.Hyperplane.velocity_hits_unit_multiple_iff',
                       'Loneliness.Hyperplane.unshiftedSignPoint_unit_multiple',
                       'Loneliness.Hyperplane.unshifted_endpoint_iff_canonical',
                       'Loneliness.Hyperplane.unshifted_cdf_tendsto',
                       'Loneliness.Hyperplane.predictedValue_zero',
                       'Loneliness.Hyperplane.canonicalEndpointResidue_mem_kernel',
                       'Loneliness.Hyperplane.scaledUnitResidueLine_frequency_tendsto',
                       'Loneliness.Hyperplane.exists_scaledUnitResidue_uniform_bound',
                       'Loneliness.Hyperplane.exists_smooth_coprime_factorization',
                       'Loneliness.Hyperplane.smooth_coprime_factor_unique',
                       'Loneliness.Hyperplane.scaledUnitResidueLine_unique_smooth',
                       'Loneliness.Hyperplane.positive_velocity_hits_residue_iff_unique_smooth',
                       'Loneliness.Hyperplane.smoothResidueFrequency_tendsto',
                       'Loneliness.Hyperplane.positiveBoxHitsResidue_card',
                       'Loneliness.Hyperplane.residueHitFrequency_eq_smoothResidueFrequency',
                       'Loneliness.Hyperplane.residueHitFrequency_tendsto',
                       'Loneliness.Hyperplane.full_support_maximizer',
                       'Loneliness.Hyperplane.full_support_endpoint_velocity_points',
                       'Loneliness.Hyperplane.primitive_velocity_hits_residue_iff',
                       'Loneliness.Hyperplane.primitive_velocity_hits_unit_line_iff',
                       'Loneliness.Hyperplane.unitResidueLine_card',
                       'Loneliness.Hyperplane.unitResidueLine_mem_kernel',
                       'Loneliness.Hyperplane.hasSum_smooth_reciprocal_power',
                       'Loneliness.Hyperplane.summable_smooth_reciprocal_power',
                       'Loneliness.Hyperplane.tsum_smooth_reciprocal_power',
                       'Loneliness.Hyperplane.residue_kernel_card',
                       'Loneliness.Hyperplane.exists_integer_kernel_residue_translation',
                       'Loneliness.Hyperplane.positiveBoxAffineStrip_card_le',
                       'Loneliness.Hyperplane.exists_residue_count_difference_bound',
                       'Loneliness.Hyperplane.exists_residue_frequency_rate',
                       'Loneliness.Hyperplane.residueFrequency_tendsto',
                       'Loneliness.Hyperplane.residueSetFrequency_tendsto',
                       'Loneliness.Hyperplane.one_relation_fiber_card_le',
                       'Loneliness.Hyperplane.positiveBoxAdmissible_card_upper',
                       'Loneliness.Hyperplane.positiveBoxDivisible_card_le']),
 'rate-sharpness': ('Conjectures.LonelinessHyperplaneRateSharpness',
                    ['Loneliness.Hyperplane.sharpNormal_primitive',
                     'Loneliness.Hyperplane.sharpNormal_realAdmissible',
                     'Loneliness.Hyperplane.sharpVelocity_attaining_time',
                     'Loneliness.Hyperplane.sharpVelocity_value',
                     'Loneliness.Hyperplane.sharp_uniform_bad_count_lower',
                     'Loneliness.Hyperplane.sharp_uniform_failure_probability_two_sided']),
 'denominator': ('Conjectures.LonelinessHyperplaneDenominatorQuasipolynomial',
                 ['Loneliness.Hyperplane.QuasipolynomialArithmetic.HasProgressionPolynomials.refine',
                  'Loneliness.Hyperplane.QuasipolynomialArithmetic.IsQuasipolynomial.finite_linear_combination',
                  'Loneliness.Hyperplane.QuasipolynomialArithmetic.coarsenedRelationBox_isQuasipolynomial_of_noninjective',
                  'Loneliness.Hyperplane.QuasipolynomialArithmetic.collisionBox_isQuasipolynomial',
                  'Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_card_inclusion_exclusion',
                  'Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_isQuasipolynomial',
                  'Loneliness.Hyperplane.positiveBoxAdmissible_isQuasipolynomial_of_nonzero',
                  'Loneliness.Hyperplane.positiveBoxAdmissible_quasipolynomial']),
 'system-counts': ('Conjectures.LonelinessHyperplaneSystemUnions',
                   ['Loneliness.Hyperplane.RationalCone.closedSystemBox_card_inclusion_exclusion',
                    'Loneliness.Hyperplane.RationalCone.closedSystemBox_quasipolynomial_on_positive',
                    'Loneliness.Hyperplane.RationalCone.positiveSystemBox_card_eq',
                    'Loneliness.Hyperplane.RationalCone.positiveSystemBox_quasipolynomial_on_positive',
                    'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_card_inclusion_exclusion',
                    'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_quasipolynomial_on_positive']),
 'exceptional-count': ('Conjectures.LonelinessHyperplaneExceptionalQuasipolynomial',
                       ['Loneliness.Hyperplane.integral_mFourier_velocity',
                        'Loneliness.Hyperplane.integer_annihilator_iff',
                        'Loneliness.Hyperplane.torusRelation_character_trivial_iff',
                        'Loneliness.Hyperplane.exists_finite_frequency_average_control',
                        'Loneliness.Hyperplane.exists_finite_frequency_dense_velocity',
                        'Loneliness.Hyperplane.positiveBoxExceptional_card_le',
                        'Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower',
                        'Loneliness.Hyperplane.exists_positive_distinct_integer_kernel',
                        'Loneliness.Hyperplane.exists_admissible_box_denominator',
                        'Loneliness.Hyperplane.exists_finite_frequency_uniform_gap_cover',
                        'Loneliness.Hyperplane.torusVelocityValue_coe',
                        'Loneliness.Hyperplane.torusUniformShiftGap_eq_real',
                        'Loneliness.Hyperplane.exists_uniform_bad_count_bound',
                        'Loneliness.Hyperplane.exceptional_count_mul_box_le',
                        'Loneliness.Hyperplane.exists_uniform_probability_rate',
                        'Loneliness.Hyperplane.exists_torus_uniform_probability_rate',
                        'Loneliness.Hyperplane.uniformFailureProbability_tendsto_zero',
                        'Loneliness.Hyperplane.uniformSuccessProbability_tendsto_one',
                        'Loneliness.Hyperplane.exists_subthreshold_count_bound',
                        'Loneliness.Hyperplane.RealSubspace.trivialFrequency_iff',
                        'Loneliness.Hyperplane.RealSubspace.nontrivialFrequency_finrank_lt',
                        'Loneliness.Hyperplane.RealSubspace.exists_finite_frequency_bad_cover',
                        'Loneliness.Hyperplane.RealSubspace.exists_finite_slice_classification',
                        'Loneliness.Hyperplane.RealSubspace.exists_finite_proper_slice_classification',
                        'Loneliness.Hyperplane.RealSubspace.hyperplane_closed_sublevel_finite_union',
                        'Loneliness.Hyperplane.RationalCone.closedSystemBox_card_inclusion_exclusion',
                        'Loneliness.Hyperplane.RationalCone.closedSystemBox_quasipolynomial_on_positive',
                        'Loneliness.Hyperplane.RationalCone.positiveSystemBox_card_eq',
                        'Loneliness.Hyperplane.RationalCone.positiveSystemBox_quasipolynomial_on_positive',
                        'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_card_inclusion_exclusion',
                        'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_quasipolynomial_on_positive',
                        'Loneliness.Hyperplane.positiveBoxBelow_eq_finite_system_union',
                        'Loneliness.Hyperplane.positiveBoxBelow_quasipolynomial_on_positive',
                        'Loneliness.Hyperplane.positiveBoxBelow_progression_polynomials']),
 'fixed-shift': ('Conjectures.LonelinessHyperplaneFixedShift',
                 ['Loneliness.Hyperplane.fixedShiftCDF_tendsto',
                  'Loneliness.Hyperplane.fixedShift_torus_cdf_tendsto']),
 'main': ('Conjectures.LonelinessHyperplaneMain',
          ['Loneliness.Hyperplane.integral_mFourier_velocity',
           'Loneliness.Hyperplane.integer_annihilator_iff',
           'Loneliness.Hyperplane.torusRelation_character_trivial_iff',
           'Loneliness.Hyperplane.exists_finite_frequency_average_control',
           'Loneliness.Hyperplane.exists_finite_frequency_dense_velocity',
           'Loneliness.Hyperplane.positiveBoxExceptional_card_le',
           'Loneliness.Hyperplane.exists_positiveBoxAdmissible_card_lower',
           'Loneliness.Hyperplane.exists_positive_distinct_integer_kernel',
           'Loneliness.Hyperplane.exists_admissible_box_denominator',
           'Loneliness.Hyperplane.exists_finite_frequency_uniform_gap_cover',
           'Loneliness.Hyperplane.torusVelocityValue_coe',
           'Loneliness.Hyperplane.torusUniformShiftGap_eq_real',
           'Loneliness.Hyperplane.exists_uniform_bad_count_bound',
           'Loneliness.Hyperplane.exceptional_count_mul_box_le',
           'Loneliness.Hyperplane.exists_uniform_probability_rate',
           'Loneliness.Hyperplane.exists_torus_uniform_probability_rate',
           'Loneliness.Hyperplane.uniformFailureProbability_tendsto_zero',
           'Loneliness.Hyperplane.uniformSuccessProbability_tendsto_one',
           'Loneliness.Hyperplane.exists_subthreshold_count_bound',
           'Loneliness.Hyperplane.haar_predictedValue_distribution',
           'Loneliness.Hyperplane.haar_predictedValue_isUniform',
           'Loneliness.Hyperplane.continuous_torusVelocityValue',
           'Loneliness.Hyperplane.independentShiftLaw_isProbability',
           'Loneliness.Hyperplane.independentShiftLaw_cdf',
           'Loneliness.Hyperplane.independentShiftCDF_lower',
           'Loneliness.Hyperplane.independentShiftCDF_upper',
           'Loneliness.Hyperplane.independentShiftCDF_tendsto',
           'Loneliness.Hyperplane.independentShiftLaw_cdf_tendsto_uniform',
           'Loneliness.Hyperplane.positiveBoxEndpoint_eq_hitsResidue',
           'Loneliness.Hyperplane.endpointFrequency_tendsto',
           'Loneliness.Hyperplane.unshifted_endpoint_iff_sign_point',
           'Loneliness.Hyperplane.velocity_hits_unit_multiple_iff',
           'Loneliness.Hyperplane.unshiftedSignPoint_unit_multiple',
           'Loneliness.Hyperplane.unshifted_endpoint_iff_canonical',
           'Loneliness.Hyperplane.unshifted_cdf_tendsto',
           'Loneliness.Hyperplane.predictedValue_zero',
           'Loneliness.Hyperplane.canonicalEndpointResidue_mem_kernel',
           'Loneliness.Hyperplane.scaledUnitResidueLine_frequency_tendsto',
           'Loneliness.Hyperplane.exists_scaledUnitResidue_uniform_bound',
           'Loneliness.Hyperplane.exists_smooth_coprime_factorization',
           'Loneliness.Hyperplane.smooth_coprime_factor_unique',
           'Loneliness.Hyperplane.scaledUnitResidueLine_unique_smooth',
           'Loneliness.Hyperplane.positive_velocity_hits_residue_iff_unique_smooth',
           'Loneliness.Hyperplane.smoothResidueFrequency_tendsto',
           'Loneliness.Hyperplane.positiveBoxHitsResidue_card',
           'Loneliness.Hyperplane.residueHitFrequency_eq_smoothResidueFrequency',
           'Loneliness.Hyperplane.residueHitFrequency_tendsto',
           'Loneliness.Hyperplane.full_support_maximizer',
           'Loneliness.Hyperplane.full_support_endpoint_velocity_points',
           'Loneliness.Hyperplane.primitive_velocity_hits_residue_iff',
           'Loneliness.Hyperplane.primitive_velocity_hits_unit_line_iff',
           'Loneliness.Hyperplane.unitResidueLine_card',
           'Loneliness.Hyperplane.unitResidueLine_mem_kernel',
           'Loneliness.Hyperplane.hasSum_smooth_reciprocal_power',
           'Loneliness.Hyperplane.summable_smooth_reciprocal_power',
           'Loneliness.Hyperplane.tsum_smooth_reciprocal_power',
           'Loneliness.Hyperplane.residue_kernel_card',
           'Loneliness.Hyperplane.exists_integer_kernel_residue_translation',
           'Loneliness.Hyperplane.positiveBoxAffineStrip_card_le',
           'Loneliness.Hyperplane.exists_residue_count_difference_bound',
           'Loneliness.Hyperplane.exists_residue_frequency_rate',
           'Loneliness.Hyperplane.residueFrequency_tendsto',
           'Loneliness.Hyperplane.residueSetFrequency_tendsto',
           'Loneliness.Hyperplane.one_relation_fiber_card_le',
           'Loneliness.Hyperplane.positiveBoxAdmissible_card_upper',
           'Loneliness.Hyperplane.positiveBoxDivisible_card_le',
           'Loneliness.Hyperplane.sharpNormal_primitive',
           'Loneliness.Hyperplane.sharpNormal_realAdmissible',
           'Loneliness.Hyperplane.sharpVelocity_attaining_time',
           'Loneliness.Hyperplane.sharpVelocity_value',
           'Loneliness.Hyperplane.sharp_uniform_bad_count_lower',
           'Loneliness.Hyperplane.sharp_uniform_failure_probability_two_sided',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.HasProgressionPolynomials.refine',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.IsQuasipolynomial.finite_linear_combination',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.coarsenedRelationBox_isQuasipolynomial_of_noninjective',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.collisionBox_isQuasipolynomial',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_card_inclusion_exclusion',
           'Loneliness.Hyperplane.QuasipolynomialArithmetic.injectiveRelationBox_isQuasipolynomial',
           'Loneliness.Hyperplane.positiveBoxAdmissible_isQuasipolynomial_of_nonzero',
           'Loneliness.Hyperplane.positiveBoxAdmissible_quasipolynomial',
           'Loneliness.Hyperplane.RationalCone.closedSystemBox_card_inclusion_exclusion',
           'Loneliness.Hyperplane.RationalCone.closedSystemBox_quasipolynomial_on_positive',
           'Loneliness.Hyperplane.RationalCone.positiveSystemBox_card_eq',
           'Loneliness.Hyperplane.RationalCone.positiveSystemBox_quasipolynomial_on_positive',
           'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_card_inclusion_exclusion',
           'Loneliness.Hyperplane.RationalCone.positiveSystemUnion_quasipolynomial_on_positive',
           'Loneliness.Hyperplane.RealSubspace.trivialFrequency_iff',
           'Loneliness.Hyperplane.RealSubspace.nontrivialFrequency_finrank_lt',
           'Loneliness.Hyperplane.RealSubspace.exists_finite_frequency_bad_cover',
           'Loneliness.Hyperplane.RealSubspace.exists_finite_slice_classification',
           'Loneliness.Hyperplane.RealSubspace.exists_finite_proper_slice_classification',
           'Loneliness.Hyperplane.RealSubspace.hyperplane_closed_sublevel_finite_union',
           'Loneliness.Hyperplane.positiveBoxBelow_eq_finite_system_union',
           'Loneliness.Hyperplane.positiveBoxBelow_quasipolynomial_on_positive',
           'Loneliness.Hyperplane.positiveBoxBelow_progression_polynomials',
           'Loneliness.Hyperplane.fixedShiftCDF_tendsto',
           'Loneliness.Hyperplane.fixedShift_torus_cdf_tendsto'])}

DEFAULT_TASKS = ("main",)

GATE_INPUTS = {'.github/workflows/lean-loneliness-hyperplane-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_loneliness_hyperplane_candidate.py',
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
    destination = ROOT / ".candidate-artifacts" / ("loneliness-hyperplane-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "loneliness-hyperplane-" + args.task)
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
    print(f"PASS loneliness-hyperplane-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
