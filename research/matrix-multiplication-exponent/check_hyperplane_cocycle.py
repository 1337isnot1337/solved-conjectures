"""Finite exact checks of the hyperplane cocycle lemma, not its general proof.

All matrix entries and candidate kernel vectors are integral. Modular rank
provides a characteristic-zero rank lower bound. The displayed candidate
vectors lie in the rational kernel exactly, so matching ranks are exact
characteristic-zero kernel dimension certificates for the listed cases.

The main block checks n=3,4 only. Its integer matrix product has at most
480 summands, each of absolute value at most 2, so int64 arithmetic there
is exact. Modular elimination keeps entries between 0 and 1008; before
reduction, products have magnitude at most 1008**2 and a subtraction
has magnitude at most 1008**2+1008. All lie strictly within int64.
"""

from itertools import combinations

import numpy as np


PRIME = 1009


def matrix_units(n):
    units = []
    for i in range(n):
        for j in range(n):
            x = np.zeros((n, n), dtype=np.int64)
            x[i, j] = 1
            units.append(x)
    return units


def rank_mod(a, prime=PRIME):
    a = a.copy() % prime
    row = 0
    for col in range(a.shape[1]):
        candidates = np.flatnonzero(a[row:, col])
        if not len(candidates):
            continue
        pivot = row + int(candidates[0])
        a[[row, pivot]] = a[[pivot, row]]
        a[row] = a[row] * pow(int(a[row, col]), -1, prime) % prime
        nonzero = np.flatnonzero(a[row + 1 :, col]) + row + 1
        for start in range(0, len(nonzero), 128):
            idx = nonzero[start : start + 128]
            a[idx] = (a[idx] - a[idx, col, None] * a[row]) % prime
        row += 1
        if row == min(a.shape):
            break
    return row


def hyperplane_basis(n, ell_rank):
    units = matrix_units(n)
    result = [units[i * n + j] for i in range(n) for j in range(n) if i != j]
    for i in range(1, n):
        x = units[i * n + i].copy()
        if i < ell_rank:
            x -= units[0]
        result.append(x)
    return result


def check(n, ell_rank):
    assert n in (3, 4), "The documented integer bounds cover n=3,4."
    basis = hyperplane_basis(n, ell_rank)
    units = matrix_units(n)
    h, r = len(basis), n * n
    pair_list = list(combinations(range(h), 2))
    equations = np.zeros((len(pair_list) * r, 2 * h * r), dtype=np.int64)
    for pair_index, (i, j) in enumerate(pair_list):
        x, y = basis[i], basis[j]
        rows = slice(pair_index * r, (pair_index + 1) * r)
        for u, e in enumerate(units):
            equations[rows, i * r + u] += (e @ y).reshape(-1)
            equations[rows, j * r + u] -= (e @ x).reshape(-1)
            equations[rows, h * r + j * r + u] += (x @ e).reshape(-1)
            equations[rows, h * r + i * r + u] -= (y @ e).reshape(-1)

    candidates = []
    for k in units:
        candidates.append(np.concatenate([np.concatenate([(-x @ k).reshape(-1) for x in basis]),
                                          np.concatenate([(k @ x).reshape(-1) for x in basis])]))
    for i in range(h):
        a = np.zeros((h, n, n), dtype=np.int64)
        a[i] = np.eye(n, dtype=np.int64)
        candidates.append(np.concatenate([a.reshape(-1), a.reshape(-1)]))
    candidates = np.column_stack(candidates)
    assert np.count_nonzero(equations @ candidates) == 0
    expected_nullity = 2 * r - 1
    assert rank_mod(candidates) == expected_nullity
    rank = rank_mod(equations)
    assert equations.shape[1] - rank == expected_nullity
    print(f"n={n}, rank(ell)={ell_rank}: equation rank {rank}, exact kernel dimension {expected_nullity}")


if __name__ == "__main__":
    for n in (3, 4):
        for ell_rank in range(1, n + 1):
            check(n, ell_rank)
    print("All finite hyperplane cocycle checks passed.")
