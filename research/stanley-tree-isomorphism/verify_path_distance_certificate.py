"""Check the degree-defect certificate, inverse line graph and trivalent variant."""

from collections import Counter, defaultdict
from itertools import combinations, combinations_with_replacement
from math import comb

from verify_centroid_edge import require
from verify_hub_fringe_recognition import centroid_form, extend


def pairs(graph):
    for v, neighbours in enumerate(graph):
        for w in neighbours:
            if w > v:
                yield v, w


def measured_paths(graph):
    """Enumerate unweighted distances at every pair, with and without endpoint weights."""
    paths = Counter()
    signed = Counter()
    for start in range(len(graph)):
        stack = [(start, -1, 0)]
        while stack:
            v, parent, distance = stack.pop()
            if start < v:
                paths[distance] += 1
                signed[distance] += (len(graph[start]) - 2) * (len(graph[v]) - 2)
            stack.extend((w, v, distance + 1) for w in graph[v] if w != parent)
    second = {j: paths[j] - 2*paths[j+1] + paths[j+2] for j in paths}
    require(second == dict(signed), "ordinary path counts disagree with degree-defect sums")
    return paths, {j for j, value in second.items() if value}


def path_certificate(support, k, count):
    if len(support) != comb(k, 2):
        return None
    atoms = tuple(sorted(s for s in support if not any(s-x in support for x in support)))
    if len(atoms) != k - 1:
        return None
    edges = {(a, b) for a, b in combinations(atoms, 2) if a+b in support}
    if len(edges) != count:
        return None
    return atoms, edges


def line_graph_of_suppression(graph):
    """Walk actual degree-two chains to compare independent edge adjacency."""
    endpoint = defaultdict(list)
    lengths = []
    for start, neighbours in enumerate(graph):
        if len(neighbours) == 2:
            continue
        for v in neighbours:
            parent = start
            length = 1
            while len(graph[v]) == 2:
                nxt = next(w for w in graph[v] if w != parent)
                v, parent = nxt, v
                length += 1
            if v > start:
                lengths.append(length)
                endpoint[start].append(length)
                endpoint[v].append(length)
    adjacent = {tuple(sorted(pair)) for arms in endpoint.values() for pair in combinations(arms, 2)}
    return tuple(sorted(lengths)), adjacent


def from_line_graph(atoms, edges):
    adjacent = {a: set() for a in atoms}
    for a, b in edges:
        adjacent[a].add(b)
        adjacent[b].add(a)
    hubs = sorted({tuple(sorted({a, b} | (adjacent[a] & adjacent[b]))) for a, b in edges})
    graph = [[] for _ in hubs]

    def node():
        graph.append([])
        return len(graph) - 1

    def link(v, w):
        graph[v].append(w)
        graph[w].append(v)

    for length in atoms:
        ends = [i for i, hub in enumerate(hubs) if length in hub]
        while len(ends) < 2:
            ends.append(node())
        require(len(ends) == 2, "edge belongs to more than two branch-vertex cliques")
        last = ends[0]
        for _ in range(length - 1):
            new = node()
            link(last, new)
            last = new
        link(last, ends[1])
    return graph


def examine(graph, paths, support):
    degrees = [len(row) for row in graph if len(row) != 2]
    observed = path_certificate(support, len(degrees), sum(comb(d, 2) for d in degrees))
    M = 2*paths[2] - 2*(paths[1]+1) + 6
    require(M == sum((d-2)**2 for d in degrees), "wrong sum of degree defects")
    histogram_only = None
    if M >= 2 and (M-2) % 2 == 0:
        histogram_only = path_certificate(support, M, 3*(M-2)//2)
    if histogram_only:
        require(histogram_only == observed and set(degrees) <= {1, 3},
                "histogram-only certificate accepted a nontrivalent reduced tree")
    if observed:
        require(observed == line_graph_of_suppression(graph), "wrong recovered lengths or joins")
        require(centroid_form(from_line_graph(*observed)) == centroid_form(graph),
                "line graph inversion did not recover the expanded tree")
    return observed is not None, histogram_only is not None


def census():
    trees = {(): ((),)}
    total = certified = trivalent = repeated_distance_histograms = 0
    for n in range(1, 14):
        seen = Counter()
        accepted_histograms = set()
        for graph in trees.values():
            if n == 1:
                continue
            paths, support = measured_paths(graph)
            joint, alone = examine(graph, paths, support)
            signature = tuple(paths[j] for j in range(1, max(paths) + 1))
            seen[signature] += 1
            if alone:
                accepted_histograms.add(signature)
            total += 1
            certified += joint
            trivalent += alone
        require(all(seen[s] == 1 for s in accepted_histograms), "histogram-only false positive")
        repeated_distance_histograms += sum(v > 1 for v in seen.values())
        if n < 13:
            trees = {centroid_form(g): g for graph in trees.values() for g in extend(graph)}
    require(total == 2287, "incomplete unlabelled tree census")
    return total, certified, trivalent, repeated_distance_histograms


def subdivide(edges, lengths):
    n = len(edges) + 1
    graph = [[] for _ in range(n)]
    for (v, w), length in zip(edges, lengths):
        for _ in range(length - 1):
            graph.append([v])
            new = len(graph) - 1
            graph[v].append(new)
            v = new
        graph[v].append(w)
        graph[w].append(v)
    return graph


def reduced_tests():
    topologies = [
        [(0, 1), (0, 2), (0, 3)],
        [(0, 1), (0, 2), (0, 3), (0, 4)],
        [(0, 1), (0, 2), (0, 3), (3, 4), (3, 5)],
    ]
    count = passed = incomplete = 0
    for edges in topologies:
        trials = list(combinations_with_replacement(range(1, 8), len(edges)))
        # Moderate lengths with short relations furnish both passing and failing controls.
        trials.extend(tuple(23 + ((37*i + 53*j + 17*j*j) % 69) for j in range(len(edges)))
                      for i in range(20))
        for lengths in trials:
            graph = subdivide(edges, lengths)
            paths, support = measured_paths(graph)
            degrees = Counter(map(len, graph))
            k = len(graph) - degrees[2]
            expected_edges = sum(count * comb(d, 2) for d, count in degrees.items() if d != 2)
            found = path_certificate(support, k, expected_edges)
            if found:
                require(found == line_graph_of_suppression(graph), "incorrect labelled line graph")
                passed += 1
            else:
                incomplete += 1
            count += 1
    require(passed > 0 and incomplete > 0, "missing a positive or negative control")
    return count, passed



def all_reduced_topologies():
    """Use ternary edge weights so no path collisions or unintended sums can occur."""
    trees = {(): ((),)}
    tested = 0
    trivalent = 0
    for n in range(1, 14):
        for graph in trees.values():
            if n < 2 or any(len(row) == 2 for row in graph):
                continue
            edge_list = list(pairs(graph))
            weights = {pair: 3**i for i, pair in enumerate(edge_list)}
            support = set()
            for start in range(n):
                pending = [(start, -1, 0)]
                while pending:
                    v, parent, distance = pending.pop()
                    if v > start:
                        support.add(distance)
                    for w in graph[v]:
                        if w != parent:
                            length = weights[tuple(sorted((v, w)))]
                            pending.append((w, v, distance + length))
            count = sum(comb(len(row), 2) for row in graph)
            result = path_certificate(support, n, count)
            expected = {tuple(sorted((weights[p1], weights[p2]))) for p1, p2 in combinations(edge_list, 2)
                        if set(p1).intersection(p2)}
            require(result == (tuple(sorted(weights.values())), expected), "generic topology failed")
            tested += 1
            trivalent += all(len(row) <= 3 for row in graph)
        if n < 13:
            trees = {centroid_form(g): g for graph in trees.values() for g in extend(graph)}
    return tested, trivalent


if __name__ == "__main__":
    trees, certificates, trivalent, ambiguous = census()
    profiles, recovered = reduced_tests()
    cores, binary = all_reduced_topologies()
    print(f"{trees} unlabelled nontrivial trees through order 13: {certificates} certificates, "
          f"{trivalent} histogram-only certificates, {ambiguous} nonsingleton path-histogram classes")
    print(f"{profiles} literal subdivisions with {recovered} certified length-labelled core recoveries")
    print(f"{cores} nontrivial reduced topologies through 13 vertices, including {binary} trivalent or path cores")
