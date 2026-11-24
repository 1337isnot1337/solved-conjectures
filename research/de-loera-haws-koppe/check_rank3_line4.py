#!/usr/bin/env python3
"""Certificate for rank-three matroids with lines of size at most four."""
from fractions import Fraction as Q
from math import comb
from functools import reduce
from check_rank3_sparse import plus, times, scale, binom_linear, h, print_poly

# All imported polynomials use s=n−6.
def choose(n,k):
    return comb(n,k) if n>=k>=0 else 0

def cap_count(ell,t):
    return reduce(plus,(
        scale(binom_linear(5-ell+r,r),sum(
            (-1)**i*choose(ell,i)*choose(3*t-r-i*(t+1)+ell-1,ell-1)
            for i in range(3)))
        for r in range(t)
    ),(Q(0),))

def cap_coefficient(ell,j):
    return reduce(plus,(
        scale(times(binom_linear(6,i),cap_count(ell,j-i)),(-1)**i)
        for i in range(j+1)
    ),(Q(0),))

A=[h(j) for j in range(9)]
B={ell:[cap_coefficient(ell,j) for j in range(5)] for ell in (3,4)}
assert B[4]==[(Q(0),),(Q(4),),(Q(18),Q(12)),(Q(10),Q(15),Q(6)),
              (Q(1),Q(7,3),Q(2),Q(2,3))]
assert B[3]==[(Q(0),),(Q(1),),(Q(4),Q(2)),binom_linear(2,2),(Q(0),)]

# For each j, the per-pair correction for a 4-line dominates that for a 3-line.
for j in range(1,5):
    D=plus(scale(B[4][j],Q(1,6)),scale(B[3][j],Q(-1,3)))
    assert all(c>0 for c in D) and all(c>0 for c in B[4][j])

def shift(p,a):
    return tuple(sum(p[i]*comb(i,k)*a**(i-k) for i in range(k,len(p))) for k in range(len(p)))

def val(p,s):
    return sum(c*s**i for i,c in enumerate(p))

# Coefficients in s−3=n−9. Positive lists certify the whole unbounded range.
for j in range(1,5):
    L=scale(binom_linear(6,2),Q(1,6))
    lower=plus(A[j],scale(times(L,B[4][j]),-1))
    slack=plus(times(lower,lower),scale(times(A[j-1],A[j+1]),-1))
    P,S = shift(lower,3),shift(slack,3)
    assert all(c>0 for c in P) and all(c>0 for c in S)
    print(j, "lower: degree, min and constant=",len(P)-1,min(P),P[0],
          "slack: degree, min and constant=",len(S)-1,min(S),S[0])

# No pair lies in two lines. Two 4-lines require ≥7 points; three require ≥9.
for n, m4 in ((6,1),(7,2),(8,2)):
    count=0
    least_slack=None
    for l4 in range(m4+1):
        for l3 in range((comb(n,2)-6*l4)//3+1):
            H=[val(A[j],n-6) for j in range(n)]
            for j in range(1,5):
                H[j] -= l3*val(B[3][j],n-6)+l4*val(B[4][j],n-6)
            while H[-1]==0: H.pop()
            assert all(c>0 for c in H),(n,l3,l4,H)
            for j in range(1,len(H)-1):
                D=H[j]**2-H[j-1]*H[j+1]
                assert D>0,(n,l3,l4,H,D)
                least_slack=D if least_slack is None else min(least_slack,D)
            count+=1
    print(n, "small-case profiles=",count,"min strict log-concavity slack=",least_slack)
