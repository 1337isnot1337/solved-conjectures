#!/usr/bin/env python3
"""Diagnostic: test random local bipartitions of Hermitian secant graphs.

This is not an asymptotic argument about Erdos #813.
"""
from itertools import combinations, product
from random import Random


def secant_geometry(q):
    d = next(a for a in range(1,q) if pow(a,(q-1)//2,q) == q-1)
    elements = [(a,b) for a,b in product(range(q), repeat=2)]
    zero, one = (0,0), (1,0)

    def dot(x,y):
        a = b = 0
        for (r,s),(t,u) in zip(x,y):
            a += r*t+d*s*u
            b += r*u+s*t
        return (a%q,b%q)

    def norm(z):
        a,b = z
        return (a*a-d*b*b)%q

    proj = [(one,a,b) for a in elements for b in elements]
    proj += [(zero,one,a) for a in elements]+[(zero,zero,one)]
    points = [x for x in proj if sum(norm(z) for z in x)%q == 0]
    assert len(points) == q**3+1
    lines = []
    point_to_lines = [[] for _ in points]
    for f in proj:
        incidence = [i for i,x in enumerate(points) if dot(f,x) == zero]
        assert len(incidence) in (1,q+1)
        if len(incidence) == q+1:
            idx = len(lines)
            lines.append(f)
            for p in incidence:
                point_to_lines[p].append(idx)
    assert len(lines) == q*q*(q*q-q+1)
    assert all(len(bundle) == q*q for bundle in point_to_lines)
    return points,lines,point_to_lines


def bits(a):
    while a:
        l=a&-a
        yield l.bit_length()-1
        a^=l


def split(n, pencils, rng):
    nb=[0]*n
    for p in pencils:
        buckets=[[],[]]
        for line in p:
            buckets[rng.randrange(2)].append(line)
        a,b=(sum(1<<x for x in part) for part in buckets)
        for u in buckets[0]:
            nb[u]|=b
        for v in buckets[1]:
            nb[v]|=a
    return nb


def spindle(nb):
    for u,mask in enumerate(nb):
        candidates={}
        for v in range(len(nb)):
            if v==u or (mask>>v)&1:
                continue
            common=mask&nb[v]
            e=[(a,b) for a in bits(common) for b in bits(nb[a]&common) if a<b]
            if e:
                candidates[v]=e
        cmask=sum(1<<x for x in candidates)
        for v,edges in candidates.items():
            for w in bits(nb[v]&cmask):
                if v<w:
                    for a,b in edges:
                        for c,d in candidates[w]:
                            if len({a,b,c,d})==4:
                                return (u,v,w,a,b,c,d)
    return None


def check(nb,w):
    u,v,z,a,b,c,d=w
    e=[(u,a),(u,b),(v,a),(v,b),(a,b),
       (u,c),(u,d),(z,c),(z,d),(c,d),(v,z)]
    assert len(set(w))==7 and all((nb[i]>>j)&1 for i,j in e)
    assert all(any((nb[i]>>j)&1 for i,j in combinations(triple,2))
               for triple in combinations(w,3))


def main():
    for q in (3,5,7):
        points,lines,pencils=secant_geometry(q)
        count=0
        for seed in range(25):
            nb=split(len(lines),pencils,Random(100*q+seed))
            w=spindle(nb)
            if w:
                check(nb,w)
                count+=1
                if seed==0:
                    print("q",q,"sample",w,[lines[i] for i in w],flush=True)
        print(q,len(lines),count,"of 25",flush=True)


if __name__ == "__main__":
    main()
