"""Classify every unordered Boolean decoder on three order comparisons."""

from collections import Counter
from itertools import combinations, product


def quotient(signs):
    """Record agreements with coordinate zero; simultaneous reversal fixes both bits."""
    return int(signs[0] == signs[1]) + 2 * int(signs[0] == signs[2])


def intersection_patterns(coordinates, reversals):
    """All orientations where the specified signed linear orders compare alike."""
    accepted = set()
    for signs in product((0, 1), repeat=3):
        values = {signs[i] ^ reversal for i, reversal in zip(coordinates, reversals)}
        if len(values) == 1:
            accepted.add(signs)
    return frozenset(accepted)


def verify():
    signs = tuple(product((0, 1), repeat=3))
    universe = frozenset(signs)
    interpreters = {}
    for size in (1, 2, 3):
        for subset in combinations(range(3), size):
            for reversals in product((0, 1), repeat=size):
                support = intersection_patterns(subset, reversals)
                for accepted in (support, universe - support):
                    interpreters[accepted] = min(size, interpreters.get(accepted, 4))

    distribution = Counter()
    checks = 0
    for mask in range(16):
        accepted = frozenset(s for s in signs if mask & (1 << quotient(s)))
        for s in signs:
            reverse = tuple(1 - v for v in s)
            assert (s in accepted) == (reverse in accepted)
            checks += 1
        assert accepted in interpreters
        distribution[interpreters[accepted]] += 1
    assert distribution == {1: 2, 2: 6, 3: 8}
    assert len(interpreters) == 16
    print(f"All {len(interpreters)} symmetric decoders and {checks} oriented input cases passed.")
    print("Minimum number of signed orders by decoder:", dict(sorted(distribution.items())))


if __name__ == "__main__":
    verify()
