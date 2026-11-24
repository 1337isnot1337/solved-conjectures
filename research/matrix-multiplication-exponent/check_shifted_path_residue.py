"""Exact finite checks of conditional-height residue ranks.

This does not test or assume a six-index source-to-target identity.
"""

from itertools import product, combinations
import sympy as sp
from irf_vertex_exact_candidate import gauge, vertex_R


def prefix_height(q, prefix, eta):
    s = len(q)
    return tuple(q[j] - s * eta * prefix.count(j) for j in range(s))


def polynomial_row(q):
    q = tuple(map(sp.sympify, q))
    s = len(q)
    x = sp.Symbol("x")
    mean = sum(q) / s
    polynomial = sp.Poly(sp.prod(x - qj + mean for qj in q), x)
    return sp.Matrix([[polynomial.nth(a)
                       for a in list(range(s - 1)) + [s]]])


def path_matrix(q, heights, eta, inverse=False):
    s, k = len(q), len(heights)
    words = tuple(product(range(s), repeat=k))
    cache = {}
    result = sp.zeros(s ** k)
    for hi, word in enumerate(words):
        matrices = []
        for t in range(k):
            key = (t, word[:t])
            if key not in cache:
                matrix = gauge(heights[t], prefix_height(q, word[:t], eta))
                cache[key] = matrix.inv() if inverse else matrix
            matrices.append(cache[key])
        for ai, outputs in enumerate(words):
            if inverse:
                result[hi, ai] = sp.prod(
                    matrices[t][word[t], outputs[t]] for t in range(k))
            else:
                result[ai, hi] = sp.prod(
                    matrices[t][outputs[t], word[t]] for t in range(k))
    return result


def top_residue_exterior(q, k, eta):
    s = len(q)
    subsets = tuple(combinations(range(s), k))
    rows = []
    # Last h is absent from the highest residue; retain each distinct prefix.
    for prefix in product(range(s), repeat=k - 1):
        matrix = sp.Matrix.vstack(*[
            polynomial_row(prefix_height(q, prefix[:t], eta))
            for t in range(k)
        ])
        rows.append([matrix[:, subset].det() / s ** k
                     for subset in subsets])
    return sp.Matrix(rows)


def dynamical_R(z1, z2, eta, q):
    s = len(q)
    ans = sp.zeros(s * s)
    for i, j in product(range(s), repeat=2):
        col = i * s + j
        if i == j:
            ans[col, col] = 1 / (z1 - z2) + 1 / eta
        else:
            ans[col, col] = 1 / eta + s / (q[i] - q[j])
            ans[j * s + i, col] = 1 / (z1 - z2) + s / (q[i] - q[j])
    return ans


def controlled_second(z, q, eta):
    """I_first-controlled g_second(z,q-s*eta*e_first)."""
    return sp.diag(*[gauge(z, prefix_height(q, (j,), eta))
                     for j in range(len(q))])


def controlled_first(z, q, eta):
    s = len(q)
    result = sp.zeros(s * s)
    for j in range(s):
        matrix = gauge(z, prefix_height(q, (j,), eta))
        for a, b in product(range(s), repeat=2):
            result[a * s + j, b * s + j] = matrix[a, b]
    return result


if __name__ == "__main__":
    eta = sp.Rational(2, 7)
    for q, k in [((-7, 1, 12), 2), ((-11, -3, 5, 17), 2),
                 ((-19, -5, 3, 14, 31), 3)]:
        q = tuple(map(sp.Rational, q))
        s = len(q)
        mat = top_residue_exterior(q, k, eta)
        expected = sp.binomial(s - 1, k - 1)
        rank = mat.rank()
        assert rank == expected
        print(f"s={s}, k={k}: exterior residue rank {rank} = {expected}")

    q = tuple(map(sp.Rational, (-7, 1, 12)))
    heights = (sp.Rational(5, 3), sp.Rational(11, 4))
    forward = path_matrix(q, heights, eta)
    inverse = path_matrix(q, heights, eta, inverse=True)
    assert forward * inverse == sp.eye(9)
    assert inverse * forward == sp.eye(9)
    print("s=3, k=2: both ordered matrix inverse products are identity")

    # Check the published fundamental shifted IRF formula independently.
    z1, z2 = sp.Rational(2), sp.Rational(5)
    s = len(q)
    left = vertex_R(z1, z2, eta, q)
    right = (sp.kronecker_product(sp.eye(s), gauge(z2, q))
             * controlled_first(z1, q, eta)
             * dynamical_R(z1, z2, eta, q)
             * controlled_second(z2, q, eta).inv()
             * sp.kronecker_product(gauge(z1, q).inv(), sp.eye(s)))
    discrepancy = left - right
    print("Fundamental shifted IRF residual rank:", discrepancy.rank())
    if discrepancy != sp.zeros(s * s):
        for a, b in product(range(s * s), repeat=2):
            if discrepancy[a, b]:
                print("First nonzero residual:", a, b, discrepancy[a, b])
                break
    else:
        print("Fundamental shifted IRF formula passes exactly")
    assert discrepancy == sp.zeros(s * s)
