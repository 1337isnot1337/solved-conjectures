"""Exact interval proof of the dandelion localization for all n >= N."""
from fractions import Fraction as Q
from math import isqrt
from collections import Counter
import sys

SCALE = 10**7
BINS = 150
SPLITS = [Q(i, 100) for i in range(18, 67)]

def root_bounds(v):
    assert v >= 0
    k = isqrt(v.numerator * SCALE**2 // v.denominator)
    return Q(k, SCALE), Q(k+1, SCALE)

def degree_bound(m, lam):
    """A coordinate >= m at an eigenvalue <= lam forces this degree bound."""
    assert m > 0
    def allowed(k):
        return k <= lam or Q(k) >= (m*(k-lam))**2
    a, b = 0, 1
    while allowed(b):
        a, b = b, 2*b
    while b-a > 1:
        mid = (a+b)//2
        if allowed(mid):
            a = mid
        else:
            b = mid
    return a

def opposite(n, k, lam):
    if n-k-lam <= 0:
        raise ArithmeticError
    return root_bounds(Q(k))[1]/(n-k-lam)

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
        e = degree_bound(h, yu)
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
    d = degree_bound(m, xu)
    if d < p:
        return "first degree"
    if p == 1:
        d = 1
    if not high_h:
        j = degree_bound((1-xu/p)*m, xu)
        h2 = (2-yu)/(star(n,d)+star(n,j)) if max(d,j)<n else Q(0)
        h1 = max(1-yu,0)/star(n,d) if d<n else Q(0)
        h = root_bounds(max(h2,h1))[0]
        if h > cut:
            return "initial split"
        if not h:
            return None
        e = degree_bound(h, yu)
    if not e or (e == 1 and p == 1):
        return "second degree"
    aa = opposite(n,e,xu)
    bl = opposite(n,d,yu)
    t = degree_bound((1-xu)*m,xu)
    if n-t-yu > 0:
        bl = min(bl,d*opposite(n,t,yu)/(n-d-yu))
    if aa >= (1-xu)*m:
        return None
    xu = min(xu,D-1+bl/h)
    if xl > xu:
        return "first coordinate"
    # After l is a missing neighbour, a_h itself is smaller than
    # the initial upper bound on its absolute value.
    if e == 1:
        aa = Q(0)
    else:
        v0 = (2-yu)*h-bl
        if v0 > 0:
            t = degree_bound(v0,yu)
            if n-t-xu > 0:
                av0 = opposite(n,t,xu)
                aa = min(aa,max(0,(e-1)*av0-m)/(n-e-xu))
    z = (1-xu/p)*m
    j = degree_bound(z,xu)
    bw = opposite(n,j,yu)
    if 2-(bl+bw)/h <= yu:
        return None
    if p == 2:
        return "first leaf" if (2-xu)*(1-xu/2)>1+aa/m else None
    if 1-aa/z <= xu:
        return None
    xl = max(xl, (3-root_bounds(5+4*aa/m)[1])/2)
    if xl > xu:
        return "second coordinate"
    yu = min(yu,D-xl)
    v = (2-yu)*h-bl
    if v <= max(bl,bw):
        return None
    ev = degree_bound(v,yu)
    av = opposite(n,ev,xu)
    if (3-xu)*(1-xu) <= 1+(aa+av)/m:
        return None
    coeff = (3-yu)*(2-yu)-1
    if coeff*h <= (4-yu)*bl+bw:
        return None
    return "second leaf"

def check(n):
    # Theorem 4.4 from Barrett--Evans--Hall--Kempton:
    # alpha + 1 + 1/order bounds the dandelion target strictly above.
    D = Q(691,500)+Q(1,n)
    assert (3-2*Q(191,500))**2 < 5
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
    n = int(sys.argv[1]) if len(sys.argv)>1 else 65
    ok, info = check(n)
    print(n, ok, info)
    assert ok
