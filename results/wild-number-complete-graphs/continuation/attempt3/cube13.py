"""Cube-and-conquer for the abstract n=13 end-game (abs13.py), case k (0 or 1).
Cubes: the colour classes (inside W) of the 'small' W-colours Z (k=0: Z={6,7,8}, 2 edges each;
k=1: Z={5,6,7,8}, 2 edges each) -- enumerated up to the symmetry group Sym(big W-colours) x Sym(Z)
acting simultaneously on vertices and colours.  Each cube is solved separately (UNSAT for all
cubes  ==>  the abstract lemma)."""
import sys, itertools, time
from abs13 import build

def matchings_pairs(cands, size):
    """all sets of `size` pairwise disjoint pairs from list of pairs cands"""
    def rec(start, chosen, used):
        if len(chosen) == size: yield tuple(chosen); return
        for i in range(start, len(cands)):
            a, b = cands[i]
            if a in used or b in used: continue
            yield from rec(i+1, chosen+[cands[i]], used | {a, b})
    yield from rec(0, [], frozenset())

def cubes(k):
    W = list(range(9))
    big = list(range(6)) if k == 0 else list(range(5))
    Z = [v for v in W if v not in big]
    # assignment: for each z in Z a set of 2 disjoint pairs from W\{z}, all pairs distinct across z,
    # and each vertex meets each colour at most once (automatic: disjoint pairs)
    per = {z: list(matchings_pairs([p for p in itertools.combinations(W, 2) if z not in p], 2)) for z in Z}
    perms = []
    for pb in itertools.permutations(big):
        for pz in itertools.permutations(Z):
            m = {}
            for a, b in zip(big, pb): m[a] = b
            for a, b in zip(Z, pz): m[a] = b
            perms.append(m)
    seen = set(); out = []
    def canon(assign):
        best = None
        for m in perms:
            img = tuple(sorted((m[z], tuple(sorted(tuple(sorted((m[a], m[b]))) for a, b in ps))) for z, ps in assign.items()))
            if best is None or img < best: best = img
        return best
    def rec(i, assign, usedpairs):
        if i == len(Z):
            c = canon(assign)
            if c not in seen: seen.add(c); out.append(dict(assign))
            return
        z = Z[i]
        for ps in per[z]:
            if any(p in usedpairs for p in ps): continue
            assign[z] = ps
            rec(i+1, assign, usedpairs | set(ps))
            del assign[z]
    rec(0, {}, set())
    return out

if __name__ == '__main__':
    k = int(sys.argv[1]); tl = float(sys.argv[2]) if len(sys.argv) > 2 else 60
    start = int(sys.argv[3]) if len(sys.argv) > 3 else 0
    stop = int(sys.argv[4]) if len(sys.argv) > 4 else 10**9
    t0 = time.time(); C = cubes(k)
    print('k', k, 'cubes', len(C), 'enumerated in %.1fs' % (time.time()-t0), flush=True)
    if len(sys.argv) > 5 and sys.argv[5] == 'count': sys.exit()
    from pysat.solvers import Solver
    res = {}
    for i, cube in enumerate(C):
        if i < start or i >= stop: continue
        S, y, ns, nv = build(k, 'cadical195')
        assum = [y[(tuple(sorted(p)), z)] for z, ps in cube.items() for p in ps]
        t1 = time.time()
        r = S.solve_limited(assumptions=assum, expect_interrupt=True) if False else None
        # time-limited solve via interrupt timer
        import threading
        timer = threading.Timer(tl, lambda: S.interrupt()); timer.start()
        r = S.solve_limited(assumptions=assum, expect_interrupt=True)
        timer.cancel()
        st = 'UNSAT' if r is False else ('SAT' if r else 'UNKNOWN')
        print('cube', i, st, '%.1fs' % (time.time()-t1), cube if st != 'UNSAT' else '', flush=True)
        S.delete()
