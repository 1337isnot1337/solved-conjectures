#!/usr/bin/env python3
"""Exact small-tree checks for the balanced-edge and branch moment identities."""

from collections import Counter
from itertools import combinations_with_replacement

from verify_centroid import branch_poly, forest_polynomial, multiply, truncate


def rooted_shapes(max_order):
    """Encode each rooted tree by the sorted tuple of its children's encodings."""
    by_order = {1: [()]}
    for order in range(2, max_order + 1):
        choices = [(size, tree) for size, trees in by_order.items() for tree in trees]

        def forests(remaining, start):
            if remaining == 0:
                yield ()
            for index in range(start, len(choices)):
                size, tree = choices[index]
                if size > remaining:
                    break
                for rest in forests(remaining - size, index):
                    yield (tree,) + rest

        by_order[order] = list(forests(order - 1, 0))
    return by_order


def edges_at_root(tree, first=0):
    edges = []
    next_vertex = first + 1

    def visit(children, parent):
        nonlocal next_vertex
        for child in children:
            vertex = next_vertex
            next_vertex += 1
            edges.append((parent, vertex))
            visit(child, vertex)

    visit(tree, first)
    return edges


def check_balanced_edge(shapes):
    pairs = forest_count = 0
    for h, trees in shapes.items():
        for first, second in combinations_with_replacement(trees, 2):
            left, right = edges_at_root(first), edges_at_root(second, h)
            u_left = forest_polynomial(range(h), left)
            u_right = forest_polynomial(range(h, 2 * h), right)
            p_left = forest_polynomial(range(h), left, 0)
            p_right = forest_polynomial(range(h, 2 * h), right, h)
            combined = multiply(p_left, p_right, 2 * h)
            whole = forest_polynomial(range(2 * h), left + [(0, h)] + right)

            from_large_parts = {monomial[:-1]: count for monomial, count in whole.items()
                                if monomial[-1] > h}
            assert from_large_parts == truncate(combined, h - 1)

            residual = whole.copy()
            for monomial, count in combined.items():
                central_size = 2 * h - sum(monomial)
                residual[tuple(sorted((*monomial, central_size)))] -= count
            assert all(count >= 0 for count in residual.values())
            assert +residual == multiply(u_left, u_right, 2 * h)
            pairs += 1
            forest_count += 2 ** (2 * h - 1)
    return pairs, forest_count


def inverse_series(coefficients, cutoff):
    assert coefficients[0] == 1
    inverse = [1]
    for degree in range(1, cutoff + 1):
        inverse.append(-sum(coefficients[j] * inverse[degree - j]
                            for j in range(1, min(degree, len(coefficients) - 1) + 1)))
    return inverse


def check_sparse_moments(trees):
    # Specialize x_i to a_i t^i after deleting the distinguished x_5 term.
    b, multiplicity = 5, 8
    weights = [0, 2, 3, 5, 7]
    moment_vectors = []
    for tree in trees:
        factors = branch_poly(range(b), edges_at_root(tree), 0)
        assert factors.pop((b,)) == 1
        coefficients = [0] * (b + 1)
        for monomial, count in factors.items():
            term = count
            for size in monomial:
                term *= weights[size]
            coefficients[sum(monomial)] += term
        z = inverse_series(coefficients, 2 * b)
        square = [sum(z[j] * z[k - j] for j in range(k + 1)) for k in range(2 * b + 1)]
        moment_vectors.append(z + square)
    pure = {tuple(multiplicity * entry for entry in vector): i
            for i, vector in enumerate(moment_vectors)}
    assert len(pure) == len(trees)
    possibilities = 0
    for indices in combinations_with_replacement(range(len(trees)), multiplicity):
        found = tuple(sum(entries) for entries in zip(*(moment_vectors[i] for i in indices)))
        if found in pure:
            assert indices == (pure[found],) * multiplicity
        possibilities += 1
    return possibilities


def main():
    shapes = rooted_shapes(5)
    assert [len(group) for group in shapes.values()] == [1, 1, 2, 4, 9]
    pairs, forests = check_balanced_edge(shapes)
    possibilities = check_sparse_moments(shapes[5])
    assert (pairs, forests, possibilities) == (60, 24426, 12870)
    print(f"{pairs} balanced joins, {forests} spanning forests, "
          f"{possibilities} branch multisets checked against all nine repeated shapes")


if __name__ == "__main__":
    main()
