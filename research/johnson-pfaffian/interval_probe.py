"""Exact diagnostics for a proposed interval-multiplication strengthening.

For every interval I choose t_I >= 1 and put A_ij=product_{I contains i,j}t_I.
No finite positive output of this script proves Johnson's conjecture.
"""
from collections import defaultdict
from functools import lru_cache
from itertools import product
from math import comb
import random
import time


@lru_cache(None)
def matchings(vertices):
    if not vertices:
        return ((1, ()),)
    i = vertices[0]
    out = []
    for k, j in enumerate(vertices[1:], 1):
        rest = vertices[1:k] + vertices[k+1:]
        for sign, m in matchings(rest):
            out.append(((-1)**(k+1)*sign, ((i,j),)+m))
    return tuple(out)


def expansion_check(n, intervals):
    pf, maximum, witnesses = defaultdict(int), defaultdict(int), {}
    for sign, m in matchings(tuple(range(n))):
        exponents = tuple(sum(a <= i < j <= b for i,j in m) for a,b in intervals)
        for powers in product(*(range(e+1) for e in exponents)):
            coef = 1
            for e,p in zip(exponents,powers): coef *= comb(e,p)
            pf[powers] += sign*coef
            if coef > maximum[powers]: maximum[powers] = coef; witnesses[powers] = m
    bad = [(p,pf[p],maximum[p],witnesses[p]) for p in maximum if pf[p]<maximum[p]]
    return len(pf), bad


def evaluate(n, intervals, multipliers):
    a=[[0]*n for _ in range(n)]
    for i in range(n):
        for j in range(i+1,n):
            value=1
            for (s,t),q in zip(intervals,multipliers):
                if s<=i<j<=t: value*=q
            a[i][j]=value
    @lru_cache(None)
    def rec(vertices):
        if not vertices:return 1,1
        i=vertices[0];pf=0;best=0
        for k,j in enumerate(vertices[1:],1):
            p,b=rec(vertices[1:k]+vertices[k+1:])
            pf+=(-1)**(k+1)*a[i][j]*p
            best=max(best,a[i][j]*b)
        return pf,best
    return rec(tuple(range(n)))


def main():
    start=time.monotonic()
    for n in (4,6):
        intervals=[(a,b) for a in range(n) for b in range(a+1,n) if b-a+1<=n-2]
        terms,bad=expansion_check(n,intervals)
        print('coefficient screen',n,'variables',len(intervals),'terms',terms,'bad',len(bad),'sample',bad[:3],flush=True)
    rng=random.Random(261024371)
    for n in (6,8,10,12):
        intervals=[(a,b) for a in range(n) for b in range(a+1,n) if b-a+1<=n-2]
        for sample in range(1000):
            values=[rng.choice((1,1,1,2,3,5)) for _ in intervals]
            pf,best=evaluate(n,intervals,values)
            if pf<best:
                print('COUNTEREXAMPLE TO STRENGTHENING',n,intervals,values,pf,best,flush=True)
                return
        print('interval diagnostic',n,1000,'seconds',time.monotonic()-start,flush=True)
    print('No finite diagnostic is a full proof.',flush=True)


if __name__=='__main__':main()
