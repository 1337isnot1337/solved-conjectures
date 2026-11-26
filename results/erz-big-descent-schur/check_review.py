"""Independent two-color RSK check and higher-Durfee leg-transform checks."""

from bisect import bisect_left
from collections import Counter
from functools import lru_cache
from itertools import combinations, permutations
from math import comb, factorial, prod


def binomial(top, bottom):
    return comb(top, bottom) if 0 <= bottom <= top else 0


def compositions(weight, parts):
    if parts == 0:
        return int(weight == 0)
    return binomial(weight - 1, parts - 1)


def two_color_counts(n):
    actual = Counter()
    for word in permutations(range(n)):
        descents = [i for i in range(1, n) if word[i - 1] > word[i] + 1]
        if len(descents) > 1:
            continue
        tails = []
        for letter in word:
            i = bisect_left(tails, letter)
            if i == len(tails):
                tails.append(letter)
            else:
                tails[i] = letter
        for cut in descents or range(n + 1):
            actual[len(tails), cut] += 1
    expected = Counter()
    for top in range(1, n + 1):
        for bottom in range(min(top, n - top) + 1):
            recording = binomial(top + bottom, bottom) - binomial(top + bottom, bottom - 1)
            for ones in range(bottom, top + 1):
                for cut in range(n + 1):
                    expected[top, cut] += recording * compositions(cut, ones) * compositions(
                        n - cut, top + bottom - ones
                    )
    assert actual == expected


@lru_cache(None)
def tableau_count(arms, legs):
    cells = set()
    for i, (arm, leg) in enumerate(zip(arms, legs)):
        cells.update((i, j) for j in range(i, i + arm + 1))
        cells.update((j, i) for j in range(i + 1, i + leg + 1))
    hooks = [1 + sum(a == i and b > j or b == j and a > i for a, b in cells) for i, j in cells]
    return factorial(len(cells)) // prod(hooks)


def leg_transform(arms, upper):
    dim = len(arms)
    signed_permutations = [
        (perm, (-1) ** sum(perm[i] > perm[j] for i in range(dim) for j in range(i + 1, dim)))
        for perm in permutations(range(dim))
    ]
    total = 0
    for ascending in combinations(range(upper[0] + 1), dim):
        legs = ascending[::-1]
        if any(b > u for b, u in zip(legs, upper)):
            continue
        minor = sum(sign * prod(binomial(upper[i], legs[j]) for i, j in enumerate(perm))
                    for perm, sign in signed_permutations)
        total += (-1) ** (sum(upper) - sum(legs)) * minor * tableau_count(arms, legs)
    return total


if __name__ == "__main__":
    two_color_counts(9)
    checks = 0
    for dim in (4, 5):
        arms = tuple(range(dim - 1, -1, -1))
        for upper in combinations(range(dim + 2), dim):
            assert leg_transform(arms, upper[::-1]) >= 0
            checks += 1
    print(f"Two-color coefficients across all {factorial(9):,} permutations of size nine; "
          f"{checks} exact higher-Durfee transforms.")
