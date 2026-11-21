"""Exact diagnostics for centered_permanental_coefficients.md.

All arithmetic below is integral or rational. The program verifies the
normalization of the Gaussian coefficient identity using polynomial inner
products, separately computes every rook coefficient, and checks the
constant arithmetic. It does not replace the all-order analytic proof.
"""

from collections import defaultdict
from fractions import Fraction
from math import factorial, prod


def gram(left, right):
    return [
        [sum(a * b for a, b in zip(row, col)) for col in right]
        for row in left
    ]


def centered(factors):
    return all(sum(row[j] for row in factors) == 0 for j in range(len(factors[0])))


def rook_coefficients(matrix):
    """Enumerate matchings by a row-by-row subset recurrence."""
    n = len(matrix)
    states = {0: 1}
    for row in matrix:
        following = defaultdict(int)
        for mask, value in states.items():
            following[mask] += value
            for j, entry in enumerate(row):
                if not (mask >> j) & 1:
                    following[mask | (1 << j)] += value * entry
        states = following
    answer = [0] * (n + 1)
    for mask, value in states.items():
        answer[mask.bit_count()] += value
    return answer


def symmetric_polynomials(factors):
    """Coefficients of product_i (1 + sum_a factors[i,a] z_a)."""
    rank = len(factors[0])
    coefficients = {(0,) * rank: 1}
    for row in factors:
        following = defaultdict(int)
        for powers, value in coefficients.items():
            following[powers] += value
            for j, entry in enumerate(row):
                shifted = list(powers)
                shifted[j] += 1
                following[tuple(shifted)] += value * entry
        coefficients = following
    result = [dict() for _ in range(len(factors) + 1)]
    for powers, value in coefficients.items():
        result[sum(powers)][powers] = value
    return result


def gaussian_inner_products(left, right):
    """Complex Gaussian monomials have squared norm product_a alpha_a!."""
    p = symmetric_polynomials(left)
    q = symmetric_polynomials(right)
    return [
        sum(
            value * q[k].get(powers, 0) * prod(factorial(a) for a in powers)
            for powers, value in part.items()
        )
        for k, part in enumerate(p)
    ]


def check_pair(name, left, right):
    assert len(left) == len(right)
    assert len(left[0]) == len(right[0])
    assert centered(left) and centered(right)
    matrix = gram(left, right)
    assert all(sum(row) == 0 for row in matrix)
    assert all(sum(row[j] for row in matrix) == 0 for j in range(len(matrix)))
    rook = rook_coefficients(matrix)
    gaussian = gaussian_inner_products(left, right)
    assert rook == gaussian, (name, rook, gaussian)
    left_psd = rook_coefficients(gram(left, left))
    right_psd = rook_coefficients(gram(right, right))
    for mixed, a, b in zip(rook, left_psd, right_psd):
        assert a >= 0 and b >= 0
        assert mixed * mixed <= a * b
    # The degree-two centered identity checks an independent normalization.
    assert 2 * rook[2] == sum(entry * entry for row in matrix for entry in row)
    print(name, "sigma =", rook)


def check_constants():
    # c = pi^2/8 < 5/4; only the rational upper bound is used here.
    c_upper = Fraction(5, 4)
    radius_squared = Fraction(1, 200**2)
    b_squared_coefficient = 50**2
    a_squared_coefficient = 5000
    u_upper = 2 * c_upper * b_squared_coefficient * radius_squared
    assert u_upper == Fraction(5, 32)
    assert u_upper < Fraction(1, 4)
    exponential_coefficient = (
        c_upper
        * (a_squared_coefficient + b_squared_coefficient)
        / Fraction(3, 4)
    )
    assert exponential_coefficient == 12500
    assert exponential_coefficient + 28 == 12528 < 13000
    assert 13000 * radius_squared == Fraction(13, 40) < Fraction(1, 2)
    hessian_upper = 2 + Fraction(2, 3) * 14 + 14 * 6
    assert hessian_upper == Fraction(286, 3) < 100
    large_radius_majorant = -1 - Fraction(1, 3) + Fraction(14, 5)
    assert large_radius_majorant == Fraction(22, 15) > 1
    print("All rational constant checks passed.")


def main():
    check_pair(
        "rank-one asymmetric",
        [[-3], [1], [1], [1]],
        [[-3], [1], [1], [1]],
    )
    check_pair(
        "rank-two Gram",
        [[1, 0], [0, 1], [-1, 1], [0, -2]],
        [[1, 0], [0, 1], [-1, 1], [0, -2]],
    )
    check_pair(
        "rank-three mixed Gram",
        [[1, 0, -1], [0, 2, 1], [-1, -1, 0], [2, 0, 1], [-2, -1, -1], [0, 0, 0]],
        [[0, 1, 1], [1, -1, 0], [2, 0, -1], [-1, 2, 0], [-2, -1, 1], [0, -1, -1]],
    )
    check_constants()
    print("Exact Gaussian/rook identities and Cauchy bounds passed.")


if __name__ == "__main__":
    main()
