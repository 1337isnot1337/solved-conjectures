#!/usr/bin/env python3
"""Check the guessed ODE through a finite degree via an independent exact hook sum."""
from math import factorial, comb, prod
import sys

def exact_counts(d,N):
    fac=[factorial(i) for i in range(N+d+1)]
    shapes=[[] for _ in range(N+1)]
    def build(rem,i,previous,a):
        if i==d:
            m=sum(a)
            y=[z+d-i-1 for i,z in enumerate(a)]
            V=prod(y[i]-y[j] for i in range(d) for j in range(i+1,d))
            numer=fac[m]*V
            den=prod(fac[z] for z in y)
            f=numer//den
            assert f*den==numer
            shapes[m].append((f,y))
            return
        for z in range(min(rem,previous)+1):
            build(rem-z,i+1,z,a+(z,))
    build(N,0,N,())
    f=[sum(k*k for k,_ in L) for L in shapes]
    A=f[:]
    for m,L in enumerate(shapes):
        for k,y in L:
            if y[-1]==0:continue
            Y=prod(y)
            for r in range(1,N-m+1):
                base=comb(m+r,m)*k*Y
                denom=prod(z+r for z in y)
                f_full=base//denom
                assert denom*f_full==base
                A[m+r]+=k*f_full
    return A

def ODE():
    # Coefficients in increasing order of x, one list per derivative.
    import sympy as s
    x=s.symbols('x')
    polys=[200*x**5-700*x**4+716*x**3-329*x**2+76*x-8,
           x*(2*x-1)*(800*x**4-1850*x**3+1277*x**2-339*x+28),
           x**2*(2*x-1)*(650*x**4-1375*x**3+909*x**2-227*x+16),
           x**3*(x-1)*(5*x-2)*(10*x-1)*(2*x-1)**2]
    return [{i[0]:int(c) for i,c in s.Poly(P,x).terms()} for P in polys]

def residual(a):
    N=len(a)-1
    Ps=ODE(); r=[8,-40,50]+[0]*(N-2)
    for k,P in enumerate(Ps):
        for e,c in P.items():
            for n in range(e,N+1):
                j=n-e+k
                r[n]+=c*a[j]*prod(range(j-k+1,j+1))
    return r

if __name__=='__main__':
    N=int(sys.argv[1]) if len(sys.argv)>1 else 60
    a=exact_counts(3,N)
    assert all(x==0 for x in residual(a)), [i for i,x in enumerate(residual(a)) if x]
    print('Literal Bóna–Pantone conjectural differential equation verified through degree',N)
    print('First coefficients:',a[:12])
