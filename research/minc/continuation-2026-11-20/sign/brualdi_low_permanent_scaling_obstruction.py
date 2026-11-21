"""Exact rational certificate: low permanent does not ensure symmetrization descent.

The matrices being compared are the uniquely defined doubly stochastic
scalings of rational matrices W and V. Rational diagonal factors and an
explicit rational correction certify capacity bounds; no floating-point
quantity is used in any assertion.
"""

from fractions import Fraction as F
from math import prod


def derangement(n):
    if n == 0:
        return 1
    previous, current = 1, 0
    for k in range(2, n + 1):
        previous, current = current, (k - 1) * (previous + current)
    return current


def weight_matrix(n, symmetric):
    a = [[F(i != j or i == n - 1) for j in range(n)] for i in range(n)]
    a[0][1] = F(3, 10) if symmetric else F(9, 100)
    if symmetric:
        a[1][0] = F(3, 10)
    return a


def exact_weight_permanent(n, symmetric):
    ds = [derangement(n - i) for i in range(4)]
    base = ds[0] + ds[1]
    single_minor = ds[1] + 2 * ds[2] + ds[3]
    if not symmetric:
        return base - F(91, 100) * single_minor
    double_minor = ds[2] + ds[3]
    return base - F(7, 5) * single_minor + F(49, 100) * double_minor


def capacity_bracket(n, symmetric, row_numerators, eta):
    w = weight_matrix(n, symmetric)
    r = [F(v, 10**12) for v in row_numerators]
    assert len(r) == n and all(value > 0 for value in r)
    c = [1 / sum(r[i] * w[i][j] for i in range(n)) for j in range(n)]
    t = [[r[i] * w[i][j] * c[j] for j in range(n)] for i in range(n)]
    assert all(sum(t[i][j] for i in range(n)) == 1 for j in range(n))
    residual = [1 - sum(row) for row in t]
    assert sum(residual) == 0
    correction = [
        [F(0) if i == j else ((n - 1) * residual[i] + residual[j]) / (n * (n - 2))
         for j in range(n)]
        for i in range(n)
    ]
    q = [[t[i][j] + correction[i][j] for j in range(n)] for i in range(n)]
    assert all(sum(row) == 1 for row in q)
    assert all(sum(q[i][j] for i in range(n)) == 1 for j in range(n))
    for i in range(n):
        for j in range(n):
            assert abs(correction[i][j]) <= eta * t[i][j]
            assert q[i][j] >= 0
    scaled_permanent = prod(r) * prod(c) * exact_weight_permanent(n, symmetric)
    return scaled_permanent * (1 - eta) ** n, scaled_permanent * (1 + eta) ** n


def reference_permanent(n):
    """Explicit symmetric feasible point: free row/column entries are 1/n."""
    m = n - 1
    border = F(1, n)
    interior = F(n - 1, n * (n - 2))
    return (border * derangement(m) * interior**m
            + border**2 * m * interior**(m - 1)
            * (derangement(m) + derangement(m - 1)))


def main():
    n = 24
    eta = F(1, 10**10)
    w_row_numerators = [1088477592759, 1045432090519] + [1043471932248] * 21 + [10**12]
    v_row_numerators = [1078938778453] * 2 + [1043428329348] * 21 + [10**12]
    lower_a, upper_a = capacity_bracket(n, False, w_row_numerators, eta)
    lower_b, upper_b = capacity_bracket(n, True, v_row_numerators, eta)
    p_n = F(derangement(n), (n - 1) ** n)
    assert F(9999835, 10**7) * p_n < lower_a
    assert upper_a < F(9999836, 10**7) * p_n
    assert F(10001147, 10**7) * p_n < lower_b
    assert upper_b < F(10001148, 10**7) * p_n
    assert upper_a < p_n < lower_b
    assert reference_permanent(n) < lower_a
    print("Exact capacity brackets verified:")
    print("0.9999835 p_24 < per A < 0.9999836 p_24 < p_24")
    print("p_24 < 1.0001147 p_24 < per B < 1.0001148 p_24")
    print("An explicit symmetric feasible matrix has permanent below per A.")


if __name__ == "__main__":
    main()
