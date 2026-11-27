"""Check ordinary path-basis inversion and the stopping test for balanced edges.

Run directly with the other Stanley checkers in this directory.
"""

from collections import Counter, defaultdict
from functools import cache
from itertools import combinations_with_replacement

from verify_centroid import multiply, truncate
from verify_centroid_edge import require, rooted_shapes
from verify_long_subdivision import (
    canonical_free, extend, factor, forest_data, largest_index,
    order, signature, strip_stem,
)


@cache
def path_layer(weight):
    if weight == 0:
        return {(): 1}
    result = Counter()
    for last in range(1, weight + 1):
        for term, count in path_layer(weight - last).items():
            result[tuple(sorted((*term, last)))] += count
    return dict(result)


@cache
def x_in_y(size):
    """Solve y_i = x_i + Σ_(j<i) x_j y_(i−j) for x_i."""
    result = Counter({(size,): 1})
    for j in range(1, size):
        for term, count in x_in_y(j).items():
            result[tuple(sorted((*term, size - j)))] -= count
    return clean(result)


@cache
def monomial_in_basis(term, to_path):
    result = {(): 1}
    for i in term:
        result = multiply(result, x_in_y(i) if to_path else path_layer(i), sum(term))
    return result


def clean(poly):
    return {key: value for key, value in poly.items() if value}


def change_basis(poly, to_path):
    result = Counter()
    for term, value in poly.items():
        for key, coefficient in monomial_in_basis(term, to_path).items():
            result[key] += value * coefficient
    return clean(result)


def layer(poly, weight):
    return {term: coeff for term, coeff in poly.items() if sum(term) == weight}


def coefficient(poly, index, count):
    return {tuple(v for v in term if v != index): coeff for term, coeff in poly.items()
            if term.count(index) == count}


def restore_path(product, total):
    result = Counter()
    for term, value in product.items():
        root = total - sum(term)
        require(root > 0, "nonpositive restoring weight")
        result[tuple(sorted((*term, root)))] += value
    return clean(result)


def recover(ordinary_in_y, n, max_index):
    """Recover the observable homogeneous layers in path generators."""
    residual = Counter(ordinary_in_y)
    result = {}
    for weight in range(n - max_index):
        restore = n - weight
        part = coefficient(residual, restore, 1)
        require(all(sum(term) == weight for term in part), "restored wrong degree")
        result.update(part)
        for term, value in part.items():
            key = tuple(sorted((*term, restore)))
            residual[key] -= value
        residual = Counter(clean(residual))
    return result, residual


def check_tree_pair(left, right, expected_ordinary=None):
    a, b = order(left), order(right)
    n = a + b
    require(a <= b <= a + 1, "unbalanced test input")
    actual = multiply(factor(left), factor(right), n)
    ordinary = expected_ordinary or forest_data(tuple(sorted((*left, right))))[1]
    in_y = change_basis(ordinary, True)
    full = change_basis(actual, True)
    require(restore_path(full, n) == in_y, "arbitrary-edge path identity")
    first, _ = recover(in_y, n, b - 1)
    L = largest_index(first)
    require(L == largest_index(full), "maximum normalized index hidden")
    if not L:
        return True
    partial, residual = recover(in_y, n, L)
    require(partial == truncate(full, n - L - 1), "extended truncation incorrect")
    if first[L,] == -2:
        if n < 3 * L:
            return False
        reconstructed = dict(partial)
        if n == 3 * L:
            for term, count in residual.items():
                require(L in term, "missing y_L at the tied endpoint")
                key = list(term)
                key.remove(L)
                reconstructed[tuple(key)] = count
        require(reconstructed == full, "equal maxima reconstruction")
        return True
    require(first[L,] == -1, "incorrect singleton normalization")
    smaller = {term: -coeff for term, coeff in coefficient(partial, L, 1).items()}
    extra = {term: -coeff for term, coeff in coefficient(in_y, L, 2).items()}
    smaller.update(extra)
    cutoff = n - 2 * L
    in_x = change_basis(smaller, False)
    true_smaller = factor(left) if largest_index(factor(left)) < L else factor(right)
    require(in_x == truncate(true_smaller, cutoff), "extra smaller-factor layer")
    fringe_count = sum(1 + in_x.get((i,), 0) for i in range(1, cutoff + 1))
    d = largest_index(true_smaller)
    require((fringe_count == cutoff) == (d <= cutoff), "fringe stopping test")
    return fringe_count == cutoff


def exercise(max_half=6):
    shapes = rooted_shapes(max_half + 1)
    pairs = accepted = 0
    signatures = defaultdict(set)
    certified = set()
    for a in range(1, max_half + 1):
        for b in (a, a + 1):
            options = (combinations_with_replacement(shapes[a], 2) if a == b else
                       ((left, right) for left in shapes[a] for right in shapes[b]))
            for left, right in options:
                joined = tuple(sorted((*left, right)))
                ordinary = forest_data(joined)[1]
                label = signature(ordinary)
                signatures[label].add(canonical_free(joined))
                check = check_tree_pair(left, right, ordinary)
                d, L = sorted((largest_index(factor(left)), largest_index(factor(right))))
                require(check == (2 * L + d <= a + b), "sufficient threshold")
                if check:
                    certified.add(label)
                    accepted += 1
                pairs += 1
    require(all(len(signatures[label]) == 1 for label in certified), "certified collision")
    print(pairs, "balanced rooted pairs;", accepted, "certified inputs;",
          len(certified), "distinct certified free trees")


if __name__ == "__main__":
    exercise()
    # Ends with two or more children at both roots: d=4, L=7.
    a, b = ((), ((), ())), (((), ()), (((), ()),))
    for n in (18, 19):
        left = extend(a, n//2 - order(a))
        right = extend(b, n - n//2 - order(b))
        require(check_tree_pair(left, right), "unequal-ended threshold")
    # Equal maximal normalized degrees, requiring the last layer at n=3L.
    joined = extend(a, 6 - order(a))
    require(check_tree_pair(joined, joined), "equal-ended boundary")
    print("Unequal 5/8 ends at orders 18 and 19; equal-end boundary at order 12")
