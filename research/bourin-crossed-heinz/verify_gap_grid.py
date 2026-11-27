"""Exact checks of the grid, endpoint factorization and Ky Fan slack formula."""

from fractions import Fraction as F
from math import ceil


def product(left, right):
    return tuple(tuple(sum(a * b for a, b in zip(row, col))
                       for col in zip(*right)) for row in left)


def combine(left, right, sign=1):
    return tuple(tuple(a + sign * b for a, b in zip(u, v))
                 for u, v in zip(left, right))


def power(matrix, exponent):
    result = ((1, 0), (0, 1))
    while exponent:
        if exponent % 2:
            result = product(result, matrix)
        matrix = product(matrix, matrix)
        exponent //= 2
    return result


def check_endpoint():
    identity = ((1, 0), (0, 1))
    basis = ((F(3, 5), F(-4, 5)), (F(4, 5), F(3, 5)))
    tests = 0
    for small in (F(0), F(1, 32), F(1, 4)):
        a = ((small, 0), (0, F(1, 2)))
        diagonal = ((F(1, 3), 0), (0, F(2, 3)))
        b = product(product(basis, diagonal), tuple(zip(*basis)))
        for q in range(2, 13):
            x, y = power(a, q), power(b, q)
            for p in range(1, q // 2 + 1):
                xt, yt = power(a, p), power(b, p)
                xs, ys = power(a, q - p), power(b, q - p)
                c = combine(product(xt, ys), product(yt, xs))
                h = combine(combine(xt, yt), identity, -1)
                difference = combine(c, product(h, combine(x, y)), -1)
                left = combine(product(xt, combine(ys, y, -1)),
                               product(yt, combine(xs, x, -1)))
                right = combine(product(combine(identity, xt, -1), x),
                                product(combine(identity, yt, -1), y))
                assert difference == combine(left, right)
                tests += 1
    return tests


def check_slack():
    tests = 0
    for values in ((F(2), F(1), F(1), F(0)), (F(1),) * 5, (F(2, 3), F(1, 4))):
        for rank in range(1, len(values) + 1):
            exact = sum(values[:rank])
            samples = set(values) | {F(-1), F(3), F(5, 8)}
            for s in samples:
                slack = rank * s + sum(max(F(0), v - s) for v in values)
                assert slack >= exact
                if s == values[rank - 1]:
                    assert slack == exact
                tests += 1
    return tests


def check_grid():
    tests = 0
    for eta in map(F, ('1', '3/4', '1/3', '1/8', '1/17')):
        h = eta / 6
        levels = ceil(16 / eta)
        intervals = ceil((F(1, 2) - h) / (eta * h / 16))
        mesh = (F(1, 2) - h) / intervals
        assert h + intervals * mesh == F(1, 2)
        assert 3 * h <= eta / 2
        assert 4 * mesh / h + F(8, levels) <= 3 * eta / 4
        tests += 1
    return tests


if __name__ == "__main__":
    print(f"{check_endpoint()} exact endpoint identities")
    print(f"{check_slack()} exact eigenvalue slack tests")
    print(f"{check_grid()} exact uniform error budgets")
