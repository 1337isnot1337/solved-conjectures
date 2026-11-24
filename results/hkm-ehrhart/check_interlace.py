#!/usr/bin/env python3
"""Exact multipartite counts and canonical-line interlacing counterexample."""
from fractions import Fraction
from functools import cache, reduce
from math import comb, gcd

def bn(n,k):
    return comb(n,k) if 0 <= k <= n else 0

def c(p,k):
    return int(k==0) if p==0 else bn(p-1,k-1)

@cache
def A(m,p,q):
    return sum(comb(m,i)*comb(m-i,j)*c(p,i)*c(q,j)
               for i in range(min(m,p)+1)
               for j in range(min(m-i,q)+1))

def values(part,t):
    N=sum(part)
    return sum(A(N,s,s) for s in range(t+1)) - sum(
      A(m,p,q)*A(N-m,s-p,s-q)
      for m in part for s in range(t+1)
      for p in range(s+1) for q in range(s+1) if p+q>t)

def mul(a,b):
    out=[0]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            out[i+j]+=x*y
    return out

def reduce_ehrhart(part):
    d=sum(part)-1
    E=[values(part,t) for t in range(d+1)]
    h=[sum((-1)**j*comb(d+1,j)*E[i-j] for j in range(i+1))
       for i in range(d+1)]
    P=[0]*(d+1)
    for i,h_i in enumerate(h):
        b=[1]
        for j in range(1,d+1):
            b=mul(b,[2*j-2*i-1,1])
        P=[a+h_i*b_i for a,b_i in zip(P,b)]
    assert all(P[i]==0 for i in range(1-d%2,d+1,2))
    content=reduce(gcd,P,0)
    return h,[P[i]//content*(-1)**((d-i)//2) for i in range(d%2,d+1,2)]

def sturm(coeff):
    p=[Fraction(v) for v in coeff]
    q=[i*p[i] for i in range(1,len(p))]
    seq=[p,q]
    while q:
        r=p.copy()
        while r and len(r)>=len(q):
            a=r[-1]/q[-1]
            shift=len(r)-len(q)
            for j,x in enumerate(q):
                r[j+shift]-=a*x
            while r and r[-1]==0: r.pop()
        if not r: break
        p,q=q,[-x for x in r]
        seq.append(q)
    return seq

def signs(seq,x):
    def sign(z):return (z>0)-(z<0)
    return [sign(p[-1] if x is None else
                 sum(v*x**i for i,v in enumerate(p))) for p in seq]

checks=[
 ((2,3,3,3,3),[1,143,5558,78206,498295,1627629,2902404,2902404,1627629,498295,78206,5558,143,1],
  [1935804366675,-3053747869302,1199300771669,-177499861396,9911355597,-203796502,1278059],
  [-1,1,-1,1,1,-1,1]),
 ((2,2,3,3,3),[1,122,3974,46114,237849,613572,836892,613572,237849,46114,3974,122,1],
  [15445462725,-80729265978,54197184723,-12127443724,972506139,-27129498,220013],
  [-1,-1,1,-1,-1,1,1])
]
for part,H,P,mid in checks:
    h,coeff=reduce_ehrhart(part)
    assert h==H and coeff==P
    chain=sturm(P)
    assert [len(p)-1 for p in chain]==[6,5,4,3,2,1,0]
    rows=[signs(chain,x) for x in [Fraction(0),Fraction(441,100),None]]
    assert rows==[[1,-1,1,-1,1,-1,1],mid,[1]*7]
    variations=[sum(a!=b for a,b in zip(row,row[1:])) for row in rows]
    print(part,"h*",H,"Sturm variations",variations)
