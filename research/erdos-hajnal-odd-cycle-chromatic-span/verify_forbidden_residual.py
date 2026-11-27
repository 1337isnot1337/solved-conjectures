#!/usr/bin/env python3
"""Check the induced-path types in the credited order-13 obstruction."""
from itertools import combinations
from verify_high_girth_lift import original


def main():
    V = set(range(13))
    N = {v: set() for v in V}
    for u, v in original():
        N[u].add(v)
        N[v].add(u)
    def independent(W):
        return all(v not in N[u] for u, v in combinations(W, 2))
    assert any(independent(W) for W in combinations(V, 5))
    assert not any(independent(W) for W in combinations(V, 6))
    for k, claimed in ((2, 4), (3, 3), (4, 2)):
        counts = []
        for X in combinations(V, k):
            S = set(X)
            if sorted(len(N[v] & S) for v in S) != [1, 1] + [2] * (k - 2):
                continue
            W = V - S - set.union(*(N[v] for v in S))
            size = max(t for t in range(len(W) + 1)
                       if any(independent(U) for U in combinations(W, t)))
            counts.append(size)
        assert max(counts) == claimed
        print(f"Path order {k}: checked {len(counts)} induced paths; "
              f"largest independent antineighborhood size {max(counts)}.")


if __name__ == "__main__":
    main()
