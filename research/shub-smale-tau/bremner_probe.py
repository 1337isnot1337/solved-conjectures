"""Exact exploratory checks of Bremner's first degree-16 family.

Source: Experimental Mathematics 17(4), 2008, pp.385--390, equation (2-7)
and the inverse map on p.389.  This is a finite construction search, not
a nonexistence proof or an asymptotic claim.
"""
from fractions import Fraction as F
from math import isqrt


def point_add(P, Q):
    if P is None:
        return Q
    if Q is None:
        return P
    x, y = P
    u, v = Q
    if x == u and y == -v:
        return None
    slope = ((v-y)/(u-x) if x != u
             else (3*x*x-2*x-30)/(2*y))
    z = slope*slope+1-x-u
    return z, -y+slope*(x-z)


def gem(P):
    X, Y = P
    x = (-21+4*X)*(3-10*X+2*X*X+Y)
    y = 171+102*X-44*X*X-69*Y-4*X*Y
    z = (-21+4*X)*(-15+5*X+2*Y)
    A = x*x*y-x*y*y+3*x*z*z-7*y*z*z
    C = x*x*y-x*y*y+7*x*z*z-3*y*z*z
    E = -z*(x*x+y*y+2*x*z+2*y*z-10*z*z)
    G = -z*(x*x+y*y-2*x*z-2*y*z-10*z*z)
    B = z*(x*x+2*x*y-y*y+10*z*z)
    D = -z*(x*x-2*x*y-y*y-10*z*z)
    total = (2*x*x*y-2*x*y*y+2*x*x*z+4*x*y*z+2*y*y*z
             +10*x*z*z-10*y*z*z)
    difference = -8*(x+y)*z**3*(x*x+y*y-10*z*z)
    if not total:
        return None
    Rf = (total+difference/total)/2
    Rh = (total-difference/total)/2
    roots = A, B, C, D, E, Rf, G, Rh
    if len(set(abs(a) for a in roots)) < 8 or any(a == 0 for a in roots):
        return None
    assert A*A+B*B == C*C+D*D == E*E+Rf*Rf == G*G+Rh*Rh
    assert A*A*B*B+C*C*D*D == E*E*Rf*Rf+G*G*Rh*Rh
    p = (A*A+B*B)/2
    q = (((A*A-B*B)/2)**2+((C*C-D*D)/2)**2)/2
    u = (A*A*B*B-C*C*D*D)/2
    v = (E*E*Rf*Rf-G*G*Rh*Rh)/2
    r = (u*u+v*v)/2
    s = (u*u-v*v)/2
    for a in roots:
        assert (((a*a-p)**2-q)**2-r)**2 == s*s
    return p, q/(p*p), r/(p**4), (s*s)/(p**8)


def probe(limit=20):
    P, Q = (F(2), F(4)), None
    seen, repeated, prefix_candidates, extensions = {}, [], [], []
    valid = 0
    for k in range(1, limit+1):
        Q = point_add(Q, P)
        for sign in (1, -1):
            item = gem((Q[0], sign*Q[1]))
            if not item:
                continue
            p, q, r, last = item
            valid += 1
            for hadamard in (False, True):
                key = (1-q if hadamard else q, r)
                label = (sign*k, hadamard)
                effective_p = 2*p if hadamard else p
                if key in seen:
                    old_label, old_p, old_last = seen[key]
                    if old_last != last:
                        prefix_candidates.append((old_label, label))
                        ratio = effective_p/old_p
                        if (isqrt(ratio.numerator)**2 == ratio.numerator
                                and isqrt(ratio.denominator)**2 == ratio.denominator):
                            extensions.append((old_label, label))
                    else:
                        repeated.append((old_label, label))
                else:
                    seen[key] = label, effective_p, last
    return dict(multiples_tested=2*limit, valid=valid,
                prefix_keys=len(seen), prefix_candidates=prefix_candidates,
                extensions=extensions,
                repeated_prefixes=repeated)


if __name__ == "__main__":
    import argparse
    import json
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=20)
    args = parser.parse_args()
    print(json.dumps(probe(args.limit)))
