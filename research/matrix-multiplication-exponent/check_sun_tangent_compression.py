#!/usr/bin/env python3
"""Exact raw-record expansion of the six-product tangent replacement."""

from collections import defaultdict
from itertools import product


def add_rank_one(out, x, y, z, scalar=1):
    # Entries of a linear form are (Laurent exponent, variable name, coefficient).
    for a,b,c in product(x,y,z):
        out[(a[0]+b[0]+c[0],a[1],b[1],c[1])] += scalar*a[2]*b[2]*c[2]


def clean(t):
    return {m:c for m,c in t.items() if c}


def unit(name, degree=0):
    return [(degree,name,1)]


def shift(form, degree):
    return [(d+degree,v,c) for d,v,c in form]


def check_cq(q):
    """Replay the q+2-product source certificate, with integer coefficients."""
    out = defaultdict(int)
    for i in range(1, q+1):
        forms = [unit(p+'0')+unit(p+str(i), 1) for p in 'xyz']
        add_rank_one(out, shift(forms[0], -2), forms[1], forms[2])
    aggregate = [unit(p+'0')+[(2,p+str(i),1)
                 for i in range(1,q+1)] for p in 'xyz']
    add_rank_one(out, shift(aggregate[0], -3), aggregate[1], aggregate[2], -1)
    corner = [unit(p+'0')+unit(p+'inf', 3) for p in 'xyz']
    # The two scalar terms here are one common scalar times one product.
    add_rank_one(out, shift(corner[0], -3), corner[1], corner[2])
    add_rank_one(out, shift(corner[0], -2), corner[1], corner[2], -q)
    out = clean(out)
    expected = defaultdict(int)
    for i in range(1,q+1):
        xx, yy, zz = (unit(p+str(i)) for p in 'xyz')
        add_rank_one(expected, unit('x0'), yy, zz)
        add_rank_one(expected, xx, unit('y0'), zz)
        add_rank_one(expected, xx, yy, unit('z0'))
    for infinity_party in range(3):
        forms = [unit(p+('inf' if j==infinity_party else '0'))
                 for j,p in enumerate('xyz')]
        add_rank_one(expected, *forms)
    assert not any(m[0] < 0 for m in out)
    assert {m:c for m,c in out.items() if m[0]==0} == clean(expected)
    assert len(clean(expected)) == 3*q+3
    return {'q':q,'rank_one_products':q+2,'leading_monomials':3*q+3,
            'negative_coefficients':0}


def main():
    # All record components remain distinct. No physical source collapse.
    a = [(0,'a_'+tag,1) for tag in ('A3','B1','B2','R')]
    v = [(0,'v_'+tag,1) for tag in ('A1','Q')]
    b,u,z,s,c,w,rr = [unit(n) for n in ('b','u','z','s_P','c_C1','w','r')]
    endpoint = [(unit('e_bar'),unit('endpoint_y_'+str(j)),
                 unit('endpoint_z_'+str(j))) for j in range(3)]

    six = defaultdict(int)
    add_rank_one(six,shift(b+shift(a,1),-1),u+shift(v,1),z+shift(s,1))
    add_rank_one(six,shift(b,-1),u,z,-1)
    add_rank_one(six,c,w,rr)
    for xx,yy,zz in endpoint:
        add_rank_one(six,xx,yy,zz)
    six = clean(six)

    leading = defaultdict(int)
    for xx,yy,zz in ((a,u,z),(b,v,z),(b,u,s),(c,w,rr),*endpoint):
        add_rank_one(leading,xx,yy,zz)
    expected = defaultdict(int,leading)
    for xx,yy,zz in ((a,v,z),(a,u,s),(b,v,s)):
        add_rank_one(expected,shift(xx,1),yy,zz)
    add_rank_one(expected,shift(a,2),v,s)
    assert six == clean(expected)
    assert not any(m[0] < 0 for m in six)
    assert {m:c for m,c in six.items() if m[0]==0} == clean(leading)
    assert len(clean(leading)) == 11
    source_certificates = [check_cq(q) for q in (2,3)]
    assert 14*5+6*4+7*2+5*4 == 128
    assert 13*5+6*4+6*2+5*4 == 121
    assert 16*(128-(5+2)+6) == 2032
    assert 2*32*32-5-1 == 2042
    assert 2032 < 2042
    print({'rank_one_products':6,'distinct_leading_records':11,
           'dense_records':8,'endpoint_records':3,
           'negative_coefficients':0,'one_pair_upper_bound':2032,
           'remaining_source_budget':121,'source_certificates':source_certificates,
           'imported_M32_lower_bound':2042,'status':'passed',
           'scope':'The complete printed tangent ledger plus fixed downstream maps is inconsistent with M32; alternative source maps are not tested.'})


if __name__ == '__main__':
    main()

