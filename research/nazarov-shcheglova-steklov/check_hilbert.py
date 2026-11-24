#!/usr/bin/env python3
"""Exact rational sign and integral certificates for Hilbert orders 4–13.

No numerical grid inference: Bernstein coefficients give whole-interval
bounds, and each square root is rounded upward using integer arithmetic.
"""
from fractions import Fraction as Q
from math import comb, isqrt


def add(p, q):
    r = [Q(0)] * max(len(p), len(q))
    for i, c in enumerate(p):
        r[i] += c
    for i, c in enumerate(q):
        r[i] += c
    return r


def scale(p, q):
    return [c*q for c in p]


def mul(p, q):
    r = [Q(0)] * (len(p) + len(q) - 1)
    for i, c in enumerate(p):
        for j, d in enumerate(q):
            r[i+j] += c*d
    return r


def power(p, n):
    r = [Q(1)]
    for _ in range(n):
        r = mul(r, p)
    return r


def der(p):
    return [i*c for i, c in enumerate(p) if i]


def bernstein(p, a, b):
    """Bernstein coefficients on [a,b], first via monomials in (x-a)/(b-a)."""
    degree = len(p) - 1
    mono = [(b-a)**k * sum(p[j]*comb(j,k)*a**(j-k)
                            for j in range(k,degree+1))
            for k in range(degree+1)]
    return [sum(mono[k]*Q(comb(j,k),comb(degree,k)) for k in range(j+1))
            for j in range(degree+1)]


def bisect(v):
    """Exact de Casteljau split at midpoint."""
    left, right = [v[0]], [v[-1]]
    while len(v) > 1:
        v = [(a+b)/2 for a,b in zip(v,v[1:])]
        left.append(v[0])
        right.append(v[-1])
    return left, right[::-1]


def certify(v, budget):
    if min(v) >= 0:
        return 1
    if not budget or v[0] < 0 or v[-1] < 0:
        raise AssertionError("No nonnegativity certificate")
    left, right = bisect(v)
    return certify(left, budget-1) + certify(right, budget-1)


def kernel(n):
    m, F = Q(2*n-1, 2), [Q(0)]*(2*n)
    for k in range(n):
        c = (2*n-1)*(-1)**k*Q(comb(n-1,k), 2*(n-1-k)+1)
        F[2*k] += c
        F[2*n-1] -= c
    f = scale(der(F), -1)
    f2 = mul(f,f)
    diagonal = mul(power([Q(1),Q(0),Q(-1)],2*n-3),
                   [m/(m-1),Q(0),4*m*m])
    d2 = add(diagonal,scale(f2,-1))
    return F,f,f2,d2


for n in range(4,14):
    F,f,f2,d2 = kernel(n)
    W = add([Q(1)],scale(F,-1))
    if n == 4:
        a,c0,c1 = Q(3,11),Q(7,80),Q(1,15)
    else:
        a,c0,c1 = Q(1,4),Q(1,15),Q(1,20)
    near = add(scale(f2,c0),scale(mul(d2,W),-1))
    far = add(scale(f2,c1),scale(mul(d2,F),-1))
    cells = (certify(bernstein(near,Q(0),a),14),
             certify(bernstein(far,a,Q(1)),14))
    assert 8*(c0+c1) < (Q(5,4) if n == 4 else Q(1))
    print(f"Order {n}: near/far polynomial nonnegativity in {cells} exact Bernstein cells")


def sqrt_upper(q):
    assert q >= 0
    grid = 100_000
    return Q(isqrt(q.numerator*grid**2//q.denominator)+1, grid)


F,f,_,d2 = kernel(4)
count, lam = 128, Q(2,5)
excess = 0
for j in range(count):
    a,b = Q(j,count),Q(j+1,count)
    hi = max(bernstein(d2,a,b))
    lo = max(Q(0), min(bernstein(f,a,b)))
    excess += max(Q(0), sqrt_upper(hi)-lam*lo)
bound = 2*excess/count
assert bound + lam < Q(19,20)
print(f"Order 4: exact bound on integral excess + 2/5 = {bound+lam} < 19/20")
