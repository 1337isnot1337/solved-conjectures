"""Exact finite cross-checks for the signed histogram and the quotient-tag argument."""
from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations, combinations_with_replacement
from math import comb
from random import Random


def tree_key(tree):
    def branch(u, parent):
        return '(' + ''.join(sorted(branch(v, u) for v in tree[u] if v != parent)) + ')'
    return min(branch(u, -1) for u in range(len(tree)))


def small_trees(limit):
    level = [[(1,), (0,)]]
    for n in range(2, limit + 1):
        yield from level
        if n == limit:
            break
        following = {}
        for tree in level:
            for v in range(n):
                added = tree.copy() + [(v,)]
                added[v] = (*added[v], n)
                following.setdefault(tree_key(added), added)
        level = list(following.values())


def check_histogram(tree, separated):
    n = len(tree)
    edges = [(i, j) for i in range(n) for j in tree[i] if i < j]
    weights = {edge: (4 ** k if separated else 1) for k, edge in enumerate(edges)}
    measure = Counter()
    for i in range(n):
        stack = [(i, -1, 0)]
        while stack:
            u, parent, distance = stack.pop()
            if u > i:
                measure[distance] += (len(tree[i]) - 2) * (len(tree[u]) - 2)
            for v in tree[u]:
                if v != parent:
                    stack.append((v, u, distance + weights[tuple(sorted((u, v)))]))
    leaves = sum(len(adj) == 1 for adj in tree)
    kappa = sum(comb(len(adj) - 2, 2) for adj in tree if len(adj) > 3)
    budget = sum((len(adj) - 2) ** 2 for adj in tree)
    assert 2 * leaves == budget + 2 - 2 * kappa
    assert sum(x * y for x, y in measure.items()) == sum(weights.values())
    negative = sum(-x for x in measure.values() if x < 0)
    assert negative <= leaves * (leaves - 2)
    if separated:
        assert negative == leaves * (leaves - 2)
        support = {x for x, y in measure.items() if y}
        decomposable = {a + b for a, b in combinations_with_replacement(support, 2)}
        assert support - decomposable == set(weights.values())
        for e, f in combinations(edges, 2):
            assert ((weights[e] + weights[f]) in support) == bool(set(e) & set(f))
    return negative < leaves * (leaves - 2)


def normal_forms(rows, dimension):
    pivot_rows = []
    for row in rows:
        v = list(map(Fraction, row))
        for j, normalized in pivot_rows:
            a = v[j]
            v = [x - a * y for x, y in zip(v, normalized)]
        if any(v):
            j = next(i for i, x in enumerate(v) if x)
            a = v[j]
            pivot_rows.append((j, [x / a for x in v]))
    units = []
    for i in range(dimension):
        v = [Fraction(j == i) for j in range(dimension)]
        for j, normalized in pivot_rows:
            a = v[j]
            v = [x - a * y for x, y in zip(v, normalized)]
        units.append(tuple(v))
    return units, len(pivot_rows)


def quotient_exercise(n, rows):
    units, rank = normal_forms(rows, n)
    fibers = defaultdict(list)
    labels = range(n)
    for path in [(), *((i,) for i in labels), *combinations(labels, 2)]:
        key = tuple(sum(units[i][k] for i in path) for k in labels)
        fibers[key].append(frozenset(path))
    exceptional = set()
    for fiber in fibers.values():
        base = fiber[0]
        for other in fiber[1:]:
            exceptional.update(base ^ other)
    assert len(exceptional) <= 4 * rank
    for fiber in fibers.values():
        outside = [p - exceptional for p in fiber]
        assert all(s == outside[0] for s in outside)
        if len(outside[0]) == 2:
            assert len(fiber) == 1
    return len(exceptional)


def main():
    reduced, cancellations = 0, 0
    for tree in small_trees(12):
        if all(len(x) != 2 for x in tree):
            check_histogram(tree, True)
            cancellations += check_histogram(tree, False)
            reduced += 1
    rng = Random(315)
    tests, sharp = 0, 0
    for n in range(4, 14):
        for r in range(1, min(4, n) + 1):
            for _ in range(8):
                rows = []
                for _ in range(r):
                    row = [0] * n
                    for i in rng.sample(range(n), rng.randint(1, min(n, 6))):
                        row[i] = rng.choice([-2, -1, 1, 2])
                    rows.append(row)
                quotient_exercise(n, rows)
                tests += 1
            if 4*r <= n:
                sparse = [[(1 if j % 4 < 2 else -1) if j // 4 == i else 0
                           for j in range(n)] for i in range(r)]
                assert quotient_exercise(n, sparse) == 4*r
                sharp += 1
    print(f'{reduced} reduced topologies through order twelve, both separated and unit lengths')
    print(f'{cancellations} unit-length topologies exhibit strict negative-mass cancellation')
    print(f'{tests} rational quotient tests and {sharp} equality cases in the four-label bound')


if __name__ == '__main__':
    main()
