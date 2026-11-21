"""Exact checks for the Hadamard doubling identities and obstruction.

No optimization, new-order search, or numerical approximation is used.
The all-order argument is in hadamard_doubling_obstruction.md.
"""

from itertools import permutations
from math import prod


def permanent_and_cofactors(a):
    """Integer subset DP and its reverse derivative, independently of cycles."""
    n = len(a)
    size = 1 << n
    values = [0] * size
    values[0] = 1
    for mask in range(1, size):
        i = mask.bit_count() - 1
        bits = mask
        while bits:
            bit = bits & -bits
            j = bit.bit_length() - 1
            values[mask] += a[i][j] * values[mask ^ bit]
            bits ^= bit
    adjoints = [0] * size
    adjoints[-1] = 1
    cofactors = [[0] * n for _ in range(n)]
    for mask in range(size - 1, 0, -1):
        i = mask.bit_count() - 1
        derivative = adjoints[mask]
        if not derivative:
            continue
        bits = mask
        while bits:
            bit = bits & -bits
            j = bit.bit_length() - 1
            previous = mask ^ bit
            cofactors[i][j] += derivative * values[previous]
            adjoints[previous] += derivative * a[i][j]
            bits ^= bit
    return values[-1], cofactors


def doubled(a):
    n = len(a)
    return [
        [(-1 if i >= n and j >= n else 1) * a[i % n][j % n]
         for j in range(2 * n)]
        for i in range(2 * n)
    ]


def even_closed_cycles(mapping, n):
    """The mapping is either a permutation or one directed path plus cycles."""
    done = set()
    for start in range(n):
        if start in done:
            continue
        current = start
        order = {}
        while current is not None and current not in done and current not in order:
            order[current] = len(order)
            current = mapping.get(current)
        if current in order and (len(order) - order[current]) % 2:
            return False
        done.update(order)
    return True


def cycle_path_sums(a):
    n = len(a)
    indices = tuple(range(n))
    u = 0
    t = [[0] * n for _ in range(n)]
    for sigma in permutations(indices):
        inverse = {column: row for row, column in enumerate(sigma)}
        first = prod(a[row][sigma[row]] for row in indices)
        for tau in permutations(indices):
            relative = {row: inverse[tau[row]] for row in indices}
            if even_closed_cycles(relative, n):
                u += first * prod(a[row][tau[row]] for row in indices)
        for missing_row in indices:
            rows = tuple(row for row in indices if row != missing_row)
            for missing_column in indices:
                columns = tuple(column for column in indices if column != missing_column)
                for images in permutations(columns):
                    tau = dict(zip(rows, images))
                    relative = {row: inverse[tau[row]] for row in rows}
                    if even_closed_cycles(relative, n):
                        t[missing_row][missing_column] += first * prod(
                            a[row][tau[row]] for row in rows
                        )
    return u, t


def restricted_border(a, r, c, corner):
    n = len(a)
    core = doubled(a)
    return [core[i] + [r[i % n]] for i in range(2 * n)] + [c + c + [corner]]


def q(n):
    return 1 << (n - ((n + 1).bit_length() - 1))


def main():
    examples = [
        [[3]],
        [[1, 2], [-3, 4]],
        [[1, 1, 1], [1, -1, 1], [1, 1, -1]],
        [[1, 0, 2, -1], [-2, 1, 1, 3], [1, -1, 2, 0], [2, 1, -3, 1]],
    ]
    for a in examples:
        n = len(a)
        u, t = cycle_path_sums(a)
        p, cofactor = permanent_and_cofactors(doubled(a))
        expected = 0 if n % 2 else (-1) ** (n // 2) * 2**n * u
        assert p == expected
        factor = (-1) ** ((n + 1) // 2) * 2 ** (n - 1)
        for i in range(n):
            for j in range(n):
                m = factor * t[i][j]
                assert cofactor[i][j] == m
                assert cofactor[i + n][j] == (-1) ** n * m
                assert cofactor[i][j + n] == (-1) ** n * m
                assert cofactor[i + n][j + n] == -m
        r = [(-1) ** i for i in range(n)]
        c = [(-1) ** (i // 2) for i in range(n)]
        corner = -1
        value = sum(r[i] * t[i][j] * c[j] for i in range(n) for j in range(n))
        expected_border = (
            (-1) ** ((n + 3) // 2) * 2**n * value
            if n % 2
            else (-1) ** (n // 2) * 2**n * (corner * u + value)
        )
        assert permanent_and_cofactors(restricted_border(a, r, c, corner))[0] == expected_border
    print("Cycle, path, cofactor-block, and border identities: exact checks passed.")

    n = 5
    a = [[1 - 2 * (i == j) for j in range(n)] for i in range(n)]
    assert permanent_and_cofactors(a)[0] == q(5) == 8
    core = doubled(a)
    p, cofactors = permanent_and_cofactors(core)
    assert p == 0
    for i in range(n):
        for j in range(n):
            assert cofactors[i][j] == -192 * (1 + (i == j))
    assert all(value % 3 == 0 for row in cofactors for value in row)
    assert q(11) == 256 and q(11) % 3 != 0
    assert q(10) == 128 and q(10) % 3 != 0
    modified = [row[:] for row in core]
    modified[1][8] *= -1
    assert permanent_and_cofactors(modified)[0] % 3 == 0
    border = [row + [(-1) ** (i // 3)] for i, row in enumerate(core)]
    border.append([(-1) ** (j // 2) for j in range(2 * n)] + [-1])
    assert permanent_and_cofactors(border)[0] % 3 == 0
    print("Published order-five seed, exact cofactor values, and target arithmetic: passed.")

    n = 7
    a = [[1 - 2 * (i == j) for j in range(n)] for i in range(n)]
    core = doubled(a)
    _, cofactors = permanent_and_cofactors(core)
    assert all(value % 15 == 0 for row in cofactors for value in row)
    core[0][n + 1] *= -1
    border = [row + [(-1) ** i] for i, row in enumerate(core)]
    border.append([(-1) ** (j // 2) for j in range(2 * n)] + [1])
    assert permanent_and_cofactors(border)[0] % 3 == 0
    print("Odd-prime minor divisibility and one-change/one-border illustration: passed.")


if __name__ == "__main__":
    main()
