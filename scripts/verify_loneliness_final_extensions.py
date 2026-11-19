#!/usr/bin/env python3
"""Check endpoint, subspace, and quantitative runner candidates independently.

These are source candidates, not accepted registrations. Each task uses the
unchanged exact-closure source, axiom, and stock-kernel verification gate.
"""

import verify_loneliness_geometry as gate


def endpoints(namespace, names):
    return [namespace + "." + name for name in names]


H = "Loneliness.Hyperplane"
C = "Loneliness.SevenCoordinateCritical"
Q = C + ".Quantitative"

gate.TASKS = {
    "six-classification-bound": (
        ["Conjectures.LonelinessSixClassificationBound"],
        endpoints(C, ["lonelyRunnerBound_six_of_classification"]),
    ),
    "hyperplane-endpoint-geometry": (
        ["Conjectures.LonelinessHyperplaneEndpointGeometry"],
        endpoints(H, ["unshifted_endpoint_iff_sign_point",
                      "velocity_hits_unit_multiple_iff",
                      "unshiftedSignPoint_unit_multiple",
                      "unshifted_endpoint_iff_canonical"]),
    ),
    "hyperplane-endpoint-density": (
        ["Conjectures.LonelinessHyperplaneEndpointDensity"],
        endpoints(H, ["positiveBoxEndpoint_eq_hitsResidue",
                      "endpointFrequency_tendsto"]),
    ),
    "hyperplane-rate-sharpness": (
        ["Conjectures.LonelinessHyperplaneRateSharpness"],
        endpoints(H, ["sharpNormal_primitive", "sharpNormal_realAdmissible",
                      "sharpVelocity_attaining_time", "sharpVelocity_value",
                      "sharp_uniform_bad_count_lower",
                      "sharp_uniform_failure_probability_two_sided"]),
    ),
    "hyperplane-compact-subgroup": (
        ["Conjectures.LonelinessHyperplaneSubgroupFourier"],
        endpoints(H + ".CompactSubgroup", [
            "integral_character_velocity_eq", "integral_polynomial_velocity_eq",
            "exists_finite_frequency_average_control",
            "exists_finite_frequency_dense_velocity",
        ]),
    ),
    "hyperplane-subspace-classification": (
        ["Conjectures.LonelinessHyperplaneSubspaceClassification"],
        endpoints(H + ".RealSubspace", [
            "trivialFrequency_iff", "nontrivialFrequency_finrank_lt",
            "exists_finite_frequency_bad_cover",
            "exists_finite_slice_classification",
            "exists_finite_proper_slice_classification",
            "hyperplane_closed_sublevel_finite_union",
        ]),
    ),
    "seven-quantitative-arithmetic": (
        ["Conjectures.LonelinessSevenCoordinateQuantitativeArithmetic"],
        endpoints(Q, ["normCutoff_eq", "first_tail_small",
                      "first_plane_area_small", "area_error_bounds",
                      "plane_value_bounds"]),
    ),
    "seven-rational-gap": (
        ["Conjectures.LonelinessSevenCoordinateRationalGap"],
        endpoints(Q, ["value_has_bounded_denominator",
                      "rational_gap_one_seventh",
                      "value_le_one_seventh_of_pair_bound"]),
    ),
    "seven-minor-bound": (
        ["Conjectures.LonelinessSevenCoordinateMinorBound"],
        endpoints(Q, ["real_minor_abs_le", "basis_second_decompose",
                      "basis_minor_abs_le", "repeatVector_as_minors",
                      "repeatVector_abs_le"]),
    ),
    "seven-quantitative-basis": (
        ["Conjectures.LonelinessSevenCoordinateQuantitativeBasis"],
        endpoints(Q, ["basisPlane_eq_prefix", "basisPlane_finrank",
                      "basisPlane_coordinateFree", "exists_near_plane"]),
    ),
    "seven-repeat-patterns": (
        ["Conjectures.LonelinessSevenCoordinatePatternPlane"],
        endpoints(Q, ["repeat_direction_bound_of_minors",
                      "repeatDirectionBound_signedCoordinates",
                      "repeatTests_of_direction_bound",
                      "two_primitive_signed_repeat_directions_of_bound",
                      "normalized_plane_of_repeat_bound"]),
    ),
    "seven-tangent-gap": (
        ["Conjectures.LonelinessSevenCoordinateTangentGap"],
        endpoints(C, ["canonical_plane_pair_proportional_of_lt"]),
    ),
    "seven-product-family": (
        ["Conjectures.LonelinessProductFamilySeven"],
        endpoints("Loneliness.ProductFamily", [
            "consecutive_seven_values", "consecutive_seven_product_below_iff",
            "consecutive_seven_product_classification",
            "consecutive_seven_product_spectrum",
        ]),
    ),
    "seven-product-directions": (
        ["Conjectures.LonelinessSevenCoordinateProductSpeeds"],
        endpoints(C, ["standardPlane_integer_coordinates",
                      "standardPlane_absolute_list",
                      "product_parameters_of_positive_direction"]),
    ),
    "seven-large-norm-family": (
        ["Conjectures.LonelinessSevenCoordinateLargeNormFamily"],
        endpoints(Q, ["product_plane_of_repeat_bound", "large_norm_critical_plane",
                      "large_norm_family_classification", "large_norm_family_iff",
                      "large_norm_spectrum"]),
    ),
}

gate.GATE_INPUTS |= {
    "scripts/verify_loneliness_final_extensions.py",
    ".github/workflows/lean-loneliness-final-extensions.yml",
}

if __name__ == "__main__":
    gate.main()
