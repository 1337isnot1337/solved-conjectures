#!/usr/bin/env python3
"""Exact rational-function identities used in the all-length proof."""
import sympy as S

s,x,k,z,a,b = S.symbols('s x k z a b')
u = 1/(1-k)
c = 1+k*u/z
K = S.Matrix([
    [1-x/s-k*u/(z*(1-u*s))-(x/s)*(1/(1-u*s)-1/(1-s)), -x*k/(s*(1-s))],
    [-c/(1-u*s)+1/(1-s), 1-x/s-k/(1-s)]
])
C = (-k*k*s*(z+1)-k*s*s*(2*z+1)+2*k*s*x*z+2*k*s*z+k*s-k*x*z
     -s**3*z+s*s*x*z+2*s*s*z-2*s*x*z-s*z+x*z)
D = 1-k-2*s+2*k*s+s*s
base = (k*s*z-k*s-k*z-s*z+z)/(z*D)
moment = (2*k*k*s*z-k*k*z+2*k*s*s*z-k*s*s-4*k*s*z+k*s+2*k*z
          -s*s*z+2*s*z-z)/(z*(k+s-1)*D)

def same(x,y):
    assert S.cancel(x-y) == 0

same(K.det(), (x-s)*C/(s*s*z*(s-1)*(k+s-1)))
same(C.subs(s,x), -k*x*(k*z+k+x-z-1))
for F,G,expected in [(1/(1-s),1/(1-s),base), (1/(1-u*s),u/(1-u*s),moment)]:
    E = K[0,0]*(F-b)-K[1,0]*(x*G-a)
    w = S.cancel(E.subs(s,x).diff(a))
    assert w != 0
    same(E.subs(s,x),w*(a-b+1))
    E = E.subs(a,b-1)
    w = S.cancel(E.diff(b))
    assert w != 0
    print('nonzero beta elimination factor:', S.factor(w))
    same(E,w*(b-expected))
same(moment-base-k/x*(base-1)**2,
     k*s*(k*z+k+s*z-z)*C/(x*z*z*(k+s-1)*D*D))
print('Exact rational identities verified.')
