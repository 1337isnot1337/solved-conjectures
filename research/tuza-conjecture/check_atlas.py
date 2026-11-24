"""Exact finite sanity check of the conditional matching construction."""
import networkx as nx
from itertools import combinations
from functools import lru_cache


def check_graph(G):
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

    allp = list(gen((1 << n) - 1))

    def classify(P):
        pp = [tri[i] for i in P]
        mask = sum(pp)
        singles = {i: [] for i in P}
        for j, u in enumerate(tri):
            if j in P:
                continue
            used = u & mask
            assert used
            if used.bit_count() == 1:
                i = next(i for i in P if tri[i] & used)
                singles[i].append(u)
        rigid = {}
        for i in P:
            base = 0
            k = tri[i]
            for u in singles[i]:
                base |= u & tri[i]
                k |= u
            assert base.bit_count() != 2
            if base == tri[i]:
                assert k.bit_count() == 6 and len(singles[i]) == 3
                rigid[i] = k
        return rigid

    rps = [(P, classify(P)) for P in allp]
    mx = max(len(r) for p, r in rps)
    count = cert = bad = pos_rigid = 0
    maxdef = 0
    for P, R in rps:
        if len(R) != mx or any(a & b for a, b in combinations(R.values(), 2)):
            continue
        count += 1
        pos_rigid += bool(R)
        F = [i for i in P if i not in R]
        cover = 0
        for k in R.values():
            inds = [i for i in range(len(edges)) if k >> i & 1]
            a, b = next((a, b) for a, b in combinations(inds, 2)
                        if not set(edges[a]) & set(edges[b]))
            cover |= (1 << a) | (1 << b)
        caps = {i: 2 for i in F}
        E = {}
        residual = []
        for j, u in enumerate(tri):
            if j in P:
                continue
            hits = [i for i in P if tri[i] & u]
            fh = [i for i in hits if i in F]
            if not fh:
                assert len(hits) == 1 and u & cover
            elif len(fh) == 1:
                i = fh[0]
                e = u & tri[i]
                assert e.bit_count() == 1
                if i in E:
                    assert E[i] == e
                E[i] = e
            else:
                residual.append((j, u, fh))
        for i, e in E.items():
            caps[i] = 1
            cover |= e
        B = nx.Graph()
        left = []
        for j, u, fh in residual:
            if u & cover:
                continue
            left.append(j)
            B.add_node(j, bipartite=0)
            for i in fh:
                for s in range(caps[i]):
                    B.add_edge(j, (i, s))
        M = nx.bipartite.maximum_matching(B, top_nodes=left)
        d = len(left) - sum(j in M for j in left)
        if d == 0:
            cert += 1
        maxdef = max(maxdef, d)
        for j in left:
            u = tri[j]
            if j in M:
                i, _ = M[j]
                cover |= u & tri[i]
            else:
                cover |= u & -u
        for i in F:
            if not tri[i] & cover:
                cover |= tri[i] & -tri[i]
        assert all(u & cover for u in tri)
        assert cover.bit_count() <= 2 * len(P) + d
    return len(allp), count, cert, bad, pos_rigid, maxdef, mx


if __name__ == "__main__":
    stats = [check_graph(g) for g in nx.graph_atlas_g()]
    print("graphs", len(stats), "triangle-containing", sum(x[0] > 0 for x in stats),
          "max packings", sum(x[0] for x in stats))
    print("eligible packings", sum(x[1] for x in stats),
          "eligible graphs", sum(x[1] > 0 for x in stats),
          "certifying packings", sum(x[2] for x in stats),
          "certifying graphs", sum(x[2] > 0 for x in stats),
          "eligible positive rigid", sum(x[4] for x in stats),
          "max deficiency", max(x[5] for x in stats))
