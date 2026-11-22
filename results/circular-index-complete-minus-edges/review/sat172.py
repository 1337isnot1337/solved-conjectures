# Own SAT model: search a (17,2)-edge-colouring of K_9 - F for each 3-edge F (Table row n=9 upper bound).
import itertools, time, sys, json
from pysat.solvers import Solver
from pysat.card import CardEnc, EncType
from pysat.formula import IDPool
def find(n, F, p, q, tl=120):
    Fs = {tuple(sorted(e)) for e in F}
    E = [(a, b) for a in range(n) for b in range(a+1, n) if (a, b) not in Fs]
    pool = IDPool(); cls = []
    X = lambda i, c: pool.id(('x', i, c))
    for i in range(len(E)):
        cls.append([X(i, c) for c in range(p)])
        cls += CardEnc.atmost([X(i, c) for c in range(p)], 1, vpool=pool, encoding=EncType.pairwise).clauses
    for i, j in itertools.combinations(range(len(E)), 2):
        if set(E[i]) & set(E[j]):
            for c in range(p):
                for d in range(-(q-1), q):
                    cls.append([-X(i, c), -X(j, (c + d) % p)])
    cls.append([X(0, 0)])
    with Solver(name='cadical153', bootstrap_with=cls) as s:
        r = s.solve()
        if not r: return None
        mdl = set(l for l in s.get_model() if l > 0)
        col = [next(c for c in range(p) if X(i, c) in mdl) for i in range(len(E))]
    # verify
    for i, j in itertools.combinations(range(len(E)), 2):
        if set(E[i]) & set(E[j]):
            d = (col[i]-col[j]) % p; assert min(d, p-d) >= q
    return E, col
Fs = {"K3": [(0,1),(1,2),(0,2)], "P4": [(0,1),(1,2),(2,3)], "K13": [(0,1),(0,2),(0,3)], "P3+K2": [(0,1),(1,2),(3,4)], "3K2": [(0,1),(2,3),(4,5)]}
res = []
for name, F in Fs.items():
    t = time.time(); r = find(9, F, 17, 2)
    print(name, "(17,2)-colouring found and verified" if r else "UNSAT", "%.1fs" % (time.time()-t), flush=True)
    if r: res.append({"n": 9, "F": F, "p": 17, "q": 2, "edges": r[0], "colour": r[1]})
json.dump(res, open("k9_t3_17_2.json", "w"))
