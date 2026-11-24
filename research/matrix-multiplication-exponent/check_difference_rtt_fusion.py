"""Exact full-shift RTT and ordered two-factor exterior-fusion checks."""

from itertools import combinations, product
import sympy as sp
from irf_vertex_exact_candidate import gauge, exterior_power, vertex_R


def coefficients(z, q, eta):
    z, eta = map(sp.sympify, (z, eta))
    matrix = gauge(z, q)
    inverse = matrix.inv()
    return [z / (z + eta) * matrix[:, j] * inverse[j, :]
            for j in range(len(q))]


def shifted(q, j, eta):
    return tuple(q[t] + len(q) * eta * int(t == j)
                 for t in range(len(q)))


def two_product(q, u, v, eta, reverse):
    n = len(q)
    A, B = coefficients(u, q, eta), coefficients(v, q, eta)
    answer = {}
    for i, j in product(range(n), repeat=2):
        shift = tuple(int(t == i) + int(t == j) for t in range(n))
        if reverse:
            term = sp.kronecker_product(
                coefficients(u, shifted(q, j, eta), eta)[i], B[j])
        else:
            term = sp.kronecker_product(
                A[i], coefficients(v, shifted(q, i, eta), eta)[j])
        answer[shift] = answer.get(shift, sp.zeros(n * n)) + term
    return answer


if __name__ == "__main__":
    eta = sp.Rational(2, 7)
    u, v = sp.Rational(2), sp.Rational(5)
    for q0 in [(-6, 6), (-7, 1, 12)]:
        q = tuple(map(sp.Rational, q0))
        n = len(q)
        forward = two_product(q, u, v, eta, reverse=False)
        reverse = two_product(q, u, v, eta, reverse=True)
        R = vertex_R(u, v, -eta, q)
        assert all(R * forward[shift] == reverse[shift] * R
                   for shift in forward)
        wrong_R = vertex_R(u, v, eta, q)
        assert any(wrong_R * forward[shift] != reverse[shift] * wrong_R
                   for shift in forward)
        print(f"s={n}: every RTT shift sector passes with -eta; +eta fails")

    q = tuple(map(sp.Rational, (-7, 1, 12)))
    n = len(q)
    z = sp.Rational(5, 3)
    subsets = tuple(combinations(range(n), 2))
    embed = sp.zeros(n * n, len(subsets))
    for col, (i, j) in enumerate(subsets):
        embed[i * n + j, col] = 1
        embed[j * n + i, col] = -1
    G = exterior_power(gauge(z, q), 2)
    G_inverse = G.inv()
    actual = two_product(q, z + eta, z, eta, reverse=True)
    for shift, matrix in actual.items():
        if max(shift) > 1:
            assert matrix * embed == sp.zeros(n * n, len(subsets))
        else:
            J = tuple(j for j, entry in enumerate(shift) if entry)
            col = subsets.index(J)
            expected = z / (z + 2 * eta) * G[:, col] * G_inverse[col, :]
            assert matrix * embed == embed * expected
    print("s=3,k=2: full output lies in exterior space and equals ordinary L_2")
