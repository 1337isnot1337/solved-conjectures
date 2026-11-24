"""Enumerate perfect matchings of the explicit connected-complement obstruction."""

from itertools import combinations


def cube(offset):
    return {
        (offset + u, offset + v)
        for u, v in combinations(range(8), 2)
        if (u ^ v) in (1, 2, 4)
    }


def reachable(adjacency, excluded_edges=frozenset()):
    seen = {0}
    pending = [0]
    while pending:
        u = pending.pop()
        for v in adjacency[u] - seen:
            if (min(u, v), max(u, v)) not in excluded_edges:
                seen.add(v)
                pending.append(v)
    return seen


def matchings(adjacency, remaining):
    if not remaining:
        yield frozenset()
        return
    u = min(remaining)
    for v in adjacency[u] & remaining:
        for rest in matchings(adjacency, remaining - {u, v}):
            yield rest | {(u, v)}


def main():
    edges = cube(0)
    for neighbor, offset in zip((1, 2, 4), (8, 16, 24)):
        edges.remove((0, neighbor))
        edges.update(cube(offset) - {(offset, offset + 1)})
        edges.add((0, offset + 1))
        edges.add((neighbor, offset))

    vertices = set(range(32))
    adjacency = {u: set() for u in vertices}
    for u, v in edges:
        assert u < v and (u % 8).bit_count() % 2 != (v % 8).bit_count() % 2
        adjacency[u].add(v)
        adjacency[v].add(u)
    assert len(edges) == 48 and all(len(neighbors) == 3 for neighbors in adjacency.values())
    assert reachable(adjacency) == vertices
    for offset in (8, 16, 24):
        gadget = set(range(offset, offset + 8))
        crossing = {edge for edge in edges if len(gadget.intersection(edge)) == 1}
        assert len(crossing) == 2 and sum(0 in edge for edge in crossing) == 1

    count = 0
    for matching in matchings(adjacency, vertices):
        assert len(matching) == 16
        assert reachable(adjacency, matching) != vertices
        count += 1
    assert count > 0
    print(f"{len(vertices)} vertices, {len(edges)} edges, {count} perfect matchings")
    print("Every perfect matching has disconnected complement.")


if __name__ == "__main__":
    main()
