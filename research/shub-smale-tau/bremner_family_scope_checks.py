"""Exact scope counterexample: Michael E. Paul's Table 1, entry 4,
reported and credited in Bremner (2008), pp.387--388.

The root example is imported.  The no-four-term/no-eight-term checks
certify its nonmembership in the two displayed elliptic families and
their first-level Hadamard transforms, up to scaling and root labels.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations

ROOTS = (5093, 9217, 9677, 4153, 8473, 6253, 3167, 10043)


def check():
    roots = ROOTS
    assert len(set(roots)) == 8 and min(roots) > 0
    pairs = list(zip(roots[::2], roots[1::2]))
    sums = [a*a+b*b for a, b in pairs]
    assert sums == [110891738]*4
    a, b, c, d, e, f, g, h = roots
    assert a*a*b*b+c*c*d*d == e*e*f*f+g*g*h*h
    P = Fraction(sums[0], 2)
    t = [Fraction(a*a-b*b, 2) for a, b in pairs]
    Q = (t[0]**2+t[1]**2)/2
    assert t[2]**2+t[3]**2 == 2*Q
    r1, r2 = (t[0]**2-t[1]**2)/2, (t[2]**2-t[3]**2)/2
    R, S = (r1*r1+r2*r2)/2, (r1*r1-r2*r2)/2
    coefficients = [P, Q, R, S]
    assert all(c.denominator == 1 for c in coefficients)
    P, Q, R, S = map(int, coefficients)
    assert S != 0
    for root in roots:
        assert (((root*root-P)**2-Q)**2-R)**2-S*S == 0

    # Signed relations on four distinct absolute roots: only 2+2 is
    # possible, since any three positive roots exceed the largest.
    assert sum(sorted(roots)[:3]) == 12413 > max(roots)
    pair_sums = sorted(a+b for a, b in combinations(roots, 2))
    assert len(pair_sums) == 28 and len(set(pair_sums)) == 28

    # A signed relation involving all eight roots is equivalent to a
    # subset summing to half the total.  Parity and size force size 4.
    assert all(a % 2 == 1 for a in roots)
    assert sum(roots) == 56076
    half = sum(roots)//2
    assert half == 28038 and half % 2 == 0
    assert sum(sorted(roots)[-2:]) == 19720 < half
    assert Counter(a % 5 for a in roots) == Counter({3: 5, 2: 3})
    # A four-element subset has j elements congruent to 3, with
    # 1 <= j <= 4, and sum congruent to 8+j; none gives half mod 5.
    assert half % 5 == 3
    assert all((8+j) % 5 != half % 5 for j in range(1, 5))
    return {'roots': roots, 'P': P, 'Q': Q, 'R': R, 'S': S,
            'pair_sums': pair_sums,
            'no_signed_four_term_relation': True,
            'no_signed_eight_term_relation': True}


if __name__ == '__main__':
    import json
    print(json.dumps(check(), indent=2))
