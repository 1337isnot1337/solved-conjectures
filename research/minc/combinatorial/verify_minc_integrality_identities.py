"""Exact checks of identities in minc_integrality_audit.md.

This is not an enumeration of conjecture cases or a minimization search.
The all-order arguments are in the note.
"""

from fractions import Fraction


def permanent(a):
    n = len(a)
    dp = [0] * (1 << n)
    dp[0] = 1
    for mask in range(1, 1 << n):
        i = mask.bit_count() - 1
        bits = mask
        while bits:
            bit = bits & -bits
            j = bit.bit_length() - 1
            dp[mask] += a[i][j] * dp[mask ^ bit]
            bits ^= bit
    return dp[-1]


def minor(a, rows, columns):
    return [
        [a[i][j] for j in range(len(a)) if j not in columns]
        for i in range(len(a))
        if i not in rows
    ]


def switch(a, i, j, r, s):
    b = [row[:] for row in a]
    b[i][j] -= 1
    b[r][s] -= 1
    b[i][s] += 1
    b[r][j] += 1
    assert all(x >= 0 for row in b for x in row)
    return b


def check_switch_identity(a):
    n = len(a)
    k = sum(a[0])
    assert all(sum(row) == k for row in a)
    assert all(sum(a[i][j] for i in range(n)) == k for j in range(n))
    p = permanent(a)
    g = [
        [permanent(minor(a, {i}, {j})) for j in range(n)]
        for i in range(n)
    ]
    row_sums = [sum(row) for row in g]
    column_sums = [sum(g[i][j] for i in range(n)) for j in range(n)]
    checks = 0
    for i in range(n):
        for j in range(n):
            if not a[i][j]:
                continue
            drift = 0
            for r in range(n):
                for s in range(n):
                    if not a[r][s]:
                        continue
                    h = 0
                    if i != r and j != s:
                        h = permanent(minor(a, {i, r}, {j, s}))
                    predicted = -g[i][j] - g[r][s] + g[i][s] + g[r][j] + 2*h
                    actual = permanent(switch(a, i, j, r, s)) - p
                    assert predicted == actual
                    drift += a[r][s] * actual
                    checks += 1
            expected = (
                k * (row_sums[i] + column_sums[j])
                - n*p
                - (n*k - 2*n + 2)*g[i][j]
            )
            assert drift == expected
    return checks


def check_component_identity():
    # Three-regular blocks J_3 and [3].
    a = [[1, 1, 1, 0], [1, 1, 1, 0],
         [1, 1, 1, 0], [0, 0, 0, 3]]
    p1, p2, g1, g2 = 6, 3, 2, 1
    b = switch(a, 0, 0, 3, 3)
    assert permanent(a) == p1*p2
    assert permanent(b) == (p1-g1)*(p2-g2) + g1*g2
    assert permanent(b) < permanent(a)
    q1, q2 = Fraction(g1, p1), Fraction(g2, p2)
    assert Fraction(permanent(b)-permanent(a), permanent(a)) == (
        -q1*(1-q2)-q2*(1-q1)
    )


if __name__ == "__main__":
    matrices = [
        [[1, 0], [0, 1]],
        [[1, 1, 1], [1, 1, 1], [1, 1, 1]],
        [[1, 1, 1, 0], [1, 1, 1, 0],
         [1, 0, 0, 2], [0, 1, 1, 1]],
        [[0, 2, 0, 1, 0, 0], [1, 0, 0, 2, 0, 0],
         [0, 1, 1, 0, 1, 0], [0, 0, 2, 0, 0, 1],
         [1, 0, 0, 0, 0, 2], [1, 0, 0, 0, 2, 0]],
    ]
    count = sum(check_switch_identity(a) for a in matrices)
    check_component_identity()
    print(f"Exact single-switch and weighted-drift identities: {count} checks.")
    print("Exact disconnected-component comparison: passed.")
