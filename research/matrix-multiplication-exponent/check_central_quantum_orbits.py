"""Exact rank certificate for the central k=4, t=8 source.

All source coefficients used in the minor are computed in Q[z]/(z^4+1),
then verified to be rational integers. Modular elimination only selects
the minor; its final determinant is evaluated over Q.
"""

from fractions import Fraction as F
from itertools import combinations, permutations

from check_central_quantum_source import labels


ZERO = (F(0),) * 4
ONE = (F(1), F(0), F(0), F(0))


def add(a, b):
    return tuple(x + y for x, y in zip(a, b))


def scale(c, a):
    return tuple(c * x for x in a)


def mul(a, b):
    out = [F(0)] * 4
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[(i + j) % 4] += x * y * (-1 if i + j >= 4 else 1)
    return tuple(out)


def zpow(a):
    a %= 8
    out = [F(0)] * 4
    out[a % 4] = F(-1 if a >= 4 else 1)
    return tuple(out)


def inv(a):
    cols = [mul(a, zpow(j)) for j in range(4)]
    mat = [[cols[j][i] for j in range(4)] + [F(i == 0)] for i in range(4)]
    for j in range(4):
        pivot = next(i for i in range(j, 4) if mat[i][j])
        mat[j], mat[pivot] = mat[pivot], mat[j]
        value = mat[j][j]
        mat[j] = [x / value for x in mat[j]]
        for i in range(4):
            if i == j:
                continue
            value = mat[i][j]
            mat[i] = [x - value * y for x, y in zip(mat[i], mat[j])]
    result = tuple(mat[i][-1] for i in range(4))
    assert mul(a, result) == ONE
    return result


def determinant(mat):
    total = ZERO
    for perm in permutations(range(len(mat))):
        sign = (-1) ** sum(perm[i] > perm[j] for i in range(len(mat)) for j in range(i + 1, len(mat)))
        term = ONE
        for i, j in enumerate(perm):
            term = mul(term, mat[i][j])
        total = add(total, scale(sign, term))
    return total


def rational_determinant(mat):
    mat = [[F(x) for x in row] for row in mat]
    result = F(1)
    for j in range(len(mat)):
        pivot = next((i for i in range(j, len(mat)) if mat[i][j]), None)
        if pivot is None:
            return F(0)
        if pivot != j:
            mat[j], mat[pivot] = mat[pivot], mat[j]
            result = -result
        value = mat[j][j]
        result *= value
        for i in range(j + 1, len(mat)):
            factor = mat[i][j] / value
            mat[i] = [x - factor * y for x, y in zip(mat[i], mat[j])]
    return result


def pivot_columns(mat, prime):
    mat = [row[:] for row in mat]
    pivots = []
    for j in range(len(mat[0])):
        r = len(pivots)
        pivot = next((i for i in range(r, len(mat)) if mat[i][j] % prime), None)
        if pivot is None:
            continue
        mat[r], mat[pivot] = mat[pivot], mat[r]
        factor = pow(mat[r][j], -1, prime)
        mat[r] = [x * factor % prime for x in mat[r]]
        for i in range(r + 1, len(mat)):
            factor = mat[i][j]
            mat[i] = [(x - factor * y) % prime for x, y in zip(mat[i], mat[r])]
        pivots.append(j)
        if len(pivots) == len(mat):
            break
    return pivots


def main():
    k, s = 4, 8
    chosen = labels(k)
    remaining = set(combinations(range(s), k))
    orbits = []
    while remaining:
        rep = min(remaining)
        orbit = {tuple(sorted((a + j) % s for a in rep)) for j in range(s)}
        remaining -= orbit
        orbits.append((rep, len(orbit)))
    assert len(chosen) == 8 and len(orbits) == 10

    vectors, weights = [], []
    for root_exponents, orbit_size in orbits:
        delta = determinant([[zpow(a * b) for b in root_exponents] for a in range(k)])
        delta_inverse = inv(delta)
        vector = [mul(determinant([[zpow(a * b) for b in root_exponents] for a in I]), delta_inverse) for I in chosen]
        # epsilon=(-1)^6=1 and P'(z)=8 z^7.
        weight = scale(F(orbit_size, s ** k), mul(mul(delta, delta), zpow(-7 * sum(root_exponents))))
        vectors.append([mul(a, b) for a in vector for b in vector])
        weights.append(weight)

    # Choose a principal 10-by-10 AB|CD minor by exact finite-field elimination.
    prime = 1009
    root = next(a for a in range(2, prime) if pow(a, 8, prime) == 1 and pow(a, 4, prime) != 1)

    def reduce(a):
        return sum((x.numerator % prime) * pow(x.denominator, -1, prime) * pow(root, i, prime) for i, x in enumerate(a)) % prime

    selected = pivot_columns([[reduce(x) for x in row] for row in vectors], prime)
    assert selected == list(range(8)) + [11, 12]
    minor = []
    for a in selected:
        row = []
        for b in selected:
            value = ZERO
            for vector, weight in zip(vectors, weights):
                value = add(value, mul(weight, mul(vector[a], vector[b])))
            assert value[1:] == (0, 0, 0), value
            assert value[0].denominator == 1, value
            row.append(value[0].numerator)
        minor.append(row)

    determinant_value = rational_determinant(minor)
    P = [[int(j == ({0: 7, 7: 0, 1: 6, 6: 1}.get(i, i)))
          for j in range(8)] for i in range(8)]
    B = [[0, 0], [1, 1], [1, 1], [2, 0],
         [0, 2], [1, 1], [1, 1], [0, 0]]
    D = [[9, 4], [4, 9]]
    expected = [P[i] + B[i] for i in range(8)]
    expected += [[B[i][j] for i in range(8)] + D[j] for j in range(2)]
    assert minor == expected
    assert determinant_value == 1
    print({"k": k, "dimension": len(chosen), "cyclic_root_orbits": len(orbits),
           "flattening_minor_indices": [(a // 8, a % 8) for a in selected],
           "exact_minor_determinant": determinant_value.numerator,
           "ordinary_rank": 10, "border_rank": 10})
    print("Selected subset labels:", chosen)
    print("Exact integer minor:")
    for row in minor:
        print(row)


if __name__ == "__main__":
    main()
