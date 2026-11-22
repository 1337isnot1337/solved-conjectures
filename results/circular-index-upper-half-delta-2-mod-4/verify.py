"""verify.py -- standard library only.  Run:  python3 verify.py [GMAX]   (default GMAX = 60)

Checks, from the definitions, every claim of PROOF.md that is a finite computation:

Part 1 (Theorem 1, Family B with the explicit base of Section 3), for 6 <= g <= GMAX:
  * the base matchings M_0, M_1 (formulas of Section 3; g = 6 from certificates.json) are matchings,
    V(M_0) = W_0 = {0,1} u [2g+3,4g], V(M_1) = W_1 = {1,2} u [2g+3,4g];
  * their 2g circulant lengths are pairwise distinct and != 1, and the internal lengths are 2..2g-3;
  * the 2n classes class(2i+e) = M_e + i partition E(C_n(S));
  * the windows of the base colouring are near-perfect matchings (perfect (2n,3)-colouring);
  * the two insertion blocks (length-1 edges, x-sets X_1, X_2) have V(F_j) = V(class of colour c+j-1);
  * the final graph G is simple, Delta(G) = 4g+2 (and 4g+1 after the first insertion only),
    the final cyclic sequence of 2n+6 (resp. 2n+3) classes is a (p,3)-edge-colouring, checked per vertex
    (all incident colours pairwise at circular distance >= 3), and |E|/((n-1)/2) = p/3.
    Since n is odd, alpha' <= (n-1)/2, so chi'_c = p/3 = Delta + 2/3 by Lemmas 1-2.
Part 2: the (3n-1,3)-colourings of K_n - tK_2 for n = 11, 15, 19, 23, 27 (certificates.json):
  edge set = E(K_n) minus a matching F of t = (n-3)/4 edges, F misses a vertex (Delta = n-1),
  2t < m = (n-1)/2, colouring valid per vertex; hence Delta + 1/2 < n - t/m <= chi'_c <= (3n-1)/3 < Delta + 1.
"""
import json, os, sys
from fractions import Fraction

HERE = os.path.dirname(os.path.abspath(__file__))


def check_colouring(nv, edges, col, p, q):
    """edges: list of 2-tuples, col: list of ints in Z_p; checks (p,q)-colouring per vertex."""
    inc = [[] for _ in range(nv)]
    for (a, b), c in zip(edges, col):
        assert 0 <= c < p
        inc[a].append(c); inc[b].append(c)
    for v in range(nv):
        cs = sorted(inc[v])
        for i in range(len(cs)):
            d = (cs[(i + 1) % len(cs)] - cs[i]) % p if len(cs) > 1 else p
            assert d >= q, ("vertex", v, cs)
    return max(len(x) for x in inc), min(len(x) for x in inc)


def base_matchings(g, cert6=None):
    """Return (M0, M1) as lists of 2-tuples of vertices of Z_{6g+1} (Section 3 of PROOF.md)."""
    if g == 6:
        return [tuple(e) for e in cert6[0]], [tuple(e) for e in cert6[1]]
    assert g >= 7
    M0 = [(0, 3*g + 2), (1, 3*g + 1)] + [(3*g + 1 - j, 3*g + 2 + j) for j in range(1, g - 1)]
    if g % 2 == 1:
        M1 = [(2, 3*g), (1, 4*g - 1)]
        M1 += [(2*g + 4 + 2*x, 4*g - 2*x) for x in range(0, (g - 3)//2 + 1)]
        M1 += [(3*g - 2*j, 3*g + 2*j) for j in range(1, (g - 3)//2 + 1)]
    else:
        M1 = [(2, 3*g), (1, 2*g + 5), (2*g + 3, 4*g - 1)]
        M1 += [(2*g + 3 + 2*j, 4*g + 1 - 2*j) for j in range(2, (g - 2)//2 + 1)]
        if g % 4 == 2:
            M1 += [(2*g + 4, 4*g - 2)]
            M1 += [(3*g - 4*i, 3*g + 4*i) for i in range(1, (g - 6)//4 + 1)]
            M1 += [(3*g + 6 - 4*i, 3*g + 2 + 4*i) for i in range(1, (g - 2)//4 + 1)]
        else:
            M1 += [(2*g + 6, 4*g)]
            M1 += [(3*g - 4*i, 3*g + 4*i) for i in range(1, (g - 4)//4 + 1)]
            M1 += [(3*g + 6 - 4*i, 3*g + 2 + 4*i) for i in range(1, (g - 4)//4 + 1)]
    return M0, M1


def check_family_B(g, cert6, base=None):
    """base: optional (M0, M1) overriding the formulas (used by the negative controls)."""
    n = 6*g + 1
    m = (n - 1)//2
    ln = lambda a, b: min((a - b) % n, (b - a) % n)
    norm = lambda a, b: (min(a % n, b % n), max(a % n, b % n))
    M = base if base is not None else base_matchings(g, cert6)
    I = set(range(2*g + 3, 4*g + 1))
    W = [{0, 1} | I, {1, 2} | I]
    lengths = []
    for e in range(2):
        assert len(M[e]) == g
        V = [v for ed in M[e] for v in ed]
        assert len(V) == len(set(V)) == 2*g and set(V) == W[e], (g, e)
        lengths += [ln(*ed) for ed in M[e]]
    assert len(set(lengths)) == 2*g and 1 not in lengths and 0 not in lengths
    internal = sorted(ln(a, b) for e in range(2) for a, b in M[e] if a in I and b in I)
    assert internal == list(range(2, 2*g - 2)), internal
    S = set(lengths)
    # base graph and classes
    E0 = {norm(x, x + s) for x in range(n) for s in S}
    assert len(E0) == 2*g*n
    cls = []
    for a in range(2*n):
        i, e = divmod(a, 2)
        cls.append([norm(u + i, v + i) for u, v in M[e]])
    allc = [ed for C in cls for ed in C]
    assert len(allc) == len(set(allc)) == len(E0) and set(allc) == E0  # partition
    inv3 = pow(3, -1, 2*n)
    assert inv3 == 4*g + 1
    seq = [cls[(c * inv3) % (2*n)] for c in range(2*n)]  # seq[c] = class with colour c
    Vs = lambda C: {v for ed in C for v in ed}
    for c in range(2*n):  # perfect: each window of 3 consecutive colours is a matching of size m
        Wn = seq[c] + seq[(c + 1) % (2*n)] + seq[(c + 2) % (2*n)]
        assert len(Vs(Wn)) == 2*len(Wn) == 2*m
    # insertion blocks
    X1 = [0] + list(range(3, 6*g, 2))
    X2 = [1] + list(range(4, 6*g + 1, 2))
    blocks = []
    for X, c0 in ((X1, 0), (X2, 6)):
        Fs = []
        for j in range(3):
            target = Vs(seq[c0 + j])
            F = [norm(x, x + 1) for x in X if x in target]
            assert Vs(F) == target and len(Vs(F)) == 2*len(F), (g, c0, j)
            Fs.append(F)
        assert sum(len(F) for F in Fs) == m and all(norm(x, x+1) in [e for F in Fs for e in F] for x in X)
        blocks.append(Fs)
    b1 = {e for F in blocks[0] for e in F}; b2 = {e for F in blocks[1] for e in F}
    assert not (b1 & b2) and not (b1 & E0) and not (b2 & E0)
    results = []
    for nb in (1, 2):
        newseq = blocks[0] + seq[0:6] + (blocks[1] if nb == 2 else []) + seq[6:]
        p = len(newseq)
        assert p == 2*n + 3*nb
        edges = [ed for C in newseq for ed in C]
        col = [c for c, C in enumerate(newseq) for ed in C]
        assert len(edges) == len(set(edges))  # simple graph, each edge one colour
        Dmax, Dmin = check_colouring(n, edges, col, p, 3)
        assert Dmax == 4*g + nb
        val = Fraction(p, 3)
        assert Fraction(len(edges), m) == val and val == Dmax + Fraction(2, 3)
        results.append((Dmax, val))
    return results, sorted(S)


def check_KnF(c):
    n, F, p, q, edges, col = c['n'], c['F'], c['p'], c['q'], c['edges'], c['colour']
    m = (n - 1)//2
    t = len(F)
    Fs = {frozenset(e) for e in F}
    assert len(Fs) == t and len({v for e in F for v in e}) == 2*t  # F is a matching
    assert 2*t < n  # some vertex is missed by F, so Delta = n - 1
    expect = {frozenset((a, b)) for a in range(n) for b in range(a + 1, n)} - Fs
    assert len(edges) == len(expect) and {frozenset(e) for e in edges} == expect
    Dmax, _ = check_colouring(n, [tuple(e) for e in edges], col, p, q)
    assert Dmax == n - 1
    assert 2*t < m
    lower = Fraction(len(edges), m)
    upper = Fraction(p, q)
    assert Fraction(n - 1) + Fraction(1, 2) < lower <= upper < n
    return Dmax, lower, upper


if __name__ == "__main__":
    GMAX = int(sys.argv[1]) if len(sys.argv) > 1 else 60
    data = json.load(open(os.path.join(HERE, "certificates.json")))
    print("Part 1: Family B with explicit base matchings")
    for g in range(6, GMAX + 1):
        res, S = check_family_B(g, data["base_g6"])
        (d1, v1), (d2, v2) = res
        print("  g=%2d n=%3d  one block: Delta=%3d chi'_c=%s   two blocks: Delta=%3d chi'_c=%s" % (g, 6*g + 1, d1, v1, d2, v2))
    print("Part 2: K_n - tK_2 certificates")
    for c in data["Kn_minus_F"]:
        D, lo, up = check_KnF(c)
        print("  K_%d - %dK_2: Delta=%d, %s <= chi'_c <= %s, inside (Delta+1/2, Delta+1)" % (c['n'], len(c['F']), D, lo, up))
    print("Negative controls (each must be rejected)")
    ctrl = 0
    # (a) the final colouring is not a (p,4)-colouring; (b) swapping two adjacent classes breaks it;
    # (c) bad bases are rejected by check_family_B; (d) a duplicated block is rejected
    g = 7; n = 6*g + 1
    M = base_matchings(g)
    norm = lambda a, b: (min(a % n, b % n), max(a % n, b % n))
    cls = [[norm(u + a//2, v + a//2) for u, v in M[a % 2]] for a in range(2*n)]
    seq = [cls[(c * (4*g + 1)) % (2*n)] for c in range(2*n)]
    for name, sq, q in (("q=4", seq, 4), ("swap", seq[:5] + [seq[6], seq[5]] + seq[7:], 3)):
        try:
            check_colouring(n, [e for C in sq for e in C], [c for c, C in enumerate(sq) for e in C], len(sq), q)
            print("  control", name, "NOT rejected"); sys.exit(1)
        except AssertionError:
            ctrl += 1
    # (c) bad bases fed to check_family_B itself must be rejected:
    #     M_1 := M_0 + 1 (repeats every length; wrong vertex set) and M_1 rewired (same vertex set W_1)
    M0, M1 = base_matchings(9)
    (a0, b0), (a1, b1) = M1[0], M1[1]
    for name, bad in (("M1 := M0+1", (M[0], [(a + 1, b + 1) for a, b in M[0]])),
                      ("M1 rewired", (M0, [(a0, a1), (b0, b1)] + M1[2:]))):
        gg = 7 if name == "M1 := M0+1" else 9
        try:
            check_family_B(gg, None, base=bad)
            print("  control", name, "NOT rejected"); sys.exit(1)
        except AssertionError:
            ctrl += 1
    # (d) using block 1 twice (instead of block 1 and its translate) gives a multigraph: must be rejected
    Vs = lambda C: {v for ed in C for v in ed}
    X1 = [0] + list(range(3, 6*g, 2))
    blk = [[norm(x, x + 1) for x in X1 if x in Vs(seq[j])] for j in range(3)]
    sq = blk + seq[0:6] + blk + seq[6:]
    edges = [e for C in sq for e in C]
    if len(edges) == len(set(edges)):
        print("  control duplicate-block NOT rejected"); sys.exit(1)
    ctrl += 1
    print("  %d controls rejected as expected" % ctrl)
    print("ALL CHECKS PASSED")
