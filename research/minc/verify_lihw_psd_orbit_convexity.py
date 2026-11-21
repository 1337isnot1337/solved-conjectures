#!/usr/bin/env python3
"""Exact rational diagnostic for the PSD-orbit Lih--Wang partial theorem.

The proof is the companion Markdown file. These tests establish no finite-only
case and are not a replacement for the all-order proof.
"""
from fractions import Fraction as F
from itertools import combinations
from math import factorial
from random import Random

def mul(a,b):
    n=len(a)
    return [[sum(a[i][k]*b[k][j] for k in range(n)) for j in range(n)] for i in range(n)]

def tr(a):
    return [list(row) for row in zip(*a)]

def per(a):
    n=len(a)
    ans=F(0)
    for mask in range(1,1<<n):
        t=F((-1)**(n-mask.bit_count()))
        for i in range(n):
            t*=sum(a[i][j] for j in range(n) if mask&(1<<j))
        ans+=t
    return ans

def pm(q):
    return [[F(int(j==q[i])) for j in range(len(q))] for i in range(len(q))]

def sig(x,k):
    n=len(x)
    ans=F(0)
    for ii in combinations(range(n),k):
        for jj in combinations(range(n),k):
            ans+=per([[x[i][j] for j in jj] for i in ii])
    return ans

def check(n,rng):
    I=pm(tuple(range(n)))
    P=pm(rng.sample(range(n),n))
    Q=pm(rng.sample(range(n),n))
    T=[[(I[i][j]+P[i][j]+2*Q[i][j])/4 for j in range(n)] for i in range(n)]
    S=mul(T,tr(T))
    L=pm(rng.sample(range(n),n))
    R=pm(rng.sample(range(n),n))
    A=mul(mul(L,S),R)
    J=[[F(1,n) for j in range(n)] for i in range(n)]
    X=[[S[i][j]-J[i][j] for j in range(n)] for i in range(n)]
    beta=F(factorial(n),n**n)
    c=[F(0),F(0)]
    for k in range(2,n+1):
        x=sig(X,k)
        assert x>=0,(n,k,x)
        c.append(F(factorial(n-k),n**(n-k))*x)
    assert sig(X,2)==sum(x*x for row in X for x in row)/2
    assert beta+sum(c)==per(S)==per(A)
    for t in [F(0),F(1,5),F(1,2),F(3,4),F(1)]:
        B=[[J[i][j]+t*(A[i][j]-J[i][j]) for j in range(n)] for i in range(n)]
        f=per(B)
        assert f==beta+sum(c[k]*t**k for k in range(2,n+1))
        assert f<=beta+t*t*(per(A)-beta)
        assert f<=(1-t)*beta+t*per(A)

if __name__=="__main__":
    rng=Random(20261120)
    count=0
    for n in range(2,7):
        for i in range(12):
            check(n,rng)
            count+=1
    print("passed",count,"exact rational PSD orbit coefficient checks")
    print("these finite diagnostics are not a proof of the unrestricted conjecture")
