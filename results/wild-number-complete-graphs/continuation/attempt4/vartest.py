import sys, subprocess, time, random, itertools
from orbits import gen, realise
from gen13 import build, write
from cubesb import stab_autos, lex_clauses
from pysat.card import CardEnc, EncType
k=0; colD=list(range(6)); N=[6,7,8]; x0=6; vb={'H':colD,'N':[7,8]}
orbs=gen({'H':6,'N':2},['H','N'],4)
i=int(sys.argv[1]); variant=sys.argv[2]
exact = variant in ('exact','cnt','six','p2')
cl, nv, y, bad, cov, NY = build(k, 'none', exact, variant in ('cnt','p2'))
top=[nv]
def new():
    top[0]+=1; return top[0]
extra=[]
if variant=='six':
    # for each triple A: -bad[A] -> at least 10 bad triples among the 20 triples of W\A (seqcounter)
    for A in bad:
        R=[v for v in range(9) if v not in A]
        lits=[bad[t] for t in itertools.combinations(R,3)]
        enc=CardEnc.atleast(lits,bound=10,top_id=top[0],encoding=EncType.seqcounter); top[0]=max(top[0],enc.nv)
        for c in enc.clauses: extra.append(c+[bad[A]])
if variant=='p2':
    from pysat.card import ITotalizer
    tb=ITotalizer(lits=list(bad.values()), ubound=35, top_id=top[0]); top[0]=max(top[0],tb.top_id); extra+=tb.cnf.clauses
    pv=[]
    for t1,t2 in itertools.combinations(list(bad),2):
        if set(t1)&set(t2): continue
        z=new(); extra.append([-bad[t1],-bad[t2],z]); pv.append(z)
    tp=ITotalizer(lits=pv, ubound=91, top_id=top[0]); top[0]=max(top[0],tp.top_id); extra+=tp.cnf.clauses
    # tb.rhs[j] true iff |B| >= j+1 ; tp.rhs[j] true iff P2 >= j+1
    for b in range(28,35):
        lim=15*b-420
        if lim+1 <= 91: extra.append([tb.rhs[b], -tp.rhs[lim]])   # |B|<=b  ->  P2 <= lim
    extra.append([tb.rhs[27]])  # |B| >= 28
f=realise(orbs[i],vb,[9,10,11,12])
A=stab_autos(k,x0,f,colD,N,[9,10,11,12],[]); random.Random(i).shuffle(A)
lx=lex_clauses(A,y,list(itertools.combinations(range(9),2)),list(range(13)),new,60)
units=[[y[(min(x0,v),max(x0,v)),c]] for v,c in f.items()]
write(cl+units+lx+extra, top[0], 'vt.cnf'); t=time.time()
r=subprocess.run(['nice','-n','19','bin/kissat','-q','--unsat','vt.cnf'],capture_output=True,text=True)
print(i, variant, r.stdout.split('\n')[0], '%.2f'%(time.time()-t), flush=True)
