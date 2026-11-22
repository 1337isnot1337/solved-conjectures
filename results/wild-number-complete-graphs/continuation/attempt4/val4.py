"""Validate gen13.build (exact=1, sb=none) against wild3/lib13.bad_family on real K_13 factorizations:
relabel W so that colD come first, D-colours -> 9..12 (d0 first for k=1), fix y, propagate, compare bad[] with Bad."""
import sys, itertools
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parents[1] / 'attempt3'))
import fac
from lib13 import rainbow, bad_family
from gen13 import build
from pysat.solvers import Solver

n = 13; tot = 0
built = {k: build(k, 'none', True, False) for k in (0, 1)}
for s in range(1, 5):
    L = fac.near(n, 'dbl', s)
    for D in itertools.combinations(range(n), 4):
        if not rainbow(L, D): continue
        kD = [(a, b, L[a][b]) for a, b in itertools.combinations(D, 2) if L[a][b] in D]
        k = len(kD)
        if k > 1: continue
        W = [x for x in range(n) if x not in D]
        colD = sorted(set(L[a][b] for a, b in itertools.combinations(D, 2)) & set(W))
        lab = {}
        for i, u in enumerate(colD + [u for u in W if u not in colD]): lab[u] = i
        if k == 0: dl = list(D)
        else:
            d0 = kD[0][2]; dl = [d0] + [d for d in D if d != d0]
        for i, d in enumerate(dl): lab[d] = 9 + i
        Bad, _ = bad_family(L, D, W)
        Badl = set(frozenset(lab[x] for x in t) for t in Bad)
        cl, nv, y, bad, cov, NY = built[k]
        assum = []
        for (e, c), v in y.items():
            pass
        inv = {lab[w]: w for w in W}
        for (e, c), v in y.items():
            a, b = inv[e[0]], inv[e[1]]
            colr = L[a][b]
            assum.append(v if lab[colr] == c else -v)
        with Solver(name='cadical153', bootstrap_with=[c for c in cl if len(c) != 3 or not all(abs(l) in bad.values() for l in c)]) as S:
            ok, props = S.propagate(assumptions=assum)
            assert ok
            ps = set(props)
            for t, bt in bad.items():
                isb = frozenset(t) in Badl
                assert (bt in ps) == isb and ((-bt) in ps) == (not isb), (s, D, t)
        tot += 1
    print('fac', s, 'ok, D checked', tot, flush=True)
