#!/usr/bin/env python3
"""Exact finite certificates for the auxiliary-tensor research notes.

These checks audit indices, coefficients, and small flattenings. The quantified
theorems are proved in the accompanying Markdown; finite tests do not prove them.
Uses only the Python standard library.
"""

from fractions import Fraction
from itertools import product
import json


def rank(matrix):
    rows = [[Fraction(x) for x in row] for row in matrix]
    if not rows:
        return 0
    pivot = 0
    for col in range(len(rows[0])):
        selected = next((r for r in range(pivot, len(rows)) if rows[r][col]), None)
        if selected is None:
            continue
        rows[pivot], rows[selected] = rows[selected], rows[pivot]
        value = rows[pivot][col]
        rows[pivot] = [x / value for x in rows[pivot]]
        for r in range(pivot + 1, len(rows)):
            value = rows[r][col]
            if value:
                rows[r] = [x - value * y for x, y in zip(rows[r], rows[pivot])]
        pivot += 1
        if pivot == len(rows):
            break
    return pivot


def inverse(matrix):
    size = len(matrix)
    rows = [[Fraction(x) for x in row] + [Fraction(i == j) for j in range(size)]
            for i, row in enumerate(matrix)]
    for col in range(size):
        selected = next(r for r in range(col, size) if rows[r][col])
        rows[col], rows[selected] = rows[selected], rows[col]
        value = rows[col][col]
        rows[col] = [x / value for x in rows[col]]
        for r in range(size):
            if r != col:
                value = rows[r][col]
                rows[r] = [x - value * y for x, y in zip(rows[r], rows[col])]
    return [row[size:] for row in rows]


def check_polynomial_copy(a, b):
    output = a + b - 1
    matrix = [[0] * (a * output) for _ in range(a * b)]
    selected_columns = []
    for i, j in product(range(a), range(b)):
        matrix[i * b + j][i * output + i + j] = 1
        selected_columns.append(i * output + i + j)
    assert len(set(selected_columns)) == a * b
    minor = [[row[c] for c in selected_columns] for row in matrix]
    assert minor == [[int(i == j) for j in range(a * b)] for i in range(a * b)]
    actual = rank(matrix)
    assert actual == a * b
    return {"a": a, "b": b, "flattening_rank": actual, "identity_minor": a * b}


def check_interpolation(lengths):
    output = sum(lengths) - len(lengths) + 1
    vandermonde = [[point ** degree for degree in range(output)]
                   for point in range(output)]
    lagrange = inverse(vandermonde)
    checked = 0
    for indices in product(*(range(n) for n in lengths)):
        degree = sum(indices)
        for coordinate in range(output):
            actual = sum(Fraction(point ** degree) * lagrange[coordinate][point]
                         for point in range(output))
            assert actual == int(coordinate == degree)
            checked += 1
    return {"input_lengths": lengths, "rank_one_terms": output,
            "coefficients_checked": checked}


def check_separator(shared, blocks, wire_dimension):
    survivors = []
    checked = 0
    for h in range(blocks):
        for indices in product(range(blocks), repeat=shared):
            for u in range(wire_dimension):
                v = sum(indices) + u
                # Sum the separately assigned local weights, without using the
                # simplified sum-of-squares expression to generate survivors.
                weights = [i * i for i in indices]
                weights += [2 * h * u, -2 * h * v + shared * h * h]
                total = sum(weights)
                assert total >= 0
                assert total == sum((i - h) ** 2 for i in indices)
                if total == 0:
                    assert all(i == h for i in indices)
                    assert v - shared * h == u
                    survivors.append((h, tuple(indices), u, v - shared * h))
                checked += 1
    expected = [(h, (h,) * shared, u, u)
                for h in range(blocks) for u in range(wire_dimension)]
    assert survivors == expected
    return {"shared_parties": shared, "blocks": blocks,
            "wire_dimension": wire_dimension, "coefficients_checked": checked,
            "surviving_coefficients": len(survivors),
            "interpolation_cost": shared * (blocks - 1) + wire_dimension}


def check_copied_matrix_multiplication(n, mixed_basis=False):
    coefficients = []
    for p, q in product(range(n), repeat=2):
        coefficient = [[int(i == p and j == q) for j in range(n)] for i in range(n)]
        coefficients.append(coefficient)
    if mixed_basis:
        coefficients[0] = [[int(i == j) for j in range(n)] for i in range(n)]
    flattened_basis = [[x for row in coefficient for x in row] for coefficient in coefficients]
    assert rank(flattened_basis) == n * n
    side = n ** 4
    copied = [[0] * side for _ in range(side)]
    slice_ranks = []
    for h, coefficient in enumerate(coefficients):
        matrix = [[0] * (n * n) for _ in range(n * n)]
        for j, k, ell, m in product(range(n), repeat=4):
            # trace(A E_jk E_lm) = delta_(k,l) A_(m,j).
            value = int(k == ell) * coefficient[m][j]
            matrix[j * n + k][ell * n + m] = value
            copied[h * n * n + j * n + k][h * n * n + ell * n + m] = value
        actual = rank(matrix)
        assert actual == n * rank(coefficient)
        slice_ranks.append(actual)
    actual = rank(copied)
    assert actual == sum(slice_ranks)
    assert actual >= n ** 3
    if not mixed_basis:
        assert actual == n ** 3
    return {"matrix_size": n, "basis": "identity_and_matrix_units" if mixed_basis else "matrix_units",
            "copied_flattening_rank": actual}


def main():
    results = {
        "polynomial_copy": [check_polynomial_copy(a, b) for a, b in [(2, 2), (2, 3), (3, 5)]],
        "polynomial_interpolation": [check_interpolation(lengths) for lengths in [(2, 2, 3), (3, 3, 2)]],
        "local_separator": [check_separator(shared, 3, 2) for shared in [1, 2, 3]],
        "copied_matrix_multiplication": [check_copied_matrix_multiplication(2),
                                          check_copied_matrix_multiplication(3),
                                          check_copied_matrix_multiplication(2, True)],
    }
    print(json.dumps(results, indent=2))
    print("All exact finite certificate checks passed. No Lean verification is claimed.")


if __name__ == "__main__":
    main()
