"""Finite checks for the bipartite graph-tensor comparison."""

from fractions import Fraction
from itertools import combinations, product

from check_local_law import rank, subtract


def multiply_field(a, b, modulus):
    size = 1 << (modulus.bit_length() - 1)
    value = 0
    while b:
        if b & 1:
            value ^= a
        b >>= 1
        a <<= 1
        if a & size:
            a ^= modulus
    return value


def power_field(a, exponent, modulus):
    value = 1
    for _ in range(exponent):
        value = multiply_field(value, a, modulus)
    return value


def check_matrices(t, modulus):
    q = 2**t
    scalars = {power_field(x, q - 1, modulus) for x in range(1, q*q)}
    assert len(scalars) == q + 1 and 0 not in scalars
    basis = [1 << k for k in range(2*t)]
    twisted = [power_field(x, q, modulus) for x in basis]
    parts = [[tuple(multiply_field(c, x, modulus) for x in vectors)
              for c in scalars] for vectors in (basis, twisted)]
    for part in parts:
        for a, b in combinations(part, 2):
            assert rank(subtract(a, b)) == 2*t
    for a, b in product(*parts):
        assert rank(subtract(a, b)) == t
    return len(scalars)


def check_cuts(r):
    a, b = range(r), range(r, 2*r)
    supply = list(product(a, b))
    demand = list(combinations(a, 2)) + list(combinations(b, 2))
    for bits in product(range(2), repeat=2*r):
        spare = sum(bits[i] != bits[j] for i, j in supply)
        spare -= sum(bits[i] != bits[j] for i, j in demand)
        assert spare == (sum(bits[:r]) - sum(bits[r:]))**2
    routing = Fraction(r, 2*(r-1))
    guaranteed = Fraction(2*r, 3*r-2)
    sufficient_squared = Fraction(r*r, 2*(r-1)**2)
    assert (guaranteed > routing) == (r > 2)
    assert guaranteed**2 < sufficient_squared
    return routing, guaranteed


def check_pair_count():
    r = 3
    pairs = list(combinations(range(r), 2))
    for entries in product(range(2), repeat=r*r):
        def value(i, j):
            return entries[i*r+j]

        expansion = sum(value(i, j)*value(k, l) + value(i, l)*value(k, j)
                        for i, k in pairs for j, l in pairs)
        by_rows = [sum(entries[i*r:(i+1)*r]) for i in range(r)]
        by_cols = [sum(entries[j::r]) for j in range(r)]
        total = sum(entries)
        assert 2*expansion == (total**2 - sum(x*x for x in by_rows)
                               - sum(x*x for x in by_cols) + sum(x*x for x in entries))
        assert r*2*expansion <= (r-1)*total**2


if __name__ == "__main__":
    for t, modulus in [(2, 0b10011), (3, 0b1000011)]:
        count = check_matrices(t, modulus)
        print(f"F_{2**(2*t)}: {count} matrices per part, ranks {2*t} and {t}")
    for r in range(2, 7):
        routing, guaranteed = check_cuts(r)
        print(f"r={r}: {2**(2*r)} cuts, routing {routing}, tensor rate >= {guaranteed}")
    check_pair_count()
    print("Ptolemy product count checked on all 512 binary 3 by 3 arrays")
