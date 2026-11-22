"""Certificate for the support patterns on three distinct prime axes."""

from collections import Counter
from itertools import combinations_with_replacement, product

AXES = (1, 2, 4)
POINTS = tuple(product(range(2), range(3), range(5)))


def difference(x, y):
    return sum(bit for bit, left, right in zip(AXES, x, y) if left != right)


def disjoint_blocks(enabled):
    maximal = [t for t in enabled if not any(t != s and (s & t) == t for s in enabled)]
    if any(x & y for x in maximal for y in maximal if x != y):
        return False
    return all((t in enabled) == any((t & s) == t for s in maximal) for t in range(8))


def blocked_axes(clique, enabled):
    blocked = set()
    for x, y in combinations_with_replacement(clique, 2):
        mask = difference(x, y)
        if mask not in enabled:
            return None
        blocked.update(bit for bit in AXES if (mask ^ bit) not in enabled)
    return blocked


def find_witness(enabled):
    def extend(clique, tail):
        blocked = blocked_axes(clique, enabled)
        if blocked == set(AXES):
            return clique
        if blocked is None or len(clique) == 6:
            return None
        for i, point in enumerate(tail):
            if all(difference(point, other) in enabled for other in clique):
                found = extend(clique + (point,), tail[i+1:])
                if found:
                    return found
        return None

    return extend((POINTS[0],), POINTS[1:])


def check_translates(witness, enabled, moduli):
    for axis, prime in enumerate(moduli):
        translated = set()
        for point, shift in product(witness, range(prime)):
            moved = list(point)
            moved[axis] = (moved[axis] + shift) % prime
            translated.add(tuple(moved))
        assert any(difference(x, y) not in enabled
                   for x, y in combinations_with_replacement(translated, 2))


def classify(enabled):
    if any(all((t ^ bit) in enabled for t in enabled) for bit in AXES):
        return "common subgroup"
    if disjoint_blocks(enabled):
        return "Hamming components"
    if sum(bit in enabled for bit in AXES) <= 1:
        return "least stabilizer"
    witness = find_witness(enabled)
    if witness:
        assert blocked_axes(witness, enabled) == set(AXES)
        for moduli in ((2, 3, 5), (5, 7, 11)):
            check_translates(witness, enabled, moduli)
        return "free-clique witness"
    if enabled in ({0, 1, 3, 4, 7}, {0, 1, 2, 5, 7}):
        return "two remaining patterns"
    raise AssertionError(("no certificate", enabled))


if __name__ == "__main__":
    counts = Counter()
    for case in range(128):
        enabled = {0} | {t for t in range(1, 8) if case & (1 << (t-1))}
        counts[classify(enabled)] += 1
    for name, count in sorted(counts.items()):
        print(f"{name}: {count}")
