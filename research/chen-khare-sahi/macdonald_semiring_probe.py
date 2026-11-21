"""Exact Macdonald branching, followed by a diagnostic semiring dual LP.

This investigates Chen--Khare--Sahi Conjecture 5. A float LP result is never
a certificate; every proposed separating functional is checked over Q.
"""
from fractions import Fraction as F
from functools import lru_cache
from itertools import product
import argparse
import time
import numpy as np
from scipy.optimize import linprog
import jack_semiring_probe as j


@lru_cache(None)
def horizontal(lam):
    return tuple(product(*(range(lam[i+1],lam[i]+1) for i in range(len(lam)-1))))


@lru_cache(None)
def psi(lam,mu,q,t):
    """Horizontal-strip coefficient in P_lam(x_1,...,x_n) branching."""
    ans=F(1)
    for i in range(len(mu)):
        for k in range(i,len(mu)):
            for r in range(lam[i]-mu[i]):
                a=mu[i]-mu[k]+r
                b=mu[i]-lam[k+1]+r
                v=k-i
                ans *= ((1-q**a*t**(v+1))*(1-q**(b+1)*t**v)
                        /((1-q**(a+1)*t**v)*(1-q**b*t**(v+1))))
    return ans


@lru_cache(None)
def macdonald(lam,q,t):
    if len(lam)==1:
        return {lam:F(1)}
    out={}
    for mu in horizontal(lam):
        c=psi(lam,mu,q,t)
        last=sum(lam)-sum(mu)
        for e,v in macdonald(mu,q,t).items():
            j.add(out,e+(last,),c*v)
    assert out[lam]==1
    for e,v in out.items():
        assert out.get(tuple(sorted(e,reverse=True)),0)==v,(lam,e)
    return out


def normalized(lam,q,t):
    p=macdonald(lam,q,t);v=sum(p.values())
    return {e:c/v for e,c in p.items()}


def probe(n,D,parameters):
    start=time.time();pp=j.parts(D,n);cols=j.semiring_gens(D,n,F(0))
    arr=np.array(cols,dtype=float).T
    arr/=np.maximum(1,np.max(np.abs(arr),axis=0))
    print('cone',n,D,len(pp),len(cols),'seconds',round(time.time()-start,2),flush=True)
    for q,t in parameters:
        assert 0<q<1 and 0<t<1
        jb={p:normalized(p,q,t) for p in pp}
        for p,r in j.covers(D,n):
            v=j.diff(jb[p],jb[r]);vv=np.array([float(v.get(e,0)) for e in pp]);vv/=max(abs(vv))
            res=linprog(vv,A_ub=-arr.T,b_ub=np.zeros(len(cols)),bounds=[(-1,1)]*len(pp),method='highs')
            assert res.success,res.message
            if res.fun < -1e-7:
                print('CANDIDATE',n,D,str(q),str(t),p,r,res.fun,res.x.tolist(),flush=True)
                for bound in (100,1000,10000,1000000):
                    y=[F(float(a)).limit_denominator(bound) for a in res.x]
                    margins=[sum(a*b for a,b in zip(y,g)) for g in cols]
                    target=sum(y[i]*v.get(e,0) for i,e in enumerate(pp))
                    if min(margins)>=0 and target<0:
                        print('EXACT_DUAL',pp,[str(a) for a in y],str(min(margins)),str(target),flush=True)
                        return True
                return True
        print('no separator',str(q),str(t),'seconds',round(time.time()-start,2),flush=True)
    return False


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--n',type=int,default=3);ap.add_argument('--degree',type=int,default=9)
    ap.add_argument('--parameters',default='1/10:9/10,9/10:1/10,1/2:3/4,3/4:1/2')
    args=ap.parse_args()
    probe(args.n,args.degree,[tuple(F(a) for a in p.split(':')) for p in args.parameters.split(',')])
