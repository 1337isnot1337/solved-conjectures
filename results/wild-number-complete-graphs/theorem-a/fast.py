import numpy as np, random
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components
class Inst:
    def __init__(s,L):
        L=np.array(L); n=len(L); s.n=n; s.L=L
        a,b=np.triu_indices(n,1); c=L[a,b]
        order=np.argsort(c,kind='stable')
        s.ea=a[order].reshape(n,(n-1)//2); s.eb=b[order].reshape(n,(n-1)//2)
        assert (c[order].reshape(n,(n-1)//2)==np.arange(n)[:,None]).all()
    def bad(s,lab,t):
        n=s.n; off=(np.arange(n)*t)[:,None]
        r=(lab[s.ea]+off).ravel(); c=(lab[s.eb]+off).ravel()
        g=coo_matrix((np.ones(len(r)),(r,c)),shape=(n*t,n*t))
        k,cl=connected_components(g,directed=False)
        if k==n: return []
        cl=cl.reshape(n,t)
        return [u for u in range(n) if (cl[u]!=cl[u,0]).any()]
def sizes(n):
    t=n//3; s=[3]*t
    for i in range(n-3*t): s[i]+=1
    return s
def lab_of(perm,sz):
    lab=np.empty(len(perm),dtype=np.int64); i=0
    for j,s in enumerate(sz): lab[perm[i:i+s]]=j; i+=s
    return lab
def find(inst,rng,tries=100000):
    n=inst.n; sz=sizes(n)
    for k in range(1,tries+1):
        perm=rng.permutation(n); lab=lab_of(perm,sz)
        if not inst.bad(lab,len(sz)): return k,lab
    return None,None
