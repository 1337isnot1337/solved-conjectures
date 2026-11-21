"""Exact squared radii for real centered rank-one perturbations (SymPy)."""
from functools import lru_cache
from math import comb
import sympy as sp

w, s = sp.symbols("w s")


@lru_cache(maxsize=None)
def directional(n, a, b):
    """Normalized permanent minus one, in the rational parameter w."""
    x = [n-a, -a]
    y = [n-b, -b]
    base = [[sp.Poly(1+w*u*v,w,domain=sp.QQ) for v in y] for u in x]
    acc = sp.Poly(0,w,domain=sp.QQ)
    for j in range(max(0,a+b-n), min(a,b)+1):
        term = base[0][0]**j * base[0][1]**(a-j)
        term *= base[1][0]**(b-j) * base[1][1]**(n-a-b+j)
        acc += comb(b,j)*comb(n-b,a-j)*term
    return acc.mul_ground(sp.Rational(1,comb(n,a)))-1


def crossing_polynomial(n,a,b):
    f = directional(n,a,b).exquo(sp.Poly(w*w,w,domain=sp.QQ))
    odd = sp.Poly(1,w,domain=sp.QQ)
    for factor, multiplicity in f.sqf_list()[1]:
        if multiplicity % 2:
            odd *= factor
    even = odd*odd.transform(sp.Poly(-w,w),sp.Poly(1,w))
    scale = a*(n-a)*b*(n-b)
    coeffs = {}
    for (degree,), value in even.terms():
        assert degree % 2 == 0
        j = degree//2
        coeffs[(j,)] = value / scale**j
    return sp.Poly.from_dict(coeffs,s,domain=sp.QQ).sqf_part().monic()


def squared_radius(n):
    """Return the exact radius squared as the first positive root, or infinity."""
    if n < 2:
        raise ValueError("order must be at least two")
    envelope=sp.Poly(1,s,domain=sp.QQ)
    for a in range(1,n//2+1):
        for b in range(a,n//2+1):
            envelope=sp.lcm(envelope,crossing_polynomial(n,a,b))
    if envelope.degree()==0:
        return sp.oo
    roots=envelope.real_roots(radicals=False)
    return next((x for x in roots if x.is_positive),sp.oo)


if __name__ == "__main__":
    import argparse
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("order",type=int)
    radius_squared=squared_radius(parser.parse_args().order)
    print(radius_squared)
