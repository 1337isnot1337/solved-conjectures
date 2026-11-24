#!/usr/bin/env python3
from fractions import Fraction
from math import factorial,comb
from check_ode import exact_counts
import sys

def a(n):
    out = Fraction(comb(2*n,n), n+1)
    for t in range(3,n+3):
        q = n+3-t
        A = Fraction(t*t*(t-2)*(t-1)*comb(2*t-2,t-1), (2*t-3)*factorial(t)**2)
        B = Fraction((t-2)*(t-1)**2, 2*(2*t-5))
        Y = sum(comb(q-1,i-1)*comb(i+t-3,t-3)*(i*i-i*t+B) for i in range(1,q+1))
        out += Fraction(factorial(n)*factorial(t-3),2*factorial(q))*A*Y
    assert out.denominator == 1
    return out.numerator

if __name__=='__main__':
    N=int(sys.argv[1]) if len(sys.argv)>1 else 45
    u=exact_counts(3,N)
    for n in range(N+1): assert a(n)==u[n], n
    print('Reduced double sum agrees with the exact hook formula through n =',N)
