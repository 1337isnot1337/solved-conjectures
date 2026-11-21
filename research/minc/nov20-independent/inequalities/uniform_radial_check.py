#!/usr/bin/env python3
"""Exact diagnostics for uniform_radial_permanent.md; not a proof by testing."""
from fractions import Fraction as Q
from itertools import combinations, permutations, product
from math import factorial


def permanent(matrix):
    n = len(matrix)
    return sum(
        product_value(matrix[i][p[i]] for i in range(n))
        for p in permutations(range(n))
    )


def product_value(values):
    result = 1
    for value in values:
        result *= value
    return result


def sigma(matrix, k):
    n = len(matrix)
    return sum(
        permanent([[matrix[i][j] for j in cols] for i in rows])
        for rows in combinations(range(n), k)
        for cols in combinations(range(n), k)
    )


def centered_integer_matrix(n):
    raw = [[((i + 2) * (j + 3) + i * i - 3 * j) % 9 - 4
            for j in range(n)] for i in range(n)]
    row = [sum(values) for values in raw]
    col = [sum(raw[i][j] for i in range(n)) for j in range(n)]
    total = sum(row)
    matrix = [[n * n * raw[i][j] - n * row[i] - n * col[j] + total
               for j in range(n)] for i in range(n)]
    assert all(sum(values) == 0 for values in matrix)
    assert all(sum(matrix[i][j] for i in range(n)) == 0 for j in range(n))
    return matrix


def partitions(items):
    if not items:
        yield ()
        return
    first, *rest = items
    for partition in partitions(rest):
        yield ((first,),) + partition
        for position, block in enumerate(partition):
            yield partition[:position] + ((first,) + block,) + partition[position + 1:]


def mobius(partition):
    return product_value((-1) ** (len(block) - 1) * factorial(len(block) - 1)
                         for block in partition)


def partition_contraction(matrix, row_partition, col_partition):
    n = len(matrix)
    k = sum(map(len, row_partition))
    row_block = {edge: index for index, block in enumerate(row_partition) for edge in block}
    col_block = {edge: index for index, block in enumerate(col_partition) for edge in block}
    return sum(
        product_value(matrix[rows[row_block[edge]]][cols[col_block[edge]]]
                      for edge in range(k))
        for rows in product(range(n), repeat=len(row_partition))
        for cols in product(range(n), repeat=len(col_partition))
    )


def partition_sigma(matrix, k):
    allowed = [p for p in partitions(list(range(k))) if all(len(b) >= 2 for b in p)]
    numerator = sum(
        mobius(p) * mobius(q) * partition_contraction(matrix, p, q)
        for p in allowed for q in allowed
    )
    return Q(numerator, factorial(k))


for n in range(3, 6):
    b = centered_integer_matrix(n)
    norm_squared = sum(value * value for row in b for value in row)
    cube_sum = sum(value ** 3 for row in b for value in row)
    assert sigma(b, 2) == Q(norm_squared, 2)
    assert sigma(b, 3) == Q(2, 3) * cube_sum
    for k in range(2, min(n, 4) + 1):
        assert sigma(b, k) == partition_sigma(b, k)
    print(f"order {n}: exact cubic and partition-normalization identities passed")

delta = Q(1, 1000)
assert Q(3, 2) * 3**5 * delta == Q(729, 2000) < Q(3, 8)
assert Q(3, 1000) * Q(60**3, 59**2) == Q(648, 3481) < Q(1, 5)
assert Q(5, 4) * 96 * 3**6 * delta**2 == Q(2187, 25000) < Q(9, 100)

q = Q(3, 5)
m = 61
bracket = Q(m * m) / (1 - q) + Q(2 * m) * q / (1 - q)**2 + q * (1 + q) / (1 - q)**3
assert bracket == 9775
tail = Q(9, 2) / delta**2 * q**m * bracket
assert tail < Q(1, 500)
total = Q(3, 8) + Q(9, 100) + Q(1, 500)
assert total == Q(467, 1000) < Q(15, 32)
assert 1 - 2 * total > Q(1, 16)
print("all rational constants passed")
print("tail majorant =", tail)
print("coarse Hessian lower bound =", 1 - 2 * total)
print("No finite-order sampling is used as a proof of the stated theorems.")

# The tighter comparison in Section 4a uses e < 11/4.
e_upper = Q(11, 4)
delta_small = Q(1, 2000)
cubic_small = Q(3, 2) * e_upper**5 * delta_small
assert cubic_small == Q(483153, 4096000)
ratio_small = e_upper * delta_small * Q(60**3, 59**2)
assert ratio_small == Q(297, 3481) < Q(1, 10)
prefix_small = Q(10, 9) * 96 * e_upper**6 * delta_small**2
assert prefix_small == Q(1771561, 153600000)
q_small = 200 * e_upper * delta_small
assert q_small == Q(11, 40)
bracket_small = (Q(m*m)/(1-q_small) + Q(2*m)*q_small/(1-q_small)**2
                 + q_small*(1+q_small)/(1-q_small)**3)
tail_small = e_upper**2/(2*delta_small**2) * q_small**m * bracket_small
assert tail_small < Q(1, 10**6)
assert cubic_small + prefix_small + Q(1, 10**6) < Q(13, 100)
assert Q(13, 50) < Q(1, 3)
print("smaller-ball Hessian deviation < 13/50: exact constants passed")


