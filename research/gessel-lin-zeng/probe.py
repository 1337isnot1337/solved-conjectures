"""Exact recurrence and tests of stronger routes to the GLZ conjecture.

This script does not prove the conjecture. The insertion recurrence is exact;
the small specializations only test candidate invariants.
"""
from math import comb, factorial
import sympy as sp

x, y = sp.symbols('x y')


def insert(p, length):
    """Insert a new largest letter into a word of the given length."""
    return sp.Poly((1 + length*x)*p.as_expr()
                   + x*(1-x)*p.diff().as_expr(), x)


def rows(bound):
    zero = sp.Poly(0, x)
    row = [sp.Poly(1, x)]
    yield row
    for k in range(1, bound+1):
        old = row
        row = []
        for i in range(k+1):
            retained = insert(old[i], 3*k-3-i) if i < len(old) else zero
            deleted = old[i-1] if i else zero
            row.append(insert(retained+deleted, 3*k-2-i))
        yield row


def bivariate(row, weights):
    k = len(row)-1
    if weights == 'binomial':
        weight = lambda i: comb(k, i)
    elif weights == 'factorial':
        weight = lambda i: sp.Rational(1, factorial(i))
    elif weights == 'plain':
        weight = lambda i: 1
    else:
        raise ValueError(weights)
    return sp.Add(*(weight(i)*p.as_expr()*y**i for i,p in enumerate(row)))


def real_roots(p):
    return sp.Poly(p, x).count_roots(-sp.oo, sp.oo)


if __name__ == '__main__':
    table = list(rows(4))
    assert table[1] == [sp.Poly(1+x, x), sp.Poly(1, x)]
    assert table[2] == [sp.Poly(1+14*x+21*x*x+4*x**3, x),
                        sp.Poly(2+12*x+6*x*x, x), sp.Poly(1+2*x, x)]
    plain = bivariate(table[2], 'plain')
    discriminant = sp.factor(sp.discriminant(plain, y))
    assert discriminant == 4*x*(x**3-10*x*x-7*x-4)
    assert discriminant.subs(x, 1) < 0
    fact = sp.Poly(3*bivariate(table[4], 'factorial').subs(y, -10), x)
    assert list(reversed(fact.all_coeffs())) == [33, -2516, 54434, 84048,
                                                -276249, -171792, 4764, 1728]
    print('Plain weighting fails: discriminant =', discriminant)
    print('Factorial weighting specialization: degree =', fact.degree(),
          '; exact real-root count =', real_roots(fact))
    for k,row in enumerate(table[1:], 1):
        weighted = bivariate(row, 'binomial')
        checks = 0
        for slope in [sp.Rational(1,10), 1, 10]:
            for offset in [-10, -1, 0, 1, 10]:
                p = sp.Poly(weighted.subs(y, slope*x+offset), x)
                # A repeated real root needs multiplicity counted separately.
                total = sum(mult*real_roots(factor)
                            for factor,mult in sp.factor_list(p)[1])
                assert total == p.degree(), (k,slope,offset)
                checks += 1
        print('Binomial weighting: exact small line checks', k, checks)
