import sys, subprocess, time, random, itertools
from orbits import gen, realise
from gen13 import build, write
from cubesb import stab_autos, lex_clauses
k=1; colD=list(range(5)); N=[5,6,7,8]
x0type=sys.argv[1]; x0 = 0 if x0type=='H' else 5
vb={'H':[u for u in colD if u!=x0],'N':[u for u in N if u!=x0]}
orbs=gen({t:len(v) for t,v in vb.items()},['H','N'],3)
cl, nv, y, bad, cov, NY = build(k, 'none', True, True)
for i in map(int, sys.argv[2].split(',')):
    top=[nv]
    def new():
        top[0]+=1; return top[0]
    f=realise(orbs[i],vb,[10,11,12],None)
    A=stab_autos(k,x0,f,colD,N,[10,11,12],[9]); random.Random(i).shuffle(A)
    lx=lex_clauses(A,y,list(itertools.combinations(range(9),2)),list(range(13)),new,60)
    units=[[y[(min(x0,v),max(x0,v)),c]] for v,c in f.items()]+[[-cov[x0,9]]]
    write(cl+units+lx, top[0], 'k1t.cnf'); t=time.time()
    r=subprocess.run(['nice','-n','19','bin/kissat','-q','--unsat','k1t.cnf'],capture_output=True,text=True)
    print(x0type, i, len(A)+1, orbs[i], r.stdout.split('\n')[0], '%.2f'%(time.time()-t), flush=True)
