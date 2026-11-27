#!/usr/bin/env python3
"""Exact coloring and cut checks for the high-girth edge replacement."""
from itertools import combinations


def edge(a, b):
    return tuple(sorted((a, b)))


def color(n, E):
    N = [set() for _ in range(n)]
    for a, b in E:
        N[a].add(b)
        N[b].add(a)
    out = {}

    def go():
        if len(out) == n:
            return out.copy()
        def key(v):
            return (len({out[w] for w in N[v] if w in out}), len(N[v]))
        v = max((v for v in range(n) if v not in out), key=key)
        used = {out[w] for w in N[v] if w in out}
        for c in range(3):
            if c not in used:
                out[v] = c
                x = go()
                if x is not None:
                    return x
        out.pop(v, None)
        return None

    return go()


def original():
    # Hubs 0..2; z=3; the triangle 4..6; six ordered y-vertices.
    Y = {ij: v for v, ij in enumerate(
        ((i, j) for i in range(3) for j in range(3) if i != j), 7
    )}
    E = {*combinations(range(4, 7), 2)}
    for i in range(3):
        E.update({edge(i, 3), edge(i, 4 + i)})
        R = [Y[i, j] for j in range(3) if j != i]
        E.add(edge(*R))
        for j in range(3):
            if i != j:
                E.update({edge(i, Y[i, j]), edge(j, Y[i, j])})
    return tuple(sorted(E))


def groetzsch():
    E = set()
    for i in range(5):
        j = (i + 1) % 5
        E.update({edge(i, j), edge(i + 5, j), edge(i, j + 5),
                  edge(i + 5, 10)})
    return tuple(sorted(E))


def verify():
    G, Q = original(), groetzsch()
    assert color(13, G) is None and color(11, Q) is None
    Gdel = {f: color(13, set(G) - {f}) for f in G}
    Qdel = {f: color(11, set(Q) - {f}) for f in Q}
    assert all(Gdel.values()) and all(Qdel.values())
    s, t = st = Q[0]
    V = 13
    lifts = []
    edges = set()
    for u, v in G:
        Z = {s: u}
        for i in range(11):
            if i != s:
                Z[i] = V
                V += 1
        final = edge(Z[t], v)
        block = {edge(Z[a], Z[b]): (a,b) for a,b in Q if (a,b) != st}
        block[final] = None
        assert not edges.intersection(block)
        edges.update(block)
        lifts.append((Z, block))
    N = [set() for _ in range(V)]
    for a, b in edges:
        N[a].add(b)
        N[b].add(a)
    assert all(not (N[a] & N[b]) for a, b in edges)
    for i, dropped in enumerate(G):
        for lifted_edge, internal in lifts[i][1].items():
            C = Gdel[dropped].copy()
            u, v = dropped
            assert C[u] == C[v]
            for j, (Z, _) in enumerate(lifts):
                A = Qdel[internal] if i == j and internal is not None else Qdel[st]
                shift = (C[Z[s]] - A[s]) % 3
                C.update({z: (A[w] + shift) % 3 for w,z in Z.items()})
            assert len(C) == V
            assert all((a,b) == lifted_edge or C[a] != C[b] for a,b in edges)

    unseen = set(range(3, V))
    components = 0
    while unseen:
        components += 1
        todo = [unseen.pop()]
        while todo:
            fresh = N[todo.pop()] & unseen
            unseen.difference_update(fresh)
            todo.extend(fresh)
    assert components >= 5
    print(f"Checked {V} vertices, {len(edges)} edge-deletion colorings, "
          f"triangle-freeness, and a three-vertex cut into {components} components.")


if __name__ == "__main__":
    verify()
