"""Exact all-tree spot checks for the hub recognition theorem, using the standard library."""

from collections import Counter
from functools import cache
from itertools import combinations_with_replacement
from math import comb


def rooted(graph, vertex, parent=-1):
    return tuple(sorted(rooted(graph, child, vertex) for child in graph[vertex] if child != parent))


@cache
def order(tree):
    return 1 + sum(map(order, tree))


def centroid_form(graph):
    n = len(graph)
    candidates = [rooted(graph, v) for v in range(n)]
    return min(t for t in candidates if all(2 * order(c) <= n for c in t))


def extend(graph):
    for i in range(len(graph)):
        yield tuple(children + ((len(graph),) if j == i else ())
                    for j, children in enumerate(graph)) + ((i,),)


def product(left, right, cutoff):
    out = Counter()
    for a, coeff_a in left.items():
        for b, coeff_b in right.items():
            if sum(a) + sum(b) <= cutoff:
                out[tuple(sorted(a + b))] += coeff_a * coeff_b
    return out


@cache
def rooted_forests(tree):
    """Count edge subsets by the root-component size and the sorted other sizes."""
    states = {(1, ()): 1}
    for child in tree:
        out = Counter()
        for (root, parts), left in states.items():
            for (subroot, subparts), right in rooted_forests(child).items():
                joined = parts + subparts
                out[root + subroot, tuple(sorted(joined))] += left * right
                out[root, tuple(sorted(joined + (subroot,)))] += left * right
        states = out
    return states


@cache
def branch_factor(tree):
    data = Counter()
    for (root, parts), coeff in rooted_forests(tree).items():
        data[parts] += coeff
        data[tuple(sorted(parts + (root,)))] += coeff
    return data


def fringes(tree):
    for child in tree:
        yield child
        yield from fringes(child)


def cap(tree):
    while len(tree) == 1:
        tree = tree[0]
    return tree


def inspect_tree(tree, graph):
    n = len(graph)
    u = Counter()
    for (root, parts), coeff in rooted_forests(tree).items():
        u[tuple(sorted(parts + (root,)))] += coeff
    assert sum(u.values()) == 2 ** (n - 1)
    signature = tuple(sorted(u.items()))
    descendants = list(fringes(tree))
    counts = Counter(map(order, descendants))
    low = (n - 1) // 2
    for i in range(1, low + 1):
        assert u[i, n - i] == counts[i]
    # Differentiate in x_1 and then evaluate x_i=(z-1)^(i-1).
    degrees = Counter()
    for parts, coeff in u.items():
        singletons = parts.count(1)
        exponent = n - len(parts)
        for power in range(exponent + 1):
            degrees[n - 1 - power] += (singletons * coeff * comb(exponent, power)
                                        * (-1) ** (exponent - power))
    assert +degrees == Counter(map(len, graph))
    pairs = distinct_scales = nonpath = unique_hubs = 0
    for k in range(1, low + 1):
        r = counts[k]
        if r < 3 or sum(counts[i] for i in range(1, k + 1)) != r * k:
            continue
        blocks = [f for f in descendants if order(f) == k]
        p = {(): 1}
        for block in blocks:
            p = product(p, branch_factor(block), k)
        from_u = Counter({parts[:-1]: coeff for parts, coeff in u.items()
                          if n - parts[-1] <= k})
        assert p == from_u
        for m in range(1, k + 1):
            if counts[m] != r or sum(counts[i] for i in range(1, m + 1)) != r * m:
                continue
            pairs += 1
            distinct_scales += m < k
            for block in blocks:
                contents = (block, *fringes(block))
                assert sum(order(f) == m for f in contents) == 1
                assert order(cap(block)) <= m
            nonpath += any(cap(block) for block in blocks)
            outside = +degrees
            for block in blocks:
                for vertex in (block, *fringes(block)):
                    outside[len(vertex) + 1] -= 1
            if outside[r] == 1 and outside[2] == n - r * k - 1:
                unique_hubs += 1
                assert sum(outside[d] for d in outside if d not in (2, r)) == 0
                assert any(len(t := rooted(graph, v)) == r and
                           all(order(c) >= k and order(cap(c)) <= m for c in t)
                           for v in range(n))
    return signature, (pairs, distinct_scales, nonpath, unique_hubs)


def check_all_trees():
    counts_by_order = (1, 1, 1, 2, 3, 6, 11, 23, 47, 106, 235, 551, 1301)
    trees = {(): ((),)}
    totals = [0] * 4
    for n, known_count in enumerate(counts_by_order, 1):
        assert len(trees) == known_count
        spectra = set()
        for tree, graph in trees.items():
            signature, counts = inspect_tree(tree, graph)
            assert signature not in spectra
            spectra.add(signature)
            for i, count in enumerate(counts):
                totals[i] += count
        if n < len(counts_by_order):
            trees = {centroid_form(g): g for graph in trees.values() for g in extend(graph)}
    return sum(counts_by_order), totals


def check_orders():
    """Derive h from literal single cuts of path arms, including repeated equal splits."""
    total = tied = dominant = adjacent = 0
    for r in range(3, 7):
        for arms in combinations_with_replacement(range(3, 16), r):
            n = 1 + sum(arms)
            h = Counter()
            for length in arms:
                for tip_size in range(1, length + 1):
                    h[min(tip_size, n - tip_size)] += 1
            output = []
            for i in range(3, (n - 1) // 2):
                count = h[i] - h[i + 1]
                assert count >= 0
                output.extend([i] * min(count, r - 1 - len(output)))
                if len(output) == r - 1:
                    break
            output.append(n - 1 - sum(output))
            assert tuple(output) == arms
            total += 1
            tied += arms[-2] == arms[-1]
            dominant += 2 * arms[-1] > n
            adjacent += abs(n - 2 * arms[-1]) <= 1
    return total, tied, dominant, adjacent


if __name__ == '__main__':
    n, (pairs, distinct, nonpath, hubs) = check_all_trees()
    orders, tied, dominant, adjacent = check_orders()
    print(f'{n} unlabelled trees through order 13; {pairs} saturation scale pairs, '
          f'{distinct} strict two-scale, {nonpath} with branched caps, {hubs} single-hub remainders')
    print(f'{orders} folded arm profiles; {tied} tied maxima, {dominant} dominant maxima, '
          f'{adjacent} within one of an equal split')
