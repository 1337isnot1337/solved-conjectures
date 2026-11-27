#!/usr/bin/env python3
"""Exact checks of the ordinary-CSF long-subdivision recognition theorem.

Alongside the centroid verifiers, run python3 verify_long_subdivision.py.
From a separate directory, set PYTHONPATH to research/stanley-tree-isomorphism.
"""

from collections import Counter, defaultdict
from functools import cache
from itertools import combinations_with_replacement

from verify_centroid import branch_poly, forest_polynomial, multiply, truncate
from verify_centroid_edge import edges_at_root, require, rooted_shapes


@cache
def order(tree):
    return 1 + sum(order(child) for child in tree)


@cache
def forest_data(tree):
    """Compute P, U and Q independently from the child product recurrence."""
    size = order(tree)
    rooted = {(): 1}
    for child in tree:
        rooted = multiply(rooted, forest_data(child)[2], size - 1)
    ordinary = Counter()
    for term, count in rooted.items():
        root_part = size - sum(term)
        ordinary[tuple(sorted((*term, root_part)))] += count
    branch = Counter(rooted)
    branch.update(ordinary)
    return rooted, dict(ordinary), dict(branch)


def normalized(poly, cutoff):
    """Multiply by 1-sum x_i and truncate, retaining negative coefficients."""
    result = Counter(truncate(poly, cutoff))
    for term, count in poly.items():
        for index in range(1, cutoff - sum(term) + 1):
            result[tuple(sorted((*term, index)))] -= count
    return {term: count for term, count in result.items() if count}


@cache
def factor(tree):
    return normalized(forest_data(tree)[2], order(tree))


def strip_stem(tree):
    while len(tree) == 1:
        tree = tree[0]
    return tree


def extend(tree, count):
    for _ in range(count):
        tree = (tree,)
    return tree


def largest_index(poly):
    return max((index for term in poly for index in term), default=0)


def signature(poly):
    return tuple(sorted(poly.items()))


def canonical_free(tree):
    """Identify each unrooted tree by the smallest encoding over all roots."""
    adjacency = [[] for _ in range(order(tree))]
    for left, right in edges_at_root(tree):
        adjacency[left].append(right)
        adjacency[right].append(left)

    def reroot(vertex, parent):
        return tuple(sorted(reroot(child, vertex) for child in adjacency[vertex] if child != parent))

    return min(reroot(vertex, -1) for vertex in range(len(adjacency)))


def encode_arms(left, right, size):
    """Odd central vertex, or even central edge ending in unary vertices."""
    if size % 2:
        return left, right
    return left, (right,)


def central_input(ordinary, size):
    h = size // 2
    cutoff = (size - 1) // 2
    if size % 2 == 0 and ordinary.get((h, h), 0) != 1:
        return None
    cropped = {term[:-1]: count for term, count in ordinary.items() if term[-1] > h}
    if cropped.get((cutoff,), 0) != 2:
        return None
    return cropped


def check_factors(shapes):
    inspected = 0
    for size, trees in shapes.items():
        if size > 8:
            break
        for tree in trees:
            core = strip_stem(tree)
            poly = factor(tree)
            require(poly == factor(core), 'Unary extension changed its factor')
            require(max(map(sum, poly)) == order(core) - 1, 'Wrong weighted degree')
            if core:
                top = order(core) - 1
                require(poly.get((top,)) == -1 and largest_index(poly) == top, 'Top variable')
            else:
                require(poly == {(): 1}, 'Path factor is not the unit')
            direct = branch_poly(range(size), edges_at_root(tree), 0)
            require(forest_data(tree)[2] == direct, 'Root recurrence vs direct forest counts')
            inspected += 1
    print(f'Rooted factors: {inspected} shapes through order eight agree with edge subsets.')


def check_arm_products(shapes):
    pairs = certified = 0
    for size, trees in shapes.items():
        if size > 7:
            break
        observed = defaultdict(list)
        valid = set()
        for left, right in combinations_with_replacement(trees, 2):
            cropped = multiply(forest_data(left)[2], forest_data(right)[2], size)
            extracted = normalized(normalized(cropped, size), size)
            full = multiply(factor(left), factor(right), 2 * size)
            require(extracted == truncate(full, size), 'Wrong product normalization')
            key = signature(extracted)
            observed[key].append((left, right))
            if 2 * largest_index(extracted) <= size:
                require(extracted == full, 'Certificate left an unseen term')
                valid.add(key)
                certified += 1
            pairs += 1
        require(all(len(observed[key]) == 1 for key in valid), 'Certified arms collided')
    print(f'Two-arm inputs: {pairs} unordered pairs through order seven, '
          f'{certified} certified pairs each unique among all competitors of its size.')


def check_free_trees(shapes):
    tested = identified = odd = even = 0
    for size in range(3, 12):
        classes = {canonical_free(tree) for tree in shapes[size]}
        observed = defaultdict(list)
        eligible = set()
        for tree in classes:
            ordinary = forest_data(tree)[1]
            if size <= 9:
                direct = forest_polynomial(range(size), edges_at_root(tree))
                require(ordinary == direct, 'Ordinary recurrence vs edge-subset result')
            key = signature(ordinary)
            observed[key].append(tree)
            cropped = central_input(ordinary, size)
            if cropped is not None:
                cutoff = (size - 1) // 2
                product = normalized(normalized(cropped, cutoff), cutoff)
                if 2 * largest_index(product) <= cutoff:
                    eligible.add(key)
        require(all(len(observed[key]) == 1 for key in eligible), 'Ordinary data collision')
        tested += len(classes)
        identified += len(eligible)
        if size % 2:
            odd += len(eligible)
        else:
            even += len(eligible)
    print(f'Unrooted comparison: {tested} trees of orders 3–11, '
          f'{identified} satisfy the certificate ({odd} odd, {even} even).')


def check_unequal_ends():
    # Both raw ends have degree-two-or-more roots, of different orders and shapes.
    left = ((), ((), ()))
    right = (((), ()), (((), ()),))
    require((order(left), order(right)) == (5, 8), 'Incorrect unequal endpoint sizes')
    p = 14
    arms = (extend(left, p - order(left)), extend(right, p - order(right)))
    full = multiply(factor(left), factor(right), p)
    sizes = []
    for size in (29, 30):
        tree = encode_arms(*arms, size)
        require(order(tree) == size, 'Incorrect subdivided order')
        ordinary = forest_data(tree)[1]
        cropped = central_input(ordinary, size)
        require(cropped is not None, 'Centroid or arm orders not recognized')
        require(normalized(normalized(cropped, p), p) == full, 'Threshold product lost')
        require(largest_index(full) == 7, 'Wrong maximal end complexity')
        sizes.append((size, len(ordinary)))
    print(f'Ends of orders 5 and 8, both threshold parities: '
          f'{sizes[0][0]} vertices / {sizes[0][1]} forest partitions; '
          f'{sizes[1][0]} vertices / {sizes[1][1]} forest partitions.')
    for size in range(3, 23):
        tree = extend((), size - 1)
        ordinary = forest_data(tree)[1]
        p = (size - 1) // 2
        cropped = central_input(ordinary, size)
        require(cropped is not None, 'Path has the wrong central structure')
        require(normalized(normalized(cropped, p), p) == {(): 1}, 'Path product is not one')
    require(forest_data(((),))[1] == {(2,): 1, (1, 1): 1}, 'Order-two path')
    print('Path edge cases: every order from 2 through 22 passed.')


if __name__ == '__main__':
    inventory = rooted_shapes(11)
    check_factors(inventory)
    check_arm_products(inventory)
    check_free_trees(inventory)
    check_unequal_ends()
