"""Direct finite checks of identities in the positive-density minimum proof."""

from collections import Counter
from fractions import Fraction as F
from itertools import permutations
from math import factorial, prod


def verify_tables():
    checked = 0
    for n in range(2, 10):
        # Conjugacy of row and column labels lets a single permutation run
        # check all square and a sample of nonsquare cuts simultaneously.
        cuts = {(n // 2, n // 2), (max(1, n // 2-1), min(n-1, n // 2+1))}
        for r, c in sorted(cuts):
            counts = Counter(sum(j < c for j in perm[:r]) for perm in permutations(range(n)))
            for x in range(max(0, r+c-n), min(r,c)+1):
                cells = (x, r-x, c-x, n-r-c+x)
                numerator = prod(factorial(a) for a in (r, n-r, c, n-c))
                assert counts[x] == numerator // prod(factorial(b) for b in cells)
                checked += 1
    return checked


def dot(x, y):
    return sum(a*b for a, b in zip(x, y))


def verify_steps():
    checked = 0
    for n in range(2, 11):
        shifts = [[int((j-i) % n == s) for i in range(n) for j in range(n)] for s in range(n)]
        for k in range(1, n):
            # For a binary regular input, these calculations depend only on
            # edge inclusion and disjointness, both tested at every shift here.
            b = [F(sum(vals[:k]), k)-F(1,n) for vals in zip(*shifts)]
            bp = [F(sum(vals[:k+1]), k+1)-F(1,n) for vals in zip(*shifts)]
            v = F(n,k*(k+1)); alpha = F(n,(n-k)*(k+1))
            forward = [[(q-h-F(1,n))/(k+1) for h,q in zip(b,p)] for p in shifts[k:]]
            reverse = [[(h+F(1,n)-q)/k for h,q in zip(bp,p)] for p in shifts[:k+1]]
            for d in forward:
                assert dot(d,d) == v and dot(b,d) == -v
            for d in reverse:
                assert dot(d,d) == v and dot(bp,d) == 0
            assert [sum(c)/len(c) for c in zip(*forward)] == [-alpha*h for h in b]
            assert all(sum(c) == 0 for c in zip(*reverse))
            checked += len(forward)+len(reverse)
    return checked


def verify_saddle():
    # Check both sides of the modal index and the bound when the chosen
    # evaluation radius is capped, including degrees zero and n.
    checked = 0
    for n in range(2, 81):
        for rt_cap in [F(3,2), F(5,2), F(7)]:
            for k in range(1,n+1):
                rt = min(rt_cap,F(n,n-k)) if k<n else rt_cap
                terms = [F(1)]
                for j in range(n):
                    terms.append(terms[-1]*rt*(n-j)/n)
                if k<n and rt==F(n,n-k):
                    assert terms[k]==max(terms)
                else:
                    assert terms[k]>=terms[n]
                    for j in {0, n//2, k, n}:
                        assert terms[j]/terms[n]==(F(n)/rt)**(n-j)/factorial(n-j)
                checked += 1
    return checked


if __name__ == '__main__':
    print(f'{verify_tables()} block-table counts, {verify_steps()} matching steps, '
          f'and {verify_saddle()} normalized coefficient saddle checks passed')
