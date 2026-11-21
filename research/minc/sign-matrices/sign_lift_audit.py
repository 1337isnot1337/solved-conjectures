"""Exact checks of construction obstructions, not new conjecture cases."""

from itertools import combinations_with_replacement, product
from math import factorial


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        rest = mask
        while rest:
            bit = rest & -rest
            rest -= bit
            dp[mask] += a[i][bit.bit_length() - 1] * dp[mask ^ bit]
    return dp[-1]


def ferrers_permanent(lengths):
    r = [1]
    for b in lengths:
        r.append(0)
        for k in range(len(r) - 1, 0, -1):
            r[k] += (b - k + 1) * r[k - 1]
    n = len(lengths)
    return sum((-2) ** k * factorial(n - k) * v for k, v in enumerate(r))


def occupation_coefficient(columns):
    m = len(columns[0])
    state = {(0,) * m: 1}
    for col in columns:
        nxt = {}
        for key, value in state.items():
            for i in range(m):
                if key[i] == 2:
                    continue
                new_key = list(key)
                new_key[i] += 1
                new_key = tuple(new_key)
                nxt[new_key] = nxt.get(new_key, 0) + value * col[i]
        state = nxt
    return state.get((2,) * m, 0)


def main():
    n = 6
    values = set()
    checked = 0
    for b in combinations_with_replacement(range(n + 1), n):
        # Thresholds 0 and n give opposite constant rows.
        if any(b[i] == b[i + 2] for i in range(n - 2)):
            continue
        if b.count(0) + b.count(n) > 2:
            continue
        a = [[1 - 2 * (j < length) for j in range(n)] for length in b]
        p = ferrers_permanent(b)
        assert p == permanent(a)
        values.add(abs(p))
        checked += 1
    assert checked == 282
    assert values == {0, 32, 48, 64, 80, 96, 144}
    print("Ferrers order-six obstruction:", checked, sorted(values))

    values = set()
    m = 3
    for signs in product((-1, 1), repeat=(m - 1) ** 2):
        a = [[1] * m for _ in range(m)]
        for i in range(1, m):
            for j in range(1, m):
                a[i][j] = signs[(i - 1) * (m - 1) + j - 1]
        doubled = [[a[i // 2][j // 2] for j in range(2 * m)]
                   for i in range(2 * m)]
        cols = [tuple(a[i][j] for i in range(m))
                for j in range(m) for _ in range(2)]
        p = permanent(doubled)
        assert p == 2 ** m * occupation_coefficient(cols)
        values.add(abs(p))
    assert values == {48, 80, 720}
    print("Doubled rows and columns at m=3:", sorted(values))

    types = [(1,) + s for s in product((-1, 1), repeat=2)]
    cols = [v for v, multiplicity in zip(types, (1, 1, 2, 2))
            for _ in range(multiplicity)]
    repeated_rows = [list(row) for row in zip(*cols) for _ in range(2)]
    p = permanent(repeated_rows)
    assert p == 2 ** m * occupation_coefficient(cols)
    assert abs(p) == 16
    print("Unequal column multiplicities paired-row check:", p)


if __name__ == "__main__":
    main()
