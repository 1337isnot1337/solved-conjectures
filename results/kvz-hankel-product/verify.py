#!/usr/bin/env python3
"""Exact arithmetic certificates for the Hankel-product counterexamples.

The all-order kernel properties and the exponential-series inequalities
are proved in PROOF.md. This script verifies the arithmetic used in the
two independent pairs of opposite-sign minors. It uses no floating point.
"""

from fractions import Fraction as Q


def determinant_2(matrix):
    return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0]


def rational_kernel(x, y):
    s = x + y
    return s / (1 + s) ** 2


def main():
    witnesses = (
        ((Q(1, 2), Q(1)), Q(-23, 11250)),
        ((Q(1), Q(2)), Q(23, 57600)),
    )
    signs = []
    for points, expected in witnesses:
        matrix = [[rational_kernel(x, y) for y in points] for x in points]
        actual = determinant_2(matrix)
        assert actual == expected, (points, matrix, actual, expected)
        signs.append(actual > 0)
        print(f"Rational minor at {points}: {actual}")
    assert signs == [False, True]

    threshold = Q(9, 8)
    small_t = Q(1, 10)
    small_exponent = 2 * small_t**2
    assert small_exponent == Q(1, 50)
    # For 0<u<1, the exponential series is strictly below 1/(1-u).
    upper_bound = 1 / (1 - small_exponent)
    assert upper_bound == Q(50, 49) < threshold
    print(f"Small-grid exponential upper bound: {upper_bound} < {threshold}")

    large_t = Q(1)
    large_exponent = 2 * large_t**2
    # For u>0, the exponential series is strictly above 1+u.
    lower_bound = 1 + large_exponent
    assert lower_bound == Q(3) > threshold
    print(f"Large-grid exponential lower bound: {lower_bound} > {threshold}")
    print("PASS: two rational minors and two exact exponential-sign bounds")


if __name__ == "__main__":
    main()
