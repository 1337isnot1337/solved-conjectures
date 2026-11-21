#!/usr/bin/env python3
"""Independent exact audit of the bordered P7 partition obstruction.

Uses this worker's permanent and determinant code, not the sign worker's
checker. No new existence order or conjecture solution is claimed.
"""

from collections import defaultdict
from math import factorial

from block_skeleton_review import determinant, partitions, permanent, polynomial_product, stirling


def border(b):
    return [[1] * (len(b) + 1)] + [[1] + [1 - 2 * x for x in row] for row in b]


def replacements(a):
    n = len(a) - 1
    return [permanent([[1 if j and mask >> (j - 1) & 1 else x
                        for j, x in enumerate(row)] for row in a])
            for mask in range(1 << n)]


def check_partitions():
    observed = defaultdict(set)
    count = 0
    for sizes in partitions(7):
        labels = [(i, j) for i, size in enumerate(sizes) for j in range(size)]
        b = [[int(i == j and row >= col) for j, col in labels] for i, row in labels]
        a = border(b)
        p = permanent(a)
        rook = [1]
        for size in sizes:
            rook = polynomial_product(rook, [stirling(size + 1, size + 1 - k)
                                              for k in range(size + 1)])
        assert p == sum((-2) ** k * factorial(8 - k) * v for k, v in enumerate(rook))
        assert determinant(a) == -128
        assert p % 32 == 0 and abs(p) != 128
        observed[len(sizes)].add(p // 32)
        count += 1
    assert count == 15
    assert dict(observed) == {1: {0}, 2: {0}, 3: {-30, 17, 24, 35},
                              4: {-43, 29, 72}, 5: {22, 101}, 6: {142}, 7: {213}}
    print('All 15 bordered order-eight partition matrices independently checked.')


def check_known_witness():
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
    p = replacements(a)
    assert [p[1 << i] for i in range(7)] == [128, 832, 896, 416, 288, 416, -32]
    print('Wanless order-eight witness, sign/permutation equivalence, and replacement values independently checked.')


def check_hierarchy():
    b = [[1, 0, 0], [0, 1, 0], [1, 1, 1]]
    n = len(b)
    p = replacements(border(b))
    for w in [(1, -1, -1), (-1, 1, -1)]:
        bigger = [row + [0] for row in b] + [[(1 - x) // 2 for x in w] + [1]]
        q = replacements(border(bigger))
        for mask in range(1 << n):
            extra = sum(w[j] * p[mask | 1 << j] for j in range(n) if not mask >> j & 1)
            assert q[mask] == mask.bit_count() * p[mask] + extra
            assert q[mask | 1 << n] == (mask.bit_count() + 2) * p[mask] + extra
    print('Replacement-column hierarchy independently checked for every subset in two distinct extensions.')


if __name__ == '__main__':
    check_partitions()
    check_known_witness()
    check_hierarchy()
    print('All independent bordered-construction checks passed.')
