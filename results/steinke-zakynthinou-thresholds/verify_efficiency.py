"""Compare the finite-coin implementation with exhaustive empirical losses."""

from fractions import Fraction
from itertools import product
from random import Random

from efficient import integer_scale, learn_threshold


class Draws:
    def __init__(self, values, width):
        self.values = iter(values)
        self.width = width
        self.count = 0

    def __call__(self, width):
        assert self.width == width
        self.count += 1
        return next(self.values)


def reference(sample, draws, width):
    n = len(sample)
    grid = 2**width
    rows = sorted((x, draws(width), y) for x, y in sample)
    if len({(x, tag) for x, tag, _ in rows}) != n:
        return 0, "collision"
    cuts = list(range(n + 1)) + list(range(n, -1, -1))
    shift = int(Fraction(len(cuts) * draws(width), grid))
    cuts = cuts[shift:] + cuts[:shift]
    losses = [sum((j >= i) != y for j, (_, _, y) in enumerate(rows))
              for i in range(n + 1)]
    depth = 0
    while len(cuts) > 1:
        half = len(cuts) // 2
        left, right = cuts[:half], cuts[half:]
        a = min(losses[i] for i in left)
        b = min(losses[i] for i in right)
        s = integer_scale(n, depth)
        assert (s - 1)**4 * 2**depth < 128**4 * n**2 <= s**4 * 2**depth
        error = Fraction(s, 2 * (s + abs(a - b)))
        probability = error if a > b else 1 - error
        cuts = left if Fraction(draws(width), grid) < probability else right
        depth += 1
    i = cuts[0]
    if i == n:
        return max(x for x, _ in sample) + 1, "infinity"
    x, tag, _ = rows[i]
    if tag < grid // 2:
        return x, "closed"
    larger = [v for v, _ in sample if v > x]
    return (min(larger), "successor") if larger else (x + 1, "open maximum")


def main():
    rng = Random(239)
    counts = {}
    for n in range(1, 7):
        width = 8 + 6 * n.bit_length()
        grid = 2**width
        height = (2 * (n + 1) - 1).bit_length()
        limit = n + 1 + height
        for boundaries in product((0, 1), repeat=n - 1):
            xs = [Fraction(-3, 7)]
            for step in boundaries:
                xs.append(xs[-1] + Fraction(step, 5))
            for labels in product((0, 1), repeat=n):
                sample = list(zip(xs, labels))
                rng.shuffle(sample)
                for values in ([0] * limit, [grid - 1] * limit,
                               [rng.randrange(grid) for _ in range(limit)]):
                    first, second = Draws(values, width), Draws(values, width)
                    actual = learn_threshold(sample, first)
                    expected, kind = reference(sample, second, width)
                    assert actual == expected and first.count == second.count <= limit
                    counts[kind] = counts.get(kind, 0) + 1
    assert set(counts) == {"collision", "infinity", "closed", "successor", "open maximum"}
    print(sum(counts.values()), "matching runs", counts)


if __name__ == "__main__":
    main()
