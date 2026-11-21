"""Exact check of an auxiliary moment-matrix obstruction, not Chollet."""

from fractions import Fraction as Q
from itertools import combinations


def per2(a, rows, cols):
    i, j = rows
    k, ell = cols
    return a[i][k] * a[j][ell] + a[i][ell] * a[j][k]


def main():
    n = 4
    t = Q(-1, n - 1)
    a = [[Q(1) if i == j else t for j in range(n)] for i in range(n)]
    b = [[v * v for v in row] for row in a]
    subsets = list(combinations(range(n), 2))
    mz = [[per2(a, s, u) ** 2 for u in subsets] for s in subsets]
    mg = [[per2(b, s, u) for u in subsets] for s in subsets]
    d = [[x - y for x, y in zip(row_z, row_g)]
         for row_z, row_g in zip(mz, mg)]
    for i, s in enumerate(subsets):
        for j, u in enumerate(subsets):
            overlap = len(set(s) & set(u))
            assert d[i][j] == 2 * t ** (4 - overlap)
    eigenvalue = Q(-n * (n - 3), (n - 1) ** 4)
    assert all(sum(row) == eigenvalue for row in d)
    moment_z = sum(map(sum, mz))
    moment_g = sum(map(sum, mg))
    assert moment_z == Q(80, 9)
    assert moment_g == Q(248, 27)
    assert moment_z - moment_g == Q(-8, 27)
    print("all-ones eigenvalue:", eigenvalue)
    print("product-Gaussian quadratic moment:", moment_z)
    print("Gaussian replacement quadratic moment:", moment_g)
    print("difference:", moment_z - moment_g)


if __name__ == "__main__":
    main()
