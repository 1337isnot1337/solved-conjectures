"""Check Graffiti.pc Conjecture 318 through seven vertices.

The unrestricted theorem has an all-order proof in PROOF.md.
This standard-library exhaustive check is a regression test, not a proof.
"""
from itertools import combinations


def adjacency_from_missing(n, missing):
    adj = [((1 << n) - 1) ^ (1 << v) for v in range(n)]
    for u, v in missing:
        adj[u] ^= 1 << v
        adj[v] ^= 1 << u
    return adj


def even_distance_counts(adj):
    n = len(adj)
    all_vertices = (1 << n) - 1
    counts = []
    for root in range(n):
        seen = frontier = 1 << root
        level = 0
        even = 0
        while frontier:
            if level % 2 == 0:
                even += frontier.bit_count()  # includes the root at distance 0
            neighbors = 0
            for v in range(n):
                if frontier & (1 << v):
                    neighbors |= adj[v]
            frontier = neighbors & ~seen
            seen |= frontier
            level += 1
        if seen != all_vertices:
            return None  # disconnected
        counts.append(even)
    return counts


def totally_dominates(adj, selected):
    return all(neighbors & selected for neighbors in adj)


def tds_without_dominating_pair(adj):
    """Return a TDS lacking a two-element TDS subset, or None."""
    total = [mask for mask in range(1, 1 << len(adj)) if totally_dominates(adj, mask)]
    pairs = [mask for mask in total if mask.bit_count() == 2]
    return next((d for d in total if not any(d & p == p for p in pairs)), None)


def check_sharpness():
    # K_1 join (2 K_2); vertex 4 is universal
    edges = {(0, 1), (2, 3), (0, 4), (1, 4), (2, 4), (3, 4)}
    missing = tuple(e for e in combinations(range(5), 2) if e not in edges)
    adj = adjacency_from_missing(5, missing)
    assert len(missing) == 4
    assert max(even_distance_counts(adj)) == 3
    assert totally_dominates(adj, (1 << 0) | (1 << 4))
    four = (1 << 4) - 1
    assert totally_dominates(adj, four)
    assert all(not totally_dominates(adj, four ^ (1 << v)) for v in range(4))
    assert tds_without_dominating_pair(adj) == four
    print("sharpness: K_1 join (2K_2) has 4 missing edges, maximum even-distance 3")


def main():
    total_examined = total_qualifying = 0
    for n in range(2, 8):
        possible = tuple(combinations(range(n), 2))
        examined = qualifying = 0
        # The hypothesis requires q <= n; include q = n+1 for sharpness.
        for q in range(min(n + 1, len(possible)) + 1):
            for missing in combinations(possible, q):
                adj = adjacency_from_missing(n, missing)
                even = even_distance_counts(adj)
                examined += 1
                if even is None or max(even) < q:
                    continue
                qualifying += 1
                bad = tds_without_dominating_pair(adj)
                assert bad is None, (n, missing, even, bad)
        total_examined += examined
        total_qualifying += qualifying
        print(f"n={n}: examined {examined}, qualifying {qualifying}")
    assert (total_examined, total_qualifying) == (419235, 7337)
    check_sharpness()
    print(f"PASS: {total_qualifying} qualifying of {total_examined} examined")


if __name__ == "__main__":
    main()
