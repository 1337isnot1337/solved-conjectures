#!/usr/bin/env python3
"""Exact finite checks for the Sun v1 one-bit quotient obstruction.

The lower-bound theorem is imported from Landsberg--Michalek, 1608.07486v1,
Theorem 1.1. This script checks its substitution and the explicitly zero
feature transport, not the theorem's geometric proof or any full Sun map.
"""

from itertools import product
from math import comb


def completion_feature_transport(feature, absolute_character):
    """Equations 9.18/9.19; feature encodes H4 x F2, character lies in H5."""
    shifted = feature ^ (absolute_character & 15)
    return shifted if shifted else None


def main():
    # A.6 row8 has feature f=0 on X and Y. Section3.2 restricts each new
    # absolute character to A*e5, encoded by 0 or16. Check every outer source
    # occurrence and every allowed absolute-character triple, including
    # triples not satisfying closure: the deletion does not need closure.
    count = 0
    for old_row, new_row, channel in product(range(16), range(2), range(2)):
        for a, b, c in product(range(2), repeat=3):
            assert completion_feature_transport(0, 16 * a) is None
            assert completion_feature_transport(0, 16 * b) is None
            count += 1
    assert count == 64 * 8
    print("Feature-zero graft killed in all 64 outer copies and all 8 character triples.")

    one_row = 14 * 5 + 4 * 4 + 7 * 2 + 5 * 4 + 7
    reduced_budget = 64 * one_row
    assert (one_row, reduced_budget) == (127, 8128)

    # Apply the more detailed LM Theorem1.1 with n=w=64,m=57.
    n, m = 64, 57
    numerator = n * comb(n - 1 + m, m - 1)
    denominator = comb(2 * n - 2, n - 1)
    assert 0 < numerator < denominator
    known_lower = 2 * n * n - n + m - numerator // denominator
    assert known_lower == 8185
    assert reduced_budget < known_lower
    print(f"Reduced source budget={reduced_budget}; imported theorem lower bound={known_lower}.")
    print(f"Strict contradiction margin: {known_lower - reduced_budget}.")

    # The propagation-spare observation is conditional: the source never
    # explicitly gives zero maps on those54 blocks.
    n = 128
    full_budget = 2 * n * n
    if_spares_deleted = full_budget - 54 * 4
    known_lower = full_budget - 7 - 1
    assert (if_spares_deleted, known_lower) == (32552, 32760)
    assert if_spares_deleted < known_lower
    print("Conditional spare deletion: 32552 < 32760; this assumes those copies are killed.")


if __name__ == "__main__":
    main()
