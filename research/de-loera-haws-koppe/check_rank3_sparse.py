#!/usr/bin/env python3
"""Exact polynomial certificate for rank-three sparse-paving h* log-concavity."""
from fractions import Fraction as Q
from functools import reduce

def trim(a):
    while len(a)>1 and a[-1]==0: a=a[:-1]
    return a

def plus(a,b):
    return trim(tuple((a[i] if i<len(a) else 0)+(b[i] if i<len(b) else 0)
                 for i in range(max(len(a),len(b)))))

def times(a,b):
    c = [Q(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):
            c[i+j] += x*y
    return trim(tuple(c))

def scale(a,c): return tuple(c*x for x in a)

def binom_linear(a,k):
    # binom(s+a,k) for k>=0, zero for k<0.
    if k<0: return (Q(0),)
    return reduce(times,((Q(a-i,i+1),Q(1,i+1)) for i in range(k)),(Q(1),))

def ehr(t):
    # n=s+6; inclusion-exclusion in x_1+...+x_n=3t, 0<=x_i<=t.
    return reduce(plus,(
        scale(times(binom_linear(6,i),binom_linear(5+(3-i)*t-i,(3-i)*t-i)),(-1)**i)
        for i in range(3)
    ),(Q(0),))

def h(j):
    return reduce(plus,(
        scale(times(binom_linear(6,i),ehr(j-i)),(-1)**i)
        for i in range(j+1)
    ),(Q(0),))

def print_poly(a):
    from math import lcm
    den=lcm(*(x.denominator for x in a))
    return den, [int(den*x) for x in a]

A=[h(j) for j in range(5)]
B=[(Q(0),),(Q(1),),(Q(4),Q(2)),binom_linear(2,2)]
L=scale(binom_linear(6,2),Q(1,3))
assert [a[0] for a in A]==[1,14,36,14,1]

# Independent exact integer check of low-coefficient formulas at two ground sizes.
for n in (6,7):
    for t in range(5):
        dp=[0]*(3*t+1)
        dp[0]=1
        for _ in range(n):
            dp=[sum(dp[max(0,i-t):i+1]) for i in range(3*t+1)]
        assert sum(c*(n-6)**i for i,c in enumerate(ehr(t)))==dp[-1]

for j in (1,2,3):
    lower=plus(A[j],scale(times(L,B[j]),-1))
    slack=plus(times(lower,lower),scale(times(A[j-1],A[j+1]),-1))
    assert all(c>0 for c in lower), (j,lower)
    assert all(c>0 for c in slack), (j,slack)
    print("j =",j)
    print("lower denominator and coefficient list =",print_poly(lower))
    print("slack denominator and coefficient list =",print_poly(slack))
