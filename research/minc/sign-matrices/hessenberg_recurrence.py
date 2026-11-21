"""Exact recurrence probe for a restricted sign-matrix family.

No all-order existence result is claimed.  Each matrix has +1 below and
on the diagonal and -1 on its first superdiagonal.  A new upper column
is either entirely negative (T), or negative only in its last position
(S).  The path-cover polynomial obeys T(C)=x(C+C') or S(C)=(x+1)C.

The calculation eliminates this restricted family as a possible
construction for every admissible order: it already misses order 8.
"""

from math import factorial


def add_column(c, mode):
    out = [0] + c
    for i, value in enumerate(c):
        out[i] += value if mode == "S" else i * value
    return out


def permanent_from_path_covers(c):
    n = len(c) - 1
    return sum(
        (-1) ** (n + k) * 2 ** (n - k) * factorial(k) * value
        for k, value in enumerate(c)
        if value
    )


def main():
    states = [([0, 1], "")]
    for n in range(1, 9):
        by_value = {}
        for c, word in states:
            value = permanent_from_path_covers(c)
            by_value.setdefault(value, word)
        target = 2 ** (n - 1)
        hits = [value for value in by_value if abs(value) == target]
        print(n, "target", target, "hits", hits)
        if n == 8:
            print("order-8 values", sorted(by_value))
        states = [
            (add_column(c, mode), word + mode)
            for c, word in states
            for mode in ("S", "T")
        ]


if __name__ == "__main__":
    main()
