"""Exact source-block basis identities; no target trade is tested."""

from itertools import combinations

from check_central_quantum_source import labels
from check_central_quantum_orbits import ZERO, ONE, F, add, scale, mul, inv, zpow, determinant


def power4(x):
    x2 = mul(x, x)
    return mul(x2, x2)


def rank(matrix):
    matrix = [row[:] for row in matrix]
    count = 0
    for j in range(len(matrix[0])):
        pivot = next((i for i in range(count, len(matrix)) if matrix[i][j] != ZERO), None)
        if pivot is None:
            continue
        matrix[count], matrix[pivot] = matrix[pivot], matrix[count]
        factor = inv(matrix[count][j])
        matrix[count] = [mul(factor, x) for x in matrix[count]]
        for i in range(count + 1, len(matrix)):
            factor = matrix[i][j]
            matrix[i] = [add(x, scale(-1, mul(factor, y))) for x, y in zip(matrix[i], matrix[count])]
        count += 1
        if count == len(matrix):
            break
    return count


def main():
    chosen = labels(4)
    remaining = set(combinations(range(8), 4))
    data = []
    while remaining:
        rep = min(remaining)
        orbit = {tuple(sorted((a + j) % 8 for a in rep)) for j in range(8)}
        remaining -= orbit
        delta = determinant([[zpow(a * b) for b in rep] for a in range(4)])
        inverse_delta = inv(delta)
        vector = [mul(determinant([[zpow(a * b) for b in rep] for a in I]), inverse_delta) for I in chosen]
        weight = scale(F(len(orbit), 8 ** 4), mul(mul(delta, delta), zpow(-7 * sum(rep))))
        data.append((rep, vector, weight))

    sqrt2 = add(zpow(1), scale(-1, zpow(3)))
    plus = [0, 2, 4, 6, 7, 9]
    minus = [1, 3, 5, 8]
    relations = [
        [add(scale(F(-3, 4), ONE), scale(F(1, 2), sqrt2)), scale(F(-1, 2), ONE), scale(F(-1, 2), ONE),
         add(scale(F(-3, 4), ONE), scale(F(-1, 2), sqrt2)), scale(F(-1, 2), ONE)],
        [add(scale(-3, ONE), scale(2, sqrt2)), add(scale(-3, ONE), scale(2, sqrt2)), scale(-1, ONE)],
    ]
    expected = [
        [add(scale(792, ONE), scale(560, sqrt2)), ONE, ONE, add(scale(792, ONE), scale(-560, sqrt2)), ONE],
        [add(scale(F(-169, 8), ONE), scale(F(-239, 16), sqrt2))] * 2
        + [add(scale(F(-1, 8), ONE), scale(F(-1, 16), sqrt2))],
    ]
    expected_beta = [scale(F(1, 8), ONE), add(scale(F(-1, 8), ONE), scale(F(-1, 16), sqrt2))]

    half_shift = [chosen.index(tuple(sorted((a + 4) % 8 for a in I))) for I in chosen]
    assert half_shift == [7, 6, 2, 4, 3, 5, 1, 0]
    for h, (rep, vector, _) in enumerate(data):
        eigenvalue = (-1) ** sum(rep)
        assert [vector[j] for j in half_shift] == [scale(eigenvalue, x) for x in vector]
        assert (h in plus) == (eigenvalue == 1)

    total_basis = []
    for block, coefficients, alpha, beta in zip((plus, minus), relations, expected, expected_beta):
        basis = [[mul(c, x) for x in data[h][1]] for h, c in zip(block, coefficients)]
        assert len(basis) == len(block) - 1
        assert all(c != ZERO for c in coefficients)
        reconstructed = [ZERO] * 8
        for vector in basis:
            reconstructed = [add(x, y) for x, y in zip(reconstructed, vector)]
        assert reconstructed == data[block[-1]][1]
        assert [mul(data[h][2], inv(power4(c))) for h, c in zip(block, coefficients)] == alpha
        assert data[block[-1]][2] == beta
        assert rank(list(map(list, zip(*basis)))) == len(basis)
        total_basis.extend(basis)
    assert rank(list(map(list, zip(*total_basis)))) == 8
    print("Exact Q(zeta8) checks pass: 5D/rank6 and 3D/rank4 source blocks, both dense-circuit relations, all normal-form weights, and the full invertible basis.")


if __name__ == "__main__":
    main()
