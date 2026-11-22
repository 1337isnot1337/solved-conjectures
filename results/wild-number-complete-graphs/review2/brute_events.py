"""Exact enumeration of the event family of IMPROVEMENT 4.1 on small near-1-factorizations, by definition:
all subsets X of V\\F of size 3j (full subset scan when feasible), closure checked directly for every colour,
all splits of X into triples, connectivity of the quotient checked directly. Events deduplicated as sets of
triples. Compare max_z #events through z with E1(j)+E2(j) from bounds.py."""
import sys, random, itertools
from fac import near, partner, find_F, check
from conn import splits
from bounds import E1, E2, par
def closed(S,u,P):
    return all(x==u or P[u][x] in S for x in S)
def qconn(trs,u,P,extra=None):
    blocks=[set(t) for t in trs]+([set(extra)] if extra else [])
    blk={v:i for i,b in enumerate(blocks) for v in b}
    par_=list(range(len(blocks)))
    def fd(x):
        while par_[x]!=x: x=par_[x]
        return x
    for v,i in blk.items():
        if v!=u:
            w=P[u][v]
            if w in blk: par_[fd(i)]=fd(blk[w])
    return len({fd(i) for i in range(len(blocks))})==1
def events(n,col,F,jmax,full=True):
    P=partner(col,n); f,N,t,h=par(n); VF=[v for v in range(n) if v not in F]
    ev={}
    for j in range(1,jmax+1):
        s=3*j; E=set()
        if full:
            cand=itertools.combinations(VF,s)
        else:   # structural generation: unions of u-edges (complete by the trivial structure of closed sets); closure re-checked below
            cand=set()
            for u in range(n):
                fe=[(x,P[u][x]) for x in VF if x!=u and P[u][x] not in F and x<P[u][x]]
                base=[] ;
                for d in (0,1):
                    if d and u in F: continue
                    k=(s-d)//2
                    if 2*k+d!=s: continue
                    for es in itertools.combinations(fe,k):
                        X=tuple(sorted([v for e in es for v in e]+([u] if d else [])))
                        cand.add(X)
                # E2 sets: forced partners of F plus free edges (+u)
                if f and 2*j<t:
                    Eu=[P[u][y] for y in F if y!=u and P[u][y] not in F]
                    for d in (0,1):
                        if d and u in F: continue
                        r=s-len(Eu)-d
                        if r<0 or r%2: continue
                        for es in itertools.combinations(fe,r//2):
                            cand.add(tuple(sorted(Eu+[v for e in es for v in e]+([u] if d else []))))
        for X in cand:
            Xs=set(X)
            us1=[u for u in range(n) if j<=t//2 and closed(Xs,u,P)]
            us2=[u for u in range(n) if f and 2*j<t and closed(Xs|set(F),u,P)] if f else []
            if not us1 and not us2: continue
            for sp in splits(list(X)):
                key=frozenset(frozenset(tr) for tr in sp)
                if key in E: continue
                if any(qconn(sp,u,P) for u in us1) or any(qconn(sp,u,P,F) for u in us2):
                    E.add(key)
        ev[j]=E
    return ev
def run(n,kind,seed,jmax,full):
    rng=random.Random(seed); col=near(n,kind,seed); check(col,n)
    f,N,t,h=par(n); F=find_F(col,n,f,rng) if f else []
    ev=events(n,col,F,jmax,full)
    out=[]
    for j,E in ev.items():
        cnt={}
        for e in E:
            for tr in e:
                for v in tr: cnt[v]=cnt.get(v,0)+1
        mz=max(cnt.values()) if cnt else 0
        b=E1(n,j)+E2(n,j)
        out.append((j,mz,b))
        print(f"n={n} {kind}{seed} F={F} j={j} events={len(E)} max_z={mz} bound={b} ratio={mz/b if b else 0:.4f} {'OK' if mz<=b else 'VIOLATION'}"); sys.stdout.flush()
    return out
if __name__=='__main__':
    # argv: list of n:kind:seed:jmax:full
    for spec in sys.argv[1:]:
        n,kind,seed,jm,full=spec.split(':')
        n=int(n); f,N,t,h=par(n)
        run(n,kind,int(seed),min(int(jm),t//2),full=='1')
