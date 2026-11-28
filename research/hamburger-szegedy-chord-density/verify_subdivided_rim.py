#!/usr/bin/env python3
"""Check projected cycles against their lifts in subdivided-rim examples."""
from itertools import combinations
from random import Random


def edge(u, v):
    return tuple(sorted((u, v)))


def sequences(adj):
    for root in range(len(adj)):
        def dfs(vertices, kinds):
            for v, rim in adj[vertices[-1]]:
                if v == root:
                    if len(vertices) >= 3 or (len(vertices) == 2 and rim != kinds[0]):
                        yield vertices, kinds + [rim]
                elif v > root and v not in vertices:
                    yield from dfs(vertices + [v], kinds + [rim])
        yield from dfs([root], [])


def components(S, edges):
    groups = [{u} for u in S]
    for u, v in edges:
        a = next(g for g in groups if u in g)
        b = next(g for g in groups if v in g)
        if a is not b:
            groups.remove(b)
            a.update(b)
    return len(groups)


def check(n, F, lengths):
    adj = [[] for _ in range(n)]
    rim_paths = {}
    graph = set(F)
    new = n
    for u, length in enumerate(lengths):
        v = (u + 1) % n
        adj[u].append((v, True))
        adj[v].append((u, True))
        path = [u, *range(new, new + length - 1), v]
        new += length - 1
        rim_paths[edge(u, v)] = set(map(lambda uv: edge(*uv), zip(path, path[1:])))
        graph.update(rim_paths[edge(u, v)])
    for u, v in F:
        adj[u].append((v, False))
        adj[v].append((u, False))
    matching = len({x for e in F for x in e}) == 2 * len(F)
    forest = len(F) == n - components(range(n), F)
    s = min(lengths)
    count = 0
    for vertices, kinds in sequences(adj):
        S = set(vertices)
        chords_subgraph = {e for e in F if set(e) <= S}
        lifted_edges = set()
        for u, v, is_rim in zip(vertices, vertices[1:] + vertices[:1], kinds):
            if is_rim:
                lifted_edges.update(rim_paths[edge(u, v)])
            else:
                lifted_edges.add(edge(u, v))
        T = {x for e in lifted_edges for x in e}
        actual_chords = len({e for e in graph if set(e) <= T} - lifted_edges)
        r = sum(kinds)
        c = len(kinds) - r
        kappa = components(S, chords_subgraph)
        beta = len(chords_subgraph) - len(S) + kappa
        assert len(T) == len(lifted_edges) >= s * r + c
        assert actual_chords == len(chords_subgraph) - c == r - kappa + beta
        if matching:
            assert 2 * actual_chords <= r - c
            assert 2 * s * actual_chords <= len(T)
        if forest:
            assert actual_chords * s < len(T)
        count += 1
    return count


def main():
    rng = Random(642)
    total = 0
    for n in range(3, 6):
        edges = list(combinations(range(n), 2))
        for mask in range(1 << len(edges)):
            F = {e for j, e in enumerate(edges) if mask >> j & 1}
            total += check(n, F, [rng.randint(2, 3) for _ in range(n)])
    for n in range(6, 15, 2):
        for _ in range(100):
            permutation = rng.sample(range(n), n)
            F = {edge(u, v) for u, v in zip(permutation[::2], permutation[1::2])}
            color = {u: i % 2 for i, u in enumerate(permutation)}
            lengths = [2 + (color[u] ^ color[(u + 1) % n]) for u in range(n)]
            total += check(n, F, lengths)
    print(f"Checked {total:,} oriented projected cycles with explicit lifts")


if __name__ == "__main__":
    main()
