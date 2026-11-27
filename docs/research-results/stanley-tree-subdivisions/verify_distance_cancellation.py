"""Check signed cancellation ranks directly on finite edge-weighted trees."""
from collections import Counter, defaultdict
from itertools import combinations, product

from verify_height_relation_kernel import extend_trees, insert_row


def check_metric(tree, edges, lengths, stats):
    weights = [len(neighbors) - 2 for neighbors in tree]
    leaves = [u for u, weight in enumerate(weights) if weight == -1]
    orthants = defaultdict(lambda: ([], []))
    for source in range(len(tree)):
        queue = [(source, None, 0)]
        for u, parent, distance in queue:
            if source < u:
                pair_weight = weights[source] * weights[u]
                represented = tuple(v for v in (source, u) if weights[v] < 0)
                orthants[distance][int(pair_weight > 0)].extend(
                    [represented] * abs(pair_weight)
                )
            for v in tree[u]:
                if v != parent:
                    e = tuple(sorted((u, v)))
                    queue.append((v, u, distance + lengths[edges.index(e)]))
    negative = sum(max(len(neg) - len(pos), 0) for neg, pos in orthants.values())
    J = len(leaves)
    if negative < J * (J - 2):
        stats["metrics with mixed signs"] += 1
    else:
        stats["metrics without mixed signs"] += 1
    for reverse in (False, True):
        basis = {}
        constraints = set()
        for negatives, positives in orthants.values():
            positive_units = reversed(positives) if reverse else iter(positives)
            for neg, pos in zip(negatives, positive_units):
                row = Counter(neg)
                row.subtract(pos)
                insert_row(basis, row)
                constraints.add((neg, pos))
        t0 = len(basis)
        viable = []
        for mask in range(1 << J):
            selected = {u for i, u in enumerate(leaves) if mask & (1 << i)}
            if all(len(selected.intersection(neg)) == len(selected.intersection(pos))
                   for neg, pos in constraints):
                viable.append(len(selected))
        h = max(viable)
        assert h >= J - 2 * t0 and (t0 > 1 or h >= J - t0)
        assert negative >= h * (h - 2)
        stats["histogram and rank comparisons"] += 1
        stats["nonzero-rank comparisons"] += bool(t0)
        stats["rank above one"] += t0 > 1


def main():
    stats = Counter()
    layer = [[[1], [0]]]
    for n in range(3, 10):
        layer = extend_trees(layer)
        for tree in layer:
            if any(len(nbrs) == 2 for nbrs in tree):
                continue
            edges = [(u, v) for u in range(n) for v in tree[u] if u < v]
            for lengths in product((1, 2), repeat=len(edges)):
                check_metric(tree, edges, lengths, stats)
            check_metric(tree, edges, [8 ** i for i in range(len(edges))], stats)
    assert stats["metrics with mixed signs"] and stats["rank above one"]
    for key, count in sorted(stats.items()):
        print(f"{key}: {count}")


if __name__ == "__main__":
    main()
