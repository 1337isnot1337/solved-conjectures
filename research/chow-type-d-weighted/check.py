#!/usr/bin/env python3
"""Independent finite arithmetic checks for the weighted Chow extension."""
from collections import defaultdict
from itertools import permutations, product
from math import comb, prod
from fractions import Fraction as Q

def literal(n):
 out=defaultdict(int)
 for p in permutations(range(1,n+1)):
  for signs in product((1,-1),repeat=n):
   if prod(signs)!=1:continue
   w=[a*s for a,s in zip(p,signs)]
   d=int(w[0]+w[1]<0)+sum(a>b for a,b in zip(w,w[1:]))
   e=sum(a<0 for a in w[1:])
   out[d,e]+=1
 return dict(out)

def normalized(a):
    return {k:v for k,v in a.items() if v}
def step(row,m):
 new=[]
 cut=[((m-1)*i+m-1)//m for i in range(2*m)]
 assert set(cut)==set(range(2*m-1))
 for i,s in enumerate(cut):
  R=defaultdict(int)
  for j,c in enumerate(row):
   for (d,e),v in c.items():
    R[d+int(j<s),e+int(i>=m)] += v
  new.append(dict(R))
 return new

def total(row):
 out=defaultdict(int)
 for r in row:
  for k,v in r.items():out[k]+=v
 return dict(out)

def times_qplus1(a):
 out=defaultdict(int)
 for (d,e),v in a.items():
  out[d,e]+=v
  out[d,e+1]+=v
 return dict(out)

if __name__=='__main__':
 row=[{(0,0):1,(0,1):1},{(1,0):1,(1,1):1},
      {(1,1):1,(1,2):1},{(2,1):1,(2,2):1}]
 for m in range(2,7):
  if m>2:row=step(row,m)
  D=literal(m)
  assert times_qplus1(D)==total(row)
  if m==3:
   assert D=={(0,0):1,(1,0):4,(1,1):6,(1,2):1,
              (2,0):1,(2,1):6,(2,2):4,(3,2):1}
 a=[7,10,-11,-12,12,6]
 assert [sum(a[i]*comb(i,k) for i in range(k,6)) for k in range(6)]==[12,30,85,96,42,6]
 assert [sum(Q(a[i]*comb(k,i),comb(5,i)) for i in range(k+1))
         for k in range(6)]==[7,9,Q(99,10),Q(17,2),6,12]
 print('Weighted recurrence agrees with literal even-signed counting through n=6; exact Hurwitz factor certificates pass.')
