"""Exact Bernstein certificates for two-by-two substochastic Hwang cores.

Only stdlib and SymPy; all certificate arithmetic is integer/rational.
"""
from collections import defaultdict
from itertools import product
from math import comb, lcm
from random import Random
import sympy as sp

x, y, z, h = sp.symbols("x y z h")  # [[x,y],[z,h]]
u, v, w, q = sp.symbols("u v w q")
entries = (x, y, z, h)
rows = (x + y, z + h)
cols = (x + z, y + h)
S = sum(entries)
Z = sp.prod(1 - r for r in rows) * sp.prod(1 - c for c in cols)
Z += x * (1 - rows[1]) * (1 - cols[1])
Z += y * (1 - rows[1]) * (1 - cols[0])
Z += z * (1 - rows[0]) * (1 - cols[1])
Z += h * (1 - rows[0]) * (1 - cols[0])
Z += x*h + y*z
Z = sp.expand(Z)

def euler(f):
    return sp.expand(sum(t*sp.diff(f, t) for t in entries))

EZ = euler(Z)
Q = sp.expand(S*Z + EZ)
R = sp.expand(S*S*Z + 2*S*EZ + euler(EZ) - EZ)
T = sum(a*a for a in entries)


def certificate(poly, degree):
    """Check all Bernstein coefficients nonnegative by exact integers.

    If f = sum a_alpha z^alpha, Bernstein coefficient indexed by i is
    [sum_alpha a_alpha prod_j binom(d_j-alpha_j, i_j-alpha_j)] /
    prod_j binom(d_j,i_j). Clear the power coefficient denominators.
    """
    p = sp.Poly(sp.expand(poly), q, w, u, v, domain=sp.QQ)
    assert all(a <= d for a, d in zip(p.degree_list(), degree))
    den = lcm(*(int(c.q) for _, c in p.terms()))
    accum = defaultdict(int)
    for ex, coeff in p.terms():
        numerator = int(den * coeff)
        for idx in product(*(range(a, d+1) for a, d in zip(ex, degree))):
            multiplier = 1
            for a, d, i in zip(ex, degree, idx):
                multiplier *= comb(d-a, i-a)
            accum[idx] += numerator*multiplier
    all_indices = product(*(range(d+1) for d in degree))
    vals = [accum[idx] for idx in all_indices]
    assert len(vals) == sp.prod(d+1 for d in degree)
    assert min(vals) >= 0, (min(vals), degree)
    return {"degrees": degree, "denominator": den,
            "coefficients": len(vals), "zero_coefficients": vals.count(0),
            "minimum": min(vals), "maximum": max(vals)}


def substitute(poly, half):
    """Parametrize all 2x2 substochastic cores up to symmetries.

    Let p=max(x,h), r=max(y,z), p+r<=1. After relabeling, x=p,
    y=r, h<=p, z<=r. At activity t, write t(p+r)=w for the full
    interval and 2t(p+r)=w for t<=1/2. The split is q=r/(p+r).
    """
    X = (1-q)*w/(2 if half else 1)
    Y = q*w/(2 if half else 1)
    return sp.expand(poly.subs({x:X, y:Y, z:Y*v, h:X*u}, simultaneous=True))


if __name__ == "__main__":
    derivative = substitute(Q - T/sp.Integer(8), False)
    curvature = substitute(R - T/sp.Integer(4), True)
    print("derivative certificate", certificate(derivative, (14,5,3,3)))
    print("curvature certificate", certificate(curvature, (8,6,4,4)))

    # Independent finite matching sum and direct time differentiation,
    # using rational data rather than the symbolic Euler operator.
    rng = Random(346331)
    t = sp.symbols("t")
    for _ in range(80):
        a,b,c,d = (sp.Rational(rng.randrange(0,10),10) for _ in range(4))
        scale = max(a+b,c+d,a+c,b+d,sp.Integer(1))
        a,b,c,d = (j/scale for j in (a,b,c,d))
        vals = {x:a,y:b,z:c,h:d}
        rr = (a+b,c+d); cc=(a+c,b+d)
        zt = sp.prod(1-t*r for r in rr)*sp.prod(1-t*co for co in cc)
        zt += t*a*(1-t*rr[1])*(1-t*cc[1])
        zt += t*b*(1-t*rr[1])*(1-t*cc[0])
        zt += t*c*(1-t*rr[0])*(1-t*cc[1])
        zt += t*d*(1-t*rr[0])*(1-t*cc[0])
        zt += t*t*(a*d+b*c)
        et = sp.expand(Z.subs({x:t*a,y:t*b,z:t*c,h:t*d}))
        assert sp.expand(zt-et)==0
        sig = a+b+c+d
        qdirect = sp.expand(t*(sig*zt+sp.diff(zt,t)))
        rdirect = sp.expand(t*t*(sig*sig*zt+2*sig*sp.diff(zt,t)+sp.diff(zt,t,2)))
        assert sp.expand(qdirect-Q.subs({x:t*a,y:t*b,z:t*c,h:t*d}))==0
        assert sp.expand(rdirect-R.subs({x:t*a,y:t*b,z:t*c,h:t*d}))==0
    print("independent rational enumerations and radial derivatives: 80 passed")
