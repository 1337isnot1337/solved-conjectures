#!/usr/bin/env python3
"""Referee's independent verifier for d3mod4/PROOF.md (Theorem A, Proposition B).

Standard library only.  Shares no code with the author's scripts: everything is
built from the closed formulas printed in PROOF.md Sections 3-5.

Usage: python3 ref_verify.py [GMIN GMAX [GALLPAIRS]] [--certs PATH]
"""
import sys, json, os
from fractions import Fraction
from itertools import combinations


# ---------------------------------------------------------------- basics
def length(e, n):
    x, y = e
    d = (y - x) % n
    return min(d, n - d)


def norm(e, n):
    x, y = e[0] % n, e[1] % n
    return (x, y) if x < y else (y, x)


def translate(M, i, n):
    return [norm((x + i, y + i), n) for (x, y) in M]


def verts(M):
    s = set()
    for x, y in M:
        s.add(x); s.add(y)
    return s


def is_matching(M):
    vs = [v for e in M for v in e]
    return len(vs) == len(set(vs)) and all(x != y for x, y in M)


def cyc_interval(a, b, n):
    """cyclic integer interval [a,b] mod n (a..b going upward)"""
    out = []
    x = a % n
    while True:
        out.append(x)
        if x == b % n:
            break
        x = (x + 1) % n
    return out


class Reject(Exception):
    pass


def need(cond, msg):
    if not cond:
        raise Reject(msg)


# ---------------------------------------------------------------- Section 4
def base_matchings(g):
    """M0, M1 of Section 4 (closed formulas), plus metadata."""
    n = 6 * g + 1
    u = 2 * g + 7
    N = g - 3
    c = 3 * g + 3
    P = lambda i: u + 2 * i
    Q = lambda i: u + 2 * i + 1
    M0 = [(c - j, c + 1 + j) for j in range(3, g - 3)]          # 3..g-4
    M0 += [(a, 3 * g + 6 - a) for a in range(6)]
    pi = lambda i: (P(i), P(N - 1 - i))
    ka = lambda i: (Q(i), Q(N - 2 - i))
    r = N % 4
    if r == 0:
        Mi = [pi(i) for i in range(2, N // 2)]
        Mi += [ka(i) for i in range(0, N // 2 - 1) if i != N // 4 - 1]
        Mi += [(Q(N // 2 - 1), Q(N - 1))]
    elif r == 2:
        Mi = [pi(i) for i in range(2, N // 2) if i != (N - 2) // 4]
        Mi += [ka(i) for i in range(0, N // 2 - 1)]
        Mi += [(Q(N // 2 - 1), Q(N - 1))]
    elif r == 1:
        Mi = [pi(i) for i in range(2, (N - 3) // 2 + 1) if i != (N - 1) // 4]
        Mi += [(P(0), P((N - 1) // 2))]
        Mi += [ka(i) for i in range(0, (N - 3) // 2 + 1)]
    else:
        Mi = [pi(i) for i in range(2, (N - 3) // 2 + 1) if i != (N + 1) // 4]
        Mi += [(P(1), P((N - 1) // 2))]
        Mi += [ka(i) for i in range(0, (N - 3) // 2 + 1)]
    # cross table 4.3 (x_a for a = 1..6)
    if g % 2 == 1:
        xs = [(3 * g - 11) // 2, 2 * g - 10, (g - 5) // 2, 2, 2 * g - 8, 0]
        claimed = [(5 * g + 1) // 2, 2 * g + 6, (5 * g + 3) // 2, 2 * g + 5, 2 * g + 7, 2 * g + 1]
    elif g % 4 == 0:
        xs = [(3 * g - 12) // 2, 2 * g - 10, (g - 4) // 2, 2 * g - 7, 2, 2 * g - 8]
        claimed = [(5 * g + 2) // 2, 2 * g + 6, (5 * g + 4) // 2, 2 * g + 5, 2 * g + 4, 2 * g + 8]
    else:
        xs = [(3 * g - 14) // 2, 2 * g - 10, (g - 2) // 2, 2 * g - 7, 0, 2 * g - 8]
        claimed = [(5 * g + 4) // 2, 2 * g + 6, (5 * g + 6) // 2, 2 * g + 5, 2 * g + 2, 2 * g + 8]
    Mc = [(a, u + xs[a - 1]) for a in range(1, 7)]
    M1 = Mi + Mc
    return n, [norm(e, n) for e in M0], [norm(e, n) for e in M1], \
        [norm(e, n) for e in Mi], [norm(e, n) for e in Mc], claimed


def check_base_claims(g, M0, M1, Mi, Mc, claimed):
    """the explicit length claims of 4.1-4.4"""
    n = 6 * g + 1
    W0 = set(range(0, 6)) | set(range(2 * g + 7, 4 * g + 1))
    W1 = set(range(1, 7)) | set(range(2 * g + 7, 4 * g + 1))
    need(is_matching(M0) and verts(M0) == W0 and len(M0) == g, "M0 not perfect on W0")
    need(is_matching(M1) and verts(M1) == W1 and len(M1) == g, "M1 not perfect on W1")
    L0in = sorted(length(e, n) for e in M0[:g - 6])
    L0x = sorted(length(e, n) for e in M0[g - 6:])
    need(L0in == list(range(7, 2 * g - 6, 2)), "M0 internal lengths")
    need(L0x == list(range(3 * g - 5, 3 * g + 1)), "M0 cross lengths")
    Lin = sorted(length(e, n) for e in Mi)
    need(Lin == [l for l in range(2, 2 * g - 9, 2) if l != 2 * g - 12], "M1 internal lengths")
    Lx = [length(e, n) for e in Mc]
    need(Lx == claimed, "M1 cross lengths != table %s vs %s" % (Lx, claimed))
    need(all(2 * g + 1 <= l <= 3 * g - 6 for l in Lx), "cross length range")
    S = [length(e, n) for e in M0 + M1]
    need(len(set(S)) == 2 * g, "lengths not distinct")
    need(not (set(S) & {1, 3, 5}), "length in {1,3,5}")
    return set(S)


# ---------------------------------------------------------------- Section 3
def base_classes(g, M0, M1):
    """E_c for c in Z_2n, E_c = K_{(4g+1)c}, K_{2i+e} = M_e + i"""
    n = 6 * g + 1
    E = []
    for c in range(2 * n):
        a = ((4 * g + 1) * c) % (2 * n)
        e, i = a % 2, a // 2
        E.append(translate(M1 if e else M0, i, n))
    return E


def check_lemma3(g, E):
    """windows of the base colouring are perfect; missing vertices x_c"""
    n = 6 * g + 1
    full = set(range(n))
    xs = []
    for c in range(2 * n):
        vs = []
        for d in range(3):
            vs += [v for e in E[(c + d) % (2 * n)] for v in e]
        need(len(vs) == len(set(vs)) == n - 1, "base window %d not perfect" % c)
        xs.append((full - set(vs)).pop())
    need(xs[:6] == [6, 0, 4 * g + 7, 4 * g + 1, 2 * g + 7, 2 * g + 1], "x_0..x_5")
    need(all(xs[(c + 6) % (2 * n)] == (xs[c] + 1) % n for c in range(2 * n)), "x_{c+6}=x_c+1")
    # listed vertex sets of colours 0..7
    I = lambda a, b: set(cyc_interval(a, b, n))
    listed = [I(0, 5) | I(2 * g + 7, 4 * g), I(2 * g + 1, 2 * g + 6) | I(4 * g + 7, 6 * g),
              I(4 * g + 1, 4 * g + 6) | I(7, 2 * g), I(1, 6) | I(2 * g + 7, 4 * g),
              {0} | I(2 * g + 1, 2 * g + 6) | I(4 * g + 8, 6 * g), I(4 * g + 2, 4 * g + 7) | I(7, 2 * g),
              I(1, 6) | I(2 * g + 8, 4 * g + 1), {0} | I(2 * g + 2, 2 * g + 7) | I(4 * g + 8, 6 * g)]
    for c in range(8):
        need(verts(E[c]) == listed[c], "V(E_%d) differs from listing" % c)


# ---------------------------------------------------------------- Section 5
def blocks(g, alpha_beta):
    n = 6 * g + 1
    X1 = [0, 2, 4] + list(range(7, 6 * g, 2))
    L1 = [norm((x, x + 1), n) for x in X1]
    I = lambda a, b: set(cyc_interval(a, b, n))
    V = [I(0, 5) | I(2 * g + 7, 4 * g), I(2 * g + 1, 2 * g + 6) | I(4 * g + 7, 6 * g),
         I(4 * g + 1, 4 * g + 6) | I(7, 2 * g)]
    B1 = [[e for e in L1 if e[0] in V[j] and e[1] in V[j]] for j in range(3)]
    B2 = [translate(F, 1, n) for F in B1]
    # block 3: V(E_{12+j}) = V(E_j)+2 : 6-interval [y,y+5] and (2g-6)-interval [z,...]
    yz = [(0 + 2, 2 * g + 7 + 2), (2 * g + 1 + 2, 4 * g + 7 + 2), (4 * g + 1 + 2, 7 + 2)]
    al, be = alpha_beta
    need(3 * al + 5 * be == g - 3 and al >= 0 and be >= 0, "bad (alpha,beta)")
    B3 = []
    for (y, z) in yz:
        F = [(y + t, y + t + 3) for t in range(3)]
        w = z
        for _ in range(al):
            F += [(w + t, w + t + 3) for t in range(3)]
            w += 6
        for _ in range(be):
            F += [(w + t, w + t + 5) for t in range(5)]
            w += 10
        need(w - z == 2 * g - 6, "block 3 partition length")
        B3.append([norm(e, n) for e in F])
    return B1, B2, B3


def assemble(E, inserts):
    """inserts: dict colour c -> block (list of 3 classes) inserted before E_c.
    Returns list of (edge, colour) and p."""
    seq = []
    for c in range(len(E)):
        if c in inserts:
            seq += inserts[c]
        seq.append(E[c])
    p = len(seq)
    out = []
    for col, cls in enumerate(seq):
        for e in cls:
            out.append((e, col))
    return out, p, seq


def check_coloured_graph(n, coloured, p, q, Delta_expected, allpairs=False):
    """from the definition: simple graph, Delta, per-vertex circular distances >= q,
    and exact counting bound |E|/((n-1)/2) == p/q == Delta + 2/3"""
    edges = [e for e, _ in coloured]
    need(all(0 <= x < n and 0 <= y < n and x != y for x, y in edges), "bad edge / loop")
    need(len(set(edges)) == len(edges), "repeated edge (graph not simple)")
    inc = [[] for _ in range(n)]
    for (x, y), c in coloured:
        need(0 <= c < p, "colour out of range")
        inc[x].append(c); inc[y].append(c)
    degs = [len(l) for l in inc]
    need(max(degs) == Delta_expected, "Delta = %d != %d" % (max(degs), Delta_expected))
    dist = lambda a, b: min((a - b) % p, (b - a) % p)
    for v in range(n):
        cs = sorted(inc[v])
        gaps = [(cs[(i + 1) % len(cs)] - cs[i]) % p for i in range(len(cs))]
        need(min(gaps) >= q, "vertex %d: colours too close" % v)
        if allpairs:
            for a, b in combinations(inc[v], 2):
                need(dist(a, b) >= q, "pair at vertex %d" % v)
    need(n % 2 == 1, "n even")
    m = (n - 1) // 2
    lower = Fraction(len(edges), m)
    upper = Fraction(p, q)
    need(lower == upper, "counting bound %s != p/q %s" % (lower, upper))
    need(upper == Delta_expected + Fraction(2, 3), "value != Delta + 2/3")
    return degs


def all_reps(g):
    return [(a, (g - 3 - 3 * a) // 5) for a in range((g - 3) // 3 + 1) if (g - 3 - 3 * a) % 5 == 0]


def check_theorem_A(g, allpairs=False, reps=None, mutate=None):
    n, M0, M1, Mi, Mc, claimed = base_matchings(g)
    if mutate:
        M0, M1, Mi, Mc = mutate("base", g, (M0, M1, Mi, Mc))
    S = check_base_claims(g, M0, M1, Mi, Mc, claimed) if not (mutate and mutate("skipclaims", g, None)) else None
    E = base_classes(g, M0, M1)
    # classes partition C_n(S)
    allE = [e for cls in E for e in cls]
    Slen = {length(e, n) for e in M0 + M1}
    need(len(allE) == len(set(allE)) == 2 * g * n, "base classes do not partition")
    need({length(e, n) for e in allE} == Slen, "base lengths")
    check_lemma3(g, E)
    results = []
    for ab in (reps or all_reps(g)):
        B1, B2, B3 = blocks(g, ab)
        if mutate:
            B1, B2, B3 = mutate("blocks", g, (B1, B2, B3))
        struct = not (mutate and mutate("skipstruct", g, None))
        for j in (range(3) if struct else []):
            need(is_matching(B1[j]) and verts(B1[j]) == verts(E[j]), "block1 class %d" % j)
            need(is_matching(B2[j]) and verts(B2[j]) == verts(E[6 + j]), "block2 class %d" % j)
            need(is_matching(B3[j]) and verts(B3[j]) == verts(E[12 + j]), "block3 class %d" % j)
        if struct:
            need(all(length(e, n) == 1 for F in B1 + B2 for e in F), "blocks 1,2 lengths")
            need(all(length(e, n) in (3, 5) for F in B3 for e in F), "block 3 lengths")
        ins = {0: B1, 6: B2, 12: B3}
        if mutate:
            ins = mutate("inserts", g, ins)
        coloured, p, seq = assemble(E, ins)
        if mutate:
            coloured, p = mutate("coloured", g, (coloured, p))
        need(p == 2 * n + 9 == 3 * (4 * g + 3) + 2, "p")
        q = mutate("q", g, 3) if mutate else 3
        degs = check_coloured_graph(n, coloured, p, q, 4 * g + 3, allpairs)
        low = sorted(v for v in range(n) if degs[v] < 4 * g + 3)
        need(low == [6, 7, 8] and all(degs[v] == 4 * g + 2 for v in low), "degree pattern")
        need(len(coloured) == 2 * g * n + 9 * g, "edge count")
        results.append(ab)
    return results


# ---------------------------------------------------------------- certificates
def check_certificate(C, allpairs=True):
    g, n, k = C["g"], C["n"], C["k"]
    need(n == 6 * g + 1, "n")
    M0 = [norm(e, n) for e in C["M0"]]
    M1 = [norm(e, n) for e in C["M1"]]
    W0 = set(range(0, k)) | set(range(2 * g + 1 + k, 4 * g + 1))
    W1 = set(range(1, k + 1)) | set(range(2 * g + 1 + k, 4 * g + 1))
    need(is_matching(M0) and verts(M0) == W0 and len(M0) == g, "cert M0")
    need(is_matching(M1) and verts(M1) == W1 and len(M1) == g, "cert M1")
    S = [length(e, n) for e in M0 + M1]
    need(len(set(S)) == 2 * g, "cert lengths not distinct")
    E = base_classes(g, M0, M1)
    cols = C["block_colours"]
    need(len(cols) == 3 and len(C["blocks"]) == 3, "three blocks")
    ins = {}
    for c, blk in zip(cols, C["blocks"]):
        need(len(blk) == 3, "block size")
        ins[c] = [[norm(e, n) for e in F] for F in blk]
    coloured, p, seq = assemble(E, ins)
    need(p == 2 * n + 9, "cert p")
    # everything else purely from the definition (does not use any window lemma)
    check_coloured_graph(n, coloured, p, 3, 4 * g + 3, allpairs)
    need(len(coloured) == 2 * g * n + 9 * g, "cert edge count")
    return g, k, cols, Fraction(p, 3)


# ---------------------------------------------------------------- general-k remark
def check_general_k(gmax):
    bad = []
    for g in range(2, gmax + 1):
        n = 6 * g + 1
        for k in range(1, 2 * g):
            W0 = set(range(0, k)) | set(range(2 * g + 1 + k, 4 * g + 1))
            W1 = set(range(1, k + 1)) | set(range(2 * g + 1 + k, 4 * g + 1))
            Vs = []
            for c in range(2 * n):
                a = ((4 * g + 1) * c) % (2 * n)
                W = W1 if a % 2 else W0
                Vs.append({(x + a // 2) % n for x in W})
            for c in range(2 * n):
                A, B, Cc = Vs[c], Vs[(c + 1) % (2 * n)], Vs[(c + 2) % (2 * n)]
                if A & B or B & Cc or A & Cc:
                    bad.append((g, k)); break
    return bad


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    gmin = int(args[0]) if len(args) > 0 else 15
    gmax = int(args[1]) if len(args) > 1 else 80
    gall = int(args[2]) if len(args) > 2 else 40
    cert = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "certificates.json")
    if "--certs" in sys.argv:
        cert = sys.argv[sys.argv.index("--certs") + 1]
    nrep = 0
    for g in range(gmin, gmax + 1):
        reps = check_theorem_A(g, allpairs=(g <= gall))
        nrep += len(reps)
        print("g=%d n=%d Delta=%d p=%d value=%s reps(alpha,beta)=%s%s OK" % (
            g, 6 * g + 1, 4 * g + 3, 12 * g + 11, Fraction(12 * g + 11, 3), reps,
            " allpairs" if g <= gall else ""))
    print("Theorem A: g=%d..%d all pass (%d (alpha,beta) choices in total)" % (gmin, gmax, nrep))
    for C in json.load(open(cert)):
        g, k, cols, val = check_certificate(C)
        print("certificate g=%d k=%d colours=%s Delta=%d value=%s OK (all pairs)" % (g, k, cols, 4 * g + 3, val))
    bad = check_general_k(20)
    print("general-k window remark, g=2..20, k=1..2g-1: failures =", bad)
    print("REFEREE VERIFIER: ALL CHECKS PASSED")


if __name__ == "__main__":
    main()
