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


if __name__ == "__main__":
    for sizes in ((3, 4), (2, 2, 2, 2), (2, 2, 3)):
        check(sizes)
