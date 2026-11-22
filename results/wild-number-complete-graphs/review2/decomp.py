"""Lemma D check by definition: random partitions {F} + triples; if some Q_u is disconnected (direct union-find),
search all sub-collections of j <= t/2 triples for an event of the family (E1: X u-closed & quotient on the j
triples connected; E2: j < t/2, F u X u-closed & quotient on {F}+M connected)."""
import sys, random, itertools
from fac import near, partner, find_F, check
from bounds import par
from brute_events import closed, qconn
def bad(n,P,blocks):
    blk={v:i for i,b in enumerate(blocks) for v in b}
    for u in range(n):
        pr=list(range(len(blocks)))
        def fd(x):
            while pr[x]!=x: x=pr[x]
            return x
        for v in range(n):
            if v!=u: pr[fd(blk[v])]=fd(blk[P[u][v]])
        if len({fd(i) for i in range(len(blocks))})>1: return True
    return False
def run(n,kind,seed,reps):
    rng=random.Random(100+seed); col=near(n,kind,seed); check(col,n); P=partner(col,n)
    f,N,t,h=par(n); F=find_F(col,n,f,rng) if f else []
    VF=[v for v in range(n) if v not in F]; nb=0; miss=0; e2only=0
    for _ in range(reps):
        rng.shuffle(VF); trs=[tuple(VF[3*i:3*i+3]) for i in range(t)]
        blocks=([F] if f else [])+[list(x) for x in trs]
        if not bad(n,P,blocks): continue
        nb+=1; found1=found2=False
        for j in range(1,t//2+1):
            for M in itertools.combinations(trs,j):
                X=set(v for tr in M for v in tr)
                for u in range(n):
                    if not found1 and closed(X,u,P) and qconn(M,u,P): found1=True
                    if f and 2*j<t and not found2 and closed(X|set(F),u,P) and qconn(M,u,P,F): found2=True
        if not (found1 or found2): miss+=1
        elif found2 and not found1: e2only+=1
    print(f"n={n} {kind}{seed} F={F} partitions={reps} bad={nb} caught_only_by_E2={e2only} misses={miss}"); sys.stdout.flush()
    return miss
if __name__=='__main__':
    tot=0
    for spec in sys.argv[1:]:
        n,kind,seed,reps=spec.split(':'); tot+=run(int(n),kind,int(seed),int(reps))
    print('TOTAL MISSES',tot)
