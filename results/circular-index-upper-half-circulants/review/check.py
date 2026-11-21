#!/usr/bin/env python3
"""Independent referee checks (written from scratch; does not import the authors' code).
Usage: python3 check.py [part]  where part in {fam, kappa, part2, lemmas}"""
import os
import sys, json, itertools, random
from fractions import Fraction
import networkx as nx

def circ(n, S):
    G = nx.Graph(); G.add_nodes_from(range(n))
    for x in range(n):
        for s in S:
            G.add_edge(x, (x + s) % n)
    return G

def E(e, n):
    a, b = e[0] % n, e[1] % n
    assert a != b
    return frozenset((a, b))

def proper_pq(n, colour, p, q):
    """colour: dict edge(frozenset)->int in Z_p. Check pairwise circular distance >= q at every vertex."""
    inc = {v: [] for v in range(n)}
    for e, c in colour.items():
        assert 0 <= c < p
        for v in e: inc[v].append(c)
    for v, cs in inc.items():
        for a, b in itertools.combinations(cs, 2):
            d = (a - b) % p
            if min(d, p - d) < q:
                return False, (v, a, b)
    return True, None

def alpha_prime(G):
    return len(nx.max_weight_matching(G, maxcardinality=True))

def family_colouring(g):
    n = 6 * g + 1; p = 2 * n
    M0 = [(0, 4 * g)] + [(2 * g + 1 + i, 4 * g - i) for i in range(1, g)]
    M1 = [(1, 3 * g + 1)] + [(2 * g + 1 + i, 4 * g + 1 - i) for i in range(1, g)]
    col = {}
    for a in range(p):
        eps, i = a % 2, a // 2
        for (x, y) in (M0 if eps == 0 else M1):
            e = E((x + i, y + i), n)
            assert e not in col, ("edge in two classes", g, e)
            col[e] = (3 * a) % p
    return n, col

def check_family(gmax=40, amax=12):
    for g in range(2, gmax + 1):
        n, col = family_colouring(g)
        S = list(range(1, 2 * g - 1)) + [2 * g + 1, 3 * g]
        G = circ(n, S)
        degs = {d for _, d in G.degree()}
        assert degs == {4 * g}, (g, degs)
        assert set(col) == {frozenset(e) for e in G.edges()}, ("colouring not of exactly G_g", g)
        assert len(set(col.values())) == 2 * n
        ok, w = proper_pq(n, col, 2 * n, 3)
        assert ok, (g, w)
        # lower bound: alpha' <= (n-1)/2 since n odd
        lb = Fraction(G.number_of_edges(), (n - 1) // 2)
        assert lb == Fraction(2 * n, 3) == 4 * g + Fraction(2, 3)
        if g <= amax:
            assert alpha_prime(G) == 3 * g
        # also check it is NOT a (2n,3)-colouring of something smaller: also non-edges uncoloured (implied)
    print("family g=2..%d: proper (2n,3)-colouring of exactly G_g, |E|/floor(n/2)=2n/3; alpha' computed for g<=%d" % (gmax, amax))

def kappa_checks():
    for g in range(2, 8):
        n = 6 * g + 1
        S = list(range(1, 2 * g - 1)) + [2 * g + 1, 3 * g]
        G = circ(n, S)
        k = nx.node_connectivity(G)
        print("G_%d n=%d kappa=%d (4g=%d)" % (g, n, k, 4 * g), flush=True)
        assert k == 4 * g
    for n, S in [(25, [1,2,3,7,8,9,10,11,12]), (31, [1,2,3,7,8,9,10,11,12]), (33, [1,2,3,4,5,9,10,11,12,13,14,15]), (7, [1, 2])]:
        G = circ(n, S)
        print("C_%d%s kappa=%d deg=%s" % (n, S, nx.node_connectivity(G), {d for _, d in G.degree()}), flush=True)

def cyclic(n, q, r, base):
    p = n * r
    col = {}
    for a in range(p):
        rho, s = a % r, a // r
        for (x, y) in base[rho]:
            e = E((x + s, y + s), n)
            assert e not in col, "edge coloured twice"
            col[e] = (q * a) % p
    return p, col

def seq_from_col(p, col):
    seq = [[] for _ in range(p)]
    for e, c in col.items(): seq[c].append(e)
    return seq

def check_seq(n, q, seq, label, conn=False, expect_regular=None):
    """seq: list of classes (lists of frozensets), colour = index. Independent checks."""
    P = len(seq)
    edges = [e for cl in seq for e in cl]
    assert len(edges) == len(set(edges)), label + ": multi-edge"
    col = {}
    for c, cl in enumerate(seq):
        for e in cl: col[e] = c
    ok, w = proper_pq(n, col, P, q)
    assert ok, (label, w)
    G = nx.Graph(); G.add_nodes_from(range(n)); G.add_edges_from(tuple(e) for e in edges)
    D = max(d for _, d in G.degree()); dmin = min(d for _, d in G.degree())
    ap = alpha_prime(G)
    lb = Fraction(len(edges), ap)
    up = Fraction(P, q)
    s = "%s: n=%d |E|=%d Delta=%d delta=%d alpha'=%d |E|/alpha'=%s  p/q=%s  value-Delta=%s" % (label, n, len(edges), D, dmin, ap, lb, up, up - D)
    assert lb == up, s + "  LOWER != UPPER"
    if conn:
        s += " kappa=%d" % nx.node_connectivity(G)
    print(s, flush=True)
    return G, D, up

def window_missed(n, q, seq):
    P = len(seq); xs = []
    for c in range(P):
        V = set(v for t in range(q) for e in seq[(c + t) % P] for v in e)
        miss = set(range(n)) - V
        assert len(miss) == 1, "not perfect"
        xs.append(miss.pop())
    return xs

def Vset(cl): return set(v for e in cl for v in e)

def structural_lemma_test(n, q, seq, label):
    P = len(seq); xs = window_missed(n, q, seq)
    for c in range(P):
        lhs = Vset(seq[(c + q) % P]); rhs = (Vset(seq[c]) | {xs[c]}) - {xs[(c + 1) % P]}
        assert lhs == rhs, (label, c)
    print("  structural identity V(E_{c+q}) = (V(E_c)+x_c)-x_{c+1} holds for all c (%s)" % label)

def runs(W, n):
    W = set(W); return sum(1 for x in W if (x + 1) % n not in W)

def part2():
    C = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "data", "part2_certificates.json")))
    for cert in C["cyclic"]:
        q, r, g = cert["q"], cert["r"], cert["g"]
        n = int(cert["name"].split("(")[0].split("_")[1])
        p, col = cyclic(n, q, r, cert["base"])
        seq = seq_from_col(p, col)
        G, D, val = check_seq(n, q, seq, cert["name"], conn=True)
        S = sorted(set(min((b - a) % n, (a - b) % n) for B in cert["base"] for a, b in B))
        print("  lengths used:", S, " graph == circulant:", nx.utils.graphs_equal(G, circ(n, S)) if hasattr(nx.utils, 'graphs_equal') else set(map(frozenset, G.edges())) == set(map(frozenset, circ(n, S).edges())))
        structural_lemma_test(n, q, seq, cert["name"])
        print("  runs of base vertex sets:", [runs(Vset([E(e, n) for e in B]), n) for B in cert["base"]], "r =", r)
    # Theorem 1 small cases structural lemma
    for g in (2, 3, 5):
        n, col = family_colouring(g); seq = seq_from_col(2 * n, col)
        structural_lemma_test(n, 3, seq, "G_%d" % g)
    # Delta 21
    d = C["delta21"]; g = d["g"]; n = 6 * g + 1
    p, col = cyclic(n, 3, 2, d["base"]); seq = seq_from_col(p, col)
    blk = [[E(e, n) for e in F] for F in d["block_before_colour_0"]]
    # insertion lemma hypotheses
    Gbase = set(e for cl in seq for e in cl)
    for j in range(3):
        assert Vset(blk[j]) == Vset(seq[len(seq)-3+j]), "block vertex set mismatch (mirror form)"
        assert not (set(blk[j]) & Gbase), "inserted edge already in G"
        assert len(Vset(blk[j])) == 2 * len(blk[j])
    seq2 = blk + seq
    check_seq(n, 3, seq2, "Delta21", conn=True)
    # Family B
    for gs, W in sorted(C["familyB_bases"].items(), key=lambda kv: int(kv[0])):
        g = int(gs); n = 6 * g + 1
        I = set(range(2 * g + 3, 4 * g + 1))
        assert Vset([E(e, n) for e in W[0]]) == {0, 1} | I and Vset([E(e, n) for e in W[1]]) == {1, 2} | I
        p, col = cyclic(n, 3, 2, W); seq = seq_from_col(p, col)
        base_edges = set(col)
        XA = [0] + list(range(3, 6 * g, 2)); XB = [1] + list(range(4, 6 * g + 1, 2))
        def block(c0, X):
            ed = [E((x, x + 1), n) for x in X]
            assert not (set(ed) & base_edges)
            out = []
            for t in range(3):
                V = Vset(seq[c0 + t]); out.append([e for e in ed if e <= V])
            assert sorted(map(sorted, (e for b in out for e in b))) == sorted(map(sorted, ed))
            for t in range(3): assert Vset(out[t]) == Vset(seq[c0 + t]), ("block does not cover class", g, c0, t)
            return out
        A = block(0, XA); B = block(6, XB)
        assert not (set(e for b in A for e in b) & set(e for b in B for e in b))
        s1 = A + seq
        s2 = A + seq[:6] + B + seq[6:]
        _, D1, v1 = check_seq(n, 3, s1, "FamB g=%d D=1" % g)
        _, D2, v2 = check_seq(n, 3, s2, "FamB g=%d D=2" % g)
        assert D1 == 4 * g + 1 and D2 == 4 * g + 2

def theorem2():
    n = 25; B = [[(0,1),(2,9),(10,24)], [(0,2),(1,10),(11,24)], [(0,3),(1,11),(2,10)]]
    p, col = cyclic(n, 4, 3, B)
    assert set(col) == set(frozenset(e) for e in circ(25, [1,2,3,7,8,9,10,11,12]).edges())
    seq = seq_from_col(p, col)
    check_seq(n, 4, seq, "Thm2 C_25", conn=True)
    structural_lemma_test(n, 4, seq, "Thm2")
    # hand-check the nine translates
    W = [Vset([E(e, n) for e in b]) for b in B]
    for (r, r2, dl) in [(0,1,6),(1,2,6),(2,0,7),(0,2,12),(1,0,13),(2,1,13),(0,0,19),(1,1,19),(2,2,19)]:
        assert not (W[r] & {(x + dl) % n for x in W[r2]})
    # recompute the triples
    tr = set()
    for a in range(75):
        for t in (1, 2, 3):
            b = (a + 19 * t) % 75
            tr.add((a % 3, b % 3, ((b // 3) - (a // 3)) % 25))
    print("  Thm2 triples recomputed:", sorted(tr))

if __name__ == "__main__":
    part = sys.argv[1]
    if part == "fam": check_family()
    if part == "kappa": kappa_checks()
    if part == "part2": theorem2(); part2()
