"""Check exact rational near-diameter examples and the two-level incidence data."""

from collections import Counter
from fractions import Fraction
from itertools import combinations, product
from math import gcd, isqrt, lcm
from random import Random


def require(test, message):
    if not test:
        raise ValueError(message)


def states(k):
    options = [sum(1 << i for i in choice)
               for size in (2, 3) for choice in combinations(range(5), size)]
    blocks = 2 * k - 1
    result = []
    for choices in product(options, repeat=blocks):
        large = sum(choice.bit_count() == 3 for choice in choices)
        if large in (k - 1, k):
            result.append(sum(choice << (5 * j) for j, choice in enumerate(choices)))
    return result


def one_mark_graph(masks, k):
    occupied = set(masks)
    number_of_marks = 5 * (2 * k - 1)
    degree_sum = 0
    two_step_pairs = set()
    lower = min(mask.bit_count() for mask in masks)
    for mask in masks:
        neighbors = [(i, mask ^ (1 << i)) for i in range(number_of_marks)
                     if mask ^ (1 << i) in occupied]
        sizes = Counter(i // 5 for i, _ in neighbors)
        require(sorted(sizes.values()) == [3] * k, 'wrong repeated block sizes')
        degree_sum += len(neighbors)
        if mask.bit_count() == lower:
            for pair in combinations(sorted(target for _, target in neighbors), 2):
                require(pair not in two_step_pairs, 'four-cycle in adjacent levels')
                two_step_pairs.add(pair)
    return degree_sum // 2


def direction(t):
    return (1 - t * t) / (1 + t * t), 2 * t / (1 + t * t)


def sites(masks, k):
    random = Random(415 + k)
    lengths = [Fraction(100000 + i, 100000) for i in range(2 * k - 1)]
    vectors = []
    for length in lengths:
        for _ in range(5):
            t = Fraction(random.randrange(1, 80), random.randrange(40000, 51000))
            x, y = direction(t)
            vectors.append((length * x, length * y))
    scale = lcm(*(coordinate.denominator for vector in vectors for coordinate in vector))
    lattice_vectors = [(int(x * scale), int(y * scale)) for x, y in vectors]
    points = []
    for mask in masks:
        moves = [v for i, v in enumerate(lattice_vectors) if mask & (1 << i)]
        points.append(tuple(map(sum, zip(*moves))))
    radii = {int(scale * length) ** 2 for length in lengths}
    return points, radii


def distance_square(p, q):
    return (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2


def diameter_square(points):
    def turn(a, b, c):
        return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])

    def half_chain(ordered):
        chain = []
        for point in ordered:
            while len(chain) >= 2 and turn(chain[-2], chain[-1], point) <= 0:
                chain.pop()
            chain.append(point)
        return chain

    ordered = sorted(set(points))
    hull = half_chain(ordered)[:-1] + half_chain(reversed(ordered))[:-1]
    return max(distance_square(a, b) for a, b in combinations(hull, 2))


def pinned_checks(points, selected, radii, k):
    diameter = diameter_square(points)
    require(10000 * min(radii) > 9801 * diameter, 'radius below global diameter cutoff')
    checks = 0
    for index in selected:
        pin = points[index]
        histogram = Counter(distance_square(pin, target) for target in points if target != pin)
        repeats = {distance for distance, size in histogram.items() if size == 3}
        require(len(repeats) == k and repeats <= radii, 'incorrect triple radius')
        require(len(histogram) == len(points) - 1 - 2 * k, 'an unexplained radius collision')
        checks += sum(histogram.values())
    return checks


def integer_line(a, b, c):
    factor = gcd(a, b, c)
    if a < 0 or (a == 0 and b < 0):
        factor = -factor
    return a // factor, b // factor, c // factor


def check_geometry(points):
    axes = {}
    carriers = set()
    for p, q in combinations(points, 2):
        dx, dy = q[0] - p[0], q[1] - p[1]
        axis = integer_line(2 * dx, 2 * dy, dx * (p[0] + q[0]) + dy * (p[1] + q[1]))
        carrier = integer_line(-dy, dx, -dy * p[0] + dx * p[1])
        require(axes.setdefault(axis, carrier) == carrier, 'transverse reflected pairs')
        require(carrier not in carriers, 'three collinear sites')
        carriers.add(carrier)
    return len(carriers)


def two_copies(points, radii):
    c, s = direction(Fraction(3, 50021))
    displacement = (Fraction(1, 1000), Fraction(1, 791))
    scale = next(iter(radii))
    unit = isqrt(scale)
    require(unit ** 2 == scale, 'unit denominator')
    moved = [(c * x - s * y + unit * displacement[0],
              s * x + c * y + unit * displacement[1]) for x, y in points]
    multiplier = lcm(*(a.denominator for point in moved for a in point))
    total = [(int(multiplier * x), int(multiplier * y)) for x, y in [*points, *moved]]
    return total, {scale * multiplier ** 2}


def main():
    for k in (1, 2):
        masks = states(k)
        edges = one_mark_graph(masks, k)
        points, radii = sites(masks, k)
        require(len(set(points)) == len(masks), 'coincident sites')
        full = k == 1
        selected = range(len(points)) if full else range(0, len(points), 113)
        checks = pinned_checks(points, selected, radii, k)
        sample = points if full else points[::89]
        pairs = check_geometry(sample)
        print(f'k={k}: {len(points)} vertices, {edges} one-mark edges, '
              f'{checks} pin-target comparisons, {pairs} bisectors tested')
        if full:
            merged, common_radii = two_copies(points, radii)
            checks = pinned_checks(merged, range(len(merged)), common_radii, 1)
            pairs = check_geometry(merged)
            print(f'two rational copies: {checks} pin-target comparisons, {pairs} bisectors')


if __name__ == '__main__':
    main()
