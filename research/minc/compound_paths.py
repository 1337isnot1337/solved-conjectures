"""Exact finite checks for a path-count reduction, not a solution of Minc P18.

Run with Python 3.10 or later; the standard library is sufficient.
Every arithmetic operation used in the identity checks is on integers.
"""

from itertools import combinations
from math import factorial


def permanent(matrix):
    n = len(matrix)
    assert all(len(row) == n for row in matrix)
    values = [0] * (1 << n)
    values[0] = 1
    for mask in range(1, 1 << n):
        row = mask.bit_count() - 1
        bits = mask
        while bits:
            bit = bits & -bits
            column = bit.bit_length() - 1
            values[mask] += matrix[row][column] * values[mask ^ bit]
            bits ^= bit
    return values[-1]


def compound(matrix, k):
    subsets = list(combinations(range(len(matrix)), k))
    return [
        [permanent([[matrix[i][j] for j in columns] for i in rows])
         for columns in subsets]
        for rows in subsets
    ]


def walk_sum(matrix, k, steps):
    transfer = compound(matrix, k)
    vector = [1] * len(transfer)
    for _ in range(steps):
        vector = [sum(a * x for a, x in zip(row, vector))
                  for row in transfer]
    return sum(vector)


def layered_matrix(matrix, k, steps):
    n = len(matrix)
    vertex_count = n * (steps + 1)
    result = [[0] * (vertex_count + k)
              for _ in range(vertex_count + k)]
    for vertex in range(vertex_count):
        result[vertex][vertex] = 1
    for layer in range(steps):
        for i in range(n):
            for j in range(n):
                result[layer * n + i][(layer + 1) * n + j] = matrix[i][j]
    for source in range(k):
        for j in range(n):
            result[vertex_count + source][j] = 1
    for i in range(n):
        for sink in range(k):
            result[steps * n + i][vertex_count + sink] = 1
    return result


def verify():
    cases = [
        [[1, 2], [3, 4]],
        [[0, 2], [3, 0]],
        [[0, 1], [0, 0]],
        [[1, -2], [3, 0]],
        [[1, 1, 0], [0, 1, 2], [3, 0, 1]],
        [[0, 1, 0], [0, 0, 1], [0, 0, 0]],
        [[0, 1, 1], [1, 0, 1], [1, 1, 0]],
    ]
    checked = 0
    for case_number, matrix in enumerate(cases):
        n = len(matrix)
        for k in range(n + 1):
            for steps in range(3):
                paths = walk_sum(matrix, k, steps)
                larger = layered_matrix(matrix, k, steps)
                actual = permanent(larger)
                expected = factorial(k) ** 2 * paths
                assert actual == expected, (case_number, k, steps, actual, expected)
                checked += 1
    print(f"verified {checked} exact layered-permanent identities")
    print("No convergence-rate or general Perron-root algorithm is established.")


if __name__ == "__main__":
    verify()
