"""Check the sparse-trapezoid incidence counts on exact planar subsets."""

from collections import defaultdict
from itertools import combinations, product
from math import comb, gcd


def require(value, message):
    if not value:
        raise ValueError(message)


def normalized(a, b, c):
    factor = gcd(a, b, c)
    if a < 0 or (a == 0 and b < 0):
        factor = -factor
    return a // factor, b // factor, c // factor


def pair_lines(p, q):
    dx = q[0] - p[0]
    dy = q[1] - p[1]
    twice_midpoint = p[0] + q[0], p[1] + q[1]
    axis = normalized(2 * dx, 2 * dy, dx * twice_midpoint[0] + dy * twice_midpoint[1])
    carrier = normalized(-dy, dx, -dy * p[0] + dx * p[1])
    return axis, carrier


def noncollinear_trapezoid(quad):
    # Independent test: the four sites are concyclic and opposite segments parallel.
    p, *others = quad
    (a, b), (c, d), (e, f) = [(q[0] - p[0], q[1] - p[1]) for q in others]
    area = a * d - b * c
    if not area:
        return False
    circle = ((a * a + b * b) * (c * f - d * e) -
              (c * c + d * d) * (a * f - b * e) + (e * e + f * f) * area)
    if circle:
        return False
    for s, t, u in ((others[0], others[1], others[2]), (others[1], others[0], others[2]),
                    (others[2], others[0], others[1])):
        if (p[0] - s[0]) * (t[1] - u[1]) == (p[1] - s[1]) * (t[0] - u[0]):
            return True
    return False


def geometry(bases):
    axes = defaultdict(lambda: defaultdict(list))
    for first, second in combinations(bases, 2):
        axis, carrier = pair_lines(first, second)
        axes[axis][carrier].append((first, second))
    seen = set()
    pairings = 0
    off_carrier = {}
    for axis, carriers in axes.items():
        total = sum(map(len, carriers.values()))
        omitted = total - max(map(len, carriers.values()))
        off_carrier[axis] = omitted
        axis_pairings = 0
        for group1, group2 in combinations(carriers.values(), 2):
            for first, second in product(group1, group2):
                sites = tuple(sorted(first + second))
                require(len(set(sites)) == 4, "disjoint reflected pairs")
                seen.add(sites)
                axis_pairings += 1
        require(omitted ** 2 <= 2 * axis_pairings, "single-axis bound")
        pairings += axis_pairings
    independent = {tuple(sorted(quad)) for quad in combinations(bases, 4) if noncollinear_trapezoid(quad)}
    require(seen == independent, "trapezoid witnesses and cyclic determinant disagree")
    require(pairings <= 3 * len(seen), "pairing multiplicity")
    require(sum(t * t for t in off_carrier.values()) <= 6 * len(seen), "global carrier bound")
    return len(seen), pairings, off_carrier


def main():
    fixtures = [
        (((-2, 0), (2, 0), (-1, 2), (1, 2)), (1, 1)),
        (((0, 0), (3, 0), (0, 2), (3, 2)), (1, 2)),
        (((0, 0), (1, 0), (0, 1), (1, 1)), (1, 2)),
        (((-2, 0), (-1, 0), (1, 0), (2, 0)), (0, 0)),
        (((5, 0), (4, 3), (3, 4), (-3, 4)), (0, 0)),
    ]
    for sites, expected in fixtures:
        require(geometry(sites)[:2] == expected, "boundary configuration")
    grid = tuple(product(range(3), repeat=2))
    subsets = [tuple(s for i, s in enumerate(grid) if mask & (1 << i)) for mask in range(1 << len(grid))]
    line_membership = {}
    comparisons = 0
    trapezoids = pairings = 0
    for bases in subsets:
        count, witnesses, off_carrier = geometry(bases)
        trapezoids += count
        pairings += witnesses
        for axis in off_carrier:
            if axis not in line_membership:
                a, b, c = axis
                line_membership[axis] = sum(1 << i for i, (x, y) in enumerate(grid) if a*x + b*y == c)
        weighted = [(line_membership[axis], t) for axis, t in off_carrier.items() if t]
        all_axes = [line_membership[axis] for axis in off_carrier]
        for mask, pins in enumerate(subsets):
            rich_indices = [(mask & line).bit_count() for line in all_axes]
            rich_square_sum = sum(r*r for r in rich_indices if r >= 2)
            require(rich_square_sum <= 4 * comb(len(pins), 2), "pin-line square sum")
            contribution = 0
            single = 0
            for line, weight in weighted:
                r = (mask & line).bit_count()
                if r >= 2:
                    contribution += weight * r
                if r == 1:
                    single += weight
            require(contribution ** 2 <= 24 * comb(len(pins), 2) * count, "discarded rich incidences")
            require(single <= comb(len(bases), 2), "singly pinned discarded incidences")
            comparisons += 1
    print(f"{len(fixtures)} boundary examples; {len(subsets)} grid subsets; {trapezoids} trapezoids "
          f"and {pairings} axis-pairing witnesses across subsets; {comparisons:,} independent pin/base choices.")


if __name__ == "__main__":
    main()
