from functools import lru_cache
from itertools import combinations, permutations
from math import comb
from random import Random

def subs(A,k): return tuple(sum(1<<i for i in s) for s in combinations(A,k))

def exact_flags(n,r,H):
    # Build the independent sets and compute all flats by the rank definition;
    # this does not use the flag-correction identity.
    full=(1<<n)-1
    bases=tuple(B for B in subs(range(n),r) if not any(B&~U==0 for U in H))
    @lru_cache(None)
    def rank(S):return max((S&B).bit_count() for B in bases)
    flats=[[] for _ in range(r+1)]
    for S in range(1<<n):
        rk=rank(S)
        if all(rank(S|1<<i)>rk for i in range(n) if not (S>>i)&1):
            flats[rk].append(S)
    @lru_cache(None)
    def chain(D,S):
        if not D:return 1
        return sum(chain(D[:-1],B) for B in flats[D[-1]] if B&~S==0)
    f=[chain(tuple(i+1 for i in range(r-1) if D>>i&1),full) for D in range(1<<(r-1))]
    for i in range(r-1):
        for D in range(len(f)):
            if D>>i&1:f[D]-=f[D^(1<<i)]
    g,h=[0]*((r+1)//2),[0]*(r//2+1)
    allD=(1<<(r-1))-1
    for S in range(1<<(r-1)):
        if S&(S<<1):continue
        k=S.bit_count()
        h[k]+=f[allD^S]
        if not(S>>(r-2))&1:g[k]+=f[allD^S]
    return g,h

@lru_cache(None)
def refinements(a):
    data=[([0]*(a+1),[0]*(a+1)) for _ in range(a+1)]
    for w in permutations(range(a+1)):
        D=[i for i in range(1,a+1) if w[i-1]>w[i]]
        if any(b==a+1 for a,b in zip(D,D[1:])):continue
        h,g=data[w[0]]
        g[len(D)]+=1
        if 1 not in D:h[len(D)]+=1
    return data

def formula(n,r,H):
    sizes=[U.bit_count() for U in H]
    a=r-2
    C=comb(n,r-1)-sum(comb(s,r-1) for s in sizes)
    g,h=[0]*((r+1)//2),[0]*(r//2+1)
    prior=-1
    for j,(T,G) in enumerate(refinements(a)):
        Q=comb(n-1-j,r-2-j)
        P=C-Q+sum(comb(s-1-j,r-2-j) for s in sizes)
        assert P>=0
        if j>0:
            assert P*lastQ>=prior*Q
        prior,lastQ=P,Q
        for k,v in enumerate(G):
            if v:g[k]+=P*v
        for k,v in enumerate(T):
            if v:h[k+1]+=Q*v
    for k,v in enumerate(g):h[k]+=v
    return g,h

rng=Random(1416)
count=0
for n in range(3,10):
    for r in range(2,min(n,7)+1):
        hid=[U for k in range(r,n) for U in subs(range(n),k)]
        for _ in range(10):
            rng.shuffle(hid)
            H=[]
            for U in hid:
                if rng.randrange(6)==0 and all((U&V).bit_count()<r-1 for V in H):H.append(U)
            assert exact_flags(n,r,H)==formula(n,r,H),(n,r,H,exact_flags(n,r,H),formula(n,r,H))
            count+=1
print(f'PASS: {count} exact paving flag checks from matroid bases and flats')
