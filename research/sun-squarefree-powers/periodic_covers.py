"""Check whether short-period primes can cover every genuinely squarefree test shift."""
from collections import Counter, defaultdict
from functools import cache
from math import gcd, isqrt


def squarefree_shifts():
    upper = 10**12 - 3
    sieve = bytearray([1]) * (isqrt(upper) + 1)
    for p in range(2, isqrt(len(sieve) - 1) + 1):
        if sieve[p]:
            sieve[p*p::p] = bytes((len(sieve) - 1 - p*p) // p + 1)
    squares = [p*p for p in range(3, len(sieve), 2) if sieve[p]]
    shifts = set()
    two = 2
    while two < upper:
        five = 1
        while two + five <= upper:
            s = two + five
            for square in squares:
                if square > s:
                    shifts.add(s)
                    break
                if s % square == 0:
                    break
            else:
                shifts.add(s)
            five *= 5
        two *= 2
    return sorted(shifts)


@cache
def covering_primes(common_divisor):
    # The gcd is odd. Trial division leaves either 1 or a prime.
    remaining = common_divisor
    primes = {5}
    divisor = 3
    while divisor * divisor <= remaining:
        if remaining % divisor == 0:
            primes.add(divisor)
            while remaining % divisor == 0:
                remaining //= divisor
        divisor += 2
    if remaining > 1:
        primes.add(remaining)
    return frozenset(primes)


def verify():
    shifts = squarefree_shifts()
    families = {covering_primes(gcd(2**period - 1, 5**period - 1))
                for period in range(1, 2521)}
    maximal = [family for family in families if not any(family < other for other in families)]

    @cache
    def buckets(prime):
        masks = defaultdict(int)
        for i, s in enumerate(shifts):
            masks[s % prime] |= 1 << i
        buckets = list(masks.values())
        if len(buckets) < prime:
            buckets.append(0)
        return tuple(buckets)

    nodes = Counter()

    def uncovered(remaining, primes, depth):
        nodes[depth] += 1
        if not remaining:
            return False
        capacities = [(max((mask & remaining).bit_count() for mask in buckets(p)), p)
                      for p in primes]
        if sum(size for size, p in capacities) < remaining.bit_count():
            return True
        _, p = max(capacities)
        choices = {mask & remaining for mask in buckets(p)}
        return all(uncovered(remaining ^ covered, primes - {p}, depth + 1)
                   for covered in choices)

    for family in maximal:
        if not uncovered((1 << len(shifts)) - 1, family, 0):
            raise RuntimeError(f"Found a covering assignment for primes {sorted(family)}")
    print(f"{len(shifts)} squarefree shifts, {len(maximal)} maximal prime sets")
    print(f"Branch counts by depth: {sorted(nodes.items())}")
    return shifts


if __name__ == "__main__":
    verify()
