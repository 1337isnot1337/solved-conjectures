from itertools import combinations,permutations
import numpy as np
from scipy.sparse.csgraph import connected_components
from scipy.sparse import csr_matrix

def has_matching(a,I,J):
 return any(all(a[i,j] for i,j in zip(I,p)) for p in permutations(J))

def compound_support(a,k):
 ss=list(combinations(range(len(a)),k))
 b=np.array([[has_matching(a,I,J) for J in ss] for I in ss],dtype=np.int8)
 return ss,b

rng=np.random.default_rng(571)
for n in range(3,8):
 found=False
 for trial in range(5000):
  a=(rng.random((n,n))<.24).astype(np.int8)
  if connected_components(csr_matrix(a),directed=True,connection='strong')[0]!=1:continue
  for k in range(2,n):
   ss,b=compound_support(a,k)
   nc,lab=connected_components(csr_matrix(b),directed=True,connection='strong')
   es=[(i,j) for i,j in zip(*np.nonzero(b)) if lab[i]!=lab[j]]
   if es:
    print('FOUND',n,k,'trial',trial,'A=',a.tolist(),'S=',ss,'edges=',es,'labels=',lab.tolist(),flush=True)
    found=True;break
  if found:break
 print('done',n,'found',found,flush=True)
