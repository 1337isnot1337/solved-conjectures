"""Exact coefficient and Bernoulli derivative checks for the prime-order theorem."""

from fractions import Fraction as Q
from itertools import combinations
from math import comb
from random import Random


def rook_coefficients(matrix):
    n = len(matrix)
    ways = [0] * (1 << n)
    ways[0] = 1
    for row in matrix:
        new = ways.copy()
        for used, value in enumerate(ways):
            for j, entry in enumerate(row):
                if not (used >> j) & 1:
                    new[used | (1 << j)] += value * entry
        ways = new
    sums = [0] * (n + 1)
    for mask, value in enumerate(ways):
        sums[mask.bit_count()] += value
    return sums


def check_coefficients():
    random = Random(6172)
    checked = 0
    for n in range(5, 10):
        for k in range(2, n - 1):
            edges = {(i, (i+j) % n) for i in range(n) for j in range(k)}
            original = None
            for iteration in range(12):
                b = [[n * ((i, j) in edges) - k for j in range(n)] for i in range(n)]
                t4 = sum(sum(x*y for x, y in zip(row, other))**2 for row in b for other in b)
                sigma = rook_coefficients(b)
                if original is None:
                    original = sigma, t4
                reference, old_t4 = original
                assert sigma[:4] == reference[:4]
                assert 4*(sigma[4] - reference[4]) == t4-old_t4
                assert sigma[5] - reference[5] == 2*(n-2*k)*(t4-old_t4)
                checked += 1
                for _ in range(20):
                    i, j = random.sample(range(n), 2)
                    a, c = random.sample(range(n), 2)
                    on, off = {(i, a), (j, c)}, {(i, c), (j, a)}
                    if on <= edges and edges.isdisjoint(off):
                        edges.difference_update(on)
                        edges.update(off)
    return checked


def check_bernoulli():
    n = 7
    outgoing = [{(i+j) % n for j in (0, 1, 3)} for i in range(n)]
    p = Q(2, 5)
    for j in range(n):
        incoming = {i for i in range(n) if j in outgoing[i]}
        other = sorted(set(range(n)) - {j})
        covariance = 0
        differences = 0

        def column_mass(active):
            return sum(Q(1, len(outgoing[i] & active)) for i in incoming & active)

        for mask in range(1 << (n-1)):
            active = {j} | {v for h, v in enumerate(other) if mask >> h & 1}
            count = len(active) - 1
            weight = p**count * (1-p)**(n-1-count)
            centered = len((incoming - {j}) & active) - (len(incoming)-1)*p
            covariance += weight * (column_mass(active)-1) * centered
            for ell in incoming - {j}:
                differences += weight * (column_mass(active | {ell}) - column_mass(active - {ell}))
        assert covariance == p*(1-p)*differences
        assert covariance > 0


def check_energy():
    count = 0
    for n in (3, 5, 7, 11, 13):
        for r in range(1, (n+1)//2):
            for elements in combinations(range(n), r):
                support = set(elements)
                counts = [sum((x-d) % n in support for x in support) for d in range(n)]
                assert 3*sum(c*c for c in counts) <= 2*r**3+r
                count += 1
        assert sum(comb(n, m) for m in range((n+1)//2)) == 2**(n-1)
    return count


if __name__ == "__main__":
    check_bernoulli()
    print(f"Checked 7 Bernoulli covariances, {check_coefficients()} coefficient arrays,"
          f" and {check_energy()} cyclic supports.")
