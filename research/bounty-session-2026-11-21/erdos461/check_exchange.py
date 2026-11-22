"""Finite checks of the signed-profile and block sieve identities."""
from itertools import product
from math import comb, gcd, prod


def model_counts(modulus, shift, primes):
    def component(n):
        value = 1
        residue = gcd(n, modulus)
        for p in primes:
            while residue % p == 0:
                residue //= p
                value *= p
        return value

    counts = {}
    for i in range(modulus):
        key = component(i), component(i+shift)
        counts[key] = counts.get(key, 0)+1
    return counts


def main():
    mod = 8*9*5*7
    for shift in (0, 1, 2, 6, 11, 105, 257):
        profile = model_counts(mod, shift, (2,3,5,7))
        assert all(profile.get((b,a)) == count for (a,b), count in profile.items())
        assert sum(count for (a,b),count in profile.items() if a >= b)*2 >= mod

    checks = 0
    levels = (2, 4, 6)
    for ns in product(range(9), repeat=len(levels)):
        upper = [sum((-1)**r * comb(n,r) for r in range(k+1)) for n,k in zip(ns,levels)]
        correction = sum(comb(n,k)*prod(upper[:j]+upper[j+1:])
                         for j,(n,k) in enumerate(zip(ns,levels)))
        exact = int(not any(ns))
        assert prod(upper)-correction <= exact <= prod(upper)
        checks += 1
    print(f'Swap symmetry for seven shifts modulo {mod}; {checks} block sieve inequalities.')
    # Distinct ranges in all windows of one small CRT period.
    t = 8
    large_primes = (5, 7)
    def sig(n):
        return gcd(n, 8*9*5*7)
    for n in range(mod):
        f = len({sig(n+i) for i in range(1,t+1)})
        large = [gcd(n+i,prod(large_primes)) for i in range(1,t+1)]
        assert sum(b > t for b in large) <= f
    print(f'Unique-large-component bound on all {mod} windows at t={t}.')


if __name__ == '__main__':
    main()
