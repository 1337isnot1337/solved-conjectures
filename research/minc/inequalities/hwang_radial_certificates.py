"""Exact normalization checks for hwang_radial_convexity.md.

This checks algebraic identities and counterexamples to stronger shortcuts.
It does not verify Hwang's conjecture in any order or perform a numerical search.
Requires SymPy; all calculations use symbolic expressions and rational numbers.
"""

from itertools import combinations
from math import factorial

import sympy as sp


def permanent(matrix):
    """Ryser's formula, used only for the small exact identity below."""
    n = matrix.rows
    assert matrix.cols == n
    if not n:
        return sp.Integer(1)
    answer = sp.Integer(0)
    for mask in range(1, 1 << n):
        columns = [j for j in range(n) if mask & (1 << j)]
        term = sp.Integer((-1) ** (n - len(columns)))
        for i in range(n):
            term *= sum(matrix[i, j] for j in columns)
        answer += term
    return sp.expand(answer)


def sigma(matrix, degree):
    if degree == 0:
        return sp.Integer(1)
    answer = sp.Integer(0)
    for rows in combinations(range(matrix.rows), degree):
        for columns in combinations(range(matrix.cols), degree):
            answer += permanent(matrix.extract(rows, columns))
    return sp.expand(answer)


def main():
    t, h = sp.symbols("t h", real=True)

    # The negative full Hessian direction is not the radial direction.
    a = (1 - t) / 3
    c = (1 + 2 * t) / 3
    circulant_permanent = (a + h) ** 3 + (a - h) ** 3 + c**3 + 3 * (a + h) * (a - h) * c
    assert sp.expand(circulant_permanent - circulant_permanent.subs(h, 0) - (1 - 4 * t) * h**2) == 0
    assert sp.expand(circulant_permanent.subs(t, sp.Rational(1, 3)) - sp.Rational(67, 243) + h**2 / 3) == 0

    # General Bernstein-term second derivative, before taking the expectation.
    n, k = sp.symbols("n k", integer=True)
    logarithmic_derivative = k / t - (n - k) / (1 - t)
    second_logarithmic_derivative = -k / t**2 - (n - k) / (1 - t) ** 2
    numerator = (k - n * t) ** 2 - (1 - 2 * t) * k - n * t**2
    assert sp.factor(logarithmic_derivative**2 + second_logarithmic_derivative - numerator / (t**2 * (1 - t) ** 2)) == 0

    # One nonsymmetric rational core checks the exact block multiplicities.
    core = sp.Matrix([
        [sp.Rational(1, 2), sp.Rational(1, 2), 0],
        [sp.Rational(1, 4), 0, sp.Rational(3, 4)],
        [sp.Rational(1, 4), sp.Rational(1, 2), sp.Rational(1, 4)],
    ])
    m, tail_order = core.rows, 3
    assert core != core.T
    assert all(sum(core.row(i)) == 1 and sum(core.col(i)) == 1 for i in range(m))
    total_order = m + tail_order
    padded = sp.diag(core, sp.ones(tail_order) / tail_order)
    interpolated = (1 - t) * sp.ones(total_order) / total_order + t * padded
    direct = permanent(interpolated)
    cross_entry = (1 - t) / total_order
    tail_entry = cross_entry + t / tail_order
    core_block = t * core + cross_entry * sp.ones(m)
    block_formula = sum(
        sigma(core_block, j)
        * sp.Rational(factorial(tail_order) ** 2, factorial(tail_order - m + j))
        * cross_entry ** (2 * (m - j))
        * tail_entry ** (tail_order - m + j)
        for j in range(m + 1)
    )
    assert sp.expand(direct - block_formula) == 0

    # Taylor positivity fails for a valid core, but this is not a curvature test.
    shift = sp.zeros(4)
    for i in range(4):
        shift[i, (i + 1) % 4] = 1
    cycle_core = (sp.eye(4) + shift) / 2
    rook_coefficients = [sigma(cycle_core, j) for j in range(5)]
    assert rook_coefficients == [1, 4, 5, 2, sp.Rational(1, 8)]
    polynomial = sp.expand(sum(rook_coefficients[j] * t**j * (1 - t) ** (8 - 2 * j) for j in range(5)))
    truncated_exponential = sum((4 * t) ** j / sp.factorial(j) for j in range(8))
    assert sp.expand(polynomial * truncated_exponential).coeff(t, 7) == -sp.Rational(4, 105)

    print("Passed: exact transverse Hessian identity, Bernstein derivative identity,")
    print("nonsymmetric-core block formula, and negative Poisson Taylor coefficient.")
    print("No case of Hwang's conjecture is claimed from these checks.")


if __name__ == "__main__":
    main()
