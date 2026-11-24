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


def fresh_address_reconstruction(walsh, active, ordinary):
    """Compute the specified address algebra, then one explicitly extra RHS.

    The physical-cycle RHS is a diagnostic interpretation, NOT a RHS given
    for the odd-characteristic propagation lemma in the source.
    """
    ann = walsh.extract(ordinary, ordinary)
    aan = walsh.extract(active, ordinary)
    ana = walsh.extract(ordinary, active)
    aaa = walsh.extract(active, active)
    leakage = aan * ann.inv()
    expected_leakage = sp.Matrix([
        [0, -1, 1, 0, 1, 1, 1, 0, -1, 0, -1],
        [0, 1, 0, 1, -1, -2, -1, -1, 2, 1, 1],
        [1, 1, 0, 0, -1, -1, 0, -1, 1, 1, 0],
        [-1, -1, -1, -1, 0, 0, -1, 0, -1, -1, 0],
        [-1, -1, -1, -1, 0, 1, 0, 1, -2, -2, -1],
    ])
    assert leakage == expected_leakage
    schur = aaa - leakage * ana
    assert schur == 16 * aaa.inv()
    w4 = sp.Matrix([[(-1) ** ((i & j).bit_count() % 2)
                    for j in range(4)] for i in range(4)])
    assert sp.kronecker_product(aan, w4) * sp.kronecker_product(ann.inv(), w4 / 4) == sp.kronecker_product(leakage, sp.eye(4))

    diagnostic_ranks = []
    diagnostic_individual_ranks = []
    for row, address in enumerate(active):
        coefficients = [sp.Integer(i == address) for i in range(16)]
        for column, other_address in enumerate(ordinary):
            coefficients[other_address] = -leakage[row, column]
        terms = {}
        individual_terms = [dict() for _ in range(4)]
        for module, coefficient in enumerate(coefficients):
            if not coefficient:
                continue
            # Extra diagnostic convention theta(module)=(low two bits,
            # high two bits), with the cycle decoding used in (10.13).
            q, r = module & 3, module >> 2
            for g in range(4):
                i, j, k = g, g ^ q, g ^ q ^ r
                label = (4 * i + j, 4 * j + k, 4 * k + i)
                terms[label] = coefficient
                individual_terms[g][label] = coefficient
        ranks = flattening_ranks((16, 16, 16), terms)
        diagnostic_ranks.append(ranks)
        # Independent combinatorial rank calculation: rows of each
        # flattening have disjoint supports.
        qr = [(module & 3, module >> 2)
              for module, value in enumerate(coefficients) if value]
        expected = (4 * len({q for q, r in qr}),
                    4 * len({r for q, r in qr}),
                    4 * len({q ^ r for q, r in qr}))
        assert ranks == expected
        per_g = [flattening_ranks((16, 16, 16), value) for value in individual_terms]
        expected_individual = (len({q for q, r in qr}), len(qr), len({q ^ r for q, r in qr}))
        assert all(value == expected_individual for value in per_g)
        diagnostic_individual_ranks.append(per_g[0])
    assert diagnostic_ranks == [(16, 16, 8), (16, 16, 16),
                                (16, 16, 8), (8, 16, 16),
                                (16, 16, 16)]
    assert diagnostic_individual_ranks == [(4, 8, 2), (4, 10, 4),
                                           (4, 8, 2), (2, 8, 4),
                                           (4, 10, 4)]
    print("Address leakage K: exact rank", leakage.rank())
    print("Schur complement S=16 W[A,A]^-1: exact rank", schur.rank())
    print("Fresh leakage factor: K tensor I_4 (exact)")
    print("Additional physical-cycle RHS per-g ranks:", diagnostic_individual_ranks)
    print("Additional physical-cycle RHS summed-g ranks:", diagnostic_ranks)
    print("This RHS is not prescribed by odd-characteristic Lemma 10.4.")


def check_source_face_actions():
    """Pull the printed target-diagonal face actions through the D4 map."""
    t = sp.symbols("t", nonzero=True)
    ax = sp.Matrix([[-t, 0, 0, 0],
                    [1, 1, 0, 0],
                    [0, 0, 1, 0],
                    [0, 0, 0, 1]])
    signs = [(1, 1, 1, 1), (1, -1, 1, -1),
             (1, -1, -1, 1), (1, 1, -1, -1)]
    e21 = sp.zeros(4)
    e21[1, 0] = 1
    x = sp.symbols("x1:5")
    y = sp.symbols("y1:5")
    z = sp.symbols("z0:3")
    rank_one_terms = [(-t * x[0] + x[1]) * (-y[0] / t) * z[0],
                      x[1] * (y[0] / t + y[1]) * (z[0] + t * z[1]),
                      x[2] * y[2] * z[0],
                      x[3] * y[3] * (z[0] + z[2])]
    actions = []
    for values in signs:
        diagonal = sp.diag(*values)
        source_action = diagonal + (values[1] - values[0]) * e21
        assert ax * source_action == diagonal * ax
        assert source_action == sp.simplify(ax.inv() * diagonal * ax)
        weighted = sum(value * term for value, term in zip(values, rank_one_terms))
        target_action = z[0] * sum(values[i] * x[i] * y[i] for i in range(4))
        target_action += values[1] * x[1] * y[0] * z[1] + values[3] * x[3] * y[3] * z[2]
        pole = (values[1] - values[0]) * x[1] * y[0] * z[0] / t
        error = t * values[1] * x[1] * y[1] * z[1]
        assert sp.expand(weighted - target_action - pole - error) == 0
        actions.append(source_action)
    for i, j in product(range(4), repeat=2):
        assert actions[i] * actions[j] == actions[i ^ j]
    assert [values[1] - values[0] for values in signs] == [0, -2, -2, 0]
    print("Naive source sign pole coefficients:", [0, -2, -2, 0])
    print("Fixed source face action S_L=L+(s_2-s_1)E_21: exact")
    print("Four source actions satisfy the two-bit group law.")


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
    fresh_address_reconstruction(walsh, active, ordinary)
    check_source_face_actions()
    print("No global or inductive propagation certificate has been checked.")


if __name__ == "__main__":
    main()
