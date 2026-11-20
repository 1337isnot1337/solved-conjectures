"""Exact diagnostics for Lin--Ma's full multiset Schett conjecture.

No finite computation in this file is a proof of the conjecture.
The block operator comes from multivariate Lagrange inversion.
"""
from collections import defaultdict
from functools import lru_cache
from math import comb
import sympy as sp


def choose(n, k):
    return comb(n, k) if n >= k >= 0 else 0


@lru_cache(None)
def transition(a, b, c, p):
    """[u^p] X^a Y^b Z^c for X=x+uYZ and cyclic equations."""
    ans = []
    for i in range(p + 1):
        for j in range(p - i + 1):
            k = p - i - j
            exps = (a + p - 2*i, b + p - 2*j, c + p - 2*k)
            if min(exps) < 0:
                continue
            A = [choose(a+p-i, i), choose(b+p-j, j), choose(c+p-k, k)]
            B = [choose(a+p-i-1, i-1), choose(b+p-j-1, j-1), choose(c+p-k-1, k-1)]
            coefficient = (A[0]*A[1]*A[2] - A[0]*B[1]*B[2]
                           - B[0]*A[1]*B[2] - B[0]*B[1]*A[2]
                           - 2*B[0]*B[1]*B[2])
            assert coefficient >= 0
            if coefficient:
                ans.append((exps, coefficient))
    return tuple(ans)


def insert(polynomial, multiplicity):
    ans = defaultdict(int)
    for (a,b,c), coefficient in polynomial.items():
        for exps, factor in transition(a,b,c,multiplicity):
            ans[exps] += coefficient*factor
    return dict(ans)


def schett(composition):
    ans = {(1,0,0): 1}
    for p in composition:
        ans = insert(ans, p)
    return ans


def reduced(polynomial):
    ans = defaultdict(int)
    for exps, coefficient in polynomial.items():
        ans[tuple(e//2 for e in exps)] += coefficient
    return dict(ans)


def slices(polynomial):
    t = sp.Symbol('t')
    result = defaultdict(lambda: 0)
    for (a,b,c), coefficient in reduced(polynomial).items():
        result[a] += coefficient*t**b
    return {a:sp.Poly(f,t) for a,f in result.items()}


def total_formula(composition):
    total, value = 0, 1
    for p in composition:
        total += p
        value *= comb(total+p, p)
    return value//(total+1)


def exact_real_rooted(f):
    return sum(multiplicity * factor.count_roots(-sp.oo, sp.oo)
               for factor,multiplicity in f.sqf_list()[1]) == f.degree()


if __name__ == '__main__':
    x,y,z,t = sp.symbols('x y z t')
    # Independently generate the defining formal series to order four.
    series = [[x],[y],[z]]
    for p in range(1,5):
        new = [sp.expand(sum(series[(v+1)%3][j]*series[(v+2)%3][p-1-j]
                             for j in range(p))) for v in range(3)]
        for row,coefficient in zip(series,new):
            row.append(coefficient)
    for v,exps in enumerate([(1,0,0),(0,1,0),(0,0,1)]):
        for p in range(5):
            direct = series[v][p]
            formula = sum(value*x**a*y**b*z**c for (a,b,c),value in transition(*exps,p))
            assert sp.expand(direct-formula) == 0
    print('Defining-series coefficient checks passed through order four.')
    for composition in [(2,2),(4,),(5,),(6,),(1,1,1,1),(2,3),(3,2)]:
        polynomial = schett(composition)
        assert sum(polynomial.values()) == total_formula(composition)
        f = sum(coefficient*x**a*y**b*z**c for (a,b,c),coefficient in reduced(polynomial).items())
        print(composition, sp.expand(f), flush=True)
        for Y,Z in [(1,-1),(1,-2),(2,-1),(-1,-2),(1,2)]:
            q = sp.Poly(f.subs({x:t,y:Y,z:Z}),t)
            if q and not exact_real_rooted(q):
                print('STABILITY OBSTRUCTION', composition,Y,Z,q.as_expr(), flush=True)
    A,B,C,U,V,W = sp.symbols('A B C U V W')
    symbol = (A*(B+C)+(2*B+2*C+3*A)*U+(B+2*C+4*A)*V
              +(2*B+C+4*A)*W+2*(U+V+W)**2)
    assert sp.expand(symbol.subs({A:t,B:1+t,C:-1+t,U:t,V:-1+t,W:1+t})) == 2+41*t**2
    print('Unrestricted differential-symbol obstruction checked exactly.')
