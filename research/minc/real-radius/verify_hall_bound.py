"""Exact checks for the Hall upper bound and four-block permanent expansion."""

from fractions import Fraction as F
from math import factorial, prod


def block_values(n, p, q):
    s = n - p
    return F(1, q), F(0), -F(p-q, q*s), F(1, s)


def matrix(n, p, q, values):
    return [[values[2*(i >= p) + (j >= q)] for j in range(n)] for i in range(n)]


def permanent(rows):
    partial = {0: F(1)}
    for row in rows:
        following = {}
        for mask, weight in partial.items():
            for j, value in enumerate(row):
                if mask & (1 << j) == 0:
                    key = mask | (1 << j)
                    following[key] = following.get(key, 0) + weight * value
        partial = following
    return partial[(1 << len(rows)) - 1]


def check():
    rectangles = 0
    expansions = 0
    for n in range(3, 11):
        uniform = F(1, n)
        distances = []
        for p in range(2, n):
            for q in range(1, p):
                values = block_values(n, p, q)
                rows = matrix(n, p, q, values)
                assert all(sum(r) == 1 for r in rows)
                assert all(sum(col) == 1 for col in zip(*rows))
                assert permanent(rows) == 0
                dist2 = sum((x-uniform)**2 for row in rows for x in row)
                assert dist2 == F(p*(n-q), q*(n-p))
                distances.append(dist2)
                rectangles += 1
                if p != q+1:
                    continue
                s, t = n-p, n-q
                for h in [F(1, 53), F(1, 7), F(1, 2), F(1)]:
                    a, b, g, d = vals = [(1-h)*x + h*uniform for x in values]
                    all_classes = 0
                    for j in range(min(q, s) + 1):
                        count = prod(map(factorial, (p,s,q,t))) // prod(
                            map(factorial, (q-j,j+1,j,s-j)))
                        all_classes += count * a**(q-j)*b**(j+1)*g**j*d**(s-j)
                    assert permanent(matrix(n, p, q, vals)) == all_classes
                    expansions += 1
        sharp2 = F(n+1, n-1)**2 if n % 2 else F(n+2, n-2)
        assert min(distances) == sharp2
    print(f"Passed {rectangles} zero rectangles and {expansions} path identities.")


if __name__ == "__main__":
    check()
