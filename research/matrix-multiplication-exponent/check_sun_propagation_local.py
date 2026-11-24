"""Exact local checks for Sun arXiv:2610.13971v1, Lemma 10.4.

These checks do not verify the propagation theorem. They verify its small
determinants and record the distinction between the two active normal forms.
Requires SymPy; no network access or floating-point arithmetic is used.
"""

from itertools import product

import sympy as sp


def flattening_ranks(shape, terms):
    ranks = []
    for axis in range(3):
        other = [index for index in range(3) if index != axis]
        column_labels = list(product(*(range(shape[index]) for index in other)))
        column_index = {label: index for index, label in enumerate(column_labels)}
        matrix = sp.zeros(shape[axis], len(column_labels))
        for label, coefficient in terms.items():
            column = column_index[tuple(label[index] for index in other)]
            matrix[label[axis], column] += coefficient
        ranks.append(matrix.rank())
    return tuple(ranks)


def main():
    active = [0, 3, 4, 9, 12]
    ordinary = [index for index in range(16) if index not in active]
    walsh = sp.Matrix(
        [[(-1) ** ((i & j).bit_count() % 2) for j in range(16)] for i in range(16)]
    )
    exceptional_det = walsh.extract(active, active).det()
    ordinary_det = walsh.extract(ordinary, ordinary).det()
    assert exceptional_det == 16
    assert ordinary_det == 65536
    assert sorted(index ^ 6 for index in [2, 5, 6, 10, 15]) == active

    # All labels below are zero based. The paper's J is x_2 y_2 z_1.
    canonical = {(i, i, 0): 1 for i in range(4)}
    canonical.update({(1, 0, 1): 1, (3, 3, 2): 1})
    resolved = {
        (0, 0, 0): 1,  # auz
        (1, 1, 0): 1,  # bvz
        (1, 0, 1): 1,  # bus
        (2, 2, 2): 1,  # cwr
        (3, 3, 3): 1,  # e_X e_Y e_Z
    }
    canonical_ranks = flattening_ranks((4, 4, 3), canonical)
    resolved_ranks = flattening_ranks((4, 4, 4), resolved)
    assert canonical_ranks == (4, 4, 3)
    assert resolved_ranks == (4, 4, 4)

    monomials = list(product(range(4), range(4), range(3)))
    active_space = sp.zeros(len(monomials), 5)
    for row, monomial in enumerate(monomials):
        if monomial in canonical:
            active_space[row, monomial[0]] = canonical[monomial]
        if monomial == (1, 1, 1):
            active_space[row, 4] = 1
    # E(y_1)=y_2, E(y_i)=0 for i != 1 gives x_1 y_2 z_0 + J.
    elementary_residual = sp.Matrix(
        [int(monomial in {(0, 1, 0), (1, 1, 1)}) for monomial in monomials]
    )
    assert active_space.rank() == 5
    assert active_space.row_join(elementary_residual).rank() == 6

    # First-difference identity, coefficientwise for arbitrary A,J,U A,U J.
    t, sigma, tau, a, j, ua, uj = sp.symbols("t sigma tau a j ua uj")
    lhs = sp.expand(((a + sigma * t * j) + t * ua + sigma * t**2 * uj - (a + tau * t * j)) / t)
    rhs = ua + (sigma - tau) * j + sigma * t * uj
    assert sp.expand(lhs - rhs) == 0

    print(f"Walsh determinants: {exceptional_det}, {ordinary_det}")
    print(f"Canonical active flattenings: {canonical_ranks}")
    print(f"Resolved active flattenings: {resolved_ranks}")
    print("Active residual space dimension: 5; with elementary Y residual: 6")
    print("First-difference identity: exact")
    print("No global or inductive propagation certificate has been checked.")


if __name__ == "__main__":
    main()
