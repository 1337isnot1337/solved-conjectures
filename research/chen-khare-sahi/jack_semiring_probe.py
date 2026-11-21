"""Bounded diagnostic for Chen--Khare--Sahi Conjecture 4.

Jack polynomials use tau=1/alpha. Exact rational polynomial construction;
floating linear programs only suggest candidates, never certify a result.
"""
from fractions import Fraction as F
from functools import lru_cache
from itertools import permutations
from math import gcd, lcm
import argparse, time
import numpy as np
from scipy.optimize import linprog


@lru_cache(None)
def parts(d,n,cap=None):
    if n==0:return ((),) if d==0 else ()
    if cap is None:cap=d
    return tuple((a,)+p for a in range(min(cap,d),-1,-1) for p in parts(d-a,n-1,a))


@lru_cache(None)
def orbit(p):return tuple(sorted(set(permutations(p))))


def dominates(p,q):
    return all(sum(p[:i])>=sum(q[:i]) for i in range(1,len(p)+1))


def add(out,e,v):
    out[e]=out.get(e,0)+v
    if out[e]==0:del out[e]


def mul(p,q):
    out={}
    for e,v in p.items():
        for f,w in q.items():add(out,tuple(a+b for a,b in zip(e,f)),v*w)
    return out


def primitive(p):
    den=1
    for v in p.values():den=lcm(den,F(v).denominator)
    out={e:int(v*den) for e,v in p.items() if v}
    g=0
    for v in out.values():g=gcd(g,abs(v))
    return {e:v//g for e,v in out.items()} if g else {}


@lru_cache(None)
def d1_col(p):
    out={};n=len(p)
    for e in orbit(p):
        for i in range(n):
            for j in range(i+1,n):
                a,b=e[i],e[j]
                if a<b:continue
                if a==b:add(out,e,2*a);continue
                for k in range(a-b+1):
                    f=list(e);f[i]=a-k;f[j]=b+k;add(out,tuple(f),2*a)
                for k in range(a-b-1):
                    f=list(e);f[i]=a-1-k;f[j]=b+1+k;add(out,tuple(f),-2*b)
    # Symmetry is a meaningful guard on the paired divided-difference formula.
    for e,v in out.items():assert out[tuple(sorted(e,reverse=True))]==v
    return out


@lru_cache(None)
def jack_basis(d,n,tau):
    pp=parts(d,n);cols=[d1_col(p) for p in pp]
    diag=[sum(a*(a-1) for a in p)+tau*cols[i].get(p,0) for i,p in enumerate(pp)]
    result={}
    for i,p in enumerate(pp):
        cc=[F(0)]*len(pp);cc[i]=F(1)
        for j in range(i+1,len(pp)):
            q=pp[j]
            num=sum(tau*cols[k].get(q,0)*cc[k] for k in range(i,j))
            if not dominates(p,q):assert not num;continue
            assert diag[i]>diag[j],(p,q,tau)
            cc[j]=num/(diag[i]-diag[j])
        poly={e:cc[j] for j,q in enumerate(pp) if cc[j] for e in orbit(q)}
        val=sum(poly.values());result[p]={e:c/val for e,c in poly.items()}
    return result


@lru_cache(None)
def covers(d,n):
    pp=parts(d,n)
    return tuple((p,q) for i,p in enumerate(pp) for q in pp[i+1:]
                 if dominates(p,q) and not any(r!=p and r!=q and dominates(p,r) and dominates(r,q) for r in pp))


def diff(p,q):
    r=dict(p)
    for e,v in q.items():add(r,e,-v)
    return r


def semiring_gens(D,n,sigma):
    # Generators are homogeneous. Products of total degree D exhaust its
    # homogeneous cone, once scalar multiples and zero products are removed.
    basic=[]
    for d in range(1,D+1):
        jb=jack_basis(d,n,sigma)
        basic += [(d,False,primitive(p)) for p in jb.values()]
        basic += [(d,True,primitive(diff(jb[p],jb[q]))) for p,q in covers(d,n)]
    pp=parts(D,n);seen={}
    def visit(start,left,p,has_diff):
        if left==0:
            if has_diff:
                p=primitive(p);key=tuple(p.get(e,0) for e in pp)
                seen[key]=p
            return
        for j in range(start,len(basic)):
            d,b,q=basic[j]
            if d>left:break
            visit(j,left-d,mul(p,q),has_diff or b)
    visit(0,D,{(0,)*n:1},False)
    return list(seen)


def main(n,D,sigma,taus):
    started=time.time();pp=parts(D,n);cols=semiring_gens(D,n,sigma)
    print('cone',n,D,str(sigma),len(pp),len(cols),'seconds',time.time()-started,flush=True)
    arr=np.array(cols,dtype=float).T
    norms=np.maximum(1,np.max(np.abs(arr),axis=0));arr=arr/norms
    for tau in taus:
        assert tau>sigma
        jb=jack_basis(D,n,tau)
        for p,q in covers(D,n):
            v=diff(jb[p],jb[q]);vv=np.array([float(v.get(e,0)) for e in pp]);vv/=max(abs(vv))
            # A bounded dual problem finds separating functionals directly.
            res=linprog(vv,A_ub=-arr.T,b_ub=np.zeros(len(cols)),bounds=[(-1,1)]*len(pp),method='highs')
            assert res.success,res.message
            if res.fun < -1e-7:
                print('CANDIDATE',{'n':n,'degree':D,'sigma':str(sigma),'tau':str(tau),'lambda':p,'mu':q,'objective':res.fun,'dual':res.x.tolist()},flush=True)
                # Rounding is only accepted if every exact generator inequality
                # and the strict target inequality can be checked rationally.
                for bound in (100,1000,10000,1000000):
                    y=[F(float(t)).limit_denominator(bound) for t in res.x]
                    margins=[sum(a*b for a,b in zip(y,g)) for g in cols]
                    target=sum(y[i]*v.get(e,0) for i,e in enumerate(pp))
                    if min(margins)>=0 and target<0:
                        print('EXACT_DUAL',{'partitions':pp,'y':[str(t) for t in y],'minimum':str(min(margins)),'target':str(target)},flush=True)
                        return True
                return True
        print('no separator',str(tau),'seconds',round(time.time()-started,2),flush=True)
    return False


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--n',type=int,default=3);ap.add_argument('--degree',type=int,default=7);ap.add_argument('--sigma',default='1');ap.add_argument('--taus',default='2,5,100');args=ap.parse_args()
    main(args.n,args.degree,F(args.sigma),[F(s) for s in args.taus.split(',')])
