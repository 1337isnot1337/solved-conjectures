"""Cross-check background replacement and convolution without a compound matrix."""

from itertools import combinations, product
from math import comb
from sympy import Matrix, eye, zeros


def alternating_coefficient(matrix, k, insertions, gaps, background):
    """Mixed coefficient after the unmarked background is fixed independently."""
    n = matrix.rows
    product0 = eye(n)
    for gap in gaps:
        product0 = product0 * gap * matrix
    entries = sum(map(len, insertions))
    total = 0
    for switches in product((0, 1), repeat=entries):
        cursor = iter(switches)
        marked = eye(n)
        for gap, positions in zip(gaps, insertions):
            factor = matrix.copy()
            for i, j in positions:
                factor[i, j] += next(cursor)
            marked = marked * gap * factor
        result = background + marked - product0
        total += (-1)**(entries - sum(switches) + k) * result.charpoly().all_coeffs()[k]
    return int(total)


def compound(matrix, k):
    bins = list(combinations(range(matrix.rows), k))
    return Matrix([[matrix.extract(rows, cols).det() for cols in bins] for rows in bins])


def derivative(matrix, k, edges):
    """Build an exterior derivative independently from its forced minor entries."""
    bins = list(combinations(range(matrix.rows), k))
    result = zeros(len(bins))
    for i, rows in enumerate(bins):
        for j, cols in enumerate(bins):
            if not all(r in rows and c in cols for r, c in edges):
                continue
            sub = matrix.extract(rows, cols)
            sign = 1
            rr, cc = list(rows), list(cols)
            for r, c in edges:
                rpos, cpos = rr.index(r), cc.index(c)
                sign *= (-1)**(rpos + cpos)
                sub.row_del(rpos)
                sub.col_del(cpos)
                rr.pop(rpos)
                cc.pop(cpos)
            result[i, j] = sign * sub.det()
    return result


def newton_coefficients(values):
    terms = []
    while values:
        terms.append(values[0])
        values = [right-left for left, right in zip(values, values[1:])]
    return terms


def main():
    n, k = 4, 3
    h = Matrix([1, 1, 1, 1]) * Matrix([[1, -1, 2, -2]])
    a = eye(n) + h
    assert h*h == zeros(n)
    adjoints = [[(0, 2), (2, 1)], [(1, 3), (3, 0)]]
    outer = compound(a, k)
    e1, e2 = [derivative(a, k, group) for group in adjoints]
    # A^a=I+aH lets the monomial separation be checked in just two variables.
    samples = []
    for t in range(7):
        background = eye(n) + (2+t)*h
        degree = sum(map(len, adjoints))
        # One extra point in each variable independently checks the degree cap.
        grid = [[alternating_coefficient(a, k, adjoints, [eye(n)+a1*h, eye(n)+a2*h],
                                         background) for a2 in range(degree+2)]
                for a1 in range(degree+2)]
        along_second = [newton_coefficients(row) for row in grid]
        coeffs = [newton_coefficients(list(column)) for column in zip(*along_second)]
        assert not any(coeffs[-1]) and not any(row[-1] for row in coeffs)
        pooled = sum(val * comb(t+1, i+j+1)
                     for j, row in enumerate(coeffs) for i, val in enumerate(row)
                     if i+j <= t)
        direct = sum(int((outer**a1 * e1 * outer**(t-a1) * e2).trace())
                     for a1 in range(t+1))
        assert pooled == direct
        samples.append(pooled)
    assert len(set(samples)) == len(samples) and any(samples)
    print("Exact two-insertion convolution:", samples)


if __name__ == "__main__":
    main()
