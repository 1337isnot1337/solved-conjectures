"""Exact profile checks for heterogeneous components and selected rare edges."""

from collections import Counter, deque
from itertools import product


def matchings(colours, left, right):
    """Yield coloured matchings covering exactly the specified two sides."""
    if not left:
        assert not right
        yield ()
        return
    x, *rest = left
    for colour, perm in enumerate(colours):
        y = perm[x]
        if y in right:
            for tail in matchings(colours, rest, right - {y}):
                yield ((colour, x, y), *tail)


def profile(matching, width):
    counts = Counter(colour for colour, _, _ in matching)
    return tuple(counts[i] for i in range(width))


def shifts(order, offsets):
    return [tuple((x + shift) % order for x in range(order)) for shift in offsets]


def span(vectors, modulus, width):
    zero = (0,) * width
    reached = {zero}
    queue = deque([zero])
    while queue:
        point = queue.popleft()
        for delta in vectors:
            following = tuple((a + b) % modulus for a, b in zip(point, delta))
            if following not in reached:
                reached.add(following)
                queue.append(following)
    return reached


def check_exposure(factors, modulus):
    width = len(factors[0])
    differences = set()
    for colours in factors:
        order = len(colours[0])
        for matching in matchings(colours, list(range(order)), set(range(order))):
            p = profile(matching, width)
            differences.add((p[0] - order, *p[1:]))
    group = span(differences, modulus, width)

    def coset(p):
        return min(tuple((a + b) % modulus for a, b in zip(p, d)) for d in group)

    checks = 0
    for colours in factors:
        order = len(colours[0])
        expected = {
            coset(p) for p in product(range(modulus), repeat=width)
            if sum(p) % modulus == (order - 1) % modulus
        }
        for y in range(order):
            actual = set()
            for x in range(order):
                left = [v for v in range(order) if v != x]
                right = set(range(order)) - {y}
                actual.update(coset(profile(m, width)) for m in matchings(colours, left, right))
            assert actual == expected, (order, width, modulus, y)
            checks += 1
    return checks


def check_rare_arcs():
    sizes = (3, 3, 6, 3, 6, 6, 6, 6)
    total = sum(sizes)
    sides = []
    left = []
    for size in sizes:
        sides.append(tuple(range(len(left), len(left) + size)))
        left.extend(sides[-1])
    colour_one = tuple(y for side in sides for y in side[1:] + side[:1])
    abundant = [tuple(left), colour_one]
    rare = tuple((x + 2) % total for x in left)
    assert all(len({x, colour_one[x], rare[x]}) == 3 for x in left)

    # One cycle of length one in the quotient and one arc between two other components.
    two_rare_edges = ((2, 0, rare[0]), (2, 5, rare[5]))
    fixed_right_hole = 3
    supported = {}
    for left_hole in sides[2]:
        used_left = {x for _, x, _ in two_rare_edges} | {left_hole}
        used_right = {y for _, _, y in two_rare_edges} | {fixed_right_hole}
        choices = [
            list(matchings(abundant, [v for v in side if v not in used_left], set(side) - used_right))
            for side in sides
        ]
        assert all(choices)
        for selection in product(*choices):
            matching = (*two_rare_edges, *(e for part in selection for e in part))
            p = profile(matching, 3)
            assert len(matching) == total - 1
            assert len({x for _, x, _ in matching}) == len(matching)
            assert len({y for _, _, y in matching}) == len(matching)
            for colour, x, y in matching:
                assert [*abundant, rare][colour][x] == y
            supported[p] = matching
    assert {p[0] % 3 for p in supported} == {0, 1, 2}
    assert all((count, total - 3 - count, 2) in supported for count in range(12, 20))
    return len(supported)


def main():
    checks = check_exposure([shifts(3, (0, 1)), shifts(6, (0, 1))], 6)
    checks += check_exposure([shifts(4, (0, 1, 2)), shifts(6, (0, 2, 3))], 4)
    checks += check_exposure([shifts(4, (0, 1, 2, 3)), shifts(5, (0, 1, 2, 3))], 5)
    profiles = check_rare_arcs()
    print(f"{checks} fixed-hole residue checks and {profiles} exact profiles with rare edges passed.")


if __name__ == "__main__":
    main()
