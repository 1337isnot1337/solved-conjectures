"""Exact arithmetic and conservative prior-example screening for Gaussian searches.

This script proves only the listed finite identities and their coprimality.
It does not prove novelty, current payment eligibility, or any general conjecture.
"""
import argparse
import json
from fractions import Fraction
from pathlib import Path


def mul(z, w):
    a, b = z
    c, d = w
    return a * c - b * d, a * d + b * c


def power(z, n):
    out = (1, 0)
    while n:
        if n & 1:
            out = mul(out, z)
        z = mul(z, z)
        n >>= 1
    return out


def norm(z):
    return z[0] ** 2 + z[1] ** 2


def gcd(z, w):
    while norm(w):
        a, b = z
        c, d = w
        den = norm(w)
        # Exact nearest-integer quotient, with a fixed rule for half-integers.
        q = ((2 * (a * c + b * d) + den) // (2 * den),
             (2 * (b * c - a * d) + den) // (2 * den))
        v = mul(q, w)
        z, w = w, (a - v[0], b - v[1])
    return z


def power_key(bases, exponents):
    """Invariant under common units, conjugation, permutation, power repacking."""
    t = [power(z, n) for z, n in zip(bases, exponents)]
    t[2] = tuple(-v for v in t[2])
    keys = []
    for conjugate in (False, True):
        for unit in ((1, 0), (-1, 0), (0, 1), (0, -1)):
            terms = [(a, -b if conjugate else b) for a, b in t]
            keys.append(tuple(sorted(mul(unit, z) for z in terms)))
    return min(keys)


# These are excluded prior examples, not results obtained in this session.
# Sources and dates are documented in README.md.
KNOWN = [
    ("Pegg-original-1", ((8, 5), (5, 3), (1, 2)), (2, 3, 7)),
    ("Pegg-original-2", ((20, 9), (1, 8), (1, 1)), (2, 3, 15)),
    ("Helenius-1", ((0, 5), (0, 3), (34, -34)), (3, 7, 2)),
    ("Helenius-2", ((49, 306), (1, 2), (27, 37)), (2, 7, 3)),
    ("Helenius-3", ((44, 83), (31, 39), (5, 2)), (2, 3, 7)),
    ("Helenius-4", ((19, 36), (1, -1), (9, 8)), (2, 13, 3)),
    ("Helenius-5", ((2, 1), (1, 1), (5, 4)), (4, 9, 2)),
    ("Helenius-Beal", ((-2, 1), (-2, -1), (1, 1)), (3, 3, 4)),
    ("Oleg567-2012", ((238, 72), (7, 6), (7347, -1240)), (3, 8, 2)),
    ("Howe-et-al-2026-1", ((2761, 2761), (0, 239), (0, 3)), (2, 3, 13)),
    ("Howe-et-al-2026-2", ((0, 2797), (0, 13), (75090, -75090)), (3, 9, 2)),
    ("ordinary-1", ((1, 0), (2, 0), (3, 0)), (7, 3, 2)),
    ("ordinary-2", ((2, 0), (7, 0), (3, 0)), (5, 2, 4)),
    ("ordinary-3", ((7, 0), (13, 0), (2, 0)), (3, 2, 9)),
    ("ordinary-4", ((2, 0), (17, 0), (71, 0)), (7, 3, 2)),
    ("ordinary-5", ((3, 0), (11, 0), (122, 0)), (5, 4, 2)),
    ("ordinary-6", ((17, 0), (76271, 0), (21063928, 0)), (7, 3, 2)),
    ("ordinary-7", ((1414, 0), (2213459, 0), (65, 0)), (3, 2, 7)),
    ("ordinary-8", ((9262, 0), (15312283, 0), (113, 0)), (3, 2, 7)),
    ("ordinary-9", ((43, 0), (96222, 0), (30042907, 0)), (8, 3, 2)),
    ("ordinary-10", ((33, 0), (1549034, 0), (15613, 0)), (8, 2, 3)),
]


def verify(bases, exponents):
    terms = [power(z, n) for z, n in zip(bases, exponents)]
    return {
        "identity": tuple(a + b for a, b in zip(terms[0], terms[1])) == terms[2],
        "reciprocal_sum": str(sum(Fraction(1, n) for n in exponents)),
        "hyperbolic": sum(Fraction(1, n) for n in exponents) < 1,
        "nonunit": all(norm(z) > 1 for z in bases),
        "pairwise_gcd_norms": [norm(gcd(bases[i], bases[j]))
                               for i, j in ((0, 1), (0, 2), (1, 2))],
        "norms": [norm(z) for z in bases],
    }


def decode(row):
    if "a" in row:
        a, b, r, sign = row["a"], row["b"], row["r"], row["sign"]
        c = int(row["c"])
        eps = -1 if row["negative"] else 1
        assert a**3 + sign * b**r == eps * 2 * c * c
        target = (0, -sign)
        unit = next(u for u in ((1, 0), (-1, 0), (0, 1), (0, -1))
                    if power(u, r) == target)
        return ((0, a), tuple(b * v for v in unit), (c, -eps * c)), (3, r, 2)
    return tuple(tuple(map(int, row[k])) for k in ("x", "y", "z")), (row.get("p", 2), row.get("q", 3), row["r"])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("files", nargs="*")
    args = ap.parse_args()
    known = {}
    for name, bases, exponents in KNOWN:
        check = verify(bases, exponents)
        assert check["identity"] and check["hyperbolic"]
        assert check["pairwise_gcd_norms"] == [1, 1, 1]
        known[power_key(bases, exponents)] = name
    for filename in args.files:
        for i, line in enumerate(Path(filename).read_text().splitlines(), 1):
            bases, exponents = decode(json.loads(line))
            check = verify(bases, exponents)
            assert check["identity"] and check["hyperbolic"] and check["nonunit"]
            assert check["pairwise_gcd_norms"] == [1, 1, 1]
            print(json.dumps({"file": filename, "line": i, "bases": bases,
                              "exponents": exponents, **check,
                              "known_power_triple": known.get(power_key(bases, exponents))}))


if __name__ == "__main__":
    main()
