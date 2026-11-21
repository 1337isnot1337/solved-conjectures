"""Symbolic, exact checks for the cofactor derivative obstruction.

All assertions are identities in an indeterminate t.  This is not a
finite-order claim about unrestricted Chollet or an optimization search.
"""

from itertools import permutations

import sympy as sp


def permanent(a):
    return sp.expand(sum(sp.prod(a[i, p[i]] for i in range(a.rows))
                         for p in permutations(range(a.rows))))


def cofactors(a):
    return sp.Matrix(a.rows, a.cols,
                     lambda i, j: permanent(a.minor_submatrix(i, j)))


def square(a):
    return a.applyfunc(lambda entry: sp.expand(entry**2))


def gap(a):
    return square(cofactors(a)) - cofactors(square(a))


def assert_matrix_equal(a, b):
    assert all(sp.expand(entry) == 0 for entry in a - b)


def main():
    t = sp.Symbol("t", real=True)
    vectors = sp.Matrix([[0, t, t, 0], [0, 1, -1, 1], [1, 0, 0, 0]])
    a = vectors.T * vectors
    b = a[:3, :3]
    k = cofactors(b)
    derivative = cofactors(a)[:3, :3] - k
    paired_derivative = cofactors(square(a))[:3, :3] - cofactors(square(b))
    expected_t = sp.Matrix([[4, 0, 0], [0, 1, -1], [0, -1, 1]])
    expected_u = sp.Matrix([[4 * (t**4 + 1), 0, 0], [0, 1, 1], [0, 1, 1]])
    assert_matrix_equal(derivative, expected_t)
    assert_matrix_equal(paired_derivative, expected_u)
    remainder = square(derivative) - paired_derivative
    assert_matrix_equal(remainder, sp.diag(4 * (3 - t**4), 0, 0))
    assert remainder[0, 0].subs(t, 2) == -52

    full_gap = gap(a)
    cross = 2 * k.multiply_elementwise(derivative)
    assert_matrix_equal(full_gap[:3, :3], gap(b) + cross + remainder)
    assert sp.expand(gap(b)[0, 0] - 2 * (t**4 - 1)**2) == 0
    assert sp.expand(cross[0, 0] - 16 * (t**4 + 1)) == 0
    first = 2 * t**8 + 8 * t**4 + 30
    assert sp.expand(full_gap[0, 0] - first) == 0

    v = sp.Matrix([1, -1, 0])
    w = sp.Matrix([1, 1, 1 - t**4])
    expected_gap = sp.diag(first, sp.zeros(3))
    expected_gap[1:, 1:] = 2 * t**2 * v * v.T + 2 * w * w.T
    assert_matrix_equal(full_gap, expected_gap)

    gamma = a.multiply_elementwise(cofactors(a))
    averaged = sum(square(gamma)) - 4 * permanent(square(a))
    assert sp.expand(averaged - (4 * t**8 + 20 * t**4 + 48)) == 0
    print("All border, derivative, compensation, and PSD identities verified symbolically.")
    print("Derivative remainder at t=2: -52; complete (1,1) gap: 670.")
    print("The displayed family satisfies the full cofactor comparison.")


if __name__ == "__main__":
    main()
