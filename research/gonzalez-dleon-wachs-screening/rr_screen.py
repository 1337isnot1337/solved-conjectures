#!/usr/bin/env python3
"""Exact real-root count for full GDL--Wachs Conjecture 4.13 discovery."""
import argparse
from functools import lru_cache
from math import comb
import json
import time
import sympy as sp
from screen import Bond, graphs, clean


def conv(a,b):
    c=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j]+=x*y
    return c


@lru_cache(None)
def specialize(lam):
    p=[1]
    for r in lam:
        p=conv(p,[1]*(r+1))
    return p


def coefficients(h):
    if not h:
        return []
    out=[0]*(max(map(sum,h))+1)
    for lam,c in h.items():
        for k,v in enumerate(specialize(lam)):
            out[k]+=c*v
    return out


def realrooted(p):
    if not p or not any(p):
        return True, [], []
    assert p==p[::-1],p
    if p[0]<0:
        p=[-x for x in p]
    N=len(p)-1
    gamma=[]
    for i in range(N//2+1):
        gamma.append(p[i]-sum(gamma[j]*comb(N-2*j,i-j) for j in range(i)))
    while gamma and gamma[-1]==0:
        gamma.pop()
    if len(gamma)<=1:
        return True,gamma,[]
    x=sp.Symbol('x')
    poly=sp.Poly.from_list(list(reversed(gamma)),x)
    intervals=poly.intervals()
    nreal=sum(mult for interval,mult in intervals)
    # If the gamma polynomial has fewer real roots than its degree, F cannot
    # be real-rooted. If gamma is nonnegative-coefficient, all real roots <0.
    if nreal<poly.degree():
        return False,gamma,str(intervals)
    # Positive gamma roots likewise obstruct all-negative roots of F.
    if any(a>=0 and b>0 for (a,b),mult in intervals):
        return False,gamma,str(intervals)
    return True,gamma,str(intervals)


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--n',type=int,default=7)
    parser.add_argument('--count',type=int,default=100)
    parser.add_argument('--seed',type=int,default=4132026)
    args=parser.parse_args()
    start=time.time()
    for index,(name,edges) in enumerate(graphs(args.n,args.count,args.seed)):
        g=Bond(args.n,edges)
        if not g.conn[-1]:
            continue
        pg=coefficients(g.M[-1])
        ok,gam,ints=realrooted(pg)
        if not ok:
            print(json.dumps({'type':'4.13(1)','n':args.n,'name':name,'edges':g.edges,
                              'poly':pg,'gamma':gam,'real_intervals':ints}),flush=True)
            return
        for e in g.edges:
            h=Bond(args.n,[f for f in g.edges if f!=e])
            if not h.conn[-1]:
                continue
            ph=coefficients(h.M[-1])
            diff=[a-b for a,b in zip(pg,ph)]
            ok,gam,ints=realrooted(diff)
            if not ok:
                print(json.dumps({'type':'4.13(2)','n':args.n,'name':name,'edges':g.edges,
                                  'deleted_edge':e,'poly_g':pg,'poly_h':ph,'difference':diff,
                                  'gamma':gam,'real_intervals':ints}),flush=True)
                return
        print(json.dumps({'index':index,'name':name,'no_failure':True,
                          'seconds':round(time.time()-start,3)}),flush=True)


if __name__=='__main__':
    main()
