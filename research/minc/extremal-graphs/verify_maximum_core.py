"""Replay the forced-column and switching counts with exact rational weights."""

from fractions import Fraction
from itertools import permutations


def check(rows, outside):
    n = len(rows)
    d = len(rows[0])
    assert all(len(row) == d for row in rows)
    assert all(sum(j in row for row in rows) == d for j in range(n))
    matchings = [m for m in permutations(range(n)) if all(m[i] in row for i, row in enumerate(rows))]
    orders = list(permutations(range(n)))
    asym_total = 0
    for m in matchings:
        neighbors = [{j for j in range(n) if m[j] in row} for row in rows]
        for i, available in enumerate(neighbors):
            for j in available:
                if i in neighbors[j]:
                    continue
                asym_total += 1
                weight = Fraction(0)
                count = 0
                for order in orders:
                    earlier = set(order[:order.index(i)])
                    if j in earlier or not (neighbors[j] - {j}) <= earlier:
                        continue
                    count += 1
                    remaining = len(available - earlier)
                    weight += Fraction(1, remaining)
                    assert not any(other[i] == m[j] and all(other[t] == m[t] for t in earlier)
                                   for other in matchings)
                assert count * d * (d+1) == len(orders)
                assert 4 * weight >= count
    assert (2*d+1) * asym_total >= outside * len(matchings)
    return len(matchings)


if __name__ == "__main__":
    cases = [(4, (0, 1), 4), (5, (0, 1, 2), 5), (4, (0, 2), 0)]
    checked = 0
    for n, steps, outside in cases:
        checked += check([{(i+j) % n for j in steps} for i in range(n)], outside)
    # One complete component and one noncomplete component.
    checked += check([{0, 1}, {0, 1}, {2, 3}, {3, 4}, {2, 4}], 3)
    print(f"Verified the asymmetric-arc count and reveal-event bounds on {checked} matchings.")
