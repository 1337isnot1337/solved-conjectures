"""Enumerate integer polar vertices for small connected labeled graphs."""
from functools import lru_cache
from itertools import combinations, product
from random import Random


def check(adj):
    n = len(adj)
    full = (1 << n) - 1
    seen, queue, tree = 1, [0], []
    for u in queue:
        todo = adj[u] & ~seen
        while todo:
            b = todo & -todo
            todo ^= b
            seen |= b
            v = b.bit_length() - 1
            tree.append((u, v))
            queue.append(v)
    if seen != full:
        return False

    @lru_cache(None)
    def matching(vertices):
        if not vertices:
            return 0
        b = vertices & -vertices
        vertices ^= b
        u = b.bit_length() - 1
        best, todo = matching(vertices), adj[u] & vertices
        while todo:
            c = todo & -todo
            todo ^= c
            best = max(best, 1 + matching(vertices ^ c))
        return best

    m = matching(full)
    edges = [(u, v) for u, v in combinations(range(n), 2) if adj[u] & (1 << v)]
    f = [0] * n
    count = 0
    # A feasible integer potential is fixed by its increments along a spanning tree.
    # Every polar vertex has integer potentials because tight edges connect the graph.
    for diffs in product((-1, 0, 1), repeat=n - 1):
        for (u, v), d in zip(tree, diffs):
            f[v] = f[u] + d
        tight = [0] * n
        for u, v in edges:
            d = abs(f[u] - f[v])
            if d > 1:
                break
            if d:
                tight[u] |= 1 << v
                tight[v] |= 1 << u
        else:
            seen = front = 1
            while front:
                b = front & -front
                front ^= b
                new = tight[b.bit_length() - 1] & ~seen
                front |= new
                seen |= new
            count += seen == full

    target = 2**m + 2**(n - m) - 2
    assert count >= target, (n, adj, m, count)
    neighbors = {v for v in range(n) if adj[0] & (1 << v)}
    extremizer = (
        min(len(neighbors), n - len(neighbors)) == m
        and all(bool(adj[u] & (1 << v)) == ((u in neighbors) != (v in neighbors))
                for u, v in combinations(range(n), 2))
    )
    assert (count == target) == extremizer, (n, adj, m, count)
    return True


rng = Random(123)
counts = {}
for n in range(2, 9):
    edges = list(combinations(range(n), 2))
    checked = 0
    masks = range(1 << len(edges)) if n <= 5 else (rng.getrandbits(len(edges)) for _ in range(400))
    for mask in masks:
        adj = [0] * n
        for i, (u, v) in enumerate(edges):
            if mask & (1 << i):
                adj[u] |= 1 << v
                adj[v] |= 1 << u
        checked += check(adj)
    counts[n] = checked
assert counts == {2: 1, 3: 4, 4: 38, 5: 728, 6: 306, 7: 364, 8: 373}
print("PASS: exact facet and matching counts, graphs by n:", counts)
