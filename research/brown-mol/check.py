#!/usr/bin/env python3
"""Exact auxiliary checks and a finite Brown–Mol counterexample certificate.

The infinite counterfamily is proved analytically in PROOF.md. This script
separately checks its tree identity for three small instances, the algebraic
boundary identity, and a rational Rouche certificate for the tree with 200
branches. It uses only Python's standard library and no floating-point tests.
"""
from fractions import Fraction as F
import json


def cadd(a, b):
    return (a[0] + b[0], a[1] + b[1])


def cmul(a, b):
    return (a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0])


def cscale(a, scalar):
    return (a[0] * scalar, a[1] * scalar)


ONE = (F(1), F(0))
ZERO = (F(0), F(0))


def cpow(a, n):
    result = ONE
    while n:
        if n & 1:
            result = cmul(result, a)
        a = cmul(a, a)
        n //= 2
    return result


def padd(a, b):
    result = [ZERO] * max(len(a), len(b))
    for i, value in enumerate(a):
        result[i] = cadd(result[i], value)
    for i, value in enumerate(b):
        result[i] = cadd(result[i], value)
    return result


def pmul(a, b):
    result = [ZERO] * (len(a) + len(b) - 1)
    for i, value in enumerate(a):
        for j, other in enumerate(b):
            result[i + j] = cadd(result[i + j], cmul(value, other))
    return result


def ppow(a, n):
    result = [ONE]
    for _ in range(n):
        result = pmul(result, a)
    return result


def pscale(a, scalar):
    return [cscale(value, scalar) for value in a]


def assert_polynomial_equal(a, b):
    length = max(len(a), len(b))
    assert a + [ZERO] * (length - len(a)) == b + [ZERO] * (length - len(b))


def check_boundary_identity():
    # The variable is real y, while z = -1/2 + i*y.
    z = [(F(-1, 2), F(0)), (F(0), F(1))]
    one_plus_z = padd([ONE], z)
    a = padd([ONE], pmul(z, ppow(one_plus_z, 4)))
    conjugate_a = [(real, -imaginary) for real, imaginary in a]
    lhs = padd(pmul(a, conjugate_a), [(F(-1), F(0))])
    q = [(F(1, 4), F(0)), ZERO, ONE]
    rhs = pmul(q, padd(ppow(q, 4), [(F(-1, 4), F(0)), ZERO, (F(3), F(0))]))
    assert_polynomial_equal(lhs, rhs)
    polynomial = lambda t: (t + F(1, 4)) ** 4 + 3 * t - F(1, 4)
    assert polynomial(F(0)) == F(-63, 256)
    assert polynomial(F(1, 12)) == F(1, 81)
    # Derivative 4(t+1/4)^3+3 is positive for all t >= 0.
    return {"boundary_identity": "exact polynomial equality", "endpoints": ["-63/256", "1/81"]}


def tree_coefficients_by_connected_sets(r):
    n = 1 + 5 * r
    adjacency = [0] * n
    for j in range(r):
        center = 1 + 5 * j
        for u, v in [(0, center)] + [(center, center + k) for k in range(1, 5)]:
            adjacency[u] |= 1 << v
            adjacency[v] |= 1 << u
    counts = [0] * (n + 1)
    for subset in range(1, 1 << n):
        reached = frontier = subset & -subset
        while frontier:
            bit = frontier & -frontier
            frontier -= bit
            new = adjacency[bit.bit_length() - 1] & subset & ~reached
            reached |= new
            frontier |= new
        if reached == subset:
            counts[subset.bit_count()] += 1
    return counts


def check_tree_identity():
    z = [ZERO, ONE]
    one_plus_z = [ONE, ONE]
    a = padd([ONE], pmul(z, ppow(one_plus_z, 4)))
    b = padd(ppow(one_plus_z, 4), [(F(4), F(0))])
    records = []
    for r in (1, 2, 3):
        expression = pmul(z, padd(ppow(a, r), pscale(b, r)))
        actual = tree_coefficients_by_connected_sets(r)
        assert all(imaginary == 0 and real.denominator == 1 for real, imaginary in expression)
        assert actual == [int(real) for real, imaginary in expression]
        records.append({"branches": r, "vertices": len(actual) - 1, "subtrees": sum(actual)})
    return records


def exact_finite_certificate():
    r = 200
    rho = F(1, 1000)
    z = (F(-23, 40), F(17, 50))
    u = cadd(ONE, z)
    a = cadd(ONE, cmul(z, cpow(u, 4)))
    b = cadd(cpow(u, 4), (F(4), F(0)))
    a1 = cmul(cpow(u, 3), cadd(ONE, cscale(z, 5)))
    b1 = cscale(cpow(u, 3), 4)
    value = cadd(cpow(a, r), cscale(b, r))
    derivative = cadd(cscale(cmul(cpow(a, r - 1), a1), r), cscale(b1, r))
    value_upper = abs(value[0]) + abs(value[1])
    derivative_lower = max(abs(derivative[0]), abs(derivative[1]))

    # On |w-z| <= rho, bound a', a'', and b'', then a itself.
    u1, u5, u2 = F(11, 20), F(13, 5), F(2)
    for vector, bound in (
        (u, u1 - rho),
        (cadd(ONE, cscale(z, 5)), u5 - 5 * rho),
        (cadd((F(2), F(0)), cscale(z, 5)), u2 - 5 * rho),
        (a, F(517, 500)),
    ):
        assert bound > 0 and vector[0] ** 2 + vector[1] ** 2 < bound ** 2
    a1_upper = u1 ** 3 * u5
    a2_upper = 4 * u1 ** 2 * u2
    a_upper = F(517, 500) + a1_upper * rho
    b2_upper = 12 * u1 ** 2
    second_derivative_upper = (
        r * (r - 1) * a_upper ** (r - 2) * a1_upper ** 2
        + r * a_upper ** (r - 1) * a2_upper
        + r * b2_upper
    )

    assert value_upper < 25
    assert derivative_lower > 61000
    assert second_derivative_upper < 7000000
    assert F(25) + F(7000000) * rho * rho / 2 < F(61000) * rho
    # The linear comparison has exactly one zero, so Rouche gives one zero
    # of a(w)^200+200*b(w) in this disk.
    shifted_center_square = (z[0] + F(1, 2)) ** 2 + z[1] ** 2
    assert shifted_center_square < F(7, 20) ** 2
    assert F(7, 20) + rho < F(1, 2)
    assert z[0] ** 2 + z[1] ** 2 > rho ** 2
    return {
        "branches": r,
        "vertices": 1 + 5 * r,
        "center": [str(z[0]), str(z[1])],
        "radius": str(rho),
        "absolute_value_upper": 25,
        "absolute_derivative_lower": 61000,
        "second_derivative_upper": 7000000,
        "remainder_plus_constant_upper": "57/2",
        "linear_boundary_lower": 61,
        "roots_in_disk": 1,
        "disk_inside_forbidden_inner_disk": True,
        "arithmetic": "integers and fractions only",
    }


if __name__ == "__main__":
    output = {
        "tree_identity_checks": check_tree_identity(),
        "boundary_identity_check": check_boundary_identity(),
        "finite_counterexample_certificate": exact_finite_certificate(),
        "infinite_family": "proved in PROOF.md; not inferred from finite checks",
    }
    print(json.dumps(output, indent=2))
