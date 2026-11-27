"""Compare the exact disjoint-edge equivalence to its component formula on two 4-shores."""

from collections import Counter
from itertools import combinations


def components(adjacency):
    """Return the set partition of an undirected graph, including isolated vertices."""
    remaining = set(range(len(adjacency)))
    blocks = set()
    while remaining:
        root = remaining.pop()
        block = {root}
        frontier = [root]
        while frontier:
            here = frontier.pop()
            fresh = remaining.intersection(adjacency[here])
            remaining.difference_update(fresh)
            block.update(fresh)
            frontier.extend(fresh)
        blocks.add(frozenset(block))
    return frozenset(blocks)


def incidence_masks(mask, order):
    rows = []
    columns = [0] * order
    full = (1 << order) - 1
    for left in range(order):
        row = (mask >> (left * order)) & full
        rows.append(row)
        for right in range(order):
            if row & (1 << right):
                columns[right] |= 1 << left
    return rows, columns


def actual_partition(rows, pairs):
    """Two pairs are linked when either bijection is made of edges of the relation."""
    width = len(pairs)
    neighbors = [set() for _ in range(2 * width)]
    for i, (a, b) in enumerate(pairs):
        for j, (x, y) in enumerate(pairs):
            forward = rows[a] & (1 << x) and rows[b] & (1 << y)
            reverse = rows[a] & (1 << y) and rows[b] & (1 << x)
            if forward or reverse:
                neighbors[i].add(width + j)
                neighbors[width + j].add(i)
    return components(neighbors)


def predicted_partition(rows, columns, pairs):
    """Group matchable pairs by their unordered pair of original component IDs."""
    order = len(rows)
    original = [set() for _ in range(2 * order)]
    for left, row in enumerate(rows):
        for right in range(order):
            if row & (1 << right):
                original[left].add(order + right)
                original[order + right].add(left)

    labels = {}
    for block in components(original):
        identifier = min(block)
        for vertex in block:
            labels[vertex] = identifier

    groups = {}
    unmatchable = set()
    for shore, masks in enumerate((rows, columns)):
        for index, (a, b) in enumerate(pairs):
            node = shore * len(pairs) + index
            if not masks[a] or not masks[b] or (masks[a] | masks[b]).bit_count() < 2:
                unmatchable.add(frozenset((node,)))
                continue
            key = tuple(sorted((labels[shore * order + a], labels[shore * order + b])))
            groups.setdefault(key, set()).add(node)

    return frozenset(unmatchable | {frozenset(group) for group in groups.values()})


def verify(order=4):
    pairs = tuple(combinations(range(order), 2))
    histogram = Counter()
    relations = 1 << (order * order)
    for mask in range(relations):
        rows, columns = incidence_masks(mask, order)
        actual = actual_partition(rows, pairs)
        predicted = predicted_partition(rows, columns, pairs)
        if actual != predicted:
            raise AssertionError(f"relation {mask:#x}: {actual=} differs from {predicted=}")
        histogram[len(actual)] += 1
    print(f"{relations:,} labelled {order}-by-{order} relations verified")
    print(f"{relations * 2 * len(pairs):,} pair-state memberships compared")
    print(f"{sum(number * count for number, count in histogram.items()):,} partition blocks")
    print("block-count histogram", dict(sorted(histogram.items())))


if __name__ == "__main__":
    verify()
