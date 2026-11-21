"""Replay the matching mixture by integer arithmetic, with every block weight retained."""
from collections import defaultdict
from fractions import Fraction
from math import comb, factorial
from random import Random


def counts(matrix, rows=(), columns=()):
    """Return weighted matching counts by size and by edges in a marked rectangle."""
    table = {(0, 0): 1}
    for i, row in enumerate(matrix):
        next_table = defaultdict(int, table)
        for (mask, marked), value in table.items():
            for j, weight in enumerate(row):
                if weight and not mask & (1 << j):
                    key = (mask | (1 << j), marked + int(i in rows and j in columns))
                    next_table[key] += value * weight
        table = next_table
    result = defaultdict(int)
    for (mask, marked), value in table.items():
        result[mask.bit_count(), marked] += value
    return result


def check():
    rng = Random(44401)
    identities = 0
    strict = 0
    for r, c, spare in [(2, 2, 0), (2, 4, 1), (4, 2, 2), (3, 3, 0), (3, 4, 1), (4, 4, 1)]:
        n = r + c + spare
        sources, targets = range(r), range(r, r+c)
        base = [[int(i != j) for j in range(n)] for i in range(n)]
        baseline = counts(base, sources, targets)
        for size in range(2, 6):
            core = [[size for _ in targets] for _ in sources]
            for _ in range(8*r*c):
                i, h = rng.sample(range(r), 2)
                j, l = rng.sample(range(c), 2)
                if core[i][j] and core[h][l]:
                    core[i][j] -= 1
                    core[h][l] -= 1
                    core[i][l] += 1
                    core[h][j] += 1
            y = counts(core)
            full = [[size*v for v in row] for row in base]
            for i in sources:
                full[i][r:r+c] = core[i]
            observed = counts(full, sources, targets)
            squared = sum((v-size)**2 for row in core for v in row)
            for k in range(n+1):
                total = 0
                for j in range(min(r, c, k)+1):
                    uniform = comb(r,j)*comb(c,j)*factorial(j)
                    expected = Fraction(baseline[k,j] * y[j,0] * size**(k-j), uniform)
                    assert expected == observed[k,j]
                    assert y[j,0] >= size**j * uniform
                    if j == 2:
                        assert 2*(y[j,0] - size**2*uniform) == squared
                    total += observed[k,j] - size**k * baseline[k,j]
                    identities += 1
                if k >= 2:
                    assert baseline[k,2] > 0
                    assert (total > 0) == (squared > 0)
                    strict += 1
    print(f"{identities} exact conditional matching counts and {strict} strictness checks")


if __name__ == "__main__":
    check()
