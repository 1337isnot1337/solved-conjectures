#!/usr/bin/env python3
"""Audit alternating-path closure, codegree counting and rebasing."""
from collections import deque
from itertools import combinations
from random import Random


def longest(X, nY, root):
    Y = [{a for a, links in enumerate(X) if b in links} for b in range(nY)]

    def visit(core, used):
        yield core, used
        for b in X[core[-1]] - set(used):
            for a in Y[b] - set(core):
                yield from visit(core + (a,), used + (b,))

    return max(visit((root,), ()), key=lambda p: (len(p[0]), p)), Y


def component(X, initial, include_unused=True):
    seen = {initial}
    todo = deque(seen)
    while todo:
        core, used = todo.popleft()
        last = core[-1]
        for i, b in enumerate(used):
            options = X[last] & X[core[i]] - set(used) if include_unused else set()
            if b in X[last]:
                options.add(b)
            for w in options:
                p = (core[:i + 1] + core[i + 1:][::-1],
                     used[:i] + (w,) + used[i + 1:][::-1])
                if p not in seen:
                    seen.add(p)
                    todo.append(p)
    return seen


def check(X, nY, root):
    initial, Y = longest(X, nY, root)
    if not initial[1]:
        return 0, 0, False
    paths = component(X, initial)
    R = {core[-1] for core, _ in paths}
    classic = {core[-1] for core, _ in component(X, initial, False)}
    mu = max(1, *(len(p & q) for p, q in combinations(X, 2)))
    nbr = set.union(*(X[a] for a in R))
    counts = 0
    for core, used in paths:
        assert core[0] == root and set(core) == set(initial[0])
        assert len(core) == len(set(core)) == len(set(used)) + 1
        assert all(b in X[a] and b in X[v] for a, b, v in zip(core, used, core[1:]))
        S = {v for i, a in enumerate(core) if a in R
             for v in core[max(0, i - 1):i + 2]}
        I, J = nbr & set(used), nbr - set(used)
        assert len(S) <= 3 * len(R) - 1
        assert len(I) <= 2 * len(R) - 1
        assert all(Y[b] <= S for b in J)
        u = core[-1]
        total = len(X[u] & set(used)) + sum(len(Y[b]) - 1 for b in X[u] - set(used))
        assert total <= mu * len(R)
        if X[root] & J:
            assert any((X[root] & X[h[-1]]) - set(w) for h, w in paths)
        if J:
            counts += 1
    return len(paths), counts, len(classic) < len(R)


def main():
    rng = Random(642)
    paths = exterior = strict = 0
    fixture = None
    for nX, nY, masks in [(3, 4, range(1 << 12)),
                           (4, 5, [rng.randrange(1 << 20) for _ in range(512)]),
                           (5, 6, [rng.randrange(1 << 30) for _ in range(96)])]:
        for mask in masks:
            X = [{b for b in range(nY) if mask >> (a * nY + b) & 1}
                 for a in range(nX)]
            for root in range(nX):
                p, j, t = check(X, nY, root)
                paths += p
                exterior += j
                strict += t
                if t and fixture is None:
                    fixture = (X, nY, root)
    assert fixture is not None and exterior > 0
    print(f"Checked {paths:,} rebased paths ({exterior:,} with exterior neighbor labels)")
    print(f"Strictly more endpoints than used-label rotations in {strict:,} rooted fixtures")
    print(f"First strict fixture (X-neighborhoods, number of labels, root): {fixture}")


if __name__ == "__main__":
    main()
