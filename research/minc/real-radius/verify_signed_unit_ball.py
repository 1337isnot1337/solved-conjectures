"""Exact identity and derivative checks for the signed unit-ball proof."""
from fractions import Fraction as Q
from itertools import permutations
from math import comb, factorial, isqrt
from random import Random


def value_slope(power, base, velocity):
    slope = power * velocity * base ** (power - 1) if power else 0
    return base**power, slope


def multiply(factors):
    value, slope = 1, 0
    for factor, derivative in factors:
        value, slope = value * factor, slope * factor + value * derivative
    return value, slope


def four_cells(n, a, b, x):
    h = n - a - b
    value = slope = 0
    for j in range(a + 1):
        multiplicity = comb(b, j) * comb(n - b, a - j)
        term = multiply([value_slope(j, x, 1), value_slope(a-j, a-x, -1),
                         value_slope(b-j, b-x, -1), value_slope(h+j, h+x, 1)])
        value += multiplicity * term[0]
        slope += multiplicity * term[1]
    return value, slope


def check_cell_tables():
    count = signed = crossings = 0
    for n in range(2, 17):
        for a in range(1, n//2 + 1):
            for b in range(a, n//2 + 1):
                h = n-a-b
                center = Q(a*b, n)
                scale = a*(n-a)*b*(n-b)
                # Include both cell-zero crossings, when inside the ball.
                offsets = {Q(-a*b), Q(a*n-a*b)}
                offsets.update(Q(j * isqrt(scale), 8) for j in range(-8, 9))
                for offset in offsets:
                    if offset**2 >= scale or not offset:
                        continue
                    x = center + offset/n
                    value, slope = four_cells(n, a, b, x)
                    assert value > 0 and slope*offset > 0
                    count += 1
                    signed += x < 0 or x > a
                    if x == 0 or x == a:
                        crossings += 1
                        expected = -Q(1, h+1) if x == 0 else Q(1, b-a+1)
                        assert slope/value == expected
                        continue
                    z = x*(h+x)/((a-x)*(b-x))
                    coeff = [comb(b,j)*comb(n-b,a-j) for j in range(a+1)]
                    terms = [v*z**j for j, v in enumerate(coeff)]
                    mean = sum(j*v for j, v in enumerate(terms))/sum(terms)
                    variance = sum((j-mean)**2*v for j, v in enumerate(terms))/sum(terms)
                    dlog = (mean-x)*(1/x+1/(a-x)+1/(b-x)+1/(h+x))
                    assert dlog == slope/value
                    assert (1-z)*(mean**2+variance)+(h+(a+b)*z)*mean-a*b*z == 0
    return count, signed, crossings


def check_permutations():
    rng = Random(431)
    count = signed = 0
    for n in range(3, 7):
        for _ in range(15):
            u, v = [], []
            for vec in (u,v):
                vec.extend(rng.randrange(-3,4) for _ in range(n-1))
                vec.append(-sum(vec))
            norm_squared = sum(z*z for z in u)*sum(z*z for z in v)
            if not norm_squared:
                continue
            for sign in (-1,1):
                r = Q(sign, isqrt(norm_squared)+1)
                value = slope = 0
                for perm in permutations(range(n)):
                    factors = [(1+n*r*u[i]*v[j], n*r*u[i]*v[j])
                               for i, j in enumerate(perm)]
                    term, derivative = multiply(factors)
                    value += term
                    slope += derivative
                assert value > factorial(n) and slope > 0
                count += 1
                signed += any(1+n*r*s*t < 0 for s in u for t in v)
    return count, signed


if __name__ == "__main__":
    print("cell tables, signed, zero crossings:", check_cell_tables())
    print("direct permutation derivatives, signed:", check_permutations())
