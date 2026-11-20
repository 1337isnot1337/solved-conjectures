"""Exploratory search only. A floating result is not a proof or counterexample."""
import ctypes, pathlib, numpy as np, json, argparse
from scipy.optimize import minimize, check_grad
HERE=pathlib.Path(__file__).resolve().parent
lib=ctypes.CDLL(str(HERE/'permanent_grad.so'))
dptr=np.ctypeslib.ndpointer(dtype=np.float64,flags='C_CONTIGUOUS')
lib.permanent_grad.argtypes=[ctypes.c_int,dptr,dptr,dptr,dptr,dptr]
def pg(A):
 n=A.shape[0];A=np.asarray(A,dtype=np.complex128);v=np.zeros(2);gr=np.zeros((n,n));gi=np.zeros((n,n))
 lib.permanent_grad(n,np.ascontiguousarray(A.real),np.ascontiguousarray(A.imag),v,gr,gi)
 return v[0],gr+1j*gi

def fun(x,d,m,raw=False):
 n=2*m;N=n*d;B=x[:N].reshape(d,n)+1j*x[N:].reshape(d,n);A=B.conj().T@B
 p,cp=pg(A); G=np.empty((m,m),complex); cg=np.empty((n,n),complex)
 for i in range(m):
  for j in range(m):
   T=A[2*i:2*i+2,2*j:2*j+2];G[i,j]=T[0,0]*T[1,1]+T[0,1]*T[1,0]
 q,cq=pg(G)
 if p<=0 or q<=0:return (1e10,np.zeros_like(x))
 for i in range(m):
  for j in range(m):
   T=A[2*i:2*i+2,2*j:2*j+2]
   cg[2*i:2*i+2,2*j:2*j+2]=cq[i,j]*np.array([[T[1,1],T[1,0]],[T[0,1],T[0,0]]])
 grad=2*B@(cp/p-cg/q).T
 val=np.log(p/q)
 if raw:return p,q,B
 return val,np.r_[grad.real.ravel(),grad.imag.ravel()]

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--m',type=int,default=5);ap.add_argument('--restarts',type=int,default=25);ap.add_argument('--seed',type=int,default=43474);args=ap.parse_args();rng=np.random.default_rng(args.seed);m=args.m;n=2*m
 best=100.;records=[]
 for k in range(args.restarts):
  d=[m-1,m,m+1,n][k%4];B=rng.normal(size=(d,n))+1j*rng.normal(size=(d,n));B/=np.linalg.norm(B,axis=0)
  if k%3==0:
   B=np.zeros((d,n),complex)
   for j in range(n):B[(j//2)%d,j]=1
   B+=.3*(rng.normal(size=(d,n))+1j*rng.normal(size=(d,n)))
  x=np.r_[B.real.ravel(),B.imag.ravel()]
  if k==0:
   err=check_grad(lambda z:fun(z,d,m)[0],lambda z:fun(z,d,m)[1],x,direction='random',seed=1)
   print('gradient absolute error',err,flush=True)
  res=minimize(lambda z:fun(z,d,m),x,method='L-BFGS-B',jac=True,options={'maxiter':350,'ftol':1e-14,'gtol':1e-9,'maxls':30})
  value=float(res.fun);records.append({'restart':k,'rank':d,'log_ratio':value,'iterations':int(res.nit),'success':bool(res.success)})
  if value<best:
   best=value;np.savez(HERE/f'marcus_best_m{m}.npz',x=res.x,d=d,m=m)
  print(json.dumps(records[-1]),flush=True)
  if value < -1e-7:break
 (HERE/f'marcus_search_m{m}.json').write_text(json.dumps({'seed':args.seed,'records':records,'min_log_ratio':best},indent=2))
if __name__=='__main__':main()
