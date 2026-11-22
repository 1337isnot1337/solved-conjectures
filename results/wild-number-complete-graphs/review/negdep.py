"""Brute-force check of negative dependency (Lu-Szekely/Mohr) for random perfect matchings of K_N^(3):
P(A_M and B) <= P(A_M) P(B) where B = AND of complements of A_{M_j}, each M_j compatible with M
(M u M_j a matching).  Also the lower-bound coincidence for even/odd."""
import itertools, random
from fractions import Fraction as Fr
def matchings(V):
    if not V: yield (); return
    a=V[0]
    for b,c in itertools.combinations(V[1:],2):
        rest=[x for x in V if x not in (a,b,c)]
        for m in matchings(rest): yield ((a,b,c),)+m
rnd=random.Random(5)
for N in (9,12):
    Om=[frozenset(frozenset(e) for e in m) for m in matchings(list(range(N)))]
    print("N",N,"#matchings",len(Om))
    edges=sorted({e for m in Om for e in m},key=sorted)
    viol=0; tests=0
    for _ in range(300 if N==12 else 2000):
        # random partial matching M of 1..2 triples
        m=rnd.choice(Om); M=frozenset(rnd.sample(sorted(m,key=sorted),rnd.randint(1,2)))
        UM=set().union(*M)
        fam=[]
        for _ in range(rnd.randint(1,6)):
            m2=rnd.choice(Om); Mj=frozenset(rnd.sample(sorted(m2,key=sorted),rnd.randint(1,2)))
            # compatible: every edge equal to an edge of M or disjoint from U(M)
            if all(e in M or not (e & UM) for e in Mj): fam.append(Mj)
        if not fam: continue
        A=[p for p in Om if M<=p]; B=[p for p in Om if not any(Mj<=p for Mj in fam)]
        AB=[p for p in A if not any(Mj<=p for Mj in fam)]
        tests+=1
        if Fr(len(AB),len(Om))>Fr(len(A),len(Om))*Fr(len(B),len(Om)): viol+=1
    print(" tests",tests,"violations",viol)
# lower bounds coincide
print("bound coincidence", all((4*((2*k)//2))//3==(4*((2*k-1+1)//2))//3 for k in range(2,10000)),
      "odd n: n-floor(n/3)==bound", all(n-n//3==(4*((n+1)//2))//3 for n in range(3,20001,2)))
