"""Exact finite checks for the matching bound and block interpolation."""

from collections import Counter
from fractions import Fraction
from itertools import combinations
from math import prod


def perfect_matchings(vertices):
    if not vertices:
        yield ()
        return

    first, *rest = vertices
    for partner in rest:
        remaining = [vertex for vertex in rest if vertex != partner]
        for matching in perfect_matchings(remaining):
            yield ((first, partner), *matching)


def check_block(size):
    centers = set(combinations(range(size), 2))
    matchings = list(perfect_matchings(list(range(size))))
    assert len(set(matchings)) == len(matchings) == prod(range(1, size, 2))
    assert all(len(set(sum(matching, ()))) == size for matching in matchings)

    forbidden_counts = Counter()
    for matching in matchings:
        chosen = frozenset(matching)
        for extras in combinations(centers - chosen, size - 1 - len(chosen)):
            forbidden_counts[chosen.union(extras)] += 1

    maximum = max(forbidden_counts.values())
    bound = 2 if size == 6 else 2 ** (size // 2 - 1)
    assert maximum <= bound
    assert size * maximum < len(matchings)

    stars = [{edge for edge in centers if vertex in edge} for vertex in range(size)]
    assert all(len(star) == size - 1 for star in stars)
    assert all(sum(edge in star for star in stars) == 2 for edge in centers)
    assert all(len(first & second) == 1 for first, second in combinations(stars, 2))
    assert len(centers) > 2 * (size - 1)
    assert Fraction(len(centers), size - 1) == Fraction(size, 2)

    print(f"m={size}: {len(matchings)} matchings, "
          f"{len(forbidden_counts)} forbidden sets containing a matching, maximum {maximum}")


def check_interpolation():
    count = 0
    for denominator in range(3, 81):
        for numerator in range(1, denominator // 3 + 1):
            p = Fraction(numerator, denominator)
            mean = 2 / p
            lower = 2 * (mean // 2)
            upper_share = (mean - lower) / 2
            total_blocks = upper_share.denominator
            upper_blocks = upper_share.numerator
            lower_blocks = total_blocks - upper_blocks
            total_domination = lower * lower_blocks + (lower + 2) * upper_blocks
            assert lower >= 6
            assert Fraction(2 * total_blocks, total_domination) == p
            count += 1

    print(f"rational interpolation: {count} input fractions checked")


if __name__ == "__main__":
    check_block(6)
    check_block(8)
    check_interpolation()
