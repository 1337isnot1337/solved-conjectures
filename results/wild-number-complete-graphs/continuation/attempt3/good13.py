import sys, itertools
from lib13 import bad_family, rainbow, splits9
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
import n1f, fac
n=13
for s in range(int(sys.argv[1])):
    L = fac.near(n,'dbl',s) if s>0 else n1f.cyclic(n)
    mn={0:999,1:999}
    for D in itertools.combinations(range(n),4):
        if not rainbow(L,D): continue
        kk=sum(1 for a,b in itertools.combinations(D,2) if L[a][b] in D)
        if kk>1: continue
        W=[x for x in range(n) if x not in D]
        Bad,k=bad_family(L,D,W)
        g=sum(1 for A,B,C in splits9(W) if not any(frozenset(X) in Bad for X in (A,B,C)))
        mn[k]=min(mn[k],g)
    print('seed',s,'min #good splits (k=0,k=1):',mn,flush=True)
