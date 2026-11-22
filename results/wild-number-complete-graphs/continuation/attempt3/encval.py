"""Validate cegar.Enc: with the colouring fixed to a real factorization, the clause added for a
partition P is satisfiable iff P has a seal (direct union-find check)."""
import random, sys
from cegar import Enc, partners, sealfree, rand_partition
import fac
rnd=random.Random(3); bad=0; tot=0
for n in (9,11,13):
    for s in range(3):
        L=fac.near(n,'dbl',s+1); P=partners(L)
        for t in range(40):
            B=rand_partition(n,rnd)
            E=Enc(n,None)
            for a in range(n):
                for b in range(a+1,n): E.S.add_clause([E.X(a,b,L[a][b])])
            E.add_partition(B)
            sat=E.S.solve(); sealed= not sealfree(P,B,n)
            tot+=1; bad+= (sat!=sealed)
print('checked',tot,'mismatches',bad)
