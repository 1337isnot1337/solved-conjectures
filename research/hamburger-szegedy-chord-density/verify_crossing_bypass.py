#!/usr/bin/env python3
"""Independently check the Max-Cut encoding on all four-block input graphs."""
from itertools import combinations, product


def pair(u, v):
    return tuple(sorted((u, v)))


def rim_edges(order):
    return {pair(u, v) for u, v in zip(order, order[1:] + order[:1])}


def check(n, input_edges, q, threshold=None):
    D = max(1, *(sum(i in e for e in input_edges) for i in range(n)))
    width = 4 * D + 8
    L = n * (q * (2 * D + 3) + 1)
    a, b, c, d = 0, 2 * D + 2, 2 * D + 5, 4 * D + 7
    rim = list(range(q * n * width))
    shortcuts = [
        [(q * (i * width + u), q * (i * width + v))
         for u, v in [(a, c), (b, d)]]
        for i in range(n)
    ]
    tracks = {
        (i, side, parity): iter([q * (i * width + u) for u in places
                                 if u % 2 == parity])
        for i in range(n)
        for side, places in enumerate([range(a + 1, b), range(c + 1, d)])
        for parity in (0, 1)
    }
    host = {e for options in shortcuts for e in options}
    for i, j in input_edges:
        for side in (0, 1):
            host.add(pair(next(tracks[i, side, 0]), next(tracks[j, 1 - side, 1])))
    padding = 0 if threshold is None else L - threshold
    for _ in range(padding):
        start = len(rim)
        for i in range(start, start + 8, 2):
            for j in range(start + 1, start + 8, 2):
                host.add(pair(i, j))
        rim.extend(range(start, start + 8))
    host.update(rim_edges(rim))
    degree = [0] * len(rim)
    for u, v in host:
        assert (u + v) % 2
        degree[u] += 1
        degree[v] += 1
    assert max(degree) <= (5 if padding else 3)
    expected = max(sum(bits[i] != bits[j] for i, j in input_edges)
                   for bits in product((0, 1), repeat=n))
    scores = {}
    for choices in product((-1, 0, 1), repeat=n):
        removed = set()
        for options, chosen in zip(shortcuts, choices):
            if chosen >= 0:
                u, v = options[chosen]
                removed.update(range(u + 1, v))
        kept = [v for v in rim if v not in removed]
        kept_set = set(kept)
        assert rim_edges(kept) <= host
        chords = sum(u in kept_set and v in kept_set for u, v in host) - len(kept)
        scores[choices] = chords - len(kept)
        if -1 not in choices:
            assert len(kept) == L + 8 * padding
            assert chords == 9 * padding + sum(choices[i] != choices[j]
                                               for i, j in input_edges)
    for choices, score in scores.items():
        for i, opt in enumerate(choices):
            if opt == -1:
                for k in (0, 1):
                    assert scores[choices[:i] + (k,) + choices[i+1:]] > score
    assert max(scores.values()) == expected - L + padding
    return len(scores)


def main():
    pairs = list(combinations(range(4), 2))
    count = 0
    for mask in range(1 << len(pairs)):
        edges = [e for i, e in enumerate(pairs) if mask >> i & 1]
        for q in (1, 9):
            count += check(4, edges, q)
        for k in {0, len(edges) // 2, len(edges)}:
            count += check(4, edges, 1, k)
    print(f"Checked {count:,} feasible bypass selections in independent fixtures")


if __name__ == "__main__":
    main()
