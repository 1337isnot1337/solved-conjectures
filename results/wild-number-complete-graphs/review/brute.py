"""Brute-force checks of the combinatorial reduction (items 1,2,3,5 of the referee task)."""
import random, itertools, sys
from math import comb
from factor import cyclic, random_nf, check, mates

def closed(S, u, M):
    return all((x == u) or (M[u][x] in S) for x in S)

def components_connected(n, edges):
    par = list(range(n))
    def f(a):
        while par[a] != a: par[a] = par[par[a]]; a = par[a]
        return a
    for a, b in edges: par[f(a)] = f(b)
    return len({f(a) for a in range(n)}) == 1

def random_partition_ge3(n, rnd):
    # random block sizes >= 3
    sizes = []
    r = n
    while r > 0:
        if r < 6: sizes.append(r); break
        s = rnd.randint(3, min(r-3, 7)); sizes.append(s); r -= s
    p = list(range(n)); rnd.shuffle(p)
    out = []; i = 0
    for s in sizes: out.append(p[i:i+s]); i += s
    return out

def random_tree(B, rnd):
    B = B[:]; rnd.shuffle(B)
    return [(B[i], B[rnd.randrange(i)]) for i in range(1, len(B))]

def test_seal(col, rnd, trials):
    n = len(col); M = mates(col); bad = 0
    for _ in range(trials):
        P = random_partition_ge3(n, rnd)
        W = [e for B in P for e in random_tree(B, rnd)]
        direct = all(components_connected(n, W + [(a, M[u][a]) for a in range(n) if a != u]) for u in range(n))
        # seal search: nonempty union U of blocks, u not in U, U u-closed
        seal = False
        for r in range(1, len(P)+1):
            for sub in itertools.combinations(P, r):
                U = set(x for B in sub for x in B)
                for u in range(n):
                    if u not in U and closed(U, u, M): seal = True
        # proper nonempty closed union exists (either side)
        proper = False
        for r in range(1, len(P)):
            for sub in itertools.combinations(P, r):
                U = set(x for B in sub for x in B)
                if any(closed(U, u, M) for u in range(n)): proper = True
        if not (direct == (not seal) == (not proper)): bad += 1
    return bad

def test_counts(col):
    """sum over u of #u-closed s-sets containing z vs formula (all z, all s)."""
    n = len(col); M = mates(col); h = (n-1)//2; bad = 0
    cnt = {}
    for s in range(1, n):
        for S in itertools.combinations(range(n), s):
            Ss = set(S)
            k = sum(1 for u in range(n) if closed(Ss, u, M))
            if k:
                for z in S: cnt[(s, z)] = cnt.get((s, z), 0) + k
    for s in range(1, n):
        f = (n-1)*comb(h-1, s//2-1) if s % 2 == 0 else comb(h, (s-1)//2) + (n-1)*(comb(h-1, (s-3)//2) if s >= 3 else 0)
        for z in range(n):
            if cnt.get((s, z), 0) != f: bad += 1; print("count mismatch", n, s, z, cnt.get((s, z), 0), f)
    return bad

def rainbow_subvalid(F, col):
    cols = [col[a][b] for a, b in itertools.combinations(F, 2)]
    if len(set(cols)) != len(cols): return False
    for a, b in itertools.combinations(F, 2):
        if col[a][b] in F: return False
    return True

def find_F(col, f, rnd):
    n = len(col)
    for _ in range(100000):
        F = rnd.sample(range(n), f)
        if rainbow_subvalid(F, col): return F
    return None

def test_E2_counts(col, F):
    """exact #(u, X): X subset V\\F, |X| = 3j, F u X u-closed, vs the report's class bound."""
    n = len(col); M = mates(col); h = (n-1)//2; f = len(F)
    rest = [v for v in range(n) if v not in F]
    classes = {4: ((6, 2), (n, 4), (4, 3)), 5: ((10, 3), (n, 5), (5, 4))}[f]
    # check class structure per colour
    ext_hist = {}
    for u in range(n):
        if u in F:
            e = sum(1 for x in F if x != u and M[u][x] in F)//2; ext = f-1-2*e
        else:
            e = sum(1 for x in F if M[u][x] in F)//2; ext = f-2*e
        ext_hist[ext] = ext_hist.get(ext, 0) + 1
    out = []
    N = len(rest); t = N//3
    for j in range(1, t+1):
        exact = 0
        for X in itertools.combinations(rest, 3*j):
            S = set(F) | set(X)
            exact += sum(1 for u in range(n) if closed(S, u, M))
        bound = sum(nc*comb(h, (3*j-ext)//2) for nc, ext in classes if 3*j >= ext)
        out.append((j, exact, bound))
    return ext_hist, out

def test_decomposition(col, F, rnd, trials):
    """For random partitions {F} + triples: whenever some Q_u is disconnected, an E1 or E2 event
    with 1 <= j <= t/2 occurs."""
    n = len(col); M = mates(col)
    rest = [v for v in range(n) if v not in F]
    N = len(rest); t = N//3; jmax = t//2
    nbad = 0; ndis = 0; nE2only = 0
    for u in range(n):
        assert not closed(set(F), u, M) if F else True
    for _ in range(trials):
        r = rest[:]; rnd.shuffle(r)
        T = [r[3*i:3*i+3] for i in range(t)]
        blocks = ([F] if F else []) + T
        dis = False
        for u in range(n):
            edges = []
            lab = {x: i for i, B in enumerate(blocks) for x in B}
            ok = components_connected(len(blocks), [(lab[a], lab[M[u][a]]) for a in range(n) if a != u])
            if not ok: dis = True
        if not dis: continue
        ndis += 1
        e1 = any(closed(set(x for B in sub for x in B), u, M)
                 for j in range(1, jmax+1) for sub in itertools.combinations(T, j) for u in range(n))
        e2 = F and any(closed(set(F) | set(x for B in sub for x in B), u, M)
                       for j in range(1, jmax+1) for sub in itertools.combinations(T, j) for u in range(n))
        if not (e1 or e2): nbad += 1
        if e2 and not e1: nE2only += 1
    return ndis, nbad, nE2only

if __name__ == "__main__":
    rnd = random.Random(12345)
    facs = []
    for n in (7, 9, 11, 13):
        facs.append(("cyc", cyclic(n)))
        for k in range(3): facs.append(("kempe%d" % k, random_nf(n, rnd)))
    for name, col in facs: check(col)
    print("== seal characterisation (direct G_u+W connectivity vs seal vs proper closed union)")
    for name, col in facs:
        print(len(col), name, "mismatches:", test_seal(col, rnd, 150))
    print("== u-closed counts through z (all z, all s)")
    for name, col in facs:
        if len(col) <= 13: print(len(col), name, "mismatches:", test_counts(col))
    print("== E2 counts and decomposition")
    for n, f in ((13, 4), (11, 5), (17, 5), (19, 4), (15, 0), (21, 0), (23, 5), (25, 4)):
        for k in range(2):
            col = cyclic(n) if k == 0 else random_nf(n, rnd); check(col)
            F = find_F(col, f, rnd) if f else []
            if f and F is None: print(n, "no rainbow subvalid F found"); continue
            if f and n <= 19:
                hist, out = test_E2_counts(col, F)
                viol = [(j, e, b) for j, e, b in out if e > b]
                print(n, f, "ext histogram", hist, "E2 exact vs bound", out, "VIOL" if viol else "ok")
            print(n, f, "decomposition (disconnected, uncovered, E2-only):", test_decomposition(col, F, rnd, 400 if n < 22 else 150))
