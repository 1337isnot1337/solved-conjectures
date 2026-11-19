"""Exact finite checks for the hyperplane law. Run with Python 3."""
from fractions import Fraction
from itertools import combinations_with_replacement, product
from math import gcd, lcm

HALF = Fraction(1, 2)


def distance(x):
    r = x % 1
    return min(r, 1 - r)


def ceiling(normal, shift):
    discrepancy = sum(m * (HALF - s) for m, s in zip(normal, shift))
    return HALF - distance(discrepancy) / sum(map(abs, normal))


def circle_maximum(speeds, shift):
    # At a maximum, one speed is at its half-integer cusp, or two
    # active coordinate distances have opposite slopes and equal values.
    q = lcm(*(x.denominator for x in shift))
    residues = [int(q * x) for x in shift]
    best_n, best_d = 0, 1
    for i, j in combinations_with_replacement(range(len(speeds)), 2):
        slope = speeds[i] + speeds[j]
        d = q * slope
        offsets = [r * slope for r in residues]
        for h in range(slope):
            t = q * h - residues[i] - residues[j]
            positions = ((t * v + b) % d for v, b in zip(speeds, offsets))
            n = min(min(x, d - x) for x in positions)
            if n * best_d > best_n * d:
                best_n, best_d = n, d
    return Fraction(best_n, best_d)


def predicted_endpoint(normal, speeds):
    g = gcd(*speeds)
    w = tuple(v // g for v in speeds)
    a = sum(map(abs, normal))
    if a % 2 == 0:
        return all(v % 2 for v in w)
    target = tuple((a + (1 if x > 0 else -1)) // 2 for x in normal)
    return any(all((u * v - b) % a == 0 for v, b in zip(w, target))
               for u in range(1, a) if gcd(u, a) == 1)


def main():
    total = 0
    for m, bound in [((1, 1, -1), 24), ((1, 1, -2), 18), ((1, 1, 1, -2), 9)]:
        zero = tuple(Fraction(0) for _ in m)
        for v in product(range(1, bound + 1), repeat=len(m)):
            if len(set(v)) != len(v) or sum(x * y for x, y in zip(m, v)) != 0:
                continue
            value = circle_maximum(v, zero)
            limit = ceiling(m, zero)
            assert value <= limit
            assert (value == limit) == predicted_endpoint(m, v)
            total += 1
    assert circle_maximum((1, 2, 3), (0, 0, 0)) == Fraction(1, 4)
    assert circle_maximum((1, 4, 5), (0, 0, 0)) == Fraction(1, 3)

    shifted = 0
    for q in (3, 5):
        for r in product(range(q), repeat=2):
            s = tuple(Fraction(x, q) for x in r)
            # In dimension one the sampled circle equals the entire hyperplane torus.
            assert circle_maximum((2, 5), s) == ceiling((5, -2), s)
            shifted += 1
    # A zero normal coordinate is allowed in the shifted limit theorem.
    for r in product(range(3), repeat=3):
        s = tuple(Fraction(x, 3) for x in r)
        assert circle_maximum((2, 5, 7), s) <= ceiling((5, -2, 0), s)
        shifted += 1
    print(f"Passed {total} unshifted endpoint checks and {shifted} shifted checks.")


if __name__ == "__main__":
    main()
