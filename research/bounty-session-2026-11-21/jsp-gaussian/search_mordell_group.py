"""Candidate generation via exact rational group arithmetic on Mordell curves.

The small integral seeds need not generate the full Mordell-Weil group. Neither
the seed list nor the bounded group combinations are a completeness theorem.
"""
import argparse
import itertools
import json
import math
from fractions import Fraction as F
from pathlib import Path


def add(p, q):
    if p is None:
        return q
    if q is None:
        return p
    x, y = p
    u, v = q
    if x == u:
        if y == -v:
            return None
        slope = 3 * x * x / (2 * y)
    else:
        slope = (v - y) / (u - x)
    r = slope * slope - x - u
    return r, slope * (x - r) - y


def multiples(p, bound):
    out = {0: None}
    q = None
    for n in range(1, bound + 1):
        q = add(q, p)
        out[n] = q
        out[-n] = (q[0], -q[1]) if q else None
    return out


def decode_point(point, b, t, sign, d):
    if point is None:
        return None
    x, y = point
    denominator, k = x.denominator, 0
    while denominator > 1 and denominator % (b * b) == 0:
        denominator //= b * b
        k += 1
    if denominator != 1 or k == 0:
        return None
    if x.numerator % 2 or y.numerator % 4:
        return None
    assert y.denominator == b ** (3 * k)
    a, c, r = x.numerator // 2, abs(y.numerator) // 4, 6 * k + t
    assert a**3 + sign * b**r == 2 * c * c
    assert y*y == x*x*x + d
    if abs(a) <= 1 or c == 0 or math.gcd(a, b) != 1:
        return None
    # Convert negative a to the signed-positive-a form used by the verifier.
    negative = a < 0
    return {"a": abs(a), "b": b, "r": r,
            "sign": -sign if negative else sign,
            "negative": negative, "c": str(c)}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("seeds")
    ap.add_argument("--multiple", type=int, default=6)
    ap.add_argument("--max-seeds", type=int, default=8)
    ap.add_argument("--progress", required=True)
    args = ap.parse_args()
    seen = set()
    with open(args.progress, "w") as progress:
        for line in Path(args.seeds).read_text().splitlines():
            row = json.loads(line)
            b, t, sign, d = (row[k] for k in ("b", "t", "sign", "d"))
            points = sorted(row["points"], key=lambda p: (abs(p[0]), abs(p[1])))[:args.max_seeds]
            seeds = [tuple(map(F, p)) for p in points]
            for x, y in seeds:
                assert y*y == x*x*x + d
            tables = [multiples(p, args.multiple) for p in seeds]
            checked = 0
            def inspect(point, witness):
                nonlocal checked
                checked += 1
                hit = decode_point(point, b, t, sign, d)
                if hit is None:
                    return
                key = tuple(hit.values())
                if key in seen:
                    return
                seen.add(key)
                print(json.dumps({**hit, "normalized_curve_d": d, "group_witness": witness}), flush=True)
            for i, table in enumerate(tables):
                for m, point in table.items():
                    inspect(point, [[points[i], m]])
            for i, j in itertools.combinations(range(len(tables)), 2):
                for m in range(1, args.multiple + 1):
                    for n in range(-args.multiple, args.multiple + 1):
                        if n:
                            inspect(add(tables[i][m], tables[j][n]), [[points[i], m], [points[j], n]])
            print(json.dumps({"b": b, "t": t, "sign": sign,
                              "seeds": len(seeds), "checked": checked,
                              "total_candidate_count": len(seen)}), file=progress, flush=True)


if __name__ == "__main__":
    main()
