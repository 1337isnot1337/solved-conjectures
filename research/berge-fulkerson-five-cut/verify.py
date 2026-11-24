#!/usr/bin/env python3
"""Generate the finite model and replay its UNSAT certificate.
Requires Python >=3.10, a C++17 compiler, and Z3 shared library
(tested with libz3.so.4, Z3 4.13.3.0).
Run: python3 verify.py [output-directory]
"""
from itertools import combinations, combinations_with_replacement, permutations, product
from collections import Counter
from pathlib import Path
import ctypes as ct
import ctypes.util
import hashlib
import subprocess
import sys

B=[1<<i for i in range(5)]; FULL=31
T=[x for x in range(32) if x.bit_count()==3]
P=[tuple(sorted([FULL,*B]))]
for a,b in combinations_with_replacement(T,2):
    P.append(tuple(sorted([a,b,*[x for x in B for _ in range(2-int(bool(a&x))-int(bool(b&x)))]])))
I={p:i for i,p in enumerate(P)}
assert len(I)==56
caps=set()
for a,b in combinations(B,2):
    d=a|b
    caps.add(frozenset(i for i,p in enumerate(P) if all((m&d in (0,d)) and (m&(FULL^d)).bit_count()==1 for m in p)))
for c in B:
    R=[b for b in B if b!=c]
    for v in R[1:]:
        a=R[0]|v;b=FULL^c^a
        caps.add(frozenset(i for i,p in enumerate(P) if all((m.bit_count()==1 and m&(a|b)) or (m.bit_count()==3 and all((m&x).bit_count()==1 for x in (a,b,c))) for m in p)))
cycles=set()
for r in permutations(B[1:]):
    c=(B[0],)+r
    cycles.add(frozenset(c[i]|c[(i+1)%5] for i in range(5)))
for c in cycles:
    caps.add(frozenset(i for i,p in enumerate(P) if all(m.bit_count()!=3 or FULL^m in c for m in p)))
assert Counter(map(len,caps))=={6:10,10:15,16:12}

def hits(F):
    """Compute all inclusion-minimal transversals."""
    H={frozenset()}
    for f in F:
        H={h for h in H if h&f}|{h|{x} for h in H if not h&f for x in f}
        minimal=[]
        for h in sorted(H,key=lambda x:(len(x),tuple(sorted(x)))):
            if not any(g<=h for g in minimal):minimal.append(h)
        H=set(minimal)
    return H

clauses=set()
def add(c):
    c=frozenset(c)
    if any(-x in c for x in c):return
    clauses.add(c)
for i in range(56):add([-1-i,-57-i])
for off in (1,57):
    for c in caps:add([off+i for i in c])
    for i,p in enumerate(P):
        pairs=[(a,b) for a,b in combinations(range(6),2) if (p[a]^p[b]).bit_count()==4]
        fam=[(r,) for r in pairs]+[(r,s) for r,s in combinations(pairs,2) if len(set(r+s))==4]
        for ff in fam:
            opts=[]
            for a,b in ff:
                ds=[v for v in B if v&(p[a]^p[b])]
                opts.append([ds[0]|v for v in ds[1:]])
            Fs=set()
            for vv in product(*opts):
                V=set()
                for k in range(1,1<<len(vv)):
                    q=list(p)
                    for r,((a,b),m) in enumerate(zip(ff,vv)):
                        if k>>r&1:q[a]^=m;q[b]^=m
                    V.add(I[tuple(sorted(q))])
                Fs.add(frozenset(V-{i}))
            for h in hits(Fs):add([-off-i,*[off+j for j in h]])
parts=set()
for c in cycles:
    W=frozenset(i for i,p in enumerate(P) if i and len({(FULL^m) in c for m in p if m.bit_count()==3})==1)
    assert len(W)==30
    parts.add(W);parts.add(frozenset(range(56))-W)
assert len(parts)==12
base=set(clauses)
for W in parts:
    add([i+1 for i in range(56) if i not in W]+[i+57 for i in W])
assert len(clauses)==17322 and len(base)==17310
print('CNF',len(clauses),'base',len(base),'lengths',Counter(map(len,clauses)),flush=True)
for W in parts:
    assignment={i+1 for i in W}|{i+57 for i in range(56) if i not in W}
    assert all(any((x in assignment) if x>0 else (-x not in assignment) for x in c) for c in base)
CNF=sorted([tuple(sorted(c)) for c in clauses],key=lambda c:(len(c),c))
out=Path(sys.argv[1] if len(sys.argv)>1 else "bf-replay").resolve()
out.mkdir(parents=True,exist_ok=True)
cnf=out/"bf.cnf"; drat=out/"bf.drat"
with cnf.open('w') as f:
    print('p cnf 112',len(CNF),file=f)
    for c in CNF:print(*c,0,file=f)
print("CNF SHA256",hashlib.sha256(cnf.read_bytes()).hexdigest(),flush=True)
if drat.exists():drat.unlink()
Z=ct.CDLL(ctypes.util.find_library('z3') or 'libz3.so.4')
Ptr=ct.c_void_p; S=ct.c_char_p
def bind(n,r,a):
    x=getattr(Z,n);x.restype=r;x.argtypes=a;return x
print("Z3 version",bind('Z3_get_full_version',S,[])().decode(),flush=True)
bind('Z3_global_param_set',None,[S,S])(b'sat.drat.file',str(drat).encode())
bind('Z3_global_param_set',None,[S,S])(b'sat.drat.check_unsat',b'true')
cfg=bind('Z3_mk_config',Ptr,[])()
ctx=bind('Z3_mk_context',Ptr,[Ptr])(cfg)
bind('Z3_del_config',None,[Ptr])(cfg)
t=bind('Z3_mk_tactic',Ptr,[Ptr,S])(ctx,b'sat')
solver=bind('Z3_mk_solver_from_tactic',Ptr,[Ptr,Ptr])(ctx,t)
bind('Z3_solver_inc_ref',None,[Ptr,Ptr])(ctx,solver)
bind('Z3_solver_from_file',None,[Ptr,Ptr,S])(ctx,solver,str(cnf).encode())
result=bind('Z3_solver_check',ct.c_int,[Ptr,Ptr])(ctx,solver)
bind('Z3_solver_dec_ref',None,[Ptr,Ptr])(ctx,solver)
bind('Z3_del_context',None,[Ptr])(ctx)
assert result==-1, result

# Independently establish that the proof log starts with exactly
# the generated input, using Z3's observed variable numbering.
# Reject unsupported log formats rather than trusting solver metadata.
def renumber(x):
    i=abs(x)
    j=2*i-1 if i<=56 else 2*(i-56)
    return j if x>0 else -j
expected=Counter(tuple(sorted(renumber(x) for x in c)) for c in CNF)
initial=Counter()
proof_started=False
with drat.open() as f:
    for line in f:
        fields=line.split()
        if not fields: raise ValueError("empty proof-log line")
        if fields[0]=='i':
            assert not proof_started
            ls=list(map(int,fields[1:]))
            assert ls and ls[-1]==0 and all(0<abs(x)<=112 for x in ls[:-1])
            initial[tuple(sorted(ls[:-1]))]+=1
        else:proof_started=True
assert initial==expected, "proof-log input differs from generated CNF"
print("Verified exact initial-clause multiset",sum(initial.values()),flush=True)
print("DRAT SHA256",hashlib.sha256(drat.read_bytes()).hexdigest(),flush=True)
checker=out/"check_rup"
subprocess.run(["c++","-std=c++17","-O3",str(Path(__file__).resolve().with_name("check_rup.cpp")),"-o",str(checker)],check=True)
subprocess.run([str(checker),str(drat)],check=True)
