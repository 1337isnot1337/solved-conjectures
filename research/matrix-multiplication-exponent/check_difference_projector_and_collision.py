"""Exact finite checks supplementing the two difference/collision proofs.

This script checks identities and ranks at stated finite parameters.
It does not check or assert the unresolved six-index source trade.
"""

from itertools import combinations
from math import comb

import sympy as sp

from irf_vertex_exact_candidate import gauge, exterior_power, semi_dynamical_R


def exterior_operator(s, degree, kind, coordinate):
    source = list(combinations(range(s), degree))
    target_degree = degree + (1 if kind == 'create' else -1)
    target = list(combinations(range(s), target_degree))
    target_index = {item: i for i, item in enumerate(target)}
    matrix = sp.zeros(len(target), len(source))
    for column, subset in enumerate(source):
        if kind == 'create':
            if coordinate in subset:
                continue
            output = tuple(sorted(subset + (coordinate,)))
            sign = (-1) ** sum(a < coordinate for a in subset)
        else:
            if coordinate not in subset:
                continue
            output = tuple(a for a in subset if a != coordinate)
            sign = (-1) ** subset.index(coordinate)
        matrix[target_index[output], column] = sign
    return matrix


def check_rows_and_projectors():
    z, hbar = sp.Rational(5, 3), sp.Rational(2, 7)
    for q, k in [((-7, 1, 12), 1), ((-11, -3, 5, 17), 2)]:
        q = tuple(map(sp.Integer, q))
        s = len(q)
        subsets = list(combinations(range(s), k))
        G = exterior_power(gauge(z, q), k)
        inverse = G.inv()
        projectors = [G[:, j] * inverse[j, :] for j in range(len(subsets))]
        for j, subset in enumerate(subsets):
            shifted_q = tuple(q[a] + s * hbar * int(a in subset)
                              for a in range(s))
            H = exterior_power(gauge(z + k * hbar, shifted_q), k)
            H_inverse = H.inv()
            assert H_inverse[j, :] == z / (z + k * hbar) * inverse[j, :]
            for l in range(len(subsets)):
                product = projectors[j] * H[:, l] * H_inverse[l, :]
                expected = projectors[j] if l == j else sp.zeros(len(subsets))
                assert product == expected
        print(f'exact row and shifted-projector identities: s={s}, k={k}')


def check_collision_residues():
    epsilon = sp.Symbol('epsilon')
    z, hbar = sp.Rational(5, 3), sp.Rational(2, 7)
    for s, k in [(3, 1), (4, 2)]:
        q = (epsilon / 2, -epsilon / 2) + tuple(
            sp.Integer(5 + 7 * a) for a in range(s - 2))
        G = exterior_power(gauge(z, q), k)
        residue = G.applyfunc(lambda entry: sp.limit(epsilon * entry, epsilon, 0))
        assert residue.rank() == comb(s - 1, k - 1)
        R = semi_dynamical_R(sp.Integer(2), sp.Integer(5), hbar, q)
        R_residue = R.applyfunc(lambda entry: sp.limit(epsilon * entry, epsilon, 0))
        ell = sp.zeros(1, s)
        ell[0, 0], ell[0, 1] = 1, -1
        wedge = sp.zeros(s * s, 1)
        wedge[1, 0], wedge[s, 0] = 1, -1
        assert R_residue == s * wedge * sp.kronecker_product(ell, ell)
        print(f'exact intertwiner and semidynamical collision residues: s={s}, k={k}')


def check_exterior_channel():
    for s, k in [(3, 1), (4, 2), (5, 2), (5, 3)]:
        subsets = list(combinations(range(s), k))
        p = len(subsets)
        index = {item: i for i, item in enumerate(subsets)}
        a0 = exterior_operator(s, k, 'annihilate', 0)
        a1 = exterior_operator(s, k, 'annihilate', 1)
        c0 = exterior_operator(s, k - 1, 'create', 0)
        c1 = exterior_operator(s, k - 1, 'create', 1)
        ell = a0 - a1
        K = (sp.kronecker_product(c0, c1) - sp.kronecker_product(c1, c0))
        K *= sp.kronecker_product(ell, ell)
        expected_rank = comb(s - 1, k - 1) ** 2
        if k >= 2:
            expected_rank -= comb(s - 2, k - 2) ** 2
        assert K.rank() == expected_rank
        passive = list(combinations(range(2, s), k - 1))
        source_labels = [index[(0,) + I] for I in passive]
        second_output_labels = [index[(1,) + I] for I in passive]
        columns = [i * p + j for i in source_labels for j in source_labels]
        rows = [i * p + j for i in source_labels for j in second_output_labels]
        assert K.extract(rows, columns) == sp.eye(len(passive) ** 2)
        assert K * K == sp.zeros(p * p)
        print(f'exact exterior rank and copied-target restriction: s={s}, k={k}, '
              f'rank={expected_rank}, target_outer={len(passive)}')


if __name__ == '__main__':
    check_rows_and_projectors()
    check_collision_residues()
    check_exterior_channel()
    print('All finite checks passed; no source-to-target trade is asserted.')
