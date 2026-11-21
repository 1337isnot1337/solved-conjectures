"""Exact Jerrum-family transfer and actual Lih--Wang chord evaluations.

The default is a bounded counterexample-discovery run, not a finite-case
verification claim. Polynomials are lists of exact integer coefficients.
No exponential permanent routine is used for the large graph.
"""

from fractions import Fraction
from math import comb, factorial, gcd
import argparse
import json


def add(*polys):
    result = [0] * max((len(p) for p in polys), default=1)
    for p in polys:
        for i, x in enumerate(p):
            result[i] += x
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    return result


def mul(a, b):
    result = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                if y:
                    result[i+j] += x*y
    while len(result) > 1 and result[-1] == 0:
        result.pop()
    return result


def scale(a, c):
    return [c*x for x in a]


def shift(a, c=1):
    return [0] + scale(a, c)


def power(a, exponent):
    result = [1]
    while exponent:
        if exponent & 1:
            result = mul(result, a)
        exponent >>= 1
        if exponent:
            a = mul(a, a)
    return result


def matrix_mul(a, b):
    return [[add(*(mul(a[i][h], b[h][j]) for h in range(2)))
             for j in range(2)] for i in range(2)]


def matrix_power(a, exponent):
    result = [[[1], [0]], [[0], [1]]]
    while exponent:
        if exponent & 1:
            result = matrix_mul(result, a)
        exponent >>= 1
        if exponent:
            a = matrix_mul(a, a)
    return result


def block_rooks(r, marked, interior):
    """Missing marked edge; all other special edges have weight marked."""
    h = r-1
    r11 = [comb(h, j)**2 * factorial(j) * interior**j for j in range(h+1)]
    one = [0] + [h * marked * comb(h, j) * comb(h-1, j)
                 * factorial(j) * interior**j for j in range(h)]
    both = [0, 0] + [h*h * marked*marked * comb(h-1, j)**2
                      * factorial(j) * interior**j for j in range(h)]
    r10 = add(r11, one)
    r00 = add(r11, scale(one, 2), both)
    return [[r00, r10], [r10, r11]]


def graph_rooks(r, branches, length):
    """Return weighted rook coefficients and the common line sum.

    There are branches parallel chains, each of length blocks, each block
    having r left and r right vertices. Flow through each branch is
    1/branches after division by the returned line sum.
    """
    assert r >= 2 and branches >= 2 and length >= 1
    h = r-1
    edge = h*h
    marked = (branches-1)*h
    interior = branches*(h-1)+1
    common = gcd(gcd(edge, marked), interior)
    edge //= common
    marked //= common
    interior //= common
    line_sum = branches*h*h // common
    assert h*marked+edge == marked+h*interior == line_sum
    assert branches*edge == line_sum

    rr = block_rooks(r, marked, interior)
    transfer = [[rr[0][0], shift(rr[0][1], edge)],
                [rr[1][0], shift(rr[1][1], edge)]]
    tt = matrix_power(transfer, length)
    bb = [[tt[0][0], tt[0][1]],
          [shift(tt[1][0], edge), shift(tt[1][1], edge)]]
    assert bb[0][1] == bb[1][0]
    base = power(bb[0][0], branches-2)
    result = mul(base, add(
        mul(bb[0][0], bb[0][0]),
        scale(mul(add(bb[1][0], bb[0][1], bb[1][1]), bb[0][0]), branches),
        scale(mul(bb[1][0], bb[0][1]), branches*(branches-1)),
    ))
    n = branches*r*length+1
    assert len(result) == n+1
    assert result[0] == 1
    assert result[1] == n*line_sum
    blocked = h*h * marked*marked * factorial(h-1) * interior**(h-1)
    transmitting = factorial(h) * interior**h
    expected_top = branches*edge * (edge*transmitting)**length \
        * blocked**((branches-1)*length)
    assert result[-1] == expected_top
    cofactor = blocked**(branches*length)
    if branches == r:
        assert line_sum == r
        assert result[-1] == r*factorial(r-1)**(r*length) \
            * (r-1)**((r-1)*length)
        assert cofactor == ((r-1)*factorial(r-1))**(r*length)
    return result, line_sum, cofactor


def normalized_mixture(rooks, line_sum, t):
    """per((1-t)U+t H/L)/per(U), evaluated as one exact rational."""
    t = Fraction(t)
    assert 0 <= t <= 1
    n = len(rooks)-1
    a, b = t.numerator, t.denominator
    fact = [factorial(j) for j in range(n+1)]
    left = [1]
    right = [1]
    for j in range(n):
        left.append(left[-1] * a*n)
        right.append(right[-1] * (b-a)*line_sum)
    numerator = sum(rooks[j] * fact[n-j] * left[j] * right[n-j]
                    for j in range(n+1))
    denominator = (b*line_sum)**n * fact[n]
    return Fraction(numerator, denominator)


def inspect_case(r, branches, length, flat_parameters, t_parameters):
    rooks, line_sum, cofactor = graph_rooks(r, branches, length)
    n = len(rooks)-1
    cache = {Fraction(0): Fraction(1)}
    def value(t):
        if t not in cache:
            cache[t] = normalized_mixture(rooks, line_sum, t)
        return cache[t]
    best = None
    witness = None
    for s in flat_parameters:
        endpoint = value(s)-1
        assert endpoint > 0
        for t in t_parameters:
            ratio = (value(s*t)-1)/(t*endpoint)
            if best is None or ratio > best[0]:
                best = (ratio, s, t)
            if ratio > 1:
                witness = {
                    "s": str(s), "t": str(t),
                    "gap_numerator": str((value(s*t)-1-t*endpoint).numerator),
                    "gap_denominator": str((value(s*t)-1-t*endpoint).denominator),
                }
                break
        if witness:
            break
    return {
        "r": r, "branches": branches, "length": length,
        "n": n, "line_sum": line_sum,
        "top_coefficient_verified": True,
        "distinguished_cofactor_verified": True,
        "largest_discovery_ratio": float(best[0]),
        "s_at_largest_ratio": str(best[1]), "t_at_largest_ratio": str(best[2]),
        "counterexample": witness,
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--r", type=int, default=3)
    parser.add_argument("--branches", type=int)
    parser.add_argument("--lengths", default="1,2,4,8,16")
    parser.add_argument("--flat", default="1,9/10,3/4,1/2")
    parser.add_argument("--t", default="1/2,2/5,1/3,1/4,1/10")
    args = parser.parse_args()
    branches = args.branches if args.branches is not None else args.r
    flat = list(map(Fraction, args.flat.split(",")))
    ts = list(map(Fraction, args.t.split(",")))
    assert all(0 < s <= 1 for s in flat)
    assert all(0 < t <= Fraction(1, 2) for t in ts)
    for length in map(int, args.lengths.split(",")):
        result = inspect_case(args.r, branches, length, flat, ts)
        print(json.dumps(result), flush=True)
        if result["counterexample"]:
            break


if __name__ == "__main__":
    main()
