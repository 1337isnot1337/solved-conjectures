"""Check the coset criterion and the exceptional row counts on exact cube faces."""

from collections import Counter
from fractions import Fraction
from itertools import combinations

from check_cyclic_periods import circulant, maximal_cliques, stabilizer


def check_circulant(graph):
    n = len(graph)
    cliques = maximal_cliques(graph)
    checked = 0
    for clique in cliques:
        if any(len(clique & other) > 1 for other in cliques if other != clique):
            continue
        h = stabilizer(clique, n)
        if len(h) == 1:
            continue
        rows = {frozenset((v + i) % n for v in clique) for i in range(n)}
        assert len(clique) == len(h) and len(rows)*len(h) == n
        assert set.union(*(set(row) for row in rows)) == set(range(n))
        for row, other in combinations(rows, 2):
            degrees = {len(graph[x] & other) for x in row}
            degrees.update(len(graph[y] & row) for y in other)
            assert degrees in ({0}, {1})
        checked += 1
    return checked


def subcube(anchor, mask):
    subset = mask
    result = set()
    while True:
        result.add(anchor ^ subset)
        if not subset:
            return result
        subset = (subset - 1) & mask


def check_rows(rows):
    width = len(rows[0])
    faces = [face for row in rows for face in row]
    assert all(not x <= y and not y <= x for x, y in combinations(faces, 2))
    for row in rows:
        assert len(row) == width and set.intersection(*row)
    for row, other in combinations(rows, 2):
        degrees = {sum(bool(f & g) for g in other) for f in row}
        degrees.update(sum(bool(g & f) for f in row) for g in other)
        assert degrees in ({0}, {1})
    assert len(set.union(*faces)) >= len(faces)


def two_face_example(n):
    # All n deficient rows send a unit-neighbor contribution to the origin.
    entire = (1 << n) - 1
    rows = [[subcube(1 << j, 1 << j), subcube(1 << j, entire ^ (1 << j))]
            for j in range(n)]
    check_rows(rows)
    mass = Counter()
    for first, second in rows:
        (anchor,) = first & second
        neighbors = {x for x in first | second if (x ^ anchor).bit_count() == 1}
        for x in neighbors:
            mass[x] += Fraction(1, len(neighbors))
    assert mass[0] == 1 and max(mass.values()) == 1 and sum(mass.values()) == n


def six_face_example():
    masks = [bits for bits in range(16) if bits.bit_count() == 2]
    anchors = (0, 15, 32, 47)
    rows = [[subcube(r, mask) for mask in masks] for r in anchors]
    check_rows(rows)
    corners = [{r ^ m for m in masks} for r in anchors]
    assert corners[0] == corners[1] and corners[2] == corners[3]
    assert corners[0].isdisjoint(corners[2])
    for r, row in zip(anchors, rows):
        assert sum((x ^ r).bit_count() <= 1 for x in set.union(*row)) == 5


def main():
    graphs = cliques = 0
    for n in range(2, 19):
        for bits in range(1 << (n//2)):
            steps = [i for i in range(1, n//2 + 1) if bits & (1 << (i-1))]
            cliques += check_circulant(circulant(n, steps))
            graphs += 1
    for n in (2, 3, 6, 9):
        two_face_example(n)
    six_face_example()
    print(f"{graphs} labeled circulants, {cliques} eligible nontrivially stabilized cliques.")
    print("Four two-face families and a paired six-face deficit example passed.")


if __name__ == "__main__":
    main()
