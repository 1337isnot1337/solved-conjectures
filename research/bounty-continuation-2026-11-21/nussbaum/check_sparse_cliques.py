"""Exact cube and antichain examples for the sparse-clique counting theorem."""

from itertools import combinations
from math import comb, isqrt

from check_matched_cliques import subcube


def criterion(b, degree, r, t, w):
    return (0 < t < r and w >= 2*r and b <= comb(2*r, r)
            and b <= comb(w, t+1) and sum(comb(w, j) for j in range(t+1)) >= comb(w, r)
            and degree*comb(2*t, t) < b)


def mixed_antichain():
    # A 7-set contains the marked bit, while an 8-set omits it.
    family = [v for v in range(1 << 14)
              if v.bit_count() == (7 if v & 1 else 8)]
    b = len(family)
    assert b == 3003 and criterion(b, 10, 7, 5, 14)
    shadow = {subset for v in family for subset in subcube(0, v) if subset.bit_count() <= 5}
    assert len(shadow) >= b
    return len(shadow)


def two_rows():
    r0, r1 = 0, 31
    rows = [[], []]
    for j, pair in enumerate(list(combinations(range(5), 2))[:7]):
        ones = sum(1 << k for k in pair)
        for tag in range(3 if j < 6 else 2):
            mark = 1 << (5+tag)
            rows[0].append(subcube(r0, ones | mark))
            rows[1].append(subcube(r1, (31 ^ ones) | mark))
    b = len(rows[0])
    assert b == len(rows[1]) == 20 and criterion(b, 3, 3, 2, 6)
    assert all(f & g for f, g in zip(*rows))
    faces = rows[0] + rows[1]
    assert all(not f <= g and not g <= f for f, g in combinations(faces, 2))
    for i in (0, 1):
        assert max(sum(bool(f & g) for g in rows[1-i]) for f in rows[i]) == 3
    portions = [{v for v in set.union(*row) if (v ^ r).bit_count() <= 2}
                for r, row in zip((r0, r1), rows)]
    assert portions[0].isdisjoint(portions[1]) and min(map(len, portions)) >= b
    return tuple(map(len, portions))


def main():
    print("Two-row radius counts:", two_rows())
    print("Truncated shadow of the 3003-member mixed antichain:", mixed_antichain())
    for r in range(36, 501):
        d = isqrt(r)//6
        for b in (comb(2*r-2, r-1)+1, comb(2*r, r)):
            assert criterion(b, 3**(d-1), r, r-d, 2*r+2)
    print("Both row-size endpoints passed for each r from 36 through 500.")


if __name__ == "__main__":
    main()
