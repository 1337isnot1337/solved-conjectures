#!/usr/bin/env python3
"""Finite m=3,...,127 sign certificates for Rossi's characteristic-polynomial conjecture.

Floating point only proposes rational sample points; the acceptance predicates evaluate
integer homogeneous forms exactly. No transcendental approximation is used to
certify a root or a sign.
"""
from fractions import Fraction
from math import pi, tan, exp
import sys

def eulerian(previous):
    n=len(previous)+1
    return [(k+1)*(previous[k] if k<len(previous) else 0)
            +(n-k)*(previous[k-1] if k else 0) for k in range(n)]

def P(An):
    p=[1]+[0]*len(An)
    for k,a in enumerate(An):
        p[k]-=a;p[k+1]+=a
    return p

def sign_at(p, t):
    r=p[-1]; qpower=1
    for a in p[-2::-1]:
        qpower*=t.denominator
        r=r*t.numerator+a*qpower
    return (r>0)-(r<0)

def sample(n,j):
    x=pi/tan(pi*j/(n+1))
    return -Fraction(exp(-x))

def check(last=127):
    a=[1]
    count=0
    fails=[]
    for n in range(2,last+1):
        a=eulerian(a)
        if n<3:continue
        p=P(a)
        assert p[0]==0 and p[1]<0 and sum(p)==1
        prev=Fraction(0)
        for j in range(2,n+1):
            u=sample(n,j)
            s=sign_at(p,u)
            assert u<prev
            if s!=(-1)**j:fails.append((n,j,s))
            prev=u
            count+=1
    print('Verified sample signs:',count-len(fails),'of',count,flush=True)
    print('Exceptions:',fails,flush=True)
    return fails
if __name__=='__main__':
    assert not check(int(sys.argv[1]) if len(sys.argv)>1 else 127)
