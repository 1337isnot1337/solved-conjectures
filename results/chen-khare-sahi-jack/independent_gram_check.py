"""Rebuild the degree-five Jack witness and test all Schur generator products.

Polynomials are rational dictionaries in the ordinary power-sum basis.
The Jack construction uses the defining scalar product. The independent
Schur construction uses Jacobi--Trudi, and runs through all strict
dominance differences, including those between nonadjacent partitions.
"""

from collections import Counter
from fractions import Fraction as Q
from functools import cache
from itertools import accumulate, permutations
from math import factorial, prod


def check(condition, message):
    if not condition:
        raise ValueError(message)

ONE = {(): Q(1)}
N = 5
DEGREE = 5


def partitions(size, largest=None):
    if not size:
        yield ()
        return
    for first in range(min(size, largest or size), 0, -1):
        for rest in partitions(size - first, first):
            yield (first,) + rest


def combine(left, right, scale=1):
    result = dict(left)
    for key, value in right.items():
        result[key] = result.get(key, 0) + scale * value
    return {key: value for key, value in result.items() if value}


def multiply(left, right):
    result = {}
    for a, x in left.items():
        for b, y in right.items():
            key = tuple(sorted(a + b, reverse=True))
            result[key] = result.get(key, 0) + x * y
    return {key: value for key, value in result.items() if value}


@cache
def distinct(exponents):
    """Sum over ordered, pairwise different variable indices."""
    if not exponents:
        return ONE
    first, rest = exponents[0], exponents[1:]
    result = multiply({(first,): 1}, distinct(rest))
    for j in range(len(rest)):
        merged = rest[:j] + (rest[j] + first,) + rest[j + 1:]
        result = combine(result, distinct(tuple(sorted(merged, reverse=True))), -1)
    return result


def monomial(shape):
    repeats = prod(factorial(count) for count in Counter(shape).values())
    return {key: value / repeats for key, value in distinct(shape).items()}


@cache
def symmetry_factor(shape):
    return prod(part**count * factorial(count) for part, count in Counter(shape).items())


def inner(left, right, alpha):
    return sum(x * right.get(key, 0) * symmetry_factor(key) * alpha**len(key)
               for key, x in left.items())


def jacks(degree, alpha):
    result = {}
    for shape in sorted(partitions(degree)):
        value = monomial(shape)
        for old in result.values():
            value = combine(value, old, -inner(value, old, alpha) / inner(old, old, alpha))
        result[shape] = value
    return result


@cache
def complete(degree):
    if degree < 0:
        return {}
    return {shape: Q(1, symmetry_factor(shape)) for shape in partitions(degree)}


def schur(shape):
    result = {}
    for order in permutations(range(len(shape))):
        inversions = sum(x > y for j, x in enumerate(order) for y in order[j + 1:])
        term = ONE
        for i, j in enumerate(order):
            term = multiply(term, complete(shape[i] - i + j))
        result = combine(result, term, (-1)**inversions)
    return result


def at_ones(value):
    return sum(x * N**len(key) for key, x in value.items())


def normalized(value):
    norm = at_ones(value)
    return {key: x / norm for key, x in value.items()}


def sign_character(value):
    return sum(x * (-1)**(sum(key) - len(key)) for key, x in value.items())


def dominates(a, b):
    return a != b and all(x >= y for x, y in zip(accumulate(a + (0,)*len(b)),
                                                 accumulate(b + (0,)*len(a))))


def generator_products(generators, budget, start=0, value=ONE, width=0, differences=0):
    if not budget:
        yield value, width, differences
        return
    for j in range(start, len(generators)):
        degree, top, is_difference, factor = generators[j]
        if degree > budget:
            break
        yield from generator_products(generators, budget - degree, j,
                                      multiply(value, factor), width + top,
                                      differences + is_difference)


def main():
    generators = []
    for degree in range(1, DEGREE + 1):
        jack_at_one = jacks(degree, Q(1))
        basis = {}
        for shape in partitions(degree):
            polynomial = schur(shape)
            check(polynomial == jack_at_one[shape], f"Schur normalization for {shape}")
            check(sign_character(polynomial) == int(shape[0] == 1), f"column character for {shape}")
            basis[shape] = normalized(polynomial)
            generators.append((degree, shape[0], 0, basis[shape]))
        for a, upper in basis.items():
            for b, lower in basis.items():
                if dominates(a, b):
                    generators.append((degree, a[0], 1, combine(upper, lower, -1)))

    p = jacks(DEGREE, Q(2, 3))
    a, b = (3, 2), (3, 1, 1)
    check(dominates(a, b), "witness dominance")
    check((at_ones(p[a]), at_ones(p[b])) == (Q(2261, 10), Q(1938, 13)), "Jack normalizations")
    target = combine(normalized(p[a]), normalized(p[b]), -1)
    # Each pair gives the ordinary Schur polynomial and its dimension.
    bases = [(schur(shape), at_ones(schur(shape))) for shape in partitions(DEGREE)]
    weights = (4, 2, 1, 1, 1, 1, 0)

    def separator(value):
        # Ordinary Schur coefficients times dimensions give normalized coordinates.
        return sum(weight * dimension * inner(value, basis, Q(1))
                   for (basis, dimension), weight in zip(bases, weights))

    coordinates = [inner(target, basis, Q(1)) for basis, _ in bases]
    check(coordinates == [0, 0, Q(10, 2261), -Q(79, 13566), Q(1, 13566),
                          -Q(13, 6783), Q(1, 4522)], "all target Schur coordinates")
    check(at_ones(target) == 0 and sign_character(target) == Q(1, 4522), "target column")
    check(separator(target) == -Q(1, 4522), "target separating functional")

    classes = Counter()
    dual_values = {0: [], 1: [], 2: []}
    for value, width, differences in generator_products(generators, DEGREE):
        check(at_ones(value) == int(differences == 0), "generator at all ones")
        dual_value = separator(value)
        check(dual_value >= 0, "negative value on a semiring product")
        dual_values[differences].append(dual_value)
        if not differences:
            classes["pure"] += 1
        elif width > 3:
            classes["width at least four"] += 1
        else:
            check(differences == 1 and sign_character(value) <= 0, "eligible product sign")
            classes["eligible"] += 1
    check(classes == {"pure": 27, "width at least four": 35, "eligible": 15},
          "exhaustive product counts")
    summary = [(len(values), values.count(0), min(x for x in values if x > 0))
               for values in dual_values.values()]
    check(summary == [(27, 1, Q(24, 25)), (46, 7, Q(1, 100)), (4, 0, Q(2, 15))],
          "dual certificate by the number of difference factors")
    print("Normalized-Schur separator on all 77 products: nonnegative. Target:", separator(target))
    print("Normalized target in descending Schur order:", ", ".join(map(str, coordinates)))
    print("All degree-five generator products:", dict(classes))


if __name__ == "__main__":
    main()
