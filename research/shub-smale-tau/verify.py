#!/usr/bin/env python3
"""Exact finite checks for the tau research notes; not a proof of tau."""

from fractions import Fraction
from itertools import combinations, product
from math import comb, factorial, gcd, prod
from pathlib import Path
import json


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


def polynomial_gcd(a, b):
    a, b = list(map(Fraction, a)), list(map(Fraction, b))
    while b != [0]:
        rem = list(a)
        while rem != [0] and len(rem) >= len(b):
            shift, c = len(rem) - len(b), rem[-1] / b[-1]
            rem = add(rem, [0] * shift + scale(b, -c))
        a, b = b, rem
    return scale(a, Fraction(1, a[-1]))


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
            d = 2 ** n - 1
            coefficient_b = [b - 1 for b in bb[:r]]
            coefficients = [[comb(d, a + b) for b in coefficient_b] for a in aa[:r]]
            assert determinant(coefficients) * (-1) ** (r * (r - 1) // 2) > 0
            coefficients[0][0] -= 1
            assert determinant(coefficients) * (-1) ** (r * (r - 1) // 2) > 0
            squarefree_values = [[(a + b + 1) ** d - 1 for b in bb[:r]] for a in aa[:r]]
            assert determinant(squarefree_values) * (-1) ** (r * (r - 1) // 2) > 0
            count += 1
    for degree in range(5):
        aa, bb = [0, 1, 4, 8], [1, 3, 7, 10]
        for r in range(1, min(4, degree + 1) + 1):
            for rows, cols in product(combinations(aa, r), combinations(bb, r)):
                det = determinant([[(a + b) ** degree for b in cols] for a in rows])
                assert det * (-1) ** (r * (r - 1) // 2) > 0
    print(f'all nontrivial unordered digit cuts, n=2..7: {count}; power, binomial and squarefree ranks checked')


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


def test_explicit_squarefree_jet_polynomial():
    for n in range(1, 9):
        h = [0]
        for j in range(1, n + 1):
            other = root_product(k for k in range(1, n + 1) if k != j)
            h = add(h, scale(mul([-j, 1], mul(other, other)), comb(n - 1, j - 1) ** 2))
        assert len(h) - 1 == 2 * n - 1 and h[-1] > 0
        assert all(peval(h, j) == 0 for j in range(1, n + 1))
        assert all(peval(derivative(h), j) == factorial(n - 1) ** 2 for j in range(1, n + 1))
        assert polynomial_gcd(h, derivative(h)) == [1]
        content = gcd(*h)
        primitive = [c // content for c in h]
        assert gcd(*primitive) == 1
        assert all(peval(derivative(primitive), j) == factorial(n - 1) ** 2 // content
                   for j in range(1, n + 1))
    print('explicit primitive squarefree equal-jet polynomial, N=1..8: passed')


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


def test_prime_support_certificates():
    data = json.loads(Path(__file__).with_name('prime_support_examples.json').read_text())
    counts = []
    for example in data['examples']:
        k, m = example['k'], example['M']
        mf = factor_integer(m)
        assert len(mf) == k and all(exponent == 1 for exponent in mf.values())
        target = 2 ** m - 1
        assert int(example['value']) == target
        factors = example['factorization']
        assert len({p for p, _ in factors}) == len(factors)
        assert all(factor_integer(p) == {p: 1} and e >= 1 for p, e in factors)
        assert prod(p ** e for p, e in factors) == target
        divisors = [d for d in range(1, m + 1) if m % d == 0]
        phi = {}
        for d in divisors:
            denom = prod(value for e, value in phi.items() if d % e == 0)
            assert (2 ** d - 1) % denom == 0
            phi[d] = (2 ** d - 1) // denom
        listed = example['cyclotomic_values']
        assert [item['index'] for item in listed] == divisors[1:]
        for item in listed:
            d, value, factors_d = item['index'], int(item['value']), item['factorization']
            assert value == phi[d] > 1
            assert all(factor_integer(p) == {p: 1} and e >= 1 for p, e in factors_d)
            assert prod(p ** e for p, e in factors_d) == value
        incidence = {str(p): [d for d in divisors[1:] if phi[d] % p == 0] for p, _ in factors}
        assert incidence == example['prime_cyclotomic_incidence']
        assert all(1 <= len(indices) <= 2 for indices in incidence.values())
        assert len(factors) >= 2 ** (k - 1)
        counts.append(len(factors))
    print(f'cyclotomic support certificates for M=2,6,30,210: prime counts {counts}')



def test_continued_counterexamples():
    # Exact lower Newton hull of (1+x)^16-1.
    points = [(i, valuation(comb(16, i), 2)) for i in range(1, 17)]
    hull = []
    for point in points:
        while len(hull) >= 2:
            a, b = hull[-2:]
            cross = ((b[0]-a[0])*(point[1]-b[1]) -
                     (b[1]-a[1])*(point[0]-b[0]))
            if cross > 0:
                break
            hull.pop()
        hull.append(point)
    assert hull == [(1, 4), (2, 3), (4, 2), (8, 1), (16, 0)]
    # Simple Q_2 root and parallel active supports in the source counterexample.
    x, y = -2, -1
    assert y-1-x == y*y-1 == 0
    assert -2*y == 2
    first = [((0, 1), valuation(y, 2)), ((0, 0), 0),
             ((1, 0), valuation(x, 2))]
    second = [((0, 2), valuation(y*y, 2)), ((0, 0), 0)]
    face1 = [e for e, v in first if v == min(w for _, w in first)]
    face2 = [e for e, v in second if v == min(w for _, w in second)]
    u = tuple(face1[1][i]-face1[0][i] for i in range(2))
    v = tuple(face2[1][i]-face2[0][i] for i in range(2))
    assert u[0]*v[1]-u[1]*v[0] == 0
    assert 100**20 < 2**11 * 69**20
    print('shifted-cyclotomic Newton hull and degenerate mixed-volume counterexample: passed')


def test_strict_cut_positivity():
    count = 0
    for n in range(2, 5):
        size = 2**n
        k = 2**(4*size*size)
        coefficients = [k**(size-1-i) for i in range(size)]
        assert peval(coefficients, -k) == 0
        assert polynomial_gcd(coefficients, derivative(coefficients)) == [1]
        for mask in range(1, 2**n-1):
            if not (mask & 1):
                continue
            rows = sums_for([i for i in range(n) if mask >> i & 1])
            cols = sums_for([i for i in range(n) if not (mask >> i & 1)])
            table = [[peval(coefficients, 1+a+b) for b in cols] for a in rows]
            for r in range(1, min(len(rows), len(cols))+1):
                for ii in combinations(range(len(rows)), r):
                    for jj in combinations(range(len(cols)), r):
                        assert determinant([[table[i][j] for j in jj] for i in ii]) > 0
                        count += 1
    print(f'geometric-sum strict positivity, every cut minor for n=2..4: {count} passed')


def test_divided_difference_with_cofactors():
    # Independently expanded identities, including repeated roots and a cofactor.
    for n in range(1, 9):
        f = root_product(range(1, n+1))
        h = mul(mul(f, f), [1, 0, 1])
        for j in range(1, n+1):
            quotient = [0] * (len(h)-1)
            carry = h[-1]
            quotient[-1] = carry
            for i in range(len(h)-2, 0, -1):
                carry = h[i] + j*carry
                quotient[i-1] = carry
            assert h[0] + j*carry == 0
            assert mul([-j, 1], quotient) == h
        for y, z in product(range(-3, 4), repeat=2):
            d = sum(c * sum(y**(i-1-k)*z**k for k in range(i))
                    for i, c in enumerate(h) if i)
            assert (y-z)*d == peval(h, y)-peval(h, z)
            if y == z:
                assert d == peval(derivative(h), y)
    print('divided differences with repeated prescribed roots and cofactor examples: passed')


def test_normalization_and_fold_identities():
    root_sets = [[], [Fraction(0)], [Fraction(1, 2)],
                 [Fraction(-2, 3), Fraction(1, 2), Fraction(1, 2)],
                 [Fraction(-3), Fraction(0), Fraction(2, 5), Fraction(7, 3)]]
    for roots in root_sets:
        f = [1]
        for r in roots:
            f = mul(f, [-r.numerator, r.denominator])
        for sign in (1, -1):
            h = scale(mul(f, [1, 0, 1]), sign)
            t = sum(abs(a) for a in h)
            c = peval(h, t)
            assert c != 0
            shifted = translate(h, t)
            affine = [a * c**i for i, a in enumerate(shifted)]
            assert all(a % c == 0 for a in affine)
            k = [a // c for a in affine]
            assert k[0] == 1
            # Padding models nonminimal denominator exponents in gate clearing.
            p = [0, 0] + list(reversed(k))
            assert p[-1] == 1
            for r in set(roots):
                z = Fraction(c, 1) / (r-t)
                assert z.denominator == 1 and z != 0
                assert peval(p, z) == 0
    u = scale(mul([-4, 1], [-5, 1]), Fraction(1, 2))
    v = scale(mul(add(u, [-3]), add(u, [-6])), Fraction(1, 2))
    w = scale(mul(add(v, [-5]), add(v, [-9])), Fraction(1, 45))
    lhs = scale(mul(w, add(w, [-1])), 8294400)
    rhs = root_product(range(10))
    for c in (2, 4, 22):
        rhs = mul(rhs, [c, -9, 1])
    assert lhs == rhs
    from fold_witnesses import check_all
    summaries = check_all()
    assert [(r['N'], r['gates']) for r in summaries] == [(8, 54), (16, 101), (32, 304)]
    print('rational/monic identities, ten-root fold identity and three charged fold certificates: passed')


def test_finite_prime_inverse_minors():
    checked = 0
    for n in (2, 3):
        N = 2**n
        k = N*n+1
        h = [1]
        for _ in range(k):
            h = mul(h, [0, -1, 0, 1])  # ((y^3-y)^k); primes 2 and 3.
        numerators = {}
        for j in range(1, N+1):
            assert all(peval(h, j) == 0 or valuation(peval(h, j), p) >= k
                       for p in (2, 3))
            carry = h[-1]
            q = [0]*(len(h)-1)
            q[-1] = carry
            for i in range(len(h)-2, 0, -1):
                carry = h[i]+j*carry
                q[i-1] = carry
            assert add(mul([-j, 1], q), [peval(h, j)]) == h
            numerators[j] = q
        for mask in range(1, 2**n-1):
            if not mask & 1:
                continue
            left = sums_for([i for i in range(n) if mask >> i & 1])
            right = sums_for([i for i in range(n) if not mask >> i & 1])
            for a0, a1 in combinations(left, 2):
                for b0, b1 in combinations(right, 2):
                    det = add(mul(numerators[1+a0+b0], numerators[1+a1+b1]),
                              scale(mul(numerators[1+a0+b1], numerators[1+a1+b0]), -1))
                    for p in (2, 3):
                        gauss = min(valuation(c, p) for c in det if c)
                        expected = valuation((a1-a0)*(b1-b0), p)
                        assert gauss == expected < k
                    checked += 1
    print(f'finite-prime inverse imitation, all two-by-two cut minors at n=2,3: {checked} passed')


def test_anchored_differences_and_exact_quotients():
    def matrix_product(a, b):
        size = len(a)
        return [[sum_polynomials(mul(a[i][k], b[k][j]) for k in range(size))
                 for j in range(size)] for i in range(size)]

    def sum_polynomials(items):
        out = [0]
        for item in items:
            out = add(out, item)
        return out

    def quotient_entry(polynomial, nodes):
        q = len(nodes)
        size = q + 1
        matrix = [[[0] for _ in range(size)] for _ in range(size)]
        for i, node in enumerate(nodes):
            matrix[i][i] = [node]
            matrix[i + 1][i] = [1]
        matrix[q][q] = [0, 1]
        value = [[[0] for _ in range(size)] for _ in range(size)]
        for coefficient in reversed(polynomial):
            value = matrix_product(value, matrix)
            for i in range(size):
                value[i][i] = add(value[i][i], [coefficient])
        return value[q][0]

    cases = 0
    for N in range(1, 6):
        f = root_product(range(1, N + 1))
        for q in range(6):
            cofactor = [(-1)**i * (i + 1) for i in range(q + 1)]
            h = mul(f, cofactor)
            divided = list(cofactor)
            for _ in range(q):
                divided = add(translate(divided, 1), scale(divided, -1))
            assert divided == [factorial(q) * cofactor[-1]]
            cleared = [0]
            for j in range(q + 1):
                prefix = root_product(N - i for i in range(j))
                suffix = root_product(-i for i in range(j, q))
                term = mul(mul(prefix, suffix), translate(h, j))
                cleared = add(cleared, scale(term, (-1)**(q-j) * comb(q, j)))
            expected = scale(f, factorial(q) * cofactor[-1])
            denominator = root_product(-i for i in range(q))
            assert cleared == mul(denominator, expected)
            assert quotient_entry(cleared, [-i for i in range(q)]) == expected
            cases += 1
    # Repeated nodes test the quotient-module proof without a distinct-node assumption.
    for nodes in ([2, 2, 2, 2], [0, 0, -1, -1, 3]):
        quotient = [3, -2, 0, 5, 0, 0, 1]
        assert quotient_entry(mul(root_product(nodes), quotient), nodes) == quotient
        cases += 1
    print(f'anchored differences and symbolic quotient matrices: {cases} cases passed')


def test_deformed_boolean_inverse():
    cases = 0
    R = 4
    for n in range(1, 6):
        weights = [2**i for i in range(n)]
        old = {(0, 0): {0: 1}}
        for i, weight in enumerate(weights):
            new = {}
            for q in range(R + 1):
                for k in range(i + 2):
                    coefficients = dict(old.get((q, k), {}))
                    for r in range(q + 1):
                        multiplier = comb(q + k, r + 1) * weight**(r + 1)
                        for mask, value in old.get((q-r, k-1), {}).items():
                            target = mask | (1 << i)
                            coefficients[target] = coefficients.get(target, 0) + multiplier * value
                    new[q, k] = {mask: value for mask, value in coefficients.items() if value}
            old = new
        subset_sums = [sum(weights[i] for i in range(n) if mask >> i & 1)
                       for mask in range(1 << n)]
        coefficients = {}
        z = 17
        for q in range(R + 1):
            for mask in range(1 << n):
                k = mask.bit_count()
                expected = 0
                submask = mask
                while True:
                    expected += (-1)**(k-submask.bit_count()) * subset_sums[submask]**(q+k)
                    if submask == 0:
                        break
                    submask = (submask - 1) & mask
                actual = old[q, k].get(mask, 0)
                assert actual == expected
                coefficients[q, mask] = Fraction(actual, z**(q+k+1))
                cases += 1
        # Independently check the defining inverse equation in the deformed algebra.
        for q in range(R + 1):
            for mask in range(1 << n):
                value = z * coefficients[q, mask]
                if q:
                    value -= subset_sums[mask] * coefficients[q-1, mask]
                for i, weight in enumerate(weights):
                    if mask >> i & 1:
                        value -= weight * coefficients[q, mask ^ (1 << i)]
                assert value == int(q == 0 and mask == 0)
    print(f'deformed Boolean inverse: {cases} integer coefficient and inverse-equation checks passed')


def test_frobenius_and_harmonic_examples():
    for M in range(1, 101):
        units = [a for a in range(1, M + 1) if gcd(a, M) == 1]
        average = sum((Fraction(1, gcd(M, a-1)) for a in units), Fraction(0)) / len(units)
        assert average >= Fraction(1, 4 * (len(factor_integer(M)) + 1))

    def h(a):
        return (a*a - 13) * (a*a - 17) * (a*a - 221)

    roots = {a for a in range(61) if h(a) % 61 == 0}
    image = {h(a) % 61 for a in range(61)}
    assert roots == {14, 47}
    assert image == {0, 3, 4, 5, 11, 12, 16, 17, 20, 23, 30, 31,
                     33, 36, 41, 45, 46, 48, 49, 50, 52, 53, 54, 56}
    assert roots.isdisjoint(image)
    assert all(h(h(a)) % 61 for a in range(61))

    u = Fraction(8)
    for t in range(9):
        K = 2**t
        expected = Fraction(2 * 7**K - 6**K, 7**K - 6**K)
        assert u == expected
        error = u - 2
        assert error != 0
        assert valuation(error.numerator, 3) - valuation(error.denominator, 3) == K
        assert u.denominator == 7**K - 6**K
        u -= (u-1) * (u-2) / (2*u-3)
        repeated_error = Fraction(6, 2**t)
        assert valuation(repeated_error.numerator, 3) - valuation(repeated_error.denominator, 3) == 1
    print('harmonic CRT inequality, failed intersective iterate and never-exact Frobenius Newton lift: passed')


def test_dense_square_chain_threshold():
    f = [0, 1]
    for constant in (45, 656, 640**2):
        f = add(mul(f, f), [-constant])
    expected = [1]
    for square in (9, 81, 49, 41):
        expected = mul(expected, [-square, 0, 1])
    assert f == expected
    roots = {-9, -7, -3, 3, 7, 9}
    assert all(peval(f, root) == 0 for root in roots)
    assert 6**2 < 41 < 7**2
    assert 4 * len(roots) == 3 * (len(f)-1)
    assert valuation(45, 3) == 2 and valuation(656, 3) == 0
    print('six-root square-chain identity and strict three-quarters threshold: passed')


def polynomial_power(a, n):
    out = [1]
    while n:
        if n & 1:
            out = mul(out, a)
        a = mul(a, a)
        n //= 2
    return out


def geometric_sum(a, b, n):
    if n == 1:
        return [1]
    r = n // 2
    even = mul(add(polynomial_power(a, r), polynomial_power(b, r)),
               geometric_sum(a, b, r))
    return add(mul(a, even), polynomial_power(b, 2*r)) if n & 1 else even


def lift_power_bezout(u, v, c, m):
    L = 1 << (m - 1).bit_length()
    g = geometric_sum([c], v, m)
    C = [c**m]
    E = add(C, scale(polynomial_power(v, m), -1))
    U = mul(polynomial_power(u, L-m), polynomial_power(g, L))
    V = geometric_sum(C, E, L)
    assert add(mul(polynomial_power(u, m), U),
               mul(polynomial_power(v, m), V)) == [c**(m*L)]
    return U, V, m*L


def charged_bezout_certificate(R, S):
    d = len(R) - 1
    assert d == len(S) - 1 and d >= 1
    ell = 2*d
    matrix = [[0] * ell for _ in range(ell)]
    for j in range(d):
        for i, value in enumerate(R):
            matrix[i+j][j] = value
        for i, value in enumerate(S):
            matrix[i+j][j+d] = value

    def matrix_product(a, b):
        return [[sum(a[i][k] * b[k][j] for k in range(ell))
                 for j in range(ell)] for i in range(ell)]

    powers = [[[int(i == j) for j in range(ell)] for i in range(ell)]]
    for _ in range(ell):
        powers.append(matrix_product(powers[-1], matrix))
    traces = [sum(power[i][i] for i in range(ell)) for power in powers]
    b = [1]
    for k in range(1, ell+1):
        b.append(-sum(prod(range(k-i+1, k)) * b[k-i] * traces[i]
                      for i in range(1, k+1)))
    C = [prod(range(j+1, ell+1)) * b[j] for j in range(ell+1)]
    w = [-sum(C[j] * powers[ell-1-j][i][0] for j in range(ell))
         for i in range(ell)]
    assert [sum(matrix[i][j] * w[j] for j in range(ell))
            for i in range(ell)] == [C[-1]] + [0] * (ell-1)
    assert C[-1] == factorial(ell) * determinant(matrix) != 0
    A, B = trim(w[:d]), trim(w[d:])
    assert add(mul(A, R), mul(B, S)) == [C[-1]]
    return A, B, C[-1]


def test_powered_cofactor_extraction():
    lifted = 0
    for c in (-3, 1, 5):
        for m in (1, 2, 3, 4, 5, 7):
            lift_power_bezout([0, 1], [c, -1], c, m)
            lifted += 1
    cases = [
        (3, [([-2, 1], 3)], Fraction(1)),
        (3, [([0, -1, 1], 2)], Fraction(1)),
        (4, [([-1, 1], 2), ([-2, 1], 3)], Fraction(1)),
        (3, [([1, -2, 1], 2), ([-1, 1], 1)], Fraction(1)),
        (2, [([1, 0, 1], 2)], Fraction(1)),
        (3, [([-2, 2], 3)], Fraction(1, 8)),
    ]
    for N, bases, scalar in cases:
        R, Q, supplement = [1], [1], [1]
        m = max(exponent for _, exponent in bases)
        for base, exponent in bases:
            R = mul(R, base)
            Q = mul(Q, polynomial_power(base, exponent))
            supplement = mul(supplement, polynomial_power(base, m-exponent))
        h = next(h for h in range(1, (len(R)-1)**2 + 2)
                 if polynomial_gcd(R, translate(R, h)) == [1])
        shifted = translate(R, h)
        A, B, c = charged_bezout_certificate(R, shifted)
        U0, V0, exponent = lift_power_bezout(mul(A, R), mul(B, shifted), c, m)
        U = mul(polynomial_power(A, m), U0)
        V = mul(polynomial_power(B, m), V0)
        FN = root_product(range(1, N+1))
        H = scale(mul(FN, Q), scalar)
        assert all(Fraction(a).denominator == 1 for a in H)
        transported = scale(mul(FN, translate(Q, h)), scalar)
        D = root_product(-i for i in range(h))
        E = root_product(N-i for i in range(h))
        assert mul(D, transported) == mul(E, translate(H, h))
        extracted = add(mul(mul(U, supplement), H),
                        mul(mul(V, translate(supplement, h)), transported))
        assert extracted == scale(FN, scalar * c**exponent)
        assert all(Fraction(a).denominator == 1 for a in extracted)
    print(f'powered Bezout lifting: {lifted} cases; full powered-cofactor extraction: {len(cases)} cases passed')


def test_unknown_cofactor_recovery():
    from cofactor_recovery_checks import run_checks
    run_checks()



def test_integral_gate_budgets():
    unit = [1, -3, 1]
    assert add(mul(unit, unit), [-1]) == root_product(range(4))
    assert [peval(unit, r) for r in range(4)] == [1, -1, -1, 1]

    def resultant(a, b):
        m, n = len(a)-1, len(b)-1
        size = m+n
        matrix = [[0] * size for _ in range(size)]
        for j in range(n):
            for i, coefficient in enumerate(a):
                matrix[i+j][j] = coefficient
        for j in range(m):
            for i, coefficient in enumerate(b):
                matrix[i+j][j+n] = coefficient
        return determinant(matrix)

    roots = [-3, 0, 2]
    for cofactor in ([1], [1, 0, 1]):
        P = mul(root_product(roots), cofactor)
        U = [3] + [0] * (len(P)-1) + [2]
        V = add(U, scale(P, -1))
        assert len(V) == len(U) > len(P)
        B = abs(resultant(U, V))
        values = prod(abs(peval(U, r)) for r in roots)
        assert B != 0 and B % values == 0
        assert B == 2 * abs(resultant(U, P))
        W = [3]
        assert abs(resultant(W, add(W, scale(P, -1)))) == 3**(len(P)-1)

    for n in (1, 2, 4, 6, 12, 30):
        primes = [p for p in range(2, n+2) if len(factor_integer(p)) == 1
                  and factor_integer(p).get(p) == 1 and n % (p-1) == 0]
        fixed = prod(primes)
        sample_gcd = 0
        for a in range(n+3):
            sample_gcd = gcd(sample_gcd, abs(a**(n+1)-a))
        assert sample_gcd == fixed
        for p in primes:
            assert valuation(p**(n+1)-p, p) == 1
    print('integer unit threshold, resultant degree correction, and fixed-divisor examples: passed')


def main():
    test_carries_and_products()
    test_all_cuts()
    test_cofactor_and_jet_masking()
    test_explicit_squarefree_jet_polynomial()
    test_integrality_and_prime_collisions()
    test_modular_average()
    test_p_adic_example()
    test_prime_support_certificates()
    test_continued_counterexamples()
    test_strict_cut_positivity()
    test_divided_difference_with_cofactors()
    test_normalization_and_fold_identities()
    test_finite_prime_inverse_minors()
    test_anchored_differences_and_exact_quotients()
    test_deformed_boolean_inverse()
    test_frobenius_and_harmonic_examples()
    test_dense_square_chain_threshold()
    test_powered_cofactor_extraction()
    test_unknown_cofactor_recovery()
    test_integral_gate_budgets()
    print('All finite exact checks passed. No tau bound or BSS separation was verified.')


if __name__ == '__main__':
    main()
