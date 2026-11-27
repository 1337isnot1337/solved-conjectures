"""Exact rational checks of the arbitrary-positive-centre resolvent argument."""
from fractions import Fraction as Q
from itertools import product


def transpose(a):
    return [list(row) for row in zip(*a)]


def multiply(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)] for row in a]


def add(a, b, weight=1):
    return [[x + weight * y for x, y in zip(row, other)] for row, other in zip(a, b)]


def diagonal(values):
    return [[Q(value if i == j else 0) for j in range(len(values))]
            for i, value in enumerate(values)]


def squared_norm(a):
    return sum(x * x for row in a for x in row)


def inverse(a):
    identity = diagonal([1] * len(a))
    rows = [row + basis for row, basis in zip(a, identity)]
    for col in range(len(rows)):
        pivot = next(i for i in range(col, len(rows)) if rows[i][col])
        rows[col], rows[pivot] = rows[pivot], rows[col]
        value = rows[col][col]
        rows[col] = [entry / value for entry in rows[col]]
        for i in range(len(rows)):
            if i != col:
                value = rows[i][col]
                rows[i] = [x - value * y for x, y in zip(rows[i], rows[col])]
    return [row[len(rows):] for row in rows]


def resolvent(a, s):
    return inverse(add(a, diagonal([s] * len(a))))


def matrix_checks():
    bounds = Q(1, 256)
    difference = [[Q(x, 1024) for x in row] for row in [(0, 1, 1), (1, 0, -1), (1, -1, 1)]]
    # The maximal absolute row sum bounds the spectral norm for this symmetric matrix.
    assert max(sum(map(abs, row)) for row in difference) <= bounds
    basis = [[Q(3, 5), Q(4, 5), Q(0)], [Q(-4, 5), Q(3, 5), Q(0)], [Q(0), Q(0), Q(1)]]
    turn = [[Q(1), Q(0), Q(0)], [Q(0), Q(5, 13), Q(12, 13)], [Q(0), Q(-12, 13), Q(5, 13)]]
    identity = diagonal([1, 1, 1])
    bases = [identity, basis, turn, multiply(basis, turn), multiply(turn, basis)]
    count = 0
    for values in ([2, 2, 8], [2, 5, 8], [5, 5, 5]):
        centre = diagonal(values)
        first = add(centre, difference, Q(1, 2))
        second = add(centre, difference, -Q(1, 2))
        # These inputs are bracketed by I and 9I and satisfy the theorem's distance bound.
        assert 9 * bounds < Q(1, 16)
        for base, k in product(bases, (1, 2, 3)):
            u = [row[:k] for row in base]
            ut = transpose(u)
            compressed = multiply(ut, multiply(centre, u))
            du = multiply(difference, u)
            leakage = add(multiply(centre, u), multiply(u, compressed), -1)
            delta = 2 * (sum(sorted(values)[-k:]) - sum(compressed[i][i] for i in range(k)))
            assert squared_norm(leakage) <= 9 * delta
            for s in (Q(0), Q(1, 8), Q(1), Q(5), Q(20)):
                rx, ry = resolvent(first, s), resolvent(second, s)
                rc, ru = resolvent(centre, s), resolvent(compressed, s)
                actual = multiply(rx, multiply(difference, multiply(ry, u)))
                ideal = multiply(rc, multiply(du, ru))
                error = add(actual, ideal, -1)
                change_left = multiply(add(rx, rc, -1), multiply(du, ru))
                intertwiner = add(multiply(ry, u), multiply(u, ru), -1)
                change_right = multiply(rx, multiply(difference, intertwiner))
                assert error == add(change_left, change_right)
                assert squared_norm(error) * (1+s)**6 <= 2 * bounds**2 * (squared_norm(du) + 9*delta)
                count += 1
    return count


def normalized_multiplier(a, b, j):
    if a == b:
        return a ** (j-6)
    return 6 * (a**j - b**j) / (j * (a**6 - b**6))


def check():
    count = matrix_checks()
    pairs = 0
    for a, b, j in product(map(Q, (1, 2, 3, 5)), map(Q, (1, 2, 3, 5)), range(1, 6)):
        value = normalized_multiplier(a, b, j) * normalized_multiplier(a, b, 6-j)
        assert 1 / max(a, b)**6 <= value <= 1
        pairs += 1
    epsilon = Q(1, 16)
    alpha = Q(9, 2) * epsilon + 2 * epsilon**2
    assert alpha < Q(1, 2)
    assert Q(1, 2) > alpha / 4
    print(f"{count} resolvent comparisons, {pairs} paired divided differences, threshold absorption verified")


if __name__ == "__main__":
    check()
