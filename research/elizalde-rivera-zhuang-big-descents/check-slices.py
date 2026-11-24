#!/usr/bin/env python3
"""Check exact joint and summed formulas from a distinct literal enumerator."""
from collections import Counter
from itertools import permutations
from math import comb
import sys


def C(n,k):
    return comb(n,k) if 0<=k<=n else 0


def joint(n,d,k):
    h=n-d
    return C(d,k)*sum(C(h,l+1)*C(h-1+l,l)*C(h-1,k-l) for l in range(h))//h


def double_sum(n,k):
    return sum(comb(2*l,l)//(l+1)*C(l,k-l-a)*C(2*l+a,a)*C(n+l,k+2*l+a+1)
               for l in range(k+1) for a in range(k-l+1))


def literal(n):
    out=Counter()
    for p in permutations(range(n)):
        if any(p[i]<p[k]<p[j] for i in range(n) for j in range(i+1,n) for k in range(j+1,n)):
            continue
        diff=[a-b for a,b in zip(p,p[1:])]
        out[sum(v>0 for v in diff),sum(v>1 for v in diff)]+=1
    return out


if __name__=='__main__':
    max_n=int(sys.argv[1]) if len(sys.argv)>1 else 8
    for n in range(1,max_n+1):
        a=literal(n)
        for k in range(n):
            assert double_sum(n,k)==sum(a[d,k] for d in range(n))
            for d in range(n):
                assert joint(n,d,k)==a[d,k],(n,d,k,joint(n,d,k),a[d,k])
    print('Joint formula and summed formula agree with literal 132 avoidance through n =', max_n)
