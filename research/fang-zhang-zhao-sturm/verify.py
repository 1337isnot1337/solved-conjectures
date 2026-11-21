#!/usr/bin/env python3
"""Exact consistency checks supporting the general q-Hoggatt Sturm proof.

These finite checks do not prove the universal conjecture. The proof is in
PROOF.md. Coefficients are rational throughout. Gaussian
binomials, the product B_N, and boxed plane partitions are computed by
independent formulas. Optional SymPy root isolation gives exact rational
certificates for small sample rows and adjacent interlacing.
"""

from fractions import Fraction as Q
from functools import lru_cache
from math import prod


@lru_cache(None)
def gaussian(n, k, q):
    if k < 0 or k > n:
        return Q(0)
    if n == 0:
        return Q(1)
    return gaussian(n - 1, k - 1, q) + q**k * gaussian(n - 1, k, q)


def q_integer(n, q):
    return sum((q**j for j in range(n)), Q(0))


def b(n, k, q):
    return q ** (k * (k + 1) // 2) * gaussian(n, k, q)


def geometric_product(n, q):
    coefficients = [Q(1)]
    for i in range(1, n + 1):
        next_row = [Q(0)] * (len(coefficients) + 1)
        for j, c in enumerate(coefficients):
            next_row[j] += c
            next_row[j + 1] += q**i * c
        coefficients = next_row
    return coefficients


def f_row(n, m, q):
    assert n >= m - 1
    return [prod(b(n, k + i, q) for i in range(m))
            for k in range(n - m + 2)]


def boxed_plane_partitions(k, ell, m, q):
    # MacMahon's original three-dimensional product, with the q=1 limit.
    value = Q(1)
    for i in range(1, k + 1):
        for j in range(1, ell + 1):
            for h in range(1, m + 1):
                upper, lower = i + j + h - 1, i + j + h - 2
                if q == 1:
                    value *= Q(upper, lower)
                else:
                    value *= (1 - q**upper) / (1 - q**lower)
    return value


def h_row(n, m, q):
    return [q ** (m * k * (k + 1) // 2)
            * boxed_plane_partitions(k, n - 1 - k, m, q)
            for k in range(n)]


def check_identities():
    cases = 0
    for q in map(Q, [Q(5, 4), Q(3, 2), 2, 3, 5]):
        for m in range(2, 6):
            for n in range(m, m + 6):
                bn = geometric_product(n, q)
                assert bn == [b(n, k, q) for k in range(n + 1)]
                previous = f_row(n - 1, m - 1, q)
                g = [u * v for u, v in zip(bn, previous)]
                derivative = [q_integer(k + 1, q) * g[k + 1]
                              for k in range(len(g) - 1)]
                expected = [q ** (k + 1) * q_integer(n, q) * c
                            for k, c in enumerate(f_row(n - 1, m, q))]
                assert derivative == expected, ("Jackson identity", q, m, n)

                factor = (q ** ((m + 1) * m * (m - 1) // 6)
                          * prod(gaussian(n, j, q) for j in range(1, m)))
                scale = q ** (m * (m - 1) // 2)
                transferred = [factor * scale**k * c
                               for k, c in enumerate(h_row(n - m + 2, m, q))]
                assert f_row(n, m, q) == transferred, ("Hoggatt transfer", q, m, n)
                cases += 1
    print(f"PASS: {cases} exact Jackson identities and independent MacMahon transfers")


def check_sample_interlacing():
    import sympy as sp

    t = sp.Symbol("t")
    pairs = 0
    for q in (Q(3, 2), Q(2), Q(3)):
        for m in (2, 3, 4):
            previous = []
            for n in range(1, 8):
                row = h_row(n, m, q)
                polynomial = sp.Poly(sum(sp.Rational(c.numerator, c.denominator)
                                         * t**k for k, c in enumerate(row)), t)
                isolated = polynomial.intervals(eps=sp.Rational(1, 10**14))
                assert len(isolated) == n - 1
                assert all(mult == 1 and interval[1] < 0
                           for interval, mult in isolated)
                current = [interval for interval, _ in isolated]
                for i, interval in enumerate(previous):
                    assert current[i][1] < interval[0]
                    assert interval[1] < current[i + 1][0]
                if n >= 2:
                    pairs += 1
                previous = current
    print(f"PASS: {pairs} adjacent pairs certified by exact rational root isolation")


if __name__ == "__main__":
    check_identities()
    check_sample_interlacing()
