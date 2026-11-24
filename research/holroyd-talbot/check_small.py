#!/usr/bin/env python3
"""Exact finite smoke test; not used by the general proof.
Requires networkx. Enumerates all base graphs on up to 3 vertices,
with each fiber having either two or three vertices. Cross-edges may
only join the designated nonprivate vertices of three-vertex fibers.
"""
from collections import Counter
from itertools import combinations, product
import networkx as nx


def make_graph(n, leaves, edges):
    graph = nx.Graph()
    for i, m in enumerate(leaves):
        fiber = [(i, j) for j in range(m + 1)]
        graph.add_nodes_from(fiber)
        graph.add_edges_from(combinations(fiber, 2))
    graph.add_edges_from(((i, 0), (j, 0)) for i, j in edges)
    return graph


def exact_ekr(graph, r):
    independent = [
        frozenset(a) for a in combinations(graph, r)
        if not any(graph.has_edge(x, y) for x, y in combinations(a, 2))
    ]
    star = max(Counter(v for a in independent for v in a).values())
    intersection = nx.Graph()
    intersection.add_nodes_from(range(len(independent)))
    intersection.add_edges_from(
        (i, j) for i, j in combinations(range(len(independent)), 2)
        if independent[i] & independent[j]
    )
    maximum = 0
    strict = True
    for clique in nx.find_cliques(intersection):
        if len(clique) < maximum:
            continue
        if len(clique) > maximum:
            maximum = len(clique)
            strict = True
        if not set.intersection(*(set(independent[i]) for i in clique)):
            strict = False
    return maximum, star, strict


def main():
    checked = 0
    for n in range(1, 4):
        for leaves in product((1, 2), repeat=n):
            eligible = [(i, j) for i, j in combinations(range(n), 2)
                        if leaves[i] == leaves[j] == 2]
            for mask in range(1 << len(eligible)):
                edges = [e for k, e in enumerate(eligible) if mask >> k & 1]
                graph = make_graph(n, leaves, edges)
                t = leaves.count(1)
                for r in range(1, n + 1):
                    maximum, star, strict = exact_ekr(graph, r)
                    assert maximum == star, (n, leaves, mask, r, maximum, star)
                    assert strict == (r < n or t <= 2), (n, leaves, mask, r, strict)
                    checked += 1
    print(f"{checked} exact graph/rank checks passed")


if __name__ == "__main__":
    main()
