#!/usr/bin/env python3
"""verify.py -- standard library only.  Graphs with Delta = 4g+3 and chi'_c = Delta + 2/3.

Run from the repository root:
  python3 results/circular-index-upper-half-delta-3-mod-4/verify.py [GMAX]
(explicit family 15 <= g <= GMAX, default 60; then the certificates of Proposition B
from certificates.json next to this script; then six negative controls).

Construction (see PROOF.md, Sections 3-7): n = 6g+1, vertex set Z_n.
  W0 = [0,k-1] u [2g+1+k, 4g],  W1 = [1,k] u [2g+1+k, 4g]  (k = 6 in the explicit family;
  the certificates use k in {2, 3, 4, 6})
  M0, M1 perfect matchings of W0, W1 with 2g pairwise distinct lengths  ->  S, G0 = C_n(S).
  class K_{2i+e} = M_e + i (a in Z_{2n}); base colour of K_a is 3a (mod 2n), i.e. E_c = K_{(4g+1)c}.
  Three insertion blocks (F_1,F_2,F_3) inserted before base colours c_1 < c_2 < c_3, V(F_j) = V(E_{c+j-1}).
  Final colouring: cyclic sequence of 2n+9 classes, colour = position.
Checks, for every g in the range: matchings and lengths, simplicity, degrees (Delta = 4g+3),
|E| = 2gn+9g, and the (2n+9,3)-colouring PER VERTEX from the definition; |E|/m = (2n+9)/3 with m = 3g.
"""
import sys, json, os

HERE = os.path.dirname(os.path.abspath(__file__))


def length(n, a, b):
    d = (b - a) % n
    return min(d, n - d)


# ---------------------------------------------------------------- explicit base (k = 6)
def explicit_base(g):
    assert g >= 15
    n = 6 * g + 1
    u = 2 * g + 7            # B = [u, 4g], |B| = 2g-6
    N = g - 3                # size of each parity class of B
    c = 3 * g + 3
    M0 = [(c - j, c + 1 + j) for j in range(3, g - 3)] + [(a, 3 * g + 6 - a) for a in range(6)]
    P = [(i, N - 1 - i) for i in range(N) if N - 1 - 2 * i >= 1]     # nest in class P (x = 2i)
    Q = [(i, N - 2 - i) for i in range(N) if N - 2 - 2 * i >= 1]     # nest in class Q (x = 2i+1)
    if N % 4 == 0:
        P = [e for e in P if e[0] >= 2]
        Q = [e for e in Q if e != (N // 4 - 1, 3 * N // 4 - 1)] + [(N // 2 - 1, N - 1)]
    elif N % 4 == 2:
        P = [e for e in P if e[0] >= 2 and e != ((N - 2) // 4, (3 * N - 2) // 4)]
        Q = Q + [(N // 2 - 1, N - 1)]
    elif N % 4 == 1:
        P = [e for e in P if e[0] >= 2 and e != ((N - 1) // 4, 3 * (N - 1) // 4)] + [(0, (N - 1) // 2)]
    else:  # N % 4 == 3
        P = [e for e in P if e[0] >= 2 and e != ((N + 1) // 4, (3 * N - 5) // 4)] + [(1, (N - 1) // 2)]
    M1 = [(u + 2 * a, u + 2 * b) for a, b in P] + [(u + 2 * a + 1, u + 2 * b + 1) for a, b in Q]
    if g % 2 == 1:
        xs = [(3 * g - 11) // 2, 2 * g - 10, (g - 5) // 2, 2, 2 * g - 8, 0]
    elif g % 4 == 0:
        xs = [(3 * g - 12) // 2, 2 * g - 10, (g - 4) // 2, 2 * g - 7, 2, 2 * g - 8]
    else:
        xs = [(3 * g - 14) // 2, 2 * g - 10, (g - 2) // 2, 2 * g - 7, 0, 2 * g - 8]
    M1 += [(a, u + x) for a, x in zip(range(1, 7), xs)]
    return M0, M1


def explicit_blocks(g, V):
    """V(c) = vertex set of base class of colour c. Returns [(c, [F1,F2,F3]), ...]."""
    n = 6 * g + 1
    X1 = [0, 2, 4] + list(range(7, 6 * g, 2))
    out = []
    for c0, X in ((0, X1), (6, [x + 1 for x in X1])):
        Fs = []
        for j in range(3):
            S = V(c0 + j)
            Fs.append([(x % n, (x + 1) % n) for x in X if x % n in S])
        out.append((c0, Fs))
    # block 3 at colour 12: intervals of sizes 6 and 2g-6; lengths 3 and 5
    al = next(a for a in range(0, g) if (g - 3 - 3 * a) >= 0 and (g - 3 - 3 * a) % 5 == 0)
    be = (g - 3 - 3 * al) // 5
    Fs = []
    for j in range(3):
        S = V(12 + j)
        starts = [x for x in S if (x - 1) % n not in S]
        F = []
        for s in starts:
            size = 0
            while (s + size) % n in S:
                size += 1
            if size == 6:
                F += [((s + t) % n, (s + t + 3) % n) for t in range(3)]
            else:
                assert size == 2 * g - 6, size
                pos = s
                for _ in range(al):
                    F += [((pos + t) % n, (pos + t + 3) % n) for t in range(3)]; pos += 6
                for _ in range(be):
                    F += [((pos + t) % n, (pos + t + 5) % n) for t in range(5)]; pos += 10
        Fs.append(F)
    out.append((12, Fs))
    return out


# ---------------------------------------------------------------- generic checker
def check(g, k, M0, M1, blocks_fn=None, blocks=None, q=3, verbose=False, structural=True, mutate_seq=None):
    n = 6 * g + 1
    W0 = set(range(0, k)) | set(range(2 * g + 1 + k, 4 * g + 1))
    W1 = set(range(1, k + 1)) | set(range(2 * g + 1 + k, 4 * g + 1))
    for M, W in ((M0, W0), (M1, W1)):
        vs = [x % n for e in M for x in e]
        assert len(M) == g and len(vs) == len(set(vs)) and set(vs) == W, "base matching not perfect on W"
    lens = [length(n, a, b) for a, b in list(M0) + list(M1)]
    assert len(set(lens)) == 2 * g and min(lens) >= 1, "base lengths not distinct"
    two_n = 2 * n

    def K(a):
        a %= two_n
        i, e = a // 2, a % 2
        return [((x + i) % n, (y + i) % n) for x, y in (M0 if e == 0 else M1)]

    inv3 = 4 * g + 1
    assert (3 * inv3) % two_n == 1
    E = lambda c: K(inv3 * c)
    V = lambda c: {x for e in E(c) for x in e}
    if blocks is None:
        blocks = blocks_fn(g, V)
    cs = [c for c, _ in blocks]
    assert len(cs) == 3 and cs == sorted(cs) and all(0 <= c < two_n for c in cs)
    for i in range(3):   # insertion points separated by >= q-1 = 2 base classes (cyclically)
        gap = (cs[(i + 1) % 3] - cs[i]) % two_n
        assert gap >= q - 1, "blocks too close"
    for c, Fs in blocks:
        for j, F in enumerate(Fs):
            vs = [x % n for e in F for x in e]
            assert len(vs) == len(set(vs)), "block class not a matching"
            if structural:   # documentation of the insertion form; not needed for the colouring check below
                assert set(vs) == V(c + j), "block class does not copy V(E_{c+j})"
    # sequence of classes
    seq = []
    for c in range(two_n):
        for cb, Fs in blocks:
            if cb == c:
                seq += [list(F) for F in Fs]
        seq.append(E(c))
    if mutate_seq:
        mutate_seq(seq)
    p = len(seq)
    assert p == two_n + 9
    edges = {}
    inc = {v: [] for v in range(n)}
    for col, cls in enumerate(seq):
        for a, b in cls:
            a %= n; b %= n
            assert a != b
            key = frozenset((a, b))
            assert key not in edges, "multi-edge (graph not simple / classes overlap)"
            edges[key] = col
            inc[a].append(col); inc[b].append(col)
    # base graph is C_n(S)
    S = set(lens)
    base_edges = {frozenset((x, (x + s) % n)) for x in range(n) for s in S}
    assert base_edges <= set(edges), "base classes do not cover C_n(S)"
    assert len(base_edges) == 2 * g * n
    nE = len(edges)
    assert nE == 2 * g * n + 9 * g
    degs = [len(inc[v]) for v in range(n)]
    D = max(degs)
    assert D == 4 * g + 3, D
    # (p,q)-colouring check per vertex
    for v in range(n):
        cols = sorted(inc[v])
        for i in range(len(cols)):
            gap = (cols[(i + 1) % len(cols)] - cols[i]) % p
            if gap < q:
                raise AssertionError(f"vertex {v}: colours {cols[i]},{cols[(i+1)%len(cols)]} too close")
    m = 3 * g
    # lower bound |E|/m equals p/3 exactly; Delta + 1/2 < p/3 < Delta + 1
    assert 3 * nE == p * m
    assert 2 * p > 3 * (2 * D + 1) and p < 3 * (D + 1)
    if verbose:
        print(f"g={g} n={n} Delta={D} |E|={nE} p={p} chi'_c={p}/3 = Delta+2/3  OK")
    return True


def explicit_lengths_report(g):
    n = 6 * g + 1
    M0, M1 = explicit_base(g)
    L0 = sorted(length(n, a, b) for a, b in M0)
    L1 = sorted(length(n, a, b) for a, b in M1)
    S = set(L0) | set(L1)
    assert not (S & {1, 3, 5})
    # internal lengths as claimed
    assert [l for l in L0 if l < 2 * g] == list(range(7, 2 * g - 6, 2))
    assert [l for l in L1 if l < 2 * g] == [l for l in range(2, 2 * g - 9, 2) if l != 2 * g - 12]
    assert [l for l in L0 if l > 2 * g] == list(range(3 * g - 5, 3 * g + 1))
    return True


def neg_controls():
    g = 15
    M0, M1 = explicit_base(g)
    bad = []
    # (a) q = 4 must fail
    try:
        check(g, 6, M0, M1, explicit_blocks, q=4); bad.append('q=4 accepted')
    except AssertionError as ex:
        print('   control (a) rejected:', ex)
    # (b) M1 := M0 + 1 (bad base)
    try:
        check(g, 6, M0, [((a + 1) % (6 * g + 1), (b + 1) % (6 * g + 1)) for a, b in M0], explicit_blocks)
        bad.append('M1=M0+1 accepted')
    except AssertionError as ex:
        print('   control (b) rejected:', ex)
    # (c) rewire two edges of M1 on the same vertex set
    M1b = list(M1)
    (a, b), (c, d) = M1b[0], M1b[1]
    M1b[0], M1b[1] = (a, c), (b, d)
    try:
        check(g, 6, M0, M1b, explicit_blocks); bad.append('rewired M1 accepted')
    except AssertionError as ex:
        print('   control (c) rejected:', ex)
    # (d) block 3 replaced by a copy of block 1 shifted to colour 12 (length-1 edges reused)
    def bl(g_, V):
        b = explicit_blocks(g_, V)
        return [b[0], b[1], (12, [[((x + 2) % (6 * g_ + 1), (y + 2) % (6 * g_ + 1)) for x, y in F] for F in b[0][1]])]
    try:
        check(g, 6, M0, M1, bl); bad.append('duplicate-edge block accepted')
    except AssertionError as ex:
        print('   control (d) rejected:', ex)
    # (e) swap two classes inside block 3
    def bl2(g_, V):
        b = explicit_blocks(g_, V)
        c, Fs = b[2]
        return [b[0], b[1], (c, [Fs[1], Fs[0], Fs[2]])]
    try:
        check(g, 6, M0, M1, bl2, structural=False); bad.append('swapped block classes accepted')
    except AssertionError as ex:
        print('   control (e) rejected:', ex)
    # (f) swap two consecutive base classes in the final sequence (per-vertex check must catch it)
    def mut(seq):
        seq[20], seq[21] = seq[21], seq[20]
    try:
        check(g, 6, M0, M1, explicit_blocks, mutate_seq=mut); bad.append('swapped base classes accepted')
    except AssertionError as ex:
        print('   control (f) rejected:', ex)
    return bad


if __name__ == '__main__':
    GMAX = int(sys.argv[1]) if len(sys.argv) > 1 else 60
    for g in range(15, GMAX + 1):
        M0, M1 = explicit_base(g)
        explicit_lengths_report(g)
        check(g, 6, M0, M1, explicit_blocks, verbose=(g <= 18 or g == GMAX))
    print(f"explicit family: all 15 <= g <= {GMAX} pass (Delta = 4g+3 = 63 .. {4*GMAX+3})")
    with open(os.path.join(HERE, 'certificates.json')) as fh:
        certs = json.load(fh)
    assert sorted(cert['g'] for cert in certs) == list(range(6, 15)), "expected certificates for g = 6..14"
    for cert in certs:
        assert cert['n'] == 6 * cert['g'] + 1
        blocks = [(c, [[tuple(e) for e in F] for F in Fs]) for c, Fs in zip(cert['block_colours'], cert['blocks'])]
        check(cert['g'], cert['k'], [tuple(e) for e in cert['M0']], [tuple(e) for e in cert['M1']],
              blocks=blocks, verbose=True)
    print("certificates: all 9 pass (g = 6..14, Delta = 27..59)")
    bad = neg_controls()
    assert not bad, bad
    print("negative controls: all 6 rejected")
    print("ALL CHECKS PASSED")
