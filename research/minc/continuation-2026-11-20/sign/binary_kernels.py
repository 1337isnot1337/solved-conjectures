"""Exact exploratory checks for binary-indexed sign matrices.

These calculations do not establish a new case or a uniform construction.
"""
from fractions import Fraction


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for s in range(1, 1 << n):
        row = a[s.bit_count() - 1]
        t = s
        value = 0
        while t:
            bit = t & -t
            value += row[bit.bit_length() - 1] * dp[s ^ bit]
            t -= bit
        dp[s] = value
    return dp[-1]


def determinant(a):
    b = [list(map(Fraction, row)) for row in a]
    sign = 1
    answer = Fraction(1)
    for k in range(len(b)):
        pivot = next((i for i in range(k, len(b)) if b[i][k]), None)
        if pivot is None:
            return 0
        if pivot != k:
            b[pivot], b[k] = b[k], b[pivot]
            sign = -sign
        x = b[k][k]
        answer *= x
        for i in range(k + 1, len(b)):
            q = b[i][k] / x
            for j in range(k + 1, len(b)):
                b[i][j] -= q * b[k][j]
    answer *= sign
    assert answer.denominator == 1
    return answer.numerator


def main():
    kernels = {
        "walsh": lambda i, j: ((i & j).bit_count() % 2),
        "subset": lambda i, j: ((i & j) == j),
        "disjoint": lambda i, j: ((i & j) == 0),
        "intersect": lambda i, j: ((i & j) != 0),
        "hascarry": lambda i, j: (((i + j) ^ i ^ j) != 0),
        "carryparity": lambda i, j: ((i.bit_count() + j.bit_count() - (i + j).bit_count()) % 2),
        "binomial": lambda i, j: j <= i and ((i & j) == j),
        "colex": lambda i, j: ((i ^ j) & (-(i ^ j))) & i != 0,
    }
    for name, kernel in kernels.items():
        for offset in (0, 1):
            values = []
            for n in range(1, 16):
                a = [[1 - 2 * bool(kernel(i + offset, j + offset)) for j in range(n)] for i in range(n)]
                p, d = permanent(a), determinant(a)
                minimum = 1 << (n - (n + 1).bit_length() + 1)
                values.append((n, p, d, abs(p) == minimum, p != 0 and abs(p) == abs(d)))
            print(name, offset, values, flush=True)


if __name__ == "__main__":
    main()
