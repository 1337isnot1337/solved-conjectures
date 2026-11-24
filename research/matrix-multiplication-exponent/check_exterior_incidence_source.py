#!/usr/bin/env python3
"""Exact finite verification of the one-family exterior-incidence maps.

No floating-point arithmetic is used. The default checked sizes are q=3,5.
Every exterior matrix entry is 0 or +/-1; all NumPy contraction dimensions
are at most 50 and each displayed product has at most four such factors.
The crude entry bound 8*50**3 is below 2**63. Final ranks use SymPy exact
rational elimination, not floating-point or modular estimates. The symbolic proof is in
EXTERIOR_INCIDENCE_SOURCE.md; this script checks every C/D
coefficient at q=3 and q=5, including coefficients required to vanish.
"""
from itertools import combinations
from math import comb
import numpy as np
import sympy as sp


def basis(q, k):
    return [sum(1 << i for i in I) for I in combinations(range(q), k)]


def creation(q, k, i, bases, indices):
    out = np.zeros((len(bases[k + 1]), len(bases[k])), dtype=np.int64)
    for col, I in enumerate(bases[k]):
        if I & (1 << i):
            continue
        sign = -1 if (I & ((1 << i) - 1)).bit_count() % 2 else 1
        out[indices[k + 1][I | (1 << i)], col] = sign
    return out


def verify(q):
    assert q % 2 == 1 and q >= 3
    L = (q - 1) // 2
    bases = {k: basis(q, k) for k in range(L + 2)}
    indices = {k: {I: j for j, I in enumerate(xs)} for k, xs in bases.items()}
    C = {(k, i): creation(q, k, i, bases, indices)
         for k in range(L + 1) for i in range(q)}
    a = {(k, i): C[k - 1, i].T for k in range(1, L + 2) for i in range(q)}
    N = len(bases[L])
    assert N == len(bases[L + 1])
    edges = list(combinations(range(q), 2))

    # Inclusion of B_0 into B_empty inside C^q tensor F_L.
    Bcols = []
    for J in bases[L + 1]:
        hs = [h for h in range(q) if J & (1 << h)]
        h0 = hs[0]
        I0 = J ^ (1 << h0)
        s0 = int(C[L, h0][indices[L + 1][J], indices[L][I0]])
        for h in hs[1:]:
            I = J ^ (1 << h)
            sh = int(C[L, h][indices[L + 1][J], indices[L][I]])
            z = np.zeros(q * N, dtype=np.int64)
            z[h * N + indices[L][I]] = sh
            z[h0 * N + indices[L][I0]] = -s0
            Bcols.append(z)
    E = np.column_stack(Bcols)
    R = np.hstack([C[L, h] for h in range(q)])
    assert np.array_equal(R @ E, np.zeros((N, L * N), dtype=np.int64))
    assert sp.Matrix(E).rank() == L * N
    Arows = [h * N + col for h in range(q)
             for col, I in enumerate(bases[L]) if I & (1 << h)]
    assert len(Arows) == L * N

    def G(k, c, i, j):
        out = np.zeros((len(bases[k]), len(bases[k])), dtype=np.int64)
        if c == i:
            out += C[k - 1, j] @ a[k, i]
        if c == j:
            out -= C[k - 1, i] @ a[k, j]
        return out

    W = {}
    Wempty = {}
    empty_indices = [h * N + col for h in range(q)
                     for col, I in enumerate(bases[L]) if not I & (1 << h)]
    checked = 0
    for i, j in edges:
        want_full = np.zeros((q * N, q * N), dtype=np.int64)
        want_full[j*N:(j+1)*N, j*N:(j+1)*N] = C[L - 1, j] @ a[L, i]
        want_full[i*N:(i+1)*N, i*N:(i+1)*N] = C[L - 1, i] @ a[L, j]
        want = want_full[Arows, :] @ E
        W[i, j] = want
        want_empty = want_full[np.ix_(Arows, empty_indices)]
        Wempty[i, j] = want_empty
        for u, v in edges:
            actual = np.zeros((q * N, q * N), dtype=np.int64)
            for h, c, wedge_sign in ((u, v, 1), (v, u, -1)):
                actual[h*N:(h+1)*N, h*N:(h+1)*N] -= (
                    wedge_sign * G(L, c, i, j))
            got_empty = actual[np.ix_(Arows, empty_indices)]
            expected_empty = (want_empty if (u, v) == (i, j)
                              else np.zeros_like(want_empty))
            assert np.array_equal(got_empty, expected_empty), (
                'empty', q, (u, v), (i, j))
            got = actual[Arows, :] @ E
            expected = want if (u, v) == (i, j) else np.zeros_like(want)
            assert np.array_equal(got, expected), (q, (u, v), (i, j))
            checked += 1

    arank = sp.Matrix(np.hstack(list(W.values()))).rank()
    brank = sp.Matrix(np.vstack(list(W.values()))).rank()
    ranks = {sp.Matrix(T).rank() for T in W.values()}
    empty_arank = sp.Matrix(np.hstack(list(Wempty.values()))).rank()
    empty_brank = sp.Matrix(np.vstack(list(Wempty.values()))).rank()
    assert empty_arank == L * N
    assert empty_brank == (L + 1) * N
    assert {sp.Matrix(T).rank() for T in Wempty.values()} == {
        2 * comb(q - 2, L - 1)}
    expected_slice_rank = 1 if L == 1 else 2 * comb(q - 2, L - 1)
    assert arank == brank == L * N
    assert ranks == {expected_slice_rank}
    print(f'q={q}, L={L}, source flag N={N}: all {checked} C/D coefficients '
          f'checked for W_empty and W; W_empty A/B ranks={empty_arank}/{empty_brank}; '
          f'W A/B ranks={arank}; every W edge-slice rank={expected_slice_rank}')


if __name__ == '__main__':
    verify(3)
    verify(5)
