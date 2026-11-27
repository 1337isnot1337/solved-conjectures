"""Finite regression check for the one-gate projection, not a proof."""
import itertools as it
from collections import Counter

import networkx as nx


def paths(g, s, t):
    if s == t:
        return [(s,)]
    if not nx.has_path(g, s, t):
        return []
    return map(tuple, nx.all_simple_paths(g, s, t))


def check():
    counts = Counter()
    for graph in nx.graph_atlas_g():
        if not graph or not nx.is_connected(graph):
            continue
        counts["connected hosts"] += 1
        blocks = list(map(frozenset, nx.biconnected_components(graph)))
        vertices = set(graph)
        cut = set(nx.articulation_points(graph))
        tree = nx.Graph()
        tree.add_nodes_from(("B", b) for b in blocks)
        tree.add_edges_from((("B", b), ("C", v)) for b in blocks for v in cut & b)
        all_paths = {}
        for s, t in it.combinations(sorted(vertices), 2):
            all_paths[s, t] = list(paths(graph, s, t))
        footprints = []
        for family in all_paths.values():
            for p in family:
                counts["simple paths"] += 1
                footprint = {("C", v) for v in p if v in cut}
                for x, y in zip(p, p[1:]):
                    matches = [b for b in blocks if x in b and y in b]
                    assert len(matches) == 1
                    footprint.add(("B", matches[0]))
                assert nx.is_connected(tree.subgraph(footprint))
                footprints.append((frozenset(p), footprint))
        for b in blocks:
            counts["blocks"] += 1
            core = graph.subgraph(b)
            gate = {v: v for v in b}
            tails = {v: [(v,)] for v in b}
            for fringe in nx.connected_components(graph.subgraph(vertices-b)):
                targets = {w for v in fringe for w in graph[v] if w in b}
                assert len(targets) == 1
                x, = targets
                piece = graph.subgraph(fringe | {x})
                for v in fringe:
                    gate[v] = x
                    tails[v] = list(paths(piece, v, x))

            for (s, t), family in all_paths.items():
                if gate[s] == gate[t]:
                    generated = set()
                else:
                    generated = {
                        left[:-1] + middle + tuple(reversed(right[:-1]))
                        for middle in paths(core, gate[s], gate[t])
                        for left in tails[s]
                        for right in tails[t]
                    }
                seen = {
                    p for p in family
                    if any(x in b and y in b for x, y in zip(p, p[1:]))
                }
                assert generated == seen, (list(graph.edges), b, s, t)
                for parity in (0, 1):
                    projected = {
                        tuple(v for v in p if v in b)
                        for p in seen if (len(p)-1) % 2 == parity
                    }
                    compatible = {
                        mid for mid in paths(core, gate[s], gate[t])
                        if gate[s] != gate[t] and any(
                            (len(left)+len(mid)+len(right)-3) % 2 == parity
                            for left in tails[s] for right in tails[t]
                        )
                    }
                    assert projected == compatible
                    counts["block/pair/parity checks"] += 1
    for label, value in counts.items():
        print(f"{label}: {value:,}")


if __name__ == "__main__":
    check()
