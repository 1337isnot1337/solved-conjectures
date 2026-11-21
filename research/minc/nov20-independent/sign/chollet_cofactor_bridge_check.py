"""Exact diagnostics for the unproved averaged cofactor lower bound.

This script does not establish an all-order inequality.  It checks a
failed row-wise strengthening, a signed permutation correlation, and
exact one-variable certificates for two published permanent-on-top
examples.  Gaussian integers and fractions avoid numerical tolerance.
"""

from fractions import Fraction
from itertools import permutations
from math import comb


def add(x, y):
    return x[0] + y[0], x[1] + y[1]


def multiply(x, y):
    return x[0] * y[0] - x[1] * y[1], x[0] * y[1] + x[1] * y[0]


def conjugate(x):
    return x[0], -x[1]


def norm_squared(x):
    return x[0] ** 2 + x[1] ** 2


def gram(vectors):
    output = []
    for u in vectors:
        row = []
        for v in vectors:
            value = (0, 0)
            for x, y in zip(u, v):
                value = add(value, multiply(conjugate(x), y))
            row.append(value)
        output.append(row)
    return output


def permutation_products(a):
    products = {}
    for p in permutations(range(len(a))):
        value = (1, 0)
        for i, j in enumerate(p):
            value = multiply(value, a[i][j])
        products[p] = value
    return products


def permanent(a):
    value = (0, 0)
    for term in permutation_products(a).values():
        value = add(value, term)
    return value


def minor(a, i, j):
    return [[entry for c, entry in enumerate(row) if c != j]
            for r, row in enumerate(a) if r != i]


def absolute_square(a):
    return [[(norm_squared(x), 0) for x in row] for row in a]


def row_gap(a, i):
    total = 0
    for j, entry in enumerate(a[i]):
        b = minor(a, i, j)
        total += norm_squared(entry) * (
            norm_squared(permanent(b)) - permanent(absolute_square(b))[0]
        )
    return total


def interpolation_certificate(a, expected_permanent, expected_gap):
    """Return exact power and Bernstein coefficients for S(A(t))-nQ(A(t))."""
    n = len(a)
    cofactor_coefficients = [[[(0, 0) for _ in range(n + 1)]
                              for _ in range(n)] for _ in range(n)]
    square_permanent_coefficients = [0] * (2 * n + 1)
    permanent_coefficients = [0] * (n + 1)
    for p, value in permutation_products(a).items():
        degree = sum(i != p[i] for i in range(n))
        permanent_coefficients[degree] += value[0]
        square_permanent_coefficients[2 * degree] += norm_squared(value)
        for i, j in enumerate(p):
            cofactor_coefficients[i][j][degree] = add(
                cofactor_coefficients[i][j][degree], value
            )
    gap = [-n * value for value in square_permanent_coefficients]
    for row in cofactor_coefficients:
        for coefficients in row:
            for d, x in enumerate(coefficients):
                for e, y in enumerate(coefficients):
                    gap[d + e] += x[0] * y[0] + x[1] * y[1]
    while gap[-1] == 0:
        gap.pop()
    first_degree = next(i for i, value in enumerate(gap) if value)
    assert first_degree == 2
    coefficients = gap[first_degree:]
    degree = len(coefficients) - 1
    bernstein = [
        sum(Fraction(coefficients[i] * comb(j, i), comb(degree, i))
            for i in range(j + 1))
        for j in range(degree + 1)
    ]
    assert all(value > 0 for value in bernstein)
    assert sum(permanent_coefficients) == expected_permanent
    assert sum(gap) == expected_gap
    print(f"Order {n}: exact positive Bernstein certificate after dividing by t^2.")
    print(f"  Degree {len(gap)-1}; gap at t=1: {sum(gap)}")
    return gap, bernstein


def main():
    a = [[(x, 0) for x in row]
         for row in [[25, 15, 15], [15, 20, -2], [15, -2, 20]]]
    assert permanent(a) == (18200, 0)
    assert permanent(absolute_square(a)) == (140915000, 0)
    assert row_gap(a, 0) == -6100000
    assert sum(row_gap(a, i) for i in range(3)) == 165620000
    print("Exact negative row-wise comparison and positive complete sum verified.")

    y3 = [[(Fraction(1 if i == j else -1, 1 if i == j else 2), 0)
           for j in range(3)] for i in range(3)]
    products = permutation_products(y3)
    cycle = (1, 2, 0)
    correlation = (0, 0)
    for p, value in products.items():
        composition = tuple(p[cycle[i]] for i in range(3))
        correlation = add(correlation, multiply(value, conjugate(products[composition])))
    assert correlation == (Fraction(-3, 64), 0)
    print("Exact negative three-cycle correlation verified.")

    z = [(1, 0), (0, 1), (-1, 0), (0, -1), (0, 0)]
    tran = [[add((1, 0), multiply((2 * u[0], 2 * u[1]), conjugate(v)))
             for v in z] for u in z]
    interpolation_certificate(tran, 504, 424552)

    x = [(-7, 4), (9, -3), (-6, 2), (3, 4),
         (7, 6), (4, -4), (0, 1), (5, -8)]
    y = [(4, -5), (1, 4), (-8, -2), (-7, 4),
         (1, -4), (1, -8), (8, -6), (1, -3)]
    drury = gram(list(zip(x, y)))
    assert [drury[i][i][0] for i in range(8)] == [106, 107, 108, 90, 102, 97, 101, 99]
    gap, _ = interpolation_certificate(
        drury, 2977257622144118400, 19889013972313069557084211636062668800
    )
    assert all(coefficient > 0 for coefficient in gap[2:])
    print("All checks passed. The all-order averaged lower bound remains unproved.")


if __name__ == "__main__":
    main()
