#!/usr/bin/env python3
"""Exact certificate for ordinary self-pairings in Bremner's second family.

The 625 exact specializations prove an identity of bounded-degree polynomials;
they are not an exploratory sample. This does not check complementary-prefix
pairings or prove any bound for arbitrary square chains or integer roots.
"""

from fractions import Fraction
from functools import reduce
from math import gcd, isqrt
from pathlib import Path
import json

from bremner_certificate import (
    add, scale, mul, power, evaluate, product_polynomials,
    determinant_bareiss, off_diagonal, trim,
)
from bremner_cross_checks import second_functions, check_second_construction


def divide_monic_exact(numerator, denominator):
    assert denominator[-1] == 1
    remainder = list(numerator)
    quotient = [0]*(len(numerator)-len(denominator)+1)
    for k in range(len(quotient)-1, -1, -1):
        coefficient = remainder[k+len(denominator)-1]
        quotient[k] = coefficient
        for j, d in enumerate(denominator):
            remainder[k+j] -= coefficient*d
    assert all(c == 0 for c in remainder)
    return trim(quotient)


def self_functions():
    q, r, _ = second_functions()
    qn, qd = q
    rn, rd = r
    assert mul(qd, qd) == rd
    common = mul([8, 1], [16, 0, 1])
    hn = divide_monic_exact(add(scale(rn, 9), scale(mul(qn, qn), -25)), common)
    hd = scale(divide_monic_exact(rd, common), 9)
    assert (len(qn)-1, len(qd)-1, len(hn)-1, len(hd)-1) == (13, 14, 23, 25)
    assert all(a[-1] for a in (qn, qd, hn, hd))
    # This cross-multiplied identity independently checks h = r - 25*q^2/9.
    assert scale(mul(hn, rd), 9) == mul(hd, add(scale(rn, 9), scale(mul(qn, qn), -25)))
    return q, (hn, hd)


def resultant_at(x, q, h):
    a, b = off_diagonal(*q, x), off_diagonal(*h, x)
    assert len(a) == 14 and len(b) == 25
    matrix = [[0]*37 for _ in range(37)]
    for column in range(24):
        for i, coefficient in enumerate(a):
            matrix[i+column][column] = coefficient
    for column in range(13):
        for i, coefficient in enumerate(b):
            matrix[i+column][24+column] = coefficient
    return determinant_bareiss(matrix)


def run_checks():
    check_second_construction()
    root = Path(__file__).parent
    raw_data = json.loads((root/'bremner_second_self_raw.json').read_text())
    data = json.loads((root/'bremner_second_self_certificate.json').read_text())
    raw = [int(c) for c in reversed(raw_data['coefficients'])]
    remainder = [int(c) for c in reversed(data['coefficients'])]
    assert raw_data['degree'] == data['raw_degree'] == len(raw)-1 == 624
    assert data['remaining_degree'] == len(remainder)-1 == 302
    assert raw[-1] > 0 and remainder[-1] > 0
    assert reduce(gcd, raw) == reduce(gcd, remainder) == 1

    factors, candidates = [], []
    assert len(data['inadmissible_factors']) == 11
    for item in data['inadmissible_factors']:
        coefficients = [int(c) for c in reversed(item['coefficients'])]
        degree, exponent = item['degree'], item['exponent']
        assert degree == len(coefficients)-1 and coefficients[-1] == 1
        assert isinstance(exponent, int) and exponent > 0
        factors.append(power(coefficients, exponent))
        if degree == 1:
            candidates.append(-Fraction(coefficients[0], coefficients[1]))
        elif degree == 2:
            c, b, a = coefficients
            discriminant = b*b-4*a*c
            assert discriminant < 0 or isqrt(discriminant)**2 != discriminant
        else:
            assert degree == 3
            assert all(evaluate(coefficients, x) % 3 for x in range(3))
    assert set(candidates) == {-8, -4, 2, 12}
    assert int(data['raw_normalization']) == 1
    assert mul(product_polynomials(factors), remainder) == raw
    assert data['prime'] == 11 and remainder[-1] % 11 == 8
    values = [evaluate(remainder, x) % 11 for x in range(11)]
    assert values == data['values'] == [8, 2, 9, 3, 5, 6, 1, 3, 3, 7, 5]

    q, h = self_functions()
    assert h[0] == [int(c) for c in reversed(data['h_numerator'])]
    # Off-diagonal equations have bidegrees at most (13,13), (24,24).
    # The fixed Sylvester determinant therefore has degree at most 624.
    # raw is primitive: the determinant's nonzero content is certified by
    # an exact anchor, independently of the removal identity's normalization.
    scalar = None
    for x in range(625):
        actual, expected = resultant_at(x, q, h), evaluate(raw, x)
        if expected:
            if scalar is None:
                scalar = Fraction(actual, expected)
                assert scalar != 0
            assert actual == scalar*expected
        else:
            assert actual == 0
    assert scalar is not None

    functions = second_functions()
    assert [(len(n)-1, len(d)-1) for n, d in functions] == [(13, 14), (26, 28), (45, 50)]
    assert evaluate(functions[0][1], -8) == 0
    assert evaluate(functions[0][0], -8) != 0
    for x in (-4, 2, 12):
        assert evaluate(functions[1][0], x) == 0
        assert evaluate(functions[1][1], x) != 0
    print('Second-family self certificate: 8 coordinate identities and degree-624 resultant proved by 625 exact determinants;')
    print('exact removal identity and rational-root exclusions passed')


if __name__ == '__main__':
    run_checks()
