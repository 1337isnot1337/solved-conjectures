#!/usr/bin/env python3
"""Independent finite check of the two-leaf characterization."""
from itertools import combinations, permutations


def check_orientations(n, edges, leaves, hamilton_count):
    triples = tuple(combinations(range(n), 3))
    tested = certified = 0
    for mask in range(1 << len(edges)):
        tested += 1
        adj = [[] for _ in range(n)]
        for i, (a, b) in enumerate(edges):
            if mask >> i & 1:
                a, b = b, a
            adj[a].append(b)
        dist = [[None] * n for _ in range(n)]
        for a in range(n):
            row = dist[a]
            row[a] = 0
            queue = [a]
            for x in queue:
                for y in adj[x]:
                    if row[y] is None:
                        row[y] = row[x] + 1
                        queue.append(y)

        def collinear(triple):
            for a, b, c in permutations(triple):
                ab, bc, ac = dist[a][b], dist[b][c], dist[a][c]
                if ab is not None and bc is not None and ab + bc == ac:
                    return True
            return False

        if all(map(collinear, triples)):
            certified += 1
            a, b = leaves[:2]
            assert {dist[a][b], dist[b][a]} == {None, n - 1}, (n, edges, mask)
    assert certified == 2 * hamilton_count, (n, edges)
    return tested, certified


def main():
    graphs = orientations = positive = positive_orientations = 0
    for n in range(2, 7):
        universe = tuple(combinations(range(n), 2))
        for mask in range(1 << len(universe)):
            edges = tuple(e for i, e in enumerate(universe) if mask >> i & 1)
            deg = [0] * n
            for a, b in edges:
                deg[a] += 1
                deg[b] += 1
            leaves = [v for v in range(n) if deg[v] == 1]
            if len(leaves) < 2:
                continue
            s, t = leaves[:2]
            pairs = set(edges)
            hamilton_count = 0
            for p in permutations(v for v in range(n) if v not in (s, t)):
                order = (s, *p, t)
                if all(tuple(sorted(pair)) in pairs for pair in zip(order, order[1:])):
                    hamilton_count += 1
            tested, certified = check_orientations(n, edges, leaves, hamilton_count)
            graphs += 1
            orientations += tested
            positive += bool(hamilton_count)
            positive_orientations += certified
    print(f"Checked {graphs:,} graphs and {orientations:,} orientations; "
          f"{positive:,} traceable graphs and {positive_orientations:,} certificates.")


if __name__ == "__main__":
    main()
