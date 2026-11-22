#!/usr/bin/env python3
"""verify.py -- checks for the report on Conjecture 6.1 of Dawkins-Nappo-Tong-Zimbizi
(arXiv:2610.22142v1): wld_rho(K_n) = floor(4*ceil(n/2)/3) for every minimum proper colouring.

Usage:  python3 verify.py [quick|full]
  1. reformulation: W (spanning trees of blocks) colour-connecting  <=>  every quotient Q_u connected
     <=> partition seal-free  (direct graph check vs quotient check vs brute-force seal search, small n)
  2. splitting (peeling) lemma of the report, tested on random instances
  3. constructs colour-connecting W of size floor(4*ceil(n/2)/3) for many factorizations,
     odd n in [13, NMAX] and even n in [14, NMAX+1] (even case via deletion of a vertex), and
     checks each W directly in K_n (|W|, forest, every colour class + W connected)
  4. re-checks the LLL inequality (exact rationals) for a sample of n and the crude tail bound
No external data; needs numpy and scipy.
"""
import sys, random, itertools
from math import comb, factorial, sqrt
from fractions import Fraction as Fr
import numpy as np
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components

MODE = sys.argv[1] if len(sys.argv) > 1 else "quick"
NMAX = 41 if MODE == "quick" else 101

# ---------------------------------------------------------------- factorizations
def gk(m):
    q = m - 1; col = [[-1] * m for _ in range(m)]
    for c in range(q):
        col[c][m - 1] = col[m - 1][c] = c
        for d in range(1, m // 2):
            a, b = (c + d) % q, (c - d) % q; col[a][b] = col[b][a] = c
    return col
def kempe_1f(m, rnd, switches):
    """1-factorization of K_m (m even): GK_m + random alternating-cycle (Kempe) switches"""
    col = gk(m); C = m - 1
    at = [[0] * C for _ in range(m)]
    for a in range(m):
        for b in range(m):
            if a != b: at[a][col[a][b]] = b
    for _ in range(switches):
        c, d = rnd.sample(range(C), 2); v = rnd.randrange(m)
        cyc = [v]; cur = v; cc = c
        while True:
            nxt = at[cur][cc]; cc = d if cc == c else c
            if nxt == v: break
            cyc.append(nxt); cur = nxt
        for i in range(len(cyc)):
            a, b = cyc[i], cyc[(i + 1) % len(cyc)]
            nc = d if col[a][b] == c else c
            col[a][b] = col[b][a] = nc; at[a][nc] = b; at[b][nc] = a
    return col
def delete_last(col):
    """near-1-factorization of K_{m-1}; colours renamed by their missing vertex"""
    m = len(col); n = m - 1
    miss = {col[n][v]: v for v in range(n)}
    return [[a if a == b else miss[col[a][b]] for b in range(n)] for a in range(n)]
def cyclic(n):
    inv2 = (n + 1) // 2
    return [[((a + b) * inv2) % n for b in range(n)] for a in range(n)]
def affine_minus(k):
    V = list(range(1, 2 ** k)); idx = {v: i for i, v in enumerate(V)}
    return [[idx[a] if a == b else idx[a ^ b] for b in V] for a in V]
def steiner(n, rnd):
    """Steiner quasigroup of an STS(n) built by Stinson's hill-climbing"""
    live = [set(range(n)) - {v} for v in range(n)]; blocks = set(); nb = 0
    while nb < n * (n - 1) // 6:
        x = rnd.choice([v for v in range(n) if live[v]])
        if len(live[x]) < 2: continue
        y, z = rnd.sample(sorted(live[x]), 2)
        if z in live[y]:
            blocks.add(tuple(sorted((x, y, z)))); nb += 1
            for a, b in ((x, y), (x, z), (y, z)): live[a].discard(b); live[b].discard(a)
        else:
            w = [bl for bl in blocks if y in bl and z in bl][0]; blocks.remove(w)
            w3 = [c for c in w if c not in (y, z)][0]
            for a, b in ((y, w3), (z, w3)): live[a].add(b); live[b].add(a)
            blocks.add(tuple(sorted((x, y, z))))
            for a, b in ((x, y), (x, z)): live[a].discard(b); live[b].discard(a)
    L = [[a if a == b else -1 for b in range(n)] for a in range(n)]
    for (a, b, c) in blocks:
        L[a][b] = L[b][a] = c; L[a][c] = L[c][a] = b; L[b][c] = L[c][b] = a
    return L
def check_near(L):
    n = len(L)
    for a in range(n):
        assert L[a][a] == a and sorted(L[a]) == list(range(n))
        for b in range(n): assert L[a][b] == L[b][a]

# ---------------------------------------------------------------- checks
def partner(L):
    n = len(L); P = [[-1] * n for _ in range(n)]
    for a in range(n):
        for b in range(n):
            if a != b: P[L[a][b]][a] = b
    return P
def components(nv, edges):
    par = list(range(nv))
    def f(a):
        while par[a] != a: par[a] = par[par[a]]; a = par[a]
        return a
    for a, b in edges:
        ra, rb = f(a), f(b)
        if ra != rb: par[ra] = rb
    return len({f(a) for a in range(nv)}), f
def W_from_blocks(blocks):
    return [(B[i], B[i + 1]) for B in blocks for i in range(len(B) - 1)]   # a path spans each block
def colour_connecting_direct(colour_classes, W, nv):
    """colour_classes: list of edge lists; check every class + W connected on nv vertices"""
    return all(components(nv, cls + W)[0] == 1 for cls in colour_classes)
def quotient_ok(P, blocks, n):
    lab = {}
    for i, B in enumerate(blocks):
        for v in B: lab[v] = i
    return all(components(len(blocks), [(lab[a], lab[P[u][a]]) for a in range(n) if P[u][a] > a])[0] == 1
               for u in range(n))
def has_seal_bruteforce(P, blocks, n):
    for r in range(1, len(blocks)):
        for fam in itertools.combinations(range(len(blocks)), r):
            U = set(v for i in fam for v in blocks[i])
            for u in range(n):
                if u in U: continue
                if all(P[u][x] in U for x in U): return True
    return False
def sizes(n):
    t = n // 3; s = [3] * t
    for i in range(n - 3 * t): s[i] += 1
    return s
class Fast:
    def __init__(s, L):
        L = np.array(L); n = len(L); s.n = n
        a, b = np.triu_indices(n, 1); c = L[a, b]; o = np.argsort(c, kind='stable')
        s.ea = a[o].reshape(n, (n - 1) // 2); s.eb = b[o].reshape(n, (n - 1) // 2)
    def ok(s, lab, t):
        n = s.n; off = (np.arange(n) * t)[:, None]
        r = (lab[s.ea] + off).ravel(); c = (lab[s.eb] + off).ravel()
        k, _ = connected_components(coo_matrix((np.ones(len(r)), (r, c)), shape=(n * t, n * t)), directed=False)
        return k == n
def find_partition(L, rng, tries=200000):
    F = Fast(L); n = len(L); sz = sizes(n)
    for k in range(1, tries + 1):
        perm = rng.permutation(n); lab = np.empty(n, dtype=np.int64); i = 0
        for j, s_ in enumerate(sz): lab[perm[i:i + s_]] = j; i += s_
        if F.ok(lab, len(sz)):
            blocks = [[] for _ in sz]
            for v in range(n): blocks[lab[v]].append(v)
            return k, blocks
    return None, None

# ---------------------------------------------------------------- 1. reformulation
def test_reformulation():
    rnd = random.Random(1); cnt = 0
    for n in (7, 9, 11, 13):
        for rep in range(4):
            L = delete_last(kempe_1f(n + 1, rnd, 5 * (n + 1) ** 2)); check_near(L); P = partner(L)
            classes = [[(a, P[u][a]) for a in range(n) if P[u][a] > a] for u in range(n)]
            for _ in range(60):
                perm = list(range(n)); rnd.shuffle(perm); blocks = []; i = 0
                for s_ in sizes(n): blocks.append(perm[i:i + s_]); i += s_
                d = colour_connecting_direct(classes, W_from_blocks(blocks), n)
                q = quotient_ok(P, blocks, n); sb = not has_seal_bruteforce(P, blocks, n)
                assert d == q == sb, (n, blocks); cnt += 1
    print("[1] direct check == quotient check == seal-free on", cnt, "random partitions: OK")

# ---------------------------------------------------------------- 2. splitting lemma
def parts_of(P, n, blocks_other, R, u):
    lab = {}
    for i, B in enumerate(blocks_other):
        for v in B: lab[v] = i
    _, f = components(len(blocks_other), [(lab[a], lab[P[u][a]]) for a in lab if P[u][a] in lab and P[u][a] > a])
    Rs = set(R); groups = {}
    for x in R:
        y = P[u][x]
        key = ('s', x) if y < 0 else (('e', min(x, y)) if y in Rs else ('c', f(lab[y])))
        groups.setdefault(key, set()).add(x)
    return list(groups.values())
def test_splitting():
    rnd = random.Random(2); cnt = 0
    for n in (13, 15, 17, 19, 21):
        L = delete_last(kempe_1f(n + 1, rnd, 5 * (n + 1) ** 2)); P = partner(L)
        for _ in range(40):
            perm = list(range(n)); rnd.shuffle(perm); k = rnd.randrange(0, n // 3 - 1)
            others = [perm[3 * i:3 * i + 3] for i in range(k)]; R = perm[3 * k:]
            if not quotient_ok(P, others + [R], n): continue
            T = rnd.sample(R, 3); R2 = [x for x in R if x not in T]
            # T is a union of parts  <=>  every part meeting T lies inside T
            pred = all(not all(p <= set(T) for p in parts_of(P, n, others, R, u) if p & set(T)) for u in range(n))
            assert pred == quotient_ok(P, others + [T, R2], n); cnt += 1
    print("[2] splitting criterion agrees with direct check on", cnt, "random splits: OK")

# ---------------------------------------------------------------- 3. constructions
def test_constructions():
    rng = np.random.default_rng(7); rnd = random.Random(3); total = 0; worst = 0
    for n in range(13, NMAX + 1, 2):
        fams = [('cyclic', cyclic(n))]
        if n % 6 in (1, 3): fams.append(('steiner', steiner(n, random.Random(n))))
        k = (n + 1).bit_length() - 1
        if 2 ** k == n + 1: fams.append(('affine', affine_minus(k)))
        ones = []   # 1-factorizations of K_{n+1} (for the even case n+1)
        for s_ in range(3):
            col = kempe_1f(n + 1, rnd, 10 * (n + 1) ** 2); ones.append(col)
            fams.append(('kempe%d' % s_, delete_last(col)))
        ones.append(gk(n + 1))
        for name, L in fams:
            check_near(L); P = partner(L)
            tries, blocks = find_partition(L, rng); assert blocks is not None
            worst = max(worst, tries)
            W = W_from_blocks(blocks)
            target = (4 * ((n + 1) // 2)) // 3
            assert len(W) == target, (n, len(W), target)
            assert components(n, W)[0] == len(blocks)               # W is a forest with these components
            classes = [[(a, P[u][a]) for a in range(n) if P[u][a] > a] for u in range(n)]
            assert colour_connecting_direct(classes, W, n); total += 1
        # even case m = n+1: the same partition, built from the restriction, works in K_{n+1}
        for col in ones:
            m = n + 1; L = delete_last(col); tries, blocks = find_partition(L, rng)
            W = W_from_blocks(blocks)
            assert len(W) == (4 * (m // 2)) // 3
            classes = [[(a, b) for a in range(m) for b in range(a + 1, m) if col[a][b] == c] for c in range(m - 1)]
            assert colour_connecting_direct(classes, W, m); total += 1
    print("[3] optimal colour-connecting sets built and checked directly for", total,
          "colourings (odd n 13..%d, even n 14..%d); max random tries %d: OK" % (NMAX, NMAX + 1, worst))

# ---------------------------------------------------------------- 4. LLL inequality
def splits(j): return factorial(3 * j) // (factorial(j) * 6 ** j)
CLASSES = {4: lambda n: ((6, 2), (n, 4), (4, 3)), 5: lambda n: ((10, 3), (n, 5), (5, 4))}
def lll_weights(n, jmax=None):
    f = {0: 0, 1: 4, 2: 5}[n % 3]; N = n - f; t = N // 3; h = (n - 1) // 2
    jmax = t // 2 if jmax is None else jmax
    q = [Fr(1)]
    for i in range(jmax): q.append(q[-1] / comb(N - 1 - 3 * i, 2))
    W1, WF = [], []
    for j in range(1, jmax + 1):
        s = 3 * j
        cnt = (n - 1) * comb(h - 1, s // 2 - 1) if s % 2 == 0 else comb(h, (s - 1) // 2) + (n - 1) * comb(h - 1, (s - 3) // 2)
        W1.append(cnt * splits(j) * q[j])
        c = 0
        if f:
            for ncol, ext in CLASSES[f](n):
                if s >= ext: c += ncol * comb(h, (s - ext) // 2)
        WF.append(c * splits(j) * q[j])
    return W1, WF, q
def lll_exact(n, mus=(Fr(112, 100), Fr(111, 100), Fr(11, 10), Fr(108, 100), Fr(106, 100), Fr(104, 100))):
    W1, WF, q = lll_weights(n)
    for mu in mus:
        W = sum((a + b) * mu ** (3 * (j + 1)) for j, (a, b) in enumerate(zip(W1, WF)))
        xmax = max(q[j] * mu ** (3 * j) for j in range(1, len(q)))
        if W <= (1 - xmax) * ((mu - 1) - (mu - 1) ** 2 / 2): return mu, W
    return None, None
def lll_crude(n, mu):
    f = {0: 0, 1: 4, 2: 5}[n % 3]; N = n - f; h = (n - 1) // 2; D = N - h - N // 3
    W1, WF, q = lll_weights(n, 2)
    main = float(W1[0] + WF[0]) * mu ** 3 + float(W1[1] + WF[1]) * mu ** 6
    ratio = mu ** 6 * (D / 4 + 2) / (0.75 * D - 1); assert ratio < 1
    tailsum = 2 * (mu ** 12 / comb(D, 3) / (1 - ratio) + (D / 4 + 3) * mu ** 12 * (mu ** 3 / sqrt(2)) ** D)
    return main + (2.125 * n + 15) * tailsum
def test_lll():
    sample = [165, 171, 177, 183, 189, 191, 193, 195, 251, 401, 601] if MODE == "quick" else list(range(189, 1202, 2))
    for n in sample:
        mu, W = lll_exact(n); assert mu is not None, n
    for n in (185, 187):
        assert lll_exact(n)[0] is None   # the simple LLL bound fails just below 189 (for these residues)
    mu = 1.025; lnmu = (mu - 1) - (mu - 1) ** 2 / 2
    for n in (1201, 1203, 1205, 2001, 10001, 100001):
        assert lll_crude(n, mu) <= 0.999 * lnmu, n
    print("[4] LLL inequality: exact check OK for n in", sample if MODE == "quick" else "[189,1201]",
          "; crude tail bound OK at n=1201,1203,1205 (and samples up to 1e5); fails at 185,187 as expected")

if __name__ == "__main__":
    test_reformulation(); test_splitting(); test_constructions(); test_lll()
    print("ALL CHECKS PASSED (%s mode)" % MODE)
