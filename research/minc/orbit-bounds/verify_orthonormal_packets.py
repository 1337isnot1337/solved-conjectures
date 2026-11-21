"""Exact checks for the random-arrow bound and orthonormal packet cases."""

from fractions import Fraction as F
from itertools import permutations, product
from math import prod
from random import Random


def permanent(a):
    terms = {0: 1}
    for row in a:
        nxt = {}
        for mask, total in terms.items():
            for j, value in enumerate(row):
                if value and not (mask >> j & 1):
                    key = mask | (1 << j)
                    nxt[key] = nxt.get(key, 0) + total * value
        terms = nxt
    return terms.get((1 << len(a)) - 1, 0)


def test_rows(a, equality=False):
    b = [row[:] for row in a]
    for i, row in enumerate(b):
        assert row[i] == 0
        row[i] = 1
    lhs = permanent(b) ** 2
    rhs = prod(1 + sum(row) ** 2 for row in a)
    assert lhs <= rhs
    if equality:
        assert lhs == rhs


def packet_test(a, packets):
    n = len(a)
    assert sorted(i for packet in packets for i in packet) == list(range(n))
    assert all(a[i][j] == int(i == j) for p in packets for i in p for j in p)
    g = [[abs(permanent([[a[i][j] for j in right] for i in left]))
          for right in packets] for left in packets]
    assert permanent(g) < permanent(a)
    if len(packets) > 1:
        assert any(g[i][j] for i in range(len(g)) for j in range(i))


def mixed_pairs(n, rng):
    # One top and one bottom vector per packet. Zero intra-packet edges.
    # The cross Gram is a contraction by the row and column norm bounds.
    cross = [[F(rng.choice((-2, -1, 1, 2)), 2*n) if i != j else 0
              for j in range(n)] for i in range(n)]
    return ([[int(i == j) for j in range(n)] + cross[i] for i in range(n)] +
            [[cross[j][i] for j in range(n)] + [int(i == j) for j in range(n)]
             for i in range(n)])


def color_example(q, k, m):
    # Each ambient coordinate has a separate copy in each of m packets.
    # The vectors are permuted among q colors so both partitions cross.
    assert m <= q
    n = m*k
    labels = [((i//k + i%k) % q, i%k) for i in range(n)]
    assert len(set(labels)) == n
    return [[int(labels[i][1] == labels[j][1]) for j in range(n)] for i in range(n)]


if __name__ == '__main__':
    rng = Random(412591)
    rows = 0
    for n in range(2, 5):
        for targets in product(*[tuple(j for j in range(n) if i != j) for i in range(n)]):
            test_rows([[F(i + 1, 2) * int(targets[i] == j) for j in range(n)]
                       for i in range(n)])
            rows += 1
    for n in range(2, 9):
        for _ in range(15):
            test_rows([[F(rng.randrange(5), 3) if i != j else 0 for j in range(n)]
                       for i in range(n)])
            rows += 1
    for order in permutations(range(4)):
        a = [[0]*4 for _ in range(4)]
        for left, right, weight in ((order[0], order[1], F(1,3)), (order[2], order[3], 2)):
            a[left][right] = a[right][left] = weight
        test_rows(a, equality=True)
        rows += 1
    grams = 0
    for n in range(2, 7):
        for _ in range(4):
            packet_test(mixed_pairs(n, rng), [(i, i+n) for i in range(n)])
            grams += 1
    for q, k, m in ((3,6,3), (4,6,4), (5,10,3)):
        packet_test(color_example(q, k, m), [range(i*k, (i+1)*k) for i in range(m)])
        grams += 1
    print(f'Passed {rows} row bounds and {grams} crossing-partition Gram comparisons.')
