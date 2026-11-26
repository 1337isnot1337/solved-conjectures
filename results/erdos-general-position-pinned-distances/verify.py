"""Exact finite checks for the pinned-distance counting and diameter lemmas."""

from collections import Counter, defaultdict
from itertools import combinations, permutations, product


def collinear(a, b, c):
    return (b[0] - a[0]) * (c[1] - a[1]) == (b[1] - a[1]) * (c[0] - a[0])


def squared_distance(a, b):
    return (a[0] - b[0]) ** 2 + (a[1] - b[1]) ** 2


def verify_set(points, totals):
    n = len(points)
    distances = [[squared_distance(a, b) for b in points] for a in points]
    sizes = []
    quadruples = []
    for pin, row in enumerate(distances):
        classes = defaultdict(list)
        for other, radius_squared in enumerate(row):
            if other != pin:
                classes[radius_squared].append(other)
        for members in classes.values():
            sizes.append(len(members))
            if len(members) == 3:
                quadruples.extend((pin, *order) for order in permutations(members))

    pin_neighbor_pairs = n * (n - 1)
    ordered_bases = sum(t * (t - 1) for t in sizes)
    defect = sum((t - 3) ** 2 for t in sizes)
    outside_triples = sum(t for t in sizes if t != 3)
    assert sum(sizes) == pin_neighbor_pairs
    assert ordered_bases <= 2 * pin_neighbor_pairs
    assert defect == ordered_bases - 5 * pin_neighbor_pairs + 9 * len(sizes)
    assert outside_triples <= 4 * defect
    assert len(quadruples) == 2 * (pin_neighbor_pairs - outside_triples)
    for first, second in combinations(range(4), 2):
        pairs = Counter((q[first], q[second]) for q in quadruples)
        assert all(left != right and count <= 2 for (left, right), count in pairs.items())
        assert sum(2 - pairs[i, j] for i, j in product(range(n), repeat=2)) == (
            2 * n * n - len(quadruples)
        )

    diameter_squared = max(map(max, distances))
    neighbors = [
        [other for other, d in enumerate(row) if d == diameter_squared]
        for row in distances
    ]
    assert any(1 <= len(row) <= 2 for row in neighbors)
    for pin, row in enumerate(neighbors):
        # In each triple, the two most distant neighbors are the arc endpoints.
        for triple in combinations(row, 3):
            endpoints = max(combinations(triple, 2), key=lambda ij: distances[ij[0]][ij[1]])
            middle = next(vertex for vertex in triple if vertex not in endpoints)
            assert neighbors[middle] == [pin]
            totals["diameter triples"] += 1

    totals["sets"] += 1
    totals["sets with triple classes"] += bool(quadruples)
    totals["ordered quadruples"] += len(quadruples)


def main():
    if not __debug__:
        raise SystemExit("Run without Python optimization to enable the integer checks.")

    grid = tuple(product(range(4), repeat=2))
    totals = Counter()
    for n in range(3, len(grid) + 1):
        for points in combinations(grid, n):
            if not any(collinear(*triple) for triple in combinations(points, 3)):
                verify_set(points, totals)
    print("4 x 4 grid, all subsets of size at least three with no collinear triple")
    for key in ("sets", "sets with triple classes", "ordered quadruples", "diameter triples"):
        print(f"  {key}: {totals[key]}")

    origin = (0, 0)
    inner = [(x, sign * y) for x, y in ((1, 8), (4, 7), (7, 4), (8, 1)) for sign in (-1, 1)]
    outer = [(3, -14), (3, 14), (6, -13)]
    assert Counter(squared_distance(origin, p) for p in inner + outer) == {65: 8, 205: 3}
    examples = [[origin, *inner, *outer], [origin, (1, 8), (4, 7), (7, 4)]]
    totals = Counter()
    for points in examples:
        assert not any(collinear(*triple) for triple in combinations(points, 3))
        verify_set(points, totals)
    assert totals["diameter triples"] >= 1
    print("Two additional examples, including concentric classes of sizes 8 and 3")
    print(f"  ordered quadruples: {totals['ordered quadruples']}")
    print(f"  diameter triples: {totals['diameter triples']}")


if __name__ == "__main__":
    main()
