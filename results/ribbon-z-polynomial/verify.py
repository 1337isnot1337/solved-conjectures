#!/usr/bin/env python3
"""Finite checks for the ribbon Z-polynomial identity.

The script builds connected snakes by series and parallel extension of the
last edge, computes the graphic Z-polynomial from the flat recursion, and
compares it with the Narayana polynomial. It also checks the diamond and
rejects the cycle matroid of K_{2,3}. These checks are not the proof.
"""

from math import comb


def narayana(rank):
    order = rank + 1
    return [
        comb(order, index) * comb(order, index + 1) // order
        for index in range(order)
    ]


def poly_key(vertices, edges):
    return (
        vertices,
        tuple(sorted((min(left, right), max(left, right)) for left, right in edges)),
    )


_CACHE = {}


def polynomials(vertices, edges):
    """Return (Kazhdan-Lusztig polynomial, Z-polynomial) of a graphic matroid."""
    key = poly_key(vertices, edges)
    cached = _CACHE.get(key)
    if cached is not None:
        return cached
    size = len(edges)

    def finder(chosen):
        parent = list(range(vertices))

        def find(vertex):
            while parent[vertex] != vertex:
                parent[vertex] = parent[parent[vertex]]
                vertex = parent[vertex]
            return vertex

        for index in chosen:
            left, right = edges[index]
            root_left, root_right = find(left), find(right)
            if root_left != root_right:
                parent[root_right] = root_left
        return find

    def rank(chosen):
        find = finder(chosen)
        return vertices - len({find(vertex) for vertex in range(vertices)})

    def is_flat(chosen):
        find = finder(chosen)
        for index, (left, right) in enumerate(edges):
            if index not in chosen and find(left) == find(right):
                return False
        return True

    def contract(chosen):
        find = finder(chosen)
        labels = {}
        for vertex in range(vertices):
            root = find(vertex)
            if root not in labels:
                labels[root] = len(labels)
        contracted = []
        for index, (left, right) in enumerate(edges):
            if index in chosen:
                continue
            image_left, image_right = labels[find(left)], labels[find(right)]
            if image_left != image_right:
                contracted.append((image_left, image_right))
        if not contracted:
            return 1, []
        used = sorted({endpoint for edge in contracted for endpoint in edge})
        relabel = {vertex: index for index, vertex in enumerate(used)}
        return len(used), [(relabel[left], relabel[right]) for left, right in contracted]

    if size == 0:
        _CACHE[key] = ([1], [1])
        return _CACHE[key]
    matroid_rank = rank(set(range(size)))
    higher = [0] * (matroid_rank + 1)
    for mask in range(1 << size):
        chosen = {index for index in range(size) if mask >> index & 1}
        if not chosen or not is_flat(chosen):
            continue
        flat_rank = rank(chosen)
        quotient, _ = polynomials(*contract(chosen))
        for degree, coefficient in enumerate(quotient):
            if flat_rank + degree <= matroid_rank:
                higher[flat_rank + degree] += coefficient
    kazhdan = []
    for degree in range((matroid_rank + 1) // 2):
        if 2 * degree == matroid_rank:
            break
        kazhdan.append(higher[matroid_rank - degree] - higher[degree])
    z_value = [
        (kazhdan[degree] if degree < len(kazhdan) else 0) + higher[degree]
        for degree in range(matroid_rank + 1)
    ]
    _CACHE[key] = (kazhdan, z_value)
    return _CACHE[key]


def z_of(vertices, edges):
    return polynomials(vertices, edges)[1]


def series(vertices, edges, last):
    left, right = edges[last]
    fresh = vertices
    rewritten = edges[:last] + edges[last + 1 :] + [(left, fresh), (fresh, right)]
    return vertices + 1, rewritten, len(rewritten) - 1


def parallel(vertices, edges, last):
    rewritten = edges + [edges[last]]
    return vertices, rewritten, len(rewritten) - 1


def all_snakes(max_edges):
    queue = [(2, [(0, 1), (0, 1)], 0)]
    seen = set()
    while queue:
        vertices, edges, last = queue.pop()
        signature = (poly_key(vertices, edges), last)
        if signature in seen or len(edges) > max_edges:
            continue
        seen.add(signature)
        yield vertices, edges
        queue.append(parallel(vertices, edges, last))
        queue.append(series(vertices, edges, last))


def main():
    triangle = z_of(3, [(0, 1), (1, 2), (2, 0)])
    if triangle != [1, 3, 1]:
        raise SystemExit(f"triangle Z-polynomial {triangle}")
    diamond = z_of(4, [(0, 1), (0, 2), (1, 2), (0, 3), (1, 3)])
    if diamond != narayana(3):
        raise SystemExit(f"diamond Z-polynomial {diamond}")
    bipartition = z_of(5, [(0, 2), (0, 3), (0, 4), (1, 2), (1, 3), (1, 4)])
    if bipartition == narayana(4):
        raise SystemExit("K_{2,3} unexpectedly matched the Narayana polynomial")
    checked = 0
    for vertices, edges in all_snakes(8):
        value = z_of(vertices, edges)
        rank = len(value) - 1
        if value != narayana(rank):
            raise SystemExit(f"snake mismatch {edges}: {value} != {narayana(rank)}")
        checked += 1
    if checked < 100:
        raise SystemExit(f"expected at least 100 snakes, checked {checked}")
    print(
        f"Checked {checked} connected snakes with at most 8 edges, "
        f"the triangle, and the diamond; K_{{2,3}} has Z-polynomial {bipartition}."
    )


if __name__ == "__main__":
    main()
