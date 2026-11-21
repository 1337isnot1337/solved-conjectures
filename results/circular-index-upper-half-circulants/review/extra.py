#!/usr/bin/env python3
"""Extra adversarial checks: insertion lemma random tests, small UNSAT spot-checks, Family B base problem g=3..5."""
import os
import sys, random, itertools
sys.path.insert(0, __import__("os").path.dirname(__import__("os").path.abspath(__file__)))
import check as C

def perfect_matchings(vs):
    vs = list(vs)
    if not vs:
        yield []; return
    a = vs[0]
    for i in range(1, len(vs)):
        b = vs[i]; rest = vs[1:i] + vs[i + 1:]
        for m in perfect_matchings(rest):
            yield [(a, b)] + m

def L(a, b, n):
    d = (a - b) % n; return min(d, n - d)

def famB_base(g):
    n = 6 * g + 1; I = list(range(2 * g + 3, 4 * g + 1))
    W0 = [0, 1] + I; W1 = [1, 2] + I
    sols = 0
    M1s = []
    for m in perfect_matchings(W1):
        ls = [L(a, b, n) for a, b in m]
        if 1 in ls or len(set(ls)) < g: continue
        M1s.append(frozenset(ls))
    M1set = set(M1s)
    for m in perfect_matchings(W0):
        ls = [L(a, b, n) for a, b in m]
        if 1 in ls or len(set(ls)) < g: continue
        s = frozenset(ls)
        for t in M1set:
            if not (s & t): sols += 1; break
        if sols: break
    return sols > 0

def cyclic_g1_exists(q, r):
    """cyclic ansatz, g=1: n=2q+1, r base classes = single edges {x_rho, x_rho+s_rho}, x_0=0, distinct lengths."""
    n = 2 * q + 1; p = n * r
    from math import gcd
    if gcd(q, p) != 1: return None
    for lens in itertools.permutations(range(1, q + 1), r):
        for xs in itertools.product(range(n), repeat=r - 1):
            xs = (0,) + xs
            base = [[(xs[i], xs[i] + lens[i])] for i in range(r)]
            _, col = C.cyclic(n, q, r, base)
            ok, _ = C.proper_pq(n, col, p, q)
            if ok: return True
    return False

def insertion_random(trials=200, seed=1):
    rnd = random.Random(seed)
    good = 0; tried = 0
    for _ in range(trials):
        g = rnd.choice([2, 3]); n, col = C.family_colouring(g); p = 2 * n
        seq = C.seq_from_col(p, col); Gedges = set(col)
        c = rnd.randrange(p); mirror = rnd.random() < 0.5
        src = [(c - 3 + j) % p for j in range(3)] if mirror else [(c + j) % p for j in range(3)]
        blk = []
        for j in range(3):
            V = sorted(C.Vset(seq[src[j]]))
            cands = [m for m, _ in zip(perfect_matchings(V), range(10**6)) if not any(frozenset(e) in Gedges for e in m)]
            if not cands: break
            blk.append([frozenset(e) for e in rnd.choice(cands)])
        if len(blk) < 3: continue
        tried += 1
        new = seq[:c] + blk + seq[c:]
        C.check_seq(n, 3, new, "ins g=%d c=%d mirror=%s" % (g, c, mirror))
        good += 1
    print("insertion lemma random tests passed: %d/%d" % (good, tried))

if __name__ == "__main__":
    w = sys.argv[1]
    if w == "famB":
        for g in (3, 4, 5): print("FamB base problem g=%d solvable:" % g, famB_base(g), flush=True)
    if w == "g1":
        for q, r in [(4, 3), (5, 3), (5, 4)]:
            print("cyclic (q,r,g)=(%d,%d,1) exists:" % (q, r), cyclic_g1_exists(q, r), flush=True)
    if w == "ins": pass

def insertion_famB(trials=60, seed=2):
    import json
    Cc = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "data", "part2_certificates.json")))["familyB_bases"]
    rnd = random.Random(seed); good = 0; neg = 0
    for _ in range(trials):
        g = rnd.choice([6, 7]); n = 6 * g + 1
        p, col = C.cyclic(n, 3, 2, Cc[str(g)]); seq = C.seq_from_col(p, col); Gedges = set(col)
        c = rnd.randrange(p); mirror = rnd.random() < 0.5
        src = [(c - 3 + j) % p for j in range(3)] if mirror else [(c + j) % p for j in range(3)]
        blk = []
        for j in range(3):
            V = sorted(C.Vset(seq[src[j]]))
            cands = [m for m in perfect_matchings(V) if not any(frozenset(e) in Gedges for e in m)]
            blk.append([frozenset(e) for e in rnd.choice(cands)])
        new = seq[:c] + blk + seq[c:]
        C.check_seq(n, 3, new, "ins g=%d c=%d mirror=%s" % (g, c, mirror)); good += 1
        # negative control: use vertex sets of a non-window triple -> should fail
        bad = [blk[0], blk[2], blk[1]] if True else None
        try:
            C.check_seq(n, 3, seq[:c] + [blk[0], blk[1]] + seq[c:c+1] + [blk[2]] + seq[c+1:], "neg")
        except AssertionError:
            neg += 1
    print("insertion (incl. mirror form) random tests passed: %d/%d; negative controls failing as expected: %d" % (good, trials, neg))
