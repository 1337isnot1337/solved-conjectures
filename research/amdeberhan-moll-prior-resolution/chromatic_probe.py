#!/usr/bin/env python3
"""Exact discovery for Amdeberhan--Moll Conjecture 21, not a proof by screens.

All polynomial coefficients and L iterates use integers. The theta formula is
derived by conditioning on whether the two common endpoints have equal colors.
"""
from math import comb
from itertools import combinations_with_replacement
import argparse
import json
import random
import time


def mul(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j]+=x*y
    return c


def add(a,b):
    c=[0]*max(len(a),len(b))
    for i,x in enumerate(a): c[i]+=x
    for i,x in enumerate(b): c[i]+=x
    return c


def theta(lengths):
    # A_l(q) counts a path with one specified same-color endpoint pair;
    # B_l(q) counts a path with one specified unequal-color endpoint pair.
    # A=((q-1)^l+(q-1)(-1)^l)/q, B=((q-1)^l-(-1)^l)/q.
    A=[1]
    B=[1]
    for ell in lengths:
        assert ell>=2
        c=[comb(ell,j)*(-1)**(ell-j) for j in range(ell+1)]
        aa=c.copy()
        aa[0]-=(-1)**ell
        aa[1]+=(-1)**ell
        bb=c.copy()
        bb[0]-=(-1)**ell
        assert aa[0]==bb[0]==0
        A=mul(A,aa[1:])
        B=mul(B,bb[1:])
    chi=[0]+add(A,mul([-1,1],B))
    n=sum(lengths)-len(lengths)+2
    assert len(chi)==n+1 and chi[-1]==1
    assert all((-1)**(n-i)*x>=0 for i,x in enumerate(chi))
    return [abs(x) for x in chi]


def lc(a):
    return [x*x-(a[i-1] if i else 0)*(a[i+1] if i+1<len(a) else 0)
            for i,x in enumerate(a)]


def check(a,limit=16):
    while a and not a[0]: a=a[1:]
    while a and not a[-1]: a=a[:-1]
    initial=a.copy()
    for j in range(limit+1):
        bad=[i for i,x in enumerate(a) if x<0]
        if bad:
            return {'negative':True,'iterate':j,'index':bad[0],
                    'value':str(a[bad[0]]),'initial':initial}
        if all(a[i]*a[i]>=3*a[i-1]*a[i+1] for i in range(1,len(a)-1)):
            return {'negative':False,'certified_3factor_at':j}
        if j<limit: a=lc(a)
    return {'negative':False,'unresolved_after':limit}


def samples(seed=212023):
    # Small exhaustive path-length multisets, then disjoint larger regimes.
    for k in range(3,9):
        for lengths in combinations_with_replacement(range(2,8),k):
            yield lengths
    for k in range(3,40):
        for ell in range(2,10):
            yield (ell,)*k
    rng=random.Random(seed)
    for _ in range(2000):
        k=rng.randrange(3,26)
        yield tuple(sorted(rng.randrange(2,15) for j in range(k)))


def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('--limit',type=int,default=16)
    ap.add_argument('--count',type=int)
    args=ap.parse_args()
    # Two paths form a cycle. C4 has q^4-4q^3+6q^2-3q.
    assert theta((2,2))==[0,3,6,4,1]
    start=time.time()
    seen=set()
    unresolved=0
    maxiter=0
    for lengths in samples():
        if lengths in seen: continue
        seen.add(lengths)
        row=check(theta(lengths),args.limit)
        maxiter=max(maxiter,row.get('certified_3factor_at',0))
        unresolved+=('unresolved_after' in row)
        if row['negative']:
            print(json.dumps({'lengths':lengths,**row,'checked':len(seen)}),flush=True)
            return
        if len(seen)%250==0:
            print(json.dumps({'checked':len(seen),'unresolved':unresolved,
                              'max_certification_iterate':maxiter,'seconds':round(time.time()-start,3)}),flush=True)
        if args.count and len(seen)>=args.count: break
    print(json.dumps({'completed':len(seen),'negative':False,'unresolved':unresolved,
                      'max_certification_iterate':maxiter,'seconds':round(time.time()-start,3)}),flush=True)


if __name__=='__main__': main()
