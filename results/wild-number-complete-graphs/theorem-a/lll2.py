"""Lopsided LLL check (Mohr's negative dependency for random triple partitions of V\\F).
n odd; rho=n%3; F fixed block of size 0,4,5 (rainbow). N=n-|F| random part.
Per-vertex weight W(mu) <= W1 + WF  (see REPORT).  Condition: W <= (1-xmax)*ln(mu)."""
from fractions import Fraction as Fr
from math import comb, factorial, log
def splits(j): return factorial(3*j)//(factorial(j)*6**j)
def qlist(N,jmax):
    out=[Fr(1)]; p=Fr(1)
    for i in range(jmax):
        p/=comb(N-1-3*i,2); out.append(p)
    return out
# colour classes for E2 events: (max #colours, min #F-vertices matched outside F)
# F rainbow (all C(f,2) edges distinct colours) and all sub-triples of F valid:
#  u not in F: e_u<=1 internal u-edge -> ext=f-2e_u ; at most C(f,2) colours have e_u=1
#  u in F: e_u=0 (an internal u-edge of F-u would make an invalid sub-triple) -> ext=f-1 ; f colours
CLASSES={4:lambda n:((6,2),(n,4),(4,3)), 5:lambda n:((10,3),(n,5),(5,4))}
def weights(n):
    rho=n%3; f={0:0,1:4,2:5}[rho]; N=n-f; t=N//3; h=(n-1)//2; jmax=t//2
    q=qlist(N,jmax)
    W1=[]  # per j: count * q (no mu)
    for j in range(1,jmax+1):
        s=3*j
        cnt=(n-1)*comb(h-1,s//2-1) if s%2==0 else comb(h,(s-1)//2)+(n-1)*comb(h-1,(s-3)//2)
        W1.append(cnt*splits(j)*q[j])
    WF=[]
    for j in range(1,jmax+1):
        if f==0: WF.append(Fr(0)); continue
        s=3*j; c=0
        for (ncol,ext) in CLASSES[f](n):
            if s>=ext: c+=ncol*comb(h,(s-ext)//2)
        WF.append(c*splits(j)*q[j])
    return W1,WF,q
def check(n,mus=None):
    W1,WF,q=weights(n)
    mus=mus or [1+k/200 for k in range(1,100)]
    for mu in mus:
        muF=Fr(mu).limit_denominator(1000)
        W=sum((a+b)*muF**(3*(j+1)) for j,(a,b) in enumerate(zip(W1,WF)))
        xmax=max(q[j]*muF**(3*j) for j in range(1,len(q)))
        lnmu=(muF-1)-(muF-1)**2/2   # lower bound for ln(mu)
        if W<=(1-xmax)*lnmu: return float(muF),float(W)
    return None,None
if __name__=="__main__":
    import sys
    lo,hi=int(sys.argv[1]),int(sys.argv[2])
    for n in range(lo,hi+1,2):
        mu,W=check(n); print(n,n%3,mu,W,flush=True)
