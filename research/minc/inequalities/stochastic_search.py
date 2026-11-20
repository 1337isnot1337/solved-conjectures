"""Exploratory floating searches; numerical minima do not certify a conjecture."""
import sys,pathlib,json,argparse,math,numpy as np
from scipy.optimize import minimize, LinearConstraint
sys.path.insert(0,str(pathlib.Path(__file__).resolve().parent))
from marcus_search import pg
HERE=pathlib.Path(__file__).resolve().parent

def objective(x,n,kind,t=.5):
 A=x.reshape(n,n); p,cp=pg(A);cp=cp.real;p0=math.factorial(n)/n**n
 if kind=='gyires':
  g,cg=pg(A@A.T);h,ch=pg(A.T@A);z,cz=pg(A@A)
  den=g+h+2*z;grad=2*cp/max(p,1e-300)-(2*cg.real@A+2*A@ch.real+2*(cz.real@A.T+A.T@cz.real))/max(den,1e-300)
  val=4*p*p/(p0*den)
 elif kind=='stronggyires':
  g,cg=pg(A@A.T);grad=2*cp/max(p,1e-300)-2*cg.real@A/max(g,1e-300);val=p*p/(p0*g)
 elif kind=='lihw':
  M=(1-t)*np.ones((n,n))/n+t*A;z,cz=pg(M);q=(1-t)*p0+t*p;grad=t*cp/max(q,1e-300)-t*cz.real/max(z,1e-300);val=q/z
 elif kind=='zerodiag':
  D=round(math.factorial(n)*sum((-1)**k/math.factorial(k) for k in range(n+1)));pu=D/(n-1)**n;grad=cp/max(p,1e-300);val=p/pu
 return np.log(max(val,1e-300)),grad.ravel()

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--n',type=int,default=5);ap.add_argument('--kind',default='gyires');ap.add_argument('--restarts',type=int,default=20);ap.add_argument('--seed',type=int,default=52719);args=ap.parse_args();n=args.n;kind=args.kind;rng=np.random.default_rng(args.seed)
 eq=np.zeros((2*n-1,n*n));
 for i in range(n):eq[i,i*n:(i+1)*n]=1
 for j in range(n-1):eq[n+j,j::n]=1
 cons=LinearConstraint(eq,np.ones(2*n-1),np.ones(2*n-1));bounds=[(0,0) if kind=='zerodiag' and i==j else (0,1) for i in range(n) for j in range(n)]
 records=[];best=1e100
 for k in range(args.restarts):
  A=np.exp(rng.normal(size=(n,n))*(.25+k%4))
  if kind=='zerodiag':np.fill_diagonal(A,0)
  for _ in range(150):A/=A.sum(axis=0)[None,:];A/=A.sum(axis=1)[:,None]
  res=minimize(lambda x:objective(x,n,kind),A.ravel(),jac=True,method='SLSQP',constraints=[cons],bounds=bounds,options={'maxiter':400,'ftol':1e-12})
  v=float(res.fun);records.append({'restart':k,'log_ratio':v,'iterations':int(res.nit),'success':bool(res.success),'eq_error':float(np.max(np.abs(eq@res.x-1)))})
  print(json.dumps(records[-1]),flush=True)
  if v<best:best=v;np.save(HERE/f'{kind}_best_n{n}.npy',res.x.reshape(n,n))
  if v< -1e-7:break
 (HERE/f'{kind}_search_n{n}.json').write_text(json.dumps({'seed':args.seed,'records':records,'min_log_ratio':best},indent=2))
if __name__=='__main__':main()
