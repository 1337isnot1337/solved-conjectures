#!/usr/bin/env python3
"""Independent finite checks for the Horňák–Woźniak proof."""

from functools import cache
from itertools import combinations_with_replacement, product
from math import lcm


def consecutive_partitions(total, size):
    """Counts of size size and size size + 1, with at least one bigger part."""
    for bigger in range(1, total // (size + 1) + 1):
        smaller, remainder = divmod(total - bigger * (size + 1), size)
        if remainder == 0:
            yield smaller, bigger


def admissible(arms):
    """The five tests in Theorem 12, using the literal existential triggers."""
    total = 1 + sum(arms)
    for i in range(1, sum(arms[-3:-1]) + 1):
        j = i + 1
        u = [x % i for x in arms]
        v = [x % j for x in arms]
        carry, residue = divmod(sum(u), i)
        next_carry, next_residue = divmod(sum(v), j)
        if carry > 1 or (carry == 1 and max(u) <= residue):
            return False
        partitions = list(consecutive_partitions(total, i))
        if any(b <= i for _, b in partitions):
            free = [min(x // j, r) for x, r in zip(arms, u)]
            if carry == 0 and not any(a == b for a, b in zip(free, u)):
                return False
            if carry == 1 and sum(free) < residue:
                return False
        if next_carry == 1 and any(a <= i for a, _ in partitions):
            if not any(r > next_residue and x // i + r >= j for x, r in zip(arms, v)):
                return False
    return True


@cache
def all_partitions(total, minimum=1):
    if total == 0:
        return ((),)
    return tuple(
        (part,) + rest
        for part in range(minimum, total + 1)
        for rest in all_partitions(total - part, part)
    )


def can_assign(arms, pieces):
    """Directly place each piece on an arm, largest first."""
    if not pieces:
        return True
    largest = pieces[-1]
    seen = set()
    for idx, capacity in enumerate(arms):
        if capacity >= largest and capacity not in seen:
            seen.add(capacity)
            after = arms[:idx] + (capacity - largest,) + arms[idx + 1 :]
            if can_assign(after, pieces[:-1]):
                return True
    return False


def realizable(arms, pieces):
    """Try every distinct choice for the part containing the centre."""
    for idx, size in enumerate(pieces):
        if idx == 0 or size != pieces[idx - 1]:
            if can_assign(arms, pieces[:idx] + pieces[idx + 1 :]):
                return True
    return False


def check_small_trees():
    trees = partitions = 0
    for extra_leaf in (0, 1):
        for total in range(4 + extra_leaf, 32):
            for regular in combinations_with_replacement(range(1, total - 2), 3):
                if sum(regular) != total - 1 - extra_leaf:
                    continue
                arms = (1,) * extra_leaf + regular
                expected = admissible(arms) and (not extra_leaf or admissible(regular))
                actual = True
                for pieces in all_partitions(total):
                    partitions += 1
                    if not realizable(arms, pieces):
                        actual = False
                        break
                assert actual == expected, (arms, actual, expected)
                trees += 1
    return trees, partitions


def direct_assignment(arms, i, small, big, extra=0):
    """Enumerate bigger-piece allocations, then count the remaining slots."""
    j = i + 1
    for loc in range(3) if extra else (0,):
        capacities = list(arms)
        capacities[loc] -= extra
        first, second, third = capacities
        for b0 in range(min(big, first // j) + 1):
            for b1 in range(min(big - b0, second // j) + 1):
                b2 = big - b0 - b1
                if b2 * j <= third:
                    unused = (first - b0 * j, second - b1 * j, third - b2 * j)
                    if sum(x // i for x in unused) >= small:
                        return True
    return False


def check_local_transfer():
    checks = 0
    for i in range(2, 16):
        j = i + 1
        choices = range(j + 1, j + 17)
        for arms, offset in product(combinations_with_replacement(choices, 3), (0, 1)):
            if any(sum(sorted(x % k for x in arms)[:2]) + offset >= k for k in (i, j)):
                continue
            total = 1 + offset + sum(arms)
            pure = list(consecutive_partitions(total, i))
            if pure:
                a, b = pure[-1]
                if not direct_assignment(arms, i, a, b - 1):
                    continue
            for m in range(1, i):
                for a, b in consecutive_partitions(total - m, i):
                    assert direct_assignment(arms, i, a, b - 1, m), (arms, offset, i, m, a, b)
                    checks += 1
    return checks


def check_explicit_families():
    checks = 0
    for shortest, multiplier in product(range(1, 6), (1, 2)):
        middle = multiplier * lcm(*range(1, 2 * shortest + 2))
        longest = shortest + middle + 1
        regular = (shortest, middle, longest)
        for arms in (regular, (1,) + regular):
            assert admissible(arms), arms
            checks += 1
    return checks


if __name__ == "__main__":
    trees, partitions = check_small_trees()
    print(f"Checked {trees:,} small trees against {partitions:,} prescribed partitions.")
    transfer = check_local_transfer()
    print(f"Checked {transfer:,} local transfers by direct allocation.")
    print(f"Checked {check_explicit_families():,} constructed trees against the five tests.")
