"""Own implementation of the per-vertex bounds E1(j), E2(j) of IMPROVEMENT 4.3 and of condition (*).
Class data derived here from scratch:
 f=4: int=1 colours: 6 (u not in F, ext 2, h_u=h-3); u in F: 4 (ext 3, h_u=h-3); other: n-10 (ext 4, h_u=h-4)
 f=5: int=1: 10 (ext 3, h-4); u in F: 5 (ext 4, h-4); other: n-15 (ext 5, h-5)
 f=0: n colours, h_u=h."""
from fractions import Fraction as Fr
from math import comb
from conn import rec as conn, T
def C(a,b): return comb(a,b) if 0<=b<=a else 0
def par(n):
    f={0:0,1:4,2:5}[n%3]; N=n-f; return f,N,N//3,(n-1)//2
def classes(n):
    f,N,t,h=par(n)
    if f==0: return [dict(cnt=n,ext=0,hu=h,inF=False)]
    if f==4: return [dict(cnt=6,ext=2,hu=h-3,inF=False),dict(cnt=4,ext=3,hu=h-3,inF=True),dict(cnt=n-10,ext=4,hu=h-4,inF=False)]
    return [dict(cnt=10,ext=3,hu=h-4,inF=False),dict(cnt=5,ext=4,hu=h-4,inF=True),dict(cnt=n-15,ext=5,hu=h-5,inF=False)]
def E1(n,j):
    f,N,t,h=par(n); s=3*j; cl=classes(n)
    if s%2==0:
        k=s//2; avail=n-1-f   # colours u != z with M_u(z) not in F
        # greedy worst case: fill the larger-h_u classes first
        tot=0
        for c in sorted(cl,key=lambda c:-c['hu']):
            take=min(c['cnt'],avail); avail-=take; tot+=take*C(c['hu']-1,k-1)
        return conn(k,0)*tot
    k=(s-1)//2
    # u in X, u not in F. u=z: C(h_z,k) with h_z max over non-F classes; u != z: N-1 colours, z on a free u-edge
    hz=max(c['hu'] for c in cl if not c['inF'])
    avail=N-1; tot=C(hz,k)
    for c in sorted([c for c in cl if not c['inF']],key=lambda c:-c['hu']):
        take=min(c['cnt'],avail); avail-=take; tot+=take*C(c['hu']-1,k-1)
    return conn(k,1)*tot
def E2(n,j,tight=True):
    f,N,t,h=par(n); s=3*j
    if f==0 or 2*j>=t: return 0
    free=0; mx=0
    for c in classes(n):
        r=s-c['ext']
        if r<0: continue
        d=r%2
        if d and c['inF']: continue
        k=(r-d)//2
        free+=c['cnt']*C(c['hu']-1,k-1); mx=max(mx,C(c['hu'],k))
    return T(s)*(free+(f+1)*mx)
def q(N,j):
    p=Fr(1)
    for i in range(j): p/=comb(N-1-3*i,2)
    return p
def coefs(n):
    f,N,t,h=par(n)
    return [(E1(n,j)+E2(n,j))*q(N,j) for j in range(1,t//2+1)]
def W(co,a): return sum(c*a**(3*(i+1)) for i,c in enumerate(co))
