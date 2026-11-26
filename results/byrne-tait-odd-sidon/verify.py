"""Check the coset-action proof in two explicit finite group families."""

from collections import Counter
from fractions import Fraction
from itertools import permutations, product


def check_group(modulus, nonnormal):
    # The cyclic group of order three rotates the coordinates of Z_m^3.
    # In the second example take its direct product with S_3.
    identity = (0, 1, 2) if nonnormal else (0,)
    perm_group = list(permutations(identity))
    points = list(product(range(3), identity))
    index = len(points)
    letters = [((i, 0, 0), 1, identity) for i in range(modulus)]

    def multiply(left, right):
        vector, shift, perm = left
        other, step, action = right
        image = tuple((v + other[(i - shift) % 3]) % modulus for i, v in enumerate(vector))
        return image, (shift + step) % 3, tuple(perm[j] for j in action)

    def coset_image(element, point):
        _, shift, perm = element
        phase, label = point
        return (phase + shift) % 3, perm[label]

    universe = set(product(product(range(modulus), repeat=3), range(3), perm_group))
    assert len(universe) == 3 * modulus**3 * len(perm_group)
    words = Counter(multiply(multiply(a, b), c) for a, b, c in product(letters, repeat=3))
    assert len(words) == modulus**3 and all(count == 1 for count in words.values())
    complement = universe.difference(words)
    for point in points:
        uniform = Counter(coset_image(g, point) for g in universe)
        assert all(uniform[image] == len(universe) // index for image in points)
        assert sum(coset_image(a, point) == point for a in letters) <= 1
        walks = Counter(coset_image(a, coset_image(b, coset_image(c, point)))
                        for a, b, c in product(letters, repeat=3))
        assert walks == Counter(coset_image(g, point) for g in words)
        assert walks + Counter(coset_image(g, point) for g in complement) == uniform
    density = Fraction(len(words), len(universe))
    trace_bound = Fraction(modulus - index, modulus * (index - 1))
    assert modulus > index and density * (1 + trace_bound**3) <= 1
    print(f"order {len(universe):,}, index {index}, {len(words):,} distinct ordered triples, density {density}")


if __name__ == "__main__":
    check_group(5, nonnormal=False)
    check_group(11, nonnormal=True)
