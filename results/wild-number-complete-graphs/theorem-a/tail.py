"""Crude (rigorous) upper bound for the LLL per-vertex weight, used for large n.
W <= (T1+TF1) mu^3 + (T2+TF2) mu^6 + (2.125 n + 15) * sum_{j>=3} mu^{3j}/C(D, ceil(j/2)+1)
 sum_{j>=3} mu^{3j}/C(D,ceil(j/2)+1) <= 2 * sum_{i>=2} mu^{6i}/C(D,i+1)
   <= 2*( r2/(1-ratio) + (D/4+3)*mu^12*(mu^3/sqrt2)^D ),  r2 = mu^12/C(D,3),
   ratio = mu^6 (D/4+2)/(3D/4-1)  (valid for i <= D/4; for D/4 < i <= D/2 use C(D,i+1) >= 2^{D/2})."""
from fractions import Fraction as Fr
from math import comb, sqrt
from lll2 import weights
def crude(n, mu):
    rho=n%3; f={0:0,1:4,2:5}[rho]; N=n-f; h=(n-1)//2; A=N//3
    D=N-h-A
    W1,WF,q=weights_small(n)
    main=float(W1[0]+WF[0])*mu**3+float(W1[1]+WF[1])*mu**6
    r2=mu**12/comb(D,3); ratio=mu**6*(D/4+2)/(0.75*D-1)
    assert ratio<1
    tailsum=2*(r2/(1-ratio)+(D/4+3)*mu**12*(mu**3/sqrt(2))**D)
    return main+(2.125*n+15)*tailsum
def weights_small(n):
    # only j=1,2 exactly (same formulas as lll2.weights)
    import lll2
    rho=n%3; f={0:0,1:4,2:5}[rho]; N=n-f; h=(n-1)//2
    q=lll2.qlist(N,2); W1=[]; WF=[]
    for j in (1,2):
        s=3*j
        cnt=(n-1)*comb(h-1,s//2-1) if s%2==0 else comb(h,(s-1)//2)+(n-1)*comb(h-1,(s-3)//2)
        W1.append(cnt*lll2.splits(j)*q[j])
        c=0
        if f:
            for (ncol,ext) in lll2.CLASSES[f](n):
                if s>=ext: c+=ncol*comb(h,(s-ext)//2)
        WF.append(c*lll2.splits(j)*q[j])
    return W1,WF,q
if __name__=="__main__":
    from math import log
    for n in (301,401,501,601,801,1001,1501,2001):
        best=None
        for k in range(1,60):
            mu=1+k/1000
            lnmu=(mu-1)-(mu-1)**2/2
            if crude(n,mu)<=0.999*lnmu: best=mu; break
        print(n, best)
