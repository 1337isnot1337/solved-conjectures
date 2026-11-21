"""Exact checks of the Brualdi stationary formula and supported affine projection."""

from fractions import Fraction as F

from sympy import Matrix, Rational, zeros

from verify_minc_integrality_identities import minor, permanent


def brualdi_check(n):
    m = n - 1
    d = [1, 0]
    for j in range(2, m + 1):
        d.append((j - 1) * (d[-1] + d[-2]))
    c = 1 + F(d[m - 1], d[m])
    y = 1 / (1 + (m - 1) * c)
    z = c * y
    x = 1 - m * y
    a = [[x] + [y] * m] + [[y] + [z if i != j else F(0) for j in range(m)]
                             for i in range(m)]
    p = permanent(a)
    assert p == d[m] * z**m
    checks = 0
    for i in range(n):
        for j in range(n):
            if a[i][j]:
                assert permanent(minor(a, {i}, {j})) == p
                checks += 1
    return checks


def affine_check(n):
    support = Matrix(n, n, lambda i, j: int(i != j or i == 0))
    row_degrees = list(support * Matrix.ones(n, 1))
    col_degrees = list(support.T * Matrix.ones(n, 1))
    rmat = Matrix(n, n, lambda i, j: support[i, j] / row_degrees[i])
    tmat = Matrix(n, n, lambda j, i: support[i, j] / col_degrees[j])
    trial = Matrix(n, n, lambda i, j: support[i, j] * Rational((i+2)**2 + 3*(j+1)*i, n+1))
    r = Matrix([(sum(trial.row(i)) - 1) / row_degrees[i] for i in range(n)])
    c = Matrix([(sum(trial.col(j)) - 1) / col_degrees[j] for j in range(n)])
    flat = Matrix.ones(n, 1) * Matrix([d/sum(col_degrees) for d in col_degrees]).T
    q = (Matrix.eye(n) - tmat*rmat + flat).inv() * (c - tmat*r)
    p = r - rmat*q
    projected = Matrix(n, n, lambda i, j: trial[i, j] - support[i, j] * (p[i]+q[j]))
    assert projected * Matrix.ones(n, 1) == Matrix.ones(n, 1)
    assert projected.T * Matrix.ones(n, 1) == Matrix.ones(n, 1)
    assert flat*q == zeros(n, 1)


if __name__ == "__main__":
    checks = sum(brualdi_check(n) for n in range(4, 10))
    for n in range(3, 11):
        affine_check(n)
    print(f"{checks} allowed cofactors; 8 exact affine-margin projections")
