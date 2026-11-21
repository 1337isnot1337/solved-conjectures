"""Exact checks for bordered_partition_lifts.md. No conjecture is resolved."""

from collections import defaultdict
from fractions import Fraction
from functools import lru_cache
from itertools import combinations
from math import comb, factorial

from p7_skeleton_lifts_checks import convolve, determinant, partitions, permanent, stirling


def matrix(ms):
    slots = [(-1, 0)] + [(i, j) for i, m in enumerate(ms) for j in range(m)]
    return [[-1 if i >= 0 and i == j and a >= b else 1
             for j, b in slots] for i, a in slots]


def rook_permanent(ms):
    n = 1 + sum(ms)
    rook = [1]
    for m in ms:
        rook = convolve(rook, [stirling(m + 1, m + 1 - k) for k in range(m + 1)])
    return sum((-2)**k * factorial(n - k) * value for k, value in enumerate(rook))


@lru_cache(None)
def normalized_recurrence(ms):
    if not ms:
        return Fraction(1)
    value = Fraction(4)
    for i, m in enumerate(ms):
        for r in range(1, m + 1):
            reduced = list(ms)
            reduced[i] -= r
            reduced = tuple(sorted(v for v in reduced if v))
            value -= comb(m, r) * (2 + 2**r) * normalized_recurrence(reduced)
    for i, j in combinations(range(len(ms)), 2):
        for r in range(1, ms[i] + 1):
            for t in range(1, ms[j] + 1):
                reduced = list(ms)
                reduced[i] -= r
                reduced[j] -= t
                reduced = tuple(sorted(v for v in reduced if v))
                value -= (2 * comb(ms[i], r) * comb(ms[j], t)
                          * normalized_recurrence(reduced))
    return value / 4


def border(b):
    return [[1] * (len(b) + 1)] + [[1] + [1 - 2*x for x in row] for row in b]


def column_replacements(a):
    n = len(a) - 1
    return [permanent([[1 if j > 0 and mask >> (j-1) & 1 else x
                        for j, x in enumerate(row)] for row in a])
            for mask in range(1 << n)]


def check_partition_obstruction():
    expected = {1: {0}, 2: {0}, 3: {-30, 17, 24, 35},
                4: {-43, 29, 72}, 5: {22, 101}, 6: {142}, 7: {213}}
    observed = defaultdict(set)
    cases = list(partitions(7))
    assert len(cases) == 15
    for ms in cases:
        a = matrix(ms)
        p = rook_permanent(ms)
        assert p == permanent(a)
        assert determinant(a) == -128
        assert abs(p) != 128
        assert p % 32 == 0
        observed[len(ms)].add(p // 32)
    assert dict(observed) == expected
    for n in range(8):
        for ms in partitions(n):
            assert normalized_recurrence(ms) * (-2)**n == rook_permanent(ms)


def check_hierarchy():
    b = [[1, 0, 0, 0], [1, 1, 0, 0], [0, 1, 1, 0], [1, 0, 1, 1]]
    a = border(b)
    p = column_replacements(a)
    n = len(b)
    for w in [(1, -1, 1, -1), (-1, -1, 1, 1)]:
        enlarged_b = [row + [0] for row in b] + [[(1 - x)//2 for x in w] + [1]]
        enlarged_a = border(enlarged_b)
        q = column_replacements(enlarged_a)
        assert determinant(enlarged_a) == -2 * determinant(a)
        for mask in range(1 << n):
            term = sum(w[j] * p[mask | (1 << j)] for j in range(n)
                       if not mask >> j & 1)
            assert q[mask] == mask.bit_count() * p[mask] + term
            assert q[mask | (1 << n)] == (mask.bit_count() + 2) * p[mask] + term


def check_wider_family():
    offsets = {1, 4, 5, 6}
    t = [[-1 if j - i in offsets else 1 for j in range(8)] for i in range(8)]
    assert permanent(t) == determinant(t) == 128
    b = [[1,0,0,0,0,0,0], [1,1,0,0,0,0,0], [1,1,1,0,0,0,0],
         [1,1,0,1,0,0,0], [1,0,1,0,1,0,0], [1,0,1,1,0,1,0],
         [0,1,1,1,0,0,1]]
    a = border(b)
    rows = [3, 6, 7, 5, 4, 2, 1, 0]
    cols = [0, 4, 7, 6, 5, 3, 2, 1]
    assert a == [[t[i][j] * t[3][j] for j in cols] for i in rows]
    assert permanent(a) == 128 and determinant(a) == -128
    cofactors = [permanent([[1 if k == j else x for k,x in enumerate(row)]
                           for row in a]) for j in range(1, 8)]
    assert cofactors == [128, 832, 896, 416, 288, 416, -32]
    w = [-1, -1, 1, -1, 1, 1, -1]
    enlarged_b = [row + [0] for row in b] + [[(1-x)//2 for x in w] + [1]]
    enlarged_a = border(enlarged_b)
    assert permanent(enlarged_a) == sum(x*y for x,y in zip(w, cofactors)) == 256
    assert determinant(enlarged_a) == 256


if __name__ == '__main__':
    check_partition_obstruction()
    check_hierarchy()
    check_wider_family()
    print('All 15 partitions of seven checked by rook and direct formulas.')
    print('Normalized generating-function recurrence checked exactly.')
    print('Full replacement-column update hierarchy checked exactly.')
    print('Known order-eight witness and wider-family membership checked exactly.')
