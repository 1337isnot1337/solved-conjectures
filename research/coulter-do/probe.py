"""Exact Corollary 4.16 recursion; exploratory, not a proof of Conjecture C.

Normalize H_(r/2,n)(mu;b,t) = (b+1)^(n-1+floor(r/2))
    * b^(r mod 2) * P_(r,mu)(b^2/(b+1),t).
All calculations in QQ[z,t].
"""
from functools import lru_cache
from collections import Counter
from itertools import product
from math import comb, prod
import sympy as sp
from sympy.polys.rings import ring
from sympy.polys.domains import QQ

R, z, t = ring('z,t', QQ)
zs, ts, bs = sp.symbols('z t b')

@lru_cache(None)
def splits(mu):
    counts = sorted(Counter(mu).items(), reverse=True)
    out = []
    for ns in product(*(range(c+1) for _,c in counts)):
        a = tuple(v for (v,c),k in zip(counts,ns) for _ in range(k))
        b = tuple(v for (v,c),k in zip(counts,ns) for _ in range(c-k))
        weight = prod(comb(c,k) for (_,c),k in zip(counts,ns))
        out.append((a,b,weight))
    return tuple(out)

def P(r, mu):
    if r < 0 or not mu or min(mu) <= 0:
        return R.zero
    return _P(r, tuple(sorted(mu,reverse=True)))

@lru_cache(None)
def _P(r, mu):
    if mu == (1,):
        return R.one if r == 0 else R.zero
    m, tail = mu[0], mu[1:]
    ans = R.zero
    for v, multiplicity in Counter(tail).items():
        rest = list(tail)
        rest.remove(v)
        ans += multiplicity * (m+v) * P(r,(m+v,*rest))
    for a in range(1,m):
        b = m-a
        bracket = P(r-2,(a,b,*tail))
        for i,j,weight in splits(tail):
            for r1 in range(r+1):
                r2 = r-r1
                factor = z if r1%2 and r2%2 else R.one
                bracket += weight * factor * P(r1,(a,*i)) * P(r2,(b,*j))
        ans += a*b*bracket
    if r > 0:
        ans += (z if r%2 == 0 else R.one)*m*(m-1)*P(r-1,mu)
    if m > 1:
        ans += (t-1)*(m-1)*P(r,(m-1,*tail))
    return ans / m

def H(r,mu):
    n = len(mu)
    return sp.expand((bs+1)**(n-1+r//2)*bs**(r%2)
                     *P(r,mu).as_expr().subs(zs,bs**2/(bs+1)))

def partitions(n,hi=None):
    if n == 0:
        yield ()
        return
    if hi is None or hi > n:
        hi = n
    for first in range(hi,0,-1):
        for rest in partitions(n-first,first):
            yield (first,*rest)

def table_check():
    examples = [
      (0,(6,), (t**5+10*t**4+20*t**3+10*t**2+t)/6),
      (1,(6,), (15*t**5+135*t**4+262*t**3+135*t**2+15*t)/6),
      (2,(4,), ((25*z+15)*t**3+(68*z+40)*t**2+(25*z+15)*t)/4),
      (3,(4,), ((90*z+127)*t**3+(238*z+332)*t**2+(90*z+127)*t)/4),
      (2,(2,2), ((86*z+50)*t**3+(220*z+128)*t**2+(86*z+50)*t)/4),
      (2,(2,1,1), ((236*z+140)*t**3+(628*z+368)*t**2+(236*z+140)*t)/2),
    ]
    for r,mu,expected in examples:
        assert P(r,mu) == expected, (r,mu,P(r,mu),expected)
    print('PASS: six independent source table entries.',flush=True)

if __name__ == '__main__':
    table_check()
    for r in range(5):
        for m in range(2,7):
            print('r,mu,P',r,(m,),P(r,(m,)),flush=True)
