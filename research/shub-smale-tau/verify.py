#!/usr/bin/env python3
"""Exact finite checks for the tau research notes; not a proof of tau."""

from fractions import Fraction
from itertools import combinations, product
from math import comb, factorial, gcd, prod


def trim(a):
    a = list(a)
    while len(a) > 1 and a[-1] == 0:
        a.pop()
    return a


def add(a, b):
    return trim([(a[i] if i < len(a) else 0) +
                 (b[i] if i < len(b) else 0)
                 for i in range(max(len(a), len(b)))])


def scale(a, c):
    return trim([x * c for x in a])


def mul(a, b):
    out = [0] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            out[i + j] += x * y
    return trim(out)


def peval(a, x):
    value = 0
    for c in reversed(a):
        value = value * x + c
    return value


def derivative(a):
    return trim([i * a[i] for i in range(1, len(a))] or [0])


def translate(a, c):
    out = [0] * len(a)
    for i, value in enumerate(a):
        for j in range(i + 1):
            out[j] += value * comb(i, j) * c ** (i - j)
    return trim(out)


def root_product(roots):
    out = [1]
    for r in roots:
        out = mul(out, [-r, 1])
    return out


def interpolate(points):
    out = [Fraction(0)]
    for t, y in points:
        basis, denom = [Fraction(1)], 1
        for u, _ in points:
            if u != t:
                basis = mul(basis, [-u, 1])
                denom *= t - u
        out = add(out, scale(basis, Fraction(y, denom)))
    return out


def clear_denominators(a):
    den = 1
    for x in a:
        q = Fraction(x).denominator
        den = den * q // gcd(den, q)
    return [int(x * den) for x in a], den


def determinant(a):
    """Bareiss elimination, retaining exact integer divisions."""
    a = [list(row) for row in a]
    n = len(a)
    if n == 0:
        return 1
    previous, sign = 1, 1
    for k in range(n - 1):
        if a[k][k] == 0:
            j = next((j for j in range(k + 1, n) if a[j][k]), None)
            if j is None:
                return 0
            a[k], a[j] = a[j], a[k]
            sign = -sign
        pivot = a[k][k]
        for i in range(k + 1, n):
            for j in range(k + 1, n):
                num = pivot * a[i][j] - a[i][k] * a[k][j]
                assert num % previous == 0
                a[i][j] = num // previous
            a[i][k] = 0
        previous = pivot
    return sign * a[-1][-1]


def sums_for(positions):
    return sorted(sum(bit << i for bit, i in zip(bits, positions))
                  for bits in product((0, 1), repeat=len(positions)))


def factor_integer(n):
    n = abs(n)
    assert n > 0
    out, p = {}, 2
    while p * p <= n:
        while n % p == 0:
            out[p] = out.get(p, 0) + 1
            n //= p
        p += 1
    if n > 1:
        out[n] = out.get(n, 0) + 1
    return out


def valuation(n, p):
    assert n != 0
    count = 0
    while n % p == 0:
        count += 1
        n //= p
    return count


def test_carries_and_products():
    cases = 0
    for q in (2, 3, 4, 7):
        for a, b, c in product(range(q), range(-3, 4), range(-12, 13)):
            v, u = divmod(c, q)
            carry, ap = divmod(a + u, q)
            assert a + q * b + c == ap + q * (b + v + carry)
            cases += 1
        precision = 5
        modulus = q ** precision
        for u, v in product(range(-13, 14), repeat=2):
            ad = [(u % modulus // q ** i) % q for i in range(precision)]
            bd = [(v % modulus // q ** i) % q for i in range(precision)]
            for operation in ('+', '-', '*'):
                carry, digits = 0, []
                for k in range(precision):
                    if operation == '+':
                        z = ad[k] + bd[k] + carry
                    elif operation == '-':
                        z = ad[k] - bd[k] + carry
                    else:
                        z = carry + sum(ad[i] * bd[k - i] for i in range(k + 1))
                    carry, digit = divmod(z, q)
                    digits.append(digit)
                output = sum(d * q ** i for i, d in enumerate(digits))
                expected = {'+': u + v, '-': u - v, '*': u * v}[operation]
                assert output == expected % modulus
                cases += 1
    for n in range(5):
        f = root_product(range(1, 2 ** n + 1))
        assert mul(f, translate(f, -(2 ** n))) == root_product(range(1, 2 ** (n + 1) + 1))
        cases += 1
    print(f'carry, signed gate-digit and consecutive-product checks: {cases}')


def test_all_cuts():
    count = 0
    for n in range(2, 8):
        for mask in range(1, 1 << n):
            if not mask & 1 or mask == (1 << n) - 1:
                continue
            left = [i for i in range(n) if mask >> i & 1]
            right = [i for i in range(n) if not mask >> i & 1]
            aa, bb = sums_for(left), [1 + b for b in sums_for(right)]
            r = min(len(aa), len(bb))
            det = determinant([[(a + b) ** (2 ** n) for b in bb[:r]] for a in aa[:r]])
            assert det * (-1) ** (r * (r - 1) // 2) > 0
            count += 1
    for degree in range(5):
        aa, bb = [0, 1, 4, 8], [1, 3, 7, 10]
        for r in range(1, min(4, degree + 1) + 1):
            for rows, cols in product(combinations(aa, r), combinations(bb, r)):
                det = determinant([[(a + b) ** degree for b in cols] for a in rows])
                assert det * (-1) ** (r * (r - 1) // 2) > 0
    print(f'all nontrivial unordered digit cuts, n=2..7: {count}; minor signs checked')


def test_cofactor_and_jet_masking():
    for roots in ([1], [1, 2], [1, 2, 3, 4], [-3, 0, 2, 7]):
        f = root_product(roots)
        samples = [20, 21, 23, 28]
        q = interpolate([(t, Fraction(1, peval(f, t))) for t in samples])
        qz, den = clear_denominators(q)
        h = mul(f, qz)
        assert all(peval(h, t) == den for t in samples)
        assert all(peval(h, r) == 0 for r in roots)
        fp = derivative(f)
        q = interpolate([(r, Fraction(1, peval(fp, r))) for r in roots])
        qz, den = clear_denominators(q)
        h = mul(f, qz)
        assert len(h) - 1 <= 2 * len(roots) - 1
        assert all(peval(h, r) == 0 and peval(derivative(h), r) == den for r in roots)
        fourth_power = mul(mul(f, f), mul(f, f))
        for order in range(4):
            assert all(peval(fourth_power, r) == 0 for r in roots)
            fourth_power = derivative(fourth_power)
    print('off-root interpolation, identical first jets and bounded-jet masking: passed')


def test_integrality_and_prime_collisions():
    root_sets = [[], [0], [-4, -1, 0, 2, 7], [1, 2, 3, 4, 5], [7, 13, 19, 25]]
    for roots in root_sets:
        f = mul(root_product(roots), [0, 0, 1, -2, 1])
        first = next(c for c in f if c)
        required = prod(r for r in roots if r)
        assert first % required == 0
        delta = prod(abs(a - b) for a, b in combinations(roots, 2))
        fac = factor_integer(delta)
        for p, v in fac.items():
            collision_sum = sum(sum((a - b) % (p ** k) == 0 for a, b in combinations(roots, 2))
                                for k in range(1, v + 1))
            assert collision_sum == v
        assert prod(p ** v for p, v in fac.items()) == delta
        for p in (2, 3, 5, 7):
            counts = [sum(r % p == a for r in roots) for a in range(p)]
            collisions = sum(c * (c - 1) // 2 for c in counts)
            assert sum(c * c for c in counts) == len(roots) + 2 * collisions
            occupied = sum(c > 0 for c in counts)
            assert len(roots) ** 2 <= occupied * (len(roots) + 2 * collisions)
    for p in (2, 3, 5):
        points = [1 + p ** j for j in range(1, 11)]
        assert {valuation(x, p) for x in points} == {0}
        assert {valuation(x - 1, p) for x in points} == set(range(1, 11))
    print('first coefficient divisibility, prime-power collisions and cancellation: passed')


def test_modular_average():
    primes = [2, 3, 5, 7, 11]
    for k in range(1, 6):
        m = prod(primes[:k])
        units = [a for a in range(m) if gcd(a, m) == 1]
        assert sum(gcd(m, a - 1) for a in units) == len(units) * 2 ** k
        for q in (13, 17, 19, 23, 29, 31):
            assert sum(pow(x, m, q) == 1 for x in range(q)) == gcd(m, q - 1)
    print('squarefree modular averages and finite-field root counts: passed')


def test_p_adic_example():
    for p in (2, 3, 5):
        h, power = [0, 1, -1], p
        for n in range(1, 4):
            degree = 2 ** n
            d = (3 ** (n - 1) - 1) // 2
            assert len(h) - 1 == degree and h[-1] in (-1, 1)
            assert all(peval(h, x) < 0 for x in range(-8, 9) if x not in (0, 1))
            assert peval(h, 0) == peval(h, 1) == 0
            residues, modulus = [0], 1
            for _ in range(2 * d + 2):
                next_modulus = modulus * p
                residues = [r + digit * modulus for r in residues for digit in range(p)
                            if peval(h, r + digit * modulus) % next_modulus == 0]
                modulus = next_modulus
            assert len(residues) == degree * p ** d
            assert all(valuation(peval(derivative(h), r), p) == d for r in residues)
            h = mul(h, add([power], scale(h, -1)))
            power = power ** 3
    print('Koiran-Portier-Rojas example through n=3, p=2,3,5: finite Hensel checks passed')


def main():
    test_carries_and_products()
    test_all_cuts()
    test_cofactor_and_jet_masking()
    test_integrality_and_prime_collisions()
    test_modular_average()
    test_p_adic_example()
    print('All finite exact checks passed. No tau bound or BSS separation was verified.')


if __name__ == '__main__':
    main()
