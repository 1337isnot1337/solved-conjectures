"""(i) hypothesis (L) in product form for canonical events of K_12^(3): P(A_M & B) <= P(A_M) P(B), B = no member of R,
R = canonical events (1 or 2 triples) with support disjoint from V(M).  (ii) Lemma C conclusion on random families:
choose constant a with (W); check Z_{S \\ S_U} <= a^{|U|} Z_S for random S, U.  Exact integer counting over all
15400 perfect matchings."""
import random, itertools
from fractions import Fraction as Fr
V=list(range(12))
def pms(vs):
    if not vs: yield frozenset(); return
    a=vs[0]
    for i in range(1,len(vs)):
        for k in range(i+1,len(vs)):
            for r in pms(vs[1:i]+vs[i+1:k]+vs[k+1:]): yield r|{frozenset((a,vs[i],vs[k]))}
ALL=list(pms(V)); assert len(ALL)==15400
rng=random.Random(11)
def rand_event(avoid=frozenset(),maxj=2):
    vs=[v for v in V if v not in avoid]; j=rng.randint(1,min(maxj,len(vs)//3))
    if j==0: return None
    rng.shuffle(vs); return frozenset(frozenset(vs[3*i:3*i+3]) for i in range(j))
def occurs(P,M): return M<=P
viol=0; tests=0
for _ in range(300):
    M=rand_event(); U=frozenset(v for t in M for v in t)
    if len(U)>9: continue
    R=[e for e in (rand_event(U) for _ in range(rng.randint(1,12))) if e]
    nA=nB=nAB=0
    for P in ALL:
        a=occurs(P,M); b=not any(occurs(P,G) for G in R)
        nA+=a; nB+=b; nAB+=a and b
    tests+=1
    if nAB*len(ALL)>nA*nB: viol+=1
print('(L) product form: tests',tests,'violations',viol)
# Lemma C sanity
bad=0; checks=0; fams=0
for _ in range(60):
    fam=[]
    while len(fam)<rng.randint(4,14):
        e=rand_event(maxj=2)
        if e not in fam: fam.append(e)
    supp=[frozenset(v for t in e for v in t) for e in fam]
    pr=[Fr(sum(occurs(P,e) for P in ALL),len(ALL)) for e in fam]
    best=None
    for k in range(1,400):
        a=1+Fr(k,200)
        if all(sum(pr[i]*a**len(supp[i]) for i in range(len(fam)) if z in supp[i])<=a-1 for z in V): best=a; break
    if best is None: continue
    fams+=1
    occ=[[occurs(P,e) for e in fam] for P in ALL]
    def Z(S): return Fr(sum(1 for o in occ if not any(o[i] for i in S)),len(ALL))
    for _ in range(40):
        S=[i for i in range(len(fam)) if rng.random()<0.7]
        Uz=set(rng.sample(V,rng.randint(1,4)))
        S2=[i for i in S if not (supp[i]&Uz)]
        checks+=1
        if Z(S2)>best**len(Uz)*Z(S): bad+=1
    if Z(range(len(fam)))<best**-12: bad+=1
print('Lemma C: families with (W)',fams,'checks',checks,'violations',bad)
