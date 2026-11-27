"""Exact finite tests for the two projected normalized-adjacency row bounds."""

from fractions import Fraction as Q
from itertools import combinations
from random import Random


def graph(n, edges):
    rows = [set() for _ in range(n)]
    for u, v in edges:
        rows[u].add(v)
        rows[v].add(u)
    return rows


def complement(rows):
    vertices = set(range(len(rows)))
    return [vertices - row - {i} for i, row in enumerate(rows)]


def connected(rows):
    seen = {0}
    todo = [0]
    while todo:
        new = rows[todo.pop()] - seen
        seen.update(new)
        todo.extend(new)
    return len(seen) == len(rows)


def strict_spectral_upper(rows, level):
    """Is level strictly above the second normalized adjacency eigenvalue?"""
    degrees = list(map(len, rows))
    volume = sum(degrees)
    p, q = level.as_integer_ratio()
    # The PSD matrix H has row sums zero. Deleting the last index tests
    # definiteness modulo constants. Clear positive denominators first.
    matrix = [[(p * volume * degrees[i] if i == j else 0)
               + (q-p) * degrees[i] * degrees[j] - q * volume * (j in rows[i])
               for j in range(len(rows)-1)] for i in range(len(rows)-1)]
    previous = 1
    for i in range(len(matrix)):
        pivot = matrix[i][i]
        if pivot <= 0:
            return False
        for j in range(i+1, len(matrix)):
            for k in range(i+1, len(matrix)):
                value = matrix[j][k] * pivot - matrix[j][i] * matrix[i][k]
                assert value % previous == 0
                matrix[j][k] = value // previous
        previous = pivot
    return True


def bracket(rows):
    low, high = Q(0), Q(1)
    for _ in range(12):
        middle = (low+high)/2
        if strict_spectral_upper(rows, middle):
            high = middle
        else:
            low = middle
    return low, high


def check_rows(rows, theta, beta):
    n = len(rows)
    degrees = list(map(len, rows))
    tot = sum(degrees)
    mu = Q(tot, n)
    centered = sum((d-mu)**2 for d in degrees)
    L = 1 + n*(theta+beta)
    for i, d in enumerate(degrees):
        squared = d - Q(d*d, n)
        if centered:
            corr = sum(degrees[j]-mu for j in rows[i])
            squared -= corr*corr/centered
        assert squared >= 0
        u = (theta*d)**2
        v = L*(theta*d + Q(d*d, tot))
        # squared <= (sqrt(u)+sqrt(v))^2 without floating-point arithmetic.
        assert squared <= u+v or (squared-u-v)**2 <= 4*u*v


def check_pair(rows):
    other = complement(rows)
    if not connected(rows) or not connected(other):
        return None
    lo, hi = bracket(rows)
    clo, chi = bracket(other)
    assert lo+clo > 0
    check_rows(rows, hi, chi)
    check_rows(other, chi, hi)
    return (lo, hi), (clo, chi)


def check():
    total = connected_pairs = 0
    for n in range(2, 6):
        edges = list(combinations(range(n), 2))
        for mask in range(1 << len(edges)):
            rows = graph(n, (e for i, e in enumerate(edges) if mask >> i & 1))
            connected_pairs += check_pair(rows) is not None
            total += 1

    focus = 0
    for m in range(2, 11):
        n = 2*m
        rows = graph(n, [*combinations(range(m), 2), *((i, i+m) for i in range(m))])
        (lo, hi), (clo, chi) = check_pair(rows)
        assert (1+n*lo)**2 <= 2*n+1 <= (1+n*hi)**2
        assert clo <= Q(1, n-2) <= chi
        focus += 1

    rng = Random(495)
    extra = 0
    for n in range(6, 14):
        for density in (0.2, 0.4, 0.6, 0.8):
            for _ in range(5):
                rows = graph(n, (e for e in combinations(range(n), 2) if rng.random() < density))
                extra += check_pair(rows) is not None
    assert extra and connected_pairs
    print(f"All {total} labelled graph inputs of orders 2–5, including {connected_pairs} connected complementary pairs.")
    print(f"Both spectra and projected row bounds verified on {focus} focus graphs of orders 4–20.")
    print(f"Additional connected complementary pairs with both row checks: {extra}.")


if __name__ == "__main__":
    check()
