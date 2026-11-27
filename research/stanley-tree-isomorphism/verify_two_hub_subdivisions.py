"""Test the double-hub reconstruction identities using exact enumeration."""

from collections import Counter
from fractions import Fraction
from functools import cache
from itertools import combinations_with_replacement, permutations, product
from math import prod

from verify_centroid import branch_poly, forest_polynomial, multiply
from verify_centroid_edge import edges_at_root, require
from verify_hub_assignment import observation, solve_group


def edge_profile(left, right, h):
    """Cut each exterior path edge and then each central edge once."""
    n = 1 + h + sum(left) + sum(right)
    sides = [i for size in (*left, *right) for i in range(1, size + 1)]
    sides.extend(sum(left) + i for i in range(1, h + 1))
    return Counter(min(i, n - i) for i in sides), n


def check_exterior_scan():
    total = recovered = 0
    for p, q in ((2, 2), (2, 3), (3, 3)):
        choices = range(3, 10)
        lefts = combinations_with_replacement(choices, p)
        rights = list(combinations_with_replacement(choices, q))
        for left, right, h in product(lefts, rights, (1, 2, 11)):
            if p == q and left > right:
                continue
            counts, n = edge_profile(left, right, h)
            expected = sorted((*left, *right))
            d = min(p, q)
            first = []
            for i in range(3, (n - 1) // 2):
                first.extend([i] * (counts[i] - counts[i + 1]))
                if len(first) >= d:
                    break
            require(first[:d] == expected[:d], "incorrect first exterior orders")
            cutoff = sum(first[:d])
            lower = []
            for i in range(3, cutoff):
                delta = counts[i] - counts[i + 1]
                require(delta >= 0, "unexpected reflected or central cut")
                lower.extend([i] * delta)
            require(lower == [s for s in expected if s < cutoff], "wrong strict lower tail")
            recovered += len(lower) == len(expected)
            total += 1
    # The undecorated one-edge histograms can coincide even at unbounded scale.
    for t in range(3, 30):
        require(edge_profile((t, 8*t), (t, t), 3*t) ==
                edge_profile((t, 5*t), (t, t), 6*t), "missing one-edge ambiguity")
    return total, recovered


@cache
def size(arm):
    return 1 + sum(map(size, arm))


def assemble(left, right, h):
    """Number the central path first, followed by the vertices of the four or more arms."""
    edges = [(v, v + 1) for v in range(h)]
    n = h + 1
    for hub, arms in ((0, left), (h, right)):
        for arm in arms:
            edges.append((hub, n))
            edges.extend(edges_at_root(arm, n))
            n += size(arm)
    return n, edges


def connected_subsets(n, edges, parent_at=None):
    """Boundary can include a missing parent edge of a standalone rooted arm."""
    terms = Counter()
    for mask in range(1, 1 << n):
        order = mask.bit_count()
        internal = 0
        boundary = int(parent_at is not None and bool(mask & (1 << parent_at)))
        for u, v in edges:
            included = int(bool(mask & (1 << u))) + int(bool(mask & (1 << v)))
            internal += included == 2
            boundary += included == 1
        if internal == order - 1:
            terms[order, boundary] += 1
    return terms


@cache
def cap_connected(arm):
    return connected_subsets(size(arm), edges_at_root(arm), 0)


@cache
def attached(arm, x, y):
    return y + x * prod(attached(child, x, y) for child in arm)


def evaluate(terms, x, y):
    return sum(count * x**order * y**boundary
               for (order, boundary), count in terms.items())


def check_connected_formula(left, right, h, unrooted):
    arms = left + right
    # Degree bounds in each variable are n. Evaluating at a radix above every
    # coefficient gives a collision-free exact integer encoding of the polynomial.
    n = 1 + h + sum(map(size, arms))
    x = 1 << (n + 1)
    y = x ** (n + 1)
    exterior = sum(evaluate(cap_connected(arm), x, y) for arm in arms)
    center = y*y * sum((h - i) * x**i for i in range(1, h))
    first = prod(attached(arm, x, y) for arm in left)
    second = prod(attached(arm, x, y) for arm in right)
    residual = evaluate(unrooted, x, y) - exterior - center - x**(h + 1) * first * second
    denominator = x * y * sum(x**i for i in range(h))
    require(residual == denominator * (first + second), "incorrect connected-subset equation")
    return (first + second, first * second)


def check_small_forests():
    unit = ()
    chain = ((),)
    cherry = ((), ())
    path_three = (((),),)
    suites = [
        ((unit, chain, cherry, path_three), (1, 2, 3)),
        ((unit, unit, cherry, cherry), (1, 4)),
        ((unit, unit, chain, chain, cherry), (1, 2)),
    ]
    tested = forests = subsets = 0
    for arms, spacings in suites:
        for h in spacings:
            allocations = set()
            for permuted in permutations(arms):
                sides = (tuple(sorted(permuted[:2])), tuple(sorted(permuted[2:])))
                allocations.add(tuple(sorted(sides)))
            signatures = set()
            for left, right in sorted(allocations):
                n, edges = assemble(left, right, h)
                polynomial = connected_subsets(n, edges)
                signatures.add(check_connected_formula(left, right, h, polynomial))
                cutoff = sum(sorted(map(size, arms))[:min(len(left), len(right))])
                whole = forest_polynomial(range(n), edges)
                giant = {parts[:-1]: count for parts, count in whole.items()
                         if parts[-1] >= n - cutoff}
                factors = {(): 1}
                for arm in arms:
                    factors = multiply(factors, branch_poly(range(size(arm)),
                                       edges_at_root(arm), 0), cutoff)
                require(giant == factors, "erasing the giant missed a rooted arm coefficient")
                forests += 1 << (n - 1)
                subsets += (1 << n) - 1
                tested += 1
            require(len(signatures) == len(allocations), "ambiguous grouping")
    return tested, forests, subsets


def check_decorated_assignment():
    unit, cherry, triple = (), ((), ()), ((), (), ())
    caps = (unit, cherry, cherry, triple)
    m = 12
    total = 0
    for sizes in ((15, 16, 18, 19), (13, 36, 36, 37), (14, 14, 15, 16)):
        limit = sum(sizes[:2])
        require(max(sizes) < limit and max(sizes) + m <= limit, "invalid test parameters")
        for labels in set(permutations(caps)):
            arms = list(zip(labels, sizes))
            available = list(labels)
            for j in sorted(set(sizes), reverse=True):
                matches = solve_group(observation(arms, j, m), available, sizes.count(j), m)
                for cap in matches:
                    require((cap, j) in arms, "cap assigned to the wrong total order")
                    arms.remove((cap, j))
                    available.remove(cap)
            require(not available and not arms, "an arm was omitted")
            total += 1
    return total



def extend(cap, order):
    for _ in range(order - size(cap)):
        cap = (cap,)
    return cap


def check_transpositions():
    cases = [
        ((), ((), ()), 3, 4, ((),)),
        (((), ()), ((), (), ()), 4, 5, ((),)),
        ((), (), 2, 4, ((), ((),))),
        ((), ((), ()), 3, 3, (((),),)),
    ]
    for first, second, s, t, rest in cases:
        tree = (*rest, extend(first, s), extend(second, t))
        swapped = (*rest, extend(first, t), extend(second, s))
        before = connected_subsets(size(tree), edges_at_root(tree))
        after = connected_subsets(size(swapped), edges_at_root(swapped))
        for x, y in ((2, 3), (3, 5), (5, 2)):
            fixed = Fraction(y, 1 - x)
            r = prod(attached(arm, x, y) for arm in rest)
            def normalized(cap):
                return (attached(cap, x, y) - fixed) / x**size(cap)
            formula = x * fixed * (r - 1) * (x**s - x**t) * (normalized(first) - normalized(second))
            require(evaluate(before, x, y) - evaluate(after, x, y) == formula,
                    "incorrect total-order transposition")
        require((before == after) == (s == t or first == second),
                "transposition was not distinguished")
    return len(cases)


if __name__ == "__main__":
    profiles, complete = check_exterior_scan()
    models, forests, subsets = check_small_forests()
    assignments = check_decorated_assignment()
    transpositions = check_transpositions()
    print(f"{profiles} folded exterior profiles ({complete} with all orders below the cutoff)")
    print(f"{models} unmarked joins, {forests} spanning forests, {subsets} vertex subsets")
    print(f"{assignments} decorated cap assignments and 27 explicit one-edge ambiguities")
    print(f"{transpositions} transpositions checked at three specializations and by complete polynomials")
