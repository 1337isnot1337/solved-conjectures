"""Exact necklace transform diagnostics. No finite positive check is a proof."""
from math import comb, factorial
from long_cycle_probe import eulerian, trim, newton_failure
import sympy as sp
import numpy as np

def numerator_rows(k, nmax):
    """Return B_n(N)=n! C_{n,k}(N), in ascending powers of N."""
    logs=[{} for _ in range(nmax+1)]
    for m in range(1,nmax+1):
        for d in sp.divisors(m):
            if d<k:continue
            for e in sp.divisors(d):
                mu=int(sp.mobius(e))
                if mu:logs[m][d//e]=logs[m].get(d//e,0)+mu
    rows=[[1]]
    for n in range(1,nmax+1):
        b=[0]*(n+1)
        factor=1
        for m in range(1,n+1):
            if m>1:factor*=n-m+1
            for d,v in logs[m].items():
                if not v:continue
                for j,c in enumerate(rows[n-m]):b[d+j]+=factor*v*c
        rows.append(trim(b))
    return rows

def descent_from_numerator(b,n,a):
    out=[0]*(n+1)
    for j,v in enumerate(b):
        if not v:continue
        assert j>0
        factor=[(-1)**i*comb(n-j,i) for i in range(n-j+1)]
        for r,c in enumerate(a[j]):
            for s,h in enumerate(factor):out[r+s]+=v*c*h
    fact=factorial(n)
    assert all(c%fact==0 for c in out)
    return trim([c//fact for c in out])

def main():
    nmax=60;a=eulerian(nmax);x=sp.Symbol('x')
    for k in range(3,31):
        rows=numerator_rows(k,nmax)
        largest=(0,None)
        for n in range(k,nmax+1):
            b=rows[n]
            p=descent_from_numerator(b,n,a)
            assert all(v>=0 for v in p)
            q=p[:]
            while len(q)>1 and q[0]==0:q.pop(0)
            if newton_failure(q) is not None:
                print('NEWTON FAILURE',k,n,q,flush=True);return
            if n<=30:
                poly=sp.Poly.from_list(q[::-1],x).sqf_part()
                if poly.count_roots(-sp.oo,sp.oo)!=poly.degree():
                    print('EXACT NONREAL',k,n,p,flush=True);return
            if n<=30:
                roots=np.roots([v/b[-1] for v in b[::-1]])
                rad=max(map(abs,roots),default=0)
                if rad>largest[0]:largest=(rad,n)
        print('k',k,'no obstruction; sampled numerator max modulus',largest,flush=True)
    print('No counterexample. Finite diagnostics only.',flush=True)

if __name__=='__main__':main()
