#!/usr/bin/env python3
"""Exact auxiliary checks, not a finite-order conjecture proof."""
from fractions import Fraction as F
from functools import lru_cache
from itertools import combinations
from random import Random

def mul(a,b):
    n=len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(n)) for j in range(n)] for i in range(n)]

def power(a,k):
    n=len(a)
    ans=[[F(int(i==j)) for j in range(n)] for i in range(n)]
    for _ in range(k): ans=mul(ans,a)
    return ans

def trace(a):
    return sum(a[i][i] for i in range(len(a)))

def check(h):
    n=len(h); q=mul(h,h)
    edges=sorted(((h[i][j]**2,i,j) for i,j in combinations(range(n),2) if h[i][j]),reverse=True)
    w={(i,j):h[i][j]**2 for i,j in combinations(range(n),2)}
    A=sum(w[min(i,j),max(i,j)]*w[min(i,k),max(i,k)]
          for i in range(n) for j,k in combinations((z for z in range(n) if z!=i),2))
    E2=sum(q[i][j]**2 for i in range(n) for j in range(n) if i!=j)
    D=A+F(1,2)*E2
    used=set(); keep=set()
    for _,i,j in edges:
        if i not in used and j not in used:
            used.update((i,j));keep.add((i,j))
    omitted=[v for v,i,j in edges if (i,j) not in keep]
    assert sum(v*v for v in omitted)<=A
    assert sum(omitted)**2<=F(n*(n-1),2)*A
    s2=trace(q)
    row_norm=max(sum(abs(a) for a in row) for row in h)
    if s2:
        for k in range(1,4):
            odd=trace(power(h,2*k+1))
            assert odd**2<=2*k*k*s2*row_norm**(4*k-4)*D

def pairing_cost(x):
    n=len(x)
    @lru_cache(None)
    def rec(mask):
        if not mask:return F(0)
        i=(mask & -mask).bit_length()-1
        rem=mask & ~(1<<i)
        vals=[F(x[i]**2)+rec(rem)] if mask.bit_count()%2 else []
        for j in range(i+1,n):
            if rem & (1<<j):
                vals.append(F((x[i]+x[j])**2,2)+rec(rem & ~(1<<j)))
        return min(vals)
    return rec((1<<n)-1)

def main():
    rng=Random(20261120);total=0
    for n in range(3,8):
        for _ in range(25):
            h=[[F(0) for j in range(n)] for i in range(n)]
            for i,j in combinations(range(n),2):
                h[i][j]=h[j][i]=F(rng.randint(-5,5),rng.choice((1,2,3)))
            check(h);total+=1
    x=(-10,-4,-2,7,9)
    assert sum(x)==sum(a**3 for a in x)==0
    assert (sum(a*a for a in x),sum(a**4 for a in x),sum(a**5 for a in x))==(250,19234,-25200)
    assert pairing_cost(x)==9
    assert F(sum(a**5 for a in x)**2,8*sum(a*a for a in x)*10**4)==F(3969,125)
    assert F(pairing_cost(x)**2,4*10)==F(81,40)
    print(f"PASS {total} exact rational matrix checks and cubic-blind spectrum certificate")

if __name__=="__main__":
    main()
