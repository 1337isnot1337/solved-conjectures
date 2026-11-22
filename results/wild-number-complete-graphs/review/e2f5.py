import random
from brute import *
from math import comb
rnd=random.Random(7)
for n in (23,29):
    for k in range(2):
        col=cyclic(n) if k==0 else random_nf(n,rnd)
        F=find_F(col,5,rnd)
        if n==29:
            # only j<=4 to keep it cheap
            pass
        hist,out=test_E2_counts(col,F) if n==23 else (None,None)
        if out: print(n,hist,out,"VIOL" if any(e>b for j,e,b in out) else "ok")
# counting inequality for existence of rainbow sub-valid F
bad=[]
for n in range(7,400,2):
    h=(n-1)//2
    for f in (4,5):
        lhs=n*comb(h,2)*comb(n-4,f-4)+n*h*comb(n-3,f-3)
        lhs_report=n*comb(h,2)*(n-4)+n*h*comb(n-3,f-3)
        if not lhs_report<comb(n,f): bad.append((n,f))
print("counting inequality (report form) fails for", bad[-6:], "max failing n", max(b[0] for b in bad))
