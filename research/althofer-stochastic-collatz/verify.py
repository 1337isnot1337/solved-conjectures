"""Exact checks of stopped excursions for Althöfer's stochastic Collatz chain."""

from collections import Counter
from fractions import Fraction


def odd_part(number):
    return number // (number & -number)


def check_excursion(sign, depth, core):
    initial = sign + (1 << depth) * core
    pending = Counter({(initial, 0): Fraction(1)})
    endpoints = Counter()
    while pending:
        following = Counter()
        for (number, steps), probability in pending.items():
            difference = number - sign
            remaining = (difference & -difference).bit_length() - 1
            if remaining <= 2:
                assert remaining in (1, 2)
                assert difference == (1 << remaining) * 3**steps * core
                endpoints[remaining, steps] += probability
                continue
            for offset in (-1, 1):
                child = odd_part(3 * number + offset)
                following[child, steps + 1] += probability / 2
        pending = following
    distance = depth - 2
    hit = Fraction(2, 3) + Fraction(1, 3) * Fraction(-1, 2)**distance
    assert sum(endpoints.values()) == 1
    assert sum(p for (r, _), p in endpoints.items() if r == 2) == hit
    assert sum(j * p for (_, j), p in endpoints.items()) == (distance + 1 - hit) * Fraction(2, 3)


if __name__ == "__main__":
    for depth in range(3, 33):
        for sign in (-1, 1):
            for core in (1, 3, 5, 17, 257):
                check_excursion(sign, depth, core)
    print("Stopped endpoint, hit probability and mean duration agree in all 300 tests.")
