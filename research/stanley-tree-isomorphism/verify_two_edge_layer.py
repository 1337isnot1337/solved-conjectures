#!/usr/bin/env python3
"""Check finite column ranks independently of the written decoding order."""

from collections import Counter
from itertools import combinations_with_replacement, product
from math import comb


PRIME = 65521


def terms(components, max_z):
    """Expand a forest type indexed by its nonsingleton component weights."""
    denominator = Counter(weight for block in components for weight in block)
    shifts = [range(len(block)) for block in components]
    column = Counter()
    for choices in product(*shifts):
        degree = sum(choices)
        if degree > max_z:
            continue
        numerator = Counter(sum(block) - j for block, j in zip(components, choices))
        powers = numerator.copy()
        powers.subtract(denominator)
        monomial = degree, tuple(sorted((v, e) for v, e in powers.items() if e))
        coefficient = (-1) ** degree
        for block, shift in zip(components, choices):
            coefficient *= comb(len(block) - 1, shift)
        column[monomial] += coefficient
    return column


def rank_mod(columns):
    pivots = {}
    for column in columns:
        column = {key: value % PRIME for key, value in column.items() if value % PRIME}
        while column:
            key = min(column)
            value = column[key]
            if key not in pivots:
                scale = pow(value, -1, PRIME)
                pivots[key] = {term: c * scale % PRIME for term, c in column.items()}
                break
            for term, c in pivots[key].items():
                residue = (column.get(term, 0) - value * c) % PRIME
                if residue:
                    column[term] = residue
                else:
                    column.pop(term, None)
    return len(pivots)


def main():
    weights = range(2, 12)
    pairs = list(combinations_with_replacement(weights, 2))
    forests = [(triple,) for triple in combinations_with_replacement(weights, 3)]
    forests.extend(combinations_with_replacement(pairs, 2))

    wedge = ((2, 2, 3),)
    matching = ((2, 2), (3, 4))
    assert terms(wedge, 0) == terms(matching, 0)
    assert terms(wedge, 1) != terms(matching, 1)

    constant_rank = rank_mod(terms(forest, 0) for forest in forests)
    joint_rank = rank_mod(terms(forest, 1) for forest in forests)
    assert constant_rank < len(forests)
    assert joint_rank == len(forests)
    print(f"weights 2..11, columns {len(forests)}")
    print(f"ranks modulo {PRIME}: constant {constant_rank}, degrees 0 and 1 {joint_rank}")


if __name__ == "__main__":
    main()
