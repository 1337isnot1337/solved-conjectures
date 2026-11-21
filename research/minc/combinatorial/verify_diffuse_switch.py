"""Exact checks for the cofactor expansion and the cap-preserving switch."""

from itertools import permutations
from random import Random

from verify_minc_integrality_identities import minor, permanent, switch


def check_table(table):
    n = len(table)
    a = max(map(max, table))
    before = permanent(table)
    checks = 0
    positive_target = 0
    for i in range(n):
        for j in range(n):
            if table[i][j] != a or a < 2:
                continue
            for p in range(n):
                if table[p][j]:
                    continue
                targets = [q for q in range(n) if table[p][q] > table[i][q]]
                assert targets
                for q in targets:
                    rows = [t for t in range(n) if t not in {i, p}]
                    cols = [s for s in range(n) if s not in {j, q}]
                    m = minor(table, {i, p}, {j, q})
                    cross = sum(
                        (table[t][q] - table[t][j]) * (table[p][s] - table[i][s])
                        * permanent(minor(m, {u}, {v}))
                        for u, t in enumerate(rows) for v, s in enumerate(cols)
                    )
                    slope = (a + table[p][q] - table[i][q]) * permanent(m) + cross
                    after = switch(table, i, j, p, q)
                    assert max(map(max, after)) <= a
                    assert permanent(after) - before == -slope + 2 * permanent(m)
                    checks += 1
                    positive_target += table[i][q] > 0
    return checks, positive_target


if __name__ == "__main__":
    rng = Random(137)
    counts = positives = 0
    for n in range(3, 8):
        perms = list(permutations(range(n)))
        for k in range(2, n + 1):
            for _ in range(8):
                factors = rng.choices(perms, k=k)
                g = [[sum(p[i] == j for p in factors) for j in range(n)] for i in range(n)]
                m, t = check_table(g)
                counts += m
                positives += t
    assert positives > 0
    print(f"{counts} switch expansions, including {positives} with a positive receiving entry")
