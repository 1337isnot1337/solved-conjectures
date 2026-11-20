"""Exact small-matrix routines used only by the finite checks."""

from itertools import combinations

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


