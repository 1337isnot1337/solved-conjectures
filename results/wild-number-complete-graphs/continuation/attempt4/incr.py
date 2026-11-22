"""Incremental cube solving with one CaDiCaL instance (pysat): learned clauses are consequences of the base
formula, so reuse across cubes is sound. Usage: python3 incr.py k x0type start end [solver]"""
import sys, time
from orbits import gen, realise
from gen13 import build
from pysat.solvers import Solver
k = int(sys.argv[1]); x0type = sys.argv[2]; a, b = int(sys.argv[3]), int(sys.argv[4])
name = sys.argv[5] if len(sys.argv) > 5 else 'cadical195'
cl, nv, y, bad, cov, NY = build(k, 'none', False, False)
colD = list(range(6)) if k == 0 else list(range(5)); N = [u for u in range(9) if u not in colD]
wstar = (len(sys.argv) > 6 and sys.argv[6] == 'w')
x0 = colD[0] if x0type == 'H' else N[0]
vb = {'H': [u for u in colD if u != x0], 'N': [u for u in N if u != x0]}
counts = {t: len(v) for t, v in vb.items()}
if k == 0: orbs = gen(counts, ['H', 'N'], 4); sinks = [9, 10, 11, 12]; d0 = None
elif wstar: orbs = gen(counts, ['H', 'N'], 3); sinks = [10, 11, 12]; d0 = None
else: orbs = gen(counts, ['H', 'N'], 3, True); sinks = [10, 11, 12]; d0 = 9
S = Solver(name=name, bootstrap_with=cl)
tag = 'k%d_%s%s' % (k, x0type, 'w' if wstar else '')
out = open('cubes/incr_%s.txt' % tag, 'a'); T0 = time.time()
for i in range(a, min(b, len(orbs))):
    f = realise(orbs[i], vb, sinks, d0)
    ass = [y[(min(x0, v), max(x0, v)), c] for v, c in f.items()]
    if wstar: ass.append(-cov[x0, 9])
    t0 = time.time(); r = S.solve(assumptions=ass)
    out.write('%d %s %.2f\n' % (i, 'SAT' if r else 'UNSAT', time.time() - t0)); out.flush()
    if r:
        print('SAT cube', i, orbs[i], flush=True)
        m = set(l for l in S.get_model() if l > 0)
        print({e: c for (e, c), v in y.items() if v in m}, flush=True)
print('done', tag, a, b, len(orbs), 'total %.1f' % (time.time() - T0), flush=True)
