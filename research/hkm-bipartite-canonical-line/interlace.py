#!/usr/bin/env python3
"""Exact symbolic certificate for strict bipartite deletion interlacing."""
from symbolic_tail import R, z, add, scale, times_x, universal_tail, positive_on_ray, certify
from sys import argv
from math import gcd, lcm
guards=set()
def mul(p,q):
 out=[R.zero]*(len(p)+len(q)-1)
 for i,u in enumerate(p):
  for j,v in enumerate(q):out[i+j]+=u*v
 while out and not out[-1]:out.pop()
 return out

def primitive_guard(p):
 if not p:return p
 g=R.zero
 for x in p:
  g=g.gcd(x)
  if g==R.one:break
 if g!=R.one:
  assert g.LC > 0
  guards.add(g)
  p=[x.exquo(g) for x in p]
 return p

def negative_remainder_guard(p,q):
 ss=sgn(q[-1])
 while p and len(p)>=len(q):
  i=len(p)-len(q)
  p=primitive_guard(add(scale(p, ss*q[-1]), [R.zero] * i + scale(q, -ss*p[-1])))
 return scale(p, -1)

def first_sign(p):
 for r in p:
  if r:return sgn(r)
 return 0

def sgn(r):
 s=1 if r.LC>0 else -1
 if r.degree()>0:guards.add(r*s)
 return s

def shift(p):
 return [r.compose(z,z+1) for r in p]

def substitute(p,c):
 return [R(r(c)) for r in p]

def poly(a,diag=False):
 A,B=universal_tail(a)
 if diag:
  A,B=map(lambda p:substitute(p,0),(A,B))
  if a==1: U,V=([R.one],[])
  else: U,V=universal_tail(a-1)
  U,V=map(lambda p:substitute(p,1),(U,V))
  out=add(mul(B,U),scale(mul(A,V),-1))
 else:
  U,V=A,B
  A,B=shift(A),shift(B)
  b=z+a+1
  out=add(scale(mul(A,U),b),mul(V,add(scale(B,b+1),scale(times_x(A),-1))))
 assert not any(out[1::2])
 return out[::2]

def check_ray(p):
 p=primitive_guard(p)
 assert sgn(p[0])>0
 q=primitive_guard([i*v for i,v in enumerate(p) if i])
 l,r=0,0
 while q:
  l+=sgn(p[-1])!=sgn(q[-1]);r+=first_sign(p)!=first_sign(q)
  p,q=q,negative_remainder_guard(p,q)
 assert l==r,(l,r)

def integer_primitive(p):
    while p and not p[-1]:
        p.pop()
    d = gcd(*p)
    return [v // d for v in p] if d > 1 else p


def integer_negative_remainder(p, q):
    sign = 1 if q[-1] > 0 else -1
    while p and len(p) >= len(q):
        i = len(p) - len(q)
        c = sign * p[-1]
        p = [v * abs(q[-1]) for v in p]
        for j, v in enumerate(q):
            p[i + j] -= c * v
        p = integer_primitive(p)
    return [-v for v in p]


def check_special(p, c):
    values = [v(c) for v in p]
    denominator = lcm(*(int(v.denominator) for v in values))
    p = integer_primitive([int(v * denominator) for v in values])
    assert p[0] > 0
    q = integer_primitive([i * v for i, v in enumerate(p) if i])
    left = right = 0
    while q:
        left += (p[-1] > 0) != (q[-1] > 0)
        right += next(v > 0 for v in p if v) != next(v > 0 for v in q if v)
        p, q = q, integer_negative_remainder(p, q)
    assert left == right, (left, right)


def check(a):
 guards.clear()
 p=poly(a)
 check_ray(p)
 shift0=0
 for g in sorted(guards,key=lambda v:(v.degree(),str(v))):
  if positive_on_ray(g.compose(z,z+shift0)):
   continue
  lo,hi=shift0,max(1,2*shift0)
  while not positive_on_ray(g.compose(z,z+hi)):
   hi*=2
  while hi-lo>1:
   mid=(lo+hi)//2
   if positive_on_ray(g.compose(z,z+mid)):
    hi=mid
   else:
    lo=mid
  shift0=hi
 for t in range(shift0):check_special(p,t)
 check_special(poly(a,True),0)
 return shift0,len(guards)

if __name__=="__main__":
 max_a=int(argv[1]) if len(argv)>1 else 8
 for a in range(1,max_a+1):
  certify(a)
  print(a,check(a),flush=True)
