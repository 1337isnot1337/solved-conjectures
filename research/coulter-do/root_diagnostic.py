"""Bounded diagnostics seeking a parameter obstruction, not a claimed theorem."""
import time
import numpy as np
import sympy as sp
from probe import P, R, z, t, partitions, _P, table_check, zs, ts

def gamma_coeffs(poly, N):
    d=N-2
    if d < 0:
        return [R.one]
    co=[R.zero for _ in range(d+1)]
    for (j,k),v in poly.items():
        assert 1 <= k <= N-1
        co[k-1] += v*z**j
    assert all(co[k]==co[d-k] for k in range(d+1))
    gamma=[]
    for j in range(d//2+1):
        v=co[j]
        gamma.append(v)
        for k in range(d-2*j+1):
            co[j+k] -= v*sp.binomial(d-2*j,k)
    assert not any(co)
    return gamma

def numeric_gamma(gamma,zz):
    a=[]
    for c in gamma:
        v=sum(float(v)*zz**j for (j,k),v in c.items())
        a.append(v)
    if not any(a):
        return [],a
    while a[-1] == 0:
        a.pop()
    roots=np.roots(a[::-1])
    return roots,a

if __name__ == '__main__':
    table_check()
    start=time.time()
    samples=[0.0001,0.01,0.1,0.5,1.,2.,4.,10.,100.,10000.,
             -4.,-4.0001,-4.01,-4.1,-4.5,-5.,-6.,-10.,-100.,-10000.]
    count=0
    for N in range(3,12):
        for mu in partitions(N):
            for r in range(17):
                poly=P(r,mu)
                if not poly:
                    continue
                gamma=gamma_coeffs(poly,N)
                for zz in samples:
                    roots,a=numeric_gamma(gamma,zz)
                    if any(abs(w.imag)>1e-5*(1+abs(w.real)) or w.real>1e-7 for w in roots):
                        print('CANDIDATE',r,mu,zz,'gamma',gamma,'roots',roots,flush=True)
                        raise SystemExit
                count+=1
        print('N',N,'profiles',count,'cache',_P.cache_info(),'seconds',time.time()-start,flush=True)
    print('No candidate in diagnostic sample.',count,flush=True)

