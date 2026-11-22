"""Referee-2 plain (p,q)-edge-colouring SAT encoding of K_n - F, straight from the definition:
x[e][c] (edge e gets colour c in Z_p); each edge: at least one colour and at most one (pairwise);
for every pair of adjacent edges e,f and colours c,c' with circular distance < q: (-x[e][c] | -x[f][c']).
Symmetry breaking (sound): rotation -> edge E[0] gets colour 0; reflection c -> -c -> a fixed edge f
adjacent to E[0] gets a colour in [q, p//2].
Optional (--win): implied constraint: for each j, the edges with colours j..j+q-1 form a matching, so at most
floor(n/2) of them (sequential counter).
usage: python3 plainsat.py n p q a1 b1 a2 b2 ... [--win] [--solver NAME]"""
import sys, time
from pysat.formula import CNF, IDPool
from pysat.card import CardEnc, EncType
from pysat.solvers import Solver
args=sys.argv[1:]; win='--win' in args; solver='cadical153'
if '--solver' in args: solver=args[args.index('--solver')+1]
nums=[int(a) for a in args if a.lstrip('-').isdigit()]
n,p,q=nums[:3]; F={tuple(sorted(nums[i:i+2])) for i in range(3,len(nums),2)}
E=[(a,b) for a in range(n) for b in range(a+1,n) if (a,b) not in F]
pool=IDPool(); X=lambda e,c: pool.id((e,c)); cl=[]
for e in range(len(E)):
    cl.append([X(e,c) for c in range(p)])
    for c in range(p):
        for c2 in range(c+1,p): cl.append([-X(e,c),-X(e,c2)])
def cd(c,c2): d=(c-c2)%p; return min(d,p-d)
for e in range(len(E)):
    for f in range(e+1,len(E)):
        if set(E[e])&set(E[f]):
            for c in range(p):
                for c2 in range(p):
                    if cd(c,c2)<q: cl.append([-X(e,c),-X(f,c2)])
cl.append([X(0,0)])
f=next(i for i in range(1,len(E)) if set(E[i])&set(E[0]))
cl.append([X(f,c) for c in range(q,p//2+1)])
if win:
    for j in range(p):
        lits=[X(e,(j+d)%p) for e in range(len(E)) for d in range(q)]
        cl.extend(CardEnc.atmost(lits,n//2,vpool=pool,encoding=EncType.seqcounter).clauses)
t=time.time()
with Solver(name=solver,bootstrap_with=cl) as s:
    r=s.solve()
    msg="SAT" if r else "UNSAT"
    if r:
        mod=set(l for l in s.get_model() if l>0)
        col=[next(c for c in range(p) if X(e,c) in mod) for e in range(len(E))]
        ok=all(cd(col[i],col[j])>=q for i in range(len(E)) for j in range(i+1,len(E)) if set(E[i])&set(E[j]))
        msg+=" (model checked: %s)"%ok
print("K_%d - %s (%d,%d) win=%s solver=%s: %s  %.1fs, %d clauses"%(n,sorted(F),p,q,win,solver,msg,time.time()-t,len(cl)),flush=True)
