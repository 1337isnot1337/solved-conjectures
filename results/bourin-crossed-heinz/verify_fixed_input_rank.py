"""Exact finite checks of moment pruning, isometric dilation and the Schur budget."""

from fractions import Fraction as F


def transpose(a):
    return [list(row) for row in zip(*a)]


def product(a, b):
    return [[sum(x * y for x, y in zip(row, col)) for col in zip(*b)] for row in a]


def add(a, b, sign=1):
    return [[x + sign * y for x, y in zip(u, v)] for u, v in zip(a, b)]


def diagonal(xs):
    return [[x if i == j else F(0) for j in range(len(xs))] for i, x in enumerate(xs)]


def identity(n):
    return diagonal([F(1)] * n)


def outer(x):
    return [[u * v for v in x] for u in x]


def scale(a, c):
    return [[v * c for v in row] for row in a]


def inverse(a):
    n = len(a)
    rows = [row[:] + unit for row, unit in zip(a, identity(n))]
    for j in range(n):
        pivot = next(i for i in range(j, n) if rows[i][j])
        rows[j], rows[pivot] = rows[pivot], rows[j]
        rows[j] = [x / rows[j][j] for x in rows[j]]
        for i in range(n):
            if i != j:
                rows[i] = [x - rows[i][j] * y for x, y in zip(rows[i], rows[j])]
    return [row[n:] for row in rows]


def is_positive(a):
    """Rational symmetric elimination includes zero pivots at the boundary."""
    assert a == transpose(a)
    while a:
        pivot = a[0][0]
        if pivot < 0 or (not pivot and any(a[0])):
            return False
        rest = [row[1:] for row in a[1:]]
        if pivot:
            rest = add(rest, scale(outer(a[0][1:]), 1 / pivot), -1)
        a = rest
    return True


def dependence(columns):
    """Find a linear relation among the current rank-one moment vectors."""
    rows = transpose(columns)
    count = len(columns)
    pivot_columns = []
    r = 0
    for col in range(count):
        pivot = next((i for i in range(r, len(rows)) if rows[i][col]), None)
        if pivot is None:
            continue
        rows[r], rows[pivot] = rows[pivot], rows[r]
        rows[r] = [v / rows[r][col] for v in rows[r]]
        for i in range(len(rows)):
            if i != r:
                rows[i] = [u - rows[i][col] * v for u, v in zip(rows[i], rows[r])]
        pivot_columns.append(col)
        r += 1
        if r == len(rows):
            break
    free = next((i for i in range(count) if i not in pivot_columns), None)
    if free is None:
        return None
    vector = [F(0)] * count
    vector[free] = F(1)
    for i, col in enumerate(pivot_columns):
        vector[col] = -rows[i][free]
    return vector


def moments(atom, h, q):
    u, v = atom[0]
    root = atom[1]
    return [w * x for w in (1, root, root ** (h - 1), 1 / (q - root ** h))
            for x in (u * u, u * v, v * v)]


def prune(atoms, h, q):
    while True:
        direction = dependence([moments(a, h, q) for a in atoms])
        if direction is None:
            return atoms
        step = min(a[2] / v for a, v in zip(atoms, direction) if v > 0)
        updated = [(a[0], a[1], a[2] - step * v) for a, v in zip(atoms, direction)]
        assert all(a[2] >= 0 for a in updated)
        atoms = [a for a in updated if a[2]]


def fixture(h, q):
    rotations = [(1, 0, 1), (3, 4, 5), (5, 12, 13), (8, 15, 17), (7, 24, 25),
                 (20, 21, 29), (12, 35, 37), (9, 40, 41), (28, 45, 53)]
    atoms = []
    for a, b, c in rotations:
        for vector in ((F(a, c), F(b, c)), (F(-b, c), F(a, c))):
            root = F(len(atoms) + 1, 2 * len(rotations))
            assert root ** h < q
            atoms.append((vector, root, F(1, len(rotations))))
    return atoms


def model(atoms, h, q, high):
    """Use a weighted rational ambient inner product instead of irrational square roots."""
    j = [[F(1), F(0), F(0)]] if high else []
    j.extend(([F(0)] if high else []) + list(a[0]) for a in atoms)
    roots = ([F(2)] if high else []) + [a[1] for a in atoms]
    metric = diagonal(([F(1)] if high else []) + [a[2] for a in atoms])
    adjoint = product(transpose(j), metric)
    assert product(adjoint, j) == identity(len(j[0]))
    yy = [v ** h for v in roots]
    functions = ([F(1)] * len(roots), roots, [v ** (h - 1) for v in roots],
                 [1 / (q - v) for v in yy])
    stored = [product(product(adjoint, diagonal(v)), j) for v in functions]
    return j, adjoint, metric, roots, yy, stored


def check_budget(data, q, change, expected):
    j, adjoint, metric, _, ys, _ = data
    actual = add(diagonal([q - y for y in ys]), product(product(j, change), adjoint))
    assert is_positive(product(metric, actual)) == expected


def check_frames(data, h):
    j, adjoint, metric, roots, _, _ = data
    d = len(j[0])
    v = [F(1, 3), F(2, 3), F(2, 3)] if d == 3 else [F(3, 5), F(4, 5)]
    projection = product(product(j, outer(v)), adjoint)
    # The genuine positive first input is I + ((1/2)^h-1)P.
    def x_power(power):
        return add(identity(len(j)), scale(projection, F(1, 2) ** power - 1))
    crossed = add(product(x_power(1), diagonal([y ** (h - 1) for y in roots])),
                  product(diagonal(roots), x_power(h - 1)))
    return product(product(transpose(j), metric), product(crossed, j))


def main():
    total = 0
    for h in (2, 3, 4):
        q = F(2)
        atoms = fixture(h, q)
        reduced = prune(atoms, h, q)
        assert len(reduced) <= 12 < len(atoms)
        for high in (True, False):
            old = model(atoms, h, q, high)
            new = model(reduced, h, q, high)
            assert old[-1] == new[-1]
            assert check_frames(old, h) == check_frames(new, h)
            g_inverse = inverse(old[-1][-1])
            d = len(g_inverse)
            for residual in (identity(d), outer([F(1)] * d), scale(identity(d), -1)):
                change = add(residual, g_inverse, -1)
                for model_data in (old, new):
                    check_budget(model_data, q, change, is_positive(residual))
                    total += 1
        print(f"At exponent 1/{h}, exact quadrature retained {len(reduced)} of {len(atoms)} atoms.")
    print(f"All six pairs of genuine crossed frame matrices and {total} full Schur budgets agree.")


if __name__ == "__main__":
    main()
