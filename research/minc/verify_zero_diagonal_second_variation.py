"""Exact tests of the second variation on the zero-diagonal doubly stochastic face.

Compares the full quadratic permanent-minor expansion with the derangement
Hessian formula for differences of two derangement permutation matrices.
No external packages or floating-point arithmetic are used.
"""
from fractions import Fraction
from itertools import permutations
from math import factorial, comb, prod
import random


def permanent(a):
    n = len(a)
    return sum(prod(a[i][p[i]] for i in range(n))
               for p in permutations(range(n)))


def avoided_fixed_points(n, j):
    return sum((-1) ** k * comb(j, k) * factorial(n - k)
               for k in range(j + 1))


def quadratic_coefficient_by_minors(b):
    n = len(b)
    u = [[Fraction(i != j, n - 1) for j in range(n)]
         for i in range(n)]
    total = Fraction(0)
    for i in range(n):
        for k in range(i + 1, n):
            for j in range(n):
                for ell in range(j + 1, n):
                    rows = [v for v in range(n) if v not in (i, k)]
                    cols = [v for v in range(n) if v not in (j, ell)]
                    minor = permanent([[u[a][c] for c in cols]
                                       for a in rows])
                    total += (b[i][j] * b[k][ell] +
                              b[i][ell] * b[k][j]) * minor
    return total


def quadratic_coefficient_formula(b):
    n = len(b)
    squared_frobenius = sum(v * v for row in b for v in row)
    trace_square = sum(b[i][j] * b[j][i]
                       for i in range(n) for j in range(n))
    w0 = avoided_fixed_points(n - 2, n - 4)
    d = avoided_fixed_points(n - 4, n - 4)
    return Fraction(w0 * squared_frobenius + d * trace_square,
                    2 * (n - 1) ** (n - 2))


def derangement(n, rng):
    while True:
        p = list(range(n))
        rng.shuffle(p)
        if all(i != p[i] for i in range(n)):
            return p


def main():
    rng = random.Random(198606)
    for n in range(4, 8):
        for test_index in range(6):
            p = derangement(n, rng)
            q = derangement(n, rng)
            b = [[int(p[i] == j) - int(q[i] == j)
                  for j in range(n)] for i in range(n)]
            assert all(b[i][i] == 0 for i in range(n))
            assert all(sum(row) == 0 for row in b)
            assert all(sum(b[i][j] for i in range(n)) == 0
                       for j in range(n))
            got = quadratic_coefficient_by_minors(b)
            expected = quadratic_coefficient_formula(b)
            assert got == expected, (n, test_index, got, expected)
        print(f"n={n}: 6 exact minor/formula checks passed")


if __name__ == "__main__":
    main()
