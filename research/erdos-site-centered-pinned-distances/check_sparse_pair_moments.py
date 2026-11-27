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


if __name__ == "__main__":
    for m in range(3, 16, 2):
        cases, count = check_polygon(m)
        print(f"m={m}: {cases} subsets, {count} trapezoids in the full polygon")
