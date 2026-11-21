#!/usr/bin/env python3
"""Exact supplementary checks for the circular interval-product proof.

The universal proof is in PROOF.md. These finite checks catch conventions,
indexing errors, and sign mistakes; they are not a proof by enumeration.
Only the Python standard library is used.
"""
from fractions import Fraction as F
from functools import lru_cache
from itertools import product
from math import isqrt
import json
import random


def pfaffian(a, vertices=None):
    if vertices is None:
        vertices = tuple(range(len(a)))
    @lru_cache(None)
    def rec(v):
        if not v:
            return F(1)
        i = v[0]
        return sum((-1)**(k+1)*a[i][j]*rec(v[1:k]+v[k+1:])
                   for k,j in enumerate(v[1:],1))
    return rec(tuple(vertices))


def matrix(n, factors):
    a = [[F(0) for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(i+1,n):
            a[i][j] = F(1)
            for support,t in factors:
                if i in support and j in support:
                    a[i][j] *= t
    return a


def edge(a, i, j):
    return a[min(i,j)][max(i,j)]


def rotated_gauge(n, factors, cut):
    order = list(range(cut,n))+list(range(cut))
    gauge = [F(1) for _ in range(n)]
    ordinary = []
    for support,t in factors:
        support = frozenset(i for i,v in enumerate(order) if v in support)
        if support and max(support)-min(support)+1 != len(support):
            root = isqrt(t)
            assert root*root == t
            for i in range(n):
                gauge[i] *= F(root) if i in support else F(1,root)
            support = frozenset(range(n))-support
        assert not support or max(support)-min(support)+1 == len(support)
        ordinary.append((support,t))
    return order,gauge,matrix(n,ordinary)


def interval_coefficients(a):
    n=len(a)
    def entry(i,j):
        return F(0) if i<0 or j>=n else a[i][j]
    return {(i,j):entry(i,j)-entry(i-1,j)-entry(i,j+1)+entry(i-1,j+1)
            for i in range(n) for j in range(i+1,n)}


def main():
    count={'gauge_exponent_patterns':0,'uncrossing_patterns':0,
           'circular_matrices':0,'cyclic_gauges':0,'adjacent_pair_checks':0,
           'log_kernel_reconstructions':0}
    for u,v in product((0,1),repeat=2):
        assert u*v == (F(u)-F(1,2))+(F(v)-F(1,2))+(1-u)*(1-v)
        count['gauge_exponent_patterns']+=1
    for bits in product((0,1),repeat=4):
        if bits in ((0,1,0,1),(1,0,1,0)):
            continue
        i,j,k,l=bits
        assert i*j+k*l >= i*k+j*l
        count['uncrossing_patterns']+=1
    rng=random.Random(261024371)
    for n in (2,4,6,8):
        supports={frozenset((start+j)%n for j in range(length))
                  for start in range(n) for length in range(2,n+1)}
        supports=sorted(supports,key=lambda s:(len(s),tuple(sorted(s))))
        for sample in range(6):
            factors=[(support,rng.choice((1,1,4,9))) for support in supports]
            a=matrix(n,factors); p=pfaffian(a)
            count['circular_matrices']+=1
            for cut in range(n):
                order,gauge,b=rotated_gauge(n,factors,cut)
                for i in range(n):
                    for j in range(i+1,n):
                        assert edge(a,order[i],order[j])==gauge[i]*gauge[j]*b[i][j]
                assert all(v>=0 for v in interval_coefficients(b).values())
                scale=F(1)
                for d in gauge:scale*=d
                assert p==scale*pfaffian(b)
                count['cyclic_gauges']+=1
                u,v=order[0],order[-1]
                remainder=tuple(i for i in range(n) if i not in (u,v))
                assert p>=edge(a,u,v)*pfaffian(a,remainder)
                count['adjacent_pair_checks']+=1
        for sample in range(8):
            points=[0]
            for _ in range(n-1):points.append(points[-1]+rng.randint(1,4))
            hinges=[(rng.randint(1,points[-1]+3),rng.randint(1,3)) for _ in range(4)]
            def g(d):return sum(weight*max(knot-d,0) for knot,weight in hinges)
            diameter=points[-1]-points[0]
            logs=[[0]*n for _ in range(n)]
            for i in range(n):
                for j in range(i+1,n):logs[i][j]=g(points[j]-points[i])-g(diameter)
            coefficients=interval_coefficients(logs)
            assert all(v>=0 for v in coefficients.values())
            for i in range(n):
                for j in range(i+1,n):
                    assert logs[i][j]==sum(v for (a,b),v in coefficients.items() if a<=i<j<=b)
            count['log_kernel_reconstructions']+=1
    print(json.dumps({'status':'PASS','role':'supplementary exact identities and indexing checks',
                      'counts':count,'finite_checks_prove_universal_claim':False},indent=2))


if __name__=='__main__':main()
