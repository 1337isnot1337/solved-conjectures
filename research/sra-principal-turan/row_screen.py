"""Floating diagnostic for the explicit one-row formula in Sra (4.8).
No positive diagnostic is a proof. A negative candidate needs Fraction replay.
"""
import numpy as np
from scipy.special import logsumexp
from math import log

parameters=[(q,t) for q in [0.0001,0.01,0.1,0.5,0.9,0.99,0.9999] for t in [0.0001,0.01,0.1,0.5,0.9,0.99,0.9999]]
ns=[3,4,5,8,12,20,40,80]
ms=[3,4,5,8,12,20,40,80,160]
xs=np.array([1.000001,1.001,1.01,1.05,1.1,1.25,1.5,2,3,5,10,30,100,1000,1e6])
checks=0;best=(1,None)
for q,t in parameters:
    k=np.arange(max(ms)+1)
    loga=np.zeros((max(ns)+1,len(k)))
    loga[0,1:]=-np.inf
    for j in range(1,max(ns)+1):
        loga[j,1:]=np.cumsum(np.log1p(-t**j*q**k[:-1])-np.log1p(-q**k[1:]))
    for n in ns:
        for m in ms:
            kk=np.arange(m+1)
            rows=[]
            for j in range(n+1):
                lc=loga[j,:m+1]+loga[n-j,m::-1]+j*(m-kk)*log(t)
                lw=lc[:,None]+kk[:,None]*np.log(xs)[None,:]
                w=np.exp(lw-logsumexp(lw,axis=0)[None,:])
                rows.append((kk[:,None]*w).sum(axis=0))
            z=2*np.array(rows[1:-1])-np.array(rows[:-2])-np.array(rows[2:])
            checks+=z.size
            ix=np.unravel_index(np.argmin(z),z.shape)
            v=z[ix]
            if v<best[0]:best=(float(v),(q,t,n,m,int(ix[0]+1),float(xs[ix[1]])))
            if v < -1e-8:
                print('CANDIDATE',best,'checks',checks,flush=True)
                raise SystemExit
    print('no candidate',q,t,'checks',checks,'min diagnostic',best,flush=True)
print('FINISHED',checks,best)
