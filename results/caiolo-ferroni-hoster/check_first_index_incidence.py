"""Independent #299 referee: ordinary KL recursion followed by signed incidence inversion."""

from collections import Counter
from functools import cache
from itertools import combinations
from math import comb, factorial
from fractions import Fraction


def products(left, right, cut, total):
    for (i, below), a in left.items():
        for (j, above), b in right.items():
            path = (
                below
                + ((cut,) if 0 < cut < total else ())
                + tuple(cut + k for k in above)
            )
            yield (i + j, path), a * b


def add(target, pairs, scale=1):
    for term, value in pairs:
        target[term] += scale * value


def subsets(r):
    return [t for k in range(r) for t in combinations(range(1, r), k)]


def full_incidence_weights(rank):
    one = Counter({(0, ()): 1})
    ordinary = [one]
    inverse = [one]
    characteristic = [one]
    mu = [one]
    for r in range(1, rank + 1):
        mu.append(Counter({(0, s): (-1) ** (len(s) + 1) for s in subsets(r)}))
        chi = Counter()
        for d in range(r + 1):
            add(chi, products(mu[d], {(r - d, ()): 1}, d, r))
        characteristic.append(chi)
        # t^r P(1/t)=chi * P. The unresolved ordinary P occurs only in the low half.
        top = Counter()
        for d in range(1, r + 1):
            add(top, products(characteristic[d], ordinary[r - d], d, r))
        ordinary.append(
            Counter({(r - k, s): a for (k, s), a in top.items() if 2 * k > r and a})
        )
        inv = Counter()
        for d in range(1, r + 1):
            add(inv, products(ordinary[d], inverse[r - d], d, r), -1)
        inverse.append(Counter({key: v for key, v in inv.items() if v}))
    return {(i, s): (-1) ** rank * a for (i, s), a in inverse[rank].items()}


@cache
def gaussian(q, n, k):
    if k < 0 or k > n:
        return 0
    a = b = 1
    for j in range(k):
        a *= q ** (n - j) - 1
        b *= q ** (k - j) - 1
    assert a % b == 0
    return a // b


@cache
def flags(q, d, h, pattern):
    # Ascending flags in D_{d,h}: after choosing a subspace, work in its quotient.
    if not pattern:
        return 1
    first, *later = pattern
    rest = tuple(j - first for j in later)
    return sum(
        gaussian(q, d, u) * comb(h, first - u) * flags(q, d - u, h - first + u, rest)
        for u in range(max(0, first - h), min(d, first) + 1)
    )


def matroid_flags(q, pattern):
    h = q**4
    if 4 not in pattern:
        return flags(q, 8, h, pattern)
    blocks = q**16
    hypers = [(i, 4 - i, gaussian(q, 8, i) * comb(h, 4 - i)) for i in range(5)]
    hypers.extend(
        [(4, 1, blocks), (4, 0, -blocks), (3, 1, -blocks * gaussian(q, 4, 3))]
    )
    return sum(n * flags(q, i, j, pattern[:-1]) for i, j, n in hypers)


def coeffs(q, weights):
    out = [0, 0, 0]
    for (k, pattern), w in weights.items():
        out[k] += w * matroid_flags(q, pattern)
    return out


def differences(values):
    first = []
    while values:
        first.append(values[0])
        values = [b - a for a, b in zip(values, values[1:])]
    return first


if __name__ == "__main__":
    weights = full_incidence_weights(5)
    qmin = 17
    # A flag is an increasing succession of at most four vector/Boolean insertions.
    # At most four vector dimensions total, each gives <=8 in degree; at most four
    # Boolean insertions contribute <=16. Corrected hyperplanes add <=19 more to
    # a rank-at-most-three flag of bounded dimension 4 and fixed Boolean order 1.
    # Thus 48 bounds ANY single coefficient and 96 their pairwise products.
    samples = [coeffs(q, weights) for q in range(qmin, qmin + 97)]
    deltas = [b * b - a * c for a, b, c in samples]
    print("ordinary-KL signed incidence inversion", samples[0], deltas[0])
    assert deltas[0] == -4040610930973941995066729476797524541048570545321150
    all_dif = [differences(list(col)) for col in zip(*samples)]
    leading = []
    for vec in all_dif:
        k = max(i for i, v in enumerate(vec) if v)
        leading.append((k, Fraction(vec[k], factorial(k))))
    print("exact degrees and leading coefficients", leading)
    assert leading == [(22, 1), (21, 3), (21, Fraction(1, 2))]
    h = differences([-x for x in deltas])
    assert all(h[i] > 0 for i in range(44)) and not any(h[44:])
    print("43rd Newton coefficient divided by 43! =", Fraction(h[43], factorial(43)))
    assert Fraction(h[43], factorial(43)) == Fraction(1, 2)
    print(
        "All 44 Newton coefficients positive, coefficients 44 to 96 zero; all prime powers q>=17 certified."
    )
