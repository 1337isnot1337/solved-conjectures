"""CEGAR helper: does an abstract A13 colouring of W (json {'a-b': colour}) extend to a near-1-factorization
of K_13 on V = W u D, W = 0..8, D = 9..12 (vertex 9+i = abstract D-colour 9+i)?  Prints the extension or UNSAT."""
import sys, json, itertools
from pysat.solvers import Solver
from pysat.card import CardEnc
col = {tuple(map(int, e.split('-'))): c for e, c in json.load(open(sys.argv[1])).items()}
V = range(13); E = list(itertools.combinations(V, 2)); nv = [0]; x = {}
for e in E:
    for c in V:
        if c not in e: nv[0] += 1; x[e, c] = nv[0]
cl = []
def card(l, b, kind):
    enc = getattr(CardEnc, kind)(l, bound=b, top_id=nv[0]); nv[0] = max(nv[0], enc.nv); cl.extend(enc.clauses)
for e in E: card([x[e, c] for c in V if (e, c) in x], 1, 'equals')
for c in V:
    for v in V:
        if v != c: card([x[tuple(sorted((v, w))), c] for w in V if w not in (v, c)], 1, 'equals')
for e, c in col.items(): cl.append([x[e, c]])
with Solver(name='cadical195', bootstrap_with=cl) as S:
    if S.solve():
        m = set(l for l in S.get_model() if l > 0)
        full = {e: c for (e, c), v in x.items() if v in m}
        print('EXTENDS'); json.dump({'%d-%d' % e: c for e, c in full.items()}, open(sys.argv[1] + '.full.json', 'w'))
    else: print('NO EXTENSION')
