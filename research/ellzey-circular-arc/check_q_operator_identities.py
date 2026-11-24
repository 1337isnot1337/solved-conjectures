"""Independent finite exact operator checks for both Ellzey systems."""
from fractions import Fraction as Q
from functools import lru_cache
from collections import defaultdict
from itertools import permutations,combinations
from random import Random

N=7; x=tuple(Q(i*i+1) for i in range(N+1))
def chk(q, colored, tuples):
 @lru_cache(None)
 def br(h):
    return Q(h) if q==1 else (q**h-1)/(q-1)
 @lru_cache(None)
 def A(y,w):
    if y in w or (y!=1 and y-1 not in w): return Q(0)
    a=Q(1) if y==1 else br(y)/br(y-1)
    for b in w:
        if b!=y-1: a*=br(y-b)/br(y-b-1)
    return a
 @lru_cache(None)
 def M(w):
    if colored:
        return {w+(c,):x[c]*q**sum(b<c for b in w) for c in range(1,N+1) if c not in w}
    return {w+(c,):A(c,w) for c in {1,*[b+1 for b in w]} if c not in w}
 @lru_cache(None)
 def D(w):
    a,*v=w
    return {tuple(v): Q(1) if colored else Q(2*a+1,a+2)}
 def add(*pairs):
    ans=defaultdict(Q)
    for v,c in pairs:
        for u,d in v.items(): ans[u]+=c*d
    return {u:v for u,v in ans.items() if v}
 def ap(f,v):
    return add(*[(f(w),val) for w,val in v.items()])
 @lru_cache(None)
 def R(w):
    return add((ap(M,D(w)),1),(ap(D,M(w)),-1))
 def s(w,i):
    a,b=w[i:i+2]
    z=w[:i]+(b,a)+w[i+2:]
    if colored: return {w:q-1,z:Q(1)} if a<b else {z:q}
    diag=q**(b-a)/br(b-a)
    return {w:diag,z:q-diag}
 def S(i):
    return lambda w:s(w,i)
 def SI(i):
    return lambda w:add((s(w,i),1/q),({w:1},(1-q)/q))
 total=0
 for w in tuples:
    z={w:Q(1)}
    k=len(w)
    def op(fs):
        v=z
        for f in fs[::-1]: v=ap(f,v)
        return v
    if k>=2:
        assert op([D,R]) == op([R,D,S(0)]),('DR',q,colored,w)
        assert op([SI(k-2),R,R]) == op([R,R,SI(0)]),('RR',q,colored,w)
        total+=2
    assert op([S(k),M,M]) == add((op([M,M]),q)),('SMM',q,colored,w)
    assert op([S(k-1),M,R]) == op([R,M]),('SMR',q,colored,w)
    total+=2
 return total

if __name__=='__main__':
 rng=Random(20261124)
 tuples=list(permutations(range(1,5),2))+list(permutations(range(1,6),3))
 for k in (4,5):
    tuples.extend(tuple(rng.sample(range(1,N+1),k)) for _ in range(30))
 print(sum(chk(q,col,tuples) for q in (Q(1,4),Q(2,3),Q(1),Q(5,4),Q(3),Q(-2)) for col in (True,False)), 'exact identities')
