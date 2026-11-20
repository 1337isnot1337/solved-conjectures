from sympy.polys.rings import ring
from sympy.polys.domains import ZZ
from itertools import combinations
R,x=ring('x',ZZ)

def rows(N,r,s,mu):
 q=r*s*mu
 qnums=[0]+[sum(r**j*s**(k-1-j) for j in range(k)) for k in range(1,N+1)]
 a=[[1]]
 p=[R.one]
 for n in range(1,N+1):
  b=[0]*(n+2)
  for k in range(n,0,-1): b[k]=qnums[k]*b[k+1]+mu**(n-k)*a[-1][k-1]
  a.append(b[:-1])
  p.append(sum((a[n][k]*q**(k*(k-1)//2)*x**k for k in range(n+1)),R.zero))
 return p

def det(a):
 a=[row[:] for row in a];prev=R.one
 for k in range(len(a)-1):
  if not a[k][k]:
   for i in range(k+1,len(a)):
    if a[i][k]:a[k],a[i]=a[i],a[k];a[k]=[-v for v in a[k]];break
   else:return R.zero
  for i in range(k+1,len(a)):
   for j in range(k+1,len(a)):a[i][j]=(a[i][j]*a[k][k]-a[i][k]*a[k][j]).exquo(prev)
  prev=a[k][k]
 return a[-1][-1]

if __name__=='__main__':
 import random,time
 start=time.time();rng=random.Random(463)
 for r,s,mu in [(1,1,1),(1,2,1),(1,1,2),(2,2,1),(2,1,2),(1,3,2),(4,2,3)]:
  p=rows(30,r,s,mu)
  for z in range(180):
   m=rng.choice([2,3,4]);aa=sorted(rng.sample(range(11),m));bb=sorted(rng.sample(range(11),m))
   d=det([[p[i+j] for j in bb]for i in aa])
   bad=[(mon,c) for mon,c in d.items() if c<0]
   if bad:print('FAIL',r,s,mu,aa,bb,bad[:5],flush=True);raise SystemExit
  print('passed',r,s,mu,'seconds',round(time.time()-start,1),flush=True)
