"""Exact arithmetic checks of the common-shift proof; only the standard library is needed."""
from fractions import Fraction as F
from itertools import product


def mul(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)] for row in a]


def add(a, b, factor=1):
    return [[x + factor * y for x, y in zip(r, s)] for r, s in zip(a, b)]


def scale(a, factor):
    return [[factor * x for x in row] for row in a]


def product_coefficient(a, b, t):
    s = 1 - t
    a2, b2 = mul(a, a), mul(b, b)
    return add(add(scale(a2, t * (t - 1) / 2), scale(mul(a, b), t * s)),
               scale(b2, s * (s - 1) / 2))


def check():
    tested = 0
    for u, v, w in product(range(-2, 3), repeat=3):
        a = [[u, v, 1], [v, w, -1], [1, -1, 2]]
        b = [[1, -2, w], [-2, v, u], [w, u, -1]]
        delta = add(a, b, -1)
        h = mul(delta, delta)
        for t in (F(1, 64), F(1, 5), F(1, 2), F(6, 7), F(63, 64)):
            combined = add(product_coefficient(a, b, t), product_coefficient(b, a, t))
            assert combined == scale(h, -t * (1 - t))
            tested += 1
        for vals in ((3, 2, 1), (2, 2, -1), (3, 0, 0), (2, 2, 2)):
            s = [[x if i == j else 0 for j in range(3)] for i, x in enumerate(vals)]
            k = [[F(h[i][j], x - y) if x != y else 0 for j, y in enumerate(vals)]
                 for i, x in enumerate(vals)]
            h0 = [[h[i][j] if x == y else 0 for j, y in enumerate(vals)]
                  for i, x in enumerate(vals)]
            assert add(mul(s, k), mul(k, s), -1) == add(h, h0, -1)
    return tested


if __name__ == "__main__":
    print(f"Verified {check()} quadratic coefficients and 500 spectral-block conjugations.")
