"""Exact finite checks for formal path rows and marked-tree deletion."""
from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations, product
from math import comb
from random import Random


def canonical(tree):
    def branch(vertex, parent):
        children = sorted(branch(v, vertex) for v in tree[vertex] if v != parent)
        return "(" + "".join(children) + ")"
    return min(branch(v, None) for v in range(len(tree)))


def extend_trees(layer):
    new = {}
    for tree in layer:
        for attachment in range(len(tree)):
            expanded = [list(nbrs) for nbrs in tree] + [[attachment]]
            expanded[attachment].append(len(tree))
            new.setdefault(canonical(expanded), expanded)
    return list(new.values())


def nonzero(measure):
    return {key: weight for key, weight in measure.items() if weight}


def distance_table(network):
    distances = {}
    for root in network:
        queue = [(root, None, 0)]
        for vertex, prev, value in queue:
            distances[root, vertex] = value
            queue.extend((v, vertex, value + length)
                         for v, length in network[vertex].items() if v != prev)
    return distances


def graph_measures(network, root):
    distances = distance_table(network)
    weights = {v: len(nbrs) - 2 for v, nbrs in network.items()}
    pairs, heights = Counter(), Counter()
    for v, w in weights.items():
        heights[distances[root, v]] += w
        for u in network:
            if v < u:
                pairs[distances[u, v]] += w * weights[u]
    return distances, weights, pairs, heights


def check_deletions(tree, stats):
    if min(len(nbrs) for nbrs in tree if len(nbrs) > 1) < 3:
        return
    edges = [(v, u) for v, nbrs in enumerate(tree) for u in nbrs if v < u]
    stats["reduced trees"] += 1
    for metric in ("unit", "independent"):
        original = {v: {} for v in range(len(tree))}
        for i, (u, v) in enumerate(edges):
            length = 6 if metric == "unit" else 10 ** (i + 2)
            original[u][v] = original[v][u] = length
        for root_spec in [v for v in original if len(original[v]) > 1] + edges:
            network = {v: nbrs.copy() for v, nbrs in original.items()}
            if isinstance(root_spec, tuple):
                left, right = root_spec
                root = len(network)
                length = network[left].pop(right)
                del network[right][left]
                first = length // 3
                network[root] = {left: first, right: length - first}
                network[left][root] = first
                network[right][root] = length - first
            else:
                root = root_spec
            distances, weights, pairs, heights = graph_measures(network, root)
            vertices = [v for v in network if weights[v]]
            stats["marked metrics"] += 1
            by_level = defaultdict(list)
            for v in vertices:
                by_level[distances[root, v]].append(v)
            for level, vs in by_level.items():
                if level == 0:
                    continue
                squared = sum(weights[v] ** 2 for v in vs)
                expected = (sum(weights[v] for v in vs) ** 2 - squared) // 2
                tag_two = 0
                for v, w in combinations(vertices, 2):
                    h, k = distances[root, v], distances[root, w]
                    twice_lca = h + k - distances[v, w]
                    tag = (h == level) + (k == level) - 2 * (twice_lca == 2 * level)
                    if tag == 2:
                        assert h == k == level
                        tag_two += weights[v] * weights[w]
                assert tag_two == expected
                stats["tag-two fibres"] += 1
                if len(vs) > 1:
                    stats["repeated height fibres"] += 1
            for j in [v for v in vertices if weights[v] == -1]:
                parent = min((v for v in vertices if v != j), key=lambda v: distances[v, j])
                a = distances[j, parent]
                protected = distances[root, j] < a
                smaller = {v: nbrs.copy() for v, nbrs in network.items()}
                neighbor = next(iter(smaller[j]))
                del smaller[neighbor][j]
                del smaller[j]
                new_root = root
                if protected:
                    assert neighbor == root and set(smaller[root]) == {parent}
                    del smaller[parent][root]
                    del smaller[root]
                    new_root = parent
                    stats["parent re-markings"] += 1
                if len(smaller[parent]) == 2 and parent != new_root:
                    left, right = smaller[parent]
                    length = smaller[parent][left] + smaller[parent][right]
                    smaller[left][right] = smaller[right][left] = length
                    del smaller[left][parent], smaller[right][parent], smaller[parent]
                new_dist, _, new_pairs, new_heights = graph_measures(smaller, new_root)
                H = Counter()
                for v in vertices:
                    if v != j:
                        H[distances[parent, v]] += weights[v]
                expected_pairs = pairs.copy()
                for distance, coefficient in H.items():
                    expected_pairs[distance + a] += coefficient
                    expected_pairs[distance] -= coefficient
                expected_pairs[0] += weights[parent]
                assert nonzero(expected_pairs) == nonzero(new_pairs)
                if protected:
                    predicted = H.copy()
                    predicted[0] -= 1
                    assert all(new_dist[new_root, v] == distances[root, v] - distances[root, parent]
                               for v in smaller)
                else:
                    predicted = heights.copy()
                    predicted[distances[root, j]] += 1
                    predicted[distances[root, parent]] -= 1
                assert nonzero(predicted) == nonzero(new_heights)
                stats["signed deletions"] += 1


def insert_row(basis, row):
    row = {i: Fraction(a) for i, a in row.items() if a}
    for pivot in sorted(basis):
        if pivot in row:
            multiple = row[pivot]
            for i, a in basis[pivot].items():
                value = row.get(i, 0) - multiple * a
                if value:
                    row[i] = value
                else:
                    row.pop(i, None)
    if not row:
        return False
    pivot = min(row)
    factor = row[pivot]
    basis[pivot] = {i: a / factor for i, a in row.items()}
    return True


def symbolic_path(x, y, ancestor):
    v = Counter((x, y))
    v[ancestor] -= 2
    return v


def check_rows(stats):
    rng = Random(315)
    # These are abstract matched-distance rows, not examples of nonisometric trees.
    # True singleton leaves are forbidden as ancestor coordinates. A special row
    # has a doubled endpoint and a different coefficient on the opposite side.
    for _ in range(2000):
        true_leaves = set(range(rng.randrange(4, 13)))
        true_hubs = set(range(20, 20 + rng.randrange(1, 6)))
        hidden = set(range(40, 40 + rng.randrange(1, 6)))
        repeated = set(rng.sample(sorted(true_leaves), rng.randrange(3)))
        special = sorted(hidden | repeated)
        possible_ancestors = sorted(true_hubs | hidden | repeated)
        choices = sorted(true_leaves | true_hubs | hidden)

        basis, covered = {}, set()
        for h in special:
            a = rng.choice([v for v in possible_ancestors if v != h])
            x, y = (rng.choice([v for v in choices if v != h]) for _ in range(2))
            b = rng.choice([v for v in possible_ancestors if v != h])
            row = symbolic_path(h, h, a)
            row.subtract(symbolic_path(x, y, b))
            row = nonzero(row)
            assert row[h] == 2 and len(row) <= 5
            if insert_row(basis, row):
                covered.update(row)
        assert set(special) <= covered
        p = len(basis)
        assert len(true_leaves & covered) <= 5 * p - len(hidden)
        for _ in range(rng.randrange(5)):
            x, y, z, w = (rng.choice(choices) for _ in range(4))
            a, b = (rng.choice(possible_ancestors) for _ in range(2))
            row = symbolic_path(x, y, a)
            row.subtract(symbolic_path(z, w, b))
            row = nonzero(row)
            if insert_row(basis, row):
                assert len((true_leaves & row.keys()) - covered) <= 4
                covered.update(row)
        assert len(true_leaves & covered) <= 5 * len(basis) - len(hidden)
        stats["exact relation-rank systems"] += 1


def check_height_ranks(stats):
    for marks, width in product(range(1, 6), range(2, 9)):
        vectors = [{i: 1} for i in range(width)]
        vectors.extend({0: -j, width - 1: 1} for j in range(1, marks + 1))
        rank = {}
        for v in vectors:
            insert_row(rank, v)
        old_nullity = len(vectors) - len(rank)
        for parent, f in enumerate(vectors):
            shifted_rank = {}
            for v in vectors:
                if v == f:
                    continue
                row = Counter(v)
                row.subtract(f)
                insert_row(shifted_rank, row)
            assert len(vectors) - 1 - len(shifted_rank) <= old_nullity
            stats["shifted exact height spaces"] += 1
    for leaves in range(3, 30):
        for w in range(1, leaves - 1):
            defects = [w] + [1] * (leaves - 2 - w)
            M = leaves + sum(weight ** 2 for weight in defects)
            K = sum(comb(weight, 2) for weight in defects)
            assert M == 2 * leaves - 2 + 2 * K
            assert K <= comb(leaves - 2, 2)
            stats["moment bounds"] += 1


def main():
    stats = Counter()
    layer = [[[1], [0]]]
    for size in range(3, 11):
        layer = extend_trees(layer)
        for tree in layer:
            if any(len(nbrs) >= 3 for nbrs in tree):
                check_deletions(tree, stats)
    check_rows(stats)
    check_height_ranks(stats)
    for name, count in sorted(stats.items()):
        print(f"{name}: {count}")


if __name__ == "__main__":
    main()
