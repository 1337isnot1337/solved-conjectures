"""Integer checks of the relator coordinates and character grids in issue 592."""

from collections import Counter
from itertools import product
from random import Random

from check_transfer import element, multiply


IDENTITY = (1, 0, 0, 1)


def inverse(g, modulus):
    a, b, c, d = g
    return d, -b % modulus, -c % modulus, a


def power(g, exponent, modulus):
    value = IDENTITY
    while exponent:
        if exponent % 2:
            value = multiply(value, g, modulus)
        g = multiply(g, g, modulus)
        exponent //= 2
    return value


def word(modulus, *letters):
    value = IDENTITY
    for letter in letters:
        value = multiply(value, letter, modulus)
    return value


def relations(p, coords, modulus):
    x, h, c, y, a, f = coords
    q = 1 + p
    base = (q**(2 * p) - 1) // p
    X = element(1 + x, p, c, modulus)
    Y = element(1 + y, a, base + f, modulus)
    Z = element(q + h, 0, 0, modulus)
    Zp = power(Z, p, modulus)
    return (word(modulus, Z, X, inverse(Z, modulus), power(inverse(X, modulus), q*q, modulus)),
            word(modulus, inverse(Z, modulus), Y, Z, power(inverse(Y, modulus), q*q, modulus)),
            word(modulus, X, Y, inverse(word(modulus, Zp, Y, X, Zp), modulus)))


def check_chart(p, depth, exhaustive):
    modulus = p**(depth + 2)
    rng = Random(592 * modulus)
    origin = [p**2 * rng.randrange(modulus // p**2) for _ in range(6)]
    assert relations(p, [0] * 6, modulus) == (IDENTITY,) * 3
    before = relations(p, origin, modulus)
    if exhaustive:
        directions = product(range(p), repeat=6)
    else:
        directions = (rng.choices(range(p), k=6) for _ in range(400))
    count = 0
    for direction in directions:
        coords = [v + p**depth * u for v, u in zip(origin, direction)]
        after = relations(p, coords, modulus)
        differences = [[(a - b) % modulus for a, b in zip(g, h)] for g, h in zip(after, before)]
        scale = p**(depth + 1)
        assert all(value % scale == 0 for matrix in differences for value in matrix)
        x, h, c, y, a, f = direction
        predicted = (-2 * x, 2 * h, -4 * c, -2 * y, -4 * a, f - 2 * h)
        extracted = differences[0][:3] + differences[1][:2] + differences[2][:1]
        assert [u // scale for u in extracted] == [v % p for v in predicted]
        count += 1
    print(f"p={p}, digit {depth}: {count} simultaneous six-coordinate changes")


def check_grids(p, b):
    d = b + 1
    modulus = p**(d + b)
    s = p**d
    generators = (element(1, p, 0, modulus), element(1, 0, p, modulus),
                  element(1 + p, 0, 0, modulus))
    tested = []
    # Each case specifies a character (diagonal, upper, lower) and a word digit.
    cases = (((1, 0, 0), (0, 1, 0)), ((0, 1, 0), (0, 1, 0)),
             ((0, 1, 1), (0, 1, 1)), ((1, 1, p + 2), (1, 1 + p, 2)))
    for (a, e, f), (h, x, y) in cases:
        A = (a, e, f, -a)
        t = element(1 + s*h, s*x, s*y, modulus)
        conjugate = [word(modulus, g, t, inverse(g, modulus), inverse(t, modulus)) for g in generators]
        for u, depth in [(t, d)] + [(g, d + 1) for g in conjugate]:
            coarse = p**(d + b - depth)
            U = tuple(((v - base) % modulus) // p**depth for v, base in zip(u, IDENTITY))
            if multiply(A, U, p) != multiply(U, A, p):
                break
        else:
            raise AssertionError("no transverse word")
        counts = Counter()
        for i, j, k in product(range(0, coarse, p), repeat=3):
            g = element(1 + i, j, k, coarse)
            moved = word(coarse, g, A, inverse(g, coarse), U)
            counts[(moved[0] + moved[3]) % coarse] += 1
        assert set(counts) == set(range(next(iter(counts)) % p, coarse, p))
        assert len(set(counts.values())) == 1
        tested.append((depth - d, len(counts)))
    print(f"p={p}, b={b}: (extra word depth, exact phase-grid size) {tested}")


if __name__ == "__main__":
    for prime, digit, exhaustive in ((3, 2, True), (3, 4, True), (5, 2, True),
                                     (5, 3, False), (7, 5, False)):
        check_chart(prime, digit, exhaustive)
    for prime, depth in ((3, 4), (5, 3), (7, 3)):
        check_grids(prime, depth)
