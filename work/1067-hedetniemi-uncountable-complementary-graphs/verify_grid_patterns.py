"""Finite checks of the interval assignment and the relative-permutation decoder."""
from bisect import bisect_right
from fractions import Fraction
from itertools import permutations, product
from math import factorial


def check_grid_grouping(k):
    """Transpose row-major and column-major orders, keeping each cell occupied."""
    real_slot_for_aronszajn_slot = [column * k + row for row in range(k) for column in range(k)]
    assert sorted(real_slot_for_aronszajn_slot) == list(range(k * k))
    for reverse in (False, True):
        cells = set()
        for position, real_slot in enumerate(real_slot_for_aronszajn_slot):
            aronszajn_slot = k * k - 1 - position if reverse else position
            cells.add((aronszajn_slot // k, real_slot // k))
        assert cells == set(product(range(k), repeat=2))
    return len(real_slot_for_aronszajn_slot)


def check_relative_patterns(k):
    """Choose witnesses under deliberately different ordinal orders inside each round."""
    pairs = list(product(range(k), repeat=2))
    appearances = {pair: [] for pair in pairs}
    for level in range(k):
        ordering = pairs[level:] + pairs[:level]
        if level % 2:
            ordering.reverse()
        for offset, cell in enumerate(ordering):
            appearances[cell].append(level * k * k + offset)

    patterns = list(permutations(range(k)))
    checked = 0
    for aronszajn_ranks, real_ranks in product(patterns, repeat=2):
        previous = -1
        witnesses = []
        for a, r in zip(aronszajn_ranks, real_ranks):
            options = appearances[a, r]
            previous = options[bisect_right(options, previous)]
            witnesses.append((previous, a, r))
        assert witnesses == sorted(witnesses)
        assert tuple(point[1] for point in witnesses) == aronszajn_ranks
        assert tuple(point[2] for point in witnesses) == real_ranks
        checked += 1
    assert checked == factorial(k) ** 2
    return checked


def check_reserved_intervals(depth):
    """Reserve middle thirds. A further generation separates consecutive old slots."""
    previous = []
    intervals = [(Fraction(0), Fraction(1))]
    for _ in range(depth):
        current = []
        following = []
        for lo, hi in intervals:
            left, right = (2 * lo + hi) / 3, (lo + 2 * hi) / 3
            current.append((left, right))
            following.extend([(lo, left), (right, hi)])
        combined = sorted(previous + current)
        assert all(a[1] < b[0] for a, b in zip(combined, combined[1:]))
        if previous:
            assert combined[0] in current and combined[-1] in current
            assert all(any(a[1] < c[0] and c[1] < b[0] for c in current)
                       for a, b in zip(previous, previous[1:]))
        previous = combined
        intervals = following
    return len(previous)


def main():
    cells = sum(check_grid_grouping(k) for k in range(1, 33))
    patterns = sum(check_relative_patterns(k) for k in range(1, 7))
    intervals = check_reserved_intervals(9)
    print(f'{cells:,} small cells checked in both orientations through side 32')
    print(f'{patterns:,} relative permutation pairs reconstructed through arity 6')
    print(f'{intervals:,} disjoint reserved rational intervals checked through depth 9')


if __name__ == '__main__':
    main()
