"""Check the column encoding on explicit grids with multiple faces per cell."""

from fractions import Fraction
from itertools import combinations, permutations, product
from math import isclose, log2, prod


def entropy(p):
    return sum(-x * log2(x) for x in (p, 1 - p) if x)


def grid(a, b):
    # Each bit compares one bit of a one-hot row label with one bit of a
    # one-hot column label. Only the second copy may be erased by a variant.
    coordinates = list(product(range(a), range(b), range(2)))
    rows = [tuple(int(s == i) for s, t, copy in coordinates) for i in range(a)]
    columns = [tuple(int(t == j) for s, t, copy in coordinates) for j in range(b)]
    cells = {}
    for i, row in enumerate(rows):
        for j, column in enumerate(columns):
            hull = tuple(r if r == c else None for r, c in zip(row, column))
            variants = []
            for bit, (s, t, copy) in enumerate(coordinates):
                if copy == 1 and hull[bit] is not None:
                    variants.append(hull[:bit] + (None,) + hull[bit + 1:])
            cells[i, j] = variants
    return rows, columns, cells


def compatible(f, g):
    return all(x is None or y is None or x == y for x, y in zip(f, g))


def check(a, b):
    rows, columns, cells = grid(a, b)
    m = len(cells[0, 0])
    faces = [(i, j, f) for (i, j), fs in cells.items() for f in fs]
    assert len(faces) == a * b * m and m > 1
    assert len({f for i, j, f in faces}) == len(faces)
    assert len({f.count(None) for i, j, f in faces}) == 1
    for (i, j, f), (k, l, g) in combinations(faces, 2):
        assert compatible(f, g) == (i == k or j == l)

    width = len(rows[0])
    v = [Fraction(sum(c[t] for c in columns), b) for t in range(width)]
    observed_cost = 0.0
    for i, k in permutations(range(a), 2):
        bits = [t for t in range(width) if rows[i][t] != rows[k][t]]
        means = []
        largest = []
        for j in range(b):
            masses = []
            for f, g in product(cells[i, j], cells[k, j]):
                # Intersect their restrictions at every differing row bit.
                fixed = [(t, f[t] if f[t] is not None else g[t]) for t in bits]
                mass = prod(v[t] if value == 1 else 1 - v[t]
                            for t, value in fixed if value is not None)
                assert mass > 0
                masses.append(mass)
            means.append(sum(-log2(q) for q in masses) / len(masses))
            largest.append(max(masses))
        # Choices of the pair of faces in distinct columns are independent.
        assert sum(largest) <= 1
        observed_cost += sum(means) / (b * a * a)

    predicted_cost = d = mask_entropy = 0.0
    for t in range(width):
        u = Fraction(sum(r[t] for r in rows), a)
        p = v[t]
        w = u * (1 - p) + (1 - u) * p
        d += w
        loss = 0.0
        deficit = 0.0
        for value, column_prob, opposite_row in ((0, 1 - p, u), (1, p, 1 - u)):
            agreeing = [f for i, j, f in faces if rows[i][t] == columns[j][t] == value]
            alpha = Fraction(len(agreeing), len(faces))
            if alpha:
                e = Fraction(sum(f[t] is None for f in agreeing), len(agreeing))
                loss += 2 * opposite_row * alpha * e * -log2(column_prob)
                deficit += alpha * (1 - entropy(e))
                mask_entropy += alpha * entropy(e)
        information = 2 * u * (1 - u) * entropy(p) - loss
        assert deficit + 10 * (w - information) >= 0.4 * w - 1e-12
        predicted_cost += information

    assert isclose(observed_cost, predicted_cost, abs_tol=1e-11)
    assert (1 - 1/a) * log2(b) <= predicted_cost <= d
    assert log2(m) <= mask_entropy
    print(f"{a} x {b}, {m} variants, {len(faces)} faces; column cost {predicted_cost:.9f} bits")


if __name__ == "__main__":
    for sides in ((2, 2), (2, 3), (3, 4), (4, 3)):
        check(*sides)
