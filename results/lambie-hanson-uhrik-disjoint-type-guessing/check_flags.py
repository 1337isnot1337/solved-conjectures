#!/usr/bin/env python3
"""Finite checks for the exact and truncated type-guessing flags.

The proof of properness also uses elementary models and is not a computation.
This script checks just the finite order identities used in that proof.
"""
from itertools import combinations


def merge_word(lower, upper):
    if set(lower) & set(upper):
        return None
    return "".join(
        bit
        for _, bit in sorted(
            [(x, "0") for x in lower] + [(x, "1") for x in upper]
        )
    )


def normalized_types(n):
    for zeroes in combinations(range(2*n-1), n):
        yield "".join("0" if i in zeroes else "1" for i in range(2*n))


def parameters(word):
    n = len(word) // 2
    last_zero = word.rfind("0")
    d = word[:last_zero].count("1")
    if not d:
        return n, 0, 0, ""
    last_marker = word.rfind("1", 0, last_zero)
    prefix = word[:last_marker+1]
    r = prefix.count("0")
    return n, d, r, prefix


def flag_hits(word, lower, markers, cutoff):
    n, d, r, prefix = parameters(word)
    assert d == len(markers) and d
    return max(lower) < cutoff and merge_word(lower, markers) == prefix + "0"*(n-r)


def run():
    exact_checks = cut_checks = guard_checks = 0
    for n in range(2, 5):
        universe = range(2*n+2)
        sets = list(combinations(universe, n))
        for word in normalized_types(n):
            nn, d, r, prefix = parameters(word)
            assert nn == n and word == prefix + "0"*(n-r) + "1"*(n-d)
            if not d:
                continue
            for lower in sets:
                for upper in sets:
                    markers, cutoff = upper[:d], upper[d]
                    exact = flag_hits(word, lower, markers, cutoff)
                    assert exact == (merge_word(lower, upper) == word)
                    exact_checks += 1
                    for delta in range(2*n+3):
                        if max(lower) < delta:
                            truncated = (
                                max(markers) < delta
                                and flag_hits(
                                    word, lower, markers,
                                    cutoff if cutoff < delta else float("inf"),
                                )
                            )
                            assert exact == truncated
                            cut_checks += 1
                        if r and max(markers) < delta <= lower[r-1]:
                            assert not exact
                            guard_checks += 1
    assert [parameters("0"*m+"10"+"1"*m)[1:3] for m in range(1, 25)] == [
        (1, m) for m in range(1, 25)
    ]
    print(f"{exact_checks:,} exact-flag checks")
    print(f"{cut_checks:,} cut-truncation checks")
    print(f"{guard_checks:,} guard checks")


if __name__ == "__main__":
    run()
