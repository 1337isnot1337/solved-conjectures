#!/usr/bin/env python3
"""Check quotient cycle lifting against directly induced chord counts."""
from fractions import Fraction as F
from itertools import product
from random import Random


def edge(a, b):
    return frozenset((a, b))


def path_edges(seq):
    return {edge(a, b) for a, b in zip(seq, seq[1:])}


def rim_edges(seq):
    return path_edges(seq + seq[:1])


def rim_paths(a, b, h):
    if a == b:
        return [(a,)]
    return [tuple((a + j * step) % h
                  for j in range(((b - a) * step) % h + 1))
            for step in (1, -1)]


def fixture(h, seed, M, palette, W):
    S = set(W)
    col = {edge(a, M + b): (b - a) % M for a in range(M) for b in range(M)}
    cols = {e: c for e, c in col.items() if e <= S}
    wrim = rim_edges(W)
    host = {edge((x, a), (x, b)) for x in S for a, b in seed}
    for (a, b), c in cols.items():
        host.add(edge((a, palette[c]), (b, palette[c])))
    opts = []
    for j, x in enumerate(W):
        left = palette[col[edge(x, W[j - 1])]]
        right = palette[col[edge(x, W[(j + 1) % len(W)])]]
        opts.append(rim_paths(left, right, h))

    local = sum(sum(F(sum(e <= set(P) for e in seed) - 2 * len(P) + 1, len(paths))
                    for P in paths) for paths in opts)
    prob = {x: [F(sum(w in P for P in paths), len(paths)) for w in range(h)]
            for x, paths in zip(W, opts)}
    external = sum(prob[a][palette[c]] * prob[b][palette[c]]
                   for e, c in cols.items() if e not in wrim for a, b in [tuple(e)])
    total = count = 0

    def direct(paths):
        C = [(x, w) for x, P in zip(W, paths) for w in P]
        assert len(set(C)) == len(C)
        assert rim_edges(C) <= host
        induced = sum(e <= set(C) for e in host)
        return induced - 2 * len(C)

    for paths in product(*opts):
        total += direct(paths)
        count += 1
    assert F(total, count) == local + external
    if all(len(paths) == 2 and max(map(len, paths)) == h for paths in opts):
        long = [max(paths, key=len) for paths in opts]
        assert direct(long) == len(W) * (len(seed) - 2 * h) + len(cols)
    return count


def main():
    rng = Random(642)
    count = 0
    for h, extras, d in [(4, [], 4), (6, [], 4),
                         (6, [(0, 3), (1, 4), (2, 5)], 5)]:
        seed = rim_edges(list(range(h))) | {edge(*pair) for pair in extras}
        slots = [v for v in range(h) for _ in range(d - sum(v in e for e in seed))]
        M = len(slots)
        for _ in range(160):
            t = rng.randrange(2, 5)
            a = rng.sample(range(M), t)
            b = rng.sample(range(M, 2 * M), t)
            W = [x for pair in zip(a, b) for x in pair]
            palette = rng.sample(slots, M)
            count += fixture(h, seed, M, palette, W)
        # The 0/1 matchings form one Hamilton cycle. A length-four 0/1
        # component can be checked exhaustively by using shift M/2 instead.
        palette = slots.copy()
        j = palette.index(1)
        palette[j], palette[M // 2] = palette[M // 2], palette[j]
        assert palette[0] != palette[M // 2]
        count += fixture(h, seed, M, palette, [0, M, M // 2, M + M // 2])
    print(f"Checked {count:,} lifted cycles against the expected surplus identity")


if __name__ == "__main__":
    main()
