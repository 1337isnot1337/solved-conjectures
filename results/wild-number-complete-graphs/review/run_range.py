import sys
from fractions import Fraction as Fr
from lll_indep import *
fails=[]; worst=None
lo,hi=int(sys.argv[1]),int(sys.argv[2])
for n in range(lo,hi+1,2):
    (mu,slack),co=best_mu(n)
    ok,W,R=exact_ok(n,mu,co)
    if not ok:
        # try a finer grid
        for k in range(1,200):
            mu2=Fr(1000+k,1000)
            ok,W,R=exact_ok(n,mu2,co)
            if ok: mu=mu2; break
    rel=float((R-W)/R)
    if worst is None or rel<worst[1]: worst=(n,rel,float(mu))
    if not ok: fails.append(n)
    if n%100 in (1,3,5) or not ok: print(n,"mu",float(mu),"W",float(W),"RHS",float(R),"OK" if ok else "FAIL",flush=True)
print("range",lo,hi,"fails",fails,"min relative slack",worst)
