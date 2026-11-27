"""Replay the hard-core score and conditional star identities on finite graphs."""
from decimal import Decimal, localcontext
from itertools import combinations


def adjacency(order, edges):
    neighbors = [0] * order
    for u, v in edges:
        neighbors[u] |= 1 << v
        neighbors[v] |= 1 << u
    return neighbors


def test_graphs():
    for n in range(1, 6):
        pairs = list(combinations(range(n), 2))
        for mask in range(1 << len(pairs)):
            edges = [edge for j, edge in enumerate(pairs) if mask & (1 << j)]
            graph = adjacency(n, edges)
            if all(not (graph[u] & graph[v]) for u, v in edges):
                yield graph
    # A star with isolated vertices, an unbalanced biclique, an odd cycle, Petersen.
    yield adjacency(10, [(0, v) for v in range(1, 8)])
    yield adjacency(10, [(u, v) for u in range(3) for v in range(3, 10)])
    yield adjacency(9, [(v, (v+1) % 9) for v in range(9)])
    yield adjacency(10, [(v, (v+1) % 5) for v in range(5)] +
                    [(v, v+5) for v in range(5)] +
                    [(v+5, (v+2) % 5 + 5) for v in range(5)])


def independent_configurations(graph):
    n = len(graph)
    for mask in range(1 << n):
        if any(mask & (1 << v) and mask & neighbors for v, neighbors in enumerate(graph)):
            continue
        uncovered = sum(1 << v for v, neighbors in enumerate(graph) if not mask & neighbors)
        oriented = sum((neighbors & uncovered).bit_count() for v, neighbors in enumerate(graph)
                       if uncovered & (1 << v))
        yield mask, uncovered.bit_count(), oriented


def check(graph, configs, a, b):
    n = len(graph)
    weights = [a**k * b**(n-k) for k in range(n+1)]
    z = first = second = score = size_score = squared_score = joint = 0
    exterior_laws = [{} for _ in graph]
    for mask, clear, ordered_pairs in configs:
        k = mask.bit_count()
        weight = weights[k]
        scaled_score = (a+b)*k - a*clear
        z += weight
        first += weight*k
        second += weight*k*k
        score += weight*scaled_score
        size_score += weight*k*scaled_score
        squared_score += weight*scaled_score**2
        joint += weight*ordered_pairs
        for v, neighbors in enumerate(graph):
            exterior = mask & ~(neighbors | (1 << v))
            counts = exterior_laws[v].setdefault(exterior, [0, 0])
            counts[0] += weight
            if mask & (1 << v):
                counts[1] += weight
    assert score == 0 and size_score == b*first
    assert squared_score == b*(a+b)*first + a*a*joint

    available_occupied = 0
    for v, law in enumerate(exterior_laws):
        for exterior, (total, occupied) in law.items():
            available = sum(1 for u, neighbors in enumerate(graph)
                            if graph[v] & (1 << u) and not exterior & neighbors)
            numerator = a*b**available
            denominator = numerator + b*(a+b)**available
            assert occupied*denominator == total*numerator
            available_occupied += available*occupied
    assert a*joint == b*available_occupied

    # Transcendental checks supplement the exact integer identities above.
    with localcontext() as ctx:
        ctx.prec = 60
        t = Decimal(a)/b
        alpha = Decimal(first)/(n*z)
        variance = Decimal(second*z - first**2)/(n*z*z)
        variance_floor = alpha/(1+t+t/(1+t).ln()*(t*(1-alpha)/alpha).ln())
        energy = (Decimal(z).ln() - n*Decimal(b).ln())/n
        energy_ceiling = (1+t)/(2+t)*alpha*(2+(t/alpha).ln())
        tol = Decimal('1e-55')
        assert variance + tol >= variance_floor
        assert energy <= energy_ceiling + tol


def main():
    count = 0
    for graph in test_graphs():
        configs = list(independent_configurations(graph))
        for a, b in [(1, 32), (1, 4), (1, 1), (2, 1)]:
            check(graph, configs, a, b)
        count += 1
    print(f"{count} triangle-free labelled graphs at four fugacities ({count*4} cases).")
    print("Exact score, variance-of-score and conditional star identities passed.")
    print("Variance lower bound and free-energy upper bound passed at 60 digits.")


if __name__ == "__main__":
    main()
