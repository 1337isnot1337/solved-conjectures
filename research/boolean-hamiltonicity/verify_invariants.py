#!/usr/bin/env python3
"""Exact finite checks for INVARIANTS.md. Standard library only."""

from fractions import Fraction
from itertools import product
from math import prod
import random


def rank(matrix, prime=None):
    """Row rank over Q, or over the explicitly supplied prime field."""
    if not matrix:
        return 0
    work = [[Fraction(x) for x in row] for row in matrix] if prime is None else [
        [x % prime for x in row] for row in matrix
    ]
    rows, cols = len(work), len(work[0])
    pivot_row = 0
    for col in range(cols):
        pivot = next((i for i in range(pivot_row, rows) if work[i][col]), None)
        if pivot is None:
            continue
        work[pivot_row], work[pivot] = work[pivot], work[pivot_row]
        leading = work[pivot_row][col]
        inverse = 1 / leading if prime is None else pow(leading, -1, prime)
        work[pivot_row] = [x * inverse for x in work[pivot_row]]
        if prime is not None:
            work[pivot_row] = [x % prime for x in work[pivot_row]]
        for row in range(rows):
            if row == pivot_row or not work[row][col]:
                continue
            scale = work[row][col]
            work[row] = [a - scale * b for a, b in zip(work[row], work[pivot_row])]
            if prime is not None:
                work[row] = [x % prime for x in work[row]]
        pivot_row += 1
        if pivot_row == rows:
            break
    return pivot_row


def truth_matrix(table, n, left):
    left = tuple(left)
    right = tuple(i for i in range(n) if i not in left)

    def embed(bits, positions):
        return sum(((bits >> j) & 1) << pos for j, pos in enumerate(positions))

    return [
        [table[embed(a, left) | embed(b, right)] for b in range(1 << len(right))]
        for a in range(1 << len(left))
    ]


def mobius_coefficients(table, n):
    coefficients = list(table)
    for i in range(n):
        for mask in range(1 << n):
            if mask & (1 << i):
                coefficients[mask] -= coefficients[mask ^ (1 << i)]
    return coefficients


def affine_rank(matrix, prime=None):
    return rank(matrix + [[1] * len(matrix[0])], prime)


def conjunction_of_pairs(k):
    return [
        int(all(((mask >> i) & 1) or ((mask >> (k + i)) & 1) for i in range(k)))
        for mask in range(1 << (2 * k))
    ]


def check_tensor_and_coefficients():
    for k in range(1, 5):
        table = conjunction_of_pairs(k)
        matrix = truth_matrix(table, 2 * k, range(k))
        coefficients = mobius_coefficients(table, 2 * k)
        coefficient_matrix = truth_matrix(coefficients, 2 * k, range(k))
        assert sum(c != 0 for c in coefficients) == 3**k
        assert sum(abs(c) for c in coefficients) == 3**k
        for prime in (None, 2, 3, 5):
            assert rank(matrix, prime) == 2**k
            assert rank(coefficient_matrix, prime) == 2**k
    print("PASS: tensor rank, coefficient rank, and coefficient counts for k=1..4")


def check_failed_additive_bound():
    n, k = 8, 4
    f, g = [], []
    for mask in range(1 << n):
        pair = [((mask >> i) & 1) or ((mask >> (k + i)) & 1) for i in range(k)]
        f.append(int(all(pair[:2])))
        g.append(int(all(pair[2:])))
    h = [a * b for a, b in zip(f, g)]
    for prime in (None, 2, 3, 5):
        rf, rg, rh = (rank(truth_matrix(t, n, range(k)), prime) for t in (f, g, h))
        assert (rf, rg, rh) == (4, 4, 16)
        assert rh > rf + rg
    print("PASS: additive rank counterexample has ranks 4, 4, 16")


def check_pair(f, g, n, left, prime):
    mf, mg = (truth_matrix(t, n, left) for t in (f, g))
    both = [a * b for a, b in zip(f, g)]
    either = [a + b - a * b for a, b in zip(f, g)]
    negated = [1 - a for a in f]
    mh, mo, mn = (truth_matrix(t, n, left) for t in (both, either, negated))
    rf, rg, rh, ro, rn = (rank(m, prime) for m in (mf, mg, mh, mo, mn))
    assert rh <= rf * rg
    assert ro <= rf + rg + rf * rg
    assert abs(rn - rf) <= 1
    sf, sg, sh, so, sn = (affine_rank(m, prime) for m in (mf, mg, mh, mo, mn))
    assert sn == sf
    assert sh <= sf * sg
    assert so <= sf * sg


def check_gate_inequalities():
    functions = list(product((0, 1), repeat=4))
    for f, g in product(functions, repeat=2):
        for prime in (None, 2, 3):
            check_pair(f, g, 2, (0,), prime)
    rng = random.Random(140067)
    for _ in range(64):
        f, g = ([rng.randrange(2) for _ in range(16)] for _ in range(2))
        for left in ((0, 1), (0, 2), (0, 3)):
            for prime in (None, 2, 3):
                check_pair(f, g, 4, left, prime)
    print("PASS: gate inequalities on all two-variable pairs and 64 four-variable pairs")


def gadget_edges(k, x, y):
    edges = set()
    for i in range(k):
        s, a, b = 3 * i, 3 * i + 1, 3 * i + 2
        next_s = 3 * ((i + 1) % k)
        edges.update(((a, b), (b, a), (a, next_s), (b, next_s)))
        if x[i]:
            edges.add((s, a))
        if y[i]:
            edges.add((s, b))
    return edges


def count_hamiltonian_cycles(n, edges):
    """Enumerate directed cycles once, fixing start vertex 0."""
    neighbors = [tuple(v for u, v in edges if u == i) for i in range(n)]
    all_seen = (1 << n) - 1

    def visit(last, seen):
        if seen == all_seen:
            return int((last, 0) in edges)
        return sum(visit(v, seen | (1 << v)) for v in neighbors[last] if not seen & (1 << v))

    return visit(0, 1)


def check_hamiltonicity_gadget():
    checked = 0
    for k in range(1, 5):
        for assignment in product((0, 1), repeat=2 * k):
            x, y = assignment[:k], assignment[k:]
            edges = gadget_edges(k, x, y)
            actual_count = count_hamiltonian_cycles(3 * k, edges)
            expected_count = prod(a + b for a, b in zip(x, y))
            assert actual_count == expected_count
            assert bool(actual_count) == all(a or b for a, b in zip(x, y))
            assert len(edges) >= 4 * k > 3 * k
            checked += 1
    print(f"PASS: Hamiltonicity gadget, all {checked} assignments for k=1..4")


def main():
    check_tensor_and_coefficients()
    check_failed_additive_bound()
    check_gate_inequalities()
    check_hamiltonicity_gadget()
    print("All finite invariant checks passed. No P versus NP claim is verified.")


if __name__ == "__main__":
    main()
