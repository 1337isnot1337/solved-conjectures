"""Exact checks for the closed formula. The paper's proof is independent of these checks."""
from math import comb
from collections import Counter, defaultdict
from functools import lru_cache
from itertools import product

@lru_cache(None)
def T(M):
 m=(M[0]-1,)+M[1:]
 o=defaultdict(int)
 for (p,i,j),a in F(tuple(v for v in m if v)).items():
  o[j+(p==0),i]+=a
 return o

@lru_cache(None)
def F(M):
 if not M:return {(0,0,0):1}
 if all(v==1 for v in M):
  J=tuple(((1,)*r,(1,)*(len(M)-r),comb(len(M)-1,r-1)) for r in range(1,len(M)+1))
 else:
  r=Counter()
  for U in product(range(1,M[0]+1),*(range(x+1) for x in M[1:])):
   u=tuple(x for x in U if x)
   v=tuple(x-y for x,y in zip(M,U) if x!=y)
   r[u,v]+=1
  J=[(*k,v) for k,v in r.items()]
 o=defaultdict(int)
 for u,v,ways in J:
  for (i,j),a in T(u).items():
   for (r,k,l),b in F(v).items():
    o[1-r,i+k,j+l]+=a*b*ways
 return o



def cycle(m,j):
    return m*comb(m-j,j)//(m-j) if 0<=j<=m//2 else 0

def plane(r):
    P=Counter()
    for a in range((r+1)//2+1):
        for b in range(r//2+1):
            c=r-a-b
            if 0<=c<=r//2 and a:
                N=a*cycle(r+1,a)*cycle(r,b)*cycle(r,c)
                # Individual coefficients of the rational expression may sum, so defer division.
                P[(r+1)//2-a,r//2-b,r//2-c]+=N
    assert all(v%(r*(r+1))==0 for v in P.values())
    return {k:v//(r*(r+1)) for k,v in P.items()}

def direct(M):
    P=Counter()
    for (q,o,e0),v in F(M).items():
        e=e0+(q==0)
        b=sum(M)+1-o-e
        P[e//2,o//2,b//2]+=v
    return dict(P)

def singleton(P,even):
    R=Counter()
    for (i,j,k),m in P.items():
        if even:
            R[i,j,k]+=(2*i+1)*m
            if j: R[i+1,j-1,k]+=2*j*m
            if k: R[i+1,j,k-1]+=2*k*m
        else:
            R[i,j+1,k]+=(2*k+1)*m
            R[i,j,k+1]+=(2*j+1)*m
            if i:R[i-1,j+1,k+1]+=2*i*m
    return dict(R)

for r in range(1,22):
    P=plane(r)
    for k in range(5):
        assert P==direct((r,)+(1,)*k)
        P=singleton(P,(r+k)%2==0)
print("Verified exact coefficient agreement for 105 M=(r,1,...,1) cases.")
