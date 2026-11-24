"""Exact checks of the stated target filter, not of a source conversion."""

from collections import defaultdict
from itertools import combinations


def compositions(total, length):
    if length == 1:
        yield (total,)
        return
    for first in range(total + 1):
        for tail in compositions(total - first, length - 1):
            yield (first,) + tail


def exterior_action(I, a, b):
    if a == b:
        return (I, 1) if a in I else None
    if b not in I or a in I:
        return None
    word = list(I)
    word[word.index(b)] = a
    sign = (-1) ** sum(word[i] > word[j] for i in range(len(word)) for j in range(i + 1, len(word)))
    return tuple(sorted(word)), sign


def check(s, k, degree):
    outer = tuple(combinations(range(s), k))
    flags = tuple(compositions(degree, s))
    G = defaultdict(int)
    for I in outer:
        for n in flags:
            for a in range(s):
                for b in range(s):
                    action = exterior_action(I, a, b)
                    if action is None or n[a] == 0:
                        continue
                    J, sign = action
                    m = list(n)
                    m[a] -= 1
                    m[b] += 1
                    G[(J, tuple(m)), (I, n)] += sign * n[a]
    G = {key: value for key, value in G.items() if value}

    def charge(n):
        return sum(a * value for a, value in enumerate(n))

    filtered = {
        key: value for key, value in G.items()
        if (charge(key[0][1]) - charge(key[1][1])) % s == 0
    }
    expected = {
        ((I, n), (I, n)): sum(n[a] for a in I)
        for I in outer for n in flags if sum(n[a] for a in I)
    }
    assert filtered == expected

    nonzero = sum(
        sum(n[a] for a in I) != sum(n[a] for a in J)
        for I in outer for J in outer for n in flags
    )
    p, M = len(outer), len(flags)
    assert nonzero * (degree + s - 1) >= p * M * (p - 1) * degree
    return p, M, nonzero, p * p * M


def main():
    cases = 0
    for s in range(2, 6):
        for k in range(1, s):
            for degree in (1, 2, 4):
                check(s, k, degree)
                cases += 1
    assert sum(a * x for a, x in enumerate((1, 0, 0, 1))) == sum(a * x for a, x in enumerate((0, 1, 1, 0)))
    print({"exact_casimir_filter_and_density_cases": cases,
           "s4_k2_degree2": check(4, 2, 2),
           "multi_exchange_zero_charge_example_survives": True,
           "source_conversion_tested": False,
           "status": "passed"})


if __name__ == "__main__":
    main()
