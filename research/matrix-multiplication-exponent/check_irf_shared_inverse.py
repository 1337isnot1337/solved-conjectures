"""Exact source-level residual for the shared-index inverse completion.

This checks the displayed candidate, not the whole difference-Lax family.
The calculation retains every shift in the four local-operator factors.
"""

from functools import lru_cache
from itertools import product
import sympy as sp
from irf_vertex_exact_candidate import gauge, vertex_R


S = 2
HBAR = sp.Integer(1)
DELTA = S * HBAR
U = sp.Integer(2)
V = sp.Integer(5)
BASE_Q = (sp.Integer(-6), sp.Integer(6))


@lru_cache(None)
def lax_at(z, q, inverse=False):
    # q-site orientation: g(z) diag(T_j) g(z+hbar)^(-1).
    left = gauge(z + HBAR, q) if inverse else gauge(z, q)
    sign = -1 if inverse else 1
    ans = {}
    for j in range(S):
        shift = tuple(sign * int(a == j) for a in range(S))
        shifted_q = tuple(x + DELTA * a for x, a in zip(q, shift))
        right = (gauge(z, shifted_q).inv() if inverse
                 else gauge(z + HBAR, shifted_q).inv())
        ans[shift] = left[:, j] * right[j, :]
    return ans


def four_factor_entry(a, b, i, j, h):
    """L_u[a,h] L_u^-1[h,i] L_v[j,h] L_v^-1[h,b]."""
    specifications = ((U, False, a, h), (U, True, h, i),
                      (V, False, j, h), (V, True, h, b))
    result = {}

    def extend(position, q, cumulative, coefficient):
        if position == len(specifications):
            result[cumulative] = result.get(cumulative, 0) + coefficient
            return
        z, inverse, row, column = specifications[position]
        for shift, matrix in lax_at(z, q, inverse).items():
            value = matrix[row, column]
            if not value:
                continue
            next_q = tuple(x + DELTA * t for x, t in zip(q, shift))
            next_shift = tuple(x + t for x, t in zip(cumulative, shift))
            extend(position + 1, next_q, next_shift, coefficient * value)

    extend(0, BASE_Q, (0,) * S, sp.Integer(1))
    return {shift: sp.cancel(value) for shift, value in result.items() if value}


def coefficient(a, b, gamma, i, j):
    Gamma = vertex_R(U, V, HBAR, (-1, 1))
    Gamma_inverse = Gamma.inv()
    result = {}
    for h in range(S):
        weight = sum(Gamma[gamma, h * S + c]
                     * Gamma_inverse[h * S + c, i * S + j]
                     for c in range(S))
        for shift, value in four_factor_entry(a, b, i, j, h).items():
            result[shift] = result.get(shift, 0) + weight * value
    return {shift: sp.cancel(value) for shift, value in result.items() if value}


if __name__ == "__main__":
    # A=1 differs from target i=0, so every shift coefficient must be zero.
    answer = coefficient(a=1, b=0, gamma=0, i=0, j=0)
    print("Source: tagged U4(2) times W_CD(2).")
    print("Parameters: hbar=1, u=2, v=5, flag q=(-6,6).")
    print("Output A=1,B=0,C=(0,0); target D=(0,0).")
    print("Expected every coefficient: zero.")
    print("Actual complete shift expansion:")
    for shift in sorted(answer):
        print(shift, answer[shift])
    assert answer and any(answer.values())
    print("Exact nonzero off-target residual established.")
