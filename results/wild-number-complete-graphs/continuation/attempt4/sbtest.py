import sys, subprocess, time, random
from orbits import gen, realise
from gen13 import build, write
from cubesb import stab_autos, lex_clauses
import itertools
k=0; colD=list(range(6)); N=[6,7,8]; x0=6; vb={'H':colD,'N':[7,8]}
orbs=gen({'H':6,'N':2},['H','N'],4)
cl, nv, y, bad, cov, NY = build(k, 'none', False, False)
edges=list(itertools.combinations(range(9),2)); cols=list(range(13))
for i in map(int, sys.argv[1].split(',')):
    f=realise(orbs[i],vb,[9,10,11,12])
    A=stab_autos(k,x0,f,colD,N,[9,10,11,12],[])
    for m in A:
        for v,c in f.items(): assert f[m[v]]==m[c]
    random.Random(0).shuffle(A)
    top=[nv]
    def new():
        top[0]+=1; return top[0]
    lx=lex_clauses(A,y,edges,cols,new,int(sys.argv[2]))
    units=[[y[(min(x0,v),max(x0,v)),c]] for v,c in f.items()]
    write(cl+units+lx, top[0], 'sbt.cnf'); t=time.time()
    r=subprocess.run(['nice','-n','19','bin/kissat','-q','--unsat','sbt.cnf'],capture_output=True,text=True)
    print(i, len(A)+1, r.stdout.split('\n')[0], '%.2f'%(time.time()-t), flush=True)
