"""Write the CNF of one cube: python3 mkcube.py k x0type idx out.cnf [w]  (w: k=1 with x0 = w*)"""
import sys
from orbits import gen, realise
from gen13 import build, write
k = int(sys.argv[1]); x0type = sys.argv[2]; i = int(sys.argv[3]); fn = sys.argv[4]
wst = len(sys.argv) > 5 and sys.argv[5] == 'w'
cl, nv, y, bad, cov, NY = build(k, 'none', False, False)
colD = list(range(6)) if k == 0 else list(range(5)); N = [u for u in range(9) if u not in colD]
x0 = colD[0] if x0type == 'H' else N[0]
vb = {'H': [u for u in colD if u != x0], 'N': [u for u in N if u != x0]}
counts = {t: len(v) for t, v in vb.items()}
if k == 0: orbs = gen(counts, ['H', 'N'], 4); sinks = [9, 10, 11, 12]; d0 = None
elif wst: orbs = gen(counts, ['H', 'N'], 3); sinks = [10, 11, 12]; d0 = None
else: orbs = gen(counts, ['H', 'N'], 3, True); sinks = [10, 11, 12]; d0 = 9
f = realise(orbs[i], vb, sinks, d0)
units = [[y[(min(x0, v), max(x0, v)), c]] for v, c in f.items()]
if wst: units.append([-cov[x0, 9]])
write(cl + units, nv, fn); print(orbs[i])
