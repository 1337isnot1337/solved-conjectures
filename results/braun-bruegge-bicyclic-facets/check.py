#!/usr/bin/env python3
"""Exact finite base of the Braun–Bruegge mixed-parity theta bound."""
from math import comb

LIMIT = 144
binomial = [[comb(i,j) for j in range(i+1)] for i in range(LIMIT)]
def F(*pars):
    a,b,c = sorted(pars,reverse=True)
    assert (a-b)%2 == 0 and (a-c)%2 == 0
    db, da = (b-c)//2,(a-c)//2
    return sum(x*binomial[b][db+j]*binomial[a][da+j]
               for j,x in enumerate(binomial[c]))

def odd_cycle(r):
    assert r%2 == 1 and r>=1
    return r*binomial[r-1][(r-1)//2]

def M(n):
    # For odd n the two odd cycle lengths sum to n+1.
    # For even n they sum to n, with an extra bridge factor 2.
    S = n + (n%2)
    r = S//2
    if r%2 == 0:r -= 1
    return (2 if n%2 == 0 else 1)*odd_cycle(r)*odd_cycle(S-r)

checked=0
for L in range(5,LIMIT):
    for b in range(1,(L-1)//2+1):
        for a in range(b,L-b):
            c=L-a-b
            if (a-b)%2 or (a-c)%2 == 0:continue
            actual = a*b*F(a-1,b-1,c) + c*F(a,b,c-1)
            assert actual <= M(L-1),(a,b,c,actual,M(L-1))
            checked+=1

print("All",checked,"mixed-parity tuples passed at total length 5 through",LIMIT-1)
