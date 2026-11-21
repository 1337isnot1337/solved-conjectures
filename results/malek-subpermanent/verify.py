"""Exact scalar certificates for review-constants.md.

Standard-library rational arithmetic only. No matrix enumeration.
"""

from fractions import Fraction as F
from math import comb, factorial


def falling(a, j):
    return factorial(a) // factorial(a - j)


def diagonal_uniform_q(n, k, t):
    """Expand t I + (1-t) J by the identity entries selected."""
    return sum(
        (
            F(falling(k, j), falling(n, j))
            * (n * t) ** j
            * (1 - t) ** (k - j)
            / factorial(j)
            for j in range(k + 1)
        ),
        F(0),
    )


def centered_sigma_q(n, j):
    """Extract sigma_j(I-J) from the full-permanent centered polynomial."""
    coefficient = sum(
        (
            F(n**ell, factorial(ell))
            * comb(n - ell, j - ell)
            * (-1) ** (j - ell)
            for ell in range(j + 1)
        ),
        F(0),
    )
    return coefficient * F(falling(n, j), n**j)


def centered_q(n, k, t):
    return sum(
        (
            F(falling(k, j) * n**j, falling(n, j) ** 2)
            * t**j
            * centered_sigma_q(n, j)
            for j in range(k + 1)
        ),
        F(0),
    )


def comparison_constant(n, k):
    t = F(1, n - 1)
    q = diagonal_uniform_q(n, k, t)
    assert q == centered_q(n, k, t)
    alpha = F(k * (k - 1), n * (n - 1))
    return (q - 1) / ((n - 1) * alpha)


def add(a, b):
    result = [F(0)] * max(len(a), len(b))
    for i, x in enumerate(a):
        result[i] += x
    for i, x in enumerate(b):
        result[i] += x
    return result


def multiply(a, b):
    result = [F(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            result[i + j] += x * y
    return result


def scale(a, c):
    return [c * x for x in a]


def shift(a, c):
    result = [F(0)] * len(a)
    for degree, coefficient in enumerate(a):
        for j in range(degree + 1):
            result[j] += coefficient * comb(degree, j) * c ** (degree - j)
    return result


def main():
    expected = {
        (5, 4): (F(3685, 73728), F(7, 368640)),
        (6, 5): (F(4767, 156250), F(47401, 11250000)),
        (7, 7): (F(4421129, 201553920), F(35307079, 9876142080)),
    }
    for (n, k), (value, gap) in expected.items():
        actual = comparison_constant(n, k)
        assert actual == value
        assert F(5, 4 * n * n) - actual == gap > 0
        print(f"n={n}, k={k}: constant={value}; exact positive gap={gap}")

    # Verify the exact polynomial after the n=5 reduction.
    one_minus_s_squared = [F(1), F(-2), F(1)]
    radical_squared = scale(
        multiply([F(1), F(4)], [F(1, 4), F(0), F(-1, 2)]),
        F(28, 45),
    )
    cubic = scale(add(one_minus_s_squared, scale(radical_squared, F(-1))), F(45))
    assert cubic == [F(38), F(-118), F(59), F(56)]

    square_factor = multiply([F(-5, 9), F(1)], [F(-5, 9), F(1)])
    remainder = scale(multiply(square_factor, [F(10, 9), F(1)]), F(56))
    quadratic = [F(13702, 729), F(-1786, 27), F(59)]
    assert add(quadratic, remainder) == cubic
    discriminant = quadratic[1] ** 2 - 4 * quadratic[2] * quadratic[0]
    assert discriminant == F(-43876, 729) < 0
    assert quadratic[2] > 0

    # Positive coefficients after writing n=8+v certify every n>=8.
    comparison_polynomial = [F(-40), F(85), F(-55), F(6)]
    translated = shift(comparison_polynomial, F(8))
    assert translated == [F(192), F(357), F(89), F(6)]
    assert all(x > 0 for x in translated)

    # Exact constants used in the exponential and cosh bounds.
    assert F(1, 2) / (1 - F(1, 4) / 4) == F(8, 15)
    assert F(8, 15) + F(16, 225) * F(5, 4) == F(28, 45)

    # Guard against accidentally applying the small-order bound at k=n.
    assert comparison_constant(5, 5) > F(5, 4 * 5**2)
    assert comparison_constant(6, 6) > F(5, 4 * 6**2)
    assert F(8, 9) - F(28, 27) * F(1, 3) == F(44, 81)
    print("Exact polynomial, discriminant, and constant certificates passed.")


if __name__ == "__main__":
    main()
