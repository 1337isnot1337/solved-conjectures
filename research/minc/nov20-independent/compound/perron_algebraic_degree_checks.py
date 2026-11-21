"""Exact diagnostics for the companion output-size obstruction.

These checks do not prove the all-order Galois or algebraic-degree claim.
The accompanying Markdown proof supplies those arguments.
"""

from itertools import combinations
from math import comb

import sympy as sp


def companion(n):
    a = [[0] * n for _ in range(n)]
    for i in range(n - 1):
        a[i][i + 1] = 1
    a[-1][0] = a[-1][1] = 1
    return a


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range((1 << n) - 1):
        row = mask.bit_count()
        if not dp[mask]:
            continue
        for col in range(n):
            if not mask & (1 << col) and a[row][col]:
                dp[mask | (1 << col)] += dp[mask] * a[row][col]
    return dp[-1]


def determinant(a):
    """Integer Bareiss elimination, independent of the matching DP."""
    a = [row[:] for row in a]
    n = len(a)
    previous = sign = 1
    for p in range(n - 1):
        pivot_row = next((r for r in range(p, n) if a[r][p]), None)
        if pivot_row is None:
            return 0
        if pivot_row != p:
            a[p], a[pivot_row] = a[pivot_row], a[p]
            sign = -sign
        pivot = a[p][p]
        for i in range(p + 1, n):
            for j in range(p + 1, n):
                numerator = pivot * a[i][j] - a[i][p] * a[p][j]
                assert numerator % previous == 0
                a[i][j] = numerator // previous
            a[i][p] = 0
        previous = pivot
    return sign * a[-1][-1]


def submatrix(a, rows, cols):
    return [[a[i][j] for j in cols] for i in rows]


def main():
    z = sp.Symbol("z")
    checked_entries = 0
    checked_charpolys = 0
    for n in range(2, 9):
        a = companion(n)
        assert sum(map(sum, a)) == n + 1
        assert sp.Matrix(a).charpoly(z).as_expr() == z**n - z - 1
        for k in range(1, n, 2):
            indices = list(combinations(range(n), k))
            p = []
            for rows in indices:
                outrow = []
                for cols in indices:
                    b = submatrix(a, rows, cols)
                    per = permanent(b)
                    det = determinant(b)
                    assert per in (0, 1)
                    assert per == det, (n, k, rows, cols, per, det)
                    outrow.append(per)
                    checked_entries += 1
                p.append(outrow)
            if n <= 6:
                chi = sp.Poly(sp.Matrix(p).charpoly(z).as_expr(), z)
                assert chi.degree() == comb(n, k)
                assert chi.is_irreducible
                assert chi.eval(0) != 0
                checked_charpolys += 1
    for n in range(2, 102, 4):
        k = n // 2
        assert k % 2 == 1
        assert comb(n, k) * (n + 1) >= 2**n
    print(f"companion orientation: all orders 2 through 8 passed")
    print(f"odd-degree permanent/determinant identity: {checked_entries} entries passed")
    print(f"exact characteristic-polynomial irreducibility: {checked_charpolys} diagnostics passed")
    print("central binomial lower bound: exact diagnostic comparisons passed")
    print("The all-order argument is in perron_algebraic_degree.md.")


if __name__ == "__main__":
    main()
