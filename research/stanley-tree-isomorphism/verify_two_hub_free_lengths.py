"""Recover arbitrary independent stem lengths using exact boundary coefficient layers."""

from collections import Counter
from fractions import Fraction
from functools import cache
from itertools import combinations_with_replacement, permutations
from math import prod

from verify_centroid_edge import require
from verify_two_hub_subdivisions import assemble, size


def add(*polys):
    result = Counter()
    for poly in polys:
        result.update(poly)
    return {degree: count for degree, count in result.items() if count}


def scale(poly, scalar):
    return {degree: multiplier * scalar for degree, multiplier in poly.items()}


def multiply(left, right):
    result = Counter()
    for i, a in left.items():
        for j, b in right.items():
            result[i + j] += a * b
    return dict(result)


def product_of(polys):
    result = {0: 1}
    for poly in polys:
        result = multiply(result, poly)
    return result


def connected_polynomial(n, edges, x):
    """Count each connected subset at its topmost vertex in a root at an arbitrary leaf."""
    adjacent = [[] for _ in range(n)]
    for u, v in edges:
        adjacent[u].append(v)
        adjacent[v].append(u)
    root = next(i for i in range(n) if len(adjacent[i]) == 1)
    parent = {root: root}
    order = [root]
    for v in order:
        for w in adjacent[v]:
            if w not in parent:
                parent[w] = v
                order.append(w)
    included = {}
    total = Counter()
    for v in reversed(order):
        child_options = (add({1: 1}, included[w]) for w in adjacent[v] if parent[w] == v)
        included[v] = scale(product_of(child_options), x)
        boundary = int(v != root)
        for j, count in included[v].items():
            total[j + boundary] += count
    return total


@cache
def cap_factor(cap, x):
    return add({1: 1}, scale(product_of(cap_factor(c, x) for c in cap), x))


def reconstruct(whole, n, caps, p, q):
    # The coefficients of sum x^(-u) are at most r, so a radix r+1
    # uniquely encodes the stem multiset after multiplying by x^n.
    x = len(caps) + 1
    factors = {c: cap_factor(c, x) for c in caps}
    leaf_counts = sorted(max(factors[c]) for c in caps)
    require(leaf_counts[-1] < sum(leaf_counts[:min(p, q)]),
            "invalid cap collection")
    types = sorted(factors, key=lambda c: max(factors[c]))
    require(len({max(factors[c]) for c in types}) == len(types), "ambiguous cap class")
    N = n - sum(map(size, caps))
    e = sum(leaf_counts)
    fixed = Fraction(1, 1 - x)
    defect = {c: add(factors[c], {1: -fixed}) for c in types}
    leading_product = prod(factors[c][max(factors[c])] for c in caps)
    recovered = {}
    if () in caps:
        # Over Q(x) the product of the unit factors determines all unit lengths.
        # Work with the full product at the chosen integer x.
        # The exponent of x dividing the numerator detects the total unary length.
        j = caps.count(())
        ratio = Fraction(whole[e] * (1 - x)**j, x**N * leading_product)
        denominator = ratio.denominator
        unit_sum = 0
        while denominator % x == 0:
            denominator //= x
            unit_sum += 1
        require(denominator == 1, "unit length sum not integral")
        raw = int(ratio * x**unit_sum)
        # At this integer specialization extract the lengths independently
        # by comparing candidate size-matched products, keeping multiplicities.
        choices = [us for us in combinations_with_replacement(range(unit_sum + 1), j)
                   if sum(us) == unit_sum and prod(1 - x**(u + 1) for u in us) == raw]
        require(len(choices) == 1, "unit specialization did not separate the tested lengths")
        recovered[()] = list(choices[0])
        leading_product *= prod((Fraction(1, x**u) - x) * fixed for u in recovered[()])
    for cap in (c for c in types if c):
        terms = []
        for c in types:
            if c in recovered:
                terms.extend(add(defect[c], {1: fixed / x**u}) for u in recovered[c])
            else:
                terms.extend([defect[c]] * caps.count(c))
        subtracted = scale(product_of(terms), x**N)
        leaves = max(factors[cap])
        degree = e - leaves + 1
        coefficient = whole[degree] - subtracted.get(degree, 0)
        prefactor = fixed * x**N * leading_product / factors[cap][leaves]
        encoded = x**n * coefficient / prefactor
        require(encoded.denominator == 1 and encoded > 0, "missing Laurent coefficient data")
        value = int(encoded)
        stems = []
        for exponent in range(n + 1):
            value, digit = divmod(value, x)
            stems.extend([n - exponent] * digit)
        require(not value and len(stems) == caps.count(cap), "invalid stem multiplicities")
        recovered[cap] = sorted(stems)
    return recovered, N - 1 - sum(sum(us) for us in recovered.values())


def extend(cap, u):
    for _ in range(u):
        cap = (cap,)
    return cap


def main():
    cherry = ((), ())
    unbalanced_three = ((), ((), ()))
    four = ((), (), (), ())
    five = ((), (), ((), (), ()))
    suites = [
        (((), (), cherry, cherry, cherry, cherry), (2, 4, 5, 5, 7, 10), (1, 7)),
        (((), cherry, cherry, cherry, cherry), (2, 7, 12, 19, 83), (1, 9)),
        ((cherry,) * 4, (0, 3, 15, 90), (1, 38, 105)),
        ((cherry, cherry, unbalanced_three, unbalanced_three), (4, 4, 13, 38), (1, 12)),
        ((five, four, unbalanced_three, four, five), (3, 19, 19, 30, 91), (1, 112)),
        ((unbalanced_three, four, five, five), (38, 40, 44, 75), (39,)),
    ]
    count = 0
    for caps, stems, central_lengths in suites:
        p = 3 if len(caps) == 6 else 2
        q = len(caps) - p
        x = len(caps) + 1
        for labels in sorted(set(permutations(caps))):
            for h in central_lengths:
                arms = tuple(extend(cap, u) for cap, u in zip(labels, stems))
                n, edges = assemble(arms[:p], arms[p:], h)
                whole = connected_polynomial(n, edges, x)
                got, distance = reconstruct(whole, n, list(caps), p, q)
                expected = {cap: sorted(u for c, u in zip(labels, stems) if c == cap)
                            for cap in caps}
                require(got == expected and distance == h, "incorrect cap class, stem or distance")
                count += 1
    print(f"{count} arbitrary-length joins reconstructed from complete boundary coefficient layers")


if __name__ == "__main__":
    main()
