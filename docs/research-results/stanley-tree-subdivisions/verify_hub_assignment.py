"""Check cap assignment from truncated path-generator observations, using exact integers."""

from collections import Counter
from functools import cache
from itertools import combinations, permutations

from verify_balanced_paths import change_basis, clean
from verify_centroid import multiply, quotient, truncate
from verify_centroid_edge import require
from verify_long_subdivision import factor


@cache
def cap_factor(cap):
    return change_basis(factor(cap), to_path=True)


def path_series(weight, omit=None):
    return {(): 1, **{(i,): 1 for i in range(1, weight + 1) if i != omit}}


@cache
def arm_factor(cap, size):
    return multiply(path_series(size), cap_factor(cap), size)


def product(polys, cutoff):
    result = {(): 1}
    for poly in polys:
        result = multiply(result, poly, cutoff)
    return result


def observation(arms, marker, cutoff):
    """Evaluate the constant and first derivative of the whole product at y_marker=0."""
    constant, derivative = {(): 1}, {}
    for cap, size in arms:
        ordinary = arm_factor(cap, size)
        low = {term: count for term, count in ordinary.items()
               if marker not in term and sum(term) <= cutoff}
        marked = {}
        for term, count in ordinary.items():
            if term.count(marker) == 1 and sum(term) <= marker + cutoff:
                reduced = list(term)
                reduced.remove(marker)
                marked[tuple(reduced)] = count
        first = Counter(multiply(derivative, low, cutoff))
        first.update(multiply(constant, marked, cutoff))
        derivative = clean(first)
        constant = multiply(constant, low, cutoff)
    return multiply(path_series(cutoff, omit=marker),
                    quotient(derivative, constant, cutoff), cutoff)


def solve_group(receipt, available, quantity, cutoff):
    caps = sorted(set(available))
    multiplier = product((cap_factor(cap) for cap in caps), cutoff)
    measured = multiply(receipt, multiplier, cutoff)
    # W/G, including the column W for a unit G.
    columns = {cap: quotient(multiplier, cap_factor(cap), cutoff) for cap in caps}
    candidates = set()
    for group in combinations(available, quantity):
        trial = Counter()
        for cap in group:
            trial.update(columns[cap])
        if clean(trial) == measured:
            candidates.add(tuple(sorted(group)))
    require(len(candidates) == 1, "group extraction was ambiguous or missing")
    return candidates.pop()


def reconstruct(labels, sizes):
    arms = list(zip(labels, sizes))
    available = list(labels)
    multiplicities = Counter(sizes)
    largest, second = sorted(sizes, reverse=True)[:2]
    cutoff = len(arms) * max(max(map(sum, cap_factor(cap))) for cap in labels)
    known_weight = sum(sizes) - largest
    separated = largest - second >= cutoff
    for size in sorted(multiplicities, reverse=True):
        if separated and size == largest:
            continue
        require(size + cutoff <= known_weight, "unobservable derivative")
        data = observation(arms, size, cutoff)
        if separated:
            data[()] -= 1
        group = solve_group(clean(data), available, multiplicities[size], cutoff)
        expected = sorted(cap for cap, arm_size in arms if arm_size == size)
        require(list(group) == expected, "cap assignment does not match the original tree")
        for cap in group:
            available.remove(cap)
            arms.remove((cap, size))
    if separated:
        require(available == [arms[0][0]] and arms[0][1] == largest,
                "the single remaining cap was not the largest arm")
    else:
        require(not available and not arms, "some groups were not matched")


def main():
    unit, cherry, three_leaves = (), ((), ()), ((), (), ())
    unequal_cherry = ((), ((),))
    examples = [
        ((unit, cherry, three_leaves), (18, 19, 23)),  # adjacent distinct sizes
        ((unit, cherry, three_leaves), (18, 18, 19)),  # repeated smaller order
        ((unit, cherry, three_leaves), (18, 24, 24)),  # repeated maximum
        ((unit, cherry, three_leaves), (18, 24, 33)),  # gap equals the cutoff
        ((unit, cherry, three_leaves), (18, 24, 42)),  # two choices of midpoint parity
        ((unit, cherry, three_leaves), (18, 24, 43)),  # equal split edge
        ((unit, cherry, three_leaves), (18, 24, 120)),  # maximum exceeds sum of others
        ((unit, cherry, three_leaves), (18, 105, 108)),  # two large, comparable arms
        ((unit, cherry, cherry, unequal_cherry), (24, 25, 33, 97)),
        ((unit, cherry, three_leaves, unequal_cherry), (24, 30, 30, 33)),
    ]
    count = 0
    for caps, sizes in examples:
        for labels in sorted(set(permutations(caps))):
            reconstruct(labels, sizes)
            count += 1
    print(f"{count} cap assignments across {len(examples)} size configurations,"
          " including equal sizes, equal split, and a dominant arm")


if __name__ == "__main__":
    main()
