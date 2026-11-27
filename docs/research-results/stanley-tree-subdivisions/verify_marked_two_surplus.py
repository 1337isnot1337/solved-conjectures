"""Finite checks of simultaneous pendant pruning and the rank-two endpoint test."""
from collections import Counter
from itertools import combinations, combinations_with_replacement

from verify_marked_visibility import small_trees


def measure(entries):
    values = Counter()
    for place, mass in entries:
        values[place] += mass
    return {place: mass for place, mass in values.items() if mass}


def combine(*terms):
    return measure((place + shift, sign * mass)
                   for values, sign, shift in terms
                   for place, mass in values.items())


def test_pruning(tree):
    edges = [(u, v) for u, neighbors in enumerate(tree) for v in neighbors if u < v]
    weights = {edge: 2 * (index + 1) for index, edge in enumerate(edges)}
    vertices = list(range(len(tree)))
    defect = [len(adj) - 2 for adj in tree]
    distances = []
    for start in vertices:
        row = [None] * len(tree)
        queue = [(start, -1, 0)]
        while queue:
            at, previous, distance = queue.pop()
            row[at] = distance
            for neighbor in tree[at]:
                if neighbor != previous:
                    length = weights[tuple(sorted((at, neighbor)))]
                    queue.append((neighbor, at, distance + length))
        distances.append(row)

    pairs = list(combinations(vertices, 2))
    def pair_measure(defects):
        return measure((distances[u][v], defects[u] * defects[v]) for u, v in pairs)

    marks = [(u, distances[u]) for u in vertices if defect[u] > 0]
    for (u, v), length in weights.items():
        h = [min(distances[x][u], distances[x][v]) + length // 2 for x in vertices]
        marks.append((None, h))
    boundary = Counter()
    old_pairs = pair_measure(defect)
    for leaf in (v for v in vertices if defect[v] == -1):
        parent = tree[leaf][0]
        length = distances[leaf][parent]
        others = [v for v in vertices if v != leaf]
        source = measure((distances[leaf][v], defect[v]) for v in others)
        parent_profile = combine((source, 1, -length))
        new_defect = defect.copy()
        new_defect[leaf] = 0
        new_defect[parent] -= 1
        predicted = combine((old_pairs, 1, 0), (parent_profile, 1, length),
                            (parent_profile, -1, 0), ({0: defect[parent]}, 1, 0))
        assert predicted == pair_measure(new_defect)
        for root, h in marks:
            if h[leaf] < length:
                boundary["protected"] += 1
                continue
            assert h[leaf] == h[parent] + length
            if root == parent:
                name = "suppressed root" if new_defect[parent] == 0 else "retained root"
            else:
                name = "other removable"
            boundary[name] += 1
            old_profile = measure((h[v], defect[v]) for v in vertices)
            expected = combine((old_profile, 1, 0), ({h[leaf]: 1}, 1, 0),
                               ({h[parent]: 1}, -1, 0))
            actual = measure((h[v], new_defect[v]) for v in vertices)
            assert expected == actual
    return boundary


def test_two_tags(n):
    # Coordinates are doubled so v and w can be stored as integers.
    units = [tuple(2 * int(a == b) for a in range(n)) for b in range(n)]
    zero = (0,) * n
    count = 0
    for shared in range(n):
        others = [x for x in range(n) if x != shared]
        for supported in combinations(others, 4):
            for alternate in (False, True):
                extra = {label: (1 if not alternate or i % 2 == 0 else -1)
                         for i, label in enumerate(supported)}
                v = tuple(int(i == shared) + extra.get(i, 0) for i in range(n))
                w = tuple(units[shared][i] - v[i] for i in range(n))
                endpoints = [zero, v, w, *units]
                for a, b in combinations_with_replacement(endpoints, 2):
                    for ancestor in (zero, v, w):
                        result = tuple(x + y - 2 * s for x, y, s in zip(a, b, ancestor))
                        if result in units and result != units[shared]:
                            assert ancestor == zero and {a, b} == {result, zero}
                        count += 1
    return count


def main():
    total = Counter()
    topologies = 0
    for tree in small_trees(10):
        if len(tree) >= 4 and all(len(adj) != 2 for adj in tree):
            total.update(test_pruning(tree))
            topologies += 1
    assert all(total[key] for key in ("protected", "suppressed root", "retained root"))
    checks = sum(test_two_tags(n) for n in range(5, 9))
    print(f"{topologies} reduced topologies with {sum(total.values()):,} "
          f"marked pendant choices: {dict(total)}")
    print(f"{checks:,} rank-two endpoint/ancestor assignments")


if __name__ == "__main__":
    main()
