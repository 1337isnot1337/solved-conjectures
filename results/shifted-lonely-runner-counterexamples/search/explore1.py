from core import *
import numpy as np
# u-time base 1..N zero shifts; remove one speed k; measure uncovered at delta=1/(N+1) and 1/N-eps
for N in (30, 50, 80):
    out=[]
    for k in range(1, N+1):
        v=[j for j in range(1,N+1) if j!=k]; s=[0.0]*len(v)
        a=uncovered_float(v,s,1/(N+1)); b=uncovered_float(v,s,1/N-1e-9)
        out.append((k, round(a*N*N,3), round(b*N*N,3)))
    print(N, out)
