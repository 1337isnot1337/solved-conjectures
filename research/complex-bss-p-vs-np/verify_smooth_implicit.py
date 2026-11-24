#!/usr/bin/env python3
"""Exact truncated Newton--Hensel check on a two-branch implicit system."""
from fractions import Fraction as F

D = 4
def const(c):
    return [F(c)] + [F(0)] * D
def add(a,b):
    return [a[i]+b[i] for i in range(D+1)]
def neg(a):
    return [-v for v in a]
def sub(a,b):
    return add(a,neg(b))
def mul(a,b):
    return [sum((a[i]*b[k-i] for i in range(k+1)),F(0))
            for k in range(D+1)]
def inverse(a):
    assert a[0]
    b=[F(0)]*(D+1)
    b[0]=1/a[0]
    for k in range(1,D+1):
        b[k]=-b[0]*sum(a[i]*b[k-i] for i in range(1,k+1))
    assert mul(a,b)==const(1)
    return b

x=[F(0),F(1)]+[F(0)]*(D-1)
t=add(const(1),x)
target=mul(t,t)
u=const(1)
y=const(1)
for k in range(3):
    eq1=sub(mul(u,u),target)
    eq2=sub(y,mul(u,u))
    # J_z=[[0,2u],[1,-2u]].
    # J_z^{-1}F=(F1+F2, F1/(2u)).
    y=sub(y,add(eq1,eq2))
    u=sub(u,mul(eq1,inverse(mul(const(2),u))))
    print(f"iteration {k+1}: y={y}, u={u}")
assert y==target
assert u==t
print("smooth implicit Newton lifting passes")
