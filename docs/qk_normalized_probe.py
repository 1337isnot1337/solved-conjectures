from functools import lru_cache
from fractions import Fraction
import random
random.seed(993)
def distribution(o,w,mask):
 @lru_cache(None)
 def rec(m):
  if not m:return {0:Fraction(1)}
  vs=[i for i in range(len(o)) if m>>i&1]
  ps={i:sum(Fraction(w[j],1+(o[j]&m).bit_count()) for j in vs if j==i or o[j]>>i&1) for i in vs}
  total=sum(ps.values())
  if total==0:ps={i:1 for i in vs};total=len(vs)
  ans={}
  for v in vs:
   if not ps[v]:continue
   for q,p in rec(m&~(o[v]|1<<v)).items():
    qq=q if any(o[i]>>v&1 for i in vs if q>>i&1) else q|1<<v
    ans[qq]=ans.get(qq,0)+p*Fraction(ps[v],total)
  return ans
 return rec(mask)
for n in range(4,12):
 for z in range(10000):
  o=[0]*n
  for i in range(n):
   for j in range(i):
    k=random.randrange(4)
    if k==0:o[i]|=1<<j
    elif k==1:o[j]|=1<<i
  w=[random.randrange(3) for i in range(n)]
  if not sum(w):continue
  dd=distribution(o,w,(1<<n)-1)
  e=0
  for q,p in dd.items():
   c=q
   for i in range(n):
    if q>>i&1:c|=o[i]
   e+=p*sum(w[i] for i in range(n) if c>>i&1)
  if 2*e<sum(w):
   print('FAIL',n,o,w,e,sum(w),dd);raise SystemExit
 print('pass',n,flush=True)
