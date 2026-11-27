#!/usr/bin/env python3
"""Exact a posteriori profile bound on the seven-type three-cover simplex.

SciPy only suggests fractional packings. Every leaf inequality is checked
in rational arithmetic, including all capacities and the resulting cost.
"""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import combinations
from math import comb, floor, isfinite
import argparse
import numpy as np
from scipy.optimize import linprog
from scipy.sparse import csc_matrix


def matrix(q, L):
    types = tuple(range(1, 2**q))
    vertices = tuple(range(len(types)))
    rows = [(i,j) for i in vertices for j in vertices
            if i<=j and types[i] & types[j]]
    rid = {r:i for i,r in enumerate(rows)}
    pure = [rid[i,i] for i in vertices]
    idx, dat, ptr = [], [], [0]
    def comp(total, k):
        if k == 1:
            yield (total,)
        else:
            for a in range(1, total-k+2):
                for u in comp(total-a, k-1):
                    yield (a,*u)
    for k in range(2, min(len(vertices),L)+1):
        for U in combinations(vertices,k):
            if any((i,j) not in rid for i,j in combinations(U,2)):
                continue
            for total in range(k,L+1):
                for u in comp(total,k):
                    for s,i in enumerate(U):
                        for t,j in enumerate(U[s:],s):
                            a=comb(u[s],2) if s==t else u[s]*u[t]
                            if a:
                                idx.append(rid[i,j]);dat.append(a)
                    ptr.append(len(idx))
    paid = len(ptr)-1
    for i in pure:
        idx.append(i);dat.append(1);ptr.append(len(idx))
    A = csc_matrix((dat,idx,ptr),shape=(len(rows),len(ptr)-1),dtype=np.int64).tocsr()
    return vertices, rows, tuple(i for i,(a,b) in enumerate(rows) if a!=b), A, paid


def run(q, L, target, limit):
    verts, rows, off, A, paid = matrix(q,L)
    initial = tuple(tuple(Q(i==j) for i in verts) for j in verts)
    unit = 1<<42
    obj = np.r_[np.ones(paid), np.zeros(A.shape[1]-paid)]
    columns = A.tocsc()

    @lru_cache(maxsize=2000000)
    def candidate(x,y):
        capacity = tuple(x[i]*y[i]/2 if i==j
                         else (x[i]*y[j]+x[j]*y[i])/2 for i,j in rows)
        result = linprog(obj,A_ub=A,b_ub=list(map(float,capacity)),
                         bounds=(0,None),method="highs") if False else                  linprog(obj,A_eq=A,b_eq=list(map(float,capacity)),
                         bounds=(0,None),method="highs")
        if not result.success or result.fun >= float(target)-1e-10:
            return False
        load = [0]*len(rows)
        raw_paid = 0
        for k, proposal in enumerate(result.x):
            if not isfinite(proposal):
                return False
            num = floor(max(0.,proposal)*unit)
            if num:
                raw_paid += num if k<paid else 0
                for j in range(columns.indptr[k],columns.indptr[k+1]):
                    load[columns.indices[j]] += int(columns.data[j])*num
        scale = min([Q(1)]+[capacity[i]*unit/a for i,a in enumerate(load) if a])
        charge = scale*Q(raw_paid,unit)
        remainder = tuple(c-scale*Q(a,unit) for c,a in zip(capacity,load))
        assert min(remainder)>=0
        charge += sum(remainder[i] for i in off)
        return charge <= target

    def ok(x,y):
        return candidate(*sorted((x,y)))

    queue=[(initial,0)]
    leaves=splits=0
    max_depth=0
    while queue:
        V, dep = queue.pop()
        max_depth=max(max_depth,dep)
        if (all(ok(V[i],V[j]) for i,j in combinations(verts,2))
                and all(ok(v,v) for v in V)):
            leaves += 1
            continue
        longest=max(combinations(verts,2),
                    key=lambda p: sum((a-b)**2 for a,b in zip(V[p[0]],V[p[1]])))
        i,j=longest
        w=tuple((x+y)/2 for x,y in zip(V[i],V[j]))
        lv=list(V);lv[i]=w
        rv=list(V);rv[j]=w
        queue.extend([(tuple(lv),dep+1),(tuple(rv),dep+1)])
        splits += 1
        if splits%10000==0:
            print("progress",splits,leaves,len(queue),max_depth,
                  candidate.cache_info(),flush=True)
        if splits>limit or dep>100:
            raise RuntimeError((splits,dep,len(queue)))
    assert leaves==splits+1
    print("certified",q,L,target,splits,leaves,max_depth,candidate.cache_info(),flush=True)


if __name__=="__main__":
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--q",type=int,default=3)
    p.add_argument("--L",type=int,default=8)
    p.add_argument("--target",type=Q,default=Q(3,56))
    p.add_argument("--limit",type=int,default=600000)
    a=p.parse_args()
    run(a.q,a.L,a.target,a.limit)
