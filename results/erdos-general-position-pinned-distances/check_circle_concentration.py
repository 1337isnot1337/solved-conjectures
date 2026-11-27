"""Check the mixed-circle argument exactly on integer-coordinate fixtures."""

from collections import Counter
from itertools import permutations, product


def add(*terms):
    return sum(x for x, _ in terms), sum(y for _, y in terms)


def scale(factor, z):
    return factor * z[0], factor * z[1]


def multiply(z, w):
    x, y = z
    a, b = w
    return x * a - y * b, x * b + y * a


def norm(z):
    return z[0] ** 2 + z[1] ** 2


def distance(a, b):
    return norm((a[0] - b[0], a[1] - b[1]))


def check(condition, explanation):
    if not condition:
        raise ValueError(explanation)


def middle(radius, pin, outside):
    """R^3 times the quadratic's middle coefficient in unit coordinates."""
    return add(scale(radius**2, outside),
               scale(radius**2 - norm(outside), pin),
               multiply((outside[0], -outside[1]), multiply(pin, pin)))


def check_fixture(radius, circle, outside):
    zero = (0, 0)
    pins_by_incidence = {}
    direct = set()
    tested = 0
    for pin, base, z in product(circle, circle, outside):
        polynomial = add(scale(radius**2, add(multiply(base, base), multiply(pin, pin))),
                         scale(-1, multiply(middle(radius, pin, z), base)))
        equal = distance(pin, base) == distance(pin, z)
        check((polynomial == zero) == equal, (pin, base, z, polynomial))
        tested += 1
        if equal:
            direct.add((pin, base, z))
            pins_by_incidence.setdefault((base, z), set()).add(pin)
    check(all(len(pins) <= 2 for pins in pins_by_incidence.values()), "pin fiber")
    branches = {}
    for z in outside:
        if z == zero:
            continue
        roots_on_fixture = set()
        for u in outside:
            mid = middle(radius, u, z)
            shift = scale(2 * radius**2, u)
            factors = multiply(add(mid, scale(-1, shift)), add(mid, shift))
            expanded = add(multiply(mid, mid), scale(-4 * radius**4, multiply(u, u)))
            check(factors == expanded, (z, u, "discriminant factors"))
            if factors == zero:
                roots_on_fixture.add(u)
        check(z in roots_on_fixture and len(roots_on_fixture) <= 4, (z, roots_on_fixture))
        check(norm(z) != radius**2, (z, "simple root"))
        branches[z] = roots_on_fixture
    second_moment = 0
    fibers = Counter()
    for pin in circle:
        witnesses = {}
        for x, base, z in sorted(direct):
            if pin == x and z != zero:
                witnesses.setdefault(z, base)
        second_moment += len(witnesses) * (len(witnesses) - 1)
        for z, w in permutations(witnesses, 2):
            fibers[z, w, witnesses[z], witnesses[w]] += 1
    check(second_moment == sum(fibers.values()), "second factorial moment")
    check(max(fibers.values(), default=0) <= 2, "two-pin incidence bound")
    return tested, len(direct), second_moment


def local_cap_example():
    # A radius-three pin with a multiplicity-three class and four points
    # on the fixed circle. The fixed circle's center is absent.
    circle = [(-3, 0), (3, 0), (0, 3), (0, -3)]
    outside = [(3, 6), (6, 0), (4, 1), (-3, -6)]
    sites = circle + outside
    multiplicities = Counter()
    for pin in sites:
        grouped = Counter(distance(pin, p) for p in sites if p != pin)
        multiplicities.update(grouped.values())
    check(max(multiplicities) == 3, "site-centered cap")
    a1, a2 = multiplicities[1], multiplicities[2]
    count = sum(multiplicities.values())
    n = len(sites)
    check(3 * count - n * (n - 1) == 2 * a1 + a2, "radius-class identity")
    _, witnessed, _ = check_fixture(3, circle, outside)
    check(a1 + 2 * a2 >= len(circle) * (len(circle) - 1) - witnessed, "circle excess")
    return n, multiplicities[3]


def main():
    radius = 5
    circle = [(x, y) for x, y in product(range(-5, 6), repeat=2)
              if x*x + y*y == radius**2]
    outside = [(x, y) for x, y in product(range(-9, 10), repeat=2)
               if x*x + y*y != radius**2]
    # Include |z|/R=3, where the second discriminant factor has a double root.
    outside += [(15, 0), (0, -15), (9, 12), (-9, -12)]
    tested, mixed, incidence = check_fixture(radius, circle, outside)
    n, triples = local_cap_example()
    print(f"{tested:,} equal-distance equations, {mixed:,} mixed triples")
    print(f"{incidence:,} ordered common-pin parameter pairs")
    print(f"Local capacity-three fixture: {n} sites and {triples} full classes")


if __name__ == "__main__":
    main()
