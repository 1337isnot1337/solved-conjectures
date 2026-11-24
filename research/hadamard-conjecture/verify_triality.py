#!/usr/bin/env python3
"""Check the four-dimensional triality facts and residue obstruction exactly."""

from itertools import permutations, product


SIZE = 4
SIGNS = tuple(product((-1, 1), repeat=SIZE))
IDENTITY_ACTION = (0, 1, 2)
IDENTITY = tuple(tuple(2 * int(i == j) for j in range(SIZE)) for i in range(SIZE))
NEG_IDENTITY = tuple(tuple(-entry for entry in row) for row in IDENTITY)
REPRESENTATIVES = ((2, 0, 0, 0), (1, 1, 1, 1), (-1, 1, 1, 1))


def dot(left, right):
    return sum(x * y for x, y in zip(left, right))


def twice_product(left, right):
    """Multiply matrices stored with each entry scaled by two."""
    return tuple(tuple(dot(row, column) // 2 for column in zip(*right)) for row in left)


def coset(vector):
    """The input is a norm-one vector with all coordinates doubled."""
    if sum(entry != 0 for entry in vector) == 1:
        return 0
    assert all(abs(entry) == 1 for entry in vector)
    return 1 + (sum(entry < 0 for entry in vector) % 2)


def action(matrix):
    return tuple(
        coset(tuple(dot(row, vector) // 2 for row in matrix))
        for vector in REPRESENTATIVES
    )


def check_lattice():
    signed_permutations = []
    for permutation in permutations(range(SIZE)):
        for signs in SIGNS:
            signed_permutations.append(tuple(
                tuple(2 * sign * int(j == position) for j in range(SIZE))
                for sign, position in zip(signs, permutation)
            ))
    hadamards = [
        rows for rows in permutations(SIGNS, SIZE)
        if all(dot(rows[i], rows[j]) == 0 for i in range(SIZE) for j in range(i))
    ]
    assert len(signed_permutations) == 384
    assert len(hadamards) == 768
    assert all(action(matrix)[0] != 0 for matrix in hadamards)

    square_minus_one = 0
    order_three_trace_minus_two = 0
    for matrix in signed_permutations + hadamards:
        coset_action = action(matrix)
        assert set(coset_action) == {0, 1, 2}
        square = twice_product(matrix, matrix)
        if square == NEG_IDENTITY:
            assert coset_action == IDENTITY_ACTION
            square_minus_one += 1
        if sum(matrix[i][i] for i in range(SIZE)) == -4:
            if twice_product(square, matrix) == IDENTITY:
                assert all(i != p for i, p in enumerate(coset_action))
                order_three_trace_minus_two += 1

    assert square_minus_one and order_three_trace_minus_two
    print(f"lattice matrices = {len(signed_permutations) + len(hadamards)}")
    print(f"square -I = {square_minus_one}, order three and trace -2 = {order_three_trace_minus_two}")


def count_row_phases(second_size, eta, epsilon):
    positions = list(product(range(2), range(second_size)))
    columns = [
        [eta * (i == k) + epsilon * (j == l) for i, j in positions]
        for k, l in positions
    ]
    return sum(
        all(len({(phase + entry) % 3 for phase, entry in zip((0,) + phases, column)}) < 3
            for column in columns)
        for phases in product(range(3), repeat=len(positions) - 1)
    )


if __name__ == "__main__":
    check_lattice()
    assert count_row_phases(2, 1, 1) > 0
    assert all(count_row_phases(3, eta, epsilon) == 0
               for eta, epsilon in product((1, 2), repeat=2))
    print("2 x 3 grid forbids every phase assignment for all four sign choices")
