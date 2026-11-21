"""Finite diagnostics of the exact modular matching reduction."""
from itertools import combinations, product
from math import factorial
from random import Random

from verify import permanent, tensor


def rook_counts(rows):
    n = len(rows)
    dp = [0] * (1 << n)
    dp[0] = 1
    for row in rows:
        new = dp.copy()
        for used, value in enumerate(dp):
            for j, edge in enumerate(row):
                if edge and not used & (1 << j):
                    new[used | (1 << j)] += value
        dp = new
    result = [0] * (n+1)
    for mask, value in enumerate(dp):
        result[mask.bit_count()] += value
    return result


def invertible_mod_two(rows):
    n = len(rows)
    for i in range(n):
        pivot = next((j for j in range(i,n) if rows[j] & (1 << i)), None)
        if pivot is None:
            return False
        rows[i], rows[pivot] = rows[pivot], rows[i]
        for j in range(i+1,n):
            if rows[j] & (1 << i):
                rows[j] ^= rows[i]
    return True


def check(a):
    n = len(a)
    m = (n+1).bit_length()-1
    b = [[(1-x)//2 for x in row] for row in a]
    r = rook_counts(b)
    gram = [[sum(x*y for x,y in zip(ri,rj)) % 2 for rj in b] for ri in b]
    for k in range(n+1):
        parity = 0
        for subset in combinations(range(n), k):
            rows = [sum(gram[i][j] << pos for pos,j in enumerate(subset)) for i in subset]
            parity ^= invertible_mod_two(rows)
        assert parity == r[k] % 2
    target, rem = divmod(permanent(a), 1 << (n-m))
    assert rem == 0
    for t in range(1,m+3):
        residue = 0
        for j in range(n+1):
            shift = m-j.bit_count()
            if shift < t:
                odd = factorial(j) >> (j-j.bit_count())
                count = r[n-j] % (1 << (t-shift))
                residue += (-1)**(n-j) * (1 << shift) * odd * count
        assert (residue-target) % (1 << t) == 0


if __name__ == '__main__':
    count = 0
    for n in (1,2,3):
        for entries in product((-1,1), repeat=n*n):
            check([entries[i:i+n] for i in range(0,n*n,n)])
            count += 1
    rng = Random(1119)
    for n in range(4,11):
        for _ in range(12):
            check([[rng.choice((-1,1)) for _ in range(n)] for _ in range(n)])
            count += 1
    h = [[1,1],[1,-1]]
    check(tensor(tensor(h,h),h))
    print(count+1, 'matrices passed rook parity and normalized residue comparisons')
