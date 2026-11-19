"""Arithmetic inputs to the order-479 obstruction at Hadamard order 2396."""
from math import isqrt


def prime(n):
    return n >= 2 and all(n % d for d in range(2,isqrt(n)+1))


def norms(m):
    hits = []
    for b in range(isqrt(4*m//479)+1):
        a2 = 4*m - 479*b*b
        a = isqrt(a2)
        if a*a == a2 and (a-b)%2 == 0:
            hits.append((a,b))
    return hits


p,q = 599,479
assert all(prime(x) for x in (p,q,239))
assert 2396 == 4*p == 5*q+1
assert p%q != 1 and pow(p,239,q) == 1
assert isqrt(4*p**3//q) == 1339
assert norms(p) == [] and norms(p**3) == []
a,b = 8054400,159859
assert a*a + q*b*b == p**5 and a%p and b%p
assert all(239*(2*x-3)%5 for x in range(4))
print("Order 479 excluded: multiplicative order 239, no norm 599 or 599^3, and prime-ideal class order five verified arithmetically.")
