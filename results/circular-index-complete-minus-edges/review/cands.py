# Lemma 0 candidate fractions p/q (lowest terms) with q<=m, p<=N, in [N/m, upper)
from fractions import Fraction as Fr
from math import gcd
def cands(n,t,upper):
    m=(n-1)//2; N=m*n-t; lo=Fr(N,m); s=set()
    for q in range(1,m+1):
        for p in range(1,N+1):
            f=Fr(p,q)
            if lo<=f<upper: s.add(f)
    return sorted(s)
for n,t,up,lab in [(11,2,Fr(32,3),'K11-2K2 below 32/3'),(15,3,Fr(15),'K15-3K2 below 15'),(9,3,Fr(17,2),'K9-3e below 17/2'),
                   (11,3,Fr(21,2),'K11-3e below 21/2'),(13,3,Fr(25,2),'K13-3e below 25/2'),(11,2,Fr(11),'K11-P3 below 11'),(13,2,Fr(13),'K13-2e below 13')]:
    print(lab,[str(f) for f in cands(n,t,up)])
