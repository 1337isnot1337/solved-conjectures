"""Exact finite controls for diameter-neighbor and reflected-partner arguments."""

from fractions import Fraction
from itertools import combinations, product


def require(condition, message):
    if not condition:
        raise ValueError(message)


def squared_distance(a, b):
    return (a[0] - b[0])**2 + (a[1] - b[1])**2


def cross(a, b):
    return a[0] * b[1] - a[1] * b[0]


def diameter_graph(subset, distances):
    vertices = list(subset)
    edges = list(combinations(vertices, 2))
    diameter = max(distances[edge] for edge in edges)
    graph = {vertex: set() for vertex in vertices}
    for a, b in edges:
        if distances[a, b] == diameter:
            graph[a].add(b)
            graph[b].add(a)
    return {v: neighbors for v, neighbors in graph.items() if neighbors}


def middle_neighbor(origin, neighbors, points):
    vectors = {v: (points[v][0]-points[origin][0], points[v][1]-points[origin][1]) for v in neighbors}
    for mid in neighbors:
        first, last = (v for v in neighbors if v != mid)
        a, b, c = vectors[first], vectors[mid], vectors[last]
        denominator = cross(a, c)
        if denominator < 0:
            a, c = c, a
            denominator = -denominator
        alpha = cross(b, c)
        beta = cross(a, b)
        if alpha > 0 and beta > 0:
            require(alpha + beta > denominator, "missing strict radial expansion")
            return mid
    raise ValueError("no middle direction")


def check_subsets(points, distances):
    subset_count = 0
    middle_count = 0
    cycle_count = 0
    for size in range(2, len(points) + 1):
        for subset in combinations(range(len(points)), size):
            graph = diameter_graph(subset, distances)
            degrees = [len(neighbors) for neighbors in graph.values()]
            if min(degrees) >= 2:
                require(max(degrees) == 2, "minimum degree two with a branching diameter endpoint")
                cycle_count += 1
            for point, neighbors in graph.items():
                for triple in combinations(sorted(neighbors), 3):
                    if points[point] is None:
                        require(any(len(graph[v]) == 1 for v in triple), "three diameter neighbors lack a leaf")
                    else:
                        mid = middle_neighbor(point, triple, points)
                        require(graph[mid] == {point}, "middle neighbor has a second partner")
                    middle_count += 1
            subset_count += 1
    return subset_count, middle_count, cycle_count


def coordinate_check(points):
    distances = {(i, j): squared_distance(points[i], points[j]) for i, j in combinations(range(len(points)), 2)}
    return check_subsets(points, distances)


def check_regular_polygon(n):
    # Chord length increases strictly with the shorter cyclic step in a regular polygon.
    distances = {(i, j): min(j-i, n-(j-i)) for i, j in combinations(range(n), 2)}
    return check_subsets([None]*n, distances)


def check_weighted_rings():
    # In an odd regular pentagon the other point on the circle from i through j is 2i-j.
    eligible = 0
    for masses in product(range(1, 5), repeat=5):
        for child in range(5):
            if any(masses[child] > 2*masses[(2*pin-child) % 5] for pin in range(5) if pin != child):
                continue
            companions = sorted((j for j in range(5) if j != child), key=lambda j: masses[j], reverse=True)
            heavy = set()
            tail = sum(masses[j] for j in companions)
            for j in companions:
                if 2*tail < masses[child]:
                    break
                heavy.add(j)
                tail -= masses[j]
            for pin in range(5):
                if pin != child:
                    require((2*pin-child) % 5 in heavy, "finite companion set missed a required pin")
            eligible += 1
    return eligible


def check_line_reflections():
    sites = [(i, j) for i in range(-4, 5) for j in range(-3, 4)]
    distinct_pin_tests = 0
    for target in sites:
        reflected = (target[0], -target[1])
        extras = [k for k in sites if k != target and k != reflected]
        exceptional = set()
        for k in extras:
            pins = [x for x in range(-100, 101) if squared_distance((x, 0), target) == squared_distance((x, 0), k)]
            require(len(pins) <= 1, "nonmirror bisector accounts for two pins on one line")
            exceptional.update(pins)
        require(len(exceptional) <= len(extras), "too many exceptional line pins")
        for x in range(-100, 101):
            if x in exceptional:
                continue
            partners = [k for k in sites if k != target and squared_distance((x, 0), k) == squared_distance((x, 0), target)]
            expected = [] if target == reflected else [reflected]
            require(partners == expected, "unexpected persistent reflected partner")
            distinct_pin_tests += 1
    return distinct_pin_tests


def main():
    grid = [(x, y) for x in range(4) for y in range(4)]
    arc = [(Fraction(0), Fraction(0))]
    for t in [Fraction(-1, 4), Fraction(-1, 6), Fraction(-1, 8), Fraction(0),
              Fraction(1, 8), Fraction(1, 6), Fraction(1, 4)]:
        arc.append(((1-t*t)/(1+t*t), 2*t/(1+t*t)))
    models = [coordinate_check(grid), coordinate_check(arc)]
    models.extend(check_regular_polygon(n) for n in [3, 5, 7, 9])
    counts = [sum(values) for values in zip(*models, strict=True)]
    require(counts[1] > 0 and counts[2] > 0, "missing branching or degree-two geometry")
    print(f"{counts[0]} diameter graphs, {counts[1]} neighbor triples, {counts[2]} minimum-degree-two supports")
    print(f"{check_weighted_rings()} eligible weighted pentagon target checks")
    print(f"{check_line_reflections()} exact persistent-mirror tests on a line")


if __name__ == "__main__":
    main()
