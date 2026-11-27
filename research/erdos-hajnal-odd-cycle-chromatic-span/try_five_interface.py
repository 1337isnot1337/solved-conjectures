#!/usr/bin/env python3
"""Seeded discovery screen for five-singleton-interface critical graphs."""
from collections import Counter
from functools import lru_cache
from itertools import combinations
import argparse, json, random

def bits(m):
    while m:
        b = m & -m
        yield b.bit_length()-1
        m -= b

def can3(N,M):
    cc=[0,0,0]
    def f(M,j):
        if not M: return True
        vv=max(bits(M),key=lambda v: (((bool(N[v]&cc[0])+bool(N[v]&cc[1])+bool(N[v]&cc[2]))<<6)+(N[v]&M).bit_count()))
        bv=1<<vv
        for c in range(min(j+1,3)):
            if N[vv]&cc[c]: continue
            cc[c]|=bv
            if f(M^bv,max(c+1,j)): return True
            cc[c]^=bv
        return False
    return f(M,0)

def split3(N,M):
    X=M&~31
    cc={}
    todo=0
    for x in bits(X):
        if x in cc: continue
        cc[x]=0; todo=1<<x
        while todo:
            q=next(bits(todo)); todo ^= 1<<q
            for y in bits(N[q]&X):
                if y in cc:
                    if cc[y]==cc[q]: break
                else:
                    cc[y]=cc[q]^1; todo|=1<<y
            else: continue
            break
        else: continue
        break
    else:
        return True
    for w in range(5):
        a,b,c,d=[i for i in range(5) if i!=w]
        for t,u,v in [(b,c,d),(c,b,d),(d,b,c)]:
            masks=(1<<w, (1<<a)|(1<<t), (1<<u)|(1<<v))
            P=[0,0,0]
            for x in bits(X):
                col=next((j for j,mask in enumerate(masks) if not (N[x]&mask)),None)
                if col is None or N[x]&P[col]: break
                P[col]|=1<<x
            else: return True
    return False

def independent(N,M,k):
    if k==0: return True
    while M.bit_count()>=k:
        v=next(bits(M)); M^=1<<v
        if independent(N,M&~N[v],k-1): return True
    return False

def forbidden(N,M):
    for v in bits(M):
        A=N[v]&M
        for x in bits(A):
            for y in bits(A&~N[x]&~((1<<(x+1))-1)):
                A3=M&~(A|N[x]|N[y]|(1<<v))
                if independent(N,A3,3): return True
    return False

def hpath(N,M):
    @lru_cache(None)
    def f(v,M):
        if not M: return True
        for u in sorted(bits(N[v]&M),key=lambda u:(N[u]&M).bit_count()):
            if f(u,M^(1<<u)): return True
        return False
    return any(f(v,M^(1<<v)) for v in sorted(bits(M),key=lambda v:(N[v]&M).bit_count()))

def run(seed,iterations):
    rng=random.Random(seed)
    stats=Counter()
    examples=[]
    for it in range(iterations):
        mode=it%4
        m=rng.choice(range(5,15))
        if mode==0: m=rng.choice(range(5,13,2))
        N=[0]*(5+m)
        O=[]
        for x in range(5,5+m):
            w=rng.choices((0,1,2),(1,3,16))[0]
            om=set(rng.sample(range(5),w)); O.append(tuple(sorted(om)))
            for j in range(5):
                if j not in om:
                    N[x]|=1<<j; N[j]|=1<<x
        p=rng.choice((.16,.24,.32,.4,.5,.65))
        for a,b in combinations(range(5,5+m),2):
            add=(b-a in (1,m-1)) if mode==0 else rng.random()<p
            if mode==1 and O[a-5]==O[b-5]: add=False
            if add: N[a]|=1<<b; N[b]|=1<<a
        M=(1<<(5+m))-1
        if split3(N,M): continue
        stats['non3']+=1
        R=list(bits(M&~31)); rng.shuffle(R)
        for x in R:
            T=M^(1<<x)
            if not split3(N,T): M=T
        if any((N[i]&M).bit_count()<3 for i in range(5)): continue
        if any(not can3(N,M^(1<<i)) for i in range(5)): continue
        stats['critical']+=1
        if independent(N,M,6) or forbidden(N,M): continue
        assert not can3(N,M)
        assert all(can3(N,M^(1<<v)) for v in bits(M))
        stats[f'eligible_n{M.bit_count()}']+=1
        witness={'M':list(bits(M)),'edges':[(a,b) for a,b in combinations(bits(M),2) if N[a]>>b&1]}
        if not hpath(N,M):
            return stats,witness,examples
        if len(examples)<5: examples.append(witness)
    return stats,None,examples

if __name__=='__main__':
    ap=argparse.ArgumentParser()
    ap.add_argument('--seed',type=int,default=640)
    ap.add_argument('--iterations',type=int,default=10000)
    a=ap.parse_args()
    stats,witness,examples=run(a.seed,a.iterations)
    print(json.dumps({'seed':a.seed,'iterations':a.iterations,'counts':stats,'nontraceable':witness,'examples':examples}))
