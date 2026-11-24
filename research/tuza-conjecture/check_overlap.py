"""Exact atlas diagnostics for the overlap-credit and whole-triangle bounds."""
import networkx as nx
from itertools import combinations
from functools import lru_cache


def check_overlap(G):
    edges = sorted(tuple(sorted(e)) for e in G.edges())
    idx = {e: i for i, e in enumerate(edges)}
    tri = [
        sum(1 << idx[e] for e in combinations(vs, 2))
        for vs in combinations(sorted(G), 3)
        if all(e in idx for e in combinations(vs, 2))
    ]
    if not tri:
        return (0, 0, 0, 0, 0, 0, 0)
    n = len(tri)
    conf = [sum(1 << j for j, tj in enumerate(tri) if ti & tj) for ti in tri]

    @lru_cache(None)
    def opt(S):
        if not S:
            return 0
        i = (S & -S).bit_length() - 1
        return max(opt(S & ~(1 << i)), 1 + opt(S & ~conf[i]))

    def gen(S):
        if not S:
            yield ()
            return
        i = (S & -S).bit_length() - 1
        if opt(S) == opt(S & ~(1 << i)):
            yield from gen(S & ~(1 << i))
        if opt(S) == 1 + opt(S & ~conf[i]):
            for p in gen(S & ~conf[i]):
                yield (i,) + p

    def classify(P):
        mask = sum(tri[i] for i in P)
        base = {i: 0 for i in P}
        block = {i: tri[i] for i in P}
        for j, u in enumerate(tri):
            if j in P:
                continue
            used = u & mask
            assert used
            if used.bit_count() == 1:
                i = next(i for i in P if tri[i] & used)
                base[i] |= used
                block[i] |= u
        assert all(v.bit_count() != 2 for v in base.values())
        R = {i: block[i] for i in P if base[i] == tri[i]}
        assert all(v.bit_count() == 6 for v in R.values())
        return R

    ps = [(P, classify(P)) for P in gen((1 << n) - 1)]
    mx = max(len(R) for _, R in ps)
    certM = certC = eligible = overlap = ocert = certAny = badCount = 0
    for P, R in ps:
        if len(R) != mx:
            continue
        eligible += 1
        O = nx.Graph()
        O.add_nodes_from(R)
        O.add_edges_from((i, j) for i, j in combinations(R, 2) if R[i] & R[j])
        match = nx.max_weight_matching(O, maxcardinality=True)
        s = len(match)
        overlap += bool(s)
        chosen = {}
        for i, j in match:
            shared = R[i] & R[j]
            e = shared & -shared
            chosen[i] = e
            chosen[j] = e
        for i in R:
            if i not in chosen:
                chosen[i] = R[i] & -R[i]
        cover = 0
        for i, k in R.items():
            e = chosen[i]
            a = e.bit_length() - 1
            b = next(b for b in range(len(edges))
                     if k >> b & 1 and not set(edges[a]) & set(edges[b]))
            cover |= e | (1 << b)
        assert cover.bit_count() <= 2 * len(R) - s
        F = [i for i in P if i not in R]
        E = {i: [] for i in F}
        multi = []
        for j, u in enumerate(tri):
            if j in P:
                continue
            hits = [i for i in P if tri[i] & u]
            fh = [i for i in hits if i in F]
            if not fh:
                assert len(hits) == 1 and u & cover
            elif len(fh) == 1:
                E[fh[0]].append((u, [i for i in hits if i in R]))
            else:
                multi.append((j, u, fh))
        B = {i for i in F if any(O.degree(r) > 0 for _, rs in E[i] for r in rs)}
        badCount += len(B)
        for i in B:
            cover |= tri[i]
        good = [i for i in F if i not in B]
        caps = {i: 2 for i in good}
        baseCover = cover
        for i in good:
            if E[i]:
                e = E[i][0][0] & tri[i]
                assert all(u & tri[i] == e for u, _ in E[i])
                caps[i] = 1
                baseCover |= e
        L = [(j, u, [i for i in fh if i in caps])
             for j, u, fh in multi if not u & baseCover]
        assert all(len(fh) >= 2 for _, _, fh in L)
        H = nx.Graph()
        left = []
        for j, u, fh in L:
            H.add_node(j, bipartite=0)
            left.append(j)
            for i in fh:
                for k in range(caps[i]):
                    H.add_edge(j, (i, k))
        M = nx.bipartite.maximum_matching(H, top_nodes=left)
        d = len(left) - sum(j in M for j in left)
        C = baseCover
        for j, u, fh in L:
            C |= (u & tri[M[j][0]]) if j in M else u & -u
        for i in good:
            if not C & tri[i]:
                C |= tri[i] & -tri[i]
        assert all(C & u for u in tri)
        assert C.bit_count() <= 2 * len(P) + len(B) - s + d
        cm = len(B) - s + d <= 0
        certM += cm
        # Minimum vertex transversal of the residual incidence hypergraph.
        S = next(set(cc) for k in range(len(good) + 1)
                 for cc in combinations(good, k)
                 if all(set(cc).intersection(fh) for _, _, fh in L))
        C = baseCover
        for i in S:
            C |= tri[i]
        for i in good:
            if not C & tri[i]:
                C |= tri[i] & -tri[i]
        assert all(C & u for u in tri)
        assert C.bit_count() <= 2 * len(R) - s + 3 * len(B) + len(good) + 2 * len(S)
        cc = 2 * len(R) - s + 3 * len(B) + len(good) + 2 * len(S) <= 2 * len(P)
        certC += cc
        certAny += cm or cc
        ocert += bool(s) and (cm or cc)
    return eligible, overlap, certM, certC, certAny, ocert, badCount


if __name__ == "__main__":
    stats = [check_overlap(g) for g in nx.graph_atlas_g()]
    print("lex-optimal, overlap, match, full-or-single, either, overlap-certified, bad occurrences:",
          [sum(s[i] for s in stats) for i in range(7)])
    print("graphs certified:", sum(s[4] > 0 for s in stats),
          "graphs with overlap certified:", sum(s[5] > 0 for s in stats))
