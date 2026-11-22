"""Check the reflected divisibilities and conditional moment estimate."""
from collections import Counter
from fractions import Fraction
from itertools import product
from math import prod


def imbalance_law(p, n, r, s):
    weights = Counter()
    for i in range(p):
        value = (int((n+i)%p == 0) + int((n+r+s-i)%p == 0)
                 - int((i-r)%p == 0) - int((i-s)%p == 0))
        if value:
            weights[value] += 1
    assert sum(x*count for x, count in weights.items()) == 0
    return weights


def main():
    primes = (3, 5, 7)
    configurations = 0
    for n,r,s in product(range(9), repeat=3):
        laws = [imbalance_law(p,n,r,s) for p in primes]
        for mask in range(1 << len(laws)):
            active = [list(law.items()) for j,law in enumerate(laws) if mask & (1 << j)]
            if any(not rows for rows in active):
                continue
            outcomes = Counter()
            for atoms in product(*active):
                # Unrelated integer weights also satisfy the moment inequality.
                total = sum((j+2)*x for j,(x,_) in enumerate(atoms))
                outcomes[total] += prod(count for _,count in atoms)
            size = sum(outcomes.values())
            second = Fraction(sum(x*x*c for x,c in outcomes.items()),size)
            fourth = Fraction(sum(x**4*c for x,c in outcomes.items()),size)
            assert fourth <= 4*second**2
            assert 16*sum(c for x,c in outcomes.items() if x>=0) >= size
            configurations += 1

    checked = 0
    for p in (3,5,7,11):
        for r,s,i in product(range(p), repeat=3):
            for center in {r,s}:
                n = (-center)%p
                left = int((n+i)%p==0) + int((n+r+s-i)%p==0)
                right = int((i-r)%p==0) + int((i-s)%p==0)
                assert left == right
                checked += 1
    print(f'{configurations} conditional distributions; {checked} reflected prime incidences.')


if __name__ == '__main__':
    main()
