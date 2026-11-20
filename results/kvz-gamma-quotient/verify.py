#!/usr/bin/env python3
"""Exact diagnostic checks for the gamma-quotient proof.

This finite check is not the proof of all-order sign regularity.  PROOF.md
provides that proof by determinant composition.  No floating-point gamma
evaluation, root finding, or numerical quadrature is used here.
"""

from fractions import Fraction as Q
from math import comb, factorial


def rising(x, n):
    value = Q(1)
    for j in range(n):
        value *= x + j
    return value


def falling(x, n):
    value = Q(1)
    for j in range(n):
        value *= x - j
    return value


def sign(x):
    return (x > 0) - (x < 0)


def determinant(matrix):
    a = [[Q(x) for x in row] for row in matrix]
    result = Q(1)
    n = len(a)
    for col in range(n):
        pivot_row = next((row for row in range(col, n) if a[row][col]), None)
        if pivot_row is None:
            return Q(0)
        if pivot_row != col:
            a[col], a[pivot_row] = a[pivot_row], a[col]
            result = -result
        pivot = a[col][col]
        result *= pivot
        for row in range(col + 1, n):
            multiplier = a[row][col] / pivot
            for j in range(col + 1, n):
                a[row][j] -= multiplier * a[col][j]
            a[row][col] = Q(0)
    return result


def half_gamma_quotient_scaled(s, delta):
    """Return Gamma(s+delta)/(Gamma(s)*sqrt(pi)), exactly.

    The check uses positive integer s and positive half-integer delta.
    """
    assert s.denominator == 1 and s > 0
    assert delta.denominator == 2 and delta > 0
    s = int(s)
    k = s + int(delta - Q(1, 2))
    return Q(factorial(2 * k), 4**k * factorial(k) * factorial(s - 1))


def predicted_signature(delta, order):
    value = Q((-1) ** (order * (order - 1) // 2))
    for j in range(order):
        value *= falling(delta, j)
    return sign(value)


def run():
    checks = 0
    grids = (
        ([Q(n) for n in (1, 2, 3, 4, 5, 6, 7)],
         [Q(n) for n in (1, 3, 4, 7, 9, 12, 14)]),
        ([Q(n, 2) for n in (1, 5, 11, 19, 29, 41, 55)],
         [Q(n, 2) for n in (3, 7, 13, 23, 35, 49, 65)]),
    )

    # All entries have the common positive factor sqrt(pi), so the
    # rational determinant has the exact sign of the gamma determinant.
    for delta in (Q(1, 2), Q(3, 2), Q(5, 2), Q(9, 2)):
        for x, y in grids:
            for order in range(1, 7):
                matrix = [
                    [half_gamma_quotient_scaled(a + b, delta)
                     for b in y[:order]]
                    for a in x[:order]
                ]
                assert sign(determinant(matrix)) == predicted_signature(delta, order)
                checks += 1

    # Integer shifts give exact polynomial values and an exact rank cutoff.
    for delta in (1, 2, 4):
        for x, y in grids:
            for order in range(1, 8):
                matrix = [[rising(a + b, delta) for b in y[:order]]
                          for a in x[:order]]
                expected = (-1) ** (order * (order - 1) // 2)
                if order > delta + 1:
                    expected = 0
                assert sign(determinant(matrix)) == expected
                checks += 1

    # Independently expand the integer moments in the gamma convolution
    # identity.  These rational identities check its normalization.
    for x, y in ((Q(1, 3), Q(2, 5)), (Q(3, 2), Q(7, 3)), (Q(5), Q(2))):
        for degree in range(8):
            lhs = sum(Q(comb(degree, k)) * rising(x, k) * rising(y, degree - k)
                      for k in range(degree + 1))
            assert lhs == rising(x + y, degree)
            checks += 1

    # A transparent exact certificate for the source's order-three
    # signature correction at delta=1/2.
    nodes = (Q(1, 2), Q(3, 2), Q(5, 2))
    witness = determinant([[half_gamma_quotient_scaled(a + b, Q(1, 2))
                            for b in nodes] for a in nodes])
    assert witness > 0
    checks += 1
    print(f"PASS: {checks} exact rational checks")
    print(f"delta=1/2 order-three determinant / pi^(3/2) = {witness}")


if __name__ == "__main__":
    run()
