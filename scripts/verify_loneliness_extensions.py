#!/usr/bin/env python3
"""Check runner and hyperplane extensions with the existing exact-closure gate.

Each task remains an unregistered candidate. Numerical six-speed prime tasks
are enabled only after their complete wrapper source is present; missing
imports in a present wrapper fail planning rather than omitting dependencies.
"""

import verify_loneliness_geometry as gate


def endpoints(namespace, names):
    return [namespace + "." + name for name in names]


gate.TASKS = {}
for count, word in ((7, "Seven"), (8, "Eight")):
    namespace = f"Loneliness.Modular.{word}Speed"
    gate.TASKS[f"{word.lower()}-support"] = (
        [f"Conjectures.Loneliness{word}SpeedFiniteSound"],
        endpoints(namespace, [
            "value_eq_of_mem_shapes", "terminal_sound", "checked_root",
            "retained_classification", "checked_prime_classification",
        ]),
    )
    gate.TASKS[f"{word.lower()}-primes"] = (
        [f"Conjectures.Loneliness{word}SpeedPrimeBounds"],
        endpoints(namespace, [
            "smallPrimeSet_subset", "smallPrimeSet_primes", "smallPrimeSet_product",
            "smallPrimeSet_coprime", "smallPrimeSet_margin",
            "exists_prime_of_squaredNorm", "exists_prime_of_tight",
        ]),
    )

gate.TASKS["hyperplane-laws"] = (
    ["Conjectures.LonelinessHyperplaneFixedShift",
     "Conjectures.LonelinessHyperplaneShiftLaw"],
    endpoints("Loneliness.Hyperplane", [
        "fixedShiftCDF_tendsto", "fixedShift_torus_cdf_tendsto",
        "continuous_torusVelocityValue", "independentShiftLaw_isProbability",
        "independentShiftLaw_cdf", "independentShiftCDF_lower",
        "independentShiftCDF_upper", "independentShiftCDF_tendsto",
        "independentShiftLaw_cdf_tendsto_uniform",
    ]),
)
gate.TASKS["hyperplane-endpoint-components"] = (
    ["Conjectures.LonelinessHyperplaneMaximizers",
     "Conjectures.LonelinessHyperplaneEndpointArithmetic",
     "Conjectures.LonelinessHyperplaneSmoothSeries",
     "Conjectures.LonelinessHyperplaneResidueDensity",
     "Conjectures.LonelinessHyperplaneOneRelation"],
    endpoints("Loneliness.Hyperplane", [
        "full_support_maximizer", "full_support_endpoint_velocity_points",
        "primitive_velocity_hits_residue_iff", "primitive_velocity_hits_unit_line_iff",
        "unitResidueLine_card", "unitResidueLine_mem_kernel",
        "hasSum_smooth_reciprocal_power", "summable_smooth_reciprocal_power",
        "tsum_smooth_reciprocal_power", "residue_kernel_card",
        "exists_integer_kernel_residue_translation", "positiveBoxAffineStrip_card_le",
        "exists_residue_count_difference_bound", "exists_residue_frequency_rate",
        "residueFrequency_tendsto", "residueSetFrequency_tendsto",
        "one_relation_fiber_card_le", "positiveBoxAdmissible_card_upper",
        "positiveBoxDivisible_card_le",
    ]),
)

for prime in (257, 271, 307, 313, 359, 373, 379, 383):
    module = f"Conjectures.LonelinessSixSpeedCertificate{prime}"
    if gate.source(module).is_file():
        gate.TASKS[f"six-{prime}"] = (
            [module],
            endpoints(f"Loneliness.Modular.SixSpeed.Certificates.Prime{prime}", [
                "inverse_checked", "all_checked", "rows_checked", "classification",
            ]),
        )

gate.GATE_INPUTS |= {
    "scripts/verify_loneliness_extensions.py",
    ".github/workflows/lean-loneliness-extensions.yml",
}

if __name__ == "__main__":
    gate.main()
