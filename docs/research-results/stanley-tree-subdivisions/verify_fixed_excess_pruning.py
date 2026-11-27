"""Check deletion of a trivalent pendant and recovery of its attachment point."""

from collections import Counter
from itertools import combinations

from verify_hub_fringe_recognition import centroid_form, extend


def distances(graph, start):
    result = {start: 0}
    stack = [start]
    while stack:
        u = stack.pop()
        for v, weight in graph[u].items():
            if v not in result:
                result[v] = result[u] + weight
                stack.append(v)
    return result


def profile(graph, root):
    """Signed distances from a vertex to every reduced vertex, including itself."""
    result = Counter()
    for vertex, distance in distances(graph, root).items():
        result[distance] += len(graph[vertex]) - 2
    return result


def pair_spectrum(graph, omitted=None):
    result = Counter()
    for u in graph:
        if u == omitted:
            continue
        for v, distance in distances(graph, u).items():
            if v > u and v != omitted:
                result[distance] += (len(graph[u]) - 2) * (len(graph[v]) - 2)
    return result


def shifted(spectrum, delta):
    return Counter({value + delta: weight for value, weight in spectrum.items()})


def nonzero(spectrum):
    return {value: weight for value, weight in spectrum.items() if weight}


def prune(graph, leaf):
    z, = graph[leaf]
    edge = graph[z][leaf]
    (u, left), (v, right) = [(v, d) for v, d in graph[z].items() if v != leaf]
    trimmed = {v: dict(row) for v, row in graph.items() if v not in (z, leaf)}
    del trimmed[u][z], trimmed[v][z]
    trimmed[u][v] = trimmed[v][u] = left + right

    root = profile(graph, z)
    root[edge] += 1  # Omit the original leaf whose defect was -1.
    old_independent = pair_spectrum(graph, omitted=leaf)
    reconstructed = old_independent.copy()
    reconstructed.subtract(shifted(root, edge))
    assert nonzero(reconstructed) == nonzero(pair_spectrum(graph))
    expected_trimmed = old_independent.copy()
    expected_trimmed.subtract(root)
    expected_trimmed[0] += 1
    assert nonzero(expected_trimmed) == nonzero(pair_spectrum(trimmed))
    root[0] -= 1  # The marked point now has defect zero.

    # Recover all possible interior points in the known trimmed tree that
    # could have this unsigned distance set. Then check the signed profiles.
    wanted = nonzero(root)
    assert len(wanted) == len(trimmed)
    sums = {s+t for s, t in combinations(wanted, 2)}
    candidate_edges = [(a, b) for a in trimmed for b, length in trimmed[a].items()
                       if a < b and length in sums]
    assert candidate_edges == [(min(u, v), max(u, v))]
    matches = []
    for a, b in candidate_edges:
        length = trimmed[a][b]
        from_a = distances(trimmed, a)
        from_b = distances(trimmed, b)
        for position in wanted:
            if not 0 < position < length or length - position not in wanted:
                continue
            observed = Counter()
            for vertex in trimmed:
                to_mark = min(position + from_a[vertex], length-position + from_b[vertex])
                observed[to_mark] += len(trimmed[vertex]) - 2
            if nonzero(observed) == wanted:
                matches.append(position)
    correct = left if u < v else right
    assert correct in matches
    reflection = len(trimmed) == 2
    assert len(matches) == (2 if reflection else 1)
    return reflection, len(trimmed[u]) == 1 or len(trimmed[v]) == 1


def check():
    trees = {(): ((),)}
    topologies = pruned = reflected = pendant = 0
    for size in range(1, 14):
        for shape in trees.values():
            if size < 2 or any(len(row) == 2 for row in shape):
                continue
            topologies += 1
            graph = {v: {} for v in range(size)}
            edges = [(v, w) for v, row in enumerate(shape) for w in row if v < w]
            for i, (v, w) in enumerate(edges):
                graph[v][w] = graph[w][v] = 5**i
            for leaf, row in graph.items():
                if len(row) == 1 and len(graph[next(iter(row))]) == 3:
                    reflection, on_pendant = prune(graph, leaf)
                    pruned += 1
                    reflected += reflection
                    pendant += on_pendant
        if size < 13:
            trees = {centroid_form(child): child for shape in trees.values() for child in extend(shape)}
    assert reflected and pendant > reflected and pruned > pendant
    return topologies, pruned, reflected, pendant


if __name__ == "__main__":
    cores, prunings, symmetries, pendant = check()
    print(f"{cores} reduced topologies through 13 vertices; {prunings} pendant deletions.")
    print(f"{pendant} marks on pendant edges, including {symmetries} genuine path reflections.")
