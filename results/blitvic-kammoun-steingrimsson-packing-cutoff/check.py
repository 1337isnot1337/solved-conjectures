#!/usr/bin/env python3
"""Exact direct-window cross-check; the theorem itself is symbolic."""
from functools import lru_cache
from math import comb
import sys

def pattern(L, middle_long):
    # Column order by logical group: 0=A, 1=B, 2=C.
    rows = (1,0,2) if middle_long else (0,1,2)
    sz = [L,L,L]
    sz[rows[0]] += 1
    off = [0,sz[0],sz[0]+sz[1]]
    return tuple(off[r]+i for i in range(1,L+1) for r in rows) + (off[rows[0]]+L+1,)

def standardize(p):
    rank = {a:i for i,a in enumerate(sorted(p),1)}
    return tuple(rank[a] for a in p)

def packing_count(p,j):
    d=3
    K=len(p); n=K+(j-1)*d
    rank_order=sorted(range(K),key=p.__getitem__)
    below=[0]*n
    for k in range(j):
        for a,b in zip(rank_order,rank_order[1:]):
            below[d*k+b]|=1<<(d*k+a)
    full=(1<<n)-1
    @lru_cache(None)
    def count(S):
        if S==full:return 1
        todo=full^S
        answer=0
        while todo:
            bit=todo & -todo
            todo-=bit
            i=bit.bit_length()-1
            if below[i]&S==below[i]:
                answer+=count(S|bit)
        return answer
    answer=count(0)
    count.cache_clear()
    return answer

def catalan(n):
    return comb(2*n,n)//(n+1)

if __name__=='__main__':
    for L in range(2,int(sys.argv[1])+1 if len(sys.argv)>1 else 9):
        P,Q=pattern(L,False),pattern(L,True)
        for p in (P,Q):
            assert len(p)==3*L+1 and sorted(p)==list(range(1,len(p)+1))
            assert standardize(p[:-3])==standardize(p[3:])
        for j in range(1,L+2):
            nP,nQ=packing_count(P,j),packing_count(Q,j)
            assert nQ==catalan(j)**2
            assert nP==nQ+(catalan(j-1)**2 if j>L else 0)
        print(f"L={L}, K={len(P)}, m={len(P)-3}, first differing j={L+1}: {nP} != {nQ}")
        if L==5:
            print("P:",P)
            print("Q:",Q)
