#!/usr/bin/env python3
"""Exact checks for a failed Eulerian-transform approach; not a conjecture proof."""
import sympy as sp

x, y, s, r, u = sp.symbols("x y s r u")
P = [sp.Integer(1)]
for n in range(7):
    P.append(sp.expand(x * (1-x) * sp.diff(P[n], x) + (n+1) * x * P[n]))

def transform(p):
    return sp.expand(sum(c * P[k] for (k,), c in sp.Poly(p, x).terms()))

p = x * (x*x+s*x+1)**3
q = transform(p)
displayed = (
    x**7 + (3*s+120)*x**6 + (3*s*s+171*s+1194)*x**5
    + (s**3+78*s*s+912*s+2494)*x**4
    + (11*s**3+201*s*s+972*s+1392)*x**3
    + (11*s**3+90*s*s+240*s+210)*x**2
    + (s**3+6*s*s+12*s+8)*x
)
assert sp.expand(q-displayed) == 0
scaled = sp.Poly(sp.expand(q.subs({s:r**3, x:-r**3+r*r*u},
                                 simultaneous=True)), r)
assert scaled.degree() == 18
assert sp.expand(scaled.LC()-(u**3+16)) == 0

def D(f):
    return sp.expand(y * sp.diff(f, y))

Q = []
for n in range(7):
    Q.append(sp.expand(sum(c*y**k*P[k]
                          for (k,), c in sp.Poly(P[n], x).terms())))
for n in range(6):
    inner = sp.expand((1-x)*sp.diff(Q[n], x) + D(Q[n]) + Q[n])
    rhs = D(Q[n]) + x*y*((n+1)*inner-D(inner))
    assert sp.expand(rhs-Q[n+1]) == 0
assert sp.expand(Q[2]-x*y*(1+y+x*y)) == 0
assert sp.expand((1+y+x*y).subs({x:sp.I,y:(-1+sp.I)/2})) == 0
print("PASS: exact counterfamily polynomial, universal scaling limit, and recurrence identities.")
print("Mao-Wang's Eulerian-square clause remains unresolved here.")
