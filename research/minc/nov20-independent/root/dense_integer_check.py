"""Exact algebra diagnostics for the dense integer-minimum proof."""

from fractions import Fraction as F
from itertools import permutations

from verify_integer_minimizer_collision import tables, collisions, excess


def main():
    checked = 0
    hall_missing_examples = 0
    for n in (3, 4):
        k = n - 1
        assignments = list(permutations(range(n)))
        for a in tables(n, k):
            c = collisions(a)
            e = excess(a)
            costs = [sum(a[i][p[i]] for i in range(n)) for p in assignments]
            chosen = assignments[min(range(len(costs)), key=costs.__getitem__)]
            s = min(costs)
            assert s <= 2*e <= 2*c
            hall_missing_examples += s > 0
            reordered = [[a[i][chosen[j]] for j in range(n)] for i in range(n)]
            b0 = [[F(int(i != j), k) - F(1, n)
                   for j in range(n)] for i in range(n)]
            difference = [[F(reordered[i][j] - int(i != j), k)
                           for j in range(n)] for i in range(n)]
            inner = sum(b0[i][j]*difference[i][j]
                        for i in range(n) for j in range(n))
            distance = sum(difference[i][j]**2
                           for i in range(n) for j in range(n))
            assert inner == -F(s, k*k)
            assert distance == F(2*(c+s), k*k)
            checked += 1
        print(f"order {n}: complete integer-margin class passed")

    eta = F(13, 100)
    assert 1 - 5*eta == F(7, 20)
    threshold = 500_000_000_000_000
    assert F(24_000_000, threshold-1) < F(1, 16_000_000)
    assert F(1, threshold-1) < F(1, 16_000_000)
    assert 24 == 12*(3-1)
    print(f"exact assignment and geometric identities checked: {checked}")
    print(f"included matrices without a zero perfect matching: {hall_missing_examples}")
    print("local Hessian margin and threshold: exact rational checks passed")
    print("The uniform theorem is the written proof, not these diagnostics.")


if __name__ == "__main__":
    main()
