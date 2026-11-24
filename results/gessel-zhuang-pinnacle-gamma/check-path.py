#!/usr/bin/env python3
"""Literal independent enumeration of the inverse-descent path recurrence."""
from collections import defaultdict
from itertools import permutations
import sys


def histogram(word):
    n=len(word);p={a:i for i,a in enumerate(word)}
    h=[sum(a<=i<b for a,b in zip(word,word[1:])) - int(word[-1]>i)
        for i in range(1,n+1)]
    # The previous expression counts internal runs after excluding any final
    # run, but only if the final run has a starting transition. At least one
    # value is already exposed (1<=i), so that transition always exists.
    s={b for a,b,c in zip(word,word[1:],word[2:]) if b>max(a,c)}
    assert {i+2 for i,(a,b) in enumerate(zip(h,h[1:])) if b<a}==s
    return tuple(h),sum(p[i]>p[i+1] for i in range(1,n))


def recurrence(path):
    n=len(path)
    f=[[1]+[0]*(n-1)]
    for h,H in zip(path,path[1:]):
        g=[]
        for j in range(-1,h+1):
            p=[0]*n
            for l,q in enumerate(f):
                step=int(j<l)
                for k in range(n-step):
                    p[k+step]+=q[k]
            g.append(p)
        if H==h-1:f=g[1:-1]
        elif H==h+1:f=g
        else:
            assert H==h
            f=[[a+b for a,b in zip(q,r)] for q,r in zip(g,g[1:])]
    assert len(f)==1
    return f[0]


def paths(n,h=0):
    if n==1:
        if h==0:yield (h,)
        return
    for g in (h-1,h,h+1):
        if 0<=g<=n-2:
            yield from ((h,)+r for r in paths(n-1,g))


def check(n):
    D=defaultdict(lambda:[0]*n)
    for p in permutations(range(1,n+1)):
        h,k=histogram(p)
        D[h][k]+=1
    assert set(D)==set(paths(n))
    for h,P in D.items():
        assert P==recurrence(h),(n,h,P,recurrence(h))
        assert P==P[::-1],(n,h,P)
    print(n,'distinct complete height paths',len(D))


if __name__=='__main__':
    for n in range(1,(int(sys.argv[1]) if len(sys.argv)>1 else 8)+1):
        check(n)
