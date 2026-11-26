"""Cross-check the substitution criterion and the induced-biclique counting step."""

from itertools import combinations, product
from math import comb


def subsets(vertices):
    for size in range(len(vertices) + 1):
        for subset in combinations(vertices, size):
            yield frozenset(subset)


def graphs(order):
    vertices = range(order)
    for edges in subsets(list(combinations(vertices, 2))):
        yield vertices, edges


def independent_sets(vertices, edges):
    return [part for part in subsets(vertices) if not any(u in part and v in part for u, v in edges)]


def maximal(parts):
    return [part for part in parts if not any(part < larger for larger in parts)]


def hits(test, family):
    return all(test & member for member in family)


def check_substitutions():
    cases = 0
    for vertices, edges in graphs(3):
        supports = maximal(independent_sets(vertices, edges))
        for internal_edges in product([False, True], repeat=3):
            fibers = [frozenset((2 * v, 2 * v + 1)) for v in vertices]
            choices = [[frozenset([u]) for u in fiber] if joined else [fiber]
                       for fiber, joined in zip(fibers, internal_edges)]
            expanded = {(a, b) for u, v in edges for a in fibers[u] for b in fibers[v]}
            expanded.update(tuple(sorted(fiber)) for fiber, joined in zip(fibers, internal_edges) if joined)
            actual = set(maximal(independent_sets(range(6), expanded)))
            expected = {frozenset().union(*parts) for support in supports
                        for parts in product(*(choices[v] for v in support))}
            assert actual == expected
            for test in subsets(range(6)):
                marked = {v for v in vertices if hits(test, choices[v])}
                assert hits(test, actual) == hits(marked, supports)
                cases += 1
    return cases


def check_bicliques():
    pairs_checked = 0
    for vertices, edges in graphs(5):
        independent = independent_sets(vertices, edges)
        neighbors = {v: {b if a == v else a for a, b in edges if v in (a, b)} for v in vertices}
        # On four vertices the induced graph is K_{2,2} exactly when all degrees are two.
        square_free = all(any(len(neighbors[v] & set(four)) != 2 for v in four)
                          for four in combinations(vertices, 4))
        for block in independent:
            if len(block) < 2:
                continue
            for part in independent:
                incidences = sum(comb(len(neighbors[v] & block), 2) for v in part)
                common = [len(part & neighbors[u] & neighbors[v]) for u, v in combinations(block, 2)]
                assert incidences == sum(common)
                if square_free:
                    assert max(common) <= 1
                pairs_checked += 1
    return pairs_checked


if __name__ == "__main__":
    print(f"{check_substitutions():,} marked-set tests on 64 unequal or equal fiber assignments.")
    print(f"{check_bicliques():,} independent-block pairs on all 1,024 labelled five-vertex graphs.")
