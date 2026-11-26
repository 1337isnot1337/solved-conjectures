"""Exact finite regressions for the ERZ Schur-positivity proof.
The written proof, not these finite checks, establishes the theorem.
"""
from collections import defaultdict
from functools import lru_cache
from itertools import permutations, combinations
from math import comb, factorial
from bisect import bisect_left

@lru_cache(None)
def partitions(n, cap=None):
    if n==0: return ((),)
    return tuple((j,)+p for j in range(min(n,cap if cap is not None else n),0,-1)
                 for p in partitions(n-j,j))

@lru_cache(None)
def dimension(p):
    if not p: return 1
    ans=0
    for i in range(len(p)):
        if i==len(p)-1 or p[i]>p[i+1]:
            q=list(p);q[i]-=1
            if not q[-1]:q.pop()
            ans+=dimension(tuple(q))
    return ans

@lru_cache(None)
def frob(p):
    d=sum(x>=i+1 for i,x in enumerate(p))
    return (tuple(p[i]-i-1 for i in range(d)),
            tuple(sum(x>=i+1 for x in p)-i-1 for i in range(d)))

@lru_cache(None)
def from_frob(a,b):
    assert len(a)==len(b)
    d=len(a)
    if not d:return ()
    p=list(a[i]+i+1 for i in range(d))
    p.extend(sum(b[i]+i+1>=j for i in range(d))
             for j in range(d+1,b[0]+2))
    return tuple(p)

@lru_cache(None)
def det_pascal(A,a):
    if not A:return 1
    return sum((-1)**j*comb(A[0],v)*det_pascal(A[1:],a[:j]+a[j+1:])
               for j,v in enumerate(a) if v<=A[0])

@lru_cache(None)
def strict_bounded(A):
    if not A:return ((),)
    return tuple(tuple(reversed(s)) for s in combinations(range(A[0]+1),len(A))
                 if all(i<=j for i,j in zip(reversed(s),A)))

@lru_cache(None)
def leg_transform(a,B):
    ans=sum((-1)**(sum(B)-sum(b))*det_pascal(B,b)*dimension(from_frob(a,b))
            for b in strict_bounded(B))
    assert ans>=0,(a,B,ans)
    return ans

@lru_cache(None)
def schur_slices(p):
    A,B=frob(p)
    if not A:return {0:1}
    out=defaultdict(int)
    for a in strict_bounded(A):
        w=a[0]+1
        z=det_pascal(A,a)*leg_transform(a,B)
        assert z>=0
        out[w]+=z
    return dict(out)

def addable(p):
    for i in range(len(p)+1):
        if i==0 or i==len(p) or p[i-1]>p[i]:
            q=list(p)
            if i==len(p):q.append(0)
            content=q[i]-i
            q[i]+=1
            yield tuple(q),content

def check_content(max_n=15):
    for w in range(1,max_n+1):
        states=[{}]+[{p:dimension(p) for p in partitions(l) if p[0]==w}
                      for l in range(1,max_n+1)]
        for n in range(1,max_n+1):
            for l in range(1,n):
                nxt=defaultdict(int)
                for p,v in states[l].items():
                    if v:
                        for q,c in addable(p):
                            if c:nxt[q]+=v*c
                states[l]=nxt
            scaled=defaultdict(int)
            for l in range(1,n+1):
                fac=factorial(n)//factorial(n-l)
                for p,v in states[l].items():scaled[p]+=fac*v
            for p in partitions(n):
                assert scaled[p]==factorial(n)*schur_slices(p).get(w,0),(n,w,p)
    print('Frobenius formula agrees with content derivation through degree',max_n)

def parity(p):
    return (-1)**sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p)))

@lru_cache(None)
def perms_sign(d):return tuple((p,parity(p)) for p in permutations(range(d)))

@lru_cache(None)
def mask_for_composition(alpha):
    a=[v for v in alpha if v]
    total=mask=0
    for v in a[:-1]:
        total+=v;mask|=1<<(total-1)
    return mask

def check_direct(max_n=8):
    for n in range(1,max_n+1):
        N=1<<(n-1); data=[[0]*N for _ in range(n+1)]
        for p in permutations(range(n)):
            tails=[]
            for x in p:
                j=bisect_left(tails,x)
                if j==len(tails):tails.append(x)
                else:tails[j]=x
            mask=sum(1<<i for i in range(n-1) if p[i]>p[i+1]+1)
            data[len(tails)][mask]+=1
        for w in range(1,n+1):
            z=data[w]
            for i in range(n-1):
                for m in range(N):
                    if m>>i&1:z[m]+=z[m^(1<<i)]
            hist={}
            for mask in range(N):
                cuts=[0]+[i for i in range(1,n) if mask>>(i-1)&1]+[n]
                a=tuple(sorted(y-x for x,y in zip(cuts,cuts[1:])))
                if a in hist:assert hist[a]==z[mask]
                hist[a]=z[mask]
            for p in partitions(n):
                d=len(p);ans=0
                for sigma,sign in perms_sign(d):
                    alpha=tuple(p[i]+sigma[i]-i for i in range(d))
                    if min(alpha,default=0)>=0:
                        ans+=sign*z[mask_for_composition(alpha)]
                assert ans==schur_slices(p).get(w,0),(n,w,p,ans)
        print('Direct permutation and alternant checks passed:',n)

if __name__=='__main__':
    check_content()
    check_direct()
