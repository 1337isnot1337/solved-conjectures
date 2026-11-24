#!/usr/bin/env python3
"""Exact complementary-prefix certificate for the second Bremner family.

Uses integer coefficient arithmetic, a bounded-degree resultant identity,
two certified congruence lattices, and exact rational gcd fibers.
No floating-point computation or irreducible factorization is required.
"""

from fractions import Fraction
from functools import reduce
from math import gcd, isqrt
from pathlib import Path
import json

from bremner_certificate import (
    add, mul, power, scale, trim, evaluate, product_polynomials,
    determinant_bareiss,
)
from bremner_cross_checks import second_prefix_functions


def sp_add(target, source, coefficient=1, p_shift=0):
    for (i, j), c in source.items():
        key = i, j+p_shift
        target[key] = target.get(key, 0)+coefficient*c
        if not target[key]:
            del target[key]


def sp_shift(source, variable):
    return {(i+(variable == 0), j+(variable == 1)): c
            for (i, j), c in source.items()}


def symmetric_equations():
    # C_k=X^k+T^k and H_k=(X^(k+1)-T^(k+1))/(X-T).
    c = [{(0, 0): 2}, {(1, 0): 1}]
    h = [{(0, 0): 1}, {(1, 0): 1}]
    for sequence in (c, h):
        for _ in range(2, 29):
            value = sp_shift(sequence[-1], 0)
            sp_add(value, sp_shift(sequence[-2], 1), -1)
            sequence.append(value)
    (a, d), (b, e) = second_prefix_functions()
    a, d = a+[0]*(15-len(a)), d+[0]*(15-len(d))
    b, e = b+[0]*(29-len(b)), e+[0]*(29-len(e))
    f, g = {}, {}
    for i in range(15):
        sp_add(f, {(0, i): 1}, 2*a[i]*d[i]-d[i]*d[i])
        for j in range(i):
            sp_add(f, c[i-j], a[i]*d[j]+a[j]*d[i]-d[i]*d[j], j)
    for i in range(29):
        for j in range(i):
            sp_add(g, h[i-j-1], b[i]*e[j]-b[j]*e[i], j)
    normalized = []
    for value in (f, g):
        content = reduce(gcd, value.values())
        assert content > 0
        normalized.append({key: coefficient//content for key, coefficient in value.items()})
    assert [max(i+j for i, j in v) for v in normalized] == [14, 27]
    assert [max(j for i, j in v) for v in normalized] == [14, 26]
    assert [len(v) for v in normalized] == [120, 405]
    return normalized


def specialize_s(polynomial, s):
    out = [0]*(max(j for i, j in polynomial)+1)
    for (i, j), coefficient in polynomial.items():
        out[j] += coefficient*s**i
    return out


def resultant_at(s, f, g):
    a, b = specialize_s(f, s), specialize_s(g, s)
    assert len(a) == 15 and len(b) == 27
    matrix = [[0]*40 for _ in range(40)]
    for column in range(26):
        for i, coefficient in enumerate(a):
            matrix[i+column][column] = coefficient
    for column in range(14):
        for i, coefficient in enumerate(b):
            matrix[i+column][26+column] = coefficient
    return determinant_bareiss(matrix)


def dot(a, b):
    return a[0]*b[0]+a[1]*b[1]


def check_lattice_exclusion(coefficients, certificate):
    # Ascending coefficients; leading coefficient nonzero modulo p means
    # a reduced rational root has denominator prime to p.
    assert certificate['degree'] == len(coefficients)-1 == 164
    p = certificate['prime']
    assert p == 11 and coefficients[-1] % p and coefficients[0]
    height = max(abs(coefficients[0]), abs(coefficients[-1]))
    assert height == int(certificate['height_bound'])
    roots = [x for x in range(p) if evaluate(coefficients, x) % p == 0]
    assert roots == certificate['roots_mod_prime'] == [1, 5]
    derivative = [i*coefficients[i] for i in range(1, len(coefficients))]
    assert all(evaluate(derivative, x) % p for x in roots)
    assert [b['root_mod_prime'] for b in certificate['branches']] == roots
    for branch in certificate['branches']:
        modulus, residue = int(branch['modulus']), int(branch['lift'])
        assert modulus > 2*height*height and 0 <= residue < modulus
        remaining = modulus
        while remaining % p == 0:
            remaining //= p
        assert remaining == 1
        assert residue % p == branch['root_mod_prime']
        # Simple roots lift uniquely to each p-power; checking the final
        # residue suffices to identify the lift of any rational root.
        value = 0
        for coefficient in reversed(coefficients):
            value = (value*residue+coefficient) % modulus
        assert value == 0
        a, b = [tuple(map(int, v)) for v in branch['basis']]
        assert abs(a[0]*b[1]-a[1]*b[0]) == modulus
        assert (a[0]-residue*a[1]) % modulus == 0
        assert (b[0]-residue*b[1]) % modulus == 0
        assert 0 < dot(a, a) <= dot(b, b)
        assert 2*abs(dot(a, b)) <= dot(a, a)
        # These are the exact two-dimensional Gauss-reduction conditions;
        # the note proves that a is a shortest nonzero lattice vector.
        assert dot(a, a) > 2*height*height
        assert branch['exclusion'] == 'shortest_norm_exceeds_box_bound'
    assert certificate['rational_roots'] == []


def polynomial_remainder(a, b):
    a, b = trim(list(map(Fraction, a))), trim(list(map(Fraction, b)))
    assert b != [0]
    while a != [0] and len(a) >= len(b):
        k, coefficient = len(a)-len(b), a[-1]/b[-1]
        for j, value in enumerate(b):
            a[k+j] -= coefficient*value
        a = trim(a)
    return a


def polynomial_gcd(a, b):
    a, b = trim(a), trim(b)
    while b != [0]:
        a, b = b, polynomial_remainder(a, b)
    assert a != [0]
    return scale(a, Fraction(1, 1)/a[-1])


def check_fibers(f, g, fibers, rational_sums):
    assert set(item['sum'] for item in fibers) == rational_sums
    candidates = []
    for item in fibers:
        s = item['sum']
        coefficients = [int(c) for c in reversed(item['gcd_coefficients'])]
        assert polynomial_gcd(specialize_s(f, s), specialize_s(g, s)) == coefficients
        factors = []
        for factor in item['factors']:
            v = [int(c) for c in reversed(factor['coefficients'])]
            factors.append(power(v, factor['exponent']))
            if len(v) == 3:
                discriminant = v[1]*v[1]-4*v[2]*v[0]
                assert discriminant < 0 or isqrt(discriminant)**2 != discriminant
            else:
                assert len(v) == 2
                p = -Fraction(v[0], v[1])
                discriminant = s*s-4*p
                if discriminant == 0:
                    assert s == -16 and p == 64
                    candidates.append(Fraction(s, 2))
                else:
                    assert discriminant.denominator == 1
                    d = discriminant.numerator
                    assert d < 0 or isqrt(d)**2 != d
        assert product_polynomials(factors) == coefficients
    assert candidates == [-8]
    qn, qd = second_prefix_functions()[0]
    assert evaluate(qd, -8) == 0 and evaluate(qn, -8) != 0


def run_checks():
    root = Path(__file__).parent
    data = json.loads((root/'bremner_complement_certificate.json').read_text())
    equations = json.loads((root/'bremner_complement_equations.json').read_text())
    lattice = json.loads((root/'bremner_complement_root_certificate.json').read_text())
    fibers = json.loads((root/'bremner_complement_fibers.json').read_text())
    f, g = symmetric_equations()
    (qn, qd), (rn, _) = second_prefix_functions()
    assert polynomial_gcd(qn, rn) == [1]
    assert polynomial_gcd(add(qn, scale(qd, -1)), rn) == [4, -4, 1]
    assert f == {tuple(m): int(c) for m, c in equations['F']}
    assert g == {tuple(m): int(c) for m, c in equations['G']}
    raw = [int(c) for c in reversed(data['coefficients'])]
    assert data['degree'] == len(raw)-1 == 374 and raw[-1] > 0
    assert reduce(gcd, raw) == 1
    scalar = int(data['resultant_content'])
    assert scalar != 0
    factors, rational_sums = [], set()
    large_factor_count = 0
    for item in data['squarefree_analysis']:
        coefficients = [int(c) for c in reversed(item['coefficients'])]
        assert len(coefficients)-1 == item['degree'] and coefficients[-1]
        assert isinstance(item['exponent'], int) and item['exponent'] > 0
        factors.append(power(coefficients, item['exponent']))
        if item['degree'] == 1:
            rational_sums.add(-Fraction(coefficients[0], coefficients[1]))
        elif item['degree'] == 164:
            large_factor_count += 1
            check_lattice_exclusion(coefficients, lattice)
        else:
            assert item['degree'] == 2
            p = item['root_free_prime']
            assert p in (3, 7) and coefficients[-1] % p
            values = [evaluate(coefficients, x) % p for x in range(p)]
            assert values == item['values_mod_prime'] and all(values)
    assert large_factor_count == 1
    assert scale(product_polynomials(factors), int(data['analysis_content'])) == raw
    assert rational_sums == {-16, -10, -4, 0, 4, 6, 8}
    check_fibers(f, g, fibers, rational_sums)

    # Total degrees 14,27 and p-degrees 14,26 give degree at most
    # 26*14+14*27-14*26=378 in s for the fixed Sylvester determinant.
    # Its candidate has degree 374, so equality at 379 points proves it.
    for s in range(379):
        assert resultant_at(s, f, g) == scalar*evaluate(raw, s)
    print('Complement certificate: exact symmetric equations, 379 Sylvester determinants,')
    print('two shortest-vector exclusions and all seven rational fibers passed')


if __name__ == '__main__':
    run_checks()
