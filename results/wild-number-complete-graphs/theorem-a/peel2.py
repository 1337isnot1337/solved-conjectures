import random, itertools, sys, n1f, core
from peel import parts, bad_triples
def final_ok(pl, R, blocks):
    # blocks partition R; for each u the hypergraph of parts must connect the blocks
    idx={}
    for i,B in enumerate(blocks):
        for v in B: idx[v]=i
    k=len(blocks)
    for plist in pl:
        par=list(range(k))
        def f(a):
            while par[a]!=a: par[a]=par[par[a]]; a=par[a]
            return a
        c=k
        for p in plist:
            r0=f(idx[p[0]])
            for x in p[1:]:
                r1=f(idx[x])
                if r1!=r0: par[r1]=r0; c-=1
        if c!=1: return False
    return True
def partitions_into(R, sizes):
    if not sizes: yield []; return
    s=sizes[0]; first=R[0]
    for rest in itertools.combinations(R[1:], s-1):
        B=[first]+list(rest); Rem=[x for x in R if x not in B]
        for tail in partitions_into(Rem, sizes[1:]): yield [B]+tail
def run(L, rnd, stop, strategy):
    n=len(L); P=core.partner(L); R=list(range(n)); chosen=[]; traj=[]
    sz=core.sizes(n); tail=[s for s in sz]  # sizes of final blocks
    nfinal=None
    while True:
        # final blocks: those of the size list that remain
        nb_left=len(sz)-len(chosen)
        if len(R)<=stop: break
        pl=parts(n,P,chosen,R); bad=bad_triples(pl,3)
        traj.append((len(R),len(bad)))
        cands=[frozenset(c) for c in itertools.combinations(R,3)]
        good=[c for c in cands if c not in bad]
        if not good: return None,traj
        if strategy=='random': T=rnd.choice(good)
        else:
            sample=rnd.sample(good,min(len(good),40))
            best=None
            for T in sample:
                R2=[x for x in R if x not in T]
                v=len(bad_triples(parts(n,P,chosen+[sorted(T)],R2),3))
                if best is None or v<best[0]: best=(v,T)
            T=best[1]
        chosen.append(sorted(T)); R=[x for x in R if x not in T]
    pl=parts(n,P,chosen,R)
    rest_sizes=sz[len(chosen):]
    for blocks in partitions_into(R, sorted(rest_sizes,reverse=True)):
        if final_ok(pl,R,blocks):
            res=chosen+blocks; assert not core.bad_colours(L,P,res); return res,traj
    return None,traj
if __name__=="__main__":
    n=int(sys.argv[1]); reps=int(sys.argv[2]); stop=int(sys.argv[3]); strat=sys.argv[4]
    rnd=random.Random(2)
    fams=[('rand%d'%s,n1f.random_near(n,s)) for s in range(3)]+[('cyc',n1f.cyclic(n))]
    if n%6 in (1,3): fams.append(('sts',n1f.steiner(n,random.Random(1))))
    if n in (15,31,63): fams.append(('aff',n1f.affine_minus({15:4,31:5,63:6}[n])))
    for name,L in fams:
        f=0; worst={}
        for r in range(reps):
            res,traj=run(L,rnd,stop,strat)
            f+= res is None
            for rr,b in traj: worst[rr]=max(worst.get(rr,0),b)
        print(n,name,strat,'stop',stop,'fail',f,'/',reps,'max bad by r:',sorted(worst.items())[:6],flush=True)
