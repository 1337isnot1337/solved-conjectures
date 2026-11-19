"""Generate exact cone-reduction witnesses; Lean must check every identity.

The convex-hull routine only proposes a smaller generating set. Each input
product is accompanied by an integer nonnegative-span identity, so the
accepted proof need not trust hull enumeration or orientation calculations.
"""
from pathlib import Path
from itertools import combinations_with_replacement
from math import gcd
import json
from tree_messages import hull, orient


def span_witness(r, rays):
    if r == (0, 0, 0):
        return [1, 0, 0, 0, 0, 0, 0]
    for i, a in enumerate(rays):
        for c in range(3):
            if a[c] and all(a[c] * r[j] == r[c] * a[j] for j in range(3)):
                d, n = a[c], r[c]
                g = gcd(d, n)
                return [d//g, i, i, i, n//g, 0, 0]
    a = rays[0]
    for j in range(1,len(rays)-1):
        b,c = rays[j],rays[j+1]
        d,u,v,w = orient(a,b,c),orient(r,b,c),orient(a,r,c),orient(a,b,r)
        if d < 0: d,u,v,w = -d,-u,-v,-w
        if d and min(u,v,w) >= 0:
            assert all(d*r[z] == u*a[z]+v*b[z]+w*c[z] for z in range(3))
            g = gcd(d,gcd(u,gcd(v,w)))
            return [d//g,0,j,j+1,u//g,v//g,w//g]
    for i, a in enumerate(rays):
        for j in range(i+1, len(rays)):
            b = rays[j]
            for s, t in ((0,1),(0,2),(1,2)):
                d = a[s]*b[t]-a[t]*b[s]
                if not d: continue
                u = r[s]*b[t]-r[t]*b[s]
                v = a[s]*r[t]-a[t]*r[s]
                if d < 0: d,u,v = -d,-u,-v
                if u >= 0 and v >= 0 and all(d*r[z] == u*a[z]+v*b[z] for z in range(3)):
                    g = gcd(d,gcd(u,v))
                    return [d//g,i,j,i,u//g,v//g,0]
    raise ValueError((r,rays))


def outer_hull(rays, grid):
    if grid is None:
        return hull(rays)
    points=set()
    for a,b,c in rays:
        total=a+b+c
        if not total: continue
        x=a*grid//total; y=b*grid//total
        xs={x,(a*grid+total-1)//total}; ys={y,(b*grid+total-1)//total}
        for u in xs:
            for v in ys:
                if u+v<=grid: points.add((u,v,grid-u-v))
            if min(ys)<=grid-u<=max(ys): points.add((u,grid-u,0))
        for v in ys:
            if min(xs)<=grid-v<=max(xs): points.add((grid-v,v,0))
    return hull(points)


def children_certificate(incoming, degree, grid=None):
    factors = tuple((b+c,a+b,b) for a,b,c in incoming)
    previous = ((1,1,1),)
    steps=[]
    for _ in range(degree):
        products = tuple(tuple(a*b for a,b in zip(x,y)) for x in previous for y in factors)
        after = hull(products)
        witnesses = [span_witness(r,after) for r in products]
        steps.append({'rays':after,'witnesses':witnesses})
        previous = after
    returned = tuple((u,v-w,w) for u,v,w in previous)
    assert all(min(r)>=0 for r in returned)
    outgoing = outer_hull(returned, grid)
    return {'incoming':incoming,'degree':degree,'steps':steps,'outgoing':outgoing,
            'return_witnesses':[span_witness(r,outgoing) for r in returned]}


def generate(k):
    p=q=((1,0,0),(0,1,0),(0,0,1))
    levels=[]
    for level in range(6):
        grid = None if k <= 4 else 1024
        cp,cq=children_certificate(p, k-1, grid),children_certificate(q, 2, grid)
        p,q=tuple(map(tuple,cq['outgoing'])),tuple(map(tuple,cp['outgoing']))
        levels.append({'point':cq,'generator':cp})
        print('k',k,'level',level+1,'rays',len(p),len(q),flush=True)
    for a,b,c in combinations_with_replacement(q,3):
        u=(a[1]+a[2])*(b[1]+b[2])*(c[1]+c[2])
        v=(a[0]+a[1])*(b[0]+b[1])*(c[0]+c[1])
        w=a[1]*b[1]*c[1]
        assert 518208*u+481792*w <= 481792*v
    return {'k':k,'levels':levels,'root_bound_numerator':481792,'root_bound_denominator':1000000}


if __name__=='__main__':
    import argparse
    parser=argparse.ArgumentParser()
    parser.add_argument('k',type=int)
    parser.add_argument('output',type=Path)
    args=parser.parse_args()
    if not 3 <= args.k <= 14: parser.error('3 <= k <= 14 required')
    data=generate(args.k)
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(data,separators=(',',':'))+'\n')
