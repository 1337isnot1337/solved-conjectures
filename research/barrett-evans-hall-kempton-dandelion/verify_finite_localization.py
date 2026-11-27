"""Exact interval proof of dandelion localization for intermediate orders."""
from fractions import Fraction as Q
from math import isqrt
from collections import Counter
from functools import cache
import sys

SCALE = 10**7
BINS = 150
SPLITS = [Q(i, 100) for i in range(18, 67)]

def root_bounds(v):
    assert v >= 0
    k = isqrt(v.numerator * SCALE**2 // v.denominator)
    return Q(k, SCALE), Q(k+1, SCALE)

@cache
def coefficients(n, lam):
    result = []
    for k in range(1, n-1):
        p = min(lam, Q(k*n,n-1))
        result.append(1+(k-p)**2/k+(k+1-p)**2/(n-1-k))
    return result

def degree_bound(n, m, lam):
    if m <= 0:
        return n-2
    q = m*m
    cs = coefficients(n,lam)
    for d in range(n-2,0,-1):
        if q*cs[d-1] <= 1:
            return d
    return 0

@cache
def opposite(n, k, lam):
    # Maximize the coordinate bound over every possible missing-set size.
    if k <= 0:
        return Q(0)
    cs = coefficients(n,lam)
    u = min(cs[n-2-min(k,n-2):])
    return root_bounds(1/u)[1]

def star(n, k):
    if n <= k:
        raise ArithmeticError
    return Q(n*k, n-k)

def branch(n, D, xl, xu, cut, high_h, p):
    """Return an exact reason the branch is impossible or has both leaves.

    The branches are H >= cut or H <= cut, and d_l = 1 (p=1)
    or d_l >= 2 (p=2). The closed H ranges may overlap at cut.
    """
    yu = D-xl
    if high_h:
        h = cut
        e = degree_bound(n,h,yu)
        if not e:
            return "disconnected"
        m = root_bounds((1-xu)/star(n,e))[0]
    else:
        m2 = (1-4*xu*cut**2)/(4*yu)
        if m2 <= 0:
            return None
        m = root_bounds(m2)[0]
    if m == 0:
        return None
    d = degree_bound(n,m,xu)
    if d < p:
        return "first degree"
    if p == 1:
        d = 1
    if not high_h:
        j = degree_bound(n,(1-xu/p)*m,xu)
        if j == 0:
            return "first neighbour"
        h2 = (2-yu)/(star(n,d)+star(n,j)) if max(d,j)<n else Q(0)
        h1 = max(1-yu,0)/star(n,d) if d<n else Q(0)
        h = root_bounds(max(h2,h1))[0]
        if h > cut:
            return "initial split"
        if not h:
            return None
        e = degree_bound(n,h,yu)
    if not e or (e == 1 and p == 1):
        return "second degree"
    aa = opposite(n,e,xu)
    bl = opposite(n,d,yu)
    t = degree_bound(n,(1-xu)*m,xu)
    if n-t-yu > 0:
        bl = min(bl,d*opposite(n,t,yu)/(n-d-yu))
    ratio = min(bl/h, sum(min(1,opposite(n,degree_bound(n,(1-xu/i)*m,xu),yu)/h)
                         for i in range(1,d+1))/(n-d-yu))
    if aa >= (1-xu)*m:
        return None
    xu = min(xu,D-1+ratio)
    if xl > xu:
        return "first coordinate"
    # After l is a missing neighbour, a_h itself is smaller than
    # the initial upper bound on its absolute value.
    if e == 1:
        aa = Q(0)
    else:
        v0 = (2-yu)*h-min(bl,ratio*h)
        if v0 > 0:
            t = degree_bound(n,v0,yu)
            if n-t-xu > 0:
                av0 = opposite(n,t,xu)
                aa = min(aa,max(0,(e-1)*av0-m)/(n-e-xu))
    z = (1-xu/p)*m
    j = degree_bound(n,z,xu)
    bw = opposite(n,j,yu)
    if 2-ratio-bw/h <= yu:
        return None
    if p == 2:
        return "first leaf" if (2-xu)*(1-xu/2)>1+aa/m else None
    if 1-aa/z <= xu:
        return None
    xl = max(xl, (3-root_bounds(5+4*aa/m)[1])/2)
    if xl > xu:
        return "second coordinate"
    yu = min(yu,D-xl)
    v = (2-yu)*h-min(bl,ratio*h)
    if v <= max(bl,bw):
        return None
    ev = degree_bound(n,v,yu)
    av = opposite(n,ev,xu)
    if (3-xu)*(1-xu) <= 1+(aa+av)/m:
        return None
    coeff = (3-yu)*(2-yu)-1
    if coeff*h <= (4-yu)*min(bl,ratio*h)+bw:
        return None
    return "second leaf"

def dandelion(n):
    q=65536
    def f(r):
        return r**3-(n+2)*r*r*q+(3*n-2)*r*q*q-n*q**3
    def bracket(a,b):
        assert f(a)<0<f(b)
        while b-a>1:
            m=(a+b)//2
            if f(m)<0:
                a=m
            else:
                b=m
        return a,b
    return Q(bracket(0,q)[1]+n*q-bracket((n-1)*q,n*q)[0],q)

def check(n):
    # Theorem 4.4 from Barrett--Evans--Hall--Kempton:
    # alpha + 1 + 1/order bounds the dandelion target strictly above.
    D = dandelion(n)
    summary = Counter()
    for k in range(BINS):
        lo, hi = D*k/(2*BINS), D*(k+1)/(2*BINS)
        for split in SPLITS:
            try:
                out = [branch(n,D,lo,hi,split,s,p)
                       for s in (False,True) for p in (1,2)]
            except ArithmeticError:
                continue
            if all(out):
                summary.update(out)
                break
        else:
            return False, (lo,hi)
    return True, summary

if __name__ == "__main__":
    n_min=int(sys.argv[1]) if len(sys.argv)>1 else 28
    n_max=int(sys.argv[2]) if len(sys.argv)>2 else n_min
    passed=True
    for n in range(n_min,n_max+1):
        ok,info=check(n)
        passed &= ok
        print(n,ok,info,flush=True)
        coefficients.cache_clear()
        opposite.cache_clear()
    if not passed:
        raise SystemExit(1)
