#!/usr/bin/env python3
"""Verify two variable-order graceful labelings from the construction."""

from itertools import accumulate


def root_side(edges, order, root):
    neighbors = [[] for _ in range(order)]
    for a, b in edges:
        neighbors[a].append(b)
        neighbors[b].append(a)
    side = {root: 0}
    pending = [root]
    while pending:
        a = pending.pop()
        for b in neighbors[a]:
            if b in side:
                assert side[a] != side[b]
            else:
                side[b] = 1 - side[a]
                pending.append(b)
    assert len(side) == order
    return {vertex for vertex, part in side.items() if part == 0}


def check_graft(attachments, host, root):
    orders = [len(edges) + 1 for edges in attachments]
    starts = list(accumulate([0, *orders[:-1]]))
    labels = {}
    differences = []
    for i, edges in enumerate(attachments):
        assert sorted(abs(a - b) for a, b in edges) == list(range(1, orders[i]))
        side = root_side(edges, orders[i], root)
        for g in range(orders[i]):
            block = i if g in side else len(attachments) - 1 - i
            labels[i, g] = starts[block] + g
        differences.extend(abs(labels[i, a] - labels[i, b]) for a, b in edges)
    differences.extend(abs(labels[i, root] - labels[j, root]) for i, j in host)
    n = sum(orders)
    assert sorted(labels.values()) == list(range(n))
    assert sorted(differences) == list(range(1, n))
    print(f"Verified all {n - 1} graceful differences for block orders {orders}.")


def star(order):
    return [(0, i) for i in range(1, order)]


if __name__ == "__main__":
    common = [(1, 3), (2, 5), (0, 4), (0, 5)]
    left = [(0, 1), *common, (0, 6)]
    right = [(3, 4), *common, (0, 6)]
    check_graft([left, star(4), right + [(0, 7), (0, 8)]], [(0, 2), (1, 2)], 1)
    check_graft(
        [left, star(5), star(4), star(5), right], [(2, 3), (2, 4), (1, 4), (0, 4)], 1
    )
