"""Exact identities for gyires_boundary_minimum.md; no numerical search."""

from itertools import permutations

import sympy as sp


def permanent(matrix):
    n = matrix.rows
    assert matrix.cols == n
    return sp.expand(
        sum(sp.prod(matrix[i, sigma[i]] for i in range(n))
            for sigma in permutations(range(n)))
    )


def main():
    U = (sp.ones(3) - sp.eye(3)) / 2
    K = sp.Matrix([[0, 1, -1], [-1, 0, 1], [1, -1, 0]])
    u, t = sp.symbols("u t", real=True)
    A = U + u * K
    c = permanent(A)
    N = permanent(A * A.T)
    assert c == sp.Rational(1, 4) + 3 * u**2
    assert N == sp.Rational(1, 4) + sp.Rational(3, 4) * u**2 + 6 * u**4 + 12 * u**6
    assert sp.expand(c**2 - N / 4) == sp.expand(3 * u**2 * (7 + 40 * u**2 - 16 * u**4) / 16)
    assert sp.diff(c**2 / N, u, 2).subs(u, 0) == sp.Rational(21, 2)

    entries = sp.symbols("a0:9")
    M = sp.Matrix(3, 3, entries)
    p = permanent(M)
    g = permanent(M * M.T)
    at_U = {entries[3 * i + j]: U[i, j] for i in range(3) for j in range(3)}
    p0, g0 = p.subs(at_U), g.subs(at_U)
    assert p0 == g0 == sp.Rational(1, 4)
    gradient = sp.Matrix(3, 3, [
        sp.simplify(2 * p0 * sp.diff(p, a).subs(at_U) / g0
                    - p0**2 * sp.diff(g, a).subs(at_U) / g0**2)
        for a in entries
    ])
    assert gradient == sp.eye(3) / 8

    d = sp.symbols("d1:4", nonnegative=True)
    Z = sp.diag(*d)
    for i in range(3):
        for j in range(3):
            if i != j:
                k = 3 - i - j
                Z[i, j] = (d[k] - d[i] - d[j]) / 2
    assert Z * sp.ones(3, 1) == sp.zeros(3, 1)
    assert sp.ones(1, 3) * Z == sp.zeros(1, 3)

    B = sp.ones(3) / 3 + t * (U - sp.ones(3) / 3)
    b = permanent(B)
    b_gram = permanent(B * B.T)
    d3 = sp.Rational(2, 9)
    assert sp.expand(b / d3) == 1 + 3 * t**2 / 8 - t**3 / 4
    assert sp.expand(b_gram / d3) == 1 + 3 * t**4 / 32 + t**6 / 32
    assert sp.diff(b**2 / b_gram, t).subs(t, 1) == -sp.Rational(1, 8)
    print("All exact Gyires boundary identities verified.")


if __name__ == "__main__":
    main()
