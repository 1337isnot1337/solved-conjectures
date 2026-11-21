"""Cross-check the two-stabilizer criterion using direct clique enumeration."""

from itertools import combinations
from math import gcd, lcm

from check_cyclic_periods import circulant, maximal_cliques, stabilizer


def check_graph(graph):
    order = len(graph)
    sizes = {len(stabilizer(clique, order)) for clique in maximal_cliques(graph)}
    # Subgroups of a cyclic group are ordered by divisibility of their sizes.
    minimal = sorted(k for k in sizes if not any(k != h and k % h == 0 for h in sizes))
    if len(minimal) != 2 or lcm(*minimal) != order:
        return None

    indices = sorted(order // k for k in minimal)
    for i, j in combinations(range(order), 2):
        share_line = any((i - j) % side == 0 for side in indices)
        assert (j in graph[i]) == share_line, (order, sizes, i, j)
    return (*indices, gcd(*minimal))


def main():
    tested = reached = 0
    for order in (6, 10, 12, 15, 18, 20, 24):
        generators = range(1, order // 2 + 1)
        for mask in range(1 << len(generators)):
            steps = [k for k in generators if mask & (1 << (k - 1))]
            reached += check_graph(circulant(order, steps)) is not None
            tested += 1
    print(f"{tested} labeled circulants, {reached} satisfying both hypotheses")

    for a, b, m in ((2, 3, 4), (3, 4, 5), (4, 9, 2), (8, 9, 1)):
        order = a * b * m
        graph = circulant(order, [k for k in range(1, order) if k % a == 0 or k % b == 0])
        assert check_graph(graph) == (a, b, m)

    # Two disjoint 2-by-3 grids. Their stabilizers of orders 2 and 3 generate
    # only the subgroup of order 6, and the global criterion must skip them.
    disconnected = circulant(12, [4, 6])
    assert {len(stabilizer(c, 12)) for c in maximal_cliques(disconnected)} == {2, 3}
    assert check_graph(disconnected) is None
    print("Composite-side, nontrivial-cell and nongenerating cases passed.")


if __name__ == "__main__":
    main()
