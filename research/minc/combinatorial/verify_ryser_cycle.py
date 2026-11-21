"""Exact normalization checks for the structural formulas, not a case sweep."""

from fractions import Fraction
from itertools import combinations, permutations
from math import comb


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        dp[mask] = sum(
            a[i][j] * dp[mask ^ (1 << j)]
            for j in range(n) if mask & (1 << j)
        )
    return dp[-1]


def multiply(a, b):
    return [
        [sum(a[i][t] * b[t][j] for t in range(len(b)))
         for j in range(len(b[0]))]
        for i in range(len(a))
    ]


def trace(a):
    return sum(a[i][i] for i in range(len(a)))


def gram(a):
    return multiply(a, list(map(list, zip(*a))))


def six_cycles(a):
    n = len(a)
    total = 0
    for i, j, k in combinations(range(n), 3):
        for cols in combinations(range(n), 3):
            for x, y, z in permutations(cols):
                total += (
                    a[i][x] * a[j][x] * a[j][y]
                    * a[k][y] * a[k][z] * a[i][z]
                )
    return total


def check_six_cycle_trace(a):
    n, k = len(a), sum(a[0])
    assert all(sum(row) == k for row in a)
    assert all(sum(col) == k for col in zip(*a))
    m = gram(a)
    m2 = multiply(m, m)
    m3 = multiply(m2, m)
    q = k - 1
    rhs = (
        trace(m3) - 6 * q * trace(m2)
        + 9 * q**2 * n * k - 2 * n * q**3 + n * (k - 2)
    )
    assert rhs == 6 * six_cycles(a)


def loop_sum(a):
    n, k = len(a), sum(a[0])
    edges = [(i, n+j) for i in range(n) for j in range(n) if a[i][j]]
    total = Fraction(0)
    negative_terms = 0
    for mask in range(1 << len(edges)):
        degrees = [0] * (2*n)
        for t, (i, j) in enumerate(edges):
            if mask & (1 << t):
                degrees[i] += 1
                degrees[j] += 1
        if 1 in degrees:
            continue
        numerator = 1
        for degree in degrees:
            if degree:
                numerator *= 1 - degree
        negative_terms += numerator < 0
        total += Fraction(numerator, (k-1)**mask.bit_count())
    return total, negative_terms


def main():
    fano = [[int((j-i) % 7 in {0, 1, 3}) for j in range(7)]
            for i in range(7)]
    switched = [row[:] for row in fano]
    switch = next(
        (i, j, x, y)
        for i, j in combinations(range(7), 2)
        for x, y in combinations(range(7), 2)
        if [fano[i][x], fano[i][y], fano[j][x], fano[j][y]]
        in ([1, 0, 0, 1], [0, 1, 1, 0])
    )
    i, j, x, y = switch
    for r in (i, j):
        for c in (x, y):
            switched[r][c] = 1 - switched[r][c]

    for a in (fano, switched):
        check_six_cycle_trace(a)
        m = gram(a)
        e = sum(Fraction((m[i][j] - 1)**2, 2)
                for i, j in combinations(range(7), 2))
        c4 = sum(comb(m[i][j], 2)
                 for i, j in combinations(range(7), 2))
        assert c4 == e
        deviation = [[m[i][j] - (3 if i == j else 1)
                      for j in range(7)] for i in range(7)]
        deviation3 = multiply(multiply(deviation, deviation), deviation)
        assert six_cycles(a) - six_cycles(fano) == (
            -4 * e + Fraction(trace(deviation3), 6)
        )

    for n in (3, 4):
        cycle = [[int(j in {i, (i+1) % n}) for j in range(n)]
                 for i in range(n)]
        check_six_cycle_trace(cycle)

    complete = [[1] * 3 for _ in range(3)]
    check_six_cycle_trace(complete)
    value, negatives = loop_sum(complete)
    bethe = Fraction(4, 3)**3
    assert bethe * value == permanent(complete) == 6
    assert value == Fraction(81, 32)
    assert negatives > 0
    assert Fraction((-2)**2 * (-1)**3, 2**6) == Fraction(-1, 16)

    print("Four-cycle and six-cycle identities: exact checks passed.")
    print("K3,3 loop sum = 81/32; Bethe factor = 64/27; permanent = 6.")
    print("Negative generalized-loop terms are present.")
    print("These checks do not resolve Ryser's design conjecture.")


if __name__ == "__main__":
    main()
