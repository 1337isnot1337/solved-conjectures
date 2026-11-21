"""Build the prime-square progression for all even Fibonacci shifts F_(3j), j <= 256."""
from math import isqrt
from verify import crt, fibonacci_pair

# Each row is (ell, prime of rank 2*ell, prime of rank 4*ell, prime of rank 12*ell).
ROWS = ((5, 11, 41, 2521), (7, 29, 281, 83),
        (11, 199, 43, 261399601), (13, 521, 90481, 12280217041))


def check_rank(p, rank):
    assert p > 1 and all(p % d for d in range(2, isqrt(p)+1))
    assert fibonacci_pair(rank, p)[0] == 0
    assert all(fibonacci_pair(i, p)[0] != 0 for i in range(1, rank))


def main():
    residue, modulus = 9, 18
    primes = [3]
    for ell, a, b, c in ROWS:
        for prime, rank, index, sign in ((a, 2*ell, 3*ell, 1),
                                        (b, 4*ell, 6*ell, 1), (c, 12*ell, 6*ell, -1)):
            check_rank(prime, rank)
            square = prime*prime
            value = sign * fibonacci_pair(index, square)[0]
            residue = crt(residue, modulus, value, square)
            modulus *= square
            primes.append(prime)
    remaining = []
    for j in range(257):
        if any((residue - fibonacci_pair(3*j, p*p)[0]) % (p*p) == 0 for p in primes):
            continue
        remaining.append(j)
        assert j % 4 != 0 and all(j % row[0] for row in ROWS)
        w = j
        for p in (2, 3):
            while w % p == 0:
                w //= p
        assert w == 1 or (w > 16 and all(w % d for d in range(2, isqrt(w)+1)))
    print(f'{len(remaining)} of 257 parity-eligible indices survive the designated prime squares.')
    print(f'n = {residue} modulo {modulus}')


if __name__ == '__main__':
    main()
