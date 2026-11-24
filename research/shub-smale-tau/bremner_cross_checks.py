#!/usr/bin/env python3
"""Exact certificates for the displayed cross-family square-chain test."""

from fractions import Fraction
from math import isqrt
from pathlib import Path
import json

from bremner_certificate import (
    Pair, add, mul, scale, power, evaluate, product_polynomials,
    rational_functions, determinant_bareiss,
)


def second_prefix_functions():
    b6 = list(reversed([5, 8, 64, 768, 6016, 3072, 2048]))
    b7 = list(reversed([1, -5, -16, 224, -512, -2496, 10752, 29696]))
    b18 = list(reversed([
        1, 15, 176, -296, -5920, -8576, -130624, 322560,
        2641920, -23879680, 23539712, 689176576, 1017970688,
        1470103552, 18634506240, 56803459072, 65875738624,
        30802968576, 5435817984,
    ]))
    ell = product_polynomials([[8, 1], [16, 0, 1], [32, -8, 1], [8, 4, 1]])
    qn, qd = scale(mul(b6, b7), 4), power(ell, 2)
    rn = scale(product_polynomials([
        power([-12, 1], 2), power([-2, 1], 4), power([4, 1], 2), b18]), 256)
    return (qn, qd), (rn, power(ell, 4))


def second_functions():
    zn = scale(product_polynomials([
        [0, 0, 1], power([-12, 1], 4), power([-2, 1], 8),
        power([3, 1], 2), power([4, 1], 4), power([4, 3], 2),
        power([-24, 0, 1], 2), power([-16, -4, 1], 2),
        power([32, 8, -4, 1], 2), [112, -8, -1, 1],
        power([32, 72, 4, 1], 2),
    ]), 262144)
    zd = product_polynomials([
        power([8, 1], 6), power([16, 0, 1], 6),
        power([32, -8, 1], 8), power([8, 4, 1], 8),
    ])
    return second_prefix_functions()+((zn, zd),)


def check_second_construction():
    previous = Pair.relation
    Pair.relation = [112, -8, -1, 1]
    try:
        u, v = Pair([0, 1]), Pair(0, 1)
        a = u*v-2*u*u-2*u-8
        b = (v-10)*(u+4)
        c = (2-u)*(u+4)
        assert (3*a*a*b-4*a*b*b+b**3+
                (a*a-14*a*b+9*b*b)*c+10*(a+b)*c*c).is_zero()
        A = a*a*b-a*b*b+(3*a-7*b)*c*c
        B = c*(a*a+2*a*b-b*b+10*c*c)
        C = a*a*b-a*b*b+(7*a-3*b)*c*c
        D = -c*(a*a-2*a*b-b*b-10*c*c)
        E = -c*(a*a+b*b+2*(a+b)*c-10*c*c)
        F = -2*a*a*b+3*a*b*b-b**3-(a*a-8*a*b+7*b*b)*c-(a+3*b)*c*c
        G = -c*(a*a+b*b-2*(a+b)*c-10*c*c)
        H = -a*a*b+a*b*b+(6*a*b-2*b*b)*c+(3*a-11*b)*c*c
        pn = A*A+B*B
        assert (pn-C*C-D*D).is_zero()
        assert (pn-E*E-F*F).is_zero()
        assert (pn-G*G-H*H).is_zero()
        assert (A*A*B*B+C*C*D*D-E*E*F*F-G*G*H*H).is_zero()
        aa, cc, ee, gg = 2*A*A-pn, 2*C*C-pn, 2*E*E-pn, 2*G*G-pn
        qn = aa*aa+cc*cc
        t1, t2 = aa*aa-cc*cc, ee*ee-gg*gg
        rn, sn = t1*t1+t2*t2, t1*t1-t2*t2
        for (n, d), numerator, denominator in zip(
                second_functions(), (qn, rn, sn*sn),
                (2*pn**2, 8*pn**4, 64*pn**8)):
            assert (numerator*Pair(d)-denominator*Pair(n)).is_zero()
    finally:
        Pair.relation = previous


def cross_resultant_at(w, first_functions, second_functions):
    equations = []
    for (n1, d1), (n2, d2) in zip(first_functions, second_functions):
        equations.append(add(scale(d2, evaluate(n1, w)),
                             scale(n2, -evaluate(d1, w))))
    a, b = equations
    a += [0]*(15-len(a))
    b += [0]*(29-len(b))
    assert len(a) == 15 and len(b) == 29
    matrix = [[0]*42 for _ in range(42)]
    for column in range(28):
        for i, coefficient in enumerate(a):
            matrix[i+column][column] = coefficient
    for column in range(14):
        for i, coefficient in enumerate(b):
            matrix[i+column][28+column] = coefficient
    return determinant_bareiss(matrix)


def run_checks():
    check_second_construction()
    data = json.loads(Path(__file__).with_name('bremner_cross_certificate.json').read_text())
    assert data['degree'] == 308
    scalar = Fraction(data['constant'])
    assert scalar != 0
    factors, residues_checked, rational_candidates = [], 0, []
    degree = 0
    for item in data['factors']:
        coefficients = [int(c) for c in reversed(item['coefficients'])]
        assert len(coefficients)-1 == item['degree'] and coefficients[-1]
        exponent = item['exponent']
        assert isinstance(exponent, int) and exponent >= 1
        degree += item['degree']*exponent
        factors.append((coefficients, exponent))
        if item['degree'] == 1:
            rational_candidates.append(-Fraction(coefficients[0], coefficients[1]))
        else:
            p = item['root_free_prime']
            assert p >= 2 and all(p % d for d in range(2, isqrt(p)+1))
            assert coefficients[-1] % p
            values = [evaluate(coefficients, a) % p for a in range(p)]
            assert values == item['values_mod_prime'] and all(values)
            residues_checked += p
    assert degree == 308
    assert set(rational_candidates) == {Fraction(-10), Fraction(20), Fraction(5, 4)}
    first_functions = rational_functions()[:2]
    second_functions = second_prefix_functions()
    assert tuple(max(len(n), len(d))-1 for n, d in first_functions) == (5, 12)
    assert tuple(max(len(n), len(d))-1 for n, d in second_functions) == (14, 28)
    assert all(n[-1] and d[-1] for n, d in first_functions+second_functions)
    # Bidegrees (5,14) and (12,28) give a resultant degree at most 308.
    # Both sides are polynomials of degree at most 308, so 309 exact
    # determinant comparisons prove their identity over the integers.
    for w in range(309):
        expected = scalar
        for coefficients, exponent in factors:
            expected *= evaluate(coefficients, w)**exponent
        assert cross_resultant_at(w, first_functions, second_functions) == expected
    w = Fraction(5, 4)
    assert w**3-16*w*w+100*w == 29*Fraction(15, 8)**2
    assert isqrt(29)**2 != 29
    print('Cross-family certificate: 8 coordinate-ring identities, degree-308')
    print(f'resultant proved by 309 exact determinants, {residues_checked} modular residues passed')


if __name__ == '__main__':
    run_checks()
