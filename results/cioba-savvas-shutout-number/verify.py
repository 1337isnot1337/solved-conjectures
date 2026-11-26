#!/usr/bin/env python3
"""Exact-integer regression for the Shearer shutout strategy (not the proof)."""
from functools import cache
from itertools import combinations, product
from random import Random


def polynomial(adj, weights, scale):
    """Returns |S|-scaled Shearer polynomials by the deletion recurrence."""
    @cache
    def q(mask):
        if not mask:
            return 1
        bit = mask & -mask
        v = bit.bit_length() - 1
        s = mask ^ bit
        n = s & adj[v]
        return scale * q(s) - weights[v] * scale ** n.bit_count() * q(s ^ n)
    return q


def from_edges(n, edges):
    adj = [0] * n
    for u, v in edges:
        adj[u] |= 1 << v
        adj[v] |= 1 << u
    return tuple(adj)


def direct_polynomials(adj, weights, scale):
    """Independently enumerate all independent-set terms for each subset."""
    n = len(adj)
    terms = []
    for mask in range(1 << n):
        support = [v for v in range(n) if mask & (1 << v)]
        if any(adj[v] & mask for v in support):
            continue
        weight = (-1) ** len(support)
        for v in support:
            weight *= weights[v]
        if weight:
            terms.append((mask, len(support), weight))
    factor = [scale ** k for k in range(n+1)]
    return [sum(weight * factor[mask.bit_count()-k]
                for a, k, weight in terms if (a & mask) == a)
            for mask in range(1 << n)]


def virtual(weights, u, v, killed):
    w = list(weights)
    w[killed] = 0
    keep = v if killed == u else u
    w[keep] *= 2
    return tuple(w)


def check_updates():
    n, scale = 5, 4
    all_edges = list(combinations(range(n), 2))
    states = tests = 0
    for mask in range(1 << len(all_edges)):
        edges = [e for k, e in enumerate(all_edges) if mask & (1 << k)]
        adj = from_edges(n, edges)
        for weights in product(range(3), repeat=n):
            q = polynomial(adj, weights, scale)
            full = list(q(S) for S in range(1 << n))
            assert full == direct_polynomials(adj, weights, scale)
            if min(full) <= 0:
                continue
            states += 1
            for u, v in edges:
                if not (weights[u] and weights[v]):
                    continue
                candidates = []
                for killed in (u, v):
                    w = virtual(weights, u, v, killed)
                    vals = direct_polynomials(adj, w, scale)
                    assert (vals[-1] > 0) == (min(vals) > 0)
                    candidates.append(min(vals) > 0)
                assert any(candidates), (edges, weights, u, v)
                tests += 1
    return states, tests


def play(n, edges, s, rng):
    adj = from_edges(n, edges)
    d = max(a.bit_count() for a in adj)
    scale = 2 ** (s-1)
    assert (d+1) ** (d+1) <= scale * d ** d
    whole = (1 << n) - 1
    red = [0] * n
    live = [a.bit_count() >= s for a in adj]
    free = set(edges)
    checks = 0

    def state():
        return tuple((1 << red[i]) if live[i] else 0 for i in range(n))

    assert min(polynomial(adj, state(), scale)(S) for S in range(1 << n)) > 0
    while free:
        # Encourage hard cases: overwhelmingly try a move at a current live threat.
        if rng.randrange(4):
            edge = max(sorted(free), key=lambda e: (max(state()[i] for i in e),
                                                     sum(state()[i] for i in e),
                                                     rng.random()))
        else:
            edge = rng.choice(sorted(free))
        free.remove(edge)
        u, v = edge
        old = state()
        for a in edge:
            red[a] += 1
            assert not live[a] or red[a] < s
        if not free:
            break
        candidates = [a for a in edge if live[a]]
        if len(candidates) == 2:
            for a in candidates:
                if polynomial(adj, virtual(old, u, v, a), scale)(whole) > 0:
                    candidates = [a]
                    break
            assert len(candidates) == 1
        replies = [e for e in sorted(free) if not candidates or candidates[0] in e]
        assert replies
        reply = rng.choice(replies)
        free.remove(reply)
        for a in reply:
            live[a] = False
        checks += 1
        q = polynomial(adj, state(), scale)
        assert q(whole) > 0
        assert all(not live[i] or red[i] <= s-2 for i in range(n))
        if checks % 15 == 0:
            assert min(q(S) for S in range(1 << n)) > 0
    return checks


def main():
    a, b = check_updates()
    print(f"{a} positive states; {b} endpoint updates verified exactly.")
    rng = Random(905)
    boards = [(n, list(combinations(range(n), 2)), 6) for n in (7, 8, 9, 10)]
    boards += [(n, [e for e in combinations(range(n), 2)
                    if min(e[1]-e[0], n+e[0]-e[1]) <= 4], 6) for n in (11, 12, 13, 14)]
    boards += [(12, [(a, b) for a in range(6) for b in range(6, 12)], 6)]
    turns = sum(play(*board, rng) for board in boards for _ in range(48))
    print(f"{len(boards)*48} games checked, with {turns} actual Breaker replies.")


if __name__ == "__main__":
    main()
