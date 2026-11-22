import sys, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[2] / 'theorem-a'))
import n1f, fac
from lib13 import bad_family
from lib13 import rainbow
n=13; res={}
for s in range(int(sys.argv[1])):
    L = fac.near(n,'dbl',s) if s>0 else n1f.cyclic(n)
    for D in itertools.combinations(range(n),4):
        if not rainbow(L,D): continue
        kk=sum(1 for a,b in itertools.combinations(D,2) if L[a][b] in D)
        if kk>1: continue
        W=[x for x in range(n) if x not in D]
        Bad,k=bad_family(L,D,W); Bl=list(Bad)
        P2=sum(1 for i in range(len(Bl)) for j in range(i+1,len(Bl)) if not (Bl[i]&Bl[j]))
        key=k; r=res.setdefault(key,[999,0,999,0])
        r[0]=min(r[0],P2); r[1]=max(r[1],len(Bad)); r[2]=min(r[2],len(Bad))
        r[3]+=1
    print(s, res, flush=True)
