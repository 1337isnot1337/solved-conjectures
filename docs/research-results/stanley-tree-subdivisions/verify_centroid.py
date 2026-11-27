#!/usr/bin/env python3
"""Check both centroid extractions on the same rooted branch collection."""

from collections import Counter
from itertools import combinations


def forest_polynomial(vertices, edges, root=None):
    terms = Counter()
    for kept_count in range(len(edges) + 1):
        for kept in combinations(edges, kept_count):
            component = {v: v for v in vertices}
            for u, v in kept:
                old, new = component[u], component[v]
                for point in vertices:
                    if component[point] == old:
                        component[point] = new
            sizes = Counter(component.values())
            if root is not None:
                del sizes[component[root]]
            terms[tuple(sorted(sizes.values()))] += 1
    return terms


def truncate(poly, cutoff):
    return {key: value for key, value in poly.items() if value and sum(key) <= cutoff}


def multiply(left, right, cutoff):
    result = Counter()
    for first, first_count in left.items():
        for second, second_count in right.items():
            if sum(first) + sum(second) <= cutoff:
                result[tuple(sorted(first + second))] += first_count * second_count
    return truncate(result, cutoff)


def quotient(numerator, denominator, cutoff):
    assert denominator[()] == 1
    tail = {key: -value for key, value in denominator.items() if key}
    result = Counter()
    term = truncate(numerator, cutoff)
    while term:
        result.update(term)
        term = multiply(term, tail, cutoff)
    return truncate(result, cutoff)


def branch_poly(vertices, edges, root):
    return forest_polynomial(vertices, edges) + forest_polynomial(vertices, edges, root)


def main():
    branches = [
        ((1, 2, 3, 4), ((1, 2), (2, 3), (3, 4)), 1),
        ((5, 6, 7), ((5, 6), (6, 7)), 5),
        ((8, 9, 10), ((8, 9), (8, 10)), 8),
        ((11, 12), ((11, 12),), 11),
    ]
    branches.extend(((v,), (), v) for v in range(13, 17))
    all_edges = tuple(edge for _, edges, _ in branches for edge in edges)
    all_edges += tuple((0, root) for _, _, root in branches)
    cutoff = 8
    unrooted = forest_polynomial(tuple(range(17)), all_edges)
    cropped = {
        key[:-1]: value for key, value in unrooted.items()
        if key[-1] > cutoff
    }
    assert cropped == truncate(forest_polynomial(tuple(range(17)), all_edges, 0), cutoff)

    factors = [branch_poly(*branch) for branch in branches]
    product = {(): 1}
    for factor in factors:
        product = multiply(product, factor, cutoff)
    assert product == cropped

    # The single size-four branch uses the largest-power extraction.
    assert cropped[(4,)] == 1
    smaller = {tuple(v for v in key if v != 4): count
               for key, count in cropped.items() if 4 in key}
    assert quotient(cropped, smaller, 4) == factors[0]
    cropped = quotient(cropped, factors[0], cutoff)

    # The two size-three rooted shapes use the logarithmic derivative.
    assert cropped[(3,)] == 2
    constant = {key: count for key, count in cropped.items() if 3 not in key}
    derivative = {tuple(v for v in key if v != 3): count
                  for key, count in cropped.items() if key.count(3) == 1}
    reciprocal_sum = quotient(derivative, constant, cutoff - 3)
    residues = [{key: count for key, count in factor.items() if 3 not in key}
                for factor in factors[1:3]]
    denominator = multiply(*residues, cutoff - 3)
    numerator = multiply(reciprocal_sum, denominator, cutoff - 3)
    assert residues[0] != residues[1]
    assert numerator == Counter(residues[0]) + Counter(residues[1])

    print("17 vertices, all 65536 edge subsets, both extraction methods passed")


if __name__ == "__main__":
    main()
