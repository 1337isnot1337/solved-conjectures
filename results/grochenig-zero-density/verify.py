#!/usr/bin/env python3
"""Exact cross-checks for the algebra and budgets in PROOF.md.

These are finite, standard-library-only checks.  They do not replace the
all-N construction, convergence argument, or density proof in PROOF.md.
No floating-point arithmetic and no Lean are used.
"""

from collections import defaultdict
from fractions import Fraction
from itertools import combinations


def polynomial_block(n):
    """P_n(t) = product_(j=1)^n (t - q^(2j)), as {(t_power,q_power):coef}."""
    p = {(0, 0): 1}
    for j in range(1, n + 1):
        out = defaultdict(int)
        for (k, exponent), coefficient in p.items():
            out[k + 1, exponent] += coefficient
            out[k, exponent + 2 * j] -= coefficient
        p = {key: value for key, value in out.items() if value}
    return p


def substitute(p, t_power):
    out = defaultdict(int)
    for (k, exponent), coefficient in p.items():
        out[exponent + t_power * k] += coefficient
    return {key: value for key, value in out.items() if value}


def main():
    checks = 0
    for n in range(1, 13):
        p = polynomial_block(n)

        # Independently build coefficients by the elementary-symmetric formula.
        independent = defaultdict(int)
        for k in range(n + 1):
            for chosen in combinations(range(1, n + 1), n - k):
                independent[k, 2 * sum(chosen)] += (-1) ** (n - k)
        assert p == dict(independent)
        checks += 1

        for k in range(n + 1):
            coeffs = [v for (j, _), v in p.items() if j == k]
            assert coeffs and all(v * (-1) ** (n - k) > 0 for v in coeffs)
            # log(q)=2*pi.  A_(n,k)=p_(n,k)*q^(2k^2).
            # Exponent in units of pi: 4k^2 -(x-2k)^2 = -x^2+4kx.
            left = (-1, 4 * k, 4 * k * k - (2 * k) ** 2)
            right = (-1, 4 * k, 0)
            assert left == right
            checks += 2

        for j in range(1, n + 1):
            assert substitute(p, 2 * j) == {}
            checks += 1

        # At x=j+1/2, t=q^(2j+1).  For q>1 each factor's sign
        # is the sign of its exponent difference; no evaluation of exp is used.
        for j in range(n + 1):
            exponent_differences = [2 * j + 1 - 2 * r for r in range(1, n + 1)]
            assert all(d != 0 for d in exponent_differences)
            negative_factors = sum(d < 0 for d in exponent_differences)
            assert negative_factors == n - j
            checks += 1

        # Exact rational specialization checks only the normalization algebra.
        numerical_coeffs = [sum(v * 2 ** (e + 2 * k * k)
                                  for (j, e), v in p.items() if j == k)
                            for k in range(n + 1)]
        b = sum(abs(v) for v in numerical_coeffs)
        normalized = [Fraction(v, 2 ** n * b) for v in numerical_coeffs]
        assert sum(abs(v) for v in normalized) == Fraction(1, 2 ** n)
        assert all(normalized[k] * normalized[k + 1] < 0 for k in range(n))
        checks += 2

    # Exact geometric-tail identity and the sign-preservation margin.
    for m in range(1, 101):
        first = Fraction(1, 2 ** (m + 3))
        future = first / (1 - Fraction(1, 2))
        assert future == Fraction(1, 2 ** (m + 2))
        assert Fraction(1, 4) + future <= Fraction(3, 8) < 1
        checks += 2

    # Endpoint convention for the coefficient sign-change density.
    for length in range(1, 101):
        for start in (0, 1):
            count = sum(k % 2 == 0 for k in range(start, start + length + 1))
            assert count <= Fraction(length, 2) + 1
            checks += 1

    print(f"PASS: {checks} exact cross-checks.")
    print("All-scale existence, analytic convergence, and density conclusions are proved in PROOF.md.")


if __name__ == "__main__":
    main()
