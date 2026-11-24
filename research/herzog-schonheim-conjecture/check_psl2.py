"""Exact finite arithmetic in the PSL(2,q) quotient-lifting theorem.

Requires Python 3 and sympy. Run: python check_psl2.py
No group-library enumeration or floating-point arithmetic is used.
"""
from fractions import Fraction
from math import gcd
from sympy import divisors, factorint, primerange

LIMIT = 2**16


def upper_bound(p, a):
    q = p**a
    d = gcd(2, q-1)
    n = q*(q*q-1)//d
    # A superset of Dickson's maximal subgroup orders.
    candidates = {q*(q-1)//d, 2*(q-1)//d, 2*(q+1)//d, 12, 24, 60}
    for r in factorint(a):
        v = p**(a//r)
        candidates.add(v*(v*v-1)//gcd(2, v-1))
    if a % 2 == 0:
        v = p**(a//2)
        candidates.add(v*(v*v-1))
    sizes = set()
    for m in candidates:
        if m < n and n % m == 0:
            sizes.update(divisors(m))
    if q == 9:
        # Only the A5 maximal-subgroup candidate can contribute
        # orders 15, 20, 30. A5 is simple and has no subgroup of
        # index 4, 3, or 2 (coset action would inject into S4/S3/S2).
        sizes.difference_update({15,20,30})
    # C(t)=sigma(t)/t is nondecreasing under divisibility.
    t = d*a
    return Fraction(sum(sizes), n)*Fraction(sum(divisors(t)), t)


def main():
    rows = []
    for p in primerange(2, LIMIT):
        a = 1
        while p**a < LIMIT:
            q = p**a
            if q >= 4:
                rows.append((q, upper_bound(p, a)))
            a += 1
    failures = sorted((q, v) for q, v in rows if v >= 1)
    assert len(rows) == 6632
    assert failures == [(4, Fraction(43,40)), (5, Fraction(43,40))]
    # These correspond to A5, whose extensions in the theorem
    # have order <=120 and are covered by Margolis--Schnabel.
    peak = max((v,q) for q,v in rows if q not in (4,5))
    assert peak == (Fraction(77,80),9)
    print("Prime powers:", len(rows))
    print("Small-group exceptions:", failures)
    print("Maximum remaining upper bound and q:", peak)
    print("PASS")


if __name__ == "__main__":
    main()
