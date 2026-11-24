#!/usr/bin/env python3
"""Rational interval certificate for positive Fourier second difference, n>=251."""
from fractions import Fraction as F
from math import comb, factorial, isqrt
from functools import lru_cache


GRID = 1000
K = 250
N = 251
ROUND = 10**8
EXP_ROUND = 10**13

G = [0] * (K + 1)
for d in range(1, K+1):
    for k in range(d,K+1,d):
        G[k] += d*d


def floorq(a):
    return F(a.numerator*ROUND//a.denominator,ROUND)


def ceilq(a):
    return -floorq(-a)


@lru_cache(None)
def exp_grid(j):
    # j/20 was rounded down from the lower bound on the true exponent.
    w = F(j,20)
    t = y = F(1)
    for k in range(1,46):
        t *= w/k
        y += t
    p = y.denominator*EXP_ROUND
    return F(-(-p//y.numerator),EXP_ROUND)


def expup(w):
    assert w >= 0
    return exp_grid(min(1000,20*w.numerator//w.denominator))


def moments(r):
    """Lower/upper bounds on D_j(r)=sum_{k>=1} k^j sigma_2(k) r^(k-1)."""
    lo, hi = [], []
    u,v=r.numerator,r.denominator
    den=v**(K-1)
    for j in range(3):
        # Exact integer Horner, with common denominator v**(K-1).
        a=0
        b=1
        for k in range(K,0,-1):
            a = a*u + b * (k**j * G[k])
            b *= v
        s = F(a,den)
        d=j+2
        tail = F(5,3) * r**K * sum(
            F(comb(d,i)*K**(d-i)*factorial(i),1)/(1-r)**(i+1)
            for i in range(d+1)
        )
        lo.append(floorq(s))
        hi.append(ceilq(s+tail))
    return lo,hi


def f_clipped(s,a):
    return min(F(1),s*(2+a+s)/(1+s)**2)


def outer_tail(V, w):
    # Normalized integral over t>=delta is <= pi V^(3/2) exp(-w).
    root = isqrt(V.numerator//V.denominator)+1
    return F(22,7)*V*root*expup(w)


def middle_tail(M,S,nu):
    """Bound the normalized integral from u=3 to u=20."""
    ans = F(0)
    # On a bin [u,v], t=u_actual/sqrt(V), s<=S*v^2;
    # (1+s/nu)/(1+s)^2 decreases in s for nu>=3.
    for j in range(60,400):
        u,v=F(j,20),F(j+1,20)
        z=S*v*v
        num=1 if nu is None else 1+z/nu
        w=M*(F(1,2)-v*v/(24*N))*u*u*num/(1+z)**2
        ans+=(v**3-u**3)/6*expup(w)
    return ans


def certificate():
    # Positive part on [0,2]. Integrate the odd order Taylor lower bound
    # for exp(-u^2/2) after multiplying by u^2/2.
    integ=sum(F((-1)**j * 4 * 2**j, factorial(j)*(2*j+3)) for j in range(12))
    positive=F(73,81)*(1-F(1,3*N))*integ
    assert positive > F(2,5)

    # For u>=20 while t<=delta, A_0>=u^2/16.  Integrating the bound
    # exp(-u^2/16) <= exp(-25) exp(-(5/2)(u-20)):
    far=(F(200)*F(2,5)+20*F(2,5)**2+F(2,5)**3)*expup(F(25))
    assert far < F(1,10**6)

    boxes_worst=(F(0),None)
    gamma_worst=F(0)
    a=F(0)
    low, high=moments(a)
    for i in range(900):
        b=F(i+1,GRID)
        lob,hib=moments(b)
        h=max(a,F(N)/hib[0])
        gamma2=hib[2]**2/(h*low[1]**3)
        gamma_worst=max(gamma_worst,gamma2)
        assert gamma2 <= F(1,9),(a,b,float(gamma2))
        M=(1+4*a+a*a)/((1-a)**4*hib[1])
        S=b/(h*(1-b)**2*low[1])
        nu=None if a==0 else 2+(1+a*a)/(2*a)
        B=h/(1-a)**2
        # Use the k=1 term (a valid fallback near zero) or the k-weight
        # k-weight bound, whichever better controls the tail.
        c=max(F(11,24)*(1-b)**4,
              f_clipped(F(11,12)*a,(1+b*b)/(2*b)))
        assert c*B>=F(3,2),(a,b,float(c*B))
        outer=outer_tail(B*(1-a)**2*hib[1],c*B)
        tail=middle_tail(M,S,nu)+far+outer
        if tail>boxes_worst[0]:
            boxes_worst=(tail,a)
        assert tail < F(2,5),(a,b,float(tail))
        a=b
        low,high=lob,hib

    # Last interval r>=9/10: gamma bound from the exact k^3,k^4 sums;
    # beta^2>=486.9 and V0/V>=20/33 by the pointwise divisor bound.
    gam2=(F(33,20)*24)**2*F(1,100)/(F(9,10)*F(541,100)**3)
    assert gam2 <= F(1,9)
    B=F(90)
    assert F(9,10)*B>=3
    # V <= 12 B^2, V^(3/2)<=42 B^3, and c>=9/10.
    tail=middle_tail(F(20,33),F(10,4869),F(31,10))+far+(
        F(22,7)*42*B**3*expup(F(9,10)*B)
    )
    assert tail < F(2,5), float(tail)
    print(f"Fourier sign certified for all n>=251, all x>=1.")
    print(f"Worst enclosing box tail (r<=0.9) {float(boxes_worst[0]):.6g} at r={boxes_worst[1]}.")
    print(f"r>=0.9 enclosing tail {float(tail):.6g}; lower positive integral >2/5.")
    print(f"Worst r<=0.9 bound for squared normalized third cumulant: {float(gamma_worst):.6g}.")


if __name__ == "__main__":
    certificate()
