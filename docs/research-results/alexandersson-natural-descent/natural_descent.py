#!/usr/bin/env python3
"""Exact diagnostics for Alexandersson's natural-descent conjecture.
No finite screen proves the universal conjecture. All coefficients are integers.
"""
from math import comb
from random import Random
from functools import lru_cache
import argparse, json
import numpy as np
import sympy as sp


def determinant(a):
    a=[r[:] for r in a]; n=len(a); prev=sign=1
    for k in range(n-1):
        if not a[k][k]:
            p=next((p for p in range(k+1,n) if a[p][k]),None)
            if p is None:return 0
            a[k],a[p]=a[p],a[k];sign=-sign
        pivot=a[k][k]
        for i in range(k+1,n):
            for j in range(k+1,n):
                z=a[i][j]*pivot-a[i][k]*a[k][j]
                assert z%prev==0
                a[i][j]=z//prev
            a[i][k]=0
        prev=pivot
    return sign*a[-1][-1] if n else 1


def order_count(lam,m):
    """Weakly order-preserving maps from Ferrers(lam) to 0,...,m."""
    a=[]
    for i,li in enumerate(lam):
        row=[]
        for j in range(len(lam)):
            q=li-i+j
            top=m+li
            row.append(comb(top,q) if 0<=q<=top else 0)
        a.append(row)
    return determinant(a)


def numerator(lam):
    lam=tuple(lam);N=sum(lam)
    v=[order_count(lam,m) for m in range(N+2)]
    h=[sum((-1)**j*comb(N+1,j)*v[i-j] for j in range(i+1)) for i in range(N+1)]
    assert sum((-1)**j*comb(N+1,j)*v[N+1-j] for j in range(N+2))==0
    while len(h)>1 and h[-1]==0:h.pop()
    assert all(z>=0 for z in h),(lam,h)
    return h


def direct_numerator(lam):
    """Independent DP over the row containing each successive tableau entry."""
    lam=tuple(lam);N=sum(lam);rows=len(lam)
    @lru_cache(None)
    def f(shape,last):
        if sum(shape)==N:return (1,)
        out=[0]*(N+1)
        for r in range(rows):
            if shape[r]>=lam[r] or (r and shape[r]>=shape[r-1]):continue
            new=list(shape);new[r]+=1
            shift=int(last>r)
            for d,c in enumerate(f(tuple(new),r)):
                out[d+shift]+=c
        while len(out)>1 and out[-1]==0:out.pop()
        return tuple(out)
    return list(f((0,)*rows,0))


def partitions(n,top=None):
    if n==0:yield ();return
    for j in range(min(n,top if top else n),0,-1):
        for tail in partitions(n-j,j):yield (j,)+tail


def exact_real(h):
    x=sp.Symbol('x');p=sp.Poly.from_list(h[::-1],x,domain='ZZ');q=p.sqf_part()
    return q.count_roots(-sp.oo,0)==q.degree()


def sanity():
    checked=0
    for n in range(1,11):
        for lam in partitions(n):
            a=numerator(lam);b=direct_numerator(lam)
            assert a==b,(lam,a,b)
            checked+=1
    print(json.dumps({'independent_tableau_comparisons':checked,'maximum_size':10}),flush=True)


def main():
    p=argparse.ArgumentParser();p.add_argument('--trials',type=int,default=100);p.add_argument('--seed',type=int,default=11202026);p.add_argument('--sanity-only',action='store_true');p.add_argument('--exact',action='store_true')
    args=p.parse_args();sanity()
    if args.sanity_only:return
    rng=Random(args.seed);exact_checks=0
    for case in range(args.trials):
        rows=rng.randrange(2,8);lam=tuple(sorted([rng.randrange(1,16) for _ in range(rows)],reverse=True))
        h=numerator(lam)
        roots=np.roots([float(z)/max(h) for z in h[::-1]])
        suspicious=any(abs(z.imag)>1e-5*(1+abs(z.real)) for z in roots)
        if suspicious or args.exact:
            exact_checks+=1
            if not exact_real(h):
                print(json.dumps({'COUNTEREXAMPLE':True,'lambda':lam,'hstar':h}),flush=True);return
        if case%10==0:print(json.dumps({'case':case,'lambda':lam,'degree':len(h)-1,'exact_checks':exact_checks}),flush=True)
    print(json.dumps({'status':'finite diagnostic only, no counterexample','trials':args.trials,'seed':args.seed,'exact_checks':exact_checks}),flush=True)
if __name__=='__main__':main()
