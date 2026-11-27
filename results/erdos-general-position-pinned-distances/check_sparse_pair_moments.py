"""Check the polygon example using cyclic chord directions and opposite side pairs."""
from itertools import combinations
from math import comb


def reflection_count(polygon, sites):
    frequencies = [0] * polygon
    for left, right in combinations(sites, 2):
        frequencies[(left + right) % polygon] += 1
    return sum(comb(count, 2) for count in frequencies)


def opposite_sides(polygon, vertices):
    a, b, c, d = sorted(vertices)
    return ((a + b - c - d) % polygon == 0
            or (a + d - b - c) % polygon == 0)


def check_polygon(polygon):
    all_sites = list(range(polygon))
    quadruples = [sum(1 << x for x in quad) for quad in combinations(all_sites, 4)
                  if opposite_sides(polygon, quad)]
    expected = polygon * comb((polygon - 1) // 2, 2)
    if len(quadruples) != expected:
        raise ValueError((polygon, "full polygon", len(quadruples), expected))
    for mask in range(1 << polygon):
        sites = [i for i in all_sites if mask & (1 << i)]
        observed = sum(mask & quad == quad for quad in quadruples)
        reflected = reflection_count(polygon, sites)
        pairs = comb(len(sites), 2)
        if observed != reflected or 2 * polygon * observed < pairs * pairs - polygon * pairs:
            raise ValueError((polygon, mask, observed, reflected, pairs))
    return 1 << polygon, expected


def polar_count(shells, polygon):
    sites = [(r, a) for r in range(shells) for a in range(polygon)]
    count = 0
    for quad in combinations(sites, 4):
        radii = sorted({r for r, _ in quad})
        if len(radii) == 1:
            count += opposite_sides(polygon, [a for _, a in quad])
        elif len(radii) == 2:
            first = [a for r, a in quad if r == radii[0]]
            second = [a for r, a in quad if r == radii[1]]
            count += len(first) == 2 and (sum(first) - sum(second)) % polygon == 0
    expected = polygon * comb(shells * ((polygon - 1) // 2), 2)
    if count != expected:
        raise ValueError((shells, polygon, count, expected))
    return count


if __name__ == "__main__":
    for m in range(3, 16, 2):
        cases, count = check_polygon(m)
        print(f"m={m}: {cases} subsets, {count} trapezoids in the full polygon")

    for m in (3, 5, 7):
        print(f"polar {m} by {m}: {polar_count(m, m)} trapezoids")
