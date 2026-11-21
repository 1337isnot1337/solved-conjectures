"""Independent standard-library rational-polynomial check of FZZ certificate.

The sequence and the forward log-convexity operator are reconstructed from
arXiv:2505.05873v1. This does not import the proposed proof's verification code.
"""
from fractions import Fraction as F
from math import comb, prod


def add(a, b):
    return [sum((a[i] if i < len(a) else 0, b[i] if i < len(b) else 0))
            for i in range(max(len(a), len(b)))]


def mul(a, b):
    out = [F(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return out


def scale(a, c):
    return [c*x for x in a]


def power(a, n):
    out = [F(1)]
    for _ in range(n):
        out = mul(out, a)
    return out


def box_polynomial(k, l):
    out = [F(1)]
    for i in range(1, k+1):
        for j in range(1, l+1):
            out = mul(out, [F(1), F(1, i+j-1)])
    return out


def row_polynomial(n):
    out = [F(0)]
    for k in range(n):
        out = add(out, box_polynomial(k, n-1-k))
    return out


def L_polynomials(seq):
    return [add(mul(a, c), scale(mul(b, b), -1))
            for a, b, c in zip(seq, seq[1:], seq[2:])]


def at(poly, value):
    out = F(0)
    for c in reversed(poly):
        out = out*value+c
    return out


A = [72, 36, 26, 9, 1]
Q = [-2892672, -37081152, -88784352, -129902448,
     -154920392, -159475276, -138523978, -97778329,
     -53818158, -21758691, -5962420, -934842,
     -16148, 27742, 6462, 723, 42, 1]
certificate = [F(-1, 1547934105600)]
for p, e in [([0, 1], 4), ([-1, 1], 4), ([1, 1], 5),
             ([2, 1], 2), (A, 1), (Q, 1)]:
    certificate = mul(certificate, power(p, e))

values = [row_polynomial(n) for n in range(2, 9)]
for _ in range(3):
    values = L_polynomials(values)
assert len(values) == 1
assert all(c == 0 for c in add(values[0], scale(certificate, -1)))
assert all(c > 0 for c in Q[13:])
assert all(c < 0 for c in Q[:13])
assert at(Q, 6) == 264264378826752
print("Exact polynomial identity: PASS; degree", len(certificate)-1)
print("Q coefficient signs: PASS; Q(6) =", at(Q, 6))


def row_binomial(n, m):
    upper = n+m-2
    numerator = sum(prod(comb(upper, k+j) for j in range(m))
                    for k in range(n))
    denominator = prod(comb(upper, j) for j in range(1, m))
    result = F(numerator, denominator)
    assert result.denominator == 1
    return result.numerator


for m, expected in [
        (4, -111509459048444462640611465400686603136),
        (5, -44045680773437284570849713497906508911110782976)]:
    seq = [row_binomial(n, m) for n in range(2, 11)]
    print("m =", m, "source row sums:", seq)
    for depth in range(1, 5):
        seq = [a*c-b*b for a, b, c in zip(seq, seq[1:], seq[2:])]
        if depth == 3:
            print("Third iterate at indices 2,3,4:", seq)
    assert seq == [expected]
    print("Fourth iterate at index 2:", seq[0])
print("All exact checks passed.")
