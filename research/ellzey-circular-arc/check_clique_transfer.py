"""Exact arithmetic checks for cyclic clique-chain transfer. Not a proof."""
from itertools import combinations, product
from math import prod


def qinteger(k, q):
    return sum(q**j for j in range(k))


def qfactorial(k, q):
    return prod(qinteger(j, q) for j in range(1, k + 1))


def elementary(x, m):
    return sum(prod(S) for S in combinations(x, m))


def c(h, m, ell, q):
    if m <= h < ell - 1:
        return q**m * qinteger(h - m + 1, q)
    if ell - 1 <= h < m:
        return q**(h + 1) * qinteger(m - h - 1, q)
    return 0


def transfer(h, x, q):
    N = len(x)
    return [
        [
            0 if a == b else x[b] * q**(a < b) * qfactorial(h, q) * sum(
                prod(x[d] * q**((a < d) + (d < b)) for d in S)
                for S in combinations(tuple(d for d in range(N) if d not in (a, b)), h)
            )
            for a in range(N)
        ]
        for b in range(N)
    ]


def elementary_transfer(h, x, q):
    N = len(x)
    return [
        [
            qfactorial(h, q) * c(h, j + h + 1 - ell, ell, q)
            * elementary(x, j + h + 1 - ell)
            if 0 <= j + h + 1 - ell <= N else 0
            for j in range(1, N + 1)
        ]
        for ell in range(1, N + 1)
    ]


def matmul(A, B):
    BT = list(zip(*B))
    return [[sum(a * b for a, b in zip(row, col)) for col in BT] for row in A]


def check_conjugacy(x, q):
    N = len(x)
    # Compute the common basis directly from its subset definition.
    F = [
        [
            x[b] * sum(
                prod(x[d] * q**(d < b) for d in S)
                for S in combinations(tuple(d for d in range(N) if d != b), j - 1)
            )
            for j in range(1, N + 1)
        ]
        for b in range(N)
    ]
    for h in range(N - 1):
        assert matmul(transfer(h, x, q), F) == matmul(F, elementary_transfer(h, x, q))


def trace_formula(sizes, x, q):
    M = elementary_transfer(sizes[0] - 2, x, q)
    for s in sizes[1:]:
        M = matmul(elementary_transfer(s - 2, x, q), M)
    return sum(M[i][i] for i in range(len(x)))


def brute_coloring(sizes, x, q):
    r = len(sizes)
    n = r
    edges = []
    for i, s in enumerate(sizes):
        block = (i,) + tuple(range(n, n + s - 2)) + ((i + 1) % r,)
        n += s - 2
        edges.extend(combinations(block, 2))
    result = 0
    for colors in product(range(len(x)), repeat=n):
        if any(colors[i] == colors[j] for i, j in edges):
            continue
        result += prod(x[c] for c in colors) * q**sum(colors[i] < colors[j] for i, j in edges)
    return result


if __name__ == "__main__":
    for q in (0, 1, 2, -1, 3):
        check_conjugacy((1, 2, 3, 5, 7, 11), q)
    sizes_list = [(2, 2, 2), (3, 2, 2), (3, 3, 3), (4, 3, 2), (2, 3, 2, 4)]
    for sizes in sizes_list:
        n = sum(s - 1 for s in sizes)
        for q in (1, 2):
            x = tuple(range(1, n + 1))
            expected = brute_coloring(sizes, x, q)
            assert trace_formula(sizes, x, q) == expected
        print("Direct colorings agree with the elementary trace:", sizes)

