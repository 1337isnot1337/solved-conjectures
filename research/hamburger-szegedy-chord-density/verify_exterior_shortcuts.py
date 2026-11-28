#!/usr/bin/env python3
"""Check exterior-star counts and a regular copy-completion construction."""
from collections import deque
from itertools import combinations
from random import Random


def edge(a, b):
    return frozenset((a, b))


def rim_edges(order):
    return {edge(a, b) for a, b in zip(order, order[1:] + order[:1])}


def star(order, host, y, marks):
    rim = rim_edges(order)
    chords = {e for e in host if y not in e} - rim
    total = 0
    for i, p in enumerate(marks):
        q = marks[(i + 1) % len(marks)]
        gap = {(p + j) % len(order) for j in range(1, (q - p) % len(order))}
        assert gap
        nxt = [z for z in order if z not in gap]
        nxt.insert(nxt.index(p) + 1, y)
        newedges = rim_edges(nxt)
        assert newedges <= host
        sup = set(nxt)
        k = sum(e <= sup and e not in newedges for e in host)
        c = sum(bool(e & gap) for e in chords)
        assert len(nxt) == len(order) - len(gap) + 1
        assert k == len(chords) - c + len(marks) - 2
        total += c
    assert total <= 2 * len(chords)
    return total, len(chords)


def close_ear(adj, source, copy):
    Q = deque((v, 1) for v in adj[source] if v[0] != copy)
    seen = {source} | {v for v, _ in Q}
    while Q:
        v, dist = Q.popleft()
        for w in adj[v] - seen:
            if w[0] == copy:
                return dist + 1
            seen.add(w)
            Q.append((w, dist + 1))
    return float("inf")


def completion(seed, colors, d, modulus, offsets, girth):
    h = [d - sum(v in e for e in seed) for v in range(len(colors))]
    slots = [v for v, count in enumerate(h) for _ in range(count)]
    assert len(slots) == len(offsets)
    n = 2 * modulus
    adj = {(i, v): set() for i in range(n) for v in range(len(colors))}

    def add(a, b):
        ca = (int(a[0] >= modulus) + colors[a[1]]) % 2
        cb = (int(b[0] >= modulus) + colors[b[1]]) % 2
        assert a != b and b not in adj[a] and ca != cb
        adj[a].add(b)
        adj[b].add(a)

    for i in range(n):
        for a, b in seed:
            add((i, a), (i, b))
    for i in range(modulus):
        for v, step in zip(slots, offsets):
            add((i, v), (modulus + ((i + step) % modulus), v))
    for x, nbrs in adj.items():
        assert len(nbrs) == d
        assert {j for i, j in nbrs if i == x[0]} == {
            next(iter(e - {x[1]})) for e in seed if x[1] in e}
        assert len({i for i, _ in nbrs if i != x[0]}) == h[x[1]]
        assert close_ear(adj, x, x[0]) >= girth
    return len(adj)


def main():
    rng = Random(642)
    checked = 0
    for _ in range(2000):
        L = 2 * rng.randint(3, 16)
        order = list(range(L))
        pairings = {edge(a, b) for a in range(0, L, 2)
                    for b in range(1, L, 2) if rng.random() < 0.35}
        population = order[::2]
        marks = sorted(rng.sample(population, rng.randint(2, len(population))))
        star(order, rim_edges(order) | pairings | {edge(L, u) for u in marks}, L, marks)
        checked += len(marks)
    for t in range(2, 12):
        a = 2 * (t + 1)
        L = t * a
        order = list(range(L))
        marks = order[::a]
        host = rim_edges(order) | {edge(L, u) for u in marks}
        for i, j in combinations(range(t), 2):
            host.add(edge(i * a + 2 * (j + 1), j * a + 2 * i + 1))
        total, k = star(order, host, L, marks)
        assert total == 2 * k == t * (t - 1)
        checked += t

    vertices = 0
    for seed, colors, d in [({edge(0, 1), edge(1, 2)}, [0, 1, 0], 3),
                             (rim_edges(list(range(6))), [0, 1] * 3, 3)]:
        M = len(colors) * d - 2 * len(seed)
        vertices += completion(seed, colors, d, M, list(range(M)), 4)
        # Unique integer differences of powers of two survive reduction mod a
        # sufficiently large modulus. No repeated differences means no 4-cycle.
        offsets = [2**i for i in range(M)]
        vertices += completion(seed, colors, d, 2 ** M + 1, offsets, 6)
    print(f"Checked {checked:,} explicit exterior-star replacements")
    print(f"Checked regularity, induced copies and ear lengths at {vertices:,} lifted vertices")


if __name__ == "__main__":
    main()
