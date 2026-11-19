#!/usr/bin/env python3
"""Check the separate finite and geometric critical-seven candidates."""

import verify_loneliness_geometry as gate


PREFIX = "Loneliness.SevenCoordinateCritical."
gate.TASKS = {
    "critical-seven-finite": (
        ["Conjectures.LonelinessSevenCoordinateFinite"],
        [PREFIX + "Finite.small_surjective",
         PREFIX + "Finite.exists_reduced",
         PREFIX + "Finite.all_reduced_cases",
         PREFIX + "Finite.productForm_of_necessary_conditions"],
    ),
    "critical-seven-plane": (
        ["Conjectures.LonelinessSevenCoordinatePlaneNormalization"],
        [PREFIX + "two_primitive_signed_repeat_directions",
         PREFIX + "low_plane_no_forced_signed_equality",
         PREFIX + "normalized_low_plane"],
    ),
    "critical-seven-tangent": (
        ["Conjectures.LonelinessSevenCoordinateTangent"],
        [PREFIX + "canonical_plane_pair_proportional"],
    ),
    "critical-seven-bridge": (
        ["Conjectures.LonelinessSevenCoordinateAdmissibility",
         "Conjectures.LonelinessSevenCoordinateProduct"],
        [PREFIX + "candidate_of_canonicalSigned",
         PREFIX + "repeatShape_of_consecutive",
         PREFIX + "repeatTests_of_low_plane",
         PREFIX + "productForm_coordinate_product",
         PREFIX + "productForm_standardPlane"],
    ),
    "critical-seven-assembly": (
        ["Conjectures.LonelinessSevenCoordinateClassification"],
        [PREFIX + "critical_plane_classification",
         PREFIX + "standardPlane_value",
         PREFIX + "standardProductPlane_value",
         PREFIX + "coordinateFree_of_positive_spaceValue",
         PREFIX + "critical_plane_iff"],
    ),
}
gate.GATE_INPUTS |= {
    "scripts/verify_loneliness_critical_seven.py",
    ".github/workflows/lean-loneliness-critical-seven.yml",
}

if __name__ == "__main__":
    gate.main()
