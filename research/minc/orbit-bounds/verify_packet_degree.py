"""Exact checks for the cycle weights and local matching probabilities."""

from collections import Counter
from fractions import Fraction
from itertools import combinations, permutations
from math import factorial, prod


def edges_of_cycle(order):
    return tuple(tuple(sorted((i, (i + 1) % order))) for i in range(order))


def disjoint(edges):
    return len({i for edge in edges for i in edge}) == 2 * len(edges)


def priority_checks(order):
    edges = edges_of_cycle(order)
    neighbors = [
        [j for j in range(order) if j != i and set(e).intersection(edges[j])]
        for i, e in enumerate(edges)
    ]
    joint = Counter()
    for ranks in permutations(range(order)):
        local = [i for i in range(order) if all(ranks[i] < ranks[j] for j in neighbors[i])]
        for size in range(len(local) + 1):
            joint.update(combinations(local, size))
    for size in range(order // 2 + 1):
        for indices in combinations(range(order), size):
            if disjoint([edges[i] for i in indices]):
                assert joint[indices] * 3**size >= factorial(order)
    if order >= 5:
        assert Fraction(joint[(0, 2)], factorial(order)) == Fraction(2, 15)


def weighted_cycle_check(order):
    edges = edges_of_cycle(order)
    weights = {edge: Fraction(1 + i % 4, 9) for i, edge in enumerate(edges)}
    matchings = [
        matching
        for size in range(order // 2 + 1)
        for matching in combinations(edges, size)
        if disjoint(matching)
    ]
    partition = sum(prod(weights[e] ** 2 for e in matching) for matching in matchings)
    permanent = sum(
        prod(1 if i == j else weights.get(tuple(sorted((i, j))), 0) for i, j in enumerate(perm))
        for perm in permutations(range(order))
    )
    assert permanent == partition + 2 * prod(weights.values())
    if order in (4, 5):
        maximum = [matching for matching in matchings if len(matching) == 2]
        mean = sum(prod(1 + 3 * weights[e] ** 2 for e in match) for match in maximum) / len(maximum)
        assert mean >= permanent
    elif order >= 6:
        surplus = sum(
            (weights[edges[i]] * weights[edges[(i + 2) % order]]) ** 2
            for i in range(order)
        ) / 5
        assert partition + surplus >= permanent


if __name__ == "__main__":
    for size in range(3, 9):
        priority_checks(size)
        weighted_cycle_check(size)
    print("Passed exact inclusion probabilities and weighted cycle decompositions for sizes 3–8.")
