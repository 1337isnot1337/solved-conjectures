"""Exact obstruction to entropy concavity on the zero-diagonal face.

This is a diagnostic of a proof method, not a counterexample to Minc C44.
Only the Python standard library is needed.
"""

from fractions import Fraction as F
from itertools import permutations
from math import prod


def verify():
    B = ((0, 6, 1, 1), (7, 0, 6, 8), (3, 2, 0, 4), (3, 2, 9, 0))
    edges = [(i, j) for i in range(4) for j in range(4) if i != j]
    perms = [p for p in permutations(range(4)) if all(p[i] != i for i in range(4))]
    weights = [prod(B[i][p[i]] for i in range(4)) for p in perms]
    Z = sum(weights)
    X = [[int(p[i] == j) for i, j in edges] for p in perms]
    P = [sum(F(w * x[e], Z) for w, x in zip(weights, X)) for e in range(12)]
    C = [
        [
            sum(F(w * x[e] * x[f], Z) for w, x in zip(weights, X)) - P[e] * P[f]
            for f in range(12)
        ]
        for e in range(12)
    ]
    h = [F(int(e == (0, 2)) - int(e == (3, 1))) for e in edges]
    delta = [sum(c * v for c, v in zip(row, h)) for row in C]
    curvature = sum(a * b for a, b in zip(h, delta)) - sum(d * d / p for d, p in zip(delta, P))
    expected = F(175156783137, 19313877896225)
    assert Z == 3590
    assert curvature == expected and curvature > 0
    for i in range(4):
        assert sum(P[e] for e, ij in enumerate(edges) if ij[0] == i) == 1
        assert sum(P[e] for e, ij in enumerate(edges) if ij[1] == i) == 1
        assert sum(delta[e] for e, ij in enumerate(edges) if ij[0] == i) == 0
        assert sum(delta[e] for e, ij in enumerate(edges) if ij[1] == i) == 0
    print("per B:", Z)
    print("positive entropy curvature:", curvature)
    print("all marginal and tangent constraints verified exactly")


if __name__ == "__main__":
    verify()
