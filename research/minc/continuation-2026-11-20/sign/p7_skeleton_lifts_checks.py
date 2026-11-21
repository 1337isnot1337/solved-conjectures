"""Exact checks for p7_skeleton_lifts.md; no conjecture resolution is claimed."""

from collections import defaultdict
from fractions import Fraction
from functools import lru_cache
from itertools import product
from math import factorial


def permanent(a):
    n = len(a)
    values = [0] * (1 << n)
    values[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        values[mask] = sum(a[i][j] * values[mask ^ (1 << j)]
                           for j in range(n) if mask & (1 << j))
    return values[-1]


def determinant(a):
    n = len(a)
    b = [[Fraction(x) for x in row] for row in a]
    result = Fraction(1)
    for j in range(n):
        pivot = next((i for i in range(j, n) if b[i][j]), None)
        if pivot is None:
            return Fraction(0)
        if pivot != j:
            b[pivot], b[j] = b[j], b[pivot]
            result = -result
        d = b[j][j]
        result *= d
        for i in range(j + 1, n):
            multiplier = b[i][j] / d
            for k in range(j + 1, n):
                b[i][k] -= multiplier * b[j][k]
    return result


@lru_cache(None)
def stirling(n, k):
    if n == 0:
        return int(k == 0)
    if k < 1 or k > n:
        return 0
    return k * stirling(n - 1, k) + stirling(n - 1, k - 1)


def partitions(n, minimum=1):
    if n == 0:
        yield ()
    for k in range(minimum, n + 1):
        for tail in partitions(n - k, k):
            yield (k,) + tail


def convolve(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def expanded_matrix(c, multiplicities):
    slots = [(i, local) for i, m in enumerate(multiplicities) for local in range(m)]
    return [[c[i][j] if i != j else (-1 if a >= b else 1)
             for j, b in slots] for i, a in slots]


def repeated_matrix(c, multiplicities):
    indices = [i for i, m in enumerate(multiplicities) for _ in range(m)]
    return [[c[i][j] for j in indices] for i in indices]


def stirling_permanent(c, multiplicities):
    total = 0
    for ks in product(*(range(1, m + 1) for m in multiplicities)):
        weight = 1
        for m, k in zip(multiplicities, ks):
            weight *= 2**(m - k) * stirling(m, k)
        total += weight * permanent(repeated_matrix(c, ks))
    return total


def rook_permanent(multiplicities):
    n = sum(multiplicities)
    rook = [1]
    for m in multiplicities:
        rook = convolve(rook, [stirling(m + 1, m + 1 - k) for k in range(m + 1)])
    return sum((-2)**k * factorial(n - k) * value for k, value in enumerate(rook))


def check_partition_obstruction():
    expected = {
        1: [-124],
        2: [-107, -26, 73, 124],
        3: [-107, -77, -60, 21, 25, 72, 90],
        4: [-60, -22, 21, 78, 90, 107],
        5: [-52, -43, 113, 131, 238],
        6: [-95, 160, 310],
        7: [182, 411],
        8: [553],
        9: [766],
    }
    observed = defaultdict(list)
    all_partitions = list(partitions(9))
    assert len(all_partitions) == 30
    for ms in all_partitions:
        s = len(ms)
        c = [[-1 if i == j else 1 for j in range(s)] for i in range(s)]
        a = expanded_matrix(c, ms)
        p = permanent(a)
        d = determinant(a)
        assert p == rook_permanent(ms)
        assert d == (-2)**8 * (s - 2)
        assert p % 64 == 0
        observed[s].append(p // 64)
        assert d == 0 or abs(p) != abs(d)
    assert {s: sorted(values) for s, values in observed.items()} == expected
    offsets = {0, 1, 2, 6, 7}
    known = [[-1 if j - i in offsets else 1 for j in range(9)] for i in range(9)]
    assert abs(permanent(known)) == abs(determinant(known)) == 256


def check_skeleton_formulas():
    skeletons = [
        [[-1]],
        [[-1, 1], [-1, -1]],
        [[-1, 1, -1], [-1, -1, 1], [1, -1, -1]],
        [[-1, 1, -1, 1], [1, -1, -1, -1], [-1, 1, -1, 1], [1, 1, -1, -1]],
    ]
    for c in skeletons:
        s = len(c)
        cases = {(1,) * s, (2,) + (1,) * (s - 1), (3,) + (1,) * (s - 1)}
        if s > 1:
            cases.add((2, 2) + (1,) * (s - 2))
        for ms in cases:
            a = expanded_matrix(c, ms)
            assert permanent(a) == stirling_permanent(c, ms)
            assert determinant(a) == (-2)**(sum(ms) - s) * determinant(c)
        for i in range(s):
            ms = [1] * s
            ms[i] = 2
            p = permanent(c)
            p_i = permanent(repeated_matrix(c, ms))
            assert permanent(expanded_matrix(c, ms)) == 2 * p + p_i


if __name__ == "__main__":
    check_partition_obstruction()
    check_skeleton_formulas()
    print("All 30 order-nine partitions and known admissibility certificate checked.")
    print("Skeleton determinant, Stirling formula, and doubling identity checked exactly.")
