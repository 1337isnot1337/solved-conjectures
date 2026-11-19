#!/usr/bin/env python3
"""Check exact counting, interval insertion, and cut-certificate candidates."""

import verify_loneliness_geometry as gate


def endpoints(namespace, names):
    return [namespace + "." + name for name in names]


Q = "Loneliness.Hyperplane.QuasipolynomialArithmetic"
I = "Loneliness.TwoInsertions"
C = "Loneliness.Modular.SupportSearch.Bits.Cuts"

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
