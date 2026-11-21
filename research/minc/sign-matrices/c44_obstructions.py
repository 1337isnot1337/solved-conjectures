"""Exact auxiliary counterexamples for the zero-diagonal minimum project.

These are not counterexamples to Minc Conjecture 44.  They falsify stronger
intermediate statements that would otherwise be tempting proof shortcuts.
Only Python's standard library is used.
"""

from collections import defaultdict
from fractions import Fraction as F
from itertools import permutations
from math import prod


def permanent(a):
    return sum(prod(a[i][p[i]] for i in range(len(a)))
               for p in permutations(range(len(a))))


def minor(a, i, j):
    return [[v for c, v in enumerate(row) if c != j]
            for r, row in enumerate(a) if r != i]


def factors(n):
    answer = defaultdict(int)
    p = 2
    while p * p <= n:
        while n % p == 0:
            answer[p] += 1
            n //= p
        p += 1
    if n > 1:
        answer[n] += 1
    return answer


def check_doubly_stochastic_zero_diagonal(a):
    n = len(a)
    assert all(a[i][i] == 0 for i in range(n))
    assert all(sum(row) == 1 for row in a)
    assert all(sum(a[i][j] for i in range(n)) == 1 for j in range(n))
    assert all(x >= 0 for row in a for x in row)


def transpose_averaging():
    a = [[F(v, 2) for v in row] for row in
         [[0, 1, 1, 0], [1, 0, 0, 1],
          [0, 1, 0, 1], [1, 0, 1, 0]]]
    b = [[(a[i][j] + a[j][i]) / 2 for j in range(4)] for i in range(4)]
    check_doubly_stochastic_zero_diagonal(a)
    check_doubly_stochastic_zero_diagonal(b)
    assert permanent(a) == F(1, 8)
    assert permanent(b) == F(9, 64)
    print('transpose averaging:', permanent(a), '->', permanent(b))


def principal_cofactors():
    # Construction supplied by the combinatorial agent; independently checked.
    t = F(1, 10)
    a, b = (1 - t) / 2, t / 3
    mat = [[F(0) if i == j else a if i // 3 == j // 3 else b
            for j in range(6)] for i in range(6)]
    check_doubly_stochastic_zero_diagonal(mat)
    p = permanent(mat)
    cof = [permanent(minor(mat, i, i)) for i in range(6)]
    assert p == F(4787641, 129600000)
    assert all(q == F(185959, 4800000) for q in cof)
    assert cof[0] - p == F(58313, 32400000) > 0
    print('principal cofactor minus permanent:', cof[0] - p)


def conjugation_entropy():
    b = [[0, 1, 2, 2], [2, 0, 1, 2],
         [2, 2, 0, 1], [1, 4, 1, 0]]
    z = permanent(b)
    c = [[permanent(minor(b, i, j)) for j in range(4)] for i in range(4)]
    n = [[b[i][j] * c[i][j] for j in range(4)] for i in range(4)]
    assert z == 91
    assert n == [[0, 7, 56, 28], [26, 0, 21, 44],
                 [52, 20, 0, 19], [13, 64, 14, 0]]
    p = [[F(x, z) for x in row] for row in n]
    check_doubly_stochastic_zero_diagonal(p)
    perm = [2, 1, 0, 3]
    delta = [[n[perm[i]][perm[j]] - n[i][j]
              for j in range(4)] for i in range(4)]
    exponents = defaultdict(int)
    for i in range(4):
        for j in range(4):
            if i != j:
                for prime, exponent in factors(c[i][j]).items():
                    exponents[prime] += delta[i][j] * exponent
    exponents = {p: e for p, e in exponents.items() if e}
    assert exponents == {7: 4, 2: -27, 3: 5, 5: -13, 19: 9}
    numerator = prod(p ** e for p, e in exponents.items() if e > 0)
    denominator = prod(p ** -e for p, e in exponents.items() if e < 0)
    assert numerator == 188269878455273097
    assert denominator == 163840000000000000
    assert numerator > denominator
    print('entropy derivative = -log(%s/%s)/91 < 0' % (numerator, denominator))


if __name__ == '__main__':
    transpose_averaging()
    principal_cofactors()
    conjugation_entropy()
