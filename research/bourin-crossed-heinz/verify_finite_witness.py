"""Check exact power rounding and cyclic-subspace compression on rational matrices."""
from fractions import Fraction as Q

from verify_arbitrary_centres import add, diagonal, multiply, transpose


def spectral_matrix(basis, values):
    scaled = [[entry * value for entry, value in zip(row, values)] for row in basis]
    return multiply(scaled, transpose(basis))


def inner(left, right):
    return sum(x * y for row, other in zip(left, right) for x, y in zip(row, other))


def projector(columns):
    orthogonal = []
    for column in columns:
        remainder = column.copy()
        for direction, norm_squared in orthogonal:
            coefficient = sum(x*y for x, y in zip(remainder, direction)) / norm_squared
            remainder = [x - coefficient*y for x, y in zip(remainder, direction)]
        length = sum(x*x for x in remainder)
        if length:
            orthogonal.append((remainder, length))
    size = len(columns[0])
    result = [[sum(v[i]*v[j]/w for v, w in orthogonal)
               for j in range(size)] for i in range(size)]
    return result, len(orthogonal)


def rounded_roots(first, second, exponent, cells):
    all_roots = sorted(set(first + second))
    lookup = {}
    least = {}
    for root in all_roots:
        value = root**exponent + root**(6 - exponent)
        cell = min(cells-1, int(cells * value / 2))
        lower = least.setdefault(cell, root)
        lookup[root] = lower
        assert lower <= root
        for power in (exponent, 6-exponent):
            assert root**power-lower**power <= Q(2, cells)
    return [[lookup[x] for x in roots] for roots in (first, second)]


def interpolated_action(a, v, roots, power):
    levels = sorted(set(roots))
    result = [[Q(0) for x in row] for row in v]
    for source in levels:
        term = v
        for other in levels:
            if other != source:
                term = add(multiply(a, term), term, -other**6)
                scale = source**6-other**6
                term = [[x/scale for x in row] for row in term]
        result = add(result, term, source**power)
    return result


def check_case(bases, original, exponent, cells, k):
    size = len(original[0])
    u = [row[:k] for row in bases[1]]
    v = [row[3:3+k] for row in bases[0]]
    roots = rounded_roots(*original, exponent, cells)
    columns = []
    for basis, values in zip(bases, roots):
        for level in sorted(set(values)):
            indicator = [int(value == level) for value in values]
            projection = spectral_matrix(basis, indicator)
            for isometry in (u, v):
                columns.extend(transpose(multiply(projection, isometry)))
    p, dimension = projector(columns)
    assert dimension <= 4*k*cells
    assert multiply(p, u) == u and multiply(p, v) == v
    original_actions = []
    compressed_actions = []
    for basis, values in zip(bases, roots):
        a = spectral_matrix(basis, [x**6 for x in values])
        compressed = multiply(p, multiply(a, p))
        original_actions.append([
            multiply(spectral_matrix(basis, [x**power for x in values]), isometry)
            for power, isometry in ((exponent, u), (6-exponent, v))
        ])
        compressed_actions.append([
            interpolated_action(compressed, isometry, values, power)
            for power, isometry in ((exponent, u), (6-exponent, v))
        ])
    assert original_actions == compressed_actions
    for a, b in [(0, 1), (1, 0)]:
        assert inner(original_actions[a][0], original_actions[b][1]) == inner(
            compressed_actions[a][0], compressed_actions[b][1]
        )
    return dimension < size


def main():
    n = 16
    identity = diagonal([1]*n)
    walsh = [[Q((-1)**((i & j).bit_count()), 4) for j in range(n)] for i in range(n)]
    assert multiply(walsh, transpose(walsh)) == identity
    roots = [[Q((3*i+1) % 9, 8) for i in range(n)], [Q((5*i+3) % 9, 8) for i in range(n)]]
    smaller = 0
    tests = 0
    for k in (1, 2):
        for exponent in (1, 3, 5):
            for cells in (2, 3):
                smaller += check_case([identity, walsh], roots, exponent, cells, k)
                tests += 1
    assert smaller > 0
    print(f"{tests} exact crossed-product variational tests; "
          f"{smaller} use a strictly smaller comparison space")


if __name__ == "__main__":
    main()
