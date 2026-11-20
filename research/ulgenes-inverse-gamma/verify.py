#!/usr/bin/env python3
"""Exact finite checks for the Ulgenes proof; standard library only.

The analytic proof of convergence is in PROOF.md. These checks cover the
rational-kernel remainder, its integration against positive atomic measures,
the uniform product bound, and the source's coefficient indexing. They do
not infer an infinite theorem from a finite computation.

For the source-index checks, logarithms of primes are replaced by positive
rational weights. This preserves all logarithm-of-factorial difference
identities and makes the algebra exact; it is not a numerical evaluation of
the inverse gamma function or a claim about logarithmic approximation.
"""

from fractions import Fraction as Q
from math import prod


def lagrange(nodes, values, t):
    return sum(
        (
            values[j]
            * prod((t - x) / (nodes[j] - x)
                   for k, x in enumerate(nodes) if k != j)
            for j in range(len(nodes))
        ), Q(0)
    )


def divided_difference(nodes, values):
    row = list(values)
    for width in range(1, len(nodes)):
        row = [(row[j + 1] - row[j]) / (nodes[j + width] - nodes[j])
               for j in range(len(row) - 1)]
    return row[0]


def kernel_remainder(nodes, t, s):
    return prod((t - x) / (s - x) for x in nodes) / (s - t)


def check_kernels():
    count = 0
    families = [
        [Q(j * (j + 1), 6) for j in range(9)],
        [Q(j * j, 7) for j in range(9)],
    ]
    for all_nodes in families:
        for degree in range(1, 8):
            nodes = all_nodes[:degree + 1]
            for s in [Q(-1), Q(-3, 2), Q(-4), Q(-101)]:
                values = [1 / (s - x) for x in nodes]
                for t in [Q(-1, 2), Q(0), Q(1, 5), Q(1), Q(3),
                          nodes[-1], nodes[-1] + 1]:
                    actual = 1 / (s - t) - lagrange(nodes, values, t)
                    assert actual == kernel_remainder(nodes, t, s)
                    count += 1
    return count


def check_atomic_pick_functions():
    count = 0
    atoms = [(Q(-1), Q(2)), (Q(-3), Q(5, 7)), (Q(-11), Q(13, 3))]
    all_nodes = [Q(j * (j + 1), 6) for j in range(10)]
    for linear in [Q(0), Q(7, 3)]:
        def f(t):
            return Q(5, 11) + linear * t + sum(
                (mass * (1 / (s - t) - s / (1 + s * s))
                 for s, mass in atoms), Q(0))

        for degree in range(1, 9):
            nodes = all_nodes[:degree + 1]
            values = [f(x) for x in nodes]
            d = divided_difference(nodes, values)
            signed_integral = sum(
                (mass / prod(s - x for x in nodes) for s, mass in atoms),
                Q(0)) + (linear if degree == 1 else 0)
            assert d == signed_integral
            assert (-1) ** (degree - 1) * d > 0
            for t in [Q(-1, 2), Q(0), Q(1, 5), Q(2), Q(5)]:
                actual = f(t) - lagrange(nodes, values, t)
                expected = sum(
                    (mass * kernel_remainder(nodes, t, s)
                     for s, mass in atoms), Q(0))
                assert actual == expected
                count += 1
    return count


def check_uniform_bounds():
    count = 0
    a, b, c = Q(-1), Q(-1, 3), Q(2, 3)
    atoms = [(Q(-1), Q(2)), (Q(-3), Q(5, 7)), (Q(-11), Q(13, 3))]
    nodes = [Q(j * (j + 1), 6) for j in range(12)]
    m = 3
    assert nodes[m] > c
    head = prod(max(abs(b - x), abs(c - x)) for x in nodes[:m])
    constant = head * sum(
        (mass / ((b - s) * prod(x - s for x in nodes[:m]))
         for s, mass in atoms), Q(0))
    for length in range(m, len(nodes) + 1):
        bound = constant * prod((x - b) / (x - a) for x in nodes[m:length])
        for t in [b, Q(-1, 7), Q(0), Q(1, 5), c]:
            actual = abs(sum(
                (mass * kernel_remainder(nodes[:length], t, s)
                 for s, mass in atoms), Q(0)))
            assert actual <= bound
            count += 1
    return count


def weighted_log_integer(value, weights):
    total = Q(0)
    p = 2
    while p * p <= value:
        while value % p == 0:
            total += weights[p]
            value //= p
        p += 1
    if value > 1:
        total += weights[value]
    return total


def check_source_coefficients():
    count = 0
    primes = [2, 3, 5, 7, 11, 13]
    for offset in [1, 2, 5, 11]:
        weights = {p: Q(p + offset, p + 1) for p in primes}
        log_factorial = [Q(0)]
        for j in range(1, 14):
            log_factorial.append(
                log_factorial[-1] + weighted_log_integer(j, weights))
        nodes = log_factorial[1:]
        values = [Q(j + 1) for j in range(1, 14)]
        coefficients = [Q(2)]
        for n in range(1, 12):
            source = Q(0)
            for k in range(n + 1):
                left = prod(log_factorial[k + 1] - log_factorial[i]
                            for i in range(1, k + 1))
                right = prod(log_factorial[k + 1] - log_factorial[k + 1 + i]
                             for i in range(1, n - k + 1))
                source += Q(k) / (left * right)
            recursive = divided_difference(nodes[:n + 1], values[:n + 1])
            assert source == recursive
            coefficients.append(source)
            for j, t in enumerate(nodes[:n + 1]):
                interpolant = sum(
                    (coefficients[d] * prod(t - x for x in nodes[:d])
                     for d in range(n + 1)), Q(0))
                assert interpolant == values[j]
            count += 1
    return count


if __name__ == "__main__":
    kernel = check_kernels()
    atomic = check_atomic_pick_functions()
    bound = check_uniform_bounds()
    source = check_source_coefficients()
    print(f"PASS: {kernel} exact kernel remainders; {atomic} atomic Pick "
          f"remainders; {bound} uniform product bounds; {source} source "
          "coefficient/index checks (each with all interpolation nodes).")
    print("The infinite convergence theorem is proved analytically in PROOF.md.")
