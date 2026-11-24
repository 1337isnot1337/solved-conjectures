#!/usr/bin/env python3
"""Exact rational Fourier sign certificate for ordinary D'Arcais P_n, n>=501."""
from fractions import Fraction as F
from math import comb,factorial,isqrt
from functools import lru_cache
from bisect import bisect_left

K=1200
N=501
GRID=1000
ROUND=10**8
EROUND=10**18
D=7
PI_L=F(314159265,10**8)
PI_U=F(314159266,10**8)
G=[0]*(K+1)
for d in range(1,K+1):
    for k in range(d,K+1,d):
        G[k]+=d

def floorq(a):
    return F(a.numerator*ROUND//a.denominator,ROUND)
def ceilq(a):
    return -floorq(-a)
def rootupper(a):
    return isqrt(a.numerator//a.denominator)+1

def arctan_part(q,n):
    return sum(F((-1)**j,(2*j+1)*q**(2*j+1)) for j in range(n))
assert PI_L < 16*arctan_part(5,12)-4*arctan_part(239,11)
assert PI_U > 16*arctan_part(5,11)-4*arctan_part(239,12)
# The displayed arctan truncations, with Machin's identity, bracket pi.

@lru_cache(None)
def exp_grid(j):
    w=F(j,20)
    y=t=F(1)
    for k in range(1,71):
        t*=w/k
        y+=t
    p=y.denominator*EROUND
    return F(-(-p//y.numerator),EROUND)
def expup(w):
    assert w>=0
    return exp_grid(min(1200,20*w.numerator//w.denominator))

def moments(r):
    """Outward finite-sum and positive geometric tail for D_j(r)."""
    lo=[];hi=[]
    a,b=r.numerator,r.denominator
    den=b**(K-1)
    for j in range(3):
        val=0
        powb=1
        for k in range(K,0,-1):
            val=val*a+powb*k**j*G[k]
            powb*=b
        pol=F(val,den)
        d=j+1
        # For k=K+i, sigma_1(k)<=k(1+log k)<=k(9+i/K).
        tail=r**K*sum(
            comb(d,h)*K**(d-h)*(F(9*factorial(h))/(1-r)**(h+1)+
            F(factorial(h+1),K)/(1-r)**(h+2))
            for h in range(d+1))
        lo.append(floorq(pol));hi.append(ceilq(pol+tail))
    return lo,hi

def cos_defect_lower(a,b):
    """Lower bound for 1-cos t on t in [a,b] subset [0,7pi]."""
    distance=min(max(0,2*j*PI_L-b,a-2*j*PI_U) for j in range(D+2))
    distance=min(distance,PI_L)
    d2=distance**2
    return max(F(0),d2/2-d2**2/24+d2**3/720-d2**4/40320)

TBINS=[(F(k,100),min(F(k+1,100),PI_U)) for k in range(1,315)]
TC=[tuple(floorq(cos_defect_lower(d*a,d*b)) for d in range(1,D+1))
    for a,b in TBINS]
UBINS=[(F(k,20),F(k+1,20)) for k in range(55,400)]

def mid_bound(Ms,Ss,Vmin):
    ans=F(0)
    for u,v in UBINS:
        w=u*u*sum(floorq(Ms[d-1]*max(0,F(1,2)-(d*v)**2/(24*Vmin))/
                  (1+Ss[d-1]*v*v)) for d in range(1,D+1))
        ans+=(v**3-u**3)/6*expup(w)
    return ans

def far_gaussian(c):
    rate=40*c
    return (200/rate+20/rate**2+1/rate**3)*expup(400*c)

def outer_bound(a,b,h0,U1):
    # A(t)>=h*sum_d C_d*c_d/(delta_a,d^2+2*b^d*c_d), h=xr.
    C=tuple(floorq(a**(d-1)*(1+a**d)/(d*(1-a**d))) for d in range(1,D+1))
    P=tuple(ceilq((1-a**d)**2) for d in range(1,D+1))
    Q=tuple(ceilq(2*b**d) for d in range(1,D+1))
    ans=F(0)
    for (ta,tb),cs in zip(TBINS,TC):
        h=max(h0,F(400)/(tb*tb*U1))
        # Only u>=20 is in the target tail, hence V>=400/tb^2.
        w=h*sum(floorq(c*cc/(p+q*c)) for c,cc,p,q in zip(cs,C,P,Q))
        assert w>=F(3,2),(a,b,ta,tb,float(w))
        W=h*U1
        ans+=(tb-ta)*min(tb*tb/2,2)*W*rootupper(W)*expup(w)
    return ans

def certify():
    # theta at u<=2 has magnitude <=7/12 with gamma<=7/16.
    main=sum(F((-1)**j*4*2**j,factorial(j)*(2*j+3)) for j in range(12))
    assert F(239,288)*(1-F(1,3*N))*main>F(19,50)
    assert F(7,16)*F(11,4)**3/6 < PI_L/2

    worst=(F(0),None)
    worstgam=F(0)
    a=F(0)
    low,high=moments(a)
    for i in range(990):
        b=F(i+1,GRID)
        lowb,U=moments(b)
        h=max(a,F(N)/U[0])
        Vmin=max(F(N),h*low[1])
        gam2=U[2]**2/(h*low[1]**3)
        assert gam2<=F(49,256),(a,b,float(gam2))
        worstgam=max(worstgam,gam2)
        Ms=[floorq(d*a**(d-1)*(1+a**d)/((1-a**d)**3*U[1])) for d in range(1,D+1)]
        Ss=[ceilq(b**d*d*d/((1-b**d)**2*Vmin)) for d in range(1,D+1)]
        # Globally V <= zeta(2) V_0 by monotonicity of t^3 sum k^2 e^(-kt).
        Ms[0]=max(Ms[0],F(3,5))
        # For t>=delta the d=1 multiplier is at least 11/24, while
        # t<=delta gives the same Gaussian estimate as t<=.01.
        B0=h/(1-a)
        z=F(11,24)*B0
        W=h*U[1]
        cheap=PI_U*W*rootupper(W)*expup(z)
        outer=cheap if z>=F(3,2) and cheap<F(1,20) else outer_bound(a,b,h,U[1])
        tail=mid_bound(Ms,Ss,Vmin)+far_gaussian(F(1,10))+outer
        if tail>worst[0]:worst=(tail,a)
        assert tail<F(19,50),(a,b,float(tail))
        a=b
        low,high=lowb,U

    # r>=.99: C_1<= (10/3) delta^-3, C_2<= (100/9) delta^-4.
    R=F(99,100)
    V0=R*(1+R)/(1-R)**3
    gam2=F(100,9)**2*(1-R)/(R*(1+R))**3
    assert gam2<=F(49,256)
    Ms=[F(3,10)*R**d*(1+R**d)/d**2 for d in range(1,D+1)]
    Ss=[(1-R)/(R*(1+R)*R**(2*d-2)) for d in range(1,D+1)]
    assert Ms[0] >= F(59,100)
    # t<=3delta: s_1<=9; lower bound A>=u^2/40.
    near=far_gaussian(F(1,40))
    # t>=3delta: s_1>=8, so A>= (8/9)B, V<=4B^3, B>=99.
    B=F(99)
    outer=PI_U*8*B**5*expup(F(8,9)*B)
    tail=mid_bound(Ms,Ss,V0)+near+outer
    assert tail<F(19,50),float(tail)
    print("Certified ordinary Fourier sign for n>=501 and every x>=1.")
    print(f"Worst enclosing tail below .99: {float(worst[0]):.8f} at r={worst[1]}.")
    print(f"Worst enclosing gamma squared: {float(worstgam):.8f}.")
    print(f"Final analytic regime enclosing tail: {float(tail):.8f}.")

if __name__=="__main__":
    certify()
