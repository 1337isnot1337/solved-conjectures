"""Recover tagged weighted-core cut records from two layers of the ordinary U polynomial."""

from collections import Counter
from itertools import product


def ordinary_adjacency(edges, weights):
    """Expand each core vertex to one vertex with weight minus one pendant leaves."""
    graph = [[] for _ in range(sum(weights))]
    expanded = list(edges)
    leaf = len(weights)
    for vertex, weight in enumerate(weights):
        for _ in range(weight - 1):
            expanded.append((vertex, leaf))
            leaf += 1
    for u, v in expanded:
        graph[u].append(v)
        graph[v].append(u)
    return graph, expanded


def raw_layers(graph):
    """Unweighted tree DP. Only closed components with at most one singleton can survive."""
    def visit(vertex, parent):
        # The component containing vertex is still open to its parent edge.
        state = Counter({(1, ()): 1})
        for child in graph[vertex]:
            if child == parent:
                continue
            child_state = visit(child, vertex)
            combined = Counter()
            for (size, parts), count in state.items():
                for (cs, cp), child_count in child_state.items():
                    closed = tuple(sorted(parts + cp))
                    singles = closed.count(1)
                    if singles > 1:
                        continue
                    multiplicity = count * child_count
                    combined[size + cs, closed] += multiplicity
                    if cs != 1 or singles == 0:
                        combined[size, tuple(sorted(closed + (cs,)))] += multiplicity
            state = combined
        return state

    raw = Counter()
    for (size, parts), count in visit(0, None).items():
        if parts.count(1) + (size == 1) <= 1:
            raw[tuple(sorted(parts + (size,)))] += count
    return raw


def cut_components(order, edges, mask):
    """Enumerate actual retained-edge components, independently of the polynomial DP."""
    labels = [{i} for i in range(order)]
    for bit, (u, v) in enumerate(edges):
        if mask & (1 << bit):
            left = next(group for group in labels if u in group)
            right = next(group for group in labels if v in group)
            left.update(right)
            labels.remove(right)
    return labels


def recover(raw, d):
    """Only the ordinary partition coefficients and modulus are supplied to the extractor."""
    (order,) = next(parts for parts in raw if len(parts) == 1)
    leaves = raw[1, order - 1]
    divisible = Counter({p[1:]: n for p, n in raw.items()
                         if p[0] == 1 and all(k % d == 0 for k in p[1:])})
    records = Counter()
    pendant_counts = Counter()
    for partition, count in raw.items():
        if partition[0] == 1:
            continue
        root, = (k for k in partition if k % d == 1)
        others = tuple(k for k in partition if k != root)
        assert all(k % d == 0 for k in others)
        records[root, others] += count
        root_cuts = leaves * count
        for k in set(others):
            shortened = list(partition)
            shortened.remove(k)
            shortened.extend((1, k - 1))
            cuts = raw[tuple(sorted(shortened))]
            pendant_counts[root, others, k] = cuts
            root_cuts -= cuts
        assert root_cuts >= 0
        pendant_counts[root, others, root] = root_cuts
        destination = tuple(sorted(others + (root - 1,)))
        divisible[destination] -= root_cuts
    assert all(count >= 0 for count in divisible.values())
    for others, count in divisible.items():
        if count:
            records[1, others] = count
    return records, +pendant_counts


def oracle(edges, weights, bare):
    records, pendant_counts = Counter(), Counter()
    for mask in range(1 << len(edges)):
        groups = cut_components(len(weights), edges, mask)
        sizes = [sum(weights[v] for v in group) for group in groups]
        marked = next(i for i, group in enumerate(groups) if bare in group)
        root = sizes[marked]
        others = tuple(sorted(size for i, size in enumerate(sizes) if i != marked))
        records[root, others] += 1
        if root > 1:
            for group, size in zip(groups, sizes):
                pendant_counts[root, others, size] += sum(weights[v] - 1 for v in group)
    return records, +pendant_counts


def main():
    cases = forests = exhaustive_cases = exhaustive_forests = repeated = diameter_six = 0
    # The last three cores have diameter four, hence their expansions have diameter six.
    small_shapes = [[(0, 1), (1, 2)], [(0, 1), (1, 2), (2, 3)],
                    [(0, 1), (0, 2), (0, 3)]]
    long_shapes = [[(0, 1), (1, 2), (2, 3), (3, 4)],
                   [(0, 1), (0, 2), (0, 3), (1, 4), (2, 5), (2, 6)],
                   [(0, 1), (0, 2), (0, 3), (1, 4), (1, 5), (2, 6), (3, 7)]]
    for edges in small_shapes + long_shapes:
        vertices = len(edges) + 1
        for bare in range(vertices):
            if sum(bare in edge for edge in edges) < 2:
                continue
            for d in (3, 4, 5):
                if vertices <= 5:
                    assignments = product((d, 2 * d), repeat=vertices - 1)
                else:
                    assignments = [tuple(d for _ in range(vertices - 1)),
                                   tuple(d * (1 + (i % 3)) for i in range(vertices - 1))]
                for assignment in assignments:
                    weights = list(assignment)
                    weights.insert(bare, 1)
                    graph, expanded = ordinary_adjacency(edges, weights)
                    raw = raw_layers(graph)
                    actual = recover(raw, d)
                    expected = oracle(edges, weights, bare)
                    assert actual == expected, (edges, weights, actual, expected)
                    cases += 1
                    forests += sum(expected[0].values())
                    diameter_six += edges in long_shapes
                    repeated += any(len(others) != len(set(others))
                                    for root, others in expected[0] if root > 1)
                    if len(graph) <= 13:
                        brute = Counter()
                        for mask in range(1 << len(expanded)):
                            groups = cut_components(len(graph), expanded, mask)
                            parts = tuple(sorted(map(len, groups)))
                            if parts.count(1) <= 1:
                                brute[parts] += 1
                        assert brute == raw
                        exhaustive_cases += 1
                        exhaustive_forests += 1 << len(expanded)
    assert repeated and diameter_six and exhaustive_cases
    print(f'{cases} weighted marked trees, {forests} core forests, '
          f'{diameter_six} diameter-six cases, {repeated} cases with repeated nonroot masses')
    print(f'{exhaustive_forests} expanded-tree forests independently enumerated '
          f'in {exhaustive_cases} small cases')


if __name__ == '__main__':
    main()
