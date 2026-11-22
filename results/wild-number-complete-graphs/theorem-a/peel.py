"""Peeling process: remainder block R; choose triple T in R that is not a union of parts of Pi_u for any u."""
import random, itertools, n1f, core
def parts(n,P,chosen_blocks,R):
    """for each u: dict vertex->part id, list of parts (as lists) restricted to R"""
    lab={}
    for i,B in enumerate(chosen_blocks):
        for v in B: lab[v]=i
    k=len(chosen_blocks); Rs=set(R); out=[]
    for u in range(n):
        par=list(range(k))
        def f(a):
            while par[a]!=a: par[a]=par[par[a]]; a=par[a]
            return a
        Pu=P[u]
        for a in lab:
            b=Pu[a]
            if b>=0 and b in lab:
                ra,rb=f(lab[a]),f(lab[b])
                if ra!=rb: par[ra]=rb
        groups={}
        for x in R:
            y=Pu[x]
            if y<0: key=('s',x)
            elif y in Rs: key=('e',min(x,y))
            else: key=('c',f(lab[y]))
            groups.setdefault(key,[]).append(x)
        out.append(list(groups.values()))
    return out
def bad_triples(pl, size=3):
    """all `size`-subsets of R that are unions of parts of one Pi_u"""
    bad=set()
    for plist in pl:
        small=[p for p in plist if len(p)<=size]
        # subset-sum over small parts to exactly `size`
        def rec(i,acc,tot):
            if tot==size: bad.add(frozenset(acc)); return
            for j in range(i,len(small)):
                if tot+len(small[j])<=size: rec(j+1,acc+small[j],tot+len(small[j]))
        rec(0,[],0)
    return bad
def peel(L,rnd,strategy='random',final_sizes=None):
    n=len(L); P=core.partner(L)
    sz=core.sizes(n)  # e.g. [4,3,3,...] ; peel triples, last block = remainder
    big=[s for s in sz if s>3]
    ntrip=len(sz)-1 if big==[] else len(sz)-len(big)
    # peel triples until remainder size = 3 (n%3==0), 4, or 8 (two 4-blocks) -> handle last split separately
    R=list(range(n)); chosen=[]
    rem_target = {0:3,1:4,2:8}[n%3]
    while len(R)>rem_target:
        pl=parts(n,P,chosen,R)
        if len(R)==8 and rem_target==8:
            bad=bad_triples(pl,4)
            cands=[frozenset(c) for c in itertools.combinations(R,4)]
        else:
            bad=bad_triples(pl,3)
            cands=None
        if cands is None:
            good=None
            if strategy=='random':
                for _ in range(2000):
                    T=frozenset(rnd.sample(R,3))
                    if T not in bad: good=T;break
                if good is None:
                    allc=[frozenset(c) for c in itertools.combinations(R,3) if frozenset(c) not in bad]
                    if not allc: return None,len(R)
                    good=rnd.choice(allc)
            T=good
        else:
            allc=[c for c in cands if c not in bad]
            if not allc: return None,len(R)
            T=rnd.choice(allc)
        chosen.append(sorted(T)); R=[x for x in R if x not in T]
    chosen.append(R)
    return chosen,0
if __name__=="__main__":
    import sys
    n=int(sys.argv[1]); reps=int(sys.argv[2])
    rnd=random.Random(1)
    L=n1f.random_near(n,5); P=core.partner(L)
    fails={}
    for r in range(reps):
        res,stuck=peel(L,rnd)
        if res is None: fails[stuck]=fails.get(stuck,0)+1
        else: assert not core.bad_colours(L,P,res)
    print(n,'reps',reps,'fails by remainder size',fails)
