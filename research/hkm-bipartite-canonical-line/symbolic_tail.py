#!/usr/bin/env python3
"""Verify the Jacobi tail for every b >= a with 1 <= a <= the input.

Usage: python3 symbolic_tail.py 14
Requires SymPy; all coefficients are exact rational numbers.
"""
from math import comb, factorial
from sys import argv

from sympy import QQ
from sympy.polys.rings import ring

R, z = ring("z", QQ)


def add(p, q):
    """Addition in R[x], with ascending x-coefficient lists."""
    result = p + [R.zero] * max(0, len(q) - len(p))
    for i, value in enumerate(q):
        result[i] += value
    while result and not result[-1]:
        result.pop()
    return result


def scale(p, c):
    return [c * value for value in p] if c else []


def times_x(p):
    return [R.zero] + p if p else []


def universal_tail(a):
    b = z + a
    # (A_k,B_k,D_k) represents q_(b+1+k) =
    # (A_k q_(b+1) + B_k q_b) / D_k.
    pairs = {0: ([R.one], [], R.one), -1: ([], [R.one], R.one)}
    for k in range(1, a + 1):
        af, bf, d1 = pairs[k - 1]
        al, bl, d2 = pairs[k - 2]
        c = b + k
        factor = -c * d1.exquo(d2)
        u = add(times_x(af), scale(al, factor))
        v = add(times_x(bf), scale(bl, factor))
        pairs[k] = (u, v, d1 * (c + 1))

    for k in range(-2, -a - 1, -1):
        af, bf, d1 = pairs[k + 1]
        al, bl, d2 = pairs[k + 2]
        c = b + k + 2
        factor = -(c + 1) * d1.exquo(d2)
        u = add(times_x(af), scale(al, factor))
        v = add(times_x(bf), scale(bl, factor))
        pairs[k] = (u, v, d1 * c)

    denominator = pairs[-a][2] * pairs[a][2]
    weights = []
    for i in range(a + 1):
        weight = R.one
        for j in range(i):
            weight *= b - j
        weights.append(weight * QQ(comb(2*i, i)*comb(a, i)*4**(a-i), factorial(i)))

    p, q = [], []
    for j in range(a + 1):
        h = sum((weights[i] * comb(i, j) for i in range(j, a + 1)), R.zero)
        af, bf, d1 = pairs[a - 2*j]
        w = h * denominator.exquo(d1)
        p = add(p, scale(af, w))
        q = add(q, scale(bf, -w))
    return p, q


def positive_on_ray(p):
    return p(0) > 0 and all(x >= 0 for x in p.values())


def primitive(p):
    if not p:
        return p
    g = R.zero
    for x in p:
        g = g.gcd(x)
        if g == R.one:
            break
    if g != R.one:
        assert positive_on_ray(g), g
        p = [x.exquo(g) for x in p]
    return p


def negative_remainder(p, q):
    assert positive_on_ray(q[-1])
    while p and len(p) >= len(q):
        i = len(p) - len(q)
        p = primitive(add(scale(p, q[-1]), [R.zero] * i + scale(q, -p[-1])))
    return scale(p, -1)


def certify(a):
    p, q = map(primitive, universal_tail(a))
    assert len(p) == a + 1 and len(q) == a
    assert positive_on_ray(p[-1])
    signs = []
    while q:
        assert len(q) == len(p) - 1
        signs.append(p[-1].degree())
        p, q = q, negative_remainder(p, q)
    assert len(p) == 1 and positive_on_ray(p[-1])
    return signs + [p[-1].degree()]


if __name__ == "__main__":
    max_a = int(argv[1]) if len(argv) > 1 else 14
    for a in range(1, max_a + 1):
        print(a, certify(a), flush=True)
