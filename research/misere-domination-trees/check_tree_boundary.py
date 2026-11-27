#!/usr/bin/env python3
"""Independent closed-neighborhood audit of the critical-chain factorization."""
from functools import cache
from heapq import heapify, heappop, heappush
from random import Random


def mex(g):
    x=0
    while x in g:
        x+=1
    return x


def test(n,edges):
    adj=[set() for _ in range(n)]
    for a,b in edges:
        adj[a].add(b)
        adj[b].add(a)
    critical={i for i in range(n) if len(adj[i])!=2}
    masks=[sum(1<<y for y in s|{i}) for i,s in enumerate(adj)]
    chains=[]
    for root in critical:
        for x in adj[root]:
            last=root
            inner=[]
            while x not in critical:
                inner.append(x)
                last,x=x,next(iter(adj[x]-{last}))
            if root<x:
                chains.append(inner)

    def separate(core):
        heaps=[]
        for chain in chains:
            j=0
            while j<len(chain):
                if not core & (1<<chain[j]):
                    j+=1
                    continue
                k=j+1
                while k<len(chain) and core & (1<<chain[k]):
                    k+=1
                if j>=2 and k<=len(chain)-2:
                    heaps.append(k-j)
                    for x in chain[j:k]:
                        core -= 1<<x
                j=k
        return core,tuple(sorted(heaps))

    def options(core,heaps):
        for m in masks:
            if core&m:
                c,h=separate(core&~m)
                yield c,tuple(sorted(h+heaps))
        for i,h in enumerate(heaps):
            for d in range(1,min(3,h)+1):
                rest=h-d
                for k in range(1+rest//2 if d==3 else 1):
                    p=tuple(x for x in (k,rest-k) if x)
                    yield core,tuple(sorted(heaps[:i]+heaps[i+1:]+p))

    @cache
    def encoded(core,heaps):
        return not(core or heaps) or any(not encoded(*x) for x in options(core,heaps))

    @cache
    def sg_core(core):
        value=set()
        for c,p in options(core,()):
            z=sg_core(c)
            for h in p:
                z ^= h%4
            value.add(z)
        return mex(value)

    @cache
    def direct(undom):
        opt={undom&~m for m in masks if undom&m}
        vals=[direct(z) for z in opt]
        return (not undom or any(not win for win,_ in vals),mex({g for _,g in vals}))

    root=(1<<n)-1
    positions=[root]
    for m in masks:
        positions.append(root&~m)
    for mask in positions:
        c,h=separate(mask)
        g=sg_core(c)
        for k in h:
            g ^= k%4
        assert (encoded(c,h),g)==direct(mask),(edges,mask)
    return len(positions)


def tree(n,rng):
    if n==1:
        return []
    p=[rng.randrange(n) for _ in range(n-2)]
    degree=[1]*n
    for x in p:
        degree[x]+=1
    leaves=[x for x in range(n) if degree[x]==1]
    heapify(leaves)
    edges=[]
    for x in p:
        leaf=heappop(leaves)
        edges.append((leaf,x))
        degree[x]-=1
        if degree[x]==1:
            heappush(leaves,x)
    return edges+[(heappop(leaves),heappop(leaves))]


if __name__ == "__main__":
    rng=Random(929)
    count=0
    for n in range(1,15):
        sizes=[tree(n,rng) for _ in range(20)]
        sizes.append([(i,i+1) for i in range(n-1)])
        if n>=8:
            sizes.append([(0,1),(0,2)]+[(0,3)]+[(i,i+1) for i in range(3,n-1)])
        for edges in sizes:
            count+=test(n,edges)
    print(count,"reachable tree positions agree for normal SG and misère outcomes")
