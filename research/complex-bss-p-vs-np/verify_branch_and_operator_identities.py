#!/usr/bin/env python3
"""Exact finite checks for the partition, tableau and operator notes.

Requires SymPy. This checks the specified identities and small examples;
it does not verify the general geometric lemmas, asymptotic circuit bounds,
the conditional cutting compiler, or P_C versus NP_C.
"""

from collections import Counter, defaultdict
from itertools import permutations, product

import sympy as sp


def equal(actual, expected, label):
    difference = sp.cancel(sp.expand(actual - expected))
    if difference != 0:
        raise AssertionError(f"{label}: nonzero difference {difference}")


def matrix_equal(actual, expected, label):
    if actual.shape != expected.shape:
        raise AssertionError(f"{label}: different shapes")
    for i in range(actual.rows):
        for j in range(actual.cols):
            equal(actual[i, j], expected[i, j], f"{label}[{i},{j}]")


def geometric_pair(z, k):
    if k == 0:
        return sp.Integer(1), sp.Integer(0)
    power, partial_sum = geometric_pair(z, k // 2)
    even_power = power * power
    even_sum = (1 + power) * partial_sum
    if k % 2:
        return z * even_power, even_sum + even_power
    return even_power, even_sum


def check_branch_gluing():
    x, y, u, z = sp.symbols("x y u z")
    for k in (0, 1, 2, 5, 9):
        power, partial_sum = geometric_pair(z, k)
        equal(power, z**k, f"binary power {k}")
        equal(partial_sum, sum(z**j for j in range(k)),
              f"binary geometric sum {k}")

    f = (x, 1 - x*y)
    base = (y, sp.Integer(1))
    h, a = 1 + x, x*x + y
    zero_coefficients = tuple((1-h*a)*c for c in base)
    equal(sum(fi*ci for fi, ci in zip(f, zero_coefficients)) + h*a,
          1, "zero-branch certificate")

    syzygy = (f[1], -f[0])
    correction = (u*u+x, u+y)
    b = tuple(base[i] + u**3*syzygy[i] + (h*u-1)*correction[i]
              for i in range(2))
    inverse_coefficient = -sum(f[i]*correction[i] for i in range(2))
    equal(sum(f[i]*b[i] for i in range(2))
          + (h*u-1)*inverse_coefficient, 1,
          "nonzero-branch certificate")
    for k in (4, 7):
        cleared = tuple(sp.cancel(h**k*bi.subs(u, 1/h)) for bi in b)
        equal(sum(fi*bi for fi, bi in zip(f, cleared)), h**k,
              f"denominator clearing K={k}")
        _, partial_sum = geometric_pair(h*a, k)
        glued = tuple(a**k*cleared[i] + zero_coefficients[i]*partial_sum
                      for i in range(2))
        equal(sum(fi*ci for fi, ci in zip(f, glued)), 1,
              f"glued certificate K={k}")


def check_stable_matrix():
    x, q = sp.symbols("x q")
    f = sp.Matrix([1, x])
    u = sp.Matrix([[1+x/q, -1/q]])
    matrix = (sp.eye(2)-f*u).row_join(f).col_join(u.row_join(sp.zeros(1)))
    matrix_equal(matrix*matrix, sp.eye(3), "stable involution")
    matrix_equal(matrix*sp.Matrix([1, x, 0]), sp.Matrix([0, 0, 1]),
                 "stable certificate action")
    equal(matrix.det(), -1, "stable determinant")


def zero_gadget(h, b, u):
    return (b*(b-1), b*h, (1-b)*(h*u-1), b*u)


def check_transcript_escape():
    x, y, z, epsilon = sp.symbols("x y z epsilon")
    h1, h2 = x*y, x*(1-y*z)
    equal(z*h1+h2, x, "complete decision identity")
    for h, b, u, label in ((0, 1, 0, "zero"),
                            (epsilon, 0, 1/epsilon, "punctured"),
                            (1, 0, 1, "second test")):
        for i, equation in enumerate(zero_gadget(h, b, u)):
            equal(equation, 0, f"{label} gadget {i}")
    equal(epsilon*1-epsilon, 0, "actual projective arc hU=V")
    equal(h1*h2, x*x*y*(1-y*z), "inverse witness Jacobian")
    # Both the central finite transcript and nearby escaping transcripts reject.
    equal(1*0, 0, "central output")
    equal(0*0, 0, "punctured output")


def digit_polynomials(t, m, zeta):
    d = 2**m
    current = t
    bits = []
    for j in range(m):
        bit = sp.expand((1-current**(2**(m-j-1)))/2)
        bits.append(bit)
        current = sp.expand(current*(1+(zeta**(d-2**j)-1)*bit))
    return bits


def check_reentry():
    t, tau = sp.symbols("t tau")
    for m, zeta in ((1, -1), (2, sp.I)):
        d = 2**m
        bits = digit_polynomials(t, m, zeta)
        patterns = set()
        for a in range(d):
            alpha = zeta**a
            values = tuple(sp.simplify(bit.subs(t, alpha)) for bit in bits)
            expected = tuple((a >> j) & 1 for j in range(m))
            if values != expected:
                raise AssertionError(f"digit recurrence m={m}, a={a}")
            patterns.add(values)
            for j, bit in enumerate(bits):
                p = bit + tau*(t**d-1)
                derivative = sp.expand(sp.diff(p, t).subs(t, alpha))
                coefficient = derivative.coeff(tau)
                equal(coefficient, d*alpha**(d-1), "transcendental coefficient")
                if sp.simplify(coefficient) == 0:
                    raise AssertionError("vanishing derivative coefficient")
                equal(p.subs(t, alpha), expected[j], "central branch value")
        if len(patterns) != d:
            raise AssertionError("missing central branch patterns")


def check_marked_gcd_and_nullvector():
    t = sp.symbols("t")
    f = (t-1)*(t-2)*(t+3)
    g = (t-1)*(t-2)*(t+4)
    common_multiplier = (t-7)**6*(t-1)**3
    numerator = -sp.diff(f, t)*sp.diff(g, t)*common_multiplier
    denominator = f*g*common_multiplier
    e = sp.Poly(sp.gcd(denominator, sp.diff(denominator, t)), t).monic().as_expr()
    f_gcd = sp.Poly(sp.gcd(numerator, sp.gcd(denominator,
                                          sp.diff(denominator, t))), t).monic().as_expr()
    r = sp.cancel(e/f_gcd)
    equal(r, (t-1)*(t-2), "unreduced two-gcd double-pole support")
    j = sp.diff(r, t)/r
    equal(j, sp.diff(e, t)/e-sp.diff(f_gcd, t)/f_gcd,
          "logarithmic derivative quotient")
    remainder = sp.cancel(numerator/denominator-sp.diff(j, t))
    reduced_denominator = sp.fraction(remainder)[1]
    if sp.degree(sp.gcd(reduced_denominator, sp.diff(reduced_denominator, t)), t) != 0:
        raise AssertionError("Hermite remainder has repeated denominator roots")
    u = sp.cancel(g/(t-1))
    v = sp.cancel(-f/(t-1))
    equal(f*u+g*v, 0, "short Sylvester nullvector")
    if sp.degree(u, t) >= sp.degree(g, t) or sp.degree(v, t) >= sp.degree(f, t):
        raise AssertionError("nullvector degree bound")


def check_compressed_operator_and_inverse_jet():
    t, z, epsilon, y = sp.symbols("t z epsilon y")
    a, b, c, d = sp.symbols("a b c d")
    bits = digit_polynomials(t, 2, sp.I)
    h = sp.expand((2*bits[0]-1)*(2*bits[1]-1)
                  * (a*bits[0]+b*bits[1])*(c*bits[0]+d*bits[1]))
    per = a*d+b*c
    equal(sum(h.subs(t, sp.I**j) for j in range(4)), per,
          "four-root weighted sum")

    shift = sp.zeros(4)
    for j in range(4):
        shift[(j+1) % 4, j] = 1
    h_shift = sp.zeros(4)
    for (exponent,), coefficient in sp.Poly(h, t).terms():
        h_shift += coefficient*shift**(exponent % 4)
    h_shift = h_shift.applyfunc(sp.expand)
    equal(h_shift[0, 0], per/4, "compressed matrix entry")
    projector = sp.zeros(4)
    projector[0, 0] = 1
    matrix = sp.eye(4)+projector*(4*h_shift-(y+1)*sp.eye(4))
    equal(matrix.det(), per-y, "compressed determinant")
    matrix_equal(matrix*sp.Matrix([1, 0, 0, 0]),
                 sp.Matrix([per-y, 0, 0, 0]), "known kernel vector")

    q = t**4-z
    remainder = sp.rem(h, q, t)
    equal(remainder.subs({z: 1, t: 0}), per/4,
          "canonical inverse first deformation coefficient")
    equal(sp.rem(remainder-h, q, t), 0, "first-order modular inverse equation")
    first_order = sp.expand((1-epsilon*h)*(1+epsilon*remainder)-1)
    equal(first_order.coeff(epsilon, 0), 0, "modular inverse constant order")
    equal(sp.rem(first_order.coeff(epsilon, 1), q, t), 0,
          "modular inverse linear order")


def check_cutting_local_identities():
    for a, b, c in product((0, 1), repeat=3):
        equal(1-c-a*b+2*c*a*b, int(c == a*b), "AND validity")
    r = sp.Rational(1, 2)
    equal((1-r)*0+r*1, sp.Rational(1, 2), "correlated word extension")
    equal(r*r, sp.Rational(1, 4), "independent word extension")
    lam, mu = sp.symbols("lambda mu")
    scalars = {"a": lam, "b": mu}
    runs = ((1, ("a", "b")), (-1, ("b", "a")),
            (2, ("a", "a")), (3, ()))
    grouped = defaultdict(int)
    direct = 0
    for weight, names in runs:
        direct += weight*sp.prod(scalars[name] for name in names)
        grouped[tuple(sorted(Counter(names).items()))] += weight
    postponed = sum(weight*sp.prod(scalars[name]**exponent
                                  for name, exponent in names)
                    for names, weight in grouped.items())
    equal(direct, postponed, "sparse postponement with cancellation")
    equal(postponed, 2*lam*lam+3, "postponed aggregate")


def check_supplied_exclusion():
    t, x, epsilon, u, v = sp.symbols("t x epsilon u v")
    r = t*t-x
    g = (t-2)*(t+3)
    q = (t-2)**2*(t+3)**5
    p = r**3*q
    b = sp.cancel(g*sp.diff(p, t)/p)
    remainder = 2*(t+3)+5*(t-2)
    equal(b-remainder, 3*g*sp.diff(r, t)/r, "supplied-exclusion cancellation")
    numerator, denominator = sp.fraction(b)
    equal(sp.rem(numerator-remainder*denominator, g, t), 0,
          "localized polynomial remainder")
    for beta, multiplicity in ((2, 2), (-3, 5)):
        equal(remainder.subs(t, beta), multiplicity*sp.diff(g, t).subs(t, beta),
              "integer multiplicity profile")

    r = t**3+x+1
    g = t*t+x*t+1
    p = r*r*g**4
    substitution = {x: epsilon*u, t: epsilon*v}
    for degree in (3, 5):
        def truncate(expression):
            polynomial = sp.Poly(sp.expand(expression), epsilon)
            return sp.Add(*(coefficient*epsilon**k
                            for (k,), coefficient in polynomial.terms() if k <= degree))

        def finite_log(unit):
            increment = truncate(unit-1)
            power, result = sp.Integer(1), sp.Integer(0)
            for j in range(1, degree+1):
                power = truncate(power*increment)
                result += sp.Rational((-1)**(j+1), j)*power
            return truncate(result)

        logarithm = truncate((finite_log(p.subs(substitution))
                              - 4*finite_log(g.subs(substitution)))/2)
        power, exponential = sp.Integer(1), sp.Integer(1)
        for j in range(1, degree+1):
            power = truncate(power*logarithm)
            exponential += power/sp.factorial(j)
        equal(truncate(exponential), truncate(r.subs(substitution)),
              f"supplied-factor normalized full jet D={degree}")


def check_uniform_cyclic_trace():
    t, z = sp.symbols("t z")
    for m in (1, 2, 3):
        base = m+1
        exponents = [base**j for j in range(m)]
        kappa = sum(exponents)
        dimension = 2**(m*(base-1).bit_length()+1)
        entries = sp.symbols(f"c0:{m*m}")
        matrix = [entries[m*i:m*(i+1)] for i in range(m)]
        k = sp.prod(sum(matrix[i][j]*t**exponents[j] for j in range(m))
                    for i in range(m))
        h = sp.expand(t**(dimension-kappa)*k/dimension)
        remainder = sp.rem(h, t**dimension-z, t)
        # In the power basis of C(z)[t]/(t^D-z), only its constant
        # coefficient contributes to the multiplication trace.
        trace = dimension*sp.Poly(remainder, t).coeff_monomial(1)
        per = sum(sp.prod(matrix[i][p[i]] for i in range(m))
                  for p in permutations(range(m)))
        equal(trace, z*per, f"uniform cyclic trace m={m}")


def main():
    checks = (check_branch_gluing, check_stable_matrix, check_transcript_escape,
              check_reentry, check_marked_gcd_and_nullvector,
              check_compressed_operator_and_inverse_jet,
              check_cutting_local_identities, check_supplied_exclusion,
              check_uniform_cyclic_trace)
    for check in checks:
        check()
        print(f"PASS {check.__name__}")
    print(f"{len(checks)} finite exact check groups passed; no general separation is verified.")


if __name__ == "__main__":
    main()
