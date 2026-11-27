#!/usr/bin/env python3
"""Exact finite stress test for the one-stable domination algorithm."""
from itertools import combinations
from math import comb


def optimum(closed):
    order = len(closed)
    whole = (1 << order) - 1
    for size in range(1, order + 1):
        for chosen in combinations(range(order), size):
            covered = 0
            for u in chosen:
                covered |= closed[u]
            if covered == whole:
                return chosen
    raise AssertionError("All vertices always form a dominating set")


def check(rows, lower=None, check_optimum=True):
    D = 0
    counters = [0] * len(rows)
    forced = []
    neighborhood = []
    paid = 0
    budget = 0
    d = 0
    for v, old_neighbors in enumerate(rows):
        R = old_neighbors | (1 << v)
        d = max(d, R.bit_count() - 1)
        for u in range(v):
            if old_neighbors & (1 << u):
                neighborhood[u] |= 1 << v
        neighborhood.append(R)
        old_D = D
        if not (D & R):
            participants = [u for u in range(v + 1) if R & (1 << u)]
            for u in participants:
                counters[u] += 1
            w = max(participants, key=lambda u: (counters[u], -u))
            assert not (D & (1 << w))
            D |= 1 << w
            forced.append((v, R, counters[w]))
            budget += R.bit_count()
            paid += counters[w]
        assert (D ^ old_D).bit_count() <= 1
        assert D & old_D == old_D
        assert all(D & adj for adj in neighborhood)
        assert paid <= budget <= (d + 1) * len(forced)
        if not check_optimum:
            continue
        S = optimum(neighborhood)
        count = {w: 0 for w in S}
        B = 0
        for u, old, score in forced:
            w = next(w for w in S if neighborhood[u] & (1 << w))
            if w > u:
                B += 1
            else:
                assert old & (1 << w)
                count[w] += 1
                assert score >= count[w]
        U = D.bit_count()
        k = len(S)
        assert B <= d*k
        assert U == len(forced)
        assert sum(comb(c+1, 2) for c in count.values()) <= paid
        assert (U-B)**2 <= 2*k*paid
        t = U - (2*d+1)*k
        assert t <= 0 or t*t <= k*k*(d+1)*(3*d+1)
    if lower is not None:
        assert D.bit_count() >= lower


if __name__ == "__main__":
    cases = 0
    for n in range(1, 7):
        for g in range(1 << comb(n, 2)):
            rows = [(g >> comb(i, 2)) & ((1 << i)-1) for i in range(n)]
            check(rows)
            cases += 1
    for d in (1, 2, 5, 20, 100):
        check([0]*d + [(1 << d)-1], lower=d, check_optimum=False)
    print(f"Verified {cases} ordered graphs and every prefix; five star lower bounds.")
