"""Compare literal representation counts with the sponsor's downloaded b-file."""
from math import isqrt
from pathlib import Path
import sys


def prime(n):
    return n >= 2 and all(n % d for d in range(2, isqrt(n) + 1))


def squarefree(n):
    return all(n % (d * d) for d in range(2, isqrt(n) + 1))


def verify(path):
    expected = dict(tuple(map(int, line.split())) for line in path.read_text().splitlines()
                    if line.strip() and not line.lstrip().startswith('#'))
    assert set(expected) == set(range(1, 10001))
    primes = [p for p in range(3, 10001, 2) if prime(p)]
    counts = [0] * 10001
    for parity in (0, 1):
        two = 1
        while two < 10000:
            five = 1
            while (shift := two + (1 + parity) * five) < 10000:
                if shift % 2 != parity and squarefree(shift):
                    for p in primes:
                        if p + shift > 10000:
                            break
                        counts[p + shift] += 1
                five *= 5
            two *= 2
    assert all(counts[n] == count for n, count in expected.items())
    print('All 10,000 published representation counts agree.')


if __name__ == '__main__':
    verify(Path(sys.argv[1]))
