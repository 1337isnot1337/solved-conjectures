"""Exact structural probes for Alexandersson's all-parameter conjectures.
Not a proof of the conjectures; a negative certificate would refute them.
"""
from math import comb
import sympy as sp

def trim(p):
    while len(p)>1 and p[-1]==0:
        p.pop()
    return p

def add(p,q):
    r=[0]*max(len(p),len(q))
    for i,v in enumerate(p):r[i]+=v
    for i,v in enumerate(q):r[i]+=v
    return trim(r)

def mul(p,q):
    r=[0]*(len(p)+len(q)-1)
    for i,a in enumerate(p):
        for j,b in enumerate(q):r[i+j]+=a*b
    return trim(r)

def eulerian(nmax):
    a=[[1]]
    for n in range(1,nmax+1):
        old=a[-1]; new=[0]*n
        for i,c in enumerate(old):
            new[i]+=(i+1)*c
            if i+1<n:new[i+1]+=(n-1-i)*c
        a.append(new)
    return a

def exc_rows(k,nmax,a):
    rows=[[1]]+[[0] for _ in range(nmax)]
    for n in range(k,nmax+1):
        p=rows[n-1]; q=[0]*(len(p)+1)
        for i,c in enumerate(p):
            q[i]+=i*c
            q[i+1]+=(n-1-i)*c
        lag=mul([0]+a[k-1],rows[n-k])
        rows[n]=add(q,[comb(n-1,k-1)*c for c in lag])
    return rows

def gamma(p):
    assert p==p[::-1]
    d=len(p)-1; g=[]
    for i in range(d//2+1):
        g.append(p[i]-sum(g[j]*comb(d-2*j,i-j) for j in range(i)))
    return trim(g)

def newton_failure(p):
    p=trim(p[:]); d=len(p)-1
    for i in range(1,d):
        if p[i]**2*i*(d-i)<p[i-1]*p[i+1]*(i+1)*(d-i+1):return i
    return None

def main():
    nmax=100;a=eulerian(nmax)
    checked=0
    for k in range(3,51):
        rows=exc_rows(k,nmax,a)
        for n in range(k,nmax+1):
            p=rows[n]
            assert p[0]==0 and p[1:]==p[1:][::-1]
            g=gamma(p[1:])
            assert all(c>=0 for c in g)
            bad=newton_failure(g)
            if bad is not None:
                print('GAMMA NEWTON FAILURE',n,k,bad,g,flush=True);return
            checked+=1
        print('finished',k,'checks',checked,flush=True)
    print('No Newton obstruction; this does not prove real-rootedness',flush=True)
    x=sp.Symbol('x')
    for n in range(3,61):
        p=[0]*n
        for d in sp.divisors(n):
            mu=int(sp.mobius(d))
            if not mu:continue
            factor=[(-1)**j*comb(n-n//d,j) for j in range(n-n//d+1)]
            term=mul(factor,a[n//d])
            for j,c in enumerate(term):p[j]+=mu*c
        assert all(v%n==0 for v in p)
        p=trim([v//n for v in p])
        while p and p[0]==0:p.pop(0)
        if newton_failure(p) is not None:
            print('CYCLE DESCENT NEWTON FAILURE',n,p,flush=True);return
        if n<=32:
            poly=sp.Poly.from_list(p[::-1],x)
            # count_roots counts distinct roots.  Repeated real roots are allowed.
            squarefree=poly.sqf_part()
            count=squarefree.count_roots(-sp.oo,sp.oo)
            if count<squarefree.degree():
                print('CYCLE DESCENT NONREAL',n,count,poly,flush=True);return
    print('Single-cycle structural rows passed bounded diagnostics only',flush=True)

if __name__=='__main__':main()
