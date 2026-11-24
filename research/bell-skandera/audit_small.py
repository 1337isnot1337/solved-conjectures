"""Independent exact checks of Bell–Skandera partial theorem's small arithmetic."""
from fractions import Fraction
from itertools import combinations
from math import comb, isqrt


def check_rank_two():
    R = Fraction(7, 4)
    theta = Fraction(121, 100)
    assert theta**3 > R
    assert (4/theta + 10 + 6*theta) < 12*R
    assert 3*3**2/Fraction(4) + Fraction(3, 4) - Fraction(94, 25) > 0
    # (4 - sqrt(8/3)) > 9/4 follows by comparing (7/4)^2 with 8/3.
    assert Fraction(7,4)**2 > Fraction(8,3)
    for m in range(3, 8):
        a = (1 + isqrt(1 + 8*m)) // 2
        r = m - comb(a, 2)
        assert comb(a,3) + comb(r,2) >= isqrt(m**3 // 27)


def check_colex():
    total = 0
    for n in range(2, 10):
        for p in range(1, n):
            mask = lambda xs: sum(1 << k for k in xs)
            rank_p = sorted(map(mask, combinations(range(n),p)))
            rank_q = sorted(map(mask, combinations(range(n),p+1)))
            shadow = set()
            link = set()
            for A in rank_q:
                shadow |= {A ^ (1 << i) for i in range(n) if A >> i & 1}
                if A & 1:
                    link.add(A-1)
                for m in range(len(rank_p)+1):
                    ideal = set(rank_p[:m])
                    g = sum(not (B & 1) for B in ideal)
                    assert (len(link) <= g) == (shadow <= ideal)
                    total += 1
    return total


if __name__ == '__main__':
    check_rank_two()
    print('PASS: rank-two constants and',check_colex(),'colex shadow equivalence tests')
