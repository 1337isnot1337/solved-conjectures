"""Exact checks for the weak Gyires block-closure research note.

These are finite cross-checks; the all-order statement has its own proof.
"""
from fractions import Fraction
from itertools import permutations
from math import factorial, prod


def beta(n):
    return Fraction(factorial(n), n ** n)


def permanent(a):
    n = len(a)
    return sum(prod(a[i][p[i]] for i in range(n))
               for p in permutations(range(n)))


def multiply(a, b):
    n = len(a)
    return [[sum(a[i][k] * b[k][j] for k in range(n))
             for j in range(n)] for i in range(n)]


def main():
    assert beta(5) ** 2 / beta(10) == Fraction(256, 63)
    checks = 0
    for r in range(5, 25):
        for s in range(5, 25):
            assert beta(r) * beta(s) > 4 * beta(r + s)
            checks += 1
    print(f"{checks} exact normalization inequalities passed")

    # Boundary of the sufficient threshold, not of Gyires itself.
    assert beta(3) * beta(12) < 4 * beta(15)
    assert beta(3) * beta(13) > 4 * beta(16)
    assert beta(4) * beta(6) < 4 * beta(10)
    assert beta(4) * beta(7) > 4 * beta(11)

    a = [[Fraction(x, 2) for x in row] for row in (
        (1, 0, 1, 0),
        (0, 0, 1, 1),
        (1, 1, 0, 0),
        (0, 1, 0, 1),
    )]
    b = [row[:2] + [row[3], row[2]] for row in a]
    assert permanent(a) == permanent(b) == Fraction(1, 8)
    assert permanent(multiply(a, a)) == Fraction(9, 64)
    assert permanent(multiply(b, b)) == Fraction(7, 64)
    print("Exact independent-column-permutation caveat checked")


if __name__ == "__main__":
    main()
