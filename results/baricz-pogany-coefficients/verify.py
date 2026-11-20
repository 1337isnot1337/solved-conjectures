#!/usr/bin/env python3
"""Exact diagnostics for Baricz--Pogany's asymptotic coefficients.

This checks independent coefficient constructions at rational parameters.
It is not a substitute for the all-degree formal-series proof in PROOF.md.
Only the Python standard library is required.
"""

from fractions import Fraction as F
from math import factorial


def source_coefficient(mu, n):
    """(-1)^n a_n(mu), directly from source equations (3.5)--(3.6)."""
    value = F((-1) ** n, 8**n * factorial(n))
    for k in range(1, n + 1):
        value *= 4 * mu**2 - (2 * k - 1) ** 2
    return value


def multiply(left, right, degree):
    return [
        sum((left[k] * right[n - k] for k in range(n + 1)), F(0))
        for n in range(degree + 1)
    ]


def inverse_unit(series, degree):
    assert series[0] == 1
    answer = [F(1)]
    for n in range(1, degree + 1):
        answer.append(-sum((series[j] * answer[n - j] for j in range(1, n + 1)), F(0)))
    return answer


def source_fixtures(nu):
    """Explicit coefficients printed in source Section 4.4."""
    pair = (nu + F(1, 2)) * (nu + F(3, 2))
    return {
        0: F(1),
        1: nu + F(1, 2),
        2: pair / 2,
        3: pair / 2,
        4: pair * (nu + F(7, 2)) * (F(3, 2) - nu) / 8,
        5: pair * (F(9, 4) - 2 * nu - nu**2) / 2,
        6: pair * (nu**4 + 4 * nu**3 - F(45, 2) * nu**2 - 53 * nu + F(633, 16)) / 16,
    }


def main():
    degree = 16
    parameters = [F(1, 100), F(1, 10), F(1, 4), F(1, 2), F(3, 4), F(9, 10), F(99, 100)]
    identities = fixtures = strict_bounds = 0
    for a in parameters:
        nu = a - F(1, 2)
        c = [source_coefficient(nu, n) for n in range(degree + 1)]
        d = [source_coefficient(nu + 1, n) for n in range(degree + 1)]

        # Source quotient recurrence, without the positivity identity.
        alpha = [F(1)]
        for n in range(1, degree + 1):
            alpha.append(c[n] - sum((alpha[m] * d[n - m] for m in range(n)), F(0)))

        for n in range(1, degree + 1):
            assert c[n] > 0 and d[n] < 0
            assert c[n] == (n - a) * (n + a - 1) * c[n - 1] / (2 * n)
            assert d[n] == -(n + a) * c[n] / (n - a)
            assert d[n] == c[n] - (n + a - 1) * c[n - 1]
            identities += 3

        # Independent construction of the positive right side of equation (11).
        inverse_d = inverse_unit(d, degree)
        assert all(value >= 0 for value in inverse_d)
        geometric = [a**n for n in range(degree + 1)]
        derivative = [F(0), F(0)] + [(n - 1) * c[n - 1] for n in range(2, degree + 1)]
        positive_rhs = multiply(derivative, multiply(geometric, inverse_d, degree), degree)
        for n in range(degree + 1):
            assert alpha[n] - a**n == positive_rhs[n]
            identities += 1
            if n >= 2:
                assert alpha[n] - a**n >= (n - 1) * c[n - 1] > 0
                strict_bounds += 1

        for n, value in source_fixtures(nu).items():
            assert alpha[n] == value, (a, n, alpha[n], value)
            fixtures += 1

    print(f"PASS: {identities} exact identities, {fixtures} source fixtures, {strict_bounds} strict bounds.")
    print("The general theorem is proved in PROOF.md; these are finite diagnostic checks.")


if __name__ == "__main__":
    main()
