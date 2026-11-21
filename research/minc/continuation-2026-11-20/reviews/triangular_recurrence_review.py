"""Independent exact review of the nonextendable triangular seed.

Ryser inclusion-exclusion is independent of the author's subset recurrence.
The two-step reset is also checked on the entire replacement hierarchy.
"""

from fractions import Fraction as F
from itertools import product
from math import prod


def permanent(a):
    n = len(a)
    total = 0
    for mask in range(1 << n):
        row_sums = (sum(row[j] for j in range(n) if mask >> j & 1) for row in a)
        total += (-1) ** (n - mask.bit_count()) * prod(row_sums)
    return total


def determinant(a):
    a = [[F(x) for x in row] for row in a]
    result = F(1)
    for i in range(len(a)):
        pivot = next((j for j in range(i, len(a)) if a[j][i]), None)
        if pivot is None:
            return F(0)
        if pivot != i:
            a[i], a[pivot] = a[pivot], a[i]
            result = -result
        x = a[i][i]
        result *= x
        for j in range(i + 1, len(a)):
            multiple = a[j][i] / x
            for k in range(i, len(a)):
                a[j][k] -= multiple * a[i][k]
    return result


def border(b):
    return [[1] * (len(b) + 1)] + [[1] + [1 - 2 * x for x in row] for row in b]


def append(b, signs):
    return [row + [0] for row in b] + [[(1 - x) // 2 for x in signs] + [1]]


def replacements(a):
    n = len(a) - 1
    return [permanent([[1 if j and mask >> (j - 1) & 1 else x
                        for j, x in enumerate(row)] for row in a])
            for mask in range(1 << n)]


def seed_check():
    b = [
        [1,0,0,0,0,0,0,0],
        [1,1,0,0,0,0,0,0],
        [1,1,1,0,0,0,0,0],
        [1,1,0,1,0,0,0,0],
        [1,0,1,0,1,0,0,0],
        [1,0,1,1,0,1,0,0],
        [0,1,1,1,0,0,1,0],
        [1,1,0,1,0,0,1,1],
    ]
    a = border(b)
    assert permanent(a) == determinant(a) == 256
    C = [permanent([[1 if k == j else x for k, x in enumerate(row)] for row in a])
         for j in range(1, 9)]
    assert C == [64 * x for x in (8,22,68,14,0,5,-11,8)]
    assert all(abs(sum(x * y for x, y in zip(C, w))) != 512
               for w in product((-1,1), repeat=8))
    known = [[-1 if j - i in (1,2,3,4,5,8,9) else 1
              for j in range(10)] for i in range(10)]
    assert abs(permanent(known)) == abs(determinant(known)) == 512
    print("PASS: independent Ryser values, rational determinant, and the complete signed-sum obstruction.")
    print("PASS: published order-ten existence witness has absolute permanent and determinant 512.")


def reset_hierarchy_check():
    b = [[1,0,0], [1,1,0], [0,1,1]]
    n = len(b)
    P = replacements(border(b))
    for w in product((-1,1), repeat=n):
        enlarged = append(append(b, w), tuple(-x for x in w) + (1,))
        values = replacements(border(enlarged))
        for mask in range(1 << n):
            k = mask.bit_count()
            remaining = [j for j in range(n) if not mask >> j & 1]
            linear = sum(w[j] * P[mask | (1 << j)] for j in remaining)
            quadratic = sum(w[j] * w[l] * P[mask | (1 << j) | (1 << l)]
                            for j in remaining for l in remaining if j < l)
            proposed = [
                (k*k + k + 2) * P[mask] - 2 * quadratic,
                (k+1) * (k+2) * P[mask] - 2 * linear - 2 * quadratic,
                (k+1) * (k+2) * P[mask] + 2 * linear - 2 * quadratic,
                (k+2) * (k+3) * P[mask] - 2 * quadratic,
            ]
            actual = [values[mask], values[mask | (1 << n)],
                      values[mask | (1 << (n+1))],
                      values[mask | (1 << n) | (1 << (n+1))]]
            assert proposed == actual
    print("PASS: the full two-step reset hierarchy matches independent direct permanents.")


if __name__ == "__main__":
    seed_check()
    reset_hierarchy_check()
