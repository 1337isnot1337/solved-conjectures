from functools import lru_cache
from collections import defaultdict
from math import comb
import random

@lru_cache(None)
def parts(n, cap=None):
    if n==0:return ((),)
    if cap is None:cap=n
    return tuple((k,)+p for k in range(min(n,cap),0,-1) for p in parts(n-k,k))

@lru_cache(None)
def h(n):
    from math import factorial
    ans={}
    for p in parts(n):
        z=factorial(len(p))
        for i in set(p): z//=factorial(p.count(i))
        ans[p]=(-1)**(n-len(p))*z
    return ans

@lru_cache(maxsize=50000)
def adds(a,b):
    return tuple(sorted(a+b,reverse=True))

def mul(a,b):
    d=defaultdict(int)
    for p,c in a.items():
        for q,e in b.items():d[adds(p,q)]+=c*e
    return {p:c for p,c in d.items() if c}

def compute(adj):
    n=len(adj)
    N=(1<<n)-1
    @lru_cache(None)
    def conn(S):
        R=S&-S
        Q=R
        while Q:
            j=(Q&-Q).bit_length()-1
            Q^=1<<j
            new=adj[j]&S&~R
            R|=new; Q|=new
        return R==S
    @lru_cache(None)
    def polys(S):
        # P[k] sums of products of M_H over all connected partitions into k blocks
        if not S:return ({():1},)
        P=[None]+[defaultdict(int) for _ in range(S.bit_count())]
        a=S&-S; B=S^a
        while True:
            A=B|a
            if A!=S and conn(A):
                for k, C in enumerate(polys(S^A)):
                    if C:
                        for p,c in mul(polys(A)[1],C).items():P[k+1][p]+=c
            if not B:break
            B=(B-1)&(S^a)
        if S==a:P[1][()]=1
        elif conn(S):
            for k in range(2,len(P)):
                for p,c in mul(h(k-1),P[k]).items():P[1][p]-=c
        return (None,)+tuple({p:c for p,c in C.items() if c} for C in P[1:])
    P=polys(N); conn.cache_clear(); polys.cache_clear()
    return P
