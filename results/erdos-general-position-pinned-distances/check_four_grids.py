"""Exact rational realizations of the four-grid active-bisector example."""

from collections import Counter, defaultdict
from fractions import Fraction
from itertools import combinations, product
from math import gcd, lcm


def add(z, w):
    return z[0] + w[0], z[1] + w[1]


def scale(factor, z):
    return factor * z[0], factor * z[1]


def multiply(z, w):
    x, y = z
    u, v = w
    return x * u - y * v, x * v + y * u


def conjugate(z):
    return z[0], -z[1]


def norm(z):
    return z[0] ** 2 + z[1] ** 2


def squared_distance(z, w):
    return (z[0] - w[0]) ** 2 + (z[1] - w[1]) ** 2


def require(test, message):
    if not test:
        raise ValueError(message)


def grids(size):
    indices = range(1, size + 1)
    sums = range(2, 2 * size + 1)
    gamma = -Fraction(1, 2), Fraction(3191, 17)
    reciprocal = scale(1 / norm(gamma), conjugate(gamma))
    imaginary_reciprocal = -reciprocal[1], reciprocal[0]
    gamma_plus_one = add(gamma, (1, 0))
    rotation = multiply(gamma, scale(1 / norm(gamma_plus_one), conjugate(gamma_plus_one)))
    require(norm(rotation) == 1, "unit rotation")
    require(multiply(rotation, reciprocal) == add((1, 0), scale(-1, rotation)), "rotation identity")
    offset = Fraction(10395671), Fraction(3836119)

    pins = {(a, b): add((0, a), scale(b, gamma)) for a, b in product(indices, indices)}
    bases = {
        (u, v): add(offset, add((u, 0), scale(v, imaginary_reciprocal)))
        for u, v in product(indices, indices)
    }
    reflections = {
        (j, v): scale(-1, conjugate(add(offset, add((j, 0), scale(v, imaginary_reciprocal)))))
        for j, v in product(sums, indices)
    }
    rotations = {
        (j, k): multiply(rotation, add(offset, add((j, 0), scale(k, imaginary_reciprocal))))
        for j, k in product(sums, sums)
    }

    total = 0
    for (a, b), x in pins.items():
        for (u, v), y in bases.items():
            reflected, rotated = reflections[u + b, v], rotations[u + b, v + a]
            require(add((2 * x[0], 0), scale(-1, conjugate(y))) == reflected, "reflected mate")
            require(add(x, multiply(rotation, add(y, scale(-1, x)))) == rotated, "rotated mate")
            require(squared_distance(x, y) == squared_distance(x, reflected) == squared_distance(x, rotated),
                    "equal radii")
            total += 1

    sites = [site for grid in (pins, bases, reflections, rotations) for site in grid.values()]
    denominator = lcm(*(Fraction(value).denominator for site in sites for value in site))
    return [(int(x * denominator), int(y * denominator)) for x, y in sites], total


def maximum_center_multiplicity(sites):
    # A circle through the chosen site and k further sites counts C(k, 2) times.
    maximum = 0
    for px, py in sites:
        vectors = [(x - px, y - py) for x, y in sites if (x, y) != (px, py)]
        centers = Counter()
        for (a, b), (c, d) in combinations(vectors, 2):
            denominator = 2 * (a * d - b * c)
            if not denominator:
                continue
            first_squared = a * a + b * b
            second_squared = c * c + d * d
            u = first_squared * d - b * second_squared
            v = a * second_squared - c * first_squared
            factor = gcd(u, v, denominator)
            if denominator < 0:
                factor = -factor
            centers[u // factor, v // factor, denominator // factor] += 1
        maximum = max(maximum, max(centers.values(), default=0))
    return maximum


def check(size):
    sites, full = grids(size)
    n = len(sites)
    require(len(set(sites)) == n == 8 * size * size - 5 * size + 1, "grid size")
    cap = 0
    pinned = []
    active = Counter()
    for pin in sites:
        radii = defaultdict(list)
        for site in sites:
            if pin != site:
                radii[squared_distance(pin, site)].append(site)
        cap = max(cap, max(map(len, radii.values())))
        pinned.append(len(radii))
        for group in radii.values():
            if len(group) == 3:
                active.update(combinations(sorted(group), 2))
    require(cap == 3, "site-centered capacity")
    base_grid_counts = pinned[size ** 2:2 * size ** 2]
    require(min(base_grid_counts) >= size ** 2 + (2 * size - 1) ** 2, "pinned counts")
    require(maximum_center_multiplicity(sites) == 3, "global circle cap of four is attained")

    axes = defaultdict(list)
    for (first, second), completions in active.items():
        if first[1] == second[1]:
            axes[first[0] + second[0]].append(completions)
    discount, nominations = 1, 2
    excess = sum(
        max(completions - discount, 0)
        for counts in axes.values()
        for completions in sorted(counts, reverse=True)[nominations:]
    )
    require(excess >= size * (size ** 2 - nominations) * (size - discount), "surviving horizontal pairs")
    print(f"m={size}, n={n}, site/global circle caps 3/4, {full} designated triples, "
          f"vertical-axis excess R_{{1,2}}={excess}, total pinned count {sum(pinned)}")


if __name__ == "__main__":
    for size in (2, 3, 4):
        check(size)
