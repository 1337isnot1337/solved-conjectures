"""Exact finite checks of two proposed lower-bound arguments for the Ulam sequence."""

from bisect import bisect_right
from collections import Counter
from itertools import combinations

from upper_bound import ulam_prefix


LIMIT = 524288
EXCEPTIONS = {2, 3, 47, 69}


def terms_to(limit):
    mask = (1 << (limit + 1)) - 1
    terms = [1, 2]
    members = (1 << 1) | (1 << 2)
    reached = 1 << 3
    multiple = 0
    last = 2
    while candidates := (reached & ~multiple) >> (last + 1):
        last += (candidates & -candidates).bit_length()
        pairs = (members << last) & mask
        multiple |= reached & pairs
        reached |= pairs
        members |= 1 << last
        terms.append(last)
    return terms


def restricted_pair_counts(tail):
    # Polynomial multiplication over the integers with a full digit per coefficient.
    # Each ordered count is at most len(tail), so carries between digits are impossible.
    width = (len(tail).bit_length() + 7) // 8
    digits = bytearray(width * (LIMIT + 1))
    for n in tail:
        digits[width * n] = 1
    poly = int.from_bytes(digits, "little")
    square = (poly * poly).to_bytes(2 * len(digits), "little")
    counts = []
    for n in range(LIMIT + 1):
        ordered = int.from_bytes(square[width * n:width * (n + 1)], "little")
        diagonal = n % 2 == 0 and n // 2 in tail
        distinct = ordered - diagonal
        if distinct < 0 or distinct % 2:
            raise ValueError(f"invalid ordered pair count at {n}")
        counts.append(distinct // 2)
    return counts


def prefix_sources(terms, x):
    # Bit j in a block mask corresponds to x+1+j.
    old = terms[:bisect_right(terms, x)]
    members = reached = multiple = 0
    for a in old:
        pairs = members << a
        multiple |= reached & pairs
        reached |= pairs
        members |= 1 << a
    block = (1 << x) - 1
    singles = ((reached & ~multiple) >> (x + 1)) & block
    possible = ~(multiple >> (x + 1)) & block
    could_be_blocked = 0
    for a in old:
        could_be_blocked |= (possible << a) & block
    forced = singles & ~could_be_blocked
    actual = sum(1 << (a - x - 1) for a in terms[len(old):bisect_right(terms, 2 * x)])
    if forced & ~actual or actual & ~possible:
        raise ValueError("invalid certification of a dyadic block")
    lower, upper = 0, possible
    for _ in range(5):
        low_hits = high_hits = (reached >> (x + 1)) & block
        low_repeat = high_repeat = (multiple >> (x + 1)) & block
        for a in old:
            new_low = (lower << a) & block
            new_high = (upper << a) & block
            low_repeat |= low_hits & new_low
            high_repeat |= high_hits & new_high
            low_hits |= new_low
            high_hits |= new_high
        lower, upper = low_hits & ~high_repeat, high_hits & ~low_repeat
        if lower & ~actual or actual & ~upper:
            raise ValueError("invalid propagated block bounds")
    return (singles.bit_count(), forced.bit_count(), actual.bit_count(),
            lower.bit_count(), upper.bit_count())


def main():
    terms = terms_to(LIMIT)
    members = set(terms)
    if terms[:bisect_right(terms, 4600)] != ulam_prefix(4600):
        raise ValueError("prefix generators disagree")
    tail = members - EXCEPTIONS
    counts = restricted_pair_counts(tail)
    both_small = Counter(a + b for a, b in combinations(EXCEPTIONS, 2))
    for n in range(3, LIMIT + 1):
        all_pairs = counts[n] + both_small[n] + sum(n - a in tail for a in EXCEPTIONS)
        if (n in members) != (all_pairs == 1):
            raise ValueError(f"full recurrence mismatch at {n}")

    depth = {1: 0, 2: 0}
    outside = 0
    for n in terms[2:]:
        a = next(a for a in terms if 2 * a < n and n - a in members)
        depth[n] = 1 + depth[n - a]
        outside += a not in EXCEPTIONS and n - a not in EXCEPTIONS
    print(f"through {LIMIT}: {len(terms)} terms, {outside} with both parents outside the four, "
          f"maximum larger-parent depth {max(depth.values())}")

    numerator, denominator = 409258580447, 10**12
    for x in (8192, 32768, 131072, 524288):
        moment = singletons = 0
        for n in range(x // 2 + 1, x + 1):
            if 4 * abs(2 * (n * numerator % denominator) - denominator) < denominator:
                r = counts[n]
                moment += r * (2 - r)
                singletons += r == 1
        print(f"phase window ending at {x}: moment {moment}, singletons {singletons}")
    for x in (2048, 8192, 32768, 65536):
        unique, forced, actual, lower, upper = prefix_sources(terms, x)
        print(f"block ({x},{2*x}]: old-pair singletons {unique}, forced {forced}, actual {actual}, "
              f"five-round interval [{lower},{upper}]")


if __name__ == "__main__":
    main()
