"""Independent graph-enumeration checks for the two-state transfer.

The small orders below test the implementation only. They make no new
finite-case claim about the Lih--Wang conjecture.
"""

from fractions import Fraction
from math import factorial, gcd
from jerrum_rook_transfer import graph_rooks, normalized_mixture


def graph_matrix(r, branches, length):
    h = r-1
    edge, marked, interior = h*h, (branches-1)*h, branches*(h-1)+1
    common = gcd(gcd(edge, marked), interior)
    edge, marked, interior = edge//common, marked//common, interior//common
    line_sum = branches*h*h//common
    n = branches*r*length+1
    matrix = [[0]*n for _ in range(n)]
    for branch in range(branches):
        starts = [1+(branch*length+block)*r for block in range(length)]
        for start in starts:
            for i in range(r):
                for j in range(r):
                    if i == j == 0:
                        continue
                    matrix[start+i][start+j] = marked if i == 0 or j == 0 else interior
        matrix[0][starts[0]] = edge
        for left, right in zip(starts, starts[1:]):
            matrix[left][right] = edge
        matrix[starts[-1]][0] = edge
    assert all(sum(row) == line_sum for row in matrix)
    assert all(sum(matrix[i][j] for i in range(n)) == line_sum for j in range(n))
    return matrix, line_sum


def enumerate_rooks(matrix):
    n = len(matrix)
    dp = [0]*(1 << n)
    dp[0] = 1
    for row in matrix:
        nxt = dp.copy()  # Leave this row unmatched.
        for mask, value in enumerate(dp):
            if value:
                for j, weight in enumerate(row):
                    if weight and not mask & (1 << j):
                        nxt[mask | (1 << j)] += value*weight
        dp = nxt
    rooks = [0]*(n+1)
    for mask, value in enumerate(dp):
        rooks[mask.bit_count()] += value
    return rooks


def permanent(matrix):
    n = len(matrix)
    dp = [0]*(1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        row = matrix[mask.bit_count()-1]
        dp[mask] = sum(row[j]*dp[mask ^ (1 << j)] for j in range(n) if mask & (1 << j))
    return dp[-1]


for parameters in ((2, 2, 1), (3, 3, 1), (2, 3, 2)):
    matrix, line_sum = graph_matrix(*parameters)
    rooks, transfer_line_sum, cofactor = graph_rooks(*parameters)
    n = len(matrix)
    assert line_sum == transfer_line_sum
    assert enumerate_rooks(matrix) == rooks
    assert permanent([row[1:] for row in matrix[1:]]) == cofactor
    t = Fraction(2, 5)
    mixture = [[Fraction(1-t, n)+t*Fraction(x, line_sum) for x in row] for row in matrix]
    exact = permanent(mixture)/Fraction(factorial(n), n**n)
    assert exact == normalized_mixture(rooks, line_sum, t)

print("Transfer coefficients, endpoint cofactor, and mixture normalization agree with independent exact enumeration.")
