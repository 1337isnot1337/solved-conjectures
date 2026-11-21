#!/usr/bin/env python3
"""Exact rational checks for the star-core Hwang radial formulas.

These are formula diagnostics, not a proof of the all-order theorem.
"""
from fractions import Fraction as Q
from random import Random


def add(a, b):
    out = [Q(0)] * max(len(a), len(b))
    for i, x in enumerate(a):
        out[i] += x
    for i, x in enumerate(b):
        out[i] += x
    return out


def mul(a, b):
    out = [Q(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def deriv(a):
    return [(i + 1) * a[i + 1] for i in range(len(a) - 1)]


def evaluate(a, t):
    return sum((x * t**i for i, x in enumerate(a)), Q(0))


def direct_star_polynomial(b):
    s = sum(b, Q(0))
    total = [Q(1), -s]
    for a in b:
        total = mul(total, [Q(1), -a])
    for i, a in enumerate(b):
        term = [Q(0), a]
        for j, c in enumerate(b):
            if i != j:
                term = mul(term, [Q(1), -c])
        total = add(total, term)
    return total


def check_one(b, t):
    s = sum(b, Q(0))
    assert Q(0) < t < 1 and Q(0) < s <= 1
    x = [t * v for v in b]
    p = Q(1)
    for xi in x:
        p *= 1 - xi
    y = [xi / (1 - xi) for xi in x]
    u = sum((xi * yi for xi, yi in zip(x, y)), Q(0))
    qq = sum((yi * yi for yi in y), Q(0))
    poly = direct_star_polynomial(b)
    z = evaluate(poly, t)
    assert z == p * (1 + u)
    ez_d1 = evaluate(deriv(poly), t) + s * z
    assert t * ez_d1 == p * (qq - u * u)
    assert qq - u * u >= qq * (1 - sum((xi * xi for xi in x), Q(0))) > 0
    ez_d2_origin = evaluate(deriv(deriv(poly)), Q(0)) + 2 * s * evaluate(deriv(poly), Q(0)) + s * s
    assert ez_d2_origin == sum((a * a for a in b), Q(0))


def run():
    rng = Random(20261120)
    total = 0
    for m in range(1, 11):
        for _ in range(24):
            raw = [rng.randrange(0, 12) for _ in range(m)]
            if not any(raw):
                raw[0] = 1
            divisor = sum(raw) + rng.randrange(0, 11)
            b = [Q(x, divisor) for x in raw]
            t = Q(rng.randrange(1, 23), 24)
            check_one(b, t)
            total += 1
    b, c = Q(1, 10), Q(4, 5)
    deriv_b = b * (1 + b - c - b * c - c * c)
    assert b + c <= 1 and deriv_b == Q(-21, 500)
    print(f"passed {total} exact rational radial identities and one coordinate-derivative witness")


if __name__ == "__main__":
    run()
