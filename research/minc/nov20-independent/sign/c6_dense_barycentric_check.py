#!/usr/bin/env python3
"""Exact diagnostics for the general comparison proof; no finite-case proof."""

from fractions import Fraction as Q


def permutation_matrix(permutation):
    n = len(permutation)
    assert sorted(permutation) == list(range(n))
    return [[Q(int(permutation[i] == j)) for j in range(n)] for i in range(n)]


def norm_squared(matrix):
    return sum(value * value for row in matrix for value in row)


def check_factorization(permutations, k):
    n = len(permutations)
    matrices = [permutation_matrix(p) for p in permutations]
    assert all(sum(m[i][j] for m in matrices) == 1
               for i in range(n) for j in range(n))
    a = [[sum(m[i][j] for m in matrices[:k]) for j in range(n)] for i in range(n)]
    r = n - k
    b = [[a[i][j] / k - Q(1, n) for j in range(n)] for i in range(n)]
    alpha = Q(n, r * (k + 1))
    assert norm_squared(b) == Q(r, k)
    increments = []
    for p in matrices[k:]:
        d = [[(p[i][j] - a[i][j] / k) / (k + 1)
              for j in range(n)] for i in range(n)]
        increments.append(d)
        endpoint = [[b[i][j] + d[i][j] for j in range(n)] for i in range(n)]
        assert all(sum(row) == 0 for row in d)
        assert all(sum(d[i][j] for i in range(n)) == 0 for j in range(n))
        assert norm_squared(d) == Q(n, k * (k + 1)) == alpha * norm_squared(b)
        assert norm_squared(endpoint) == Q(r - 1, k + 1)
    mean = [[sum(d[i][j] for d in increments) / r for j in range(n)]
            for i in range(n)]
    assert all(mean[i][j] == -alpha * b[i][j]
               for i in range(n) for j in range(n))
    c_n = Q(n, n - 1)
    lower, upper = c_n - Q(13, 50), c_n + Q(13, 50)
    assert lower - upper / 2 >= Q(11, 100)


# Cyclic Latin factorizations, with all nontrivial degree choices.
for n in range(2, 10):
    permutations = [[(i + shift) % n for i in range(n)] for shift in range(n)]
    for k in range(1, n):
        check_factorization(permutations, k)

# The noncyclic Klein-four factorization gives a different exact input.
klein = [[i ^ shift for i in range(4)] for shift in range(4)]
for k in range(1, 4):
    check_factorization(klein, k)

# An intercalate trade changes two factors locally; disjointness is rechecked.
traded = [[(i + shift) % 6 for i in range(6)] for shift in range(6)]
for row in (0, 3):
    traded[0][row], traded[3][row] = traded[3][row], traded[0][row]
for k in range(1, 6):
    check_factorization(traded, k)

assert Q(1, 2000) ** 2 == Q(1, 4000000)
assert Q(1, 2) - Q(39, 100) == Q(11, 100)
print("Exact complementary-factorization moments passed.")
print("Endpoint norms and the rational Hessian margin passed.")
print("The sampled orders do not satisfy the dense hypothesis and are used only to check identities.")
