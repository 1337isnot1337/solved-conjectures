#!/usr/bin/env python3
"""Exact checks of the previously known sharpness witness."""
from itertools import combinations

hubs = tuple("abc")
V = (*hubs, "z", *("x" + h for h in hubs),
     *("y" + i + j for i in hubs for j in hubs if i != j))
E = set()
def edge(u, v):
    E.add(frozenset((u, v)))
for i in hubs:
    edge(i, "z")
    edge(i, "x" + i)
    j, k = tuple(h for h in hubs if h != i)
    edge("y" + i + j, "y" + i + k)
    for o in (j, k):
        edge(i, "y" + i + o)
        edge(o, "y" + i + o)
for i, j in combinations(hubs, 2):
    edge("x" + i, "x" + j)
N = {v: {u for u in V if frozenset((u, v)) in E} for v in V}


def three_coloring(W):
    C = {}

    def dfs():
        if len(C) == len(W):
            return C.copy()
        def ordering(v):
            return len({C[u] for u in N[v] if u in C}), len(N[v]), v
        v = max((v for v in W if v not in C), key=ordering)
        taken = {C[u] for u in N[v] if u in C}
        for c in range(3):
            if c not in taken:
                C[v] = c
                outcome = dfs()
                if outcome is not None:
                    return outcome
        C.pop(v, None)
        return None
    return dfs()


def run():
    assert len(V) == 13 and len(E) == 24
    assert all(not any(frozenset(e) in E for e in combinations(W, 2))
               for W in [("z", "xa", "yab", "yba", "yca")])
    assert all(any(frozenset(e) in E for e in combinations(W, 2))
               for W in combinations(V, 6))
    assert three_coloring(V) is None
    print("Vertex order:", " ".join(V))
    for v in V:
        C = three_coloring(tuple(u for u in V if u != v))
        assert C and len(C) == 12
        assert all(v in e or len({C[u] for u in e}) == 2 for e in E)
        if v in {"a", "z", "xa", "yab"}:
            print(v, " ".join(str(C[u]) if u in C else "*" for u in V))
    outside = set(V) - set(hubs)
    sizes = []
    while outside:
        P = [outside.pop()]
        n = 0
        while P:
            v = P.pop()
            n += 1
            next_vertices = outside & N[v]
            P.extend(next_vertices)
            outside -= next_vertices
        sizes.append(n)
    assert sorted(sizes) == [1, 2, 2, 2, 3]
    print("Checked alpha=5, all 13 vertex deletions, and the 5-component cut.")


if __name__ == "__main__":
    run()
