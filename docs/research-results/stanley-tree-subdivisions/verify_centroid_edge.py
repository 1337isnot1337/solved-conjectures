#!/usr/bin/env python3
"""Exact small-tree checks for the balanced-edge and branch moment identities."""

from collections import Counter
from itertools import combinations_with_replacement
from math import comb

from verify_centroid import branch_poly, forest_polynomial, multiply, truncate


def require(condition, message):
    if not condition:
        raise ValueError(message)


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
            require(from_large_parts == truncate(combined, h - 1), "Wrong balanced-edge truncation")

            residual = whole.copy()
            for monomial, count in combined.items():
                central_size = 2 * h - sum(monomial)
                residual[tuple(sorted((*monomial, central_size)))] -= count
            require(all(count >= 0 for count in residual.values()), "Negative residual coefficient")
            require(+residual == multiply(u_left, u_right, 2 * h), "Wrong half-polynomial product")
            pairs += 1
            forest_count += 2 ** (2 * h - 1)
    return pairs, forest_count


def inverse_series(coefficients, cutoff):
    require(coefficients[0] == 1, "Inverse series needs constant one")
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
        require(factors.pop((b,)) == 1, "Missing connected-branch term")
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
    require(len(pure) == len(trees), "Different shapes share the same moment signature")
    possibilities = 0
    for indices in combinations_with_replacement(range(len(trees)), multiplicity):
        found = tuple(sum(entries) for entries in zip(*(moment_vectors[i] for i in indices)))
        if found in pure:
            require(indices == (pure[found],) * multiplicity, "Mixed branches match pure moments")
        possibilities += 1
    return possibilities


def branch_product(factors, indices, cutoff):
    result = {(): 1}
    for index in indices:
        result = multiply(result, factors[index], cutoff)
    return result


def check_repeated_branches(trees, b, copies):
    """Compare every mixed product against each pure target at the sharp cutoff 2b."""
    factors = [branch_poly(range(b), edges_at_root(tree), 0) for tree in trees]
    targets = {}
    for index in range(len(trees)):
        pure = (index,) * copies
        signature = frozenset(branch_product(factors, pure, 2 * b).items())
        if signature in targets:
            raise ValueError("Different repeated branches gave the same truncation")
        targets[signature] = pure

    checked = 0
    for indices in combinations_with_replacement(range(len(trees)), copies):
        signature = frozenset(branch_product(factors, indices, 2 * b).items())
        if signature in targets and targets[signature] != indices:
            raise ValueError(f"Mixed branches match a repeated branch: {indices}")
        checked += 1
    if checked != comb(len(trees) + copies - 1, copies):
        raise ValueError("Incomplete enumeration of branch multisets")
    return checked


def check_enlarged_cutoff(trees, b, copies):
    """Read the branch size, multiplicity and enlarged rooted product from unrooted forests."""
    n = copies * b + 1
    factors = [branch_poly(range(b), edges_at_root(tree), 0) for tree in trees]
    count = 0
    for indices in combinations_with_replacement(range(len(trees)), copies):
        edges = []
        for offset, index in enumerate(indices):
            root = 1 + offset * b
            edges.append((0, root))
            edges.extend(edges_at_root(trees[index], root))

        whole = forest_polynomial(range(n), edges)
        initial = {key[:-1]: value for key, value in whole.items() if 2 * key[-1] > n}
        largest = max(part for key in initial for part in key)
        if (largest, initial[(largest,)]) != (b, copies):
            raise ValueError("The initial cutoff missed the common branch size or multiplicity")
        enlarged = {key[:-1]: value for key, value in whole.items() if key[-1] > largest}
        if enlarged != branch_product(factors, indices, n - largest - 1):
            raise ValueError("Large-component extraction differs from the rooted product")
        count += 2 ** len(edges)
    return count


def main():
    shapes = rooted_shapes(5)
    require([len(group) for group in shapes.values()] == [1, 1, 2, 4, 9], "Missing rooted shape")
    pairs, forests = check_balanced_edge(shapes)
    possibilities = check_sparse_moments(shapes[5])
    require((pairs, forests, possibilities) == (60, 24426, 12870), "Incomplete original checks")
    print(f"{pairs} balanced joins, {forests} spanning forests, "
          f"{possibilities} branch multisets checked against all nine repeated shapes")
    for copies in (3, 4):
        multisets = check_repeated_branches(shapes[5], 5, copies)
        forest_count = check_enlarged_cutoff(shapes[3], 3, copies)
        print(f"{copies} branches: {multisets} order-five multisets checked through weight ten; "
              f"enlarged cutoff verified on {forest_count} spanning forests")



if __name__ == "__main__":
    main()
