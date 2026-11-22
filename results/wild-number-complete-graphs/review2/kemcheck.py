from fac import near, partner
from collections import Counter
import sys
import sys
for n in [int(a) for a in sys.argv[1:]]:
    for kind,seed in [('cyc',1),('kem',2),('dbl',2),('dbl',3)]:
        col=near(n,kind,seed); P=partner(col,n)
        cyc=Counter()
        for u in range(n):
            for v in range(u+1,n):
                seen=set(); L=[]
                for x in range(n):
                    if x in seen: continue
                    # path/cycle in M_u ∪ M_v
                    comp=[x]; seen.add(x); st=[x]
                    while st:
                        y=st.pop()
                        for w in (P[u][y],P[v][y]):
                            if w is not None and w not in seen: seen.add(w); comp.append(w); st.append(w)
                    L.append(len(comp))
                cyc[tuple(sorted(L))]+=1
        print(n,kind,seed,len(cyc),sorted(cyc.items())[:3])
