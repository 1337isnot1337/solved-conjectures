import sys, numpy as np, random, n1f, fast
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components
from collections import Counter
def modes(L, trials, rng):
    inst=fast.Inst(L); n=inst.n; sz=fast.sizes(n); t=len(sz)
    C=Counter(); nbad=Counter()
    for _ in range(trials):
        lab=fast.lab_of(rng.permutation(n),sz)
        bad=inst.bad(lab,t); nbad[len(bad)]+=1
        for u in bad:
            r=lab[inst.ea[u]]; c=lab[inst.eb[u]]
            g=coo_matrix((np.ones(len(r)),(r,c)),shape=(t,t))
            k,cl=connected_components(g,directed=False)
            comp_sizes=sorted(np.bincount(cl).tolist())
            # smallest component: (#blocks, #vertices, contains u?)
            ci=np.argmin(np.bincount(cl)); verts=sum(sz[b] for b in range(t) if cl[b]==ci)
            uin= cl[lab[u]]==ci
            C[(int(np.bincount(cl)[ci]),verts,bool(uin))]+=1
    return C,nbad
rng=np.random.default_rng(5)
for n in (21,45,99):
    L=n1f.near_from_1f(n1f.one_factorization(n+1,random.Random(n),switches=10*(n+1)**2))
    C,nb=modes(L,4000,rng)
    tot=sum(C.values())
    print(n,'P(#bad colours=k):',{k:round(v/4000,3) for k,v in sorted(nb.items())})
    print('   smallest-component types (blocks,vertices,contains u): ',[(k,round(v/4000,3)) for k,v in C.most_common(8)])
