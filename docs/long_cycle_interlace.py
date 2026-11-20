from long_cycle_probe import *
import numpy as np
for k in range(3,36):
 rr=rows(k,3*k+5)
 for n in range(k,3*k+5):
  a=gamma(rr[n],n)[1:];b=gamma(rr[n+1],n+1)[1:]
  while a and a[-1]==0:a.pop()
  while b and b[-1]==0:b.pop()
  if len(a)<2:continue
  ra=np.roots([float(v/max(a)) for v in a[::-1]])
  rb=np.roots([float(v/max(b)) for v in b[::-1]])
  if max(abs(z.imag) for z in list(ra)+list(rb))>1e-6:continue
  labs=[j for _,j in sorted([(z.real,0) for z in ra]+[(z.real,1) for z in rb])]
  if any(u==v for u,v in zip(labs,labs[1:])):
   for c in [-10,-1,1,10]:
    p=sp.Poly.from_list(add(b,[c*v for v in a])[::-1],x)
    sq=p.sqf_part()
    count=sq.count_roots(-sp.oo,sp.oo)
    if count!=sq.degree():
     print('FAIL interlace',k,n,c,count,p.degree(),p.as_expr(),flush=True);raise SystemExit
 print('screened',k,flush=True)
