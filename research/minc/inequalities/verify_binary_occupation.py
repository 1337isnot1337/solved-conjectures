"""Exact direct checks for the binary occupation identities."""

from fractions import Fraction as F
from itertools import combinations_with_replacement, permutations
from math import comb, factorial, prod


def poisson_binomial(q):
    law = [F(1)]
    for probability in q:
        new = [F(0)] * (len(law) + 1)
        for k, mass in enumerate(law):
            new[k] += (1 - probability) * mass
            new[k + 1] += probability * mass
        law = new
    return law


def permanent(matrix):
    return sum(prod(matrix[i][j] for i, j in enumerate(perm))
               for perm in permutations(range(len(matrix))))


def check_single_vectors():
    count = 0
    for n in range(2, 11):
        for raw in combinations_with_replacement(range(5), n):
            total = sum(raw)
            if total % 4 or not 0 < total < 4 * n:
                continue
            m = total // 4
            p = F(m, n)
            q = [F(j, 4) for j in raw]
            law = poisson_binomial(q)
            pi = poisson_binomial([p] * n)
            density = [v / w for v, w in zip(law, pi)]
            assert density[:m + 1] == sorted(density[:m + 1])
            assert density[m:] == sorted(density[m:], reverse=True)
            count += 1
    return count


def check_pair(a, b):
    n = len(a)
    p = sum(a) / n
    assert sum(a) == sum(b) and sum(a).denominator == 1
    pi = poisson_binomial([p] * n)
    left = [w / z for w, z in zip(poisson_binomial(a), pi)]
    scale = F(factorial(n), n**n)
    # Recover the full polynomial coefficient vector by ordinary interpolation.
    values = []
    energies = []
    for j in range(n + 1):
        t = F(j, n)
        bt = [p + t * (v - p) for v in b]
        matrix = [[(1 + (u - p) * (v - p) / (p * (1-p))) / n for v in bt] for u in a]
        right = [w / z for w, z in zip(poisson_binomial(bt), pi)]
        expected = sum(x * y * w for x, y, w in zip(left, right, pi))
        assert permanent(matrix) == scale * expected
        values.append(expected)
        energies.append(sum(pi[k] * (n-k) * p * (left[k+1]-left[k]) * (right[k+1]-right[k]) for k in range(n)))
    differences = [values]
    while len(differences[-1]) > 1:
        row = differences[-1]
        differences.append([v-u for u, v in zip(row, row[1:])])
    for j, energy in enumerate(energies):
        # If x=nt, then t*d/dt equals x*d/dx at x=j.
        derivative = F(0)
        for degree, row in enumerate(differences[1:], 1):
            terms = sum(prod(j-r for r in range(degree) if r != skipped) for skipped in range(degree))
            derivative += row[0] * terms / factorial(degree)
        assert energy == j * derivative and energy >= 0
    return n + 1


if __name__ == '__main__':
    singles = check_single_vectors()
    pairs = [([0, 1, 2, 3, 4], [1, 1, 2, 3, 3], 5),
             ([0, 1, 2, 3, 4, 5], [0, 1, 3, 3, 4, 4], 5),
             ([0, 0, 0, 4, 4, 4], [0, 1, 2, 2, 3, 4], 4),
             ([0, 0, 1, 2, 2], [0, 0, 0, 1, 4], 5)]
    checks = sum(check_pair([F(i, d) for i in a], [F(i, d) for i in b]) for a, b, d in pairs)
    print(f'{singles} density profiles and {checks} direct permanents and Dirichlet identities agree')
