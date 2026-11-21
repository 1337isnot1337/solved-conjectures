"""Finite checks for the clique-projection proof and the two-prime dichotomy."""

from collections import Counter
from itertools import combinations
from math import prod


def circulant(order, steps):
    return [
        {(i + sign * step) % order for step in steps for sign in (-1, 1)}
        for i in range(order)
    ]


def maximal_cliques(graph):
    cliques = []

    def visit(current, possible, excluded):
        if not possible and not excluded:
            cliques.append(frozenset(current))
            return
        pivot = max(possible | excluded, key=lambda i: len(possible & graph[i]))
        for i in sorted(possible - graph[pivot]):
            visit(current | {i}, possible & graph[i], excluded & graph[i])
            possible.remove(i)
            excluded.add(i)

    visit(set(), set(range(len(graph))), set())
    return cliques


def shift(clique, move, order):
    return frozenset((i + move) % order for i in clique)


def stabilizer(clique, order):
    return frozenset(i for i in range(order) if shift(clique, i, order) == clique)


def canonical_faces(graph):
    # Bit i is fixed to one on face i and to zero on the faces of its nonneighbors.
    universe = (1 << len(graph)) - 1
    result = []
    for i, neighbors in enumerate(graph):
        ones = 1 << i
        free = sum(1 << j for j in neighbors)
        result.append((universe ^ (ones | free), ones))
    return result


def meet(faces):
    zeros = ones = 0
    for zero_bits, one_bits in faces:
        zeros |= zero_bits
        ones |= one_bits
    assert not (zeros & ones)
    return zeros, ones


def contains(face, point):
    zeros, ones = face
    return not zeros & point and point & ones == ones


def check_projection(graph, faces):
    order = len(graph)
    cliques = maximal_cliques(graph)
    stabilizers = {c: stabilizer(c, order) for c in cliques}
    least = set.intersection(*(set(h) for h in stabilizers.values()))
    base = next((c for c in cliques if stabilizers[c] == least), None)
    if base is None:
        return False
    classes = {shift(least, i, order) for i in range(order)}
    selected = {shift(base, i, order) for i in range(order)}
    records = Counter()
    for clique in selected:
        _, anchor = meet(faces[i] for i in clique)
        assert {i for i, face in enumerate(faces) if contains(face, anchor)} == clique
        for bundle in classes:
            if not bundle <= clique:
                continue
            fixed0, fixed1 = meet(faces[i] for i in bundle)
            for i in bundle:
                zero, one = faces[i]
                point = anchor ^ ((fixed0 | fixed1) & ~(zero | one))
                assert contains(faces[i], point)
                assert all(j in clique for j, face in enumerate(faces) if contains(face, point))
                records[point] += 1
    k = len(base) // len(least)
    assert sum(records.values()) == order * k
    assert max(records.values()) <= k
    assert len(records) >= order
    return True


def check_semiprime(first, second):
    order = first * second
    cases = Counter()
    for mask in range(1 << (order // 2)):
        steps = {d for d in range(1, order // 2 + 1) if mask & (1 << (d - 1))}
        graph = circulant(order, steps)
        sizes = {len(stabilizer(c, order)) for c in maximal_cliques(graph)}
        if 1 in sizes:
            cases["free clique orbit"] += 1
        elif len(sizes) == 1:
            cases["common stabilizer"] += 1
        else:
            assert sizes == {first, second}
            for i, j in combinations(range(order), 2):
                same_line = (i - j) % first == 0 or (i - j) % second == 0
                assert (j in graph[i]) == same_line
            cases["grid"] += 1
    assert cases["grid"] == 1
    return dict(cases)


def main():
    projection_count = 0
    for order in (4, 8, 9, 16):
        for mask in range(1 << (order // 2)):
            steps = {d for d in range(1, order // 2 + 1) if mask & (1 << (d - 1))}
            graph = circulant(order, steps)
            assert check_projection(graph, canonical_faces(graph))
            projection_count += 1

    # Three true twins per cell of a nine-cycle with triangles on the mod-3 classes.
    order = 27
    graph = circulant(order, {d for d in range(1, order) if d % 9 in (0, 1, 3, 6, 8)})
    assert {len(stabilizer(c, order)) for c in maximal_cliques(graph)} == {3, 9}
    assert check_projection(graph, canonical_faces(graph))
    print("Prime-power circulant projection checks:", projection_count + 1)

    for pair in ((2, 3), (2, 5), (2, 7), (3, 5), (3, 7), (2, 11)):
        print("Semiprime", prod(pair), check_semiprime(*pair))

    # Literal two-dimensional boundary, ordered by cycling through the square edges.
    square = [(1, 0), (2, 0), (0, 1), (0, 2)]
    assert check_projection(circulant(4, {1}), square)
    # A heterogeneous two-cycle of intersecting faces in dimension three.
    assert check_projection(circulant(2, {1}), [(1, 0), (6, 0)])
    print("Literal cube examples: 2")


if __name__ == "__main__":
    main()
