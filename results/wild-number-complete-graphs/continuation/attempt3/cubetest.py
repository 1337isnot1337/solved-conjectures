import sys, random, itertools, time, threading
from abs13 import build
from cube13 import matchings_pairs
k=int(sys.argv[1]); tl=float(sys.argv[2]); reps=int(sys.argv[3]); rnd=random.Random(int(sys.argv[4]))
W=list(range(9)); big=list(range(6)) if k==0 else list(range(5)); Z=[v for v in W if v not in big]
for r in range(reps):
    while True:
        used=set(); assign={}; ok=True
        for z in Z:
            cands=[ps for ps in matchings_pairs([p for p in itertools.combinations(W,2) if z not in p and p not in used],2)]
            if not cands: ok=False; break
            ps=rnd.choice(cands); assign[z]=ps; used|=set(ps)
        if ok: break
    S,y,ns,nv=build(k,'glucose4')
    assum=[y[(p,z)] for z,ps in assign.items() for p in ps]
    t=threading.Timer(tl,lambda:S.interrupt()); t.start(); t1=time.time()
    res=S.solve_limited(assumptions=assum,expect_interrupt=True); t.cancel()
    print(r, {False:'UNSAT',True:'SAT',None:'UNKNOWN'}[res], '%.1f'%(time.time()-t1), assign, flush=True)
