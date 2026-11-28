"""Exact controls for FOUR-COLOUR-SWITCHING.md, not a test of Erdős #23."""

from collections import deque
from itertools import combinations


def max_flow(capacities, source, sink):
    """Integer augmenting paths with a residual capacity matrix."""
    n = len(capacities)
    value = 0
    while True:
        parent = {source: source}
        q = deque([source])
        while q and sink not in parent:
            u = q.popleft()
            for v, capacity in enumerate(capacities[u]):
                if capacity and v not in parent:
                    parent[v] = u
                    q.append(v)
        if sink not in parent:
            return value
        path = []
        v = sink
        while v != source:
            u = parent[v]
            path.append((u, v))
            v = u
        amount = min(capacities[u][v] for u, v in path)
        for u, v in path:
            capacities[u][v] -= amount
            capacities[v][u] += amount
        value += amount


def check(colour, weight, edges):
    n = len(weight)
    degree = [[0] * 4 for _ in range(n)]
    for u, v in edges:
        assert colour[u] != colour[v]
        degree[u][colour[v]] += weight[v]
        degree[v][colour[u]] += weight[u]
    weighted_edges = [(u, v, weight[u] * weight[v]) for u, v in edges]
    e = sum(w for _, _, w in weighted_edges)
    b = min(
        sum(w for u, v, w in weighted_edges if (mask >> u ^ mask >> v) & 1 == 0)
        for mask in range(1 << (n - 1))
    )
    gains = []
    cheap = []
    for i, j in combinations(range(4), 2):
        shore = [v for v in range(n) if colour[v] in (i, j)]
        a = {
            v: weight[v] * max(0, 2 * degree[v][i + j - colour[v]] - sum(degree[v]))
            for v in shore
        }
        source, sink = n, n + 1
        cap = [[0] * (n + 2) for _ in range(n + 2)]
        for v in shore:
            if colour[v] == i:
                cap[source][v] = a[v]
            else:
                cap[v][sink] = a[v]
        for u, v, w in weighted_edges:
            if colour[u] == j and colour[v] == i:
                u, v = v, u
            if colour[u] == i and colour[v] == j:
                cap[u][v] = 2 * w
        h = sum(a.values()) - max_flow(cap, source, sink)
        brute = 0
        for mask in range(1 << len(shore)):
            flipped = {v for k, v in enumerate(shore) if mask >> k & 1}
            score = sum(a[v] for v in flipped) - 2 * sum(
                w for u, v, w in weighted_edges if u in flipped and v in flipped
            )
            brute = max(brute, score)
        assert h == brute
        gains.append(h)
        cheap.append(max(sum(a[v] for v in shore if colour[v] == c) for c in (i, j)))
    assert 3 * b <= e - sum(gains)
    return e, b, gains, cheap


def main():
    colour = (0, 0, 1, 1, 2, 3)
    possible = [(u, v) for u, v in combinations(range(6), 2) if colour[u] != colour[v]]
    assert len(possible) == 13
    for mask in range(1 << len(possible)):
        check(colour, (1, 3, 4, 7, 9, 13), [edge for k, edge in enumerate(possible) if mask >> k & 1])

    colour = (0, 1, 0, 1, 2, 0, 1, 0, 1, 2, 3)
    weight = (13, 1, 2, 16, 8, 9, 17, 10, 5, 9, 7)
    edges = []
    for u in range(5):
        v = (u + 1) % 5
        edges.extend(((u, v), (u, v + 5), (u + 5, v), (u + 5, 10)))
    e, b, gain, cheap = check(colour, weight, edges)
    assert (e, b, gain, cheap) == (1446, 144, [256, 8, 0, 80, 0, 0], [191, 8, 0, 80, 0, 0])
    n2 = sum(weight) ** 2
    assert 2486 * n2 <= 20000 * e <= 3197 * n2
    assert 25 * (e - sum(gain)) <= 3 * n2 < 25 * (e - sum(cheap))
    print("8193 weighted controls pass (49158 flow comparisons).")


if __name__ == "__main__":
    main()
