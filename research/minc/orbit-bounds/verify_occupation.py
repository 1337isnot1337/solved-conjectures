"""Replay the permanent and occupation identities over the Gaussian rationals."""

from collections import defaultdict
from itertools import combinations
from math import factorial, prod
from sympy import QQ, QQ_I


zero, one = QQ_I.zero, QQ_I.one


def conj(z):
    return QQ_I.dtype(z.x, -z.y)


def norm(z):
    return z.x**2 + z.y**2


def permanent(matrix):
    rows = len(matrix)
    dp = {0: one}
    for row in matrix:
        values = defaultdict(lambda: zero)
        for subset, weight in dp.items():
            for j in range(rows):
                if not subset >> j & 1 and row[j]:
                    values[subset | (1 << j)] += row[j] * weight
        dp = values
    return dp.get((1 << rows) - 1, zero)


def gram_cross(cross):
    a, b = len(cross), len(cross[0])
    return [
        [one if i == j else zero for j in range(a)] + list(cross[i])
        for i in range(a)
    ] + [
        [conj(cross[i][j]) for i in range(a)] + [one if j == l else zero for l in range(b)]
        for j in range(b)
    ]


def rotation_basis(size):
    unit = QQ_I.dtype(0, 1)
    basis = [[one if i == j else zero for j in range(size)] for i in range(size)]
    for left, right in combinations(range(size), 2):
        phase = unit if (left + right) % 3 else one
        for row in basis:
            u, v = row[left], row[right]
            row[left] = (3*u + 4*phase*v)/5
            row[right] = (-4*conj(phase)*u + 3*v)/5
    for i in range(size):
        for j in range(size):
            assert sum(conj(row[i])*row[j] for row in basis) == (one if i == j else zero)
    return basis


def occupation_check(basis, a, b):
    size = len(basis)
    poly = {(0,)*size: one}
    for j in range(b):
        values = defaultdict(lambda: zero)
        for alpha, coeff in poly.items():
            for i in range(size):
                power = list(alpha)
                power[i] += 1
                values[tuple(power)] += coeff*basis[i][j]
        poly = values
    weights = {alpha: norm(val)*prod(map(factorial, alpha)) for alpha, val in poly.items()}
    cross = [row[:b] for row in basis[:a]]
    assert sum(weights.values()) == 1
    lower = QQ.one
    for i, row in enumerate(cross):
        squares = [norm(z) for z in row]
        t = sum(squares)
        assert sum(alpha[i]*p for alpha,p in weights.items()) == t
        assert sum(alpha[i]*(alpha[i]-1)*p for alpha,p in weights.items()) == 4*sum(u*v for u,v in combinations(squares, 2))
        lower *= 1+t/2
    actual = permanent(gram_cross(cross))
    assert actual.y == 0 and actual.x >= lower
    assert actual.x == sum(prod(1+v for v in alpha[:a])*p for alpha,p in weights.items())
    sq = [[QQ_I.convert(norm(z)) for z in row] for row in cross]
    assert permanent(gram_cross(sq)).x <= actual.x**2
    for k in range(2, min(a,b)+1):
        if a%k or b%k:
            continue
        compressed = []
        for i in range(0,a,k):
            blockrow = []
            for j in range(0,b,k):
                block = [row[j:j+k] for row in cross[i:i+k]]
                p = permanent(block)
                energy = sum(norm(z) for row in block for z in row)/k
                assert norm(p) <= energy**2
                blockrow.append(p)
            compressed.append(blockrow)
        assert permanent(gram_cross(compressed)).x <= actual.x


if __name__ == '__main__':
    count = 0
    for size in (3, 4, 5):
        basis = rotation_basis(size)
        for a,b in ((size, size), (2,size), (size,2), (size-1,size-1)):
            occupation_check(basis,a,b)
            count += 1
    print(f"Passed {count} exact complex occupation, Gram permanent and contraction checks.")
