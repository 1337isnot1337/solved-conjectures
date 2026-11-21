"""Exploratory test of a stronger C34 proof lemma, not a verification."""
import math,sys,json
import numpy as np
from scipy.optimize import minimize
from search_inequalities import pergrad

n=int(sys.argv[1]); trials=int(sys.argv[2]) if len(sys.argv)>2 else 24
rng=np.random.default_rng(20261121+n); c=math.factorial(n)/n**n;J=np.full((n,n),1/n)
eq=np.zeros((2*n-1,n*n))
for i in range(n):eq[i,i*n:(i+1)*n]=1
for j in range(n-1):eq[n+j,j::n]=1
cons={'type':'eq','fun':lambda z:eq@z-1,'jac':lambda z:eq}
t=.5; h=.002
for trial in range(trials):
 d=2+trial%6;A=sum(np.eye(n)[rng.permutation(n)] for _ in range(d))/d
 def obj(z):
  M=z.reshape(n,n);B=M-J;r2=np.sum(B*B)
  if r2<1e-10:return n/(n-1),np.zeros(n*n)
  p,g=pergrad(J+t*B);q,gh=pergrad(J+(t+h)*B);s,gl=pergrad(J+(t-h)*B)
  v=(q+s-2*p)/h**2/c
  grad=((t+h)*gh+(t-h)*gl-2*t*g)/h**2/c
  return v/r2,((grad*r2-v*2*B)/r2**2).ravel()
 res=minimize(obj,A.ravel(),jac=True,method='SLSQP',bounds=[(0,1)]*(n*n),constraints=cons,
              options={'maxiter':250,'ftol':1e-8})
 print(json.dumps({'n':n,'trial':trial,'curvature_normalized':float(res.fun),'ok':bool(res.success)}),flush=True)
 if res.fun < -1e-5:
  np.save(f'curvature_negative_{n}.npy',res.x.reshape(n,n));break
