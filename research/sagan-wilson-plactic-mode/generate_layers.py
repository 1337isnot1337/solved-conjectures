from pathlib import Path
from functools import lru_cache
import sys
m=int(sys.argv[1]); N=10
root=Path("Conjectures")
@lru_cache(None)
def go(n,r):
    if len(r)>n: return 0
    if n==0: return int(not r)
    s=go(n-1,r[1:])
    for x in range(2,m+1):
        k=next((i for i,y in enumerate(r) if y>x),len(r))
        rr=r[:k]+(x,)+r[k+1:] if k<len(r) else r+(x,)
        s+=go(n-1,rr)
    return s
def tree(n,r,lo,d):
    ch=[] if d==0 else [tree(n,r+(x,),x,d-1) for x in range(lo,m+1)]
    return "T "+str(go(n,r))+" ["+",".join(ch)+"]"
for n in range(N+1):
    mod=f"SwM{m}Layer{n}"
    prev=f"Conjectures.SwM{m}Layer{n-1}" if n else "Conjectures.SaganWilsonPlacticModeDP"
    lines=[f"import {prev}",f"namespace SaganWilsonPlacticMode.CertM{m}",
           "private abbrev T := RowTrie.node","set_option maxRecDepth 100000","set_option maxHeartbeats 0"]
    lines.append(f"def table{n} : RowTrie := "+tree(n,(),2,min(n,N-n)))
    lines.append(f"theorem cert{n} : countTrie {m} {N} {n} = table{n} := by")
    if n==0: lines.append("  rfl")
    else: lines.extend([f"  rw [countTrie, cert{n-1}]","  all_goals rfl"])
    if n==N:
        lines.extend([f"theorem value : countFast {m} {N} = {go(N,())} := by","  unfold countFast",f"  rw [cert{N}]","  all_goals rfl","#print axioms value"])
    lines.append(f"end SaganWilsonPlacticMode.CertM{m}")
    path=root/(mod+".lean");path.write_text("\n".join(lines)+"\n")
    print(path,path.stat().st_size)
