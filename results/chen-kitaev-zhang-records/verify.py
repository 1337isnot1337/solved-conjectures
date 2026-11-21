#!/usr/bin/env python3
"""Exact certificates and source-class checks for the CKZ record conjectures.

No floating-point arithmetic and no Lean. The finite certificates below support
an induction over all indices in the accompanying proof; an n-cutoff is not the
mathematical result. The Newton-kernel method is due to the prior public
trureturing C2 proof, explicitly credited in PROOF.md.
"""
from __future__ import annotations

from collections import Counter
from fractions import Fraction
from math import comb
from pathlib import Path
import json


def trim(p):
    p = list(p)
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p


def add(*ps):
    out = [0] * max(map(len, ps), default=1)
    for p in ps:
        for i, x in enumerate(p):
            out[i] += x
    return trim(out)


def scale(p, a):
    return trim([a*x for x in p])


def mul(p, q):
    out = [0] * (len(p) + len(q) - 1)
    for i, x in enumerate(p):
        for j, y in enumerate(q):
            out[i+j] += x*y
    return trim(out)


def power(p, n):
    out = [1]
    for _ in range(n):
        out = mul(out, p)
    return out


def derivative(p):
    return trim([i*p[i] for i in range(1, len(p))] or [0])


U = [0, 1]
H = [1, 1]
A = [0, 3, 2]
B = [0, 1, 3, 3, 1]
C = [0, 4, 3]
P = [0, 1, 0, -1]
E1 = mul(power(H, 2), [1, -1, -2, 3])
E2 = mul(power(H, 2), [1, -2, -2, 4])
assert add(scale(B, 4), scale(power(A, 2), -1)) == C


def motzkin(r):
    """T_r = sum_j Catalan_j * binom(r,2j) * a^(r-2j) * b^j."""
    terms = []
    for j in range(r//2+1):
        cat = comb(2*j, j)//(j+1)
        terms.append(scale(mul(power(A, r-2*j), power(B, j)),
                           cat*comb(r, 2*j)))
    return add(*terms)


T = [motzkin(r) for r in range(15)]
for r in range(13):
    assert scale(T[r+2], r+4) == add(scale(mul(A, T[r+1]), 2*r+5),
                                    scale(mul(C, T[r]), r+1))


def kernel(r):
    return add(mul(power(H, 2), add(T[r], T[r+1])),
               scale(mul(P, add(T[r], scale(T[r+1], 2), T[r+2])), -1))


def certificate(name, f):
    """Certify V=(1+u)^2 f'/(1-2u-u^2) has nonnegative coefficients.

    After degree(N), V's coefficients satisfy v_j=2*v_(j-1)+v_(j-2).
    The complete finite prefix is saved, not just a hash or a numerical sample.
    """
    assert f[0] >= 0
    numerator = mul(power(H, 2), derivative(f))
    vals = []
    for j, x in enumerate(numerator):
        vals.append(x + (2*vals[-1] if j else 0) + (vals[-2] if j >= 2 else 0))
    assert all(x >= 0 for x in vals), (name, vals)
    # Explicit polynomial identity leaves only the positive Pell tail.
    lhs = mul([1, -2, -1], vals)
    expected = numerator + [-2*vals[-1]-vals[-2], -vals[-1]]
    assert lhs == expected
    return {"name": name, "polynomial_coefficients": f,
            "numerator_coefficients": numerator,
            "nonnegative_prefix": vals,
            "tail_recurrence": "v_j = 2*v_(j-1) + v_(j-2)",
            "tail_starts_at": len(vals)}


certs = [certificate(f"G_{r}", kernel(r)) for r in range(12)]
certs += [certificate("E1*T1", mul(E1, T[1])),
          certificate("E1*T2", mul(E1, T[2])),
          certificate("E2*T13", mul(E2, T[13])),
          certificate("E2*T14", mul(E2, T[14]))]

# The reduction identity is linear in T_r,T_(r+1); check both coefficients
# symbolically as polynomials in u, with r an arbitrary affine parameter.
# r+4 times G_r after replacing (r+4)T_(r+2) by its recurrence.
for r in [0, 1]:
    for tr, ts in [([1], [0]), ([0], [1])]:
        left = add(scale(mul(power(H, 2), add(tr, ts)), r+4),
                   scale(mul(P, add(scale(tr, r+4), scale(ts, 2*(r+4)),
                                         scale(mul(A, ts), 2*r+5),
                                         scale(mul(C, tr), r+1))), -1))
        right = add(scale(add(mul(E1, tr), mul(E2, ts)), r+4),
                    scale(mul(P, add(mul(C, tr), mul(A, ts))), 3))
        assert left == right
# Equality at r=0,1 proves this affine-in-r identity, not just two instances.


def schroder(nmax):
    r = [0, 1] + [0] * (nmax-1)
    for n in range(2, nmax+1):
        r[n] = r[n-1] + sum(r[j]*r[n-j] for j in range(1, n))
    for n in range(3, nmax+1):
        assert n*r[n] == (6*n-9)*r[n-1]-(n-3)*r[n-2]
    return r


def truncated(p, nmax):
    return (list(p) + [0]*(nmax+1))[:nmax+1]


def compose(p, q, nmax):
    result = [0]*(nmax+1)
    for x in reversed(p):
        result = truncated(mul(result, q), nmax)
        result[0] += x
    return result


N = 60
R = schroder(N)
F1 = mul([0, 1], add([1], R))
F2 = mul([0, 0, 1], power(add([1], R), 3))
F3 = mul([0, 0, 0, 1], mul(power(add([1], R), 4), add([1], scale(R, 2))))
Q = scale(add(R, [0, 1]), Fraction(1, 2))
I1I2 = truncated(add(F1, scale(mul(Q, F2), -1)), N)
F2F3 = truncated(add(F2, scale(F3, -1)), N)
F2F1 = truncated(add(F2, scale(F1, -1)), N)
assert all(x >= 0 for x in F2F3)
assert all(x >= 0 for x in I1I2)
assert all(x > 0 for x in F2F1[3:])


def low_identity_coefficients(which, m):
    if which == "rise":
        d = (m+2)*(m+3)
        return Fraction(m*(m+47), d), Fraction(-6*(m-3), d)
    if which == "first_decline":
        d = (m+2)*(m+3)*(m+4)*(m+5)
        a = 1282*m**4+4637*m**3+13106*m*m+11515*m+4740
        b = -(220*m**4+467*m**3+1232*m*m-779*m-420)
        return Fraction(a, d), Fraction(b, d)
    d = (m+2)*(m+3)
    return Fraction(16*m*m+11*m+21, d), Fraction(-3*(m*m+3), d)


# Symbolic verification in Z[m] of each low-record rational identity.
# A_j/D_j and B_j/D_j are the exact coefficients of r_(m+1),r_m
# in r_(m+j), obtained from the universal Schroder recurrence.
def symbolic_lag_identity(cs, expected_a, expected_b):
    jmax = len(cs)-1
    aa, bb = [[0], [1]], [[1], [0]]
    for j in range(2, jmax+1):
        first = [6*j-9, 6]
        second = [j-3, 1] if j == 2 else mul([j-3, 1], [j-1, 1])
        aa.append(add(mul(first, aa[-1]), scale(mul(second, aa[-2]), -1)))
        bb.append(add(mul(first, bb[-1]), scale(mul(second, bb[-2]), -1)))
    an, bn = [0], [0]
    for j, c in enumerate(cs):
        ratio = [1]
        for ell in range(max(j+1, 2), jmax+1):
            ratio = mul(ratio, [ell, 1])
        an = add(an, scale(mul(aa[j], ratio), c))
        bn = add(bn, scale(mul(bb[j], ratio), c))
    assert an == expected_a and bn == expected_b
    assert all(c >= 0 for c in an)
    assert all(c >= 0 for c in add(an, bn))


symbolic_lag_identity([1, -6, 7, -1], [0, 47, 1], [18, -6])
symbolic_lag_identity([-2, 23, -87, 122, -53, 7],
                      [4740, 11515, 13106, 4637, 1282],
                      [420, 779, -1232, -467, -220])
symbolic_lag_identity([-1, 5, -4, 1], [21, 11, 16], [-9, 0, -3])


for which, vals, shift in [("rise", F2F1, 4),
                            ("first_decline", F2F3, 7),
                            ("class_decline", I1I2, 4)]:
    for n in range(shift+1, N+1):
        m = n-shift
        a, b = low_identity_coefficients(which, m)
        assert vals[n] == a*R[m+1]+b*R[m]
        assert a > 0 and a+b > 0


def direct_sum(p, q):
    return p + tuple(x+len(p) for x in q)


def skew_sum(p, q):
    return tuple(x+len(q) for x in p) + q


def rmax(p):
    top = 0
    count = 0
    for x in reversed(p):
        if x > top:
            count += 1
            top = x
    return count


def reducible(p):
    top = 0
    for k, x in enumerate(p[:-1], 1):
        top = max(top, x)
        if top == k:
            return True
    return False


# Independent literal permutations, using the defining sum/skew construction.
sets = {1: {(1,)}}
rows = {}
for n in range(1, 9):
    if n > 1:
        sets[n] = set()
        for j in range(1, n):
            for p in sets[j]:
                for q in sets[n-j]:
                    sets[n].add(direct_sum(p, q))
                    sets[n].add(skew_sum(p, q))
    assert len(sets[n]) == R[n]
    f = Counter(rmax(p) for p in sets[n])
    jrow = Counter(rmax(p) for p in sets[n] if not reducible(p))
    drow = Counter(rmax(p) for p in sets[n] if reducible(p))
    assert f[1] == F1[n] and f[2] == F2[n] and f[3] == F3[n]
    assert all(jrow[k] >= jrow[k+1] for k in range(3, n+1))
    assert all(drow[k] >= drow[k+1] for k in range(1, n+1))
    if n >= 3:
        assert f[1] <= f[2] and all(f[k] >= f[k+1] for k in range(2, n+1))
    rows[n] = {"all": [f[k] for k in range(1, n+1)],
               "irreducible_rmax": [jrow[k] for k in range(1, n+1)],
               "reducible_rmax": [drow[k] for k in range(1, n+1)]}


out = {"method_attribution": "Prior trureturing RecordNewtonPositivity proof at bba1aad31d92f0ac31774c3a7e7c04a3db945c56",
       "certificates": certs,
       "small_difference_coefficients": {
           "F2-F1_n0_to_4": F2F1[:5],
           "F2-F3_n0_to_7": F2F3[:8],
           "I1-I2_n0_to_4": [int(x) for x in I1I2[:5]]},
       "literal_permutation_rows": rows}
target = Path(__file__).with_name("ckz_certificates.json")
target.write_text(json.dumps(out, indent=2)+"\n")
print("PASS: 16 exact positivity certificates; all-index induction identities; low-record identities; literal separable permutations through n=8")
print("Certificates:", target)
print("Low differences:", out["small_difference_coefficients"])
for c in certs:
    v = c["nonnegative_prefix"]
    print(c["name"], "degree", len(c["polynomial_coefficients"])-1,
          "min", min(v), "last two", v[-2:])
