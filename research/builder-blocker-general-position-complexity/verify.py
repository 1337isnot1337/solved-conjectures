"""Independent full-distance minimax audit for both Builder–Blocker reductions."""
from functools import lru_cache
from itertools import combinations
from random import Random
import argparse


def kayles(adjacency, starter):
    @lru_cache(None)
    def value(remaining, maximize):
        if not remaining:
            return 0
        options = []
        for i, ng in enumerate(adjacency):
            if remaining >> i & 1:
                options.append(1+value(remaining & ~(ng | 1 << i), not maximize))
        return (max if maximize else min)(options)
    return value((1 << len(adjacency))-1, starter)


def graph(n, edges):
    adjacency = [0]*n
    for u,v in edges:
        adjacency[u] |= 1 << v
        adjacency[v] |= 1 << u
    return tuple(adjacency)


def general_position_game(adjacency, starter, first_padding):
    n = len(adjacency)
    dist = []
    for root in range(n):
        d = [n]*n
        d[root] = 0
        q = [root]
        for u in q:
            for v in range(n):
                if adjacency[u] >> v & 1 and d[v] == n:
                    d[v] = d[u]+1
                    q.append(v)
        dist.append(d)
    assert max(map(max,dist)) == 2
    bad = [[0]*n for _ in range(n)]
    for x,y,z in combinations(range(n),3):
        i,j,k = sorted((dist[x][y], dist[x][z], dist[y][z]))
        if i+j == k:
            bad[x][y] |= 1 << z
            bad[x][z] |= 1 << y
            bad[y][z] |= 1 << x
    original = (1 << first_padding)-1

    @lru_cache(None)
    def value(mask, pad_count, maximize):
        selected = mask | (((1 << pad_count)-1) << first_padding)
        forbidden = selected
        used = [i for i in range(n) if selected >> i & 1]
        for u,v in combinations(used,2):
            forbidden |= bad[u][v]
        options = [1+value(mask | 1 << v, pad_count, not maximize)
                   for v in range(first_padding)
                   if (original & ~forbidden) >> v & 1]
        rep = first_padding+pad_count
        if rep < n and not (forbidden >> rep & 1):
            # Padding vertices are twins; choose the first unused representative.
            options.append(1+value(mask,pad_count+1,not maximize))
        return (max if maximize else min)(options) if options else 0

    return value(0,0,starter)


def checks(n, edges):
    H = graph(n,edges)
    norm_edges = list(edges)
    m = n
    for u, row in enumerate(H):
        if not row:
            norm_edges.append((u,m))
            m += 1
    H2 = graph(m,norm_edges)
    assert all(H2)
    for starter in (False,True):
        assert kayles(H,starter) == kayles(H2,starter)
    not_H2 = [(u,v) for u,v in combinations(range(m),2) if not H2[u]>>v&1]
    M = m+1 if m%2 == 0 else m+2
    host = graph(m+M,not_H2+[(u,v) for u in range(m+M) for v in range(m,m+M) if u<v])
    assert general_position_game(host,True,m) == M+kayles(H2,False)

    not_H = [(u,v) for u,v in combinations(range(n),2) if not H[u]>>v&1]
    M = n+2
    host = graph(n+1+M,not_H+[(n,v) for v in range(n+1+M) if v!=n])
    assert general_position_game(host,False,n+1) == 1+kayles(H,True)

    L = n+2
    star = graph(n+L+1,list(edges)+[(n,v) for v in range(n+1,n+L+1)])
    assert kayles(star,False) == 1+kayles(H,True)


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--atlas',action='store_true',help='also check all nonempty graphs in NetworkX atlas')
    args = p.parse_args()
    count=0
    for n in range(1,6):
        ps=list(combinations(range(n),2))
        for m in range(1 << len(ps)):
            checks(n,[e for i,e in enumerate(ps) if m>>i&1])
            count += 1
    rng=Random(916)
    for n in range(6,11):
        for k in range(12):
            prob=(k+1)/13
            checks(n,[e for e in combinations(range(n),2) if rng.random()<prob])
            count += 1
    atlas=0
    if args.atlas:
        import networkx as nx
        for g in nx.graph_atlas_g():
            if g:
                checks(len(g),list(g.edges))
                atlas += 1
    print(f"{count} labeled inputs and {atlas} atlas representatives; both exact GP values, both isolate starts, and the star forcing check")


if __name__ == '__main__':
    main()
