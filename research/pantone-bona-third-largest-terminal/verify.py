#!/usr/bin/env python3
"""Exact finite cross-check of the canonical-tail facts; not an asymptotic proof."""
from bisect import bisect_left, bisect_right
from collections import Counter, defaultdict
from itertools import combinations, permutations
import sys

def rank_steps(seq):
    tails=[]
    for x in seq:
        i=bisect_left(tails,x)
        if i==len(tails): tails.append(x)
        else: tails[i]=x
        yield i+1

def shape(seq):
    rows=[]
    for x in seq:
        for row in rows:
            i=bisect_right(row,x)
            if i<len(row):
                row[i],x=x,row[i]
            else:
                row.append(x)
                break
        else:
            rows.append([x])
    return tuple(map(len,rows))

def asc(xs):
    return all(a<b for a,b in zip(xs,xs[1:]))

def verify(d,N):
    prefix_choices=[]
    for m in range(N+1):
        c=0
        for p in permutations(range(1,m+1)):
            ranks=list(rank_steps(p))
            if max(ranks,default=0)<=d:
                c+=m+1-min((x for x,a in zip(p,ranks) if a==d),default=m+1)
        prefix_choices.append(c)
    rows=[]
    for n in range(N+1):
        tails=Counter()
        for p in permutations(range(1,n+1)):
            if any(asc(q[:-1]) and not(q[d-2]<q[d+1]<q[d-1])
                   for q in combinations(p,d+2)):continue
            ranks=list(rank_steps(p))
            i=next((i for i,a in enumerate(ranks) if a==d+1),n)
            r=n-i
            tails[r]+=1
            if r>=2:
                x=p[i]; tt=p[i+1:]
                ws=[q for q in combinations((y for y in p[:i] if y<x),d) if asc(q)]
                assert ws and all(max(w[d-2] for w in ws)<v<min(w[d-1] for w in ws) for v in tt)
                assert all(not(a<b and a<c) for a,b,c in combinations(tt,3))
        if n: assert tails[1]==prefix_choices[n-1]
        rows.append(sum(tails.values()))
    print('d',d,'counts',rows)

def verify_location_at_small_size(N):
    for n in range(2,min(7,N)+1):
        counts=defaultdict(Counter)
        for p in permutations(range(1,n+1)):
            end=shape(p)
            for g in range(1,n):
                for a in range(n-g+1):
                    counts[(end,g,a)][shape(p[a:a+g])]+=1
        for (end,g,a),counter in counts.items():
            assert counter==counts[(end,g,0)]
    print('fixed-shape interval-location identity checked for n<=',min(7,N))

if __name__=='__main__':
    N=int(sys.argv[1]) if len(sys.argv)>1 else 8
    verify(3,N)
    verify(4,N)
    verify_location_at_small_size(N)
