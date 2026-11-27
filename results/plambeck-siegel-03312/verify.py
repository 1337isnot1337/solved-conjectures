#!/usr/bin/env python3
"""Exact finite transfer certificate; the all-size lifting is in PROOF.md."""
from functools import cache
from itertools import product

THRESHOLD = (19, 15, 8)
PERIOD = (6, 3, 3)
MOVE_RADIUS = 4


def moves(heaps):
    for i, n in enumerate(heaps):
        successors = ([0] if 1 <= n <= 3 else []) + [
            n - d for d in (1, 2, 4) if n > d
        ]
        for m in successors:
            yield tuple(sorted(heaps[:i] + (m,) + heaps[i + 1:]))


@cache
def direct(heaps):
    """Return True for P. No formula reductions in this minimax."""
    return heaps[-1] > 0 and not any(direct(opt) for opt in moves(heaps))


def to_gaps(heaps):
    a, b, c = heaps
    return a, b - a, c - b


def from_gaps(gaps):
    a, d, e = gaps
    return a, a + d, a + d + e


def normalize(gaps):
    return tuple(
        g if g < b else b + (g - b) % t
        for g, b, t in zip(gaps, THRESHOLD, PERIOD)
    )


def predicted(heaps):
    return direct(from_gaps(normalize(to_gaps(heaps))))


def main():
    transfer = 0
    for gaps in product(*(range(b + MOVE_RADIUS + t)
                          for b, t in zip(THRESHOLD, PERIOD))):
        heaps = from_gaps(gaps)
        rhs = heaps[-1] > 0 and not any(predicted(opt) for opt in moves(heaps))
        assert predicted(heaps) == rhs, (gaps, heaps)
        transfer += 1
    assert transfer == 9570

    for h in range(19, 25):
        assert predicted((h, h, h)) == (h % 3 != 0)
        assert predicted((h, h, h + 4)) == (h % 3 == 0)
    assert not predicted((21, 21, 22))
    assert predicted((21, 21, 28))  # Upper gap 7 is below the reduction threshold.
    assert predicted((21, 21, 31))  # Upper gap 10 represents every 1 mod 3 gap >= 8.
    assert predicted((20, 20, 20))
    assert not predicted((20, 35, 35))  # Lower gap 15 represents large gaps 0 mod 3.

    rows = 0
    for d, e, i in product(range(18), range(16), (1, 2)):
        heaps = (0, d, d + e)
        if heaps[i] >= 13:
            shifted = heaps[:i] + (heaps[i] + 3,) + heaps[i + 1:]
            assert predicted(heaps) == predicted(tuple(sorted(shifted))), (heaps, i)
            rows += 1
    assert rows == 277

    print(f"{transfer} transfer states, {rows} two-heap shift checks, and all witness bits pass.")
    print(f"Direct minimax used {direct.cache_info().currsize} states.")


if __name__ == "__main__":
    main()
