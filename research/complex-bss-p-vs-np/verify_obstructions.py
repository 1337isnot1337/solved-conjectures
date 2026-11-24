#!/usr/bin/env python3
"""Exact checks for specific identities in this research package.

Requires SymPy. These checks do not prove P_C != NP_C, the imported circuit
lower bound, the all-size protocol theorem, or the analytic witness lemmas.
Run from any directory with assertions enabled.
"""

from itertools import permutations, product

import sympy as sp


def check_equal(actual, expected, label):
    difference = sp.cancel(sp.expand(actual - expected))
    if difference != 0:
        raise AssertionError(f"{label}: nonzero difference {difference}")


def permanent(matrix):
    n = len(matrix)
    return sum(sp.prod(matrix[i][p[i]] for i in range(n))
               for p in permutations(range(n)))


def kernel(matrix, z):
    n = len(matrix)
    return sp.prod(2 * value - 1 for value in z) * sp.prod(
        sum(matrix[i][j] * z[j] for j in range(n)) for i in range(n)
    )


def check_ryser():
    for n in (1, 2, 3):
        entries = sp.symbols(f"x0:{n*n}")
        matrix = [entries[n*i:n*(i+1)] for i in range(n)]
        boolean_sum = sum(kernel(matrix, b)
                          for b in product((0, 1), repeat=n))
        check_equal(boolean_sum, permanent(matrix), f"Ryser n={n}")


def check_quantifier_counterexamples():
    t, r, u, v = sp.symbols("t r u v")
    q = v + (u - 2*v) * (t - r) / (1 - 2*r)
    check_equal(q.subs(t, 0) + q.subs(t, 1), u, "generic endpoint sum")
    check_equal(q.subs(t, r), v, "generic challenged value")
    special = v + 2 * (u - 2*v) * (t - sp.Rational(1, 2))**2
    check_equal(special.subs(t, 0) + special.subs(t, 1), u,
                "exceptional endpoint sum")
    check_equal(special.subs(t, sp.Rational(1, 2)), v,
                "exceptional challenged value")
    # For I_2 and r_2=1 a single fixed q_2(1) cannot equal both values.
    check_equal(kernel([[1, 0], [0, 1]], [0, 1]), 0, "I2 prefix zero")
    check_equal(kernel([[1, 0], [0, 1]], [1, 1]), 1, "I2 prefix one")


def check_triangle_norm():
    q = sp.symbols("q")
    # Independently derive multiplication by xy in the quotient ring.
    x, y = sp.symbols("x y")
    basis = (sp.Integer(1), x, y, x*y)
    ideal = sp.groebner((x*x + q*y, y*y + q*x), x, y, order="grlex",
                        domain=sp.QQ.frac_field(q))
    columns = []
    for b in basis:
        remainder = ideal.reduce(x*y*b)[1]
        poly = sp.Poly(remainder, x, y)
        columns.append([poly.coeff_monomial(m) for m in basis])
    multiplication = sp.Matrix.hstack(*(sp.Matrix(c) for c in columns))
    check_equal((sp.eye(4) + q*multiplication).det(), (1 + q**3)**3,
                "single-triangle quotient norm")


def check_masking_and_matching():
    t, x, z = sp.symbols("t x z")
    resultant = 1 + x*t**3 + z*t**4
    for d in (0, 1, 4, 7):
        multiplier = sum((1-resultant)**j for j in range(d+1))
        check_equal(resultant*multiplier,
                    1-(1-resultant)**(d+1), f"jet mask d={d}")
        jet = sp.series(resultant*multiplier, t, 0, d+1).removeO()
        check_equal(jet, 1, f"masked jet d={d}")
    a, b, c, d, y = sp.symbols("a b c d y")
    matrix = [[a, b], [c, d]]
    term_norm = (y-a*d)*(y-b*c)
    check_equal(sp.Poly(term_norm, y).coeff_monomial(y),
                -permanent(matrix), "matching norm coefficient")
    check_equal(permanent([[1, 1], [1, -1]]), 0, "complex cancellation")
    check_equal(term_norm.subs({a: 1, b: 1, c: 1, d: 1, y: 2}), 1,
                "all-ones permanent graph absent from term incidence")


def check_hard_strategy_residual():
    t = sp.symbols("t")
    a, b, c, d = sp.symbols("a b c d")
    matrix = [[a, b], [c, d]]
    residual = t*(t-1)*sum(kernel(matrix, z)
                           for z in product((0, 1), repeat=2))
    check_equal(residual, t*(t-1)*permanent(matrix), "strategy residual")
    check_equal(residual.subs(t, 0) + residual.subs(t, 1), 0,
                "full Boolean sum vanishes")
    check_equal(residual.subs(t, 2)/2, permanent(matrix),
                "non-Boolean challenge recovers permanent")


if __name__ == "__main__":
    checks = (
        check_ryser,
        check_quantifier_counterexamples,
        check_triangle_norm,
        check_masking_and_matching,
        check_hard_strategy_residual,
    )
    for check in checks:
        check()
        print(f"PASS {check.__name__}")
    print("Exact obstruction checks passed; the target separation remains open.")
