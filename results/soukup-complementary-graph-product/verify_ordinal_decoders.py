"""Check finite comparison signatures used in the ordinal threshold proofs."""

from itertools import combinations, permutations


def ranks(order):
    return {vertex: index for index, vertex in enumerate(order)}


def disagree(first, second, x, y):
    return (first[x] < first[y]) != (second[x] < second[y])


def check_graph_decoders(size=6):
    vertices = tuple(range(size))
    pairs = list(combinations(vertices, 2))
    for mask in range(1 << len(pairs)):
        # Partition the complete graph by its smaller endpoint. Split each
        # resulting star by adjacency, preserving isolated vertices.
        forests = [[] for _ in range(2 * size)]
        for bit, (center, leaf) in enumerate(pairs):
            edge = bool(mask & (1 << bit))
            forests[2 * center + int(not edge)].append(leaf)
        addresses = {}
        for address, leaves in enumerate(forests):
            center = address // 2
            isolates = [x for x in vertices if x != center and x not in leaves]
            first = ranks([center, *leaves, *isolates])
            second = ranks([*leaves, center, *isolates])
            for pair in pairs:
                if disagree(first, second, *pair):
                    assert pair not in addresses
                    addresses[pair] = address
        assert len(addresses) == len(pairs)
        for bit, pair in enumerate(pairs):
            assert (addresses[pair] % 2 == 0) == bool(mask & (1 << bit))
    return 1 << len(pairs)


def check_rectangles(size=5):
    vertices = tuple(range(size))
    masks = range(1 << size)
    orders = {}
    for mask in masks:
        inside = [x for x in vertices if mask & (1 << x)]
        outside = [x for x in vertices if x not in inside]
        orders[mask] = (ranks(inside + outside), ranks(outside + inside))
    count = 0
    for u in masks:
        for v in masks:
            if u & v:
                continue
            for x, y in combinations(vertices, 2):
                certified = disagree(*orders[u], x, y) and disagree(*orders[v], x, y)
                cross = (u & (1 << x) and v & (1 << y)) or (
                    v & (1 << x) and u & (1 << y)
                )
                assert certified == bool(cross)
                count += 1
    return count


def check_six_cycle():
    # Lower vertices 0,1,2, upper vertices 3,4,5 of the standard example.
    extensions = []
    for i in range(3):
        other = [j for j in range(3) if j != i]
        extensions.append(ranks([*other, i + 3, i, *(j + 3 for j in other)]))
    pairs = list(combinations(range(6), 2))
    edges = {(i, j + 3) for i in range(3) for j in range(3) if i != j}
    for x, y in pairs:
        signs = {order[x] < order[y] for order in extensions}
        assert (len(signs) == 1) == ((x, y) in edges)
    # Fix the lower shore for the cycle's transitive orientation. Its dual
    # has the same dimension. Check every possible linear extension.
    count = 0
    for perm in permutations(range(6)):
        order = ranks(perm)
        if all(order[x] < order[y] for x, y in edges):
            assert sum(order[i + 3] < order[i] for i in range(3)) <= 1
            count += 1
    return count


if __name__ == "__main__":
    print(f"Checked {check_graph_decoders():,} labelled six-vertex graphs.")
    print(f"Checked {check_rectangles():,} disjoint-rectangle pair tests.")
    print(f"Checked the six-cycle realizer and all {check_six_cycle()} extensions.")
