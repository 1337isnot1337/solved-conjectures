"""Exact fixed-size star counts in the three-level tree used in the proof."""



def multiply(left, right):
    product = [0] * (len(left) + len(right) - 1)
    for i, a in enumerate(left):
        for j, b in enumerate(right):
            product[i + j] += a * b
    return product


def add(left, right):
    total = [0] * max(len(left), len(right))
    for i, value in enumerate(left):
        total[i] += value
    for i, value in enumerate(right):
        total[i] += value
    return total


def build_tree(d, k, t):
    graph = [[]]

    def child(parent):
        vertex = len(graph)
        graph.append([parent])
        graph[parent].append(vertex)
        return vertex

    for _ in range(d):
        hub = child(0)
        for _ in range(k):
            parent = child(hub)
            for _ in range(t):
                child(parent)
    return graph


def star(graph, vertex):
    """Shift the independence polynomial of the forest outside N[vertex]."""
    seen = {vertex, *graph[vertex]}

    def visit(v):
        seen.add(v)
        absent = [1]
        present = [0, 1]
        for w in graph[v]:
            if w not in seen:
                child_absent, child_present = visit(w)
                absent = multiply(absent, add(child_absent, child_present))
                present = multiply(present, child_absent)
        return absent, present

    counts = [0, 1]
    for v in range(len(graph)):
        if v not in seen:
            absent, present = visit(v)
            counts = multiply(counts, add(absent, present))
    return counts


def main():
    d, k, t = 3, 10, 2
    graph = build_tree(d, k, t)
    leaves = [v for v, adj in enumerate(graph) if len(adj) == 1]
    assert len(graph) == 94 and len(leaves) == 60
    assert sum(map(len, graph)) == 2 * (len(graph) - 1)
    assert all(len(adj) != 2 for adj in graph)
    root = star(graph, 0)
    leaf = star(graph, leaves[0])
    assert all(star(graph, v) == leaf for v in leaves)
    a, b = (2**t + 1)**k, 2**(t*k)
    c = 2**(t-1) * (2**t + 1)**(k-1)
    assert sum(root) == a**d
    assert sum(leaf) == c * a**(d-1) + (c + b//2) * (a+b)**(d-1)
    assert sum(root) > sum(leaf)
    r = next(i for i, (x, y) in enumerate(zip(root, leaf)) if x > y)
    print(f"vertices={len(graph)} leaves={len(leaves)} r={r}")
    print(f"root star={root[r]} each leaf star={leaf[r]}")
    print(f"total root star={sum(root)} total leaf star={sum(leaf)}")
    assert 9**10 > 3 * 8**10


if __name__ == "__main__":
    main()
