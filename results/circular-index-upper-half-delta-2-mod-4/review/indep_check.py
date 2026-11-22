"""Independent referee check of ../PROOF.md (Family B, explicit base).
Formulas retyped from PROOF.md Sections 3-4; colours assigned by a closed formula (not by building the
sequence of classes); colouring checked over ALL pairs of incident edges (numpy), from the definition.
Run:  nice -n 15 python3 -I indep_check.py [GBASE] [GCOL] [GALPHA]
"""
import os
_HERE = os.path.dirname(os.path.abspath(__file__))
import sys, json
from fractions import Fraction
import numpy as np

GBASE = int(sys.argv[1]) if len(sys.argv) > 1 else 200
GCOL = int(sys.argv[2]) if len(sys.argv) > 2 else 60
GALPHA = int(sys.argv[3]) if len(sys.argv) > 3 else 12


def M0f(g):
    return [(0, 3*g+2), (1, 3*g+1)] + [(3*g+1-j, 3*g+2+j) for j in range(1, g-1)]


def M1f(g):
    if g % 2:
        h = (g-3)//2
        return ([(2, 3*g), (1, 4*g-1)] + [(2*g+4+2*x, 4*g-2*x) for x in range(0, h+1)]
                + [(3*g-2*j, 3*g+2*j) for j in range(1, h+1)])
    E = [(1, 2*g+5), (2, 3*g), (2*g+3, 4*g-1)] + [(2*g+3+2*j, 4*g+1-2*j) for j in range(2, (g-2)//2+1)]
    if g % 4 == 2:
        O = ([(2*g+4, 4*g-2)] + [(3*g-4*i, 3*g+4*i) for i in range(1, (g-6)//4+1)]
             + [(3*g+6-4*i, 3*g+2+4*i) for i in range(1, (g-2)//4+1)])
    else:
        O = ([(2*g+6, 4*g)] + [(3*g-4*i, 3*g+4*i) for i in range(1, (g-4)//4+1)]
             + [(3*g+6-4*i, 3*g+2+4*i) for i in range(1, (g-4)//4+1)])
    return E + O


G6 = json.load(open(os.path.join(_HERE, '..', 'certificates.json')))['base_g6']
G6 = ([tuple(e) for e in G6[0]], [tuple(e) for e in G6[1]])


def base(g):
    return G6 if g == 6 else (M0f(g), M1f(g))


def length(e, n):
    d = (e[0]-e[1]) % n
    return min(d, n-d)


def base_ok(g, M0, M1, verbose=False):
    """returns list of failure reasons (empty = OK)"""
    n = 6*g+1
    I = set(range(2*g+3, 4*g+1))
    W0, W1 = {0, 1} | I, {1, 2} | I
    bad = []
    for name, M, W in (("M0", M0, W0), ("M1", M1, W1)):
        vs = [v % n for e in M for v in e]
        if len(M) != g: bad.append(name+" size")
        if len(vs) != len(set(vs)): bad.append(name+" not matching")
        if set(vs) != W: bad.append(name+" vertex set")
        if any(a % n == b % n for a, b in M): bad.append(name+" loop")
    L = [length(e, n) for e in M0+M1]
    if len(set(L)) != 2*g: bad.append("lengths not distinct")
    if 1 in L or 0 in L: bad.append("length 1/0")
    # residues +-s distinct mod n (distinct up to sign)
    R = set()
    for a, b in M0+M1:
        R.add((a-b) % n); R.add((b-a) % n)
    if len(R) != 4*g: bad.append("+-residues not 4g distinct")
    return bad


def main():
    out = []
    # ---------- base problem, 7..GBASE, and expected failure of formulas at g = 5, 6
    for g in range(7, GBASE+1):
        b = base_ok(g, M0f(g), M1f(g))
        assert not b, (g, b)
        n = 6*g+1
        L = sorted(length(e, n) for e in M0f(g)+M1f(g))
        expect = sorted(list(range(2, 2*g-2)) + [3*g-2, 3*g-1, 3*g, 2*g+3 if g % 2 else 2*g+4])
        assert L == expect, g
    out.append("base formulas OK for 7..%d (lengths = [2,2g-3] u {3g-2,3g-1,3g, 2g+3|2g+4})" % GBASE)
    for g in (5, 6):
        try:
            b = base_ok(g, M0f(g), M1f(g))
        except Exception as ex:
            b = ["exception %r" % ex]
        out.append("formula at g=%d: %s" % (g, b))
    assert not base_ok(6, *G6)
    out.append("g=6 certificate base OK")

    # ---------- whole construction
    for g in range(6, GCOL+1):
        n = 6*g+1; N2 = 2*n; m = 3*g
        M = base(g)
        # map length -> (eps, base edge)
        lenmap = {}
        for eps in (0, 1):
            for (u, v) in M[eps]:
                s = length((u, v), n); assert s not in lenmap; lenmap[s] = (eps, u % n, v % n)
        # vertex sets of colours 0..8 (closed form from PROOF.md 4), cross-checked against the classes
        VE = {0: {0, 1} | set(range(2*g+3, 4*g+1)),
              1: {2*g+1, 2*g+2} | set(range(4*g+3, 6*g+1)),
              2: set(range(3, 2*g+1)) | {4*g+1, 4*g+2},
              6: {1, 2} | set(range(2*g+4, 4*g+2)),
              7: {0, 2*g+2, 2*g+3} | set(range(4*g+4, 6*g+1)),
              8: (set(range(3, 2*g+1)) | {4*g+1, 4*g+2})}
        VE[8] = {(x+1) % n for x in VE[2]}
        for nb in (1, 2):
            p = N2 + 3*nb
            edges = []; cols = []
            # base edges: edge {x, x+s}; find translate i with {u+i, v+i} = {x, x+s}
            for s, (eps, u, v) in lenmap.items():
                for i in range(n):
                    a = (2*i + eps) % N2
                    c = (3*a) % N2              # base colour of class K_a
                    # final colour: shift by 3 (first block before colour 0), and by 3 more if c >= 6 and nb == 2
                    fc = c + 3 + (3 if (nb == 2 and c >= 6) else 0)
                    edges.append(((u+i) % n, (v+i) % n)); cols.append(fc)
            # block 1: x in X1, colour j-1 where {x,x+1} subset V(E_{j-1})
            X1 = [0] + list(range(3, 6*g, 2))
            for x in X1:
                e = (x, (x+1) % n)
                js = [j for j in (0, 1, 2) if x in VE[j] and (x+1) % n in VE[j]]
                assert len(js) == 1, (g, x, js)
                edges.append(e); cols.append(js[0])
            if nb == 2:
                X2 = [1] + list(range(4, 6*g+1, 2))
                for x in X2:
                    e = (x, (x+1) % n)
                    js = [j for j in (6, 7, 8) if x in VE[j] and (x+1) % n in VE[j]]
                    assert len(js) == 1, (g, x, js)
                    edges.append(e); cols.append(9 + (js[0]-6))
            # simplicity
            keys = {frozenset(e) for e in edges}
            assert len(keys) == len(edges) and all(len(k) == 2 for k in keys), g
            assert all(0 <= c < p for c in cols)
            # every colour used, class sizes: base classes g, F-classes as vertex sets / 2
            # degrees
            inc = [[] for _ in range(n)]
            for (a, b), c in zip(edges, cols):
                inc[a].append(c); inc[b].append(c)
            deg = sorted(len(x) for x in inc)
            D = 4*g + nb
            assert deg[-1] == D
            low = [v for v in range(n) if len(inc[v]) < D]
            assert low == ([2] if nb == 1 else [2, 3]) and all(len(inc[v]) == D-1 for v in low), (g, nb, low)
            # all pairs at each vertex, circular distance >= 3
            for v in range(n):
                A = np.array(inc[v])
                d = np.abs(A[:, None] - A[None, :]) % p
                d = np.minimum(d, p - d)
                np.fill_diagonal(d, p)
                assert d.min() >= 3, (g, nb, v)
            # counting bound
            assert len(edges) == 2*g*n + 3*g*nb
            assert Fraction(len(edges), m) == Fraction(p, 3) == D + Fraction(2, 3)
            # every window of 3 consecutive colours has exactly m edges (perfect)
            cnt = np.bincount(np.array(cols), minlength=p)
            w = cnt + np.roll(cnt, -1) + np.roll(cnt, -2)
            assert (w == m).all(), (g, nb)
            if g <= GALPHA:
                import networkx as nx
                G = nx.Graph(); G.add_edges_from(edges)
                al = len(nx.max_weight_matching(G, maxcardinality=True))
                assert al == m, (g, al)
                assert nx.number_of_nodes(G) == n
        out.append("g=%d: n=%d, both graphs OK (Delta=%d,%d; chi'=%s,%s)%s" % (
            g, n, 4*g+1, 4*g+2, Fraction(2*n+3, 3), Fraction(2*n+6, 3),
            "  alpha'=%d by blossom" % m if g <= GALPHA else ""))
    print("\n".join(out))
    print("INDEPENDENT CHECK PASSED")


if __name__ == "__main__":
    main()
