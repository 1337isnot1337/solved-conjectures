#!/usr/bin/env python3
"""Finite independent audit of the minimum decomposition; not used in proof."""
from functools import lru_cache
from itertools import combinations,permutations
import argparse

def st(w):
    ranks={x:i for i,x in enumerate(sorted(w),1)}
    return tuple(ranks[x] for x in w)

BASES=(((2,1,3,4),(4,2,1,5,3),(2,4,1,5,3)),
       ((3,1,2,4),(4,2,1,5,3),(2,4,1,5,3)))

@lru_cache(None)
def avoids(w,c):
    specs={i:{p for p in BASES[c] if len(p)==i} for i in [4,5]}
    return not any(st(sub) in specs[i] for i in [4,5] for sub in combinations(w,i))

def statistics(w):
    rev={a:i for i,a in enumerate(st(w))}
    return (sum(rev[a]>rev[a+1] for a in range(1,len(w))),
            sum(a==max(w[i:]) for i,a in enumerate(w)))

def classify(w,c):
    i=w.index(1)
    u,v=w[:i],w[i+1:]
    if not u:
        return avoids(st(v),c)
    A=tuple(a for a in v if a<min(u))
    B=tuple(b for b in v if b>min(u))
    if not B:
        return avoids(st(u),c) and avoids(st(A),c)
    if max(B)-min(B)+1!=len(B):
        return False
    sigma=st(u+(min(B),))
    if not avoids(sigma,c) or not avoids(st(A),c):
        return False
    last=max(v.index(b) for b in B)
    trailing=tuple(a for a in v[last+1:] if a in A)
    if c==1:
        isvalid=(v==B+A and avoids(st(B),c))
    else:
        earliest=min((j for j in range(len(A)) if any(x>A[j] and
                     any(y>x for y in A[j+1:]) for x in A[:j])),default=len(A))
        isvalid=all(x>y for x,y in zip(B,B[1:])) and len(A)-len(trailing)<=earliest
    if isvalid:
        si,sr=statistics(sigma)
        ai,ar=statistics(A)
        bi,br=statistics(B)
        tail_rma=statistics(trailing)[1]
        assert statistics(w)==(si+ai+bi+1,sr-1+br+tail_rma), (w,c)
    return isvalid

if __name__=='__main__':
    parser=argparse.ArgumentParser()
    parser.add_argument('--max-n',type=int,default=8)
    args=parser.parse_args()
    for n in range(1,args.max_n+1):
        for w in permutations(range(1,n+1)):
            for c in [0,1]:
                assert classify(w,c)==avoids(w,c), (w,c)
        print('All permutations checked at n=',n,flush=True)
