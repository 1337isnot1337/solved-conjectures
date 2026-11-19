"""Exact positive cones of maximal-independent-set messages on tree balls."""
from fractions import Fraction
from math import gcd
from functools import cache


def primitive(ray):
    divisor=gcd(*ray)
    return tuple(z//divisor for z in ray) if divisor else None


def orient(p,q,r):
    a,b,c=p
    u,v,w=q
    x,y,z=r
    return a*(v*z-w*y) + b*(w*x-u*z) + c*(u*y-v*x)


def hull(rays):
    unique={v for ray in rays if (v:=primitive(ray)) is not None}
    ordered=sorted(unique,key=lambda v:(Fraction(v[0],sum(v)),Fraction(v[1],sum(v))))
    if len(ordered)<3:
        return tuple(ordered)
    def chain(items):
        acc=[]
        for v in items:
            while len(acc)>=2 and orient(acc[-2],acc[-1],v)<=0:
                acc.pop()
            acc.append(v)
        return acc
    polygon=tuple(chain(ordered)[:-1]+chain(reversed(ordered))[:-1])
    if len(polygon)==2:
        assert all(orient(*polygon,r)==0 for r in ordered)
    else:
        assert all(orient(polygon[i-1],polygon[i],r)>=0
                   for i in range(len(polygon)) for r in ordered)
    return polygon


@cache
def children(incoming,d):
    factors=[(b+c,a+b,b) for a,b,c in incoming]
    products=((1,1,1),)
    for _ in range(d):
        products=hull((u*i,v*j,w*k) for u,v,w in products for i,j,k in factors)
    return hull((u,v-w,w) for u,v,w in products)


def fraction_at_root(P,d):
    # Hölder shows the exact maximum over arbitrary child messages comes
    # from d equal extreme rays.
    return max(Fraction((b+c)**d,(b+c)**d+(a+b)**d-b**d) for a,b,c in P)


def radius(k,d,depth):
    p=q=((1,0,0),(0,1,0),(0,0,1))
    for _ in range(depth):
        p,q=children(q,d-1),children(p,k-1)
    return fraction_at_root(q,d)


if __name__=='__main__':
    for k in range(3,15):
        f=radius(k,3,6)
        assert f <= Fraction(481792,1000000)
        # Upward rounding keeps this reported bound rigorous.
        print(k,(1000000*f.numerator+f.denominator-1)//f.denominator,flush=True)
    assert 2 * 15 * Fraction(3,4)**15 <= Fraction(20,49)
