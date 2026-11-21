"""Exploratory counterexample search; floating point outputs are not proofs."""
import ctypes, json, math, os, sys, time
from pathlib import Path
import numpy as np
from scipy.optimize import minimize

HERE=Path(__file__).resolve().parent
lib=ctypes.CDLL(str(HERE/'permanent.so'))
ptr=np.ctypeslib.ndpointer(dtype=np.float64,ndim=1,flags='C_CONTIGUOUS')
lib.permanent_real.argtypes=[ptr,ctypes.c_int,ptr]
lib.permanent_real.restype=ctypes.c_double
cptr=np.ctypeslib.ndpointer(dtype=np.complex128,ndim=1,flags='C_CONTIGUOUS')
lib.permanent_complex.argtypes=[cptr,ctypes.c_int,cptr,cptr]

def pergrad(A):
 A=np.ascontiguousarray(A)
 if np.iscomplexobj(A):
  A=A.astype(np.complex128); g=np.empty(A.size,complex);out=np.empty(1,complex)
  lib.permanent_complex(A.ravel(),len(A),out,g)
  return out[0],g.reshape(A.shape)
 A=A.astype(float);g=np.empty(A.size)
 p=lib.permanent_real(A.ravel(),len(A),g)
 return p,g.reshape(A.shape)

def lihw(n,seed=0,restarts=12):
 rng=np.random.default_rng(seed);c=math.factorial(n)/n**n;J=np.full((n,n),1/n)
 constraints=[]
 eq=np.zeros((2*n-1,n*n))
 for i in range(n):eq[i,i*n:(i+1)*n]=1
 for j in range(n-1):eq[n+j,j::n]=1
 cons={'type':'eq','fun':lambda z:eq@z-1,'jac':lambda z:eq}
 best=(0,None)
 for trial in range(restarts):
  d=2+trial%6;A=sum(np.eye(n)[rng.permutation(n)] for _ in range(d))/d
  t=.5 if trial%3 else rng.uniform(.15,.5)
  def fun(z):
   M=z.reshape(n,n);p,g=pergrad(M);q,h=pergrad(t*M+(1-t)*J)
   den=p-c
   if den<1e-12*c:return -t*t,np.zeros(n*n)
   R=(q-c)/den
   return -R,(-(t*h*den-(q-c)*g)/den**2).ravel()
  res=minimize(fun,A.ravel(),method='SLSQP',jac=True,bounds=[(0,1)]*(n*n),constraints=cons,
               options={'maxiter':250,'ftol':2e-11})
  R=-res.fun
  if R>best[0]:best=(R,res.x.reshape(n,n))
  print(json.dumps({'mode':'C34','n':n,'trial':trial,'t':t,'ratio':R,'violation':R-t,'ok':bool(res.success)}),flush=True)
  if R>t+1e-7:
   np.savez(HERE/f'candidate_C34_n{n}.npz',A=res.x.reshape(n,n),t=t)
   return

def marcus(m,k,r,seed=0,restarts=10):
 rng=np.random.default_rng(seed);n=m*k;best=1000.
 def fun(z):
  X=z[:n*r].reshape(n,r)+1j*z[n*r:].reshape(n,r)
  A=X@X.conj().T;p,D=pergrad(A);p=p.real
  G=np.empty((m,m),complex);bd=np.empty((m,m,k,k),complex)
  for i in range(m):
   for j in range(m):G[i,j],bd[i,j]=pergrad(A[i*k:(i+1)*k,j*k:(j+1)*k])
  q,E=pergrad(G);q=q.real
  if p<=0 or q<=0:return 1e8,np.zeros_like(z)
  H=D/p
  for i in range(m):
   for j in range(m):H[i*k:(i+1)*k,j*k:(j+1)*k]-=E[i,j]*bd[i,j]/q
  Z=2*H.T@X
  return math.log(p/q),np.concatenate([Z.real.ravel(),Z.imag.ravel()])
 for trial in range(restarts):
  X=rng.normal(size=(n,r))+1j*rng.normal(size=(n,r))
  if trial%3==1 and r>=n:X=np.eye(n,r)+X*.15
  X/=np.linalg.norm(X,axis=1)[:,None]
  z=np.concatenate([X.real.ravel(),X.imag.ravel()])
  if trial==0:
   f,g=fun(z);h=1e-6;v=rng.normal(size=len(z));v/=np.linalg.norm(v)
   fd=(fun(z+h*v)[0]-fun(z-h*v)[0])/(2*h)
   assert abs(fd-g@v)<1e-5,(fd,g@v)
  res=minimize(fun,z,jac=True,method='L-BFGS-B',options={'maxiter':350,'ftol':1e-12,'gtol':1e-8})
  ratio=math.exp(res.fun);best=min(best,ratio)
  print(json.dumps({'mode':'C9','m':m,'k':k,'rank':r,'trial':trial,'ratio':ratio,'ok':bool(res.success)}),flush=True)
  if ratio<1-1e-7:
   z=res.x;X=z[:n*r].reshape(n,r)+1j*z[n*r:].reshape(n,r)
   np.savez(HERE/f'candidate_C9_m{m}_k{k}_r{r}.npz',X=X)
   return

if __name__=='__main__':
 mode=sys.argv[1]
 if mode=='lihw':lihw(int(sys.argv[2]),restarts=int(sys.argv[3]) if len(sys.argv)>3 else 12)
 elif mode=='marcus':marcus(*map(int,sys.argv[2:5]),restarts=int(sys.argv[5]) if len(sys.argv)>5 else 10)
