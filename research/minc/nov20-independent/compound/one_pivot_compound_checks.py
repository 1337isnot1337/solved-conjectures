"""Exact one-pivot variant of the mixed compound action.

This is an identity checker, not an implementation of fast black-box
characteristic-polynomial or approximant-basis algorithms.
"""

from collections import defaultdict
from fractions import Fraction as F
from itertools import combinations
from math import comb
import random

from mixed_compound_checks import clean, direct_action, good_leading_pivots, shift


def one_pivot_good(a, k, poly):
    n = len(a)
    if k == 0:
        return poly.copy()
    if n == 1:
        return clean({e: a[0][0] * c for e, c in poly.items()})
    pivot = a[0][0]
    assert pivot
    upper = [a[0][j] / pivot for j in range(1, n)]
    lower = [a[i][0] / pivot for i in range(1, n)]
    schur = [[a[i][j] - a[i][0] * upper[j-1]
              for j in range(1, n)] for i in range(1, n)]
    capped = frozenset(range(1, n))
    current = poly.copy()
    for j, scalar in enumerate(upper, 1):
        current = shift(current, j, 0, scalar, capped)
    current = {e: c * pivot**e[0] for e, c in current.items()}
    groups = defaultdict(dict)
    for e, c in current.items():
        groups[e[0]][e[1:]] = c
    current = {}
    for left_degree, right_poly in groups.items():
        value = one_pivot_good(schur, k-left_degree, right_poly)
        for right, coefficient in value.items():
            current[(left_degree,) + right] = coefficient
    for j, scalar in enumerate(lower, 1):
        current = shift(current, 0, j, scalar, capped)
    return clean({e: c for e, c in current.items() if max(e) <= 1})


def one_pivot_action(matrix, k, poly):
    a = [[F(c) for c in row] for row in matrix]
    n = len(a)
    if k == 0 or good_leading_pivots(a):
        return one_pivot_good(a, k, poly)
    samples = []
    for t in range(1, n*(n+1)//2 + k + 2):
        shifted = [[a[i][j] + (t if i == j else 0) for j in range(n)]
                   for i in range(n)]
        if good_leading_pivots(shifted):
            samples.append((t, shifted))
        if len(samples) == k + 1:
            break
    assert len(samples) == k + 1
    out = defaultdict(F)
    for t, shifted in samples:
        weight = F(1)
        for u, _ in samples:
            if t != u:
                weight *= F(-u, t-u)
        for e, c in one_pivot_good(shifted, k, poly).items():
            out[e] += weight*c
    return clean(out)


def main():
    rng = random.Random(20261120)
    checked = 0
    for n in range(2, 7):
        matrices = [
            [[F(rng.randint(-2, 3) + (5*n if i == j else 0))
              for j in range(n)] for i in range(n)],
            [[F((i+1)*(j+1)) for j in range(n)] for i in range(n)],
            [[F(int((j-i) % n == 1)) for j in range(n)] for i in range(n)],
        ]
        for a in matrices:
            for k in range(n+1):
                poly = {
                    tuple(int(i in subset) for i in range(n)): F(rng.randint(-3, 3))
                    for subset in combinations(range(n), k)
                }
                poly = clean(poly)
                got = one_pivot_action(a, k, poly)
                expected = direct_action(a, k, poly)
                assert got == expected, (n, k, got, expected)
                checked += 1
    print(f"exact one-pivot actions checked: {checked}")
    print("n, one-pivot states, input/output dimension, full symmetric states:")
    for n in (4, 8, 12, 16, 20, 40):
        k = n//2
        states = sum(comb(n-1, j) for j in range(k+1))
        output = comb(n, k)
        assert states <= (k+1)*output
        print(n, states, output, comb(n+k-1, k))


if __name__ == "__main__":
    main()

