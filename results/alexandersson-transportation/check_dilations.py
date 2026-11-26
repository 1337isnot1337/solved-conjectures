"""Cross-check actual integral tables, the reduced numerator, and the real root intervals."""
from fractions import Fraction
from itertools import pairwise
from math import comb


def compositions(total, length):
    if length == 1:
        yield (total,)
        return
    for first in range(total + 1):
        for tail in compositions(total - first, length - 1):
            yield (first, *tail)


def count_tables(m, k):
    margins = (2 * k,) + (k,) * m
    rows = list(compositions(k, m + 1))
    good = 0
    overflow = [0] * (m + 1)
    for first in rows:
        for second in rows:
            third = tuple(c - x - y for c, x, y in zip(margins, first, second, strict=True))
            assert sum(third) == m * k
            invalid = [j for j, entry in enumerate(third) if entry < 0]
            if invalid:
                assert len(invalid) == 1 and invalid[0] > 0
                overflow[invalid[0]] += 1
            else:
                good += 1
    bad_per_column = comb(k + 2 * m - 1, 2 * m) if k else 0
    assert overflow == [0] + [bad_per_column] * m
    return good


def numerator(m):
    return [comb(m, j) ** 2 - (m if j == 1 else 0) for j in range(m + 1)]


def evaluate(poly, x):
    value = 0
    for coefficient in reversed(poly):
        value = value * x + coefficient
    return value


def main():
    checks = 0
    lattice_points = 0
    for m in range(2, 7):
        coefficients = numerator(m)
        for k in range(6):
            counted = count_tables(m, k)
            expected = sum(h * comb(2 * m + k - j, 2 * m)
                           for j, h in enumerate(coefficients) if j <= k)
            assert counted == expected
            lattice_points += counted
            checks += 1
    cuts = [-1000, -107, -19, -7, -3, -2, -1, Fraction(-1, 2),
            Fraction(-1, 3), Fraction(-1, 29), 0]
    values = [evaluate(numerator(12), x) for x in cuts]
    assert all(a * b < 0 for a, b in pairwise(values))
    print(f'{checks} dilation counts, {lattice_points:,} integral tables, '
          f'{len(cuts) - 1} disjoint rational sign intervals.')


if __name__ == '__main__':
    main()
