"""Compare the generating function with direct enumeration and Manyama's table."""
import argparse
from itertools import combinations
from math import exp, log, pi, sqrt, isqrt
from pathlib import Path


def counts(limit):
    # p[s] is the number of partitions of s using parts at most r.
    p = [1] + [0] * limit
    exact = [1] + [0] * limit
    for r in range(1, max(2, isqrt(limit)) + 1):
        for s in range(r, limit + 1):
            p[s] += p[s - r]
        if r == 1:
            terms = [(3, 1)]
        elif r == 2:
            terms = [(6, 1)]
        else:
            terms = [(r*r, 2**(r-3)), (r*r+r, 2**(r-3))]
        for shift, weight in terms:
            for s in range(limit + 1 - shift):
                exact[s + shift] += weight * p[s]
    for n in range(1, limit + 1):
        exact[n] += exact[n-1]
    return exact


def enumerate_costs(limit):
    histogram = [0] * (limit + 1)
    sizes = range(3, limit + 1)
    for length in range(len(sizes) + 1):
        for subset in combinations(sizes, length):
            cost = sum(max(0, size-i) for i, size in enumerate(reversed(subset)))
            if cost <= limit:
                histogram[cost] += 1
    for n in range(1, limit + 1):
        histogram[n] += histogram[n-1]
    return histogram


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--table', type=Path, help='OEIS b401948.txt')
    args = parser.parse_args()
    values = counts(10000)
    assert values[:21] == enumerate_costs(20)
    print('All subsets of sizes 3..20 enumerated. Counts agree for n = 1..20.')
    if args.table:
        pairs = [tuple(map(int, line.split())) for line in args.table.read_text().splitlines()
                 if line.strip() and not line.lstrip().startswith('#')]
        assert pairs == list(enumerate(values[1:], 1))
        print('All 10,000 index-value pairs agree with Manyama’s table.')
    A = pi*pi/12 + log(2)**2/2
    c = 3/(16*sqrt(6*pi)*A**0.25)
    for n in (100, 1000, 10000):
        ratio = exp(log(values[n]) + log(n)/4 - log(c) - 2*sqrt(A*n))
        print(f'n = {n:5}: exact count / leading asymptotic = {ratio:.9f}')


if __name__ == '__main__':
    main()
