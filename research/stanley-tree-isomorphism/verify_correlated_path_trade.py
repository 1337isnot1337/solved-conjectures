"""Check two exact linear trades and their shared-endpoint path statistics."""
from collections import Counter
from itertools import combinations, product
from fractions import Fraction

TRADES = [
    ("01", "02", "03", "04", "15", "16", "57", "78"),
    ("01", "02", "03", "14", "15", "26", "37", "68"),
    ("01", "02", "03", "04", "15", "16", "27", "78"),
    ("01", "02", "03", "14", "25", "36", "47", "48"),
]
TREES = [tuple(tuple(map(int, edge)) for edge in tree) for tree in TRADES]


def components(n, retained):
    parts = [{v} for v in range(n)]
    for a, b in retained:
        c = next(p for p in parts if a in p)
        d = next(p for p in parts if b in p)
        assert c is not d
        c.update(d)
        parts.remove(d)
    return tuple(sorted(map(len, parts), reverse=True))


def forest_polynomial(n, edges):
    profile = Counter()
    for size in range(len(edges) + 1):
        for kept in combinations(edges, size):
            profile[components(n, kept)] += 1
    return profile


def path_masks(n, edges):
    neighbors = [[] for _ in range(n)]
    for i, (a, b) in enumerate(edges):
        neighbors[a].append((b, 1 << i))
        neighbors[b].append((a, 1 << i))
    masks = []
    for v in range(n):
        marked = {v: 0}
        work = [v]
        for u in work:
            for w, edge in neighbors[u]:
                if w not in marked:
                    marked[w] = marked[u] | edge
                    work.append(w)
        masks.append(tuple(marked[w] for w in range(n)))
    return masks


def double_paths(n, edges):
    distances = [tuple(mask.bit_count() for mask in row) for row in path_masks(n, edges)]
    diameter = max(max(row) for row in distances)
    ends = [row.count(diameter) for row in distances]
    return diameter, sum(ends), sum(k * (k - 1) for k in ends)


def graft(n, edges, decoration):
    block = len(decoration) + 1
    out = [(a * block, b * block) for a, b in edges]
    for v in range(n):
        out.extend((v * block + a, v * block + b) for a, b in decoration)
    return n * block, out


def main():
    profiles = [forest_polynomial(9, tree) for tree in TREES]
    assert all(sum(prof.values()) == 256 for prof in profiles)
    assert profiles[0] + profiles[1] == profiles[2] + profiles[3]
    checks = [double_paths(9, tree) for tree in TREES]
    assert [diam for diam, _, _ in checks] == [5] * 4
    assert [wedges for _, _, wedges in checks] == [6, 6, 2, 8]
    assert checks[0][1] + checks[1][1] == checks[2][1] + checks[3][1]

    for decoration in [(), ((0, 1),), ((0, 1), (0, 2)), ((0, 1), (1, 2), (1, 3)),
                       ((0, 1), (0, 2), (0, 3), (1, 4), (2, 5), (2, 6))]:
        root_dists = [x.bit_count() for x in path_masks(len(decoration) + 1, decoration)[0]]
        height = max(root_dists)
        deepest = root_dists.count(height)
        for tree, (_, p, w) in zip(TREES, checks):
            size, edges = graft(9, tree, decoration)
            diameter, _, wedges = double_paths(size, edges)
            assert diameter == 5 + 2 * height
            assert wedges == deepest ** 3 * w + deepest ** 2 * (deepest - 1) * p

    path = ((0, 1), (1, 2), (2, 3))
    star = ((0, 1), (0, 2), (0, 3))
    two_edges = ((0, 1), (2, 3))
    assert (forest_polynomial(4, path) + forest_polynomial(4, path[:2])
            == forest_polynomial(4, star) + forest_polynomial(4, two_edges))

    # Uniform maps of the endpoints of two labelled independent paths.
    # Check the complete percolation polynomial at n distinct rational points.
    for tree, U in zip(TREES, profiles):
        n = 9
        masks = path_masks(n, tree)
        unions = Counter((masks[a][b] | masks[c][d]).bit_count()
                         for a, b, c, d in product(range(n), repeat=4))
        for j in range(n):
            q = Fraction(j, n)
            direct = sum(m * q ** e for e, m in unions.items())
            from_sizes = sum(
                m * q ** (n - len(part)) * (1 - q) ** (len(part) - 1)
                * sum(s * s for s in part) ** 2
                for part, m in U.items()
            )
            assert direct == from_sizes
    print("Checked all 1024 spanning forests of the four diameter-five trees, the four-vertex")
    print("forest trade, 20 uniform grafts and four complete random two-path union laws.")


if __name__ == "__main__":
    main()
