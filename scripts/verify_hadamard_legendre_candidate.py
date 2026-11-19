#!/usr/bin/env python3
"""Check one exact Legendre-pair proof closure.

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
    'basic': ('Conjectures.HadamardLegendreBasic', [
        'HadamardLegendre.pairCorrelation_zero',
        'HadamardLegendre.sum_pairCorrelation_of_legendre',
        'HadamardLegendre.rowSum_sign_of_legendre',
        'HadamardLegendre.normalizeSigns_isLegendrePair',
    ]),
    'centering': ('Conjectures.HadamardLegendreCentering', [
        'HadamardLegendre.rowSum_sign_of_legendre',
        'HadamardLegendre.normalizeSigns_isLegendrePair',
        'HadamardLegendre.centeredRows_apply',
        'HadamardLegendre.centeredRows_rowSum',
        'HadamardLegendre.centeredRows_moment',
        'HadamardLegendre.centeredRows_pairCorrelation',
        'HadamardLegendre.centeredRows_isLegendrePair',
        'HadamardLegendre.commonMultiplierGroup_eq_fixed_centeredRows',
    ]),
    'arithmetic': ('Conjectures.HadamardLegendreArithmetic', [
        'HadamardLegendre.integer_sum_two_squares_pow_599_even',
        'HadamardLegendre.rational_sum_two_squares_pow_599_even',
        'HadamardLegendre.rational_sum_two_squares_ne_599',
    ]),
    'odd-degree': ('Conjectures.HadamardLegendreOddDegree', [
        'HadamardLegendre.rational_sum_two_squares_pow_599_even',
        'HadamardLegendre.gaussianMatrix_mul_conj',
        'HadamardLegendre.rational_matrix_sum_two_squares',
        'HadamardLegendre.even_finrank_of_sum_two_squares_599',
        'HadamardLegendre.not_sum_two_squares_599_of_odd_finrank',
    ]),
    'fourier': ('Conjectures.HadamardLegendreFourier', [
        'HadamardLegendre.fourierSum_conjugate_mul',
        'HadamardLegendre.pair_fourier_norm',
        'HadamardLegendre.fourierSum_fixed_of_invariant',
        'HadamardLegendre.invariant_pair_fourier_squares',
    ]),
    'cyclotomic': ('Conjectures.HadamardLegendreCyclotomic', [
        'HadamardLegendre.cyclotomicConjugation_order',
        'HadamardLegendre.realFixedField_odd_finrank',
        'HadamardLegendre.realFixedField_no_two_squares_599',
        'HadamardLegendre.cyclotomicCharacter_nontrivial',
        'HadamardLegendre.cyclotomicConjugation_character',
    ]),
    'inversion': ('Conjectures.HadamardLegendreInversion', [
        'HadamardLegendre.invariant_pair_fourier_squares',
        'HadamardLegendre.realFixedField_odd_finrank',
        'HadamardLegendre.realFixedField_no_two_squares_599',
        'HadamardLegendre.no_legendre_inverted_character',
        'HadamardLegendre.no_legendre_inverting_prime_quotient',
    ]),
    'prime-quotients': ('Conjectures.HadamardLegendrePrimeQuotients', [
        'HadamardLegendre.exists_surjective_prime_quotient',
        'HadamardLegendre.involution_has_inverting_prime_quotient',
        'HadamardLegendre.prime_divisor_1197_mod_four_three',
    ]),
    'involutions': ('Conjectures.HadamardLegendreInvolutions', [
        'HadamardLegendre.odd_card_of_no_involutions',
        'HadamardLegendre.fixedMultiplier_no_involution',
        'HadamardLegendre.commonMultiplier_no_involution',
        'HadamardLegendre.commonMultiplierGroup_odd_card',
        'HadamardLegendre.multiplier_subgroup_odd_card',
    ]),
    'order-nine': ('Conjectures.HadamardLegendreOrderNine', [
        'HadamardLegendre.prime_automorphism_fixed_card_nine',
        'HadamardLegendre.permutation_eq_one_of_prime_card_of_fixed',
        'HadamardLegendre.order_three_difference_range_fixed',
        'HadamardLegendre.order_three_difference_square_zero',
    ]),
    'domain': ('Conjectures.HadamardLegendreDomain', [
        'HadamardLegendre.exists_cyclic_subgroup_card_133',
        'HadamardLegendre.quotientProductHom133_injective',
        'HadamardLegendre.domainEquiv133_fst',
        'HadamardLegendre.exists_domain_equiv1197',
    ]),
    'compression': ('Conjectures.HadamardLegendreCompression', [
        'HadamardLegendre.pairCorrelation_compress_eq_fiber_sum',
        'HadamardLegendre.compressed_pairCorrelation_formula',
        'HadamardLegendre.compressed_pair_energy',
        'HadamardLegendre.abs_compress_le_kernel_card',
        'HadamardLegendre.compressed_rowSum',
        'HadamardLegendre.compress_equivariant',
        'HadamardLegendre.compress_comp',
    ]),
    'order-three-fibers': ('Conjectures.HadamardLegendreOrderThreeFibers', [
        'HadamardLegendre.order_three_row_constant_on_nonzero_coset',
        'HadamardLegendre.order_three_quotient_card',
        'HadamardLegendre.order_three_compressed_square_nonzero',
        'HadamardLegendre.order_three_compressed_energy_ge',
    ]),
    'projection': ('Conjectures.HadamardLegendreProjection', [
        'HadamardLegendre.automorphism_product_apply133',
        'HadamardLegendre.projections133_jointly_injective',
        'HadamardLegendre.units133_card',
        'HadamardLegendre.card_dvd_twenty_seven_of_injective_projection',
    ]),
    'invariant-quotient': ('Conjectures.HadamardLegendreInvariantQuotient', [
        'HadamardLegendre.exists_surjective_quotient_three',
        'HadamardLegendre.nonzero_hom_zmod_three_surjective',
        'HadamardLegendre.exists_invariant_quotient_three',
    ]),
    'kernel': ('Conjectures.HadamardLegendreKernel', [
        'HadamardLegendre.compress_prodMap_id',
        'HadamardLegendre.no_legendre_order_three_on_nine_factor',
        'HadamardLegendre.multiplierProjection133_injective_on_odd_fixed',
        'HadamardLegendre.odd_fixed_multiplier_card_dvd_twenty_seven',
    ]),
    'transfer': ('Conjectures.HadamardLegendreTransfer', [
        'HadamardLegendre.reindexRows_rowSum',
        'HadamardLegendre.reindexRows_pairCorrelation',
        'HadamardLegendre.reindexRows_isLegendrePair',
        'HadamardLegendre.conjugateAut_fixed_mem_iff',
        'HadamardLegendre.card_fixedMultiplierGroup_reindex',
    ]),
    'reduction': ('Conjectures.HadamardLegendreReduction', [
        'HadamardLegendre.common_multiplier_card_dvd_twenty_seven',
        'HadamardLegendre.common_multiplier_card_le_twenty_seven',
        'HadamardLegendre.multiplier_subgroup_card_dvd_twenty_seven',
        'HadamardLegendre.common_multiplier_card_le_nine_of_ne_twenty_seven',
    ]),
    'full-image': ('Conjectures.HadamardLegendreFullImage', [
        'HadamardLegendre.units_seven_nineteen_card',
        'HadamardLegendre.units_seven_nineteen_pow_eighteen',
        'HadamardLegendre.square_mem_of_card_twenty_seven',
        'HadamardLegendre.exists_preimage_square_of_card_twenty_seven',
    ]),
    'quotient-model': ('Conjectures.HadamardLegendreQuotientModel', [
        'HadamardLegendre.expand_classRow133',
        'HadamardLegendre.weightedSum_classRow133',
        'HadamardLegendre.pairCorrelation_classRows133',
        'HadamardLegendre.expand_project_classLayers133',
        'HadamardLegendre.classLayers133_sum',
        'HadamardLegendre.pairCorrelation_project_classLayers133',
    ]),
    'quotient-maps': ('Conjectures.HadamardLegendreQuotientMaps', [
        'HadamardLegendre.crt133_mul_unit',
        'HadamardLegendre.cyclicQuotient133_kernel_card',
        'HadamardLegendre.layerQuotient133_kernel_card',
        'HadamardLegendre.marginQuotient21_kernel_card',
        'HadamardLegendre.sum_layer_compression',
        'HadamardLegendre.sum_nineteen_layer_compression',
        'HadamardLegendre.cyclicQuotient133_equivariant',
        'HadamardLegendre.layerQuotient133_equivariant',
    ]),
    'quotient-data': ('Conjectures.HadamardLegendreQuotientData', [
        'HadamardLegendre.quotientRows133_squareInvariant',
        'HadamardLegendre.quotientLayers133_squareInvariant',
        'HadamardLegendre.quotientData133_of_compressed_invariance',
        'HadamardLegendre.quotientData133_of_fixed_card27',
    ]),
    'construction-algebra': ('Conjectures.HadamardLegendreConstructionAlgebra', [
        'HadamardLegendre.convolution_commute',
        'HadamardLegendre.convolution_normal',
        'HadamardLegendre.pair_convolution_gram',
        'HadamardLegendre.twoRowCore_gram',
    ]),
    'construction': ('Conjectures.HadamardLegendreConstruction', [
        'HadamardLegendre.convolution_commute',
        'HadamardLegendre.convolution_normal',
        'HadamardLegendre.pair_convolution_gram',
        'HadamardLegendre.twoRowCore_gram',
        'HadamardLegendre.twoRowMatrix_sign',
        'HadamardLegendre.twoRowMatrix_gram',
        'HadamardLegendre.twoRowMatrix_isHadamard',
        'HadamardLegendre.exists_hadamard_of_legendre_pair',
        'HadamardLegendre.exists_hadamard_2396_of_legendre_pair',
    ]),
}

DEFAULT_TASKS = ("quotient-data", "construction")

GATE_INPUTS = {'.github/workflows/lean-hadamard-legendre-candidates.yml',
 'lean/lake-manifest.json',
 'lean/lakefile.toml',
 'lean/lean-toolchain',
 'scripts/plan_lean_candidates.py',
 'scripts/replay_lean.py',
 'scripts/verify_hadamard_legendre_candidate.py',
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
    destination = ROOT / ".candidate-artifacts" / ("hadamard-legendre-" + args.task)
    destination.mkdir(parents=True, exist_ok=True)
    try:
        check_sources(modules, receipt)
        receipt["completed_checks"].append("strict source checks, warnings treated as errors")
        audit([target], required, modules, "hadamard-legendre-" + args.task)
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
    print(f"PASS hadamard-legendre-{args.task}: strict source, axiom, and kernel gates; unchanged sources",
          flush=True)


if __name__ == "__main__":
    main()
