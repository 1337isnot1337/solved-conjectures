"""Exact counts for the refined Cayley-box construction."""
from math import prod

def compositions(n, parts):
    if parts == 1:
        yield (n,)
        return
    for i in range(n + 1):
        for tail in compositions(n - i, parts - 1):
            yield (i, *tail)

def weight(b):
    return prod((b[0] + b[i] + 1) * (2 * b[i] + 1)**2
                for i in range(1, 6))

def counts(m):
    e = [sum(weight(b)**m for b in compositions(k, 6))
         for k in range(6)]
    return tuple(sum(e[:k + 1]) for k in (1, 3, 5))

assert max(map(weight, compositions(3, 6))) == 5832
assert 16**11 > 21**2 * 9**11
m = 11
a, b, c = counts(m)
assert a*c > b*b
print(f"m={m}, dimension={15*m+5}, counts={(a,b,c)}")
print(f"I1*I3-I2^2={a*c-b*b}")
