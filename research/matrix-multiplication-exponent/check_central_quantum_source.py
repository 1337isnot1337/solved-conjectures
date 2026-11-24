"""Exact checks for the fixed central-degree source.

Checks the label count, two involutions, cyclic sign and nondegenerate
slice. For s=4,k=2 it computes every deformed four-party coefficient
by a denominator recurrence and verifies the parameter-independent
leading quantum coefficient. It does not test a tensor trade.
"""

from collections import Counter, defaultdict
from itertools import combinations, product
from math import comb

import sympy as sp


def mul(left, right):
    out = defaultdict(int)
    for (a, b), x in left.items():
        for (c, d), y in right.items():
            out[a + c, b + d] += x * y
    return {key: value for key, value in out.items() if value}


def labels(k):
    r = k // 2
    half = tuple(combinations(range(k), r))
    half_sums = Counter(map(sum, half))
    total = k * (k - 1) // 2
    selected = tuple(
        tuple(left) + tuple(a + k for a in right)
        for left in half for right in half
        if sum(left) + sum(right) == total
    )
    assert len(selected) == sum(a * a for a in half_sums.values())
    assert len(selected) * (r * r + 1) >= comb(k, r) ** 2
    assert len(selected) * (k + 1) * (r * r + 1) >= comb(2 * k, k)
    return selected


def check_labels():
    checks = 0
    for k in (2, 4, 6, 8, 10):
        r, s = k // 2, 2 * k
        selected = labels(k)
        label_set = set(selected)
        rectangle = tuple(range(r, 3 * r))
        assert rectangle in label_set
        pair_map = []
        for subset in selected:
            assert sum(subset) - k * (k - 1) // 2 == k * k // 2
            shifted_word = tuple((a + k) % s for a in subset)
            inversions = sum(
                shifted_word[i] > shifted_word[j]
                for i in range(k) for j in range(i + 1, k)
            )
            assert (-1) ** inversions == (-1) ** r
            assert sum(a + k >= s for a in subset) == r
            shifted = tuple(sorted(shifted_word))
            reflected = tuple(sorted(s - 1 - a for a in shifted))
            assert shifted in label_set and reflected in label_set
            pair_map.append(reflected)
            checks += 1
        assert set(pair_map) == label_set
        print(f"k={k}: t={len(selected)}, p={comb(s, k)}; "
              "count, shifts, reflection and signed pairing pass")
    print(f"Exact combinatorial pairing checks: {checks}")


def check_deformed_trace():
    # The selected s=4,k=2 classes are s_(2) and s_(1,1).
    classes = (
        {(2, 0): 1, (1, 1): 1, (0, 2): 1},
        {(1, 1): 1},
    )
    c1, c2, c3, c4, quantum = sp.symbols("c1 c2 c3 c4 kappa")
    denominator = (0, c1, c2, c3, c4 - quantum)
    reciprocal = [sp.Integer(1)]
    for degree in range(1, 5):
        reciprocal.append(sp.expand(-sum(
            denominator[j] * reciprocal[degree - j]
            for j in range(1, degree + 1)
        )))

    source = {}
    for indices in product(range(2), repeat=4):
        polynomial = {(0, 0): 1}
        for index in indices:
            polynomial = mul(polynomial, classes[index])
        numerator = mul(polynomial, {(2, 0): 1, (1, 1): -2, (0, 2): 1})
        trace = sp.Integer(0)
        for (a, b), coefficient in numerator.items():
            if a >= 3 and b >= 3:
                trace -= sp.Rational(coefficient, 2) * reciprocal[a - 3] * reciprocal[b - 3]
        trace = sp.expand(trace)
        leading = trace.coeff(quantum, 1)
        assert leading.free_symbols == set()
        assert sp.Poly(trace, quantum).degree() <= 1
        assert sp.expand(trace.subs({c1: 0, c2: 0, c3: 0, c4: 0})) == quantum * leading
        source[indices] = leading

    # R=(1,1) is class1; the reflection-after-shift swaps class0/1.
    pairing = sp.Matrix([[source[a, b, 1, 1] for b in range(2)] for a in range(2)])
    assert pairing == sp.Matrix([[0, -1], [-1, 0]])
    assert pairing.det() == -1
    print("All 16 deformed s=4,k=2 coefficients pass; "
          "leading quantum tensor is independent of c1,...,c4")
    print("The exact fixed-rectangle pairing is [[0,-1],[-1,0]]")


if __name__ == "__main__":
    check_labels()
    check_deformed_trace()
