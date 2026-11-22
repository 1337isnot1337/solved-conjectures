"""Exact checks of the finite identities in the polynomial-height proof."""
from fractions import Fraction
from math import factorial, gcd, isqrt, lcm, prod


def mu(n):
    parity = 1
    for p in range(2,isqrt(n)+1):
        if n%p == 0:
            n //= p
            parity *= -1
            if n%p == 0:
                return 0
    return parity if n == 1 else -parity


def phi(n):
    return sum(gcd(k,n) == 1 for k in range(1,n+1))


def weights(z):
    g = sum(Fraction(mu(q)**2,phi(q)) for q in range(1,z+1))
    w = {d: sum(Fraction(d*mu(q//d)*mu(q),phi(q))/g
                for q in range(d,z+1,d)) for d in range(1,z+1)}
    assert w[1] == 1 and all(abs(x) <= d for d,x in w.items())
    assert sum(x*y/lcm(d,e) for d,x in w.items() for e,y in w.items()) == 1/g
    return w


def main():
    for z in range(2,15):
        weights(z)
    t, n = 31, 31**3+49
    band = range(16,33)
    w = weights(8)
    pairs = [(s,r) for s in band for r in range(n//s+1,(n+t)//s+1)]
    for ell in range(1,65):
        by_floors = sum((n+t)//(s*ell)-n//(s*ell) for s in band)
        assert by_floors == sum(r%ell == 0 for _,r in pairs)
    expanded = sum(x*y*sum((n+t)//(s*lcm(d,e))-n//(s*lcm(d,e)) for s in band)
                   for d,x in w.items() for e,y in w.items())
    majorant = sum(sum(x for d,x in w.items() if r%d == 0)**2 for _,r in pairs)
    assert expanded == majorant >= sum(gcd(r,210)==1 for _,r in pairs)

    for t in range(2,32):
        primes = [p for p in range(2,t) if all(p%d for d in range(2,isqrt(p)+1))]
        for n in (0,t,2*t,t*t+3,t**4+1):
            parts = []
            for m in range(n+1,n+t+1):
                rough = m
                for p in primes:
                    while rough % p == 0:
                        rough //= p
                parts.append(m//rough)
            assert prod(parts) % factorial(t-1) == 0
            assert len([s for s in parts if s>t]) == len({s for s in parts if s>t})
    print('13 rational sieve quadratic forms, 64 floor counts, and 150 factorial divisibilities passed.')


if __name__ == '__main__':
    main()
