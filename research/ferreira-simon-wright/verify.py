#!/usr/bin/env python3
"""Exact algebra checks for the analytic Wright-conjecture disproof.

This uses rational polynomials in a, b, x. It neither approximates Gamma
nor replaces the uniform-convergence proof with numerical examples.
Run: python3 research/ferreira-simon-wright/verify.py
"""

from fractions import Fraction as F


def clean(p):
    return {k: F(v) for k, v in p.items() if v}


def const(c):
    return clean({(0, 0, 0): c})


def add(p, q):
    out = dict(p)
    for key, value in q.items():
        out[key] = out.get(key, F(0)) + value
    return clean(out)


def scale(p, c):
    return clean({key: c * value for key, value in p.items()})


def sub(p, q):
    return add(p, scale(q, -1))


def mul(p, q):
    out = {}
    for u, v in p.items():
        for w, z in q.items():
            key = tuple(ui + wi for ui, wi in zip(u, w))
            out[key] = out.get(key, F(0)) + v * z
    return clean(out)


def dx(p):
    return clean({(a, b, n - 1): n * v
                  for (a, b, n), v in p.items() if n})


def substitute_x(p, x):
    out = {}
    for (a, b, n), value in p.items():
        key = (a, b, 0)
        out[key] = out.get(key, F(0)) + value * x ** n
    return clean(out)


def evaluate(p, a, b, x):
    return sum((v * a ** i * b ** j * x ** n
                for (i, j, n), v in p.items()), F(0))


one = const(1)
a = {(1, 0, 0): F(1)}
b = {(0, 1, 0): F(1)}
x = {(0, 0, 1): F(1)}
q = sub(one, x)

# Differentiate h=P/q^2 by the quotient rule, preserving exact polynomials.
P = add(b, mul(sub(a, b), x))
R = add(mul(dx(P), q), scale(P, 2))  # h' = R/q^3
S = add(mul(dx(R), q), scale(R, 3))  # h'' = S/q^4
curvature_numerator = sub(mul(R, R), mul(P, S))

a2, b2, ab = mul(a, a), mul(b, b), mul(a, b)
expected = sub(sub(a2, scale(ab, 2)), b2)
expected = sub(expected, scale(mul(sub(a2, b2), x), 2))
expected = sub(expected, mul(mul(sub(a, b), sub(a, b)), mul(x, x)))
assert curvature_numerator == expected

# These identities hold for arbitrary a,b, not just selected parameters.
at_zero = sub(sub(a2, scale(ab, 2)), b2)
at_half = scale(add(add(a2, scale(ab, 6)), b2), -16)
assert substitute_x(curvature_numerator, F(0)) == at_zero
assert scale(substitute_x(curvature_numerator, F(1, 2)), 64) == at_half

# Exact derivative values used in the two stated families.
for aa, bb, xx, values, psi in [
    (F(1), F(0), F(1, 2), (F(2), F(12), F(80)), F(-16)),
    (F(3), F(1), F(0), (F(1), F(4), F(14)), F(2)),
    (F(3), F(1), F(1, 2), (F(8), F(40), F(256)), F(-448)),
]:
    observed = tuple(evaluate(poly, aa, bb, xx) / (1 - xx) ** power
                     for poly, power in [(P, 2), (R, 3), (S, 4)])
    assert observed == values
    assert observed[1] ** 2 - observed[0] * observed[2] == psi

print("PASS: exact general curvature identity, both parameter-polynomial "
      "specializations, and all three derivative/sign evaluations")
print("Analytic scope: C^2 convergence and the counterexample intervals "
      "are established in the written proof, not by this script.")
