"""Exact identity checks for the Pula–Song–Wanless threshold proof.

These checks audit formulas and parameter conventions. They do not replace the
all-parameter proof in proof.md.
"""
from fractions import Fraction as Q
from math import comb, factorial
import sympy as sp


def permanent(a):
    n = len(a)
    dp = [Q(0)] * (1 << n)
    dp[0] = Q(1)
    for mask in range((1 << n) - 1):
        i = mask.bit_count()
        if not dp[mask]:
            continue
        for j in range(n):
            if not (mask >> j) & 1 and a[i][j]:
                dp[mask | (1 << j)] += dp[mask] * a[i][j]
    return dp[-1]


def reduced_matrix(m, n, x):
    a = Q(n - m + m * m * x, n)
    c = Q(1 - m * x, n)
    out = []
    for i in range(m + n):
        row = []
        for j in range(m + n):
            if i < n and j < n:
                value = a if i == j else Q(0)
            elif i >= n and j >= n:
                value = x
            else:
                value = c
            row.append(value)
        out.append(row)
    assert all(sum(row) == 1 for row in out)
    assert all(sum(out[i][j] for i in range(m + n)) == 1
               for j in range(m + n))
    return out


def coefficient_permanent(m, n, x):
    d = n - m
    a = Q(d + m * m * x, n)
    c = Q(1 - m * x, n)
    total = Q(0)
    for i in range(max(0, -d), m + 1):
        count = Q(comb(m, i) * factorial(n) * factorial(m),
                  factorial(d + i))
        total += count * x ** i * c ** (2 * (m - i)) * a ** (d + i)
    return total


def f_coeffs(q, d):
    return [Q(comb(q, i) * factorial(d), factorial(d + i))
            for i in range(q + 1)]


def mean_variance(q, d):
    coeff = f_coeffs(q, d)
    total = sum(coeff)
    u = sum(i * x for i, x in enumerate(coeff)) / total
    v = sum(i * i * x for i, x in enumerate(coeff)) / total - u * u
    return u, v


def main():
    t, m, d = sp.symbols("t m d", positive=True)
    n = m + d
    z = n * t * (d + m * t) / (m * (1 - t) ** 2)
    k = (d + (d + 2 * m) * t) / (t * (d + m * t) * (1 - t))
    assert sp.factor(sp.diff(z, t) / z - k) == 0
    base = -2 * m / (1 - t) + d * m / (d + m * t)
    assert sp.factor(base + m * t * k) == 0
    crossing = k * (z * (m - m * t) - m * t * (d + m * t)) - m
    expected = ((d * d - m) + (d * d + 3 * d * m + 2 * m) * t
                + m * (d + 2 * m - 1) * t * t) / (1 - t) ** 2
    assert sp.factor(crossing - expected) == 0
    quadratic = n * (m + 2 * d) / (d + 1) - (
        n * n * d * d * (m + d + 1) / (m * (d + 1) ** 2 * (d + 2)))
    assert sp.factor(quadratic.subs(m, d * d)
                     - 3 * d * d * (d + 1) / (d + 2)) == 0
    print("Generic symbolic derivative, crossing and threshold identities: passed")

    zz = sp.symbols("z")
    ode_cases = 0
    for q in range(1, 9):
        for dd in range(0, 9):
            coeff = f_coeffs(q, dd)
            f = sum(sp.Rational(c.numerator, c.denominator) * zz ** i
                    for i, c in enumerate(coeff))
            ode = zz * sp.diff(f, zz, 2) + (dd + 1 + zz) * sp.diff(f, zz) - q * f
            assert sp.expand(ode) == 0
            u, v = mean_variance(q, dd)
            assert u * (dd + u) == q - u - v
            if q >= 2:
                assert v < u * (q - u) / q
            ode_cases += 1
    print(f"Coefficient ODE and variance identity checks: {ode_cases} passed")

    matrix_cases = 0
    for mm, nn in [(1, 2), (1, 3), (2, 2), (2, 3), (2, 4),
                   (3, 2), (3, 3), (3, 4), (3, 5), (4, 2), (4, 3), (4, 4)]:
        lo = max(Q(0), Q(mm - nn, mm * mm))
        hi = Q(1, mm)
        for weight in [Q(0), Q(1, 3), Q(1, 2), Q(1)]:
            x = lo + weight * (hi - lo)
            a = reduced_matrix(mm, nn, x)
            assert permanent(a) == coefficient_permanent(mm, nn, x)
            matrix_cases += 1
    print(f"Independent subset-DP permanent vs counting formula: {matrix_cases} passed")

    bary_cases = 0
    for mm in range(1, 8):
        for nn in range(2, 8):
            if nn >= mm:
                dd = nn - mm
                u, v = mean_variance(mm, dd)
                a, c, b = Q(dd + u, nn), Q(mm - u, mm * nn), Q(u, mm * mm)
            else:
                dd = mm - nn
                u, v = mean_variance(nn, dd)
                a, c, b = Q(u, nn), Q(nn - u, mm * nn), Q(dd + u, mm * mm)
            assert a * b > c * c
            bary_cases += 1
    print(f"Exact barycenter parameter/strict-factor-inequality checks: {bary_cases} passed")
    print("All finite checks are identity audits; the proof is the written general argument.")


if __name__ == "__main__":
    main()
