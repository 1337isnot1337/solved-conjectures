"""Exact rational-complex sanity check of the all-order phase identity.
Not a proof of MOC and not a fixed-order research target.
"""
import sympy as S
I=S.I
for n in (2,3,4,5):
 A=S.diag(*[j+1+I*(j*j+1) for j in range(n)])
 v=S.Matrix([1]*n);P=v*v.T/n;H=S.eye(n)-2*P
 B=H*S.diag(*[2*j-1+I*(j+2) for j in range(n)])*H
 # rational orthogonal rank-one projection avoids square-root expressions
 w=S.Matrix(list(range(1,n+1)));norm=(w.T*w)[0];W=w*w.T/norm
 C=A+B;D=C.inv();z=C.det()
 scalar=lambda M:S.cancel((w.T*M*w)[0]/norm)
 a=scalar(D*A);b=scalar(D);c=scalar(B*D*A);d=scalar(B*D)
 s=a+d;t=a*d-b*c
 for u in (I,-1,(3+4*I)/5):
  V=S.eye(n)+(u-1)*W
  actual=(A+V*B*V.conjugate().T).det()
  predicted=z*(t*u+(s-2*t)+(1-s+t)/u)
  assert S.simplify(S.expand_complex(actual-predicted))==0,(n,u,S.N(actual-predicted))
 print(n,'exact phase identity passed')
