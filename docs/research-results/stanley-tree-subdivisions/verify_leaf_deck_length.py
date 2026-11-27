"""Check total metric-tree length against unlabelled assignments on 4–6 leaves."""

from itertools import combinations, permutations
from fractions import Fraction
from math import factorial


def leaf_distances(edges, weights, leaves):
    graph = {}
    for (first, second), length in zip(edges, weights, strict=True):
        graph.setdefault(first, []).append((second, length))
        graph.setdefault(second, []).append((first, length))
    distances = {}
    for leaf in range(leaves):
        stack = [(leaf, None, 0)]
        while stack:
            node, parent, length = stack.pop()
            if leaf < node < leaves:
                distances[leaf, node] = length
            for neighbor, edge_length in graph[node]:
                if neighbor != parent:
                    stack.append((neighbor, node, length + edge_length))
    return distances


def all_binary_resolutions(leaves):
    initial = [(0, leaves), (1, leaves), (2, leaves)]
    trees = [initial]
    for new_leaf in range(3, leaves):
        new_hub = leaves + new_leaf - 2
        enlarged = []
        for tree in trees:
            for index, (first, second) in enumerate(tree):
                unchanged = tree[:index] + tree[index + 1 :]
                enlarged.append(unchanged + [(first, new_hub), (second, new_hub), (new_leaf, new_hub)])
        trees = enlarged
    return trees


def split_masks(edges, leaves):
    all_leaves = (1 << leaves) - 1
    masks = []
    for skip, (first, _) in enumerate(edges):
        reached = {first}
        stack = [first]
        while stack:
            node = stack.pop()
            for index, (left, right) in enumerate(edges):
                if index == skip or node not in (left, right):
                    continue
                other = right if node == left else left
                if other not in reached:
                    reached.add(other)
                    stack.append(other)
        mask = sum(1 << vertex for vertex in reached if vertex < leaves)
        masks.append(min(mask, mask ^ all_leaves))
    return masks


def predicted_assignments(leaves, edges, weights, pairs):
    target_splits = dict(zip(split_masks(edges, leaves), weights, strict=True))
    assignments = set()
    for tree in all_binary_resolutions(leaves):
        splits = split_masks(tree, leaves)
        if not target_splits.keys() <= set(splits):
            continue
        original = [Fraction(target_splits.get(mask, 0)) for mask in splits]
        arms = {}
        for index, (left, right) in enumerate(tree):
            if left < leaves:
                arms.setdefault(right, []).append(index)
            if right < leaves:
                arms.setdefault(left, []).append(index)
        cherries = []
        for hub, pendant_edges in arms.items():
            if len(pendant_edges) == 2:
                stem = next(i for i, edge in enumerate(tree) if hub in edge and i not in pendant_edges)
                cherries.append((*pendant_edges, stem))
        sums = [original[left] + original[right] for left, right, _ in cherries]
        for permuted in permutations(sums):
            modified = original.copy()
            for (left, right, stem), prior, following in zip(cherries, sums, permuted, strict=True):
                shift = (following - prior) / 2
                modified[left] += shift
                modified[right] += shift
                modified[stem] -= shift
            if any(weight < 0 for weight in modified):
                continue
            if any(modified[index] == 0 and min(edge) < leaves for index, edge in enumerate(tree)):
                continue
            assert sum(modified) == sum(weights)
            distances = leaf_distances(tree, modified, leaves)
            for labels in permutations(range(leaves)):
                assignment = tuple(distances[tuple(sorted((labels[a], labels[b])))] for a, b in pairs)
                assignments.add(assignment)
    return assignments


def enumerate_legal_decks(leaves, edges):
    # The high common part permits nontrivial cherry exchanges with positive
    # lengths. The base-seven digits separate all quartet coefficient relations.
    weights = [7 ** (len(edges) + 2) + 7**i for i in range(len(edges))]
    target_length = sum(weights)
    deck = tuple(leaf_distances(edges, weights, leaves).values())
    assert len(set(deck)) == len(deck)
    pairs = [(i, j) for j in range(1, leaves) for i in range(j)]
    predicted = predicted_assignments(leaves, edges, weights, pairs)
    slot = {pair: index for index, pair in enumerate(pairs)}
    triangles = [[] for pair in pairs]
    quartets = [[] for pair in pairs]
    for a, b, c in combinations(range(leaves), 3):
        triangle = (slot[a, b], slot[a, c], slot[b, c])
        triangles[max(triangle)].append(triangle)
    for a, b, c, d in combinations(range(leaves), 4):
        quartet = (slot[a, b], slot[c, d], slot[a, c], slot[b, d], slot[a, d], slot[b, c])
        quartets[max(quartet)].append(quartet)
    tours = []
    for ordered in permutations(range(1, leaves)):
        if ordered[0] > ordered[-1]:
            continue
        route = (0, *ordered, 0)
        tours.append(tuple(slot[tuple(sorted(pair))] for pair in zip(route, route[1:])))
    assigned = [0] * len(pairs)
    feasible = 0
    represented = 0

    def walk(index, unused):
        nonlocal feasible, represented
        if index == len(pairs):
            # A planar leaf tour crosses every edge twice. Every tour crosses
            # each edge at least twice, so this tests total length without
            # assuming any identification of a rival's topology or leaves.
            best_tour = min(sum(assigned[k] for k in tour) for tour in tours)
            assert best_tour == 2 * target_length
            predicted.remove(tuple(assigned))
            feasible += 1
            represented += 1
            return
        for position, value in enumerate(unused):
            assigned[index] = value
            good = True
            for a, b, c in triangles[index]:
                ta, tb, tc = assigned[a], assigned[b], assigned[c]
                if 2 * max(ta, tb, tc) >= ta + tb + tc:
                    good = False
                    break
            if good:
                for a, b, c, d, e, f in quartets[index]:
                    sums = (assigned[a] + assigned[b], assigned[c] + assigned[d], assigned[e] + assigned[f])
                    if sums.count(max(sums)) == 1:
                        good = False
                        break
            if good:
                walk(index + 1, unused[:position] + unused[position + 1 :])
            else:
                represented += factorial(len(unused) - 1)

    walk(0, deck)
    assert not predicted
    assert represented == factorial(len(deck))
    assert feasible >= factorial(leaves)
    return represented, feasible


def check_cherry_swap():
    quartet_edges = [(0, 4), (1, 4), (2, 5), (3, 5), (4, 5)]
    original = [100, 102, 101, 104, 90]
    first, second, third, fourth, stem = original
    shift = Fraction(third + fourth - first - second, 2)
    transformed = [first + shift, second + shift, third - shift, fourth - shift, stem]
    assert min(transformed) > 0
    assert sorted(original) != sorted(transformed)
    assert sum(original) == sum(transformed)
    original_deck = leaf_distances(quartet_edges, original, 4)
    new_deck = leaf_distances(quartet_edges, transformed, 4)
    assert sorted(original_deck.values()) == sorted(new_deck.values())
    assert original_deck != new_deck
    assert original_deck[0, 1] == new_deck[2, 3]
    assert original_deck[2, 3] == new_deck[0, 1]


def main():
    cases = [
        (4, [(i, 4) for i in range(4)]),
        (4, [(0, 4), (1, 4), (2, 5), (3, 5), (4, 5)]),
        (5, [(i, 5) for i in range(5)]),
        (5, [(0, 5), (1, 5), (2, 6), (3, 6), (4, 6), (5, 6)]),
        (5, [(0, 5), (1, 5), (2, 6), (3, 7), (4, 7), (5, 6), (6, 7)]),
    ]
    six_leaf_shapes = [
        [(i, 6) for i in range(6)],
        [(0, 6), (1, 6), (2, 7), (3, 7), (4, 7), (5, 7), (6, 7)],
        [(0, 6), (1, 6), (2, 6), (3, 7), (4, 7), (5, 7), (6, 7)],
        [(0, 6), (1, 6), (2, 7), (3, 7), (4, 8), (5, 8), (6, 7), (7, 8)],
        [(0, 6), (1, 6), (2, 6), (3, 7), (4, 8), (5, 8), (6, 7), (7, 8)],
        [(0, 6), (1, 6), (2, 7), (3, 8), (4, 9), (5, 9), (6, 7), (7, 8), (8, 9)],
        [(0, 6), (1, 6), (2, 7), (3, 7), (4, 8), (5, 8), (6, 9), (7, 9), (8, 9)],
    ]
    cases.extend((6, edges) for edges in six_leaf_shapes)
    totals = [enumerate_legal_decks(leaves, edges) for leaves, edges in cases]
    check_cherry_swap()
    print(f'{len(cases)} reduced target shapes, {sum(row[0] for row in totals):,} represented assignments')
    print(f'{sum(row[1] for row in totals):,} positive tree metrics exactly characterized; cherry exchange verified')


if __name__ == '__main__':
    main()
