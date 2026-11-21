"""Exact normalization and symbolic-identity checks for the E835 cubic note.

This is a check of a limited necessary-condition barrier. It neither searches
for a coloring nor certifies a bounty solution. Run with Python 3 and SymPy.
"""

from fractions import Fraction
from itertools import combinations
from math import comb, factorial
import json
from pathlib import Path

import sympy as S

from check_erdos835_hyperdet import DELTA, moments, power_delta


def compare_projector_and_coefficients(k):
    poly = power_delta(k // 2)
    vertices = [sum(1 << j for j in v)
                for v in combinations(range(2 * k), k)]
    p = k + 1
    a_set = (1 << k) - 1
    kernel = [Fraction((-1) ** j, p * comb(k, j))
              for j in range(k + 1)]
    ea = [kernel[(a_set & v).bit_count()] for v in vertices]
    theta = Fraction(2, p * p * (k + 2))
    checked = 0
    for distance in range(k + 1):
        b_set = ((1 << (k - distance)) - 1
                 | ((1 << distance) - 1) << k)
        cells = [[j for j in range(2 * k)
                  if bool(a_set & (1 << j)) == a
                  and bool(b_set & (1 << j)) == b]
                 for a, b in ((1, 1), (1, 0), (0, 1), (0, 0))]
        eb = [kernel[(b_set & v).bit_count()] for v in vertices]
        for a in range(len(cells[0]) + 1):
            for b in range(len(cells[1]) + 1):
                for c in range(len(cells[2]) + 1):
                    d = k - a - b - c
                    if not 0 <= d <= len(cells[3]):
                        continue
                    c_set = sum(1 << j
                                for cell, size in zip(cells, (a, b, c, d))
                                for j in cell[:size])
                    venn = tuple(sum(
                        ((int(bool(a_set & (1 << j))) << 2)
                         | (int(bool(b_set & (1 << j))) << 1)
                         | int(bool(c_set & (1 << j)))) == idx
                        for j in range(2 * k)) for idx in range(8))
                    tensor = sum(x * y * kernel[(c_set & v).bit_count()]
                                 for x, y, v in zip(ea, eb, vertices))
                    coefficient_r = moments(k, venn, poly)[1]
                    assert tensor / theta == coefficient_r
                    checked += 1
    return {'k': k, 'triple_orbits_compared': checked}


def short_coefficient(a, b, m):
    terms = [(exponent, coefficient)
             for exponent, coefficient in DELTA.items()
             if exponent != (2, 0, 0, 0, 0, 0, 0, 2)]
    target = (2-b, 2-b, b, a, 2-a, 2-a)
    contributions = []

    def walk(idx, remaining, used, end0, end7, factor):
        if idx == len(terms):
            if (any(remaining) or 2*used-end0 != 4-b
                    or 2*used-end7 != 4-a):
                return
            contributions.append(S.prod(m-j for j in range(used)) * factor)
            return
        exponent, coefficient = terms[idx]
        maximum = min(remaining[j] // exponent[j+1]
                      for j in range(6) if exponent[j+1])
        for copies in range(maximum + 1):
            walk(idx+1,
                 tuple(remaining[j]-copies*exponent[j+1] for j in range(6)),
                 used+copies, end0+copies*exponent[0], end7+copies*exponent[7],
                 factor*S.Rational(coefficient**copies, factorial(copies)))

    walk(0, target, 0, 0, 0, S.Integer(1))
    return S.factor(sum(contributions)), len(contributions)


def symbolic_checks():
    k, x, m = S.symbols('k x m')
    expected = [m*(m-1)*(2*m-7)*(2*m-5),
                8*m*(m-1)*(2*m-5), 8*m*(m-1),
                -4*m*(m-1)*(2*m-11)]
    rows = []
    for (a, b), expected_coefficient in zip(
            ((0, 0), (0, 1), (0, 2), (1, 1)), expected):
        coefficient, count = short_coefficient(a, b, m)
        assert S.expand(coefficient-expected_coefficient) == 0
        internal = (2-b, 2-b, b, a, 2-a, 2-a)
        r = S.factor(coefficient.subs(m, k/2)
                     * S.prod(factorial(t) for t in internal)
                     / (S.prod(k-j for j in range(4-b))
                        * S.prod(k-j for j in range(4-a))))
        distances = (2, 2, 4-a-b)
        es = [S.Rational((-1)**d*factorial(d))
              / S.prod(k-j for j in range(d)) for d in distances]
        t = S.factor((1+k*sum(es)+k*(k-1)*r)/(k+1)**2)
        pairs = [S.factor((1+k*e)/(k+1)-t) for e in es]
        u = S.factor(k*(k-1)*(1-sum(es)+2*r)/(k+1)**2)
        assert S.factor(t+sum(pairs)+u-1) == 0
        # A polynomial with nonnegative coefficients in k-4 is nonnegative
        # for k>=4. This also checks all rational numerators/denominators.
        for value in [t] + pairs + [u]:
            numerator, denominator = S.fraction(value)
            assert all(v >= 0 for v in S.Poly(
                S.expand(numerator.subs(k, x+4)), x).all_coeffs())
            assert all(v >= 0 for v in S.Poly(
                S.expand(denominator.subs(k, x+4)), x).all_coeffs())
            assert denominator.subs(k, 4) > 0
        rows.append({'a': a, 'b': b, 'coefficient_terms': count,
                     'coefficient': str(coefficient), 'R': str(r),
                     'probabilities': list(map(str, [t]+pairs+[u]))})

    general_difference = S.factor(
        1-18/((k-1)*(k-2))
        -18*(k*k+3*k+4)/(k*(k-1)*(k-2)**2)-6/(k-5))
    numerator = S.fraction(general_difference)[0]
    shifted = S.Poly(S.expand(numerator.subs(k, x+14)), x)
    assert shifted.as_expr() == (
        x**5+54*x**4+1091*x**3+9828*x**2+34362*x+12204)
    endpoint = S.expand(((k-2)*(k-3)*(k-4)
                         -10*(k-5)*(k+2)).subs(k, x+16))
    assert endpoint == x**3+29*x**2+216*x+204

    # Verify the quartic's three lowering and three raising derivations.
    variables = S.symbols('x0:8')
    delta = sum(c*S.prod(v**power for v, power in zip(variables, exponent))
                for exponent, c in DELTA.items())
    for bit in (1, 2, 4):
        down = sum(variables[i]*S.diff(delta, variables[i+bit])
                   for i in range(8) if not i & bit)
        up = sum(variables[i+bit]*S.diff(delta, variables[i])
                 for i in range(8) if not i & bit)
        assert S.expand(down) == 0
        assert S.expand(up) == 0
    return {'short_geometry_rows': rows,
            'general_sign_difference_shifted_numerator': str(shifted.as_expr()),
            'eigenvalue_endpoint_shifted_difference': str(endpoint),
            'hyperdeterminant_derivations_checked': 6}


if __name__ == '__main__':
    result = {
        'scope': 'Normalization and algebra audit; no coloring or bounty solution',
        'direct_comparisons': [compare_projector_and_coefficients(k)
                               for k in (2, 4, 6)],
        'symbolic_checks': symbolic_checks(),
    }
    destination = Path(__file__).with_name('erdos835-cubic-barrier-verification.json')
    destination.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps({'status': 'passed',
                      'direct_triple_comparisons': sum(
                          row['triple_orbits_compared']
                          for row in result['direct_comparisons']),
                      'short_geometries_verified_symbolically': 4,
                      'output': str(destination)}, indent=2))
