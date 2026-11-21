"""Construct simultaneous Fibonacci residues, then check each prime square directly."""
from math import gcd, isqrt, lcm
from random import Random


def fibonacci_pair(n, modulus):
    a, b = 0, 1
    for digit in bin(n)[2:]:
        c = a * (2*b - a) % modulus
        d = (a*a + b*b) % modulus
        a, b = (c, d) if digit == '0' else (d, (c+d) % modulus)
    return a, b


def fibonacci_pair_exact(n):
    a, b = 0, 1
    for _ in range(n):
        a, b = b, a + b
    return a, b


def check_two_residue_bound():
    f, g = fibonacci_pair_exact(144)
    assert gcd(f, g-1) == 498454011879264 < 9 * 10**14
    # Withhold small split primes from the lift to test the general collision
    # estimate. These primes are ordinary. They exercise the same quadratic map.
    for q in (11, 19, 29, 31, 41, 61, 71):
        root = next(a for a in range(q) if (a*a - a - 1) % q == 0)
        for h in (1, 3):
            t = next(i for i in range(1, q) if pow(root, h*i, q) == 1)
            counts = {}
            for u in range(lcm(2, t)):
                if u % 2 == 0:
                    continue
                f, _ = fibonacci_pair(h*u, q)
                counts.setdefault(f, set()).add(u % t)
            assert max(map(len, counts.values())) <= 2


def crt(current, modulus, value, factor):
    step = (value - current) * pow(modulus, -1, factor) % factor
    return current + modulus * step


def prime_powers(limit):
    primes = [p for p in range(2, limit+1) if all(p % d for d in range(2, isqrt(p)+1))]
    period = 600  # includes 8, 3 and 100
    for p in primes:
        if p >= 7:
            exponent = 2*(p*p - 1)
            assert fibonacci_pair(exponent, p) == (0, 1)
            assert fibonacci_pair(exponent, p*p) != (0, 1)
            period = lcm(period, p * exponent)
    factors = []
    for p in primes:
        power = 1
        while period % p == 0:
            power *= p
            period //= p
        factors.append((p, power))
    assert period == 1
    return factors


def index_for(n, factors):
    h = 3 if n % 2 else 1
    modulus = factors[0][1]
    u = 3 if h == 3 and n % 9 == 2 else 1
    for p, power in factors[1:]:
        for residue in range(1, p):
            trial = crt(u, modulus, residue, power)
            f, _ = fibonacci_pair(h*trial, p*p)
            if p == 5 and (n - f) % p == 0:
                # For p=5 the proof chooses a residue already safe modulo five.
                continue
            if (n - f) % (p*p):
                u = trial
                break
        else:
            raise AssertionError((n, p))
        modulus *= power
    assert gcd(u, modulus) == 1
    index = h*u
    assert (n - fibonacci_pair(index, 2)[0]) % 2 == 1
    assert all((n - fibonacci_pair(index, p*p)[0]) % (p*p) for p, _ in factors[1:])
    return index


if __name__ == '__main__':
    check_two_residue_bound()
    factors = prime_powers(97)
    rng = Random(304522)
    samples = [*range(1, 251), *(rng.getrandbits(250) for _ in range(100))]
    for n in samples:
        index_for(n, factors)
    print('All 350 constructed indices have the required parity and avoid every odd prime square through 97^2.')
