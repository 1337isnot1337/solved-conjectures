#!/usr/bin/env python3
"""Exact recurrence certificate for the (0,2) slice of 0.3102."""
from functools import cache

M, PM, G, PG, D = 12, 4, 3, 5, 4


def children(position):
    for i, h in enumerate(position):
        targets = [h - d for d in (1, 4) if h > d]
        if h in (1, 2):
            targets.append(0)
        for k in targets:
            yield tuple(sorted(position[:i] + (k,) + position[i+1:]))


def fold(q, pre, period):
    return q if q < pre else pre + (q - pre) % period


def canon(v):
    a, m, c = v
    gap = fold(c - m, G, PG)
    m = fold(m, M, PM)
    return a, m, m + gap


@cache
def raw(v):
    return v != (0, 0, 0) and not any(raw(w) for w in children(v))


def value(v):
    return raw(canon(v))


def require(ok, message):
    if not ok:
        raise SystemExit(message)


def main():
    representatives = 0
    for a in range(3):
        for m in range(a, M + D + PM):
            for gap in range(G + D + PG):
                v = (a, m, m + gap)
                # The two buffer strips let subtraction cross a cutoff.
                target = v != (0, 0, 0) and not any(value(w) for w in children(v))
                require(value(v) == target, f"closure failed at {v}")
                representatives += 1
    expected_rows = (
        "4a 48 09 29 29 29 29 29 29 29 29 29 29 29 29 29",
        "a5 00 52 52 94 94 10 52 52 52 52 52 52 52 52",
        "52 84 84 00 42 42 84 84 00 00 84 84 80 80",
    )
    for a, expected in enumerate(expected_rows):
        actual = [sum(1 << g for g in range(G+PG) if value((a,m,m+g)))
                  for m in range(a,M+PM)]
        require(actual == [int(mask,16) for mask in expected.split()],
                f"printed table mismatch in row {a}")
    masks = [
        sum(1 << j for j in range(PM) if value((2, M+j, M+j+g)))
        for g in range(G+PG)
    ]
    for j in range(PM):
        m = M + j
        require(value((2, m, m+2)) == (m % 4 in (0, 1)), f"gap two at {m}")
    for t in range(1, PM):
        require((t % 4 != 0) == any(any(bool(mask & (1 << j)) != bool(mask & (1 << ((j+t)%PM)))
                        for j in range(PM)) for mask in masks),
                f"incorrect full bulk period {t}")
    for t in range(1, PG):
        require(any(value((2, m, m+G+g)) != value((2, m, m+G+g+t))
                    for m in range(M, M+PM) for g in range(PG)),
                f"unexpected smaller horizontal period {t}")
    print(f"{representatives} exact transfer representatives; {raw.cache_info().currsize} raw corner states")
    print("gap masks at m=12..15:", " ".join(f"{mask:x}" for mask in masks))
    print("exact gap-two word PPNN; least bulk diagonal and horizontal periods 4 and 5")


if __name__ == "__main__":
    main()
