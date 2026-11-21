"""Exact diagnostics for the orbit, packet, and cycle-matching proofs."""

from fractions import Fraction
from itertools import permutations
from math import comb, factorial, prod

import sympy as sp


def permanent(matrix):
    return sum(
        prod(matrix[i, j] for i, j in enumerate(order))
        for order in permutations(range(matrix.rows))
    ).expand()


def check_orbits():
    checks = 0
    for n, r in [(2, 1), (3, 1), (4, 2), (6, 2), (6, 3)]:
        m = n // r
        P = sp.diag(*([sp.ones(m) / m] * r))
        phases = sp.diag(*(sp.I ** j for j in range(n)))
        P = phases * P * phases.H
        for a, b in [(0, 1), (1, 3), (2, sp.Rational(2, 3))]:
            scale = sp.sympify(b) / m
            block = sum(comb(m, j) * factorial(j) * a ** (m - j) * scale ** j
                        for j in range(m + 1))
            assert P * P == P and P.trace() == r
            assert permanent(a * sp.eye(n) + b * P) == block ** r
            checks += 1
    return checks


def check_packets():
    # For binary forms, coefficient contraction is the complex Fischer norm.
    z, w = sp.symbols("z w")
    linear = [z, w, (3*z + 4*sp.I*w)/5, (4*z - 3*w)/5, (3*sp.I*z + 4*w)/5]
    pairs = [(0, 1), (2, 3), (1, 4), (0, 3), (2, 4)]
    packets = [sp.Poly(linear[i] * linear[j], z, w) for i, j in pairs]
    vectors = [sp.Matrix([f.coeff(z), f.coeff(w)]) for f in linear]

    def inner(f, g):
        return sum(a.conjugate() * g.coeff_monomial(index)
                   * prod(factorial(t) for t in index) for index, a in f.terms())

    gram = sp.Matrix(len(packets), len(packets), lambda i, j: inner(packets[i], packets[j]))
    S = sp.zeros(2)
    for pair in pairs:
        for i in pair:
            S += vectors[i] * vectors[i].H
    m, k = len(pairs), 2
    upper_squared = (factorial(m) * factorial(k) ** m) ** 2 * (sp.trace(S*S)/(m*k)**2)**m
    assert permanent(gram)**2 <= upper_squared
    binary_product = prod(packets)
    assert inner(binary_product, binary_product) > permanent(gram)
    # Rational certificate for the only base-point comparison in the proof.
    assert Fraction(68, 25) ** 15 < 1890 ** 2
    partial_exp = sum(Fraction(1, factorial(j)) for j in range(7))
    assert partial_exp + Fraction(8, 7 * factorial(7)) < Fraction(68, 25)


def check_cycle_bound():
    vectors = [sp.Matrix(pair) for pair in [(1, 0), (0, 1), (sp.Rational(3, 5), 4*sp.I/5),
               (4*sp.I/5, sp.Rational(3, 5)), (sp.Rational(3, 5), sp.Rational(-4, 5))]]
    gram = sp.Matrix(5, 5, lambda i, j: vectors[i].dot(vectors[j], conjugate_convention="maths",
                                                       hermitian=True))
    excess = permanent(gram) - 1
    assert excess >= 0
    checks = 0
    for g in permutations(range(5)):
        seen = set()
        edges = 0
        for i in range(5):
            cycle = 0
            while i not in seen:
                seen.add(i)
                cycle += 1
                i = g[i]
            edges += cycle // 2
        weight = prod(gram[i, j] for i, j in enumerate(g))
        assert excess**2 >= (2**edges - 1)**2 * sp.expand_complex(weight * weight.conjugate())
        checks += 1
    return checks


if __name__ == "__main__":
    orbit_checks = check_orbits()
    check_packets()
    cycle_checks = check_cycle_bound()
    print(f"Passed {orbit_checks} block-orbit identities, the packet bounds and "
          f"rational constants, and {cycle_checks} cycle-matching inequalities.")
