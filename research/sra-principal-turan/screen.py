"""Diagnostic search for Sra Conjecture 4.1; not a proof of positivity.

Macdonald coefficients and every reported negative witness use Fraction.
Floating evaluations only select possible witnesses for exact replay.
"""
from fractions import Fraction as F
from functools import lru_cache
from itertools import product
import argparse
import time

@lru_cache(None)
def horizontal(lam):
    return tuple(product(*(range(lam[i+1],lam[i]+1) for i in range(len(lam)-1))))

@lru_cache(None)
def psi(lam,mu,q,t):
    ans=F(1)
    for i in range(len(mu)):
        for k in range(i,len(mu)):
            for r in range(lam[i]-mu[i]):
                a=mu[i]-mu[k]+r
                b=mu[i]-lam[k+1]+r
                v=k-i
                ans*=((1-q**a*t**(v+1))*(1-q**(b+1)*t**v)
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
            key=e+(last,)
            out[key]=out.get(key,F(0))+c*v
    assert out[lam]==1
    for e,v in out.items():
        assert out.get(tuple(sorted(e,reverse=True)),0)==v
    return out

def parts(d,n,top=None):
    if n==0:
        if d==0: yield ()
        return
    if top is None: top=d
    for a in range(min(d,top),-1,-1):
        for rest in parts(d-a,n-1,a): yield (a,)+rest

def split_coeffs(p,t,n):
    degree=sum(next(iter(p)))
    out=[[F(0)]*(degree+1) for _ in range(n+1)]
    for e,c in p.items():
        weight=c*t**sum(i*a for i,a in enumerate(e))
        for j in range(n+1): out[j][sum(e[:j])]+=weight
    return out

def val_der(c,x):
    v=c[-1];der=0
    for a in reversed(c[:-1]):
        der=der*x+v
        v=v*x+a
    return v,der

def screen(n,degree,params):
    start=time.time();checks=0
    xs=list(map(F,['101/100','11/10','5/4','3/2','2','3','5','10','30','100','1000']))
    for q,t in params:
        assert 0 < q < 1 and 0 < t < 1
        for d in range(1,degree+1):
            count=0
            for lam in parts(d,n):
                if lam[-1]!=0: continue # determinant shifts cancel from each ratio
                p=macdonald(lam,q,t);cs=split_coeffs(p,t,n)
                fs=[[float(a) for a in c] for c in cs]
                for i in range(1,n):
                    for x in xs:
                        vs=[val_der(fs[k],float(x)) for k in (i-1,i,i+1)]
                        z=2*vs[1][1]/vs[1][0]-vs[0][1]/vs[0][0]-vs[2][1]/vs[2][0]
                        checks+=1
                        if z < -1e-12:
                            exact=[val_der(cs[k],x) for k in (i-1,i,i+1)]
                            delta=2*exact[1][1]/exact[1][0]-exact[0][1]/exact[0][0]-exact[2][1]/exact[2][0]
                            if delta<0:
                                print('EXACT_COUNTER',n,lam,str(q),str(t),i,str(x),'delta=',delta,flush=True)
                                print('COEFFICIENTS',[[str(a) for a in cs[k]] for k in (i-1,i,i+1)],flush=True)
                                return False
                count+=1
            print('no witness',n,d,str(q),str(t),'shapes',count,'total evaluations',checks,'seconds',round(time.time()-start,2),flush=True)
        macdonald.cache_clear();psi.cache_clear()
    return True

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--n',type=int,default=3);ap.add_argument('--degree',type=int,default=16)
    ap.add_argument('--params',default='1/10:9/10,9/10:1/10,1/2:3/4,3/4:1/2')
    args=ap.parse_args()
    screen(args.n,args.degree,[tuple(F(x) for x in p.split(':')) for p in args.params.split(',')])
