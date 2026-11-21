#!/usr/bin/env python3
"""Independent verification for PROOF.md (standard library only).

Part A  (family G_g = C_{6g+1}(1,...,2g-2, 2g+1, 3g), g = 2..GMAX):
  A1  G_g is a simple 4g-regular graph (connection set S has 2g distinct lengths in [1,(n-1)/2]).
  A2  the classes M0+i (index 2i) and M1+i (index 2i+1), i in Z_n, partition E(G_g):
      every edge of G_g lies in exactly one class.
  A3  with colour c(a) = 3a mod 2n, the map a -> c(a) is a bijection Z_2n -> Z_2n, every class is a matching,
      and edges sharing a vertex get colours at circular distance >= 3 in Z_2n, i.e. this is a
      (2n,3)-edge-colouring.  Checked twice: per vertex (sorted incident colours) and per window
      (every 3 cyclically consecutive colour classes are pairwise vertex-disjoint).
  A4  alpha'(G_g) = (n-1)/2: upper bound floor(n/2) (n odd); lower bound by exhibiting the matching
      {2j, 2j+1}, 0 <= j < (n-1)/2 (uses 1 in S).  Then |E|/alpha' == 2n/3 == 4g + 2/3 == p/q.
  A5  vertex connectivity = 4g, computed by a max-flow (vertex-split, unit capacities, BFS augmenting
      paths) implemented here; for g <= GFULL over ALL non-adjacent pairs, for GFULL < g <= GCONN over
      pairs (0,t) (enough by vertex-transitivity: translation maps (u,v) to (0,v-u)).
Part B  (sporadic example C_25(1,2,3,7,8,9,10,11,12), Delta = 18): the cyclic (75,4)-colouring
  class(3s+r) = B_r + s, colour 4a mod 75; same checks; |E|/alpha' = 225/12 = 75/4; connectivity 18.
Exit status 0 iff everything passes.
"""
import sys
from fractions import Fraction
from collections import deque

GMAX, GFULL, GCONN = 30, 4, 8


def circulant_edges(n, S):
    E = set()
    for x in range(n):
        for s in S:
            y = (x + s) % n
            assert y != x
            E.add((min(x, y), max(x, y)))
    return E


def check_colouring(n, E, classes, p, q):
    """classes: dict colour -> list of edges (each a sorted pair).  Checks partition, matchings, (p,q)-property."""
    assert sorted(classes) == list(range(p)), "colours must be exactly Z_p"
    allE = [e for c in range(p) for e in classes[c]]
    assert len(allE) == len(set(allE)), "an edge is coloured twice"
    assert set(allE) == E, "coloured edges != edge set"
    for c in range(p):
        vs = [v for e in classes[c] for v in e]
        assert len(vs) == len(set(vs)), "class %d is not a matching" % c
    # per-vertex check: consecutive incident colours (cyclically) differ by >= q
    inc = {v: [] for v in range(n)}
    for c in range(p):
        for (x, y) in classes[c]:
            inc[x].append(c); inc[y].append(c)
    for v, cs in inc.items():
        cs.sort()
        if len(cs) > 1:
            for a, b in zip(cs, cs[1:] + [cs[0] + p]):
                assert b - a >= q, ("too close at vertex", v, a, b)
    # per-window check: q consecutive classes are pairwise vertex-disjoint
    for c in range(p):
        vs = [v for t in range(q) for e in classes[(c + t) % p] for v in e]
        assert len(vs) == len(set(vs)), ("window", c)
    return True


def matching_number_odd_n(n, E):
    """alpha' for odd n when the near-perfect matching {2j,2j+1} is present."""
    M = [(2 * j, 2 * j + 1) for j in range((n - 1) // 2)]
    assert all(e in E for e in M)
    vs = [v for e in M for v in e]
    assert len(vs) == len(set(vs))
    return len(M)  # = floor(n/2), the trivial upper bound


def local_connectivity(n, adj, s, t):
    """max number of internally vertex-disjoint s-t paths (s,t non-adjacent), via max-flow on the
    split digraph: v_in = 2v, v_out = 2v+1, arc v_in->v_out of capacity 1 (infinite for s,t)."""
    INF = 10 ** 9
    N = 2 * n
    cap = {}
    out = [[] for _ in range(N)]

    def arc(u, v, c):
        if (u, v) not in cap:
            out[u].append(v); out[v].append(u)
            cap[(u, v)] = 0; cap.setdefault((v, u), 0)
        cap[(u, v)] += c

    for v in range(n):
        arc(2 * v, 2 * v + 1, INF if v in (s, t) else 1)
        for w in adj[v]:
            arc(2 * v + 1, 2 * w, 1)
    src, snk = 2 * s + 1, 2 * t
    flow = 0
    while True:
        par = {src: None}
        dq = deque([src])
        while dq and snk not in par:
            u = dq.popleft()
            for v in out[u]:
                if v not in par and cap[(u, v)] > 0:
                    par[v] = u; dq.append(v)
        if snk not in par:
            return flow
        v = snk
        while par[v] is not None:
            u = par[v]; cap[(u, v)] -= 1; cap[(v, u)] += 1; v = u
        flow += 1


def vertex_connectivity(n, E, all_pairs):
    adj = [set() for _ in range(n)]
    for x, y in E:
        adj[x].add(y); adj[y].add(x)
    best = n - 1
    sources = range(n) if all_pairs else [0]
    for s in sources:
        for t in range(n):
            if t != s and t not in adj[s] and (all_pairs is False or s < t):
                best = min(best, local_connectivity(n, adj, s, t))
    return best


def family(g):
    n = 6 * g + 1; p = 2 * n; q = 3
    S = list(range(1, 2 * g - 1)) + [2 * g + 1, 3 * g]
    assert len(set(S)) == 2 * g and all(1 <= s <= (n - 1) // 2 for s in S)
    E = circulant_edges(n, S)
    deg = [0] * n
    for x, y in E:
        deg[x] += 1; deg[y] += 1
    assert set(deg) == {4 * g} and len(E) == 2 * g * n
    M0 = [(0, 4 * g)] + [(2 * g + 1 + i, 4 * g - i) for i in range(1, g)]
    M1 = [(1, 3 * g + 1)] + [(2 * g + 1 + i, 4 * g + 1 - i) for i in range(1, g)]
    assert (3 * (4 * g + 1)) % p == 1                     # 3^{-1} = 4g+1 mod 2n
    colours = sorted((3 * a) % p for a in range(p))
    assert colours == list(range(p))                       # bijection a -> 3a
    classes = {}
    for i in range(n):
        for M, a in ((M0, 2 * i), (M1, 2 * i + 1)):
            classes[(3 * a) % p] = [tuple(sorted(((x + i) % n, (y + i) % n))) for (x, y) in M]
    check_colouring(n, E, classes, p, q)
    am = matching_number_odd_n(n, E)
    assert am == (n - 1) // 2 == 3 * g
    lb = Fraction(len(E), am)
    assert lb == Fraction(p, q) == 4 * g + Fraction(2, 3)
    return n, E, lb


def sporadic():
    n, p, q = 25, 75, 4
    S = [1, 2, 3, 7, 8, 9, 10, 11, 12]
    E = circulant_edges(n, S)
    assert len(E) == 9 * 25
    B = [[(0, 1), (2, 9), (10, 24)], [(0, 2), (1, 10), (11, 24)], [(0, 3), (1, 11), (2, 10)]]
    classes = {}
    for a in range(p):
        r, s = a % 3, a // 3
        classes[(4 * a) % p] = [tuple(sorted(((x + s) % n, (y + s) % n))) for (x, y) in B[r]]
    check_colouring(n, E, classes, p, q)
    am = matching_number_odd_n(n, E)
    lb = Fraction(len(E), am)
    assert lb == Fraction(75, 4) == 18 + Fraction(3, 4)
    return n, E, lb


def main():
    ok = True
    for g in range(2, GMAX + 1):
        n, E, val = family(g)
        msg = "g=%2d n=%3d Delta=%3d: (2n,3)-colouring OK, partition OK, |E|/alpha' = %s = p/q" % (g, n, 4 * g, val)
        if g <= GCONN:
            k = vertex_connectivity(n, E, all_pairs=(g <= GFULL))
            msg += ", kappa = %d (%s)" % (k, "all pairs" if g <= GFULL else "pairs (0,t)")
            ok &= (k == 4 * g)
        print(msg, flush=True)
    n, E, val = sporadic()
    k = vertex_connectivity(n, E, all_pairs=True)
    print("C_25(1,2,3,7,8,9,10,11,12): (75,4)-colouring OK, |E|/alpha' = %s, kappa = %d (all pairs)" % (val, k))
    ok &= (k == 18)
    print("ALL CHECKS PASSED" if ok else "FAILURE")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
