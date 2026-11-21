"""Compare ordinary paired CMI and neighboring subsample JS on iid fair bits."""
from collections import Counter
from functools import lru_cache
from itertools import combinations, permutations, product
from math import comb, log


def divergence(left, right):
    value = 0.0
    for key in left.keys() | right.keys():
        p, q = left.get(key, 0), right.get(key, 0)
        if p:
            value += p * log(2 * p / (p + q)) / 2
        if q:
            value += q * log(2 * q / (p + q)) / 2
    return value


def check(learner, r):
    selectors = list(product(range(2), repeat=r))
    orders = list(permutations(range(r)))

    @lru_cache(None)
    def bag(ones):
        bits = (1,) * ones + (0,) * (2 * r - ones)
        counts = Counter()
        for subset in combinations(range(2 * r), r):
            for order in orders:
                counts[learner(tuple(bits[subset[i]] for i in order))] += 1
        total = counts.total()
        return {v: c / total for v, c in counts.items()}

    cmi = marginal = 0.0
    for pool in product(range(2), repeat=2 * r):
        values = [learner(tuple(pool[2 * i + s[i]] for i in range(r))) for s in selectors]
        counts = Counter(values)
        # Deterministic learner, so the conditional information is its entropy.
        cmi -= sum((v / len(values)) * log(v / len(values)) for v in counts.values())
        for i in range(r):
            sides = []
            for b in range(2):
                sub = Counter(v for s, v in zip(selectors, values) if s[i] == b)
                sides.append({v: c / (len(selectors) / 2) for v, c in sub.items()})
            marginal += divergence(*sides)
    cmi /= 2**(2 * r)
    marginal /= 2**(2 * r)
    # The replacement differs with probability one half.
    neighbor = sum(comb(2 * r - 1, w) * divergence(bag(w), bag(w + 1))
                   for w in range(2 * r)) / 2**(2 * r)
    assert neighbor <= marginal / (2 * r) + 1e-12
    assert marginal <= cmi + 1e-12


if __name__ == "__main__":
    learners = [lambda z: z[0], lambda z: z[-1], lambda z: sum(z) % 2,
                lambda z: sum(z), lambda z: int(2 * sum(z) >= len(z)), lambda z: z]
    for r in range(1, 5):
        for learner in learners:
            check(learner, r)
    print("24 iid experiments checked, including parity and ordered-vector outputs")
