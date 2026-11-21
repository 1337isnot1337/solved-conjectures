"""Exact direct-definition witness for the all-genus reading of CDM 3.15.

No recurrence or character code is imported. The source's genus-asymptotic
wording is an interpretation limit; this program does not resolve that limit.
The witness polynomials were already printed in the authors' MATRIX note,
Topological Narayana polynomials and interlacing conjectures, page 5:
https://www.matrix-inst.org.au/wp_Matrix2016/wp-content/uploads/2023/07/Coulter.pdf
This independently checks prior data and its root-direction consequence.
"""

from collections import Counter
from fractions import Fraction
import json


def connected(adjacency):
    """Transposition generators are transitive iff their support graph connects."""
    reached = 1
    while True:
        enlarged = reached
        for vertex in range(4):
            if reached >> vertex & 1:
                enlarged |= adjacency[vertex]
        if enlarged == reached:
            return reached == 15
        reached = enlarged


def count_factorizations(length):
    target = (2, 1, 4, 3)
    all_counts = Counter()
    transitive_counts = Counter()

    def visit(permutation, min_larger, remaining, adjacency, larger_entries):
        if remaining == 0:
            if permutation == target:
                hive = larger_entries.bit_count()
                all_counts[hive] += 1
                if connected(adjacency):
                    transitive_counts[hive] += 1
            return
        for larger in range(min_larger, 5):
            for smaller in range(1, larger):
                # Right multiplication by (smaller, larger) swaps image slots.
                next_permutation = list(permutation)
                next_permutation[smaller - 1], next_permutation[larger - 1] = (
                    next_permutation[larger - 1], next_permutation[smaller - 1]
                )
                next_adjacency = list(adjacency)
                next_adjacency[smaller - 1] |= 1 << (larger - 1)
                next_adjacency[larger - 1] |= 1 << (smaller - 1)
                visit(tuple(next_permutation), larger, remaining - 1,
                      tuple(next_adjacency), larger_entries | (1 << larger))

    visit((1, 2, 3, 4), 2, length, (0, 0, 0, 0), 0)
    return dict(sorted(all_counts.items())), dict(sorted(transitive_counts.items()))


def main():
    expected = {
        2: ({2: 1}, {}),
        4: ({1: 4, 2: 12, 3: 4}, {1: 4, 2: 10, 3: 4}),
        6: ({1: 50, 2: 131, 3: 50}, {1: 50, 2: 128, 3: 50}),
    }
    records = []
    for length, witness in expected.items():
        actual = count_factorizations(length)
        assert actual == witness, (length, actual)
        records.append({
            "length": length,
            "all_by_hive": actual[0],
            "transitive_by_hive": actual[1],
            "normalized_connected": {
                str(hive): str(Fraction(number, 4))
                for hive, number in actual[1].items()
            },
        })

    def genus_one_quadratic(value):
        return Fraction(25, 2) * value * value + 32 * value + Fraction(25, 2)

    assert genus_one_quadratic(Fraction(-2)) == Fraction(-3, 2)
    assert genus_one_quadratic(Fraction(-1, 2)) == Fraction(-3, 8)
    assert 399 > 18**2
    assert 4 * 399 > 39**2
    print(json.dumps({
        "status": "exact initial reversal verified",
        "profile": [2, 2],
        "records": records,
        "scope": "Disproves monotonicity from genus zero; the source's asymptotic interpretation remains qualified.",
    }, indent=2))


if __name__ == "__main__":
    main()
