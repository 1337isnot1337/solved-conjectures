#!/usr/bin/env python3
"""Check the two-bisector injection on every eligible subset of the 4 by 4 grid.

Run with Python 3.10 or later. A subset must have at least four sites and
contain no four on a genuine circle. Four collinear sites are allowed.

Expected counts: 5,516 eligible sets, 1,760 centered triangles, 5,280 pairs
of side bisectors, 720 triangles with two 2-rich bisectors, eight with two
3-rich bisectors, and none with two 4-rich bisectors. These finite checks
exercise the injection and do not establish the asymptotic estimate.
"""

from collections import Counter, defaultdict
from itertools import combinations, product
from math import gcd

Point = tuple[int, int]
Line = tuple[int, int, int]
GRID = tuple(product(range(4), repeat=2))


def norm2(p: Point) -> int:
    return p[0] * p[0] + p[1] * p[1]


def minus(p: Point, q: Point) -> Point:
    return p[0] - q[0], p[1] - q[1]


def cross(p: Point, q: Point) -> int:
    return p[0] * q[1] - p[1] * q[0]


def cocircular(a: Point, b: Point, c: Point, d: Point) -> bool:
    # Translating d to the origin gives a three-row lifted determinant.
    # A zero determinant for four collinear sites describes no genuine circle.
    if cross(minus(b, a), minus(c, a)) == 0:
        return False
    u, v, w = minus(a, d), minus(b, d), minus(c, d)
    return cross(u, v) * norm2(w) - cross(u, w) * norm2(v) + cross(v, w) * norm2(u) == 0


def bisector(p: Point, q: Point) -> Line:
    # Canonical primitive integer coefficients of ax + by = c.
    a, b = 2 * (q[0] - p[0]), 2 * (q[1] - p[1])
    c = norm2(q) - norm2(p)
    common = gcd(a, b, c)
    if (a, b) < (0, 0):
        common = -common
    return a // common, b // common, c // common


def grid_circumcenter(a: Point, b: Point, c: Point) -> Point | None:
    # Independent of pin-radius grouping. Solve the two linear distance
    # equations by Cramer's rule and keep only centers in the integer grid.
    u, v = minus(b, a), minus(c, a)
    denom = 2 * cross(u, v)
    if denom == 0:
        return None
    h, k = norm2(b) - norm2(a), norm2(c) - norm2(a)
    px, py = h * v[1] - k * u[1], u[0] * k - v[0] * h
    if px % denom or py % denom:
        return None
    candidate = px // denom, py // denom
    return candidate if candidate in GRID else None


def bitmask(indices) -> int:
    return sum(1 << index for index in indices)


def main() -> None:
    indices = range(len(GRID))
    forbidden = [bitmask(four) for four in combinations(indices, 4)
                 if cocircular(*(GRID[i] for i in four))]
    distances = [[norm2(minus(p, q)) for q in GRID] for p in GRID]
    axes = {}
    axis_sites = {}
    for i, j in combinations(indices, 2):
        axis = bisector(GRID[i], GRID[j])
        axes[i, j] = axis
        a, b, c = axis
        on_line = bitmask(k for k, (x, y) in enumerate(GRID) if a * x + b * y == c)
        equidistant = bitmask(k for k in indices if distances[k][i] == distances[k][j])
        if on_line != equidistant:
            raise ValueError(f"Incorrect bisector for {GRID[i]}, {GRID[j]}")
        axis_sites[axis] = on_line

    circumcenters = {}
    for triangle in combinations(indices, 3):
        center = grid_circumcenter(*(GRID[i] for i in triangle))
        if center is not None:
            pin = GRID.index(center)
            circumcenters[pin, triangle] = bitmask((*triangle, pin))

    eligible = centered = charged = 0
    rich_counts = Counter()
    for mask in range(1 << len(GRID)):
        if mask.bit_count() < 4 or any(mask & four == four for four in forbidden):
            continue
        eligible += 1
        sites = [i for i in indices if mask & (1 << i)]
        triangles = set()
        seen_charges = set()
        for pin in sites:
            radii = defaultdict(list)
            for site in sites:
                if site != pin:
                    radii[distances[pin][site]].append(site)
            for bases in radii.values():
                if len(bases) > 3:
                    raise ValueError(f"Circle test missed four sites at pin {GRID[pin]}")
                if len(bases) != 3:
                    continue
                triangles.add((pin, tuple(bases)))
                sides = [axes[i, j] for i, j in combinations(bases, 2)]
                for first, second in combinations(sides, 2):
                    charge = tuple(sorted((first, second)))
                    if charge in seen_charges:
                        raise ValueError(f"Repeated pair of axes in set {mask}: {charge}")
                    seen_charges.add(charge)
                richness = sorted((axis_sites[line] & mask).bit_count() for line in sides)
                for threshold in range(2, richness[1] + 1):
                    rich_counts[threshold] += 1

        independent = {entry for entry, needed in circumcenters.items() if mask & needed == needed}
        if triangles != independent or len(seen_charges) != 3 * len(independent):
            raise ValueError(f"Pin-radius and circumcenter counts disagree on set {mask}")
        centered += len(triangles)
        charged += len(seen_charges)

    actual = (eligible, centered, charged, dict(rich_counts))
    expected = (5516, 1760, 5280, {2: 720, 3: 8})
    if actual != expected:
        raise ValueError(f"Unexpected grid counts: {actual}, expected {expected}")
    print(f"{eligible} eligible sets, {centered} centered triangles, {charged} unique within-set charges")
    print(f"Two rich bisectors: K=2: {rich_counts[2]}, K=3: {rich_counts[3]}, K>=4: 0")


if __name__ == "__main__":
    main()
