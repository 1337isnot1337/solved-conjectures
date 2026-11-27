#!/usr/bin/env python3
"""Exact finite checks for the transversal construction."""
from itertools import combinations, product


def make(sizes):
    A = tuple(("a", j) for j in range(len(sizes)))
    groups = tuple(tuple(("b", j, i) for i in range(d))
                   for j, d in enumerate(sizes))
    B = sum(groups, ())
    choices = tuple(product(*groups))
    X = tuple(("x", *t) for t in choices)
    V = A + B + X
    E = {frozenset(e) for side in (A, B) for e in combinations(side, 2)}
    E.update(frozenset((a, b)) for a in A for b in B if a[1] != b[1])
    for x, t in zip(X, choices):
        E.update(frozenset((x, v)) for v in A + B if v not in t)
    return A, B, X, groups, choices, V, E


def check(sizes):
    A, B, X, groups, choices, V, E = make(sizes)
    d = len(B)
    count = 0
    for W in combinations(V, 4):
        deg = [sum(frozenset((u, v)) in E for v in W if v != u)
               for u in W]
        assert deg != [1, 1, 1, 1], W
        count += 1
    base = {b: j for j, b in enumerate(B)}
    for t in choices:
        C = base | {a: base[b] for a, b in zip(A, t)}
        # Normalize the colors on the clique B. The choices t are
        # exactly all possible proper d-colorings of A+B after this.
        blocked = [
            x for x in X
            if {C[v] for v in A + B if frozenset((x, v)) in E} == set(range(d))
        ]
        assert blocked == [("x", *t)], (t, blocked)
    for drop in V:
        C = {b: j for j, b in enumerate(v for v in B if v != drop)}
        t = (drop[1:] if drop in X else
             tuple(next(b for b in Q if b != drop) for Q in groups))
        C.update({a: C[b] for a, b in zip(A, t) if a != drop})
        for x in X:
            if x == drop:
                continue
            if drop in B:
                C[x] = d - 1
            elif drop in A:
                C[x] = C[x[drop[1] + 1]]
            else:
                C[x] = C[next(b for b in x[1:] if b not in t)]
        assert set(C) == set(V) - {drop}
        assert set(C.values()) <= set(range(d))
        assert all(drop in e or len({C[v] for v in e}) == 2 for e in E)
    assert len(X) > len(A + B) + 1
    assert all(frozenset(e) not in E for e in combinations(X, 2))
    assert all(frozenset(e) in E for e in zip(B, B[1:]))
    print(f"{sizes}: {len(V)} vertices, {len(E)} edges, {count} induced "
          f"four-sets, {len(choices)} core colorings, {len(V)} deletion "
          f"colorings; chromatic number {d + 1}, path span {d}.")


def check_published_selectors(ell=11):
    """Specialize Rzążewski's palette reduction to two edgeless groups."""
    V = [("s", i, a, j) for i in range(2) for a in range(4)
         for j in range(1, ell + 2)]
    X = [("x", p, q) for p in range(1, ell + 1)
         for q in range(1, ell + 1)]
    Reps = [("r", c) for c in range(8)]
    names = V + X + Reps
    neighbor = {v: set() for v in names}
    lists = {}

    def add(u, v):
        neighbor[u].add(v)
        neighbor[v].add(u)

    for v in V:
        _, i, a, j = v
        forward = 4 * i + (a + 1) % 4
        current = 4 * i + a
        lists[v] = ({forward} if j == 1 else {current}
                    if j == ell + 1 else {current, forward})
    for v, u in combinations(V, 2):
        _, i, a, p = v
        _, j, b, q = u
        delta = (b - a) % 4
        if i != j or delta == 2 or (delta == 1 and p >= q) or (
            delta == 3 and q >= p
        ):
            add(v, u)
    for x in X:
        lists[x] = {0, 1, 4, 5}
        for v in V:
            _, i, a, j = v
            u = x[1 + i]
            if a == 2 or (a == 1 and j <= u + 1) or (a == 3 and j >= u):
                add(x, v)
    for u, v in combinations(Reps, 2):
        add(u, v)
    for v in V + X:
        for r in Reps:
            if r[1] not in lists[v]:
                add(v, r)

    # The common non-neighborhood of each edge must be independent.
    ix = {v: k for k, v in enumerate(names)}
    mask = {v: sum(1 << ix[u] for u in neighbor[v]) for v in names}
    full = (1 << len(names)) - 1
    edges = [(v, u) for v in names for u in neighbor[v] if ix[v] < ix[u]]
    for u, v in edges:
        non = full & ~(mask[u] | mask[v])
        rest = non
        while rest:
            bit = rest & -rest
            w = names[bit.bit_length() - 1]
            assert not (mask[w] & non), (u, v, w)
            rest ^= bit
    assert len(X) > len(V) + len(Reps) + 1
    assert all(not (neighbor[x] & set(X)) for x in X)
    for blocked in X:
        C = {r: r[1] for r in Reps}
        for v in V:
            _, i, a, j = v
            C[v] = 4 * i + ((a + 1) % 4 if j <= blocked[1 + i] else a)
            assert C[v] in lists[v]
        for x in X:
            free = set(range(8)) - {C[v] for v in neighbor[x]}
            if x == blocked:
                assert not free
            else:
                assert free
                C[x] = min(free)
        assert all(u == blocked or v == blocked or C[u] != C[v]
                   for u, v in edges)
    print(f"Published selectors: {len(names)} vertices, {len(edges)} "
          f"edge co-neighborhoods, {len(X)} witness deletion colorings.")


if __name__ == "__main__":
    for sizes in ((3, 4), (2, 2, 2, 2), (2, 2, 3)):
        check(sizes)
    check_published_selectors()
