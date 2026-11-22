"""Brute-force check of the per-vertex event counts used in cl2.terms (without q_j):
for each z in V\\F and each j, the number of DISTINCT partial matchings M (j triples, z in V(M))
in the event family E1 u E2 must not exceed the formula.  Also checks conn() and the
decomposition (every partition with a disconnected Q_u contains an event of the family)."""
import itertools, random, sys
from math import comb
from factor import cyclic, random_nf, check, mates
from counts import conn, params, T, C, E1, E2

def splits(X):
    X = sorted(X)
    if not X: yield []; return
    a = X[0]
    for b, c in itertools.combinations(X[1:], 2):
        rest = [x for x in X if x not in (a, b, c)]
        for s in splits(rest): yield [frozenset((a, b, c))] + s

def connected(blocks, u, M, extra=None):
    bl = list(blocks) + ([extra] if extra else [])
    idx = {x: i for i, B in enumerate(bl) for x in B}
    par = list(range(len(bl)))
    def f(a):
        while par[a] != a: par[a] = par[par[a]]; a = par[a]
        return a
    for x in idx:
        if x != u:
            y = M[u][x]
            if y in idx: par[f(idx[x])] = f(idx[y])
    return len({f(i) for i in range(len(bl))}) == 1

def find_F(col, f, rnd):
    n = len(col); M = mates(col)
    if f == 0: return frozenset()
    for _ in range(200000):
        F = rnd.sample(range(n), f)
        cs = [col[a][b] for a, b in itertools.combinations(F, 2)]
        if len(set(cs)) < len(cs): continue
        if any(col[a][b] == w for a, b in itertools.combinations(F, 2) for w in F if w not in (a, b)): continue
        return frozenset(F)
    return None

def formula(n, j):
    """count bound of counts.py (E1 + E2) for events of j triples through a fixed z"""
    return E1(n, j)+E2(n, j)

def family(col, F, jmax):
    n = len(col); M = mates(col); f, N, t, h = params(n)
    V = [x for x in range(n) if x not in F]
    fam = {}
    for u in range(n):
        free = [(x, M[u][x]) for x in range(n) if x != u and x < M[u][x] and x not in F and M[u][x] not in F]
        ext = [M[u][y] for y in F if y != u and M[u][y] not in F]
        for j in range(1, jmax+1):
            s = 3*j
            # E1: X subset of V\F, u-closed
            if j <= t//2:
                for d in ((1,) if s % 2 else (0,)):
                    if d and (u in F): continue
                    for E in itertools.combinations(free, (s-d)//2):
                        X = [x for e in E for x in e] + ([u] if d else [])
                        for sp in splits(X):
                            if connected(sp, u, M): fam.setdefault(j, set()).add(frozenset(sp))
            if f and 2*j < t:
                for d in (0, 1):
                    if d and (u in F): continue
                    k2 = s-len(ext)-d
                    if k2 < 0 or k2 % 2: continue
                    for E in itertools.combinations(free, k2//2):
                        X = ext + [x for e in E for x in e] + ([u] if d else [])
                        for sp in splits(X):
                            if connected(sp, u, M, extra=F): fam.setdefault(j, set()).add(frozenset(sp))
    return fam

if __name__ == "__main__":
    rnd = random.Random(int(sys.argv[1]) if len(sys.argv) > 1 else 1)
    assert all(conn(m, d) == sum(1 for sp in splits(list(range(2*m+d))) if connected(sp, -1, {-1: {**{2*i: 2*i+1 for i in range(m)}, **{2*i+1: 2*i for i in range(m)}, **({2*m: -1} if d else {})}}))
               for m, d in [(1, 1), (3, 0), (4, 1), (6, 0)])
    print("conn brute OK")
    worst = 0
    for n, jmax in [(13, 2), (15, 2), (19, 3), (21, 3), (23, 3), (25, 3)]:
        for name, col in [("cyc", cyclic(n)), ("rnd1", random_nf(n, rnd)), ("rnd2", random_nf(n, rnd))]:
            check(col); f = params(n)[0]
            F = find_F(col, f, rnd)
            if F is None: print(n, name, "no F found"); continue
            fam = family(col, F, jmax)
            for j in range(1, jmax+1):
                fj = fam.get(j, set())
                if j > params(n)[2]//2: continue
                mx = max(sum(1 for Mm in fj if any(z in B for B in Mm)) for z in range(n) if z not in F)
                fo = formula(n, j)
                worst = max(worst, mx/fo if fo else (1 if mx == 0 else 99))
                print(n, name, "F", sorted(F), "j", j, "max_z exact", mx, "formula", fo, "OK" if mx <= fo else "VIOLATION", flush=True)
            # decomposition test
            M = mates(col); t = params(n)[2]; V = [x for x in range(n) if x not in F]
            fall = set().union(*fam.values()) if fam else set()
            miss = 0; dis = 0
            for _ in range(600):
                p = V[:]; rnd.shuffle(p)
                bl = [frozenset(p[3*i:3*i+3]) for i in range(t)]
                if all(connected(bl, u, M, extra=F if F else None) for u in range(n)): continue
                dis += 1
                bs = set(bl)
                hit = any(frozenset(c) in fall for r in range(1, jmax+1) for c in itertools.combinations(bl, r))
                if not hit:
                    # an event with j > jmax could be the witness; check smallest component size
                    miss += 1
            print("   decomposition: disconnected", dis, "not covered by events with j<=%d:" % jmax, miss)
    print("worst ratio exact/formula", worst)
