"""Independent exact verification of the failed single-edge reduction.

This verifies an obstruction to a proposed proof strategy. The icosahedral
graph is not a counterexample to Erdős151. No third-party packages are used.
"""
from itertools import combinations
import json
from pathlib import Path


def maximal_cliques(n, edges):
    adjacency = [set() for _ in range(n)]
    for u, v in edges:
        adjacency[u].add(v)
        adjacency[v].add(u)
    cliques = []
    for k in range(2, n+1):
        for vertices in combinations(range(n), k):
            if not all(v in adjacency[u] for u, v in combinations(vertices, 2)):
                continue
            common = set(range(n))
            for v in vertices:
                common.intersection_update(adjacency[v])
            if not common:
                cliques.append(frozenset(vertices))
    return cliques


def verify_gamma(n, edges, claimed, witness):
    assert type(claimed) is int and 0 <= claimed <= n
    assert all(type(v) is int and 0 <= v < n for v in witness)
    assert len(witness) == len(set(witness)) == claimed
    cliques = maximal_cliques(n, edges)
    witness = frozenset(witness)
    assert not any(c <= witness for c in cliques)
    # Avoiding maximal cliques is hereditary, so excluding all sets of the
    # next size excludes every larger set too.
    for vertices in combinations(range(n), claimed+1):
        s = frozenset(vertices)
        assert any(c <= s for c in cliques)
    return len(cliques)


def main():
    data = json.loads(Path(__file__).with_name("edge-deletion-obstruction.json").read_text())
    n = data["n"]
    assert type(n) is int and n == 12
    edges = {tuple(e) for e in data["edges"]}
    assert len(edges) == len(data["edges"]) == 30
    assert all(type(u) is int and type(v) is int and 0 <= u < v < n for u, v in edges)
    assert len(data["deletions"]) == len(edges)
    assert {tuple(d["edge"]) for d in data["deletions"]} == edges
    before = data["gamma"]
    assert before == 6
    assert verify_gamma(n, edges, before, data["witness"]) == 20
    for record in data["deletions"]:
        edge = tuple(record["edge"])
        assert any(tuple(sorted((edge[0], w))) in edges and tuple(sorted((edge[1], w))) in edges
                   for w in range(n) if w not in edge)
        assert record["gamma"] == 7 > before
        verify_gamma(n, edges-{edge}, record["gamma"], record["witness"])
    print(json.dumps({"verified": True, "graph": "icosahedral graph", "n": n,
                      "gamma": before, "edge_deletions_checked": 30,
                      "every_deletion_gamma": 7,
                      "scope": "single-edge proof reduction is false; Erdős151 unresolved"}))


if __name__ == "__main__":
    main()
