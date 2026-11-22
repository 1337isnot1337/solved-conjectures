"""Rigorous verification of the LLL condition (exact rationals, ln(mu) bounded below by (mu-1)-(mu-1)^2/2).
Part 1: every odd n in [189, 1201] (and n = 165,171,177,183) via exact sums over all j <= t/2.
Part 2: crude bound (tail.py) for n = 1201,1203,1205 (one per residue mod 3) with mu=1.025;
        each summand of the crude bound is decreasing in n (see REPORT), so it holds for all n >= 1201."""
import sys
from fractions import Fraction as Fr
import lll2, tail
MUS=[Fr(11,10),Fr(108,100),Fr(106,100),Fr(105,100),Fr(104,100),Fr(103,100)]
ok=True
import sys
lo=int(sys.argv[1]) if len(sys.argv)>1 else 189
ns=([165,171,177,183] if lo==189 else [])+list(range(lo,1202,2))
for n in ns:
    W1,WF,q=lll2.weights(n); found=None
    for mu in MUS:
        W=sum((a+b)*mu**(3*(j+1)) for j,(a,b) in enumerate(zip(W1,WF)))
        xmax=max(q[j]*mu**(3*j) for j in range(1,len(q)))
        lnmu=(mu-1)-(mu-1)**2/2
        if W<=(1-xmax)*lnmu: found=(mu,W); break
    if found is None: ok=False; print("FAIL",n,flush=True)
    elif n%100<2 or n<190: print(n,"mu",float(found[0]),"W",float(found[1]),flush=True)
for n in (1201,1203,1205):
    mu=1.025; lnmu=(mu-1)-(mu-1)**2/2; c=tail.crude(n,mu)
    print("crude",n,c,"<=",0.999*lnmu, c<=0.999*lnmu); ok&= c<=0.999*lnmu
print("ALL OK" if ok else "SOME FAIL")
