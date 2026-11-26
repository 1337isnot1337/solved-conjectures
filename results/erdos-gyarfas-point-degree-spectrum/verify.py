"""Enumerate labelled finite linear spaces and test the incidence inequality."""

from itertools import combinations


def spaces(n):
    """Enumerate all choices of lines of size >=3 with disjoint pair sets."""
    pairs = list(combinations(range(n), 2))
    pair_bits = {pair: 1 << i for i, pair in enumerate(pairs)}
    candidates = [
        (block, sum(pair_bits[pair] for pair in combinations(block, 2)))
        for size in range(3, n)
        for block in combinations(range(n), size)
    ]

    def visit(start, used, large_lines):
        ordinary = [pair for pair in pairs if not used & pair_bits[pair]]
        yield [*large_lines, *ordinary]
        for i in range(start, len(candidates)):
            block, mask = candidates[i]
            if not used & mask:
                yield from visit(i + 1, used | mask, [*large_lines, block])

    yield from visit(0, 0, [])


def check_sets(n, lines, degrees, low, high):
    t = len(low)
    low_sum = sum(degrees[p] for p in low)
    high_deficit = sum(n - 1 - degrees[p] for p in high)
    surplus = low_sum + high_deficit - t * t
    cross_pairs = line_surplus = 0
    for line in lines:
        a = len(low.intersection(line))
        b = len(high.intersection(line))
        local = a + b * (len(line) - 2) - a * b
        assert local >= 0
        if a >= 1 and b >= 2:
            assert local >= max(a, (b - 1) ** 2)
        line_surplus += local
        cross_pairs += a * b
    assert cross_pairs == t * t and line_surplus == surplus
    assert max(0, t * t - low_sum) ** 2 <= (t * (t - 1) + surplus) * surplus


def check_order(n):
    count = tested_sets = 0
    largest_spectrum = 0
    vertices = set(range(n))
    for lines in spaces(n):
        count += 1
        degrees = [0] * n
        for line in lines:
            for point in line:
                degrees[point] += 1
        representatives = {degree: p for p, degree in enumerate(degrees)}
        ordered = [representatives[d] for d in sorted(representatives)]
        f = len(ordered)
        largest_spectrum = max(largest_spectrum, f)
        assert 17 * f <= 16 * n - 13
        if n <= 5:
            for t in range(1, n // 2 + 1):
                for low_points in combinations(range(n), t):
                    low = set(low_points)
                    for high_points in combinations(sorted(vertices - low), t):
                        check_sets(n, lines, degrees, low, set(high_points))
                        tested_sets += 1
        elif len(ordered) >= 2:
            t = f // 2
            check_sets(n, lines, degrees, set(ordered[:t]), set(ordered[-t:]))
            tested_sets += 1
    print(f'n={n}: {count} labelled spaces, maximum spectrum {largest_spectrum}, {tested_sets} set comparisons')


if __name__ == '__main__':
    for order in range(3, 8):
        check_order(order)
