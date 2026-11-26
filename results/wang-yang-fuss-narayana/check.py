"""Exact finite checks for the formulas in proof.md, using the published entries."""

from fractions import Fraction
from itertools import combinations
from math import comb, factorial, prod


def entry(n, k, m, s):
    if k < 0 or k > n:
        return 0
    divisor = n + 1 if s else 1
    value, remainder = divmod(comb(n + s, k) * comb(m * (n + s), n - k), divisor)
    assert remainder == 0
    return value


def determinant(matrix):
    """Fraction-free elimination with row pivoting."""
    a = [row[:] for row in matrix]
    sign = previous = 1
    for k in range(len(a) - 1):
        if not a[k][k]:
            pivot = next((i for i in range(k + 1, len(a)) if a[i][k]), None)
            if pivot is None:
                return 0
            a[k], a[pivot] = a[pivot], a[k]
            sign *= -1
        for i in range(k + 1, len(a)):
            for j in range(k + 1, len(a)):
                numerator = a[i][j] * a[k][k] - a[i][k] * a[k][j]
                a[i][j], remainder = divmod(numerator, previous)
                assert remainder == 0
        previous = a[k][k]
    return sign * a[-1][-1]


def check_minors(matrix, square):
    n = len(matrix)
    count = 0
    for size in range(1, n + 1):
        subsets = list(combinations(range(n), size))
        for rows in subsets:
            for columns in subsets:
                value = determinant([[matrix[i][j] for j in columns] for i in rows])
                assert (value > 0 if square else value >= 0), (rows, columns, value)
                if not square and any(i < j for i, j in zip(rows, columns)):
                    assert value == 0
                count += 1
    return count


def check_products(n, k, m, s):
    square = entry(n + k, k, m, s)
    square_next = entry(n + k + 1, k + 1, m, s)
    square_ratio = Fraction(n + k + 1, k + 1) * prod(
        Fraction(m * (n + k + s) + h, (m - 1) * n + m * (k + s) + h)
        for h in range(1, m + 1)
    )
    assert square * square_ratio == square_next

    ordinary = prod(
        Fraction((n - j + s) * (n - j), (m - 1) * n + m * s + j + 1)
        for j in range(k)
    )
    assert ordinary * entry(n, 0, m, s) == factorial(k) * entry(n, k, m, s)

    reversed_product = prod((n - j) * (m * (n + s) - j) for j in range(k))
    reversed_scale = factorial(k) ** 2 * (k + 1 if s else 1)
    assert reversed_product == reversed_scale * entry(n, n - k, m, s)


if __name__ == "__main__":
    total = 0
    identities = 0
    for m in (2, 3, 5, 11):
        for s in (0, 1):
            for n in range(11):
                for k in range(12):
                    check_products(n, k, m, s)
                    identities += 3
            for shape in ("ordinary", "reversed", "square"):
                if shape == "ordinary":
                    matrix = [[entry(n, k, m, s) for k in range(7)] for n in range(7)]
                elif shape == "reversed":
                    matrix = [[entry(n, n - k, m, s) for k in range(7)] for n in range(7)]
                else:
                    matrix = [[entry(n + k, k, m, s) for k in range(7)] for n in range(7)]
                total += check_minors(matrix, shape == "square")
    print(f"{identities} product identities and {total} exact minors passed.")
