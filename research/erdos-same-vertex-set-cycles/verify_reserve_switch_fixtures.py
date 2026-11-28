"""Arithmetic checks for the two reserve-switch proof notes (not a proof of #585)."""
from math import gcd
from random import Random


def compose(p, q):
    return tuple(p[j] for j in q)


def inverse(p):
    return tuple(p.index(i) for i in range(len(p)))


def cycles(p):
    unseen = set(range(len(p)))
    result = []
    while unseen:
        i = min(unseen)
        cycle = []
        while i in unseen:
            unseen.remove(i)
            cycle.append(i)
            i = p[i]
        result.append(tuple(cycle))
    return tuple(result)


def matching_partition(rows):
    n = len(rows[0])
    assert all(set(row) == set(range(n)) for row in rows)
    assert all(len(set(col)) == len(rows) for col in zip(*rows, strict=True))


def quotient_counts(anchor, movable, reserve):
    p = compose(inverse(anchor), movable)
    r = compose(inverse(anchor), reserve)
    cs = cycles(p)
    assert len(cs) == 2
    first = set(cs[0])
    return (
        sum((i in first) != (j in first) for i, j in enumerate(r)),
        sum(i in first and j in first for i, j in enumerate(r)),
        sum(i not in first and j not in first for i, j in enumerate(r)),
    )


def check_explicit():
    m, n, r, a, b = (
        tuple(range(7)),
        (1, 0, 3, 4, 5, 6, 2),
        (3, 5, 0, 2, 6, 4, 1),
        (2, 4, 5, 6, 3, 1, 0),
        (6, 3, 1, 5, 0, 2, 4),
    )
    matching_partition((m, n, r, a, b))
    assert cycles(compose(inverse(m), n)) == ((0, 1), (2, 3, 4, 5, 6))
    assert cycles(compose(inverse(a), b)) == ((0, 3, 2, 5), (1, 4, 6))
    assert cycles(compose(inverse(n), r)) == ((0, 2, 1, 4, 5, 3, 6),)
    assert cycles(compose(inverse(b), r)) == ((0, 1, 3, 5, 6, 2, 4),)
    assert quotient_counts(m, n, r)[0] == 4
    assert quotient_counts(a, b, r)[0] == 6

    m, n = tuple(range(6)), (1, 0, 3, 4, 5, 2)
    for r, expected in [((2, 3, 1, 5, 0, 4), 1), ((2, 4, 0, 5, 1, 3), 3)]:
        matching_partition((m, n, r))
        assert len(cycles(compose(inverse(n), r))) == 1
        assert quotient_counts(m, n, r) == (4, 0, 2)
        assert len(cycles(r)) == expected


def permutation_from_orders(n, orders):
    p = list(range(n))
    for order in orders:
        for i, j in zip(order, order[1:] + order[:1], strict=True):
            p[i] = j
    return tuple(p)


def check_tree_blocks():
    rng = Random(585)
    eligible = [m for m in range(2, 15) if gcd(m, 3) == 1]
    for _ in range(1000):
        nodes = rng.randrange(2, 16)
        blocks = [[] for _ in range(nodes)]
        switches, n = [], 0
        for child in range(1, nodes):
            parent = rng.randrange(child)
            m = rng.choice(eligible)
            a = list(range(n, n + m))
            b = list(range(n + m, n + 2 * m))
            n += 2 * m
            blocks[parent].append(a)
            blocks[child].append(b)
            switches.append([v for xs in zip(a, b, strict=True) for v in xs])
        for blocks_at_node in blocks:
            rng.shuffle(blocks_at_node)
        p = permutation_from_orders(n, [[v for block in bs for v in block] for bs in blocks])
        tau = permutation_from_orders(n, switches)
        assert len(cycles(p)) == nodes
        assert len(cycles(compose(p, tau))) == 1


if __name__ == "__main__":
    check_explicit()
    check_tree_blocks()
    print("Checked the matching fixtures and 1000 deterministic tree-block instances.")
