"""Exact arithmetic checks for the rational-progression transfer."""
from fractions import Fraction
from math import gcd, isqrt, lcm, prod

from check_polynomial_height import mu, phi


def primes_below(t):
    return [p for p in range(2, t) if all(p % d for d in range(2, isqrt(p) + 1))]


def component(m, primes):
    rough = m
    for p in primes:
        while rough % p == 0:
            rough //= p
    return m // rough


def cap_power(p, t):
    power = p
    while power < t:
        power *= p
    return power


def floor_checks():
    count = 0
    t = 29
    for b in (1, 2, 4, 6, 11, 25):
        for a in (1, 37, 143, 2**18 + 1):
            if gcd(a, b) != 1:
                continue
            band = range(11, 35)
            for ell in range(1, 34):
                if gcd(ell, b) != 1:
                    continue
                total = 0
                for s in band:
                    if gcd(s, b) != 1:
                        continue
                    c = (a * pow(ell * s, -1, b)) % b if b > 1 else 0
                    divisor = ell * b * s
                    shift = c * ell * s
                    total += (a + b*t - shift) // divisor - (a - shift) // divisor
                direct = sum((a+b*i) % (ell*s) == 0 for i in range(1, t+1) for s in band)
                assert total == direct
                count += 1
    return count


def quadratic_checks():
    count = 0
    for z in (3, 7, 14, 19):
        full = sum(Fraction(mu(q)**2, phi(q)) for q in range(1, z+1))
        for b in (1, 2, 4, 6, 11, 25, 30, 210):
            indices = [d for d in range(1, z+1) if gcd(d, b) == 1]
            g = sum(Fraction(mu(q)**2, phi(q)) for q in indices)
            assert g >= Fraction(phi(b), b) * full
            weights = {
                d: sum(Fraction(d*mu(q//d)*mu(q), phi(q)) for q in indices if q % d == 0) / g
                for d in indices
            }
            assert weights[1] == 1
            assert sum(x*y/lcm(d, e) for d,x in weights.items() for e,y in weights.items()) == 1/g
            count += 1
    return count


def transfer_checks():
    sites = 0
    for t in (7, 12, 23, 38):
        primes = primes_below(t)
        for a, b in ((1, 2), (17, 6), (29, 12), (0, 1), (t**3 + 1, 1)):
            powers = {p: cap_power(p, t) for p in primes if b % p}
            modulus = prod(powers.values())
            root = a * pow(b, -1, modulus) % modulus
            for n in (root, root + modulus, root + modulus//2, 0, 1, 1234):
                missed = []
                for p, power in powers.items():
                    common = gcd(power, b*n-a)
                    if common < power:
                        missed.append(common*p)
                lost = 0
                for i in range(1, t+1):
                    ref = a + b*i
                    if all(ref % q for q in missed):
                        assert component(n+i, primes) >= min(t, component(ref, primes))
                    else:
                        lost += 1
                    sites += 1
                assert lost <= sum(Fraction(t, q) + 1 for q in missed)
    return sites


if __name__ == "__main__":
    print(f"{floor_checks()} progression counts, {quadratic_checks()} sieve forms, "
          f"and {transfer_checks()} transfer sites passed.")
