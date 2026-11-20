#!/usr/bin/env python3
"""Exact algebra checks for the Bessel-ratio proof.

The coefficients of each Bessel series are normalized to start at one.
Direct series multiplication gives H; comparison with the ODE-derived
identity catches missing powers, signs, and scale factors. These finite
checks do not prove global unimodality. PROOF.md supplies that proof.
Only the Python standard library is required; no floating point is used.
"""

from fractions import Fraction as F


def coefficients(order, scale, degree):
    result = [F(1)]
    for k in range(1, degree + 1):
        result.append(result[-1] * scale**2 / (4 * k * (k + order)))
    return result


def check_case(nu1, nu2, a1, a2, degree=12):
    assert nu1 >= nu2 > -1 and 0 < a1 <= a2
    c = coefficients(nu1, a1, degree)
    d = coefficients(nu2, a2, degree)
    product = [sum(c[i] * d[n-i] for i in range(n+1))
               for n in range(degree+1)]
    wronskian = [sum((nu1 + 2*i - nu2 - 2*(n-i)) * c[i] * d[n-i]
                    for i in range(n+1)) for n in range(degree+1)]
    rho = nu1 + nu2
    delta = nu1 - nu2
    A = nu1**2 - nu2**2
    B = a2**2 - a1**2
    for n in range(degree+1):
        previous = product[n-1] if n else F(0)
        assert (rho + 2*n) * wronskian[n] == A * product[n] - B * previous
    assert wronskian[0] == delta
    if delta == 0:
        assert wronskian[1] == -B / (2 * (nu1 + 1))
        assert 2*nu1 + 2 > 0
    else:
        assert wronskian[0] > 0
    assert rho + 2 > 0
    assert c[0] * d[0] > 0 and c[1] * d[0] > 0
    return degree + 1


def main():
    # All equality/sign cases and orders close to the lower endpoint.
    cases = [
        (F(-4, 5), F(-4, 5), F(1), F(1)),
        (F(-4, 5), F(-4, 5), F(1), F(2)),
        (F(-1, 5), F(-4, 5), F(1), F(1)),
        (F(1, 4), F(-1, 4), F(1), F(1)),
        (F(5, 4), F(-1, 4), F(1), F(1)),
        (F(-1, 4), F(-3, 4), F(1), F(2)),
        (F(1, 4), F(-1, 4), F(1), F(2)),
        (F(3, 2), F(-1, 4), F(1), F(2)),
        (F(9, 10), F(-99, 100), F(1), F(3, 2)),
        (F(100), F(99), F(1), F(2)),
    ]
    identities = sum(check_case(*case) for case in cases)
    print(f"PASS: {identities} exact Wronskian coefficient identities; "
          f"{len(cases)} endpoint and positivity checks.")
    print("Global unimodality is established analytically in PROOF.md.")


if __name__ == "__main__":
    main()
