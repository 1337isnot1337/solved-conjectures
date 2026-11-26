"""Exact tests of the two earlier preorder identities, built from the definitions."""
from fractions import Fraction
from itertools import combinations, product
from math import prod


def preorders(n):
    off_diagonal = [(i, j) for i in range(n) for j in range(n) if i != j]
    diagonals = {(i, i) for i in range(n)}
    for flags in product((False, True), repeat=len(off_diagonal)):
        relation = diagonals | {edge for edge, present in zip(off_diagonal, flags) if present}
        if all((i, k) in relation for i, j in relation for k in range(n) if (j, k) in relation):
            yield relation


def point_set(n, relation):
    ideals = []
    for length in range(1, n + 1):
        for subset in combinations(range(n), length):
            if all(i in subset for i, j in relation if j in subset):
                ideals.append(subset)
    points = [p for p in product(range(n + 1), repeat=n) if sum(p) <= n
              and all(sum(p[i] for i in ideal) <= len(ideal) for ideal in ideals)]
    points.sort(key=sum)
    return points


def interpolate(nodes, values, argument):
    return sum(y * prod(Fraction(argument - b, a - b) for b in nodes if a != b)
               for a, y in zip(nodes, values))


def check(n, relation):
    points = point_set(n, relation)
    below = [[i for i, p in enumerate(points[:j + 1])
              if all(x <= y for x, y in zip(p, upper))] for j, upper in enumerate(points)]
    maximal = set(range(len(points))) - {i for row in below for i in row[:-1]}
    # Direct chain counting, evaluated at positive lengths and interpolated at m=-1.
    for q in (2, 3):
        nodes = [Fraction(q**m - 1, q - 1) for m in range(2, n + 3)]
        weights = [q**sum(p) for p in points]
        counts = weights.copy()
        values = []
        for _ in nodes:
            values.append(sum(counts))
            counts = [w * sum(counts[i] for i in row) for w, row in zip(weights, below)]
        expectation = (-1)**n * sum(Fraction(1, q**sum(x > 0 for x in points[j]))
                                      for j in maximal)
        assert interpolate(nodes, values, Fraction(-1, q)) == expectation

    # The Boolean-cube specialization tests all coefficients of the multiaffine lift.
    for bits in product((0, 1), repeat=n):
        def coordinate(a, t):
            return (1, -(1 + t), t)[a] if a < 3 else 0
        lhs = sum(prod(coordinate(a, t) for a, t in zip(p, bits)) for p in points)
        rhs = (-1)**n * sum(prod(t for a, t in zip(points[j], bits) if a) for j in maximal)
        assert lhs == rhs

    # Möbius inversion by its recursion, before transmuting the original M-triangle.
    mobius = {}
    coefficients = {}
    for upper, lower in enumerate(below):
        for i in lower:
            mu = 1 if i == upper else -sum(mobius.get((i, k), 0) for k in lower[:-1])
            mobius[i, upper] = mu
            key = (sum(points[i]), sum(points[upper]))
            coefficients[key] = coefficients.get(key, 0) + mu

    def transmuted(x, y):
        u, v = (1 - y) / (1 - x * y), 1 - x * y
        return sum(c * u**i * v**j for (i, j), c in coefficients.items())
    for x, y in [(Fraction(2), Fraction(3)), (Fraction(-1), Fraction(2)),
                 (Fraction(4, 3), Fraction(3, 5))]:
        assert transmuted(y, x) == (x * y)**n * transmuted(1 / x, 1 / y)


if __name__ == "__main__":
    counts = []
    for n in range(5):
        count = 0
        for relation in preorders(n):
            check(n, relation)
            count += 1
        counts.append(count)
    assert counts == [1, 1, 4, 29, 355]
    print("Passed the q-zeta, multiaffine and transmuted M comparisons for all "
          f"{sum(counts)} labelled preorders of sizes zero through four: {counts}.")
