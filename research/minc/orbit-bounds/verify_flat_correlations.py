"""Certify the scalar Chollet inequality on continuous intervals with outward bounds."""
from decimal import Decimal, ROUND_FLOOR, ROUND_CEILING, localcontext
from fractions import Fraction as F
from functools import lru_cache
from math import factorial


def log_bound(x, upper):
    with localcontext() as ctx:
        ctx.prec = 45
        ctx.rounding = ROUND_CEILING if upper else ROUND_FLOOR
        v = Decimal(x.numerator) / Decimal(x.denominator)
        # Decimal.ln is correctly rounded to nearest irrespective of the rounding mode.
        value = v.ln()
        return F(value.next_plus() if upper else value.next_minus())


@lru_cache(maxsize=1024)
def product_permanent(n, T):
    w = T / (n-1)
    a, d = w.numerator, w.denominator
    diagonal = d-a
    power = total = 1
    for j in range(1, n+1):
        power *= diagonal
        total = j*a*total + power
    return F(total, d**n)


def cover(n):
    stack = [(F(4,5), F(n-1))]
    leaves = 0
    while stack:
        lo, hi = stack.pop()
        q = 1+lo
        upper = product_permanent(n, hi)
        if upper < q*q:
            leaves += 1
            continue
        entropy = (1+1/q)*log_bound(1+q, False) - 1 - F(289,500)
        if log_bound(upper, True) < 2*n*entropy:
            leaves += 1
            continue
        mid = (lo+hi)/2
        assert hi-lo > F(1,2**45), (n, lo, hi)
        stack.extend([(lo,mid), (mid,hi)])
    return leaves


if __name__ == '__main__':
    harmonic = sum((F(1,j) for j in range(1,1025)), F(0))
    assert harmonic - 10*log_bound(F(2), False) < F(289,500)
    assert log_bound(F(14,5), False) > F(1029,1000)
    assert log_bound(F(8*201), True) < 8
    assert sum((F(2,3)**(2*j+1))/(2*j+1) for j in range(4)) > F(4,5)
    for n in range(2,14):
        for w in (F(0), F(1,7), F(3,5), F(1)):
            direct = sum(F(factorial(n),factorial(n-j))*w**j*(1-w)**(n-j)
                         for j in range(n+1))
            assert product_permanent(n,(n-1)*w) == direct
    count = sum(cover(n) for n in range(2,200))
    print(f'{count} certified closed intervals in orders 2 through 199, and 48 exact polynomial replays')
