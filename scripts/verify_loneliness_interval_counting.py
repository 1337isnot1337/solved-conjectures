#!/usr/bin/env python3
"""Check exact counting, interval insertion, and cut-certificate candidates."""

import verify_loneliness_geometry as gate


def endpoints(namespace, names):
    return [namespace + "." + name for name in names]


Q = "Loneliness.Hyperplane.QuasipolynomialArithmetic"
I = "Loneliness.TwoInsertions"
C = "Loneliness.Modular.SupportSearch.Bits.Cuts"
R = "Loneliness.Hyperplane.RationalCone"

gate.TASKS = {
    "hyperplane-partition-arithmetic": (
        ["Conjectures.LonelinessHyperplaneWeightedPartitions"],
        endpoints(Q, ["shiftedChoosePolynomial_eval", "weakComposition_card",
                      "shiftedWeakComposition_polynomial_on_progressions",
                      "weightedPartition_card_eq_sum",
                      "weightedPartition_polynomial_on_progressions",
                      "weightedPartition_quasipolynomial"]),
    ),
    "hyperplane-bounded-partitions": (
        ["Conjectures.LonelinessHyperplaneBoundedPartitions"],
        endpoints(Q, ["upperViolationPartition_polynomial_on_progressions",
                      "boundedWeightedPartition_card_inclusion_exclusion",
                      "boundedWeightedPartition_polynomial_on_progressions",
                      "boundedWeightedPartition_quasipolynomial"]),
    ),
    "hyperplane-simplicial-arithmetic": (
        ["Conjectures.LonelinessHyperplaneSimplicialArithmetic"],
        endpoints(Q, ["shiftedWeightedPartition_isQuasipolynomial_of_small_offset"]),
    ),
    "hyperplane-generic-cost": (
        ["Conjectures.LonelinessHyperplaneGenericCost"],
        endpoints(R, ["exists_rational_cost_avoiding", "exists_genericCost"]),
    ),
    "hyperplane-homogeneous-box": (
        ["Conjectures.LonelinessHyperplaneHomogeneousBox"],
        endpoints(R, ["exists_positive_height_generators", "homogeneousBox_card_eq",
                      "homogeneousBox_mem_of_rational_combination"]),
    ),
    "hyperplane-optimal-supports": (
        ["Conjectures.LonelinessHyperplaneOptimalSupports"],
        endpoints(R, ["optimal_support_independent", "optimal_unique",
                      "Optimal.supported_optimal", "supportedCone_inter"]),
    ),
    "hyperplane-closed-box-counting": (
        ["Conjectures.LonelinessHyperplaneBoxQuasipolynomial"],
        endpoints(Q, ["reflected_weighted_sum",
                      "closedRelationBox_quasipolynomial_of_full_support",
                      "closedRelationBox_card_factor",
                      "closedRelationBox_quasipolynomial_of_nonzero",
                      "closedRelationBox_zero_card",
                      "closedRelationBox_quasipolynomial"]),
    ),
    "two-insertion-interval": (
        ["Conjectures.LonelinessTwoInsertionsInterval"],
        endpoints(I, ["exists_good_on_interval", "IntervalCertificate.good",
                      "IntervalCertificate.unbounded_second", "PairCertificate.sound"]),
    ),
    "hyperplane-sampling-counting": (
        ["Conjectures.LonelinessHyperplaneDenominatorQuasipolynomial"],
        endpoints(Q, ["HasProgressionPolynomials.refine",
                      "IsQuasipolynomial.finite_linear_combination",
                      "coarsenedRelationBox_isQuasipolynomial_of_noninjective",
                      "collisionBox_isQuasipolynomial",
                      "injectiveRelationBox_card_inclusion_exclusion",
                      "injectiveRelationBox_isQuasipolynomial"]) +
        endpoints("Loneliness.Hyperplane", [
            "positiveBoxAdmissible_isQuasipolynomial_of_nonzero",
            "positiveBoxAdmissible_quasipolynomial",
        ]),
    ),
    "two-insertion-small": (
        ["Conjectures.LonelinessTwoInsertionsSmall"],
        endpoints(I, ["BaseRow.sound", "checked_rows_sound", "small_bounded_window"]) +
        [f"{I}.Small{p}.rows_checked" for p in range(3, 11)],
    ),
    "two-insertion-measure": (
        ["Conjectures.LonelinessTwoInsertionsMeasure"],
        endpoints(I, ["periodic_integral_upper", "badIndicator_integral_one",
                      "speed_bad_integral_bound", "two_speed_interval_of_length",
                      "window_of_measure"]),
    ),
    "two-insertion-divisibility": (
        ["Conjectures.LonelinessTwoInsertionsDivisibility"],
        endpoints(I, ["reciprocal_residue_lower", "failed_endpoints_divisibility",
                      "common_divisors_product_bound", "failed_endpoints_large_second",
                      "divisor_eq_below_twice", "large_first_measure_bound",
                      "window_above_small_bound"]),
    ),
    "two-insertion-shifts": (
        ["Conjectures.LonelinessTwoInsertionsShift"],
        endpoints(I, ["central_speed_window", "shifted_left_window",
                      "noncentral_divisibility_bound", "large_parameter_window"]),
    ),
    "two-insertion-full": (
        ["Conjectures.LonelinessTwoInsertions"],
        endpoints(I, ["two_speed_window_sorted", "two_speed_window",
                      "insertion_for_interval_base", "insertion_value_lower"]),
    ),
    "two-insertion-acceleration-arithmetic": (
        ["Conjectures.LonelinessTwoInsertionsAccelerationArithmetic"],
        endpoints(I, ["exists_coprime_in_block", "exists_coprime_near_half",
                      "AccelerationGap.sandwich", "AccelerationGap.twice_mul_le",
                      "AccelerationGap.accelerated_cell", "acceleration_cell_bounds"]),
    ),
    "two-insertion-accelerations": (
        ["Conjectures.LonelinessTwoInsertionsAccelerations"],
        endpoints(I, ["accelerated_speed_good", "acceleratedBase_good",
                      "goddyn_wong_two_insertions", "goddyn_wong_insertion_value",
                      "dilated_goddyn_wong_insertion_value"]),
    ),
    "two-insertion-obstruction": (
        ["Conjectures.LonelinessTwoInsertionsObstruction"],
        endpoints(I, ["three_speed_interval_upper", "three_speed_interval_obstruction",
                      "five_speed_outside_witness"]),
    ),
    "cover-cuts": (
        ["Conjectures.LonelinessModularCoverCuts"],
        endpoints(C, ["fragmentCheck_sound", "boundedCheck_size", "boundedCheck_sound",
                      "table_sound", "example_checked", "example_complete"]),
    ),
}

gate.GATE_INPUTS |= {
    "scripts/verify_loneliness_interval_counting.py",
    ".github/workflows/lean-loneliness-interval-counting.yml",
}

if __name__ == "__main__":
    gate.main()
