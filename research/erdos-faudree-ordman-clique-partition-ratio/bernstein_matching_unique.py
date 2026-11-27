#!/usr/bin/env python3
"""Classify all equality points for four covers without singleton memberships.

SciPy only suggests fractional packings. Every leaf inequality is checked
in rational arithmetic, including all capacities and the resulting cost.
"""
from fractions import Fraction as Q
from functools import lru_cache
from itertools import combinations, permutations
from math import comb, floor, isfinite
import argparse
import numpy as np
from scipy.optimize import linprog
from scipy.sparse import csc_matrix


def matrix(q, L):
    assert q == 4
    # Consecutive pairs are the complementary membership sets.
    types = (3,12,5,10,6,9,15)
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
    # Relabel the missing pairs by decreasing maximum mass, and flip
    # within each pair to put the larger coordinate first.
    chambers=[]
    for order in permutations(range(6)):
        pos={i:k for k,i in enumerate(order)}
        if pos[0]>pos[2] or pos[2]>pos[4]:
            continue
        if any(pos[i]>pos[i+1] for i in (0,2,4)):
            continue
        # Each linear chamber is the convex hull of the six unit
        # prefix averages of this order, and the extra universal type.
        V=tuple(tuple(Q(i in order[:k],k) for i in verts) for k in range(1,7))
        chambers.append(V+(initial[-1],))
    unit = 1<<42
    obj = np.r_[np.ones(paid), np.zeros(A.shape[1]-paid)]
    columns = A.tocsc()

    @lru_cache(maxsize=2000000)
    def candidate(x,y):
        capacity = tuple(x[i]*y[i]/2 if i==j
                         else (x[i]*y[j]+x[j]*y[i])/2 for i,j in rows)
        trivial = sum(capacity[i] for i in off)
        if trivial <= target:
            return trivial
        result = linprog(obj,A_eq=A,b_eq=list(map(float,capacity)),
                         bounds=(0,None),method="highs")
        if not result.success:
            return trivial
        load = [0]*len(rows)
        raw_paid = 0
        for k, proposal in enumerate(result.x):
            if not isfinite(proposal):
                return trivial
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
        return min(charge,trivial)

    def ok(x,y):
        return candidate(*sorted((x,y)))

    pairs = tuple(combinations(verts,2))
    def certified(V):
        d = [target-ok(v,v) for v in V]
        if min(d)<=0:
            return False
        M = [[Q(0) for _ in verts] for _ in verts]
        S = [Q(0) for _ in verts]
        bad = False
        for i,j in pairs:
            m = ok(V[i],V[j])-target
            if m>0:
                if m*m >= d[i]*d[j]:
                    return False
                M[i][j] = M[j][i] = -m
                S[i] += m; S[j] += m
                bad = True
        if not bad or all(a>b for a,b in zip(d,S)):
            return True
        for i in verts:
            M[i][i] = d[i]
        for i in verts:
            v = M[i][i]
            if v<=0:
                return False
            for j in verts[i+1:]:
                if M[i][j]:
                    z = M[i][j]/v
                    for k in verts[j:]:
                        M[j][k] -= z*M[i][k]
        return True

    sides = ((0,1),(2,3),(4,5))

    def patch(V):
        if L < 5 or target < Q(1,14):
            return False
        for A in sides:
            for B in sides:
                if A==B:
                    continue
                outside = tuple(i for i in verts if i not in A+B)
                ts = tuple(sum(v[i] for i in outside) for v in V)
                if max(ts)>Q(1,4):
                    continue
                def covers(i,j):
                    u,v=V[i],V[j]
                    t,r=ts[i],ts[j]
                    z32=Q(2,784)*(1-t)*(1-r)
                    for a in A:
                        for b in B:
                            C=u[a]*v[a]/4
                            D=u[b]*v[b]/4
                            P=(u[a]*v[b]+u[b]*v[a])/2
                            z22=D-z32
                            z21=C-D-2*z32
                            z11=P-2*C-2*D+2*z32
                            s21=((u[a]-u[b])*r+(v[a]-v[b])*t)/4
                            s11=((2*u[b]-u[a])*r+(2*v[b]-v[a])*t)/4
                            if min(z22,s11,s21,z11-s11,z21-s21)<0:
                                return False
                    return True
                if all(covers(i,i) for i in verts) and all(covers(i,j) for i,j in pairs):
                    return True
        return False

    queue=[(C,0) for C in chambers]
    leaves=splits=patches=0
    max_depth=0
    while queue:
        V, dep = queue.pop()
        max_depth=max(max_depth,dep)
        if patch(V):
            leaves += 1; patches += 1
            continue
        if certified(V):
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
            print("progress",splits,leaves,patches,len(queue),max_depth,
                  candidate.cache_info(),flush=True)
        if splits>limit or dep>100:
            raise RuntimeError((splits,dep,len(queue)))
    assert leaves==splits+len(chambers)
    print("certified",q,L,target,splits,leaves,patches,max_depth,candidate.cache_info(),flush=True)


if __name__=="__main__":
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument("--q",type=int,default=4)
    p.add_argument("--L",type=int,default=8)
    p.add_argument("--target",type=Q,default=Q(1,14))
    p.add_argument("--limit",type=int,default=600000)
    a=p.parse_args()
    run(a.q,a.L,a.target,a.limit)
