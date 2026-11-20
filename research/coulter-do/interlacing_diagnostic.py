"""Bounded interlacing diagnostics, never used as a proof."""
import time
import numpy as np
from functools import lru_cache
from probe import P, partitions, _P
from root_diagnostic import gamma_coeffs, numeric_gamma

@lru_cache(None)
def root_table(r,mu):
    N=sum(mu)
    gamma=gamma_coeffs(P(r,mu),N)
    table=[]
    for zz in samples:
        gammas,_=numeric_gamma(gamma,zz)
        roots=[0.]
        if N%2:
            roots.append(-1.)
        for a in gammas:
            if abs(a.imag)>1e-5 or a.real >= 0:
                raise ArithmeticError((r,mu,zz,a))
            a=a.real
            small=2*a/(1-2*a+np.sqrt(1-4*a))
            roots.extend([small,1/small])
        table.append(sorted(roots))
    return table

samples=[0.0001,0.01,0.1,0.5,1.,2.,4.,10.,100.,10000.,
         -4.,-4.0001,-4.01,-4.1,-4.5,-5.,-6.,-10.,-100.,-10000.]
start=time.time()
count=0
for N in range(3,11):
    for mu in partitions(N):
        for r in range(13):
            aa=root_table(r,mu)
            for i in range(len(mu)):
                if i and mu[i]==mu[i-1]:
                    continue
                nu=list(mu)
                nu[i]+=1
                nu=tuple(sorted(nu,reverse=True))
                bb=root_table(r,nu)
                for zz,a,b in zip(samples,aa,bb):
                    assert len(b)==len(a)+1
                    if any(a[j]<b[j]-1e-7*(1+abs(a[j])) or
                           a[j]>b[j+1]+1e-7*(1+abs(a[j])) for j in range(len(a))):
                        print('CANDIDATE',r,mu,nu,zz,a,b,flush=True)
                        raise SystemExit
                count+=1
    print('N',N,'edges',count,'cache',_P.cache_info(),'seconds',time.time()-start,flush=True)
print('No candidate in diagnostic sample.',count,flush=True)
