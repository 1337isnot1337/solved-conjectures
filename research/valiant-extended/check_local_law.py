"""Check the pullback price directly in small unitriangular groups."""

from collections import Counter
from fractions import Fraction
from itertools import product


def multiply(a, b):
    rows = []
    for mask in a:
        row = 0
        for j, factor in enumerate(b):
            if mask & (1 << j):
                row ^= factor
        rows.append(row)
    return tuple(rows)


def subtract(a, b):
    return tuple(x ^ y for x, y in zip(a, b))


def rank(rows):
    basis = {}
    for row in rows:
        while row:
            pivot = row.bit_length()
            if pivot not in basis:
                basis[pivot] = row
                break
            row ^= basis[pivot]
    return len(basis)


def check(h):
    r, s = h // 2, h - h // 2
    identity = tuple(1 << i for i in range(h))
    proj = identity[:r] + (0,) * s
    options = [[(1 << i) | (mask << (i+1))
                for mask in range(1 << (h-i-1))] for i in range(h)]
    group = list(product(*options))
    positions = {}
    for g in group:
        inv = identity
        # Since (g-I)^h=0, use the finite geometric series.
        power = identity
        for _ in range(1, h):
            power = multiply(power, subtract(g, identity))
            inv = subtract(inv, power)
        assert multiply(inv, g) == identity
        positions[g] = multiply(multiply(inv, proj), g)
    for i in range(h-1):
        gen = list(identity)
        gen[i] ^= 1 << (i+1)
        for g, pos in positions.items():
            assert rank(subtract(pos, positions[multiply(gen, g)])) == int(i == r-1)
    orbit = Counter(rank(subtract(proj, pos)) for pos in positions.values())
    rectangular = Counter(rank(rows) for rows in product(range(2**s), repeat=r))
    b = len(group)
    assert all(orbit[k] * 2**(r*s) == rectangular[k]*b for k in range(r+1))
    ratio = Fraction(sum(k*count for k, count in orbit.items()), b-1)
    assert 4 * ratio > h-1
    return b, ratio


if __name__ == "__main__":
    for dimension in range(3, 6):
        size, ratio = check(dimension)
        print(f"h={dimension}, group size={size}, squared price ratio={ratio}")
