from pathlib import Path
from functools import lru_cache
import sys
m=int(sys.argv[1]); N=10;n=int(sys.argv[2]);depth=int(sys.argv[3])
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
def lname(p):return "sub"+"_"+"_".join(map(str,p)) if p else "subroot"
def pre(p):return "["+",".join(map(str,p))+"]"
def term(p,d):
    return f"tabulate f {m} {d} {p[-1] if p else 2} {pre(p)}"
total=min(n,N-n)
ns=f"SaganWilsonPlacticMode.CertM{m}"
prev=f"Conjectures.SwM{m}Layer{n-1}"
prefixes=[]
def gen(p,d):
    if len(p)==depth or d==0: prefixes.append((p,d));return
    for x in range(p[-1] if p else 2,m+1):
        gen(p+(x,),d-1)
gen((),total)
imports=[]
def headers(imp):
    return ["import "+imp,"import Conjectures.SaganWilsonPlacticModeCertSupport",
            "namespace "+ns,"private abbrev T := RowTrie.node",
            f"private abbrev f := stepValue {m} {n-1} table{n-1}",
            "set_option maxRecDepth 100000","set_option maxHeartbeats 0"]
for p,d in prefixes:
    mod=f"SwM{m}Layer{n}P"+"_".join(map(str,p))
    nm=f"l{n}"+lname(p)
    lines=headers(prev)
    lines.append(f"def {nm} : RowTrie := "+tree(n,p,p[-1] if p else 2,d))
    lines.extend([f"theorem {nm}_cert : {term(p,d)} = {nm} := by rfl","end "+ns])
    (root/(mod+".lean")).write_text("\n".join(lines)+"\n")
    imports.append("Conjectures."+mod)
    print(mod)
lines=["import "+i for i in imports]+headers(prev)[1:]
def assemble(p,d):
    nm=f"l{n}"+lname(p)
    if (p,d) in prefixes:return nm
    children=[p+(x,) for x in range(p[-1] if p else 2,m+1)]
    childnames=[assemble(c,d-1) for c in children]
    lines.append(f"def {nm} : RowTrie := T {go(n,p)} ["+",".join(childnames)+"]")
    lines.append(f"theorem {nm}_cert : {term(p,d)} = {nm} := by")
    expr=f"RowTrie.node (f {pre(p)}) ["+", ".join(term(c,d-1) for c in children)+"]"
    lines.append(f"  change {expr} = {nm}")
    lines.append("  rw ["+", ".join(x+"_cert" for x in childnames)+"]")
    lines.append("  all_goals rfl")
    return nm
rn=assemble((),total)
lines.extend([f"def table{n} : RowTrie := {rn}",
              f"theorem cert{n} : countTrie {m} {N} {n} = table{n} := by",
              f"  rw [countTrie_succ_eq, cert{n-1}]",
              f"  exact {rn}_cert","end "+ns])
(root/f"SwM{m}Layer{n}.lean").write_text("\n".join(lines)+"\n")
