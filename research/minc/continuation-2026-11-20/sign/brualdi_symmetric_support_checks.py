"""Exact certificates accompanying brualdi_symmetric_support.md.

These checks verify the displayed obstruction and identities, not the general
theorems. The all-order arguments are in the Markdown note.
"""

from fractions import Fraction
from math import factorial


def permanent(a):
    n = len(a)
    sums = [0] * (1 << n)
    sums[0] = 1
    for mask in range(1, 1 << n):
        row = mask.bit_count() - 1
        sums[mask] = sum(
            a[row][j] * sums[mask ^ (1 << j)]
            for j in range(n)
            if mask & (1 << j)
        )
    return sums[-1]


def minor(a, row, column):
    return [
        [a[i][j] for j in range(len(a)) if j != column]
        for i in range(len(a))
        if i != row
    ]


def maximum_zero_rectangle_sum(a):
    """Return max |R|+|C| over nonempty all-zero rectangles."""
    n = len(a)
    best = 0
    for mask in range(1, 1 << n):
        common_zeros = [
            j for j in range(n)
            if all(not a[i][j] for i in range(n) if mask & (1 << i))
        ]
        if common_zeros:
            best = max(best, mask.bit_count() + len(common_zeros))
    return best


def g(d):
    return Fraction(d - 1, d) ** (d - 1) if d > 1 else Fraction(1)


def constrained_row_attainer(n, d):
    first = [Fraction(1, d) if j < d else 0 for j in range(n)]
    rest = [
        Fraction(d - 1, d * (n - 1)) if j < d else Fraction(1, n - 1)
        for j in range(n)
    ]
    return [first] + [rest[:] for _ in range(n - 1)]


def derangement(n):
    return sum((-1) ** k * factorial(n) // factorial(k) for k in range(n + 1))


def check_one_row_identities():
    for n in range(2, 9):
        for d in range(1, n + 1):
            a = constrained_row_attainer(n, d)
            assert all(sum(row) == 1 for row in a)
            assert all(sum(a[i][j] for i in range(n)) == 1 for j in range(n))
            assert permanent(a) == Fraction(factorial(n - 1), (n - 1) ** (n - 1)) * g(d)
    for n in range(4, 81):
        low = Fraction(factorial(n - 1), (n - 1) ** (n - 1)) * g(n // 2)
        comparison = Fraction(derangement(n), (n - 1) ** n)
        assert low == comparison if n == 4 else low > comparison


def check_c8_obstruction():
    n = 8
    support = [
        [int(not (i == j < 7 or 0 <= i < j < 5)) for j in range(n)]
        for i in range(n)
    ]
    assert maximum_zero_rectangle_sum(support) == 6
    assert all(support[7]) and all(row[7] for row in support)
    # Extra zero arcs all run from a smaller to a larger index, hence a DAG.
    assert all(i < j for i in range(7) for j in range(7) if i != j and not support[i][j])
    count = permanent(support)
    assert count == 1331
    numerators = [
        [support[i][j] * permanent(minor(support, i, j)) for j in range(n)]
        for i in range(n)
    ]
    expected = [
        [0, 0, 0, 0, 0, 454, 454, 423],
        [423, 0, 0, 0, 0, 308, 308, 292],
        [292, 423, 0, 0, 0, 208, 208, 200],
        [200, 292, 423, 0, 0, 140, 140, 136],
        [136, 200, 292, 423, 0, 94, 94, 92],
        [94, 140, 208, 308, 454, 0, 64, 63],
        [94, 140, 208, 308, 454, 64, 0, 63],
        [92, 136, 200, 292, 423, 63, 63, 62],
    ]
    assert numerators == expected
    assert all(sum(row) == count for row in numerators)
    assert all(sum(numerators[i][j] for i in range(n)) == count for j in range(n))
    assert all(bool(numerators[i][j]) == bool(support[i][j]) for i in range(n) for j in range(n))
    symmetric_support = [
        [int(bool(support[i][j] * support[j][i])) for j in range(n)]
        for i in range(n)
    ]
    assert all(not symmetric_support[i][j] for i in range(5) for j in range(5))
    assert {j for i in range(5) for j in range(n) if symmetric_support[i][j]} == {5, 6, 7}
    assert permanent(symmetric_support) == 0
    assert sum(support[0]) == 3  # Violates the strict-majority conclusion.


def check_scaling_increase():
    a = [[Fraction(x, 17) for x in row] for row in [[0, 16, 1], [9, 0, 8], [8, 1, 8]]]
    b = [[Fraction(x, 5) for x in row] for row in [[0, 4, 1], [4, 0, 1], [1, 1, 3]]]
    squared_scales = [Fraction(17, 15), Fraction(17, 15), Fraction(51, 40)]
    for matrix in [a, b]:
        assert all(sum(row) == 1 for row in matrix)
        assert all(sum(matrix[i][j] for i in range(3)) == 1 for j in range(3))
    for i in range(3):
        for j in range(3):
            assert b[i][j] ** 2 == squared_scales[i] * squared_scales[j] * a[i][j] * a[j][i]
    assert permanent(a) == Fraction(2185, 4913)
    assert permanent(b) == Fraction(56, 125)
    assert permanent(b) - permanent(a) == Fraction(2003, 614125)


if __name__ == "__main__":
    check_one_row_identities()
    check_c8_obstruction()
    check_scaling_increase()
    print("Exact one-row formulas, parity comparisons, C8 obstruction, and scaling increase checked.")
