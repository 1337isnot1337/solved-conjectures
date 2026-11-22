"""Rational certificates for the cyclic-window bounds. No large word is expanded."""
from fractions import Fraction
from math import prod


def fraction_left(primes):
    return prod(Fraction(p-1, p) for p in primes)


def multiply(left, right):
    coeff = [0]*(len(left)+len(right)-1)
    for i, a in enumerate(left):
        for j, b in enumerate(right):
            coeff[i+j] += a*b
    return coeff


def divide_exact(numerator, denominator):
    assert denominator[-1] == 1
    remainder = numerator.copy()
    quotient = [0]*(len(numerator)-len(denominator)+1)
    for i in reversed(range(len(quotient))):
        q = remainder[i+len(denominator)-1]
        quotient[i] = q
        for j, coefficient in enumerate(denominator):
            remainder[i+j] -= q*coefficient
    assert not any(remainder)
    return quotient


def main():
    primes = [p for p in range(3, 80, 2) if all(p%d for d in range(2, p))]
    residual = fraction_left(primes)
    assert residual < Fraction(1, 4)
    assert prod(primes) == 1608822383670336453949542277065
    print(f'Product through 79 = {residual} < 1/4.')

    n = 210
    divisors = [d for d in range(1, n+1) if n%d == 0]
    cyclotomics = {}
    for d in divisors:
        polynomial = [-1] + [0]*(d-1) + [1]
        for earlier in divisors:
            if earlier < d and d%earlier == 0:
                polynomial = divide_exact(polynomial, cyclotomics[earlier])
        cyclotomics[d] = polynomial
    exponents = [int(i%2 == 0)+int(i%105 == 0) for i in range(n)]
    for group, start, expected in [((3,), 0, 70), ((5,7), 105, 66)]:
        kernel = [1]
        for d in divisors:
            if any((n//p)%d == 0 for p in group):
                kernel = multiply(kernel, cyclotomics[d])
        assert len(kernel)-1 == expected == n*(1-fraction_left(group))
        assert sum(c*exponents[(start+i)%n] for i, c in enumerate(kernel)) != 0
        for p in group:
            length = n//p
            assert all(sum(kernel[r::length]) == 0 for r in range(length))
    assert exponents[-1] != exponents[104]
    assert n*(1-fraction_left((3,5,7))) + n//2 + 2 == 221
    print('210 runs: shortest two disjoint windows need 221 sites; nested tests pass.')


if __name__ == '__main__':
    main()
