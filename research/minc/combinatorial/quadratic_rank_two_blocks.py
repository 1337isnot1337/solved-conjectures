"""Structured diagnostics for quadratic permanental dominance, not a proof.

For rank-two Gram matrices, compute squared Frobenius norms of every
two-row irreducible block through the subset permutation modules. This
does not build the factorial-size Schur power matrix. No optimization is
used. All output is discovery data in floating-point arithmetic.
"""

import itertools
import math
import numpy as np


def binary_products(vectors):
    n = len(vectors)
    products = [None] * (1 << n)
    products[0] = np.array([1.0 + 0.0j])
    for mask in range(1, 1 << n):
        bit = mask & -mask
        i = bit.bit_length() - 1
        products[mask] = np.convolve(products[mask ^ bit], vectors[i])
    return products


def blocks(vectors):
    vectors = np.asarray(vectors, dtype=complex)
    vectors = vectors / np.linalg.norm(vectors, axis=1)[:, None]
    n = len(vectors)
    products = binary_products(vectors)
    full = (1 << n) - 1
    weights = [np.array([math.factorial(a) * math.factorial(k-a)
                         for a in range(k+1)], dtype=float)
               for k in range(n+1)]
    permanent = float(np.sum(weights[n] * abs(products[full]) ** 2))
    previous = 0.0
    results = []
    for j in range(n // 2 + 1):
        rows = []
        for subset in itertools.combinations(range(n), j):
            mask = sum(1 << i for i in subset)
            u = products[mask] * np.sqrt(weights[j])
            v = products[full ^ mask] * np.sqrt(weights[n-j])
            rows.append(np.outer(u, v).ravel())
        w = np.asarray(rows)
        small_gram = w.conj().T @ w
        total = float(np.vdot(small_gram, small_gram).real)
        value = total - previous
        dim = math.comb(n, j) - (math.comb(n, j-1) if j else 0)
        results.append((j, dim, value / (dim * permanent ** 2)))
        previous = total
    return permanent, results


def run(label, vectors):
    p, values = blocks(vectors)
    print(label, "n=", len(vectors), "per=", p)
    print("  j, irreducible_dimension, quadratic_ratio:", values)
    assert abs(values[0][2] - 1.0) < 1e-10
    assert min(x[2] for x in values) > -1e-9


if __name__ == "__main__":
    # Tran's exact order-five seed: c=|a|^2=2.
    tran = [(1, math.sqrt(2)*z) for z in [1, 1j, -1, -1j, 0]]
    tran_p, tran_blocks = blocks(tran)
    # Independent comparison to the explicitly published eigenvalues.
    assert abs(tran_p - 504 / 81) < 1e-10
    assert abs(tran_blocks[1][2] - sum(x*x for x in [240, 160, 320, 384]) / (4*504**2)) < 1e-10
    assert abs(tran_blocks[2][2] - (512**2 + 448**2) / (5*504**2)) < 1e-10
    run("Tran_seed", tran)
    # Drury's regular-polygon frame, including both coordinate poles.
    for m in [5, 6, 7, 8, 9, 10]:
        z = np.exp(2j * np.pi * np.arange(m) / m)
        run("polygon_and_two_poles_m" + str(m),
            [(1, x) for x in z] + [(1, 0), (0, 1)])
    # One product, with repeated Gram vectors: this is not a direct sum.
    for q in [2, 3]:
        base = [(1, math.sqrt(2)*z) for z in [1, 1j, -1, -1j, 0]]
        run("repeated_Tran_q" + str(q), base * q)
