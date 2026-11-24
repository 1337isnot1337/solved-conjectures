#!/usr/bin/env python3
"""Independent integer replay for sample leaves and their exact type."""

from math import isqrt


def example(n, extra=0):
    s = 1 + isqrt(n - 1)
    low = set(range(s)) | set(range(s, n, s))
    additions = sorted(set(range(n)) - low)[:extra]
    assert len(additions) == extra
    low.update(additions)
    a = low | set(range(n, 2 * n - 1))
    m = 2 * n
    f = 2 * m - 1
    def member(x):
        return x == 0 or x > f or x - m in a
    gaps = {x for x in range(1, f + 1) if not member(x)}
    assert all(not member(x) or not member(y)
               for z in gaps for x in range(1, z) for y in (z - x,))
    effective = [x for x in range(f + 1, f + m + 1)
                 if not any(member(y) and member(x - y)
                            for y in range(1, x // 2 + 1))]
    assert not effective
    # Above F + 1, adding a positive gap reaches the conductor; to test PF
    # it is enough to add the positive elements no larger than F.
    left = {x for x in range(1, f + 1) if member(x)}
    pf = {x for x in gaps if all(member(x + y) for y in left)}
    assert len(gaps) == 3 * n - len(low)
    assert len(pf) == 2 * n - 2 * len(low) + 1
    return len(gaps), len(pf)


def proposed_bound(g):
    q, r = divmod(g, 4)
    return 2 * q + (-1, -1, 0, 1)[r]


if __name__ == "__main__":
    assert example(25) == (66, 33)
    for s in range(5, 11):
        g, t = example(s * s)
        assert t > proposed_bound(g)
        print(f"s={s}: genus {g}, type {t}, conjectured upper bound {proposed_bound(g)}")
    for n in range(9, 41):
        for extra in range(3):
            example(n, extra)
