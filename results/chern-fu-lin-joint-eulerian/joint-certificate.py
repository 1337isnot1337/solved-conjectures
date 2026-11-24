#!/usr/bin/env python3
"""Build exact bound-certified inputs and run the joint Eulerian certificate."""
import sympy as s
from tempfile import TemporaryDirectory
from pathlib import Path
import subprocess
x,u,v,t,z,a,b,P,S,Q=s.symbols('x u v t z a b P S Q')
# Here x=A, t=B, z=E, and rescale the series P=A*p.
V=1/(1-t);W=1+z/(1-t)
coeff=[-z*(1-t),z*(1-t)*(1-x-t),
 z*z*t-t*t*(z*z-z*x+x*x),
 -z*t*(z+2*x)+2*z*t*(t*(z+x)+x*x)-t*t*(z*z+x*x)*(t+x)]
coeff.extend([x*t*coeff[2],(x*t)**2*coeff[1],(x*t)**3*coeff[0]])
tmpdir = TemporaryDirectory()
work = Path(tmpdir.name)
source = Path(__file__).resolve().with_name("joint-certificate.cpp")
solver = work / "joint-certificate"
subprocess.run(["g++", "-O3", str(source), "-lgmpxx", "-lgmp", "-o", str(solver)], check=True)
for y in (False,True):
 print('Y' if y else 'X', flush=True)
 if y: down,up,C,D,F=x,t,V,W,1; pp=P*t; bdown,bup=x,x*t/z
 else: down,up,C,D,F=t,x,W,V,x/z; pp=P*x; bdown,bup=x*t/z,x
 T_a=up*(1-u)+down*u;T_b=bup*(1-u)+bdown*u
 S_a=up*(1-D*u)+down*C*u;S_b=bup*(1-D*u)+bdown*C*u
 M0=u*(1-u)-(T_a-T_b);N0=u*(1-D*u)-(S_a+S_b)
 K=s.Poly(M0*N0+S_b*T_b,u).monic()
 kr = K.as_expr().subs({x:s.Rational(1,10),t:s.Rational(3,5),z:s.Rational(1,5)})
 assert s.degree(kr,u) == 4 and s.degree(s.gcd(kr,s.diff(kr,u)),u) == 0
 k3,k2,k1,k0=K.all_coeffs()[1:]
 R=(F-(1-u)*a)*(u*(1-u)-T_a)+(u-(1-u)*pp)*T_b
 Ru=s.factor(s.diff(R,a)); R0=s.factor(R.subs(a,0))
 edge=s.cancel((Ru*R0.subs(u,v)-R0*Ru.subs(u,v))/(u-v))
 rep,rem,sy=s.symmetrize(edge,[u,v],formal=True)
 assert rem==0
 sym=s.expand(rep.subs({sy[0][0]:S,sy[1][0]:Q}))
 Qv=(k1+S*(k2+S*(S+k3)))/(2*S+k3)
 Rv=k2-Qv+S*(S+k3)
 Fpair=s.factor(Qv*Rv-k0)
 ec=s.factor(sym.subs(Q,Qv))
 den=s.denom(ec); num=s.numer(ec); assert not den.has(P)
 d=s.factor(num.diff(P)); n=s.factor(-num.subs(P,0))
 g=s.gcd(d,n); d=s.cancel(d/g); n=s.cancel(n/g)

 # Polynomials written as lists of quadruple exponent and integer coefficient.
 inputs = [s.numer(Fpair), n, d, *coeff]
 pp = [s.Poly(e, S,x,t,z) for e in inputs]
 assert all(p.domain == s.ZZ for p in pp)
 assert pp[0].degree(S)==6 and pp[1].degree(S)==pp[2].degree(S)==3
 def profile(p,j):
  out=[-10**9]*(p.degree(S)+1)
  for m,_ in p.terms():out[m[0]]=max(out[m[0]],m[j])
  return out
 def conv(a,b):
  out=[-10**9]*(len(a)+len(b)-1)
  for i,v in enumerate(a):
   for j,w in enumerate(b):
    if min(v,w)>=0:out[i+j]=max(out[i+j],v+w)
  return out
 def powprof(a,k):
  out=[0]
  for _ in range(k):out=conv(out,a)
  return out
 degrees=[]
 for j in range(1,4):
  l,n0,d0,*cs=[profile(p,j) for p in pp]
  row=[-10**9]*19
  for i,c0 in enumerate(cs):
   row=list(map(max,zip(row,conv(c0,conv(powprof(n0,i),powprof(d0,6-i))))))
  for o in range(18,5,-1):
   lead0=row[o]
   for k in range(o):
    row[k]=max(row[k]+l[6],lead0+l[k-o+6] if o-6<=k else -10**9)
  degrees.append(max(row[:6]))
 norms=[sum(abs(c) for _,c in p.terms()) for p in pp]
 height=int(sum(norms[3:])*max(norms[1:3])**6*(2*norms[0])**13)
 bits=(2*height).bit_length()+1
 print('bound', degrees,bits, 'max encoded bits',bits*(degrees[0]+1)*(degrees[1]+1)*(degrees[2]+1),flush=True)
 fn = work / ('coeff-%d.txt' % y)
 with fn.open('w') as out:
  print(*degrees,bits,file=out)
  for p0 in pp:
   print(len(p0.terms()),file=out)
   for m,coef in p0.terms():print(*m,coef,file=out)
 subprocess.run([str(solver), str(fn)], check=True)
