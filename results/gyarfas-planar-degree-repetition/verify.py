"""Count the actual affine lines through each point using exact integer arithmetic."""

from collections import Counter
from itertools import combinations
from math import gcd


def line_through(first, second):
    """Primitive, sign-normalized line through two points in homogeneous coordinates."""
    x, y, z = first
    u, v, w = second
    coefficients = (y * w - z * v, z * u - x * w, x * v - y * u)
    divisor = gcd(*coefficients)
    assert divisor, (first, second)
    if next(value for value in coefficients if value) < 0:
        divisor = -divisor
    return tuple(value // divisor for value in coefficients)


def check_order(n):
    k, extra = divmod(n, 2)
    heights = [0, *range(2, k), 2 * k - 3]
    if extra:
        heights.append(-1)
    points = [(1, i * i, i + 1) for i in range(k)]
    points.extend((0, height, 1) for height in heights)
    assert len(points) == n and all(z > 0 for _, _, z in points)

    incident_lines = [set() for _ in points]
    for i, j in combinations(range(n), 2):
        line = line_through(points[i], points[j])
        incident_lines[i].add(line)
        incident_lines[j].add(line)
    degrees = [len(lines) for lines in incident_lines]

    cutoff = (k - 1) // 2
    for i in range(k):
        triples = k - i - (i <= cutoff) - (i <= 1) + (i >= k - 2)
        assert degrees[i] == n - 1 - triples, (n, i, degrees[i])
    for degree, s in zip(degrees[k:], heights, strict=True):
        pair_count = 1 if s == 2 * k - 3 else (s + 1) // 2
        assert degree == k + 1 - pair_count, (n, s, degree)

    frequencies = Counter(degrees)
    assert max(frequencies.values()) == 2, (n, frequencies)
    assert len(frequencies) == k + k // 2 - 3 + extra, (n, frequencies)
    return frequencies


if __name__ == '__main__':
    orders = [*range(16, 129), 255, 256, 257]
    for n in orders:
        frequencies = check_order(n)
        if n in (16, 17):
            print(f'n={n}: {dict(sorted(frequencies.items()))}')
    print(f'Checked exact line degrees at {len(orders)} orders: 16 through 128 and 255 through 257.')
