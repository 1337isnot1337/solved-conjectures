#!/usr/bin/env python3
"""Exact checks for the Fang-Zhang-Zhao Hoggatt-sum counterexample.

The proof is an explicit polynomial identity and sign argument. This script
cross-checks it; no floating-point arithmetic or numerical search is used.
"""
from fractions import Fraction
from math import comb, prod
import json

import sympy as sp


def binomial_row_sum(n, m):
    """The conjecture's displayed binomial-product definition."""
    top = n + m - 2
    denominator = prod(comb(top, j) for j in range(1, m))
    result = sum(
        (Fraction(prod(comb(top, k + j) for j in range(m)), denominator)
         for k in range(n)),
        Fraction(0),
    )
    assert result.denominator == 1
    return result.numerator


def box_row_sum(n, m):
    """Independent cancellation into plane-partition box products."""
    result = Fraction(0)
    for k in range(n):
        term = Fraction(1)
        for i in range(1, k + 1):
            for j in range(1, n - k):
                term *= Fraction(m + i + j - 1, i + j - 1)
        result += term
    assert result.denominator == 1
    return result.numerator


def logconvex_step(values):
    return [values[i] * values[i + 2] - values[i + 1] ** 2
            for i in range(len(values) - 2)]


def polynomial_row_sum(n, m):
    result = sp.Integer(0)
    for k in range(n):
        term = sp.Integer(1)
        for i in range(1, k + 1):
            for j in range(1, n - k):
                term *= (m + i + j - 1) * sp.Rational(1, i + j - 1)
        result += term
    return sp.Poly(sp.expand(result), m)


def main():
    expected = {
        (4, 4): -111509459048444462640611465400686603136,
        (5, 4): -44045680773437284570849713497906508911110782976,
        (6, 3): -663996112380294400,
    }
    witnesses = []
    for (m, order), negative in expected.items():
        first = 2
        last = first + 2 * order
        values = [binomial_row_sum(n, m) for n in range(first, last + 1)]
        assert values == [box_row_sum(n, m) for n in range(first, last + 1)]
        iterations = [values]
        for _ in range(order):
            values = logconvex_step(values)
            iterations.append(values)
        assert values == [negative]
        witnesses.append({"m": m, "order": order, "index": first,
                          "iterations": iterations, "negative": negative})

    m = sp.Symbol("m")
    initial = [polynomial_row_sum(n, m) for n in range(2, 9)]
    current = initial
    for _ in range(3):
        current = logconvex_step(current)

    q_coefficients = [
        1, 42, 723, 6462, 27742, -16148, -934842, -5962420,
        -21758691, -53818158, -97778329, -138523978, -159475276,
        -154920392, -129902448, -88784352, -37081152, -2892672,
    ]
    q = sp.Poly.from_list(q_coefficients, m)
    a = m ** 4 + 9 * m ** 3 + 26 * m ** 2 + 36 * m + 72
    claimed = (
        -m ** 4 * (m - 1) ** 4 * (m + 1) ** 5 * (m + 2) ** 2
        * a * q.as_expr() / sp.Integer(1547934105600)
    )
    assert sp.Poly(current[0].as_expr() - claimed, m).is_zero
    assert q.eval(6) == 264264378826752

    # The sign proof in PROOF.md uses the strictly increasing Q(m)/m^12.
    assert all(c > 0 for c in q_coefficients[:5])
    assert all(c < 0 for c in q_coefficients[5:])

    shifted_q = sp.Poly(q.as_expr().subs(m, m + 6), m)
    assert all(c > 0 for c in shifted_q.all_coeffs())

    for n, polynomial in zip(range(2, 9), initial):
        for integer_m in (2, 3, 4, 5, 6, 11):
            assert polynomial.eval(integer_m) == binomial_row_sum(n, integer_m)

    output = {
        "status": "all exact checks passed",
        "witnesses": witnesses,
        "family_identity_degree": current[0].degree(),
        "q_at_6": int(q.eval(6)),
        "shifted_q_coefficients_descending": [int(c) for c in shifted_q.all_coeffs()],
        "scope": "Conjecture 4.3 is false; every integer m >= 4 fails",
        "separate_baxter_conjecture": "not resolved",
    }
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()

