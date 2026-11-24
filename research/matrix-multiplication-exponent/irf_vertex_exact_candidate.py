"""Exact scalar R and finite-shift outside maps for an unresolved trade ansatz.

Primary formulas: Atalikov--Zotov, arXiv:2303.02391v1, equations
(1.16), (2.2)--(2.4), (3.2), and (3.9).  This module does not assert
a source-to-target identity.  Scalar R is evaluated at fixed numerical
q when used as a local C map; q in L remains a flag variable.
"""

from itertools import combinations
import sympy as sp


def gauge(z, q):
    q = tuple(map(sp.sympify, q))
    s = len(q)
    z = sp.sympify(z)
    mean = sum(q) / s
    degrees = list(range(s - 1)) + [s]
    return sp.Matrix([
        [(z + q[j] - mean) ** a
         / sp.prod(q[j] - q[l] for l in range(s) if l != j)
         for j in range(s)]
        for a in degrees
    ])


def exterior_power(matrix, k):
    subsets = tuple(combinations(range(matrix.rows), k))
    return sp.Matrix([
        [matrix.extract(I, J).det() for J in subsets]
        for I in subsets
    ])


def semi_dynamical_R(z1, z2, hbar, q):
    q = tuple(map(sp.sympify, q))
    s = len(q)
    z1, z2, hbar = map(sp.sympify, (z1, z2, hbar))
    ans = sp.zeros(s * s)

    def add(a, b, c, d, value):
        # E_(a,b) tensor E_(c,d), row (a,c), column (b,d).
        ans[a * s + c, b * s + d] += value

    for i in range(s):
        for j in range(s):
            if i == j:
                continue
            difference = q[j] - q[i]
            add(i, j, j, i, 1 / (z1 - z2) + s / difference)
            add(i, i, j, j, 1 / hbar + s / difference)
            add(i, j, j, j, -(1 / (z1 + hbar) + s / difference))
            add(j, j, i, j, 1 / z2 + s / difference)
    diagonal = (1 / (z1 - z2) + 1 / z2 + 1 / hbar
                - 1 / (z1 + hbar))
    for i in range(s):
        add(i, i, i, i, diagonal)
    return ans


def vertex_R(z1, z2, hbar, fixed_q):
    """Return a fixed scalar C matrix when fixed_q,z1,z2,hbar are scalars.

    The primary proposition says the output is independent of fixed_q.
    No flag variable is permitted in the C map of the tensor ansatz.
    """
    left = sp.kronecker_product(gauge(z1 + hbar, fixed_q),
                               gauge(z2, fixed_q))
    right = sp.kronecker_product(gauge(z1, fixed_q).inv(),
                                gauge(z2 + hbar, fixed_q).inv())
    ans = left * semi_dynamical_R(z1, z2, hbar, fixed_q) * right
    return ans.applyfunc(sp.cancel)


def translate(expr, variables, shift, lattice_step):
    substitutions = {q: q + lattice_step * a
                     for q, a in zip(variables, shift)}
    return expr.xreplace(substitutions)


def subset_shift_matrices(z, hbar, variables, k=1, inverse=False):
    """Coefficients in L=sum_shift coefficient(q) T_shift.

    T_shift f(q)=f(q+s*hbar*shift) T_shift.  For inverse=False,
    L=G(z,q)^(-1) diag_J(T_(1_J)) G(z+hbar,q), G=Lambda^k g.
    The inverse is the exact inverse of that operator matrix.
    """
    variables = tuple(variables)
    s = len(variables)
    subsets = tuple(combinations(range(s), k))
    G = exterior_power(gauge(z, variables), k)
    H = exterior_power(gauge(z + hbar, variables), k)
    left, right = (H.inv(), G) if inverse else (G.inv(), H)
    sign = -1 if inverse else 1
    result = {}
    for j, subset in enumerate(subsets):
        shift = tuple(sign * int(a in subset) for a in range(s))
        shifted_row = translate(right[j, :], variables, shift, s * hbar)
        result[shift] = (left[:, j] * shifted_row).applyfunc(sp.cancel)
    return result


def site_subset_shift_matrices(z, hbar, variables, k=1, inverse=False):
    """The q-site-oriented fused candidate, with spectral shift k*hbar.

    Lplus=G_k(z,q) diag_J(T_J) G_k(z+k*hbar,q)^(-1).
    Its shift-J coefficient is z/(z+k*hbar) times the rank-one
    projector G_k(z,q) E_JJ G_k(z,q)^(-1).  The negative formula
    is the exact operator inverse and uses projectors at z+k*hbar.
    These statements follow from the column-update/cofactor identity,
    not an assumed fused RTT theorem.
    """
    z, hbar = map(sp.sympify, (z, hbar))
    variables = tuple(variables)
    s = len(variables)
    subsets = tuple(combinations(range(s), k))
    base_z = z + k * hbar if inverse else z
    G = exterior_power(gauge(base_z, variables), k)
    G_inverse = G.inv()
    scalar = ((z + k * hbar) / z if inverse
              else z / (z + k * hbar))
    sign = -1 if inverse else 1
    result = {}
    for j, subset in enumerate(subsets):
        shift = tuple(sign * int(a in subset) for a in range(s))
        result[shift] = (scalar * G[:, j] * G_inverse[j, :]).applyfunc(sp.cancel)
    return result


def entry_operator(matrix_coefficients, row, column):
    return {shift: matrix[row, column]
            for shift, matrix in matrix_coefficients.items()
            if matrix[row, column] != 0}


def multiply(left, right, variables, lattice_step):
    """Exact finite difference-operator multiplication in left normal form."""
    result = {}
    for a, f in left.items():
        for b, g in right.items():
            shift = tuple(x + y for x, y in zip(a, b))
            result[shift] = (result.get(shift, 0)
                             + f * translate(g, variables, a, lattice_step))
    return {shift: sp.cancel(value) for shift, value in result.items()
            if value != 0}


def add_scaled(target, source, coefficient):
    for shift, value in source.items():
        target[shift] = target.get(shift, 0) + coefficient * value


def inverse_product_middle(A_inverse, B_inverse_inverse,
                           Gamma_inverse, h, c, i, j, p):
    """Data for the proposed finite-shift middle completion.

    Return scalar and two entries to be multiplied in the printed order:
    Gamma_inverse[(h,c),(i,j)] * (L_u^-1)[h,i] * L_v[j,h].
    The repeated h is intentional; replacing it by an independent
    inverse-sum index would be an invalid source change.
    """
    scalar = Gamma_inverse[h * p + c, i * p + j]
    return (scalar,
            entry_operator(A_inverse, h, i),
            entry_operator(B_inverse_inverse, j, h))


if __name__ == "__main__":
    R1 = vertex_R(sp.Integer(2), sp.Integer(5), sp.Integer(1), (-1, 1))
    R2 = vertex_R(sp.Integer(2), sp.Integer(5), sp.Integer(1), (-2, 2))
    expected = sp.Matrix([
        [sp.Rational(2, 3), 0, 0, 0],
        [2, 1, sp.Rational(-1, 3), 0],
        [2, sp.Rational(-1, 3), 1, 0],
        [14, -2, -2, sp.Rational(2, 3)],
    ])
    assert R1 == R2 == expected
    print("Exact s=2 R matrix: two fixed q choices agree with Eq(1.13).")
    print(R1)
