"""Exact rational inertia checks of the clique-chain lemma and sharp family."""
from fractions import Fraction


def compositions(n):
    if n == 0:
        yield ()
    else:
        for a in range(1, n+1):
            for tail in compositions(n-a):
                yield (a, *tail)


def inertia_nonnegative(diagonal):
    a = diagonal[:]
    total = 0
    i = 0
    while i < len(a):
        if a[i] != 0:
            total += a[i] > 0
            if i + 1 < len(a):
                a[i+1] -= 1 / a[i]
            i += 1
        elif i + 1 < len(a):
            # The block [[0,1],[1,a[i+1]]] has one eigenvalue of each
            # sign. Its inverse is [[-a[i+1],1],[1,0]], so its Schur
            # correction to the next diagonal is exactly zero.
            total += 1
            i += 2
        else:
            total += 1
            i += 1
    return total


def counts(a):
    padded = (0, *a, 0)
    q = [Fraction(padded[i] + padded[i+2] - 4, layer)
         for i, layer in enumerate(a)]
    nonnegative = inertia_nonnegative(q)
    internal = sum(layer - 1 for i, layer in enumerate(a)
                   if padded[i] + layer + padded[i+2] >= 4)
    return nonnegative, nonnegative + internal


number = 0
for n in range(1, 16):
    for a in compositions(n):
        t = n - len(a)
        quotient, combined = counts(a)
        assert quotient <= t and combined <= 2*t, (a, quotient, combined)
        number += 1
assert number == 32767
for t in range(1, 41):
    a = tuple(2 if 3 <= i <= 4*t-1 and i % 4 == 3 else 1
              for i in range(1, 4*t+2))
    assert counts(a) == (t, 2*t), (t, counts(a))
print("PASS: 32,767 complete composition checks and 40 sharp-family checks")
