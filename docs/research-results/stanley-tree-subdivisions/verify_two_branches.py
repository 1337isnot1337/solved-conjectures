#!/usr/bin/env python3
"""Test the two-branch recognition conditions with exact spanning-forest counts."""

from collections import Counter, defaultdict
from functools import cache
from itertools import combinations_with_replacement

from verify_centroid import branch_poly, forest_polynomial, multiply
from verify_centroid_edge import edges_at_root, require, rooted_shapes


@cache
def proper_fringes(tree):
    counts = Counter()
    for child in tree:
        descendants = proper_fringes(child)
        counts[1 + sum(descendants.values())] += 1
        counts.update(descendants)
    return counts


def restored(poly, order):
    result = Counter()
    for term, coefficient in poly.items():
        mark = order - sum(term)
        key = tuple(sorted((*term, mark))) if mark else term
        result[key] += coefficient
    return result


def parity(poly):
    return frozenset(term for term, count in poly.items() if count % 2)


def check_order(shapes, b):
    factors = [branch_poly(range(b), edges_at_root(tree), 0) for tree in shapes]
    fringes = [proper_fringes(tree) for tree in shapes]
    eligible = sum(all(not (fringe[j] and fringe[j + 1])
                       for j in range(b % 2 or 2, b - 1, 2)) for fringe in fringes)
    pure_cutoffs = defaultdict(list)
    pure_parities = defaultdict(list)
    allocations = {}
    nontrivial_parities = alternative_allocations = 0
    for i, (shape, poly) in enumerate(zip(shapes, factors)):
        require(all(poly[(j,)] == fringes[i][j] for j in range(1, b)), "Incorrect fringe counts")
        square = multiply(poly, poly, b)
        pure_cutoffs[frozenset(square.items())].append(i)
        pure_parities[parity(square)].append(i)
        allocations[tuple(sorted(shape + shape))] = i

    for j, k in combinations_with_replacement(range(len(shapes)), 2):
        reduced = multiply(factors[j], factors[k], b)
        matches = pure_cutoffs.get(frozenset(reduced.items()), [])
        require(all(i == j == k for i in matches), "Unexpected integral cutoff match")
        if j != k:
            for i in pure_parities.get(parity(reduced), []):
                diff = parity(factors[i]) ^ parity(factors[j])
                h = min(map(sum, diff), default=b + 1)
                if 2 * h <= b:
                    L = b - 2 * h
                    require(L > 0 and fringes[j][L] % 2 and fringes[k][L] % 2,
                            "The truncated parity identity missed a required fringe")
                    nontrivial_parities += 1
        i = allocations.get(tuple(sorted(shapes[j] + shapes[k])))
        if i is not None and j != k:
            # Identical combined children permit mixed allocations. The weight-b
            # sum U_B+U_C must differ from 2U_A for each genuinely different pair.
            all_terms = set(factors[i]) | set(factors[j]) | set(factors[k])
            require(any(sum(term) == b and factors[j][term] + factors[k][term]
                        != 2 * factors[i][term] for term in all_terms), "Ambiguous allocation")
            alternative_allocations += 1
        if b <= 4:
            tree = (shapes[j], shapes[k])
            direct = forest_polynomial(range(2 * b + 1), edges_at_root(tree))
            glued = restored(multiply(factors[j], factors[k], 2 * b), 2 * b + 1)
            require(direct == glued, "Gluing formula differs from spanning-forest enumeration")
    pairs = len(shapes) * (len(shapes) + 1) // 2
    print(f"b={b}: {len(shapes)} shapes, {eligible} satisfy the fringe condition, {pairs} pairs, "
          f"{nontrivial_parities} mixed parity comparisons, {alternative_allocations} mixed allocations")


def check_parity_witness():
    # Formal factors at b=3. Only B is claimed to be a tree factor.
    # A parity collision here exercises the necessity of the consecutive orders.
    a = Counter([(), (2,), (3,), (1, 2)])
    b = branch_poly(range(3), [(0, 1), (1, 2)], 0)
    c = Counter([(), (1,), (2,), (3,)])
    for poly in (a, b, c):
        require(not parity(restored(poly, 3)), "Formal branch completion failed")
    require(parity(b) != parity(c), "The witness must have unequal factors")
    require(parity(multiply(a, a, 3)) == parity(multiply(b, c, 3)), "Cutoff mismatch")
    require(parity(restored(multiply(a, a, 6), 7)) == parity(restored(multiply(b, c, 6), 7)),
            "Full parity mismatch")
    require(all(b[(i,)] % 2 for i in (1, 2)), "Wrong consecutive fringe parities")
    print("Formal mixed/full-square parity witness passed at b=3")


if __name__ == "__main__":
    for order, shapes in rooted_shapes(8).items():
        check_order(shapes, order)
    check_parity_witness()
