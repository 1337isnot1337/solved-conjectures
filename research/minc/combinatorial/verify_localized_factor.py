"""Check a localized cell coupled to a diffuse two-class permanent exactly."""

from fractions import Fraction as F
from math import comb, factorial

from verify_minc_integrality_identities import permanent


def two_class(m, b):
    """The block count in each of the two equal diagonal rectangles is j."""
    h = m // 2
    return sum(
        factorial(h) ** 2 * comb(h, j) ** 2
        * ((1 + b) / m) ** (2 * j) * ((1 - b) / m) ** (m - 2 * j)
        for j in range(h + 1)
    )


def derivative_permanent(m, b):
    h = m // 2
    return sum(
        factorial(h) ** 2 * comb(h, j) ** 2
        * ((1 + b) / m) ** (2 * j) * ((1 - b) / m) ** (m - 2 * j)
        * (2 * j / (1 + b) - (m - 2 * j) / (1 - b))
        for j in range(h + 1)
    )


def bordered(m, a, b):
    p = two_class(m, b)
    derivative = derivative_permanent(m, b)
    total_cofactors = m * m * p - m * b * derivative
    c = (1 - a) / m
    return a * (1 - c) ** m * p + c * c * (1 - c) ** (m - 1) * total_cofactors


def materialize(m, a, b):
    c = (1 - a) / m
    matrix = [[a] + [c] * m]
    for i in range(m):
        row = [c]
        for j in range(m):
            sign = 1 if (i < m // 2) == (j < m // 2) else -1
            row.append((1 - c) * (1 + sign * b) / m)
        matrix.append(row)
    return matrix


if __name__ == "__main__":
    checks = 0
    for m in (2, 4, 6, 8):
        for a in (F(0), F(1, 4), F(2, 3), F(1)):
            for b in (F(-3, 4), F(0), F(1, 2)):
                assert bordered(m, a, b) == permanent(materialize(m, a, b))
                checks += 1
    print(f"{checks} exact bordered permanents")
    for m in (8, 16, 32, 64, 128):
        a, b = F(2, 3), F(1, 2)
        diffuse = two_class(m, b) / (F(factorial(m)) / m**m)
        ratio = bordered(m, a, b) / (bordered(m, a, F(0)) * diffuse)
        print(f"outside size {m:3d}, exact-factor ratio {float(ratio):.9f}")
