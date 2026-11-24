#!/usr/bin/env python3
"""Small exact checks of the obstruction and occupancy bound; not Lean proofs."""
from itertools import product

def main():
    checked = 0
    for r in range(3):
        m = 1 << r
        for k in range(5):
            for cols in product(range(m), repeat=k):
                for c in product(range(3), repeat=k):
                    groups = [[i for i in range(k) if cols[i] == b and c[i]]
                              for b in range(m)]
                    if any(len(g) == 1 for g in groups[1:]):
                        continue
                    u = [0] * k
                    for group in groups[1:]:
                        p = (2 * len(group)) % 3
                        assert p <= len(group)
                        for j, i in enumerate(group):
                            u[i] = int((c[i] == 1) != (j < p))
                        assert sum(c[i] * (-1) ** u[i] for i in group) % 3 == 0
                    z = sum(ci * ui for ci, ui in zip(c, u)) % 3
                    for a in range(1 << (m - 1)):
                        bits = [0] + [(a >> (b - 1)) & 1 for b in range(1, m)]
                        assert sum(ci * (ui ^ bits[b])
                                   for ci, ui, b in zip(c, u, cols)) % 3 == z
                    checked += 1
    assert checked == 6361
    print(f"PASS: {checked} admissible cases, k <= 4, r <= 2; all type flips")
    cases = 0
    for r in range(3):
        m = 2 ** r
        alphabet = list(product(range(m), range(3)))
        for k in range(5):
            counts = [0] * m
            bad = 0
            for word in product(alphabet, repeat=k):
                singleton = False
                for b in range(1, m):
                    if sum(bb == b and c != 0 for bb, c in word) == 1:
                        counts[b] += 1
                        singleton = True
                bad += singleton
            expected = 0 if k == 0 else 2 * k * (3 * m - 2) ** (k - 1)
            assert all(v == expected for v in counts[1:])
            assert bad <= (m - 1) * expected
            cases += 1
    print(f"PASS: exact per-type singleton count and union bound, {cases} (r,k) pairs")
    print("Finite cross-checks only; not Lean verification.")

if __name__ == "__main__":
    main()
