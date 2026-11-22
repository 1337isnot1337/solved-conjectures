"""conn(m,d): # partitions into triples of m disjoint pairs (+ d isolated point) with connected quotient.
Three ways: brute force, EGF (exponential formula), root-component recursion (written independently)."""
from fractions import Fraction as Fr
from math import factorial, comb
from functools import lru_cache
import sys
def T(m): return factorial(m)//(factorial(m//3)*6**(m//3)) if m>=0 and m%3==0 else 0
def splits(vs):
    if not vs: yield []; return
    a=vs[0]
    for i in range(1,len(vs)):
        for k in range(i+1,len(vs)):
            rest=vs[1:i]+vs[i+1:k]+vs[k+1:]
            for s in splits(rest): yield [(a,vs[i],vs[k])]+s
def connected(trs,pairs):
    blk={v:i for i,t in enumerate(trs) for v in t}
    par=list(range(len(trs)))
    def fd(x):
        while par[x]!=x: par[x]=par[par[x]]; x=par[x]
        return x
    for a,b in pairs: par[fd(blk[a])]=fd(blk[b])
    return len({fd(i) for i in range(len(trs))})==1
def brute(m,d):
    vs=list(range(2*m+d)); pairs=[(2*i,2*i+1) for i in range(m)]
    if len(vs)%3: return 0
    return sum(connected(s,pairs) for s in splits(vs))
@lru_cache(None)
def rec(m,d):
    # root = vertex 0 (in pair 0). component of root: pair0 + (m'-1) other pairs + d' of the isolated
    if (2*m+d)%3: return 0
    tot=T(2*m+d)
    for mp in range(1,m+1):
        for dp in range(d+1):
            if (mp,dp)==(m,d): continue
            if (2*mp+dp)%3: continue
            tot-=comb(m-1,mp-1)*rec(mp,dp)*T(2*(m-mp)+(d-dp))
    return tot
def egf(M):
    # A0 = sum T(2m) x^m/m!, A1 = sum T(2m+1) x^m/m!; C0 = log A0, C1 = A1/A0 (power series, Fractions)
    A0=[Fr(T(2*m),factorial(m)) for m in range(M+1)]; A1=[Fr(T(2*m+1),factorial(m)) for m in range(M+1)]
    # log of series with A0[0]=1: L' = A0'/A0
    inv=[Fr(0)]*(M+1); inv[0]=Fr(1)
    for i in range(1,M+1): inv[i]=-sum(A0[k]*inv[i-k] for k in range(1,i+1))
    dA=[(i+1)*A0[i+1] for i in range(M)]
    q=[sum(dA[k]*inv[i-k] for k in range(i+1)) for i in range(M)]
    C0=[Fr(0)]+[q[i-1]/i for i in range(1,M+1)]
    C1=[sum(A1[k]*inv[i-k] for k in range(i+1)) for i in range(M+1)]
    return [c*factorial(m) for m,c in enumerate(C0)],[c*factorial(m) for m,c in enumerate(C1)]
if __name__=='__main__':
    c0,c1=egf(14)
    for m in range(0,15):
        for d in (0,1):
            r=rec(m,d) if m>0 else 0
            e=(c0 if d==0 else c1)[m] if m>0 else 0
            assert r==e,(m,d,r,e)
    print('rec == egf for m<=14')
    for m,d in [(1,1),(3,0),(4,1),(6,0),(7,1)]:
        b=brute(m,d); print(m,d,'brute',b,'rec',rec(m,d),'T',T(2*m+d)); sys.stdout.flush()
        assert b==rec(m,d)
