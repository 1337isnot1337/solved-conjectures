#!/usr/bin/env python3
"""Standard-library verification of the Part 2 certificates (data/part2_certificates.json).
For every certificate: builds the full colour sequence, checks it is a perfect (p,q)-edge-colouring
(every q consecutive classes form a matching covering n-1 vertices), that the coloured edges are a
simple graph (no edge twice), computes Delta and |E|/alpha' (alpha' <= (n-1)/2 since n is odd; the lower
bound of Lemma 1 then equals p/q), and for the regular circulants computes vertex connectivity with the
max-flow routine of verify.py.
Family B (non-regular, Delta = 4g+D, D = 1,2): base classes class(2i+e) = B_e + i on Z_n, n = 6g+1,
colour 3a mod 2n; block A (all edges {x,x+1}, x in {0} u {odd 3..6g-1}) inserted before colour 0 with
vertex sets of colours 0,1,2; block B (x in {1} u {even 4..6g}) inserted before colour 6 with vertex sets
of colours 6,7,8."""
import json, os, sys
from fractions import Fraction
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from verify import vertex_connectivity

HERE = os.path.dirname(os.path.abspath(__file__))
C = json.load(open(os.path.join(HERE, "data", "part2_certificates.json")))


def norm(e, n):
    a, b = e[0] % n, e[1] % n
    return (min(a, b), max(a, b))


def cyclic_classes(n, q, r, base):
    p = n * r
    cls = {}
    for a in range(p):
        rho, s = a % r, a // r
        cls[(q * a) % p] = [norm((x + s, y + s), n) for (x, y) in base[rho]]
    return [cls[c] for c in range(p)]


def check_sequence(n, q, seq):
    P = len(seq)
    E = [e for cl in seq for e in cl]
    assert len(E) == len(set(E)) and all(a != b for a, b in E), "not a simple edge set"
    for c in range(P):
        vs = [v for t in range(q) for e in seq[(c + t) % P] for v in e]
        assert len(vs) == len(set(vs)) == n - 1, ("window", c)
    deg = [0] * n
    for a, b in E:
        deg[a] += 1; deg[b] += 1
    m = (n - 1) // 2
    lb = Fraction(len(E), m)          # |E| / alpha' with alpha' <= m
    assert lb == Fraction(P, q)
    return E, deg, lb


def insert(seq, blocks):
    """blocks: dict colour -> list of q classes inserted just before that colour."""
    out = []
    for c, cl in enumerate(seq):
        if c in blocks: out.extend(blocks[c])
        out.append(cl)
    return out


def length1_block(n, seq, c0, q, X):
    edges = [norm((x, x + 1), n) for x in X]
    blk = []
    for t in range(q):
        V = {v for e in seq[c0 + t] for v in e}
        blk.append([e for e in edges if e[0] in V and e[1] in V])
    assert sorted(e for b in blk for e in b) == sorted(edges), "length-1 edges not split by the window"
    return blk


ok = True
for cert in C["cyclic"]:
    q, r, g = cert["q"], cert["r"], cert["g"]
    n = 2 * q * g + 1
    seq = cyclic_classes(n, q, r, cert["base"])
    E, deg, val = check_sequence(n, q, seq)
    D = max(deg)
    assert min(deg) == D and val - D == Fraction(r, q)
    k = vertex_connectivity(n, set(E), all_pairs=False)
    print("%-28s n=%d Delta=%d regular, chi'_c = %s = Delta + %s, kappa = %d" % (cert["name"], n, D, val, val - D, k))
    ok &= (k == D)

d = C["delta21"]; g = d["g"]; n = 6 * g + 1
seq = cyclic_classes(n, 3, 2, d["base"])
seq = insert(seq, {0: [[norm(e, n) for e in F] for F in d["block_before_colour_0"]]})
E, deg, val = check_sequence(n, 3, seq)
print("Delta=21 example: n=%d Delta=%d degrees %s, chi'_c = %s = Delta + %s" % (n, max(deg), sorted(set(deg)), val, val - max(deg)))
ok &= (max(deg) == 21 and val == 21 + Fraction(2, 3))

for gs, W in sorted(C["familyB_bases"].items(), key=lambda kv: int(kv[0])):
    g = int(gs); n = 6 * g + 1
    I = set(range(2 * g + 3, 4 * g + 1))
    assert {v for e in W[0] for v in e} == {0, 1} | I and {v for e in W[1] for v in e} == {1, 2} | I
    lens = [min((b - a) % n, (a - b) % n) for B in W for a, b in B]
    assert 1 not in lens and len(set(lens)) == 2 * g
    seq0 = cyclic_classes(n, 3, 2, W)
    XA = [0] + list(range(3, 6 * g, 2)); XB = [1] + list(range(4, 6 * g + 1, 2))
    for D in (1, 2):
        blocks = {0: length1_block(n, seq0, 0, 3, XA)}
        if D == 2: blocks[6] = length1_block(n, seq0, 6, 3, XB)
        E, deg, val = check_sequence(n, 3, insert(seq0, blocks))
        assert max(deg) == 4 * g + D and val == 4 * g + D + Fraction(2, 3)
        print("family B g=%2d D=%d: n=%d Delta=%d chi'_c = %s = Delta + 2/3 (degrees %s)" % (g, D, n, max(deg), val, sorted(set(deg))))
print("ALL PART 2 CHECKS PASSED" if ok else "FAILURE")
sys.exit(0 if ok else 1)
