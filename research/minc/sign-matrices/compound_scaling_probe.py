from itertools import combinations,permutations
from math import log
import numpy as np
from scipy.optimize import minimize
from scipy.special import logsumexp


def per(a):
 return sum(np.prod(a[np.arange(len(a)),p]) for p in permutations(range(len(a))))

def comp(a,k):
 n=len(a); ss=list(combinations(range(n),k)); b=np.array([[per(a[np.ix_(I,J)]) for J in ss] for I in ss])
 vec=np.array([[int(i in I) for i in range(n)] for I in ss],float)
 return b,vec

def scale_logsum(bt,vec):
 ii,jj=np.nonzero(bt>0); logs=np.log(bt[ii,jj]); dif=vec[jj]-vec[ii]
 def objective(x):
  z=logs+dif@x; f=logsumexp(z); grad=np.exp(z-f)@dif
  return f,grad
 fit=minimize(objective,np.zeros(vec.shape[1]),jac=True,method='L-BFGS-B',options={'maxiter':2000,'gtol':1e-10,'ftol':1e-12})
 return fit.fun,fit.x,fit.success

rng=np.random.default_rng(87)
for trial in range(50):
 n=6;k=3;a=np.exp(rng.uniform(-4,4,(n,n)))*(rng.random((n,n))<.35)
 b,vec=comp(a,k);rho=max(abs(np.linalg.eigvals(b)))
 if rho<1e-12:continue
 b=b/rho;bt=np.eye(len(b));lnorm=0
 worst=0; rs=[]
 for t in range(1,65):
  bt=bt@b;c=bt.max();bt/=c;lnorm+=log(c)
  if t in [1,2,4,8,16,32,64]:
   f,x,s=scale_logsum(bt,vec);r=f+lnorm;rs.append((t,float(r)));worst=max(worst,r)
 if trial<10 or worst>log(len(b))+1e-4:print(trial,'logN',log(len(b)),'ratios',rs,'A',a.tolist() if worst>log(len(b))+1e-4 else '',flush=True)
