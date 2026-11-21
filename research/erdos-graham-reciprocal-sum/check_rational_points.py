"""Replay the Mordell-Weil sieves from the quadratic Chabauty coefficient rows."""
import gzip
import json
import sys
from math import gcd, lcm
from pathlib import Path

QC_PRIMES = (5, 11, 13, 17, 19)
GENERATORS = {
    1: ((-31, 124), (-5, -12)),
    2: ((-3, -12), (-9, 36)),
}
TORSION = {
    1: ((None,), (None,)),
    2: ((None,), (None, (63, -252), (63, 252))),
}


def intersect(left, right):
    """Intersect two residue classes with their shared torsion index."""
    a, m, torsion = left
    b, n, other = right
    g = gcd(m, n)
    if torsion != other or (b - a) % g:
        return None
    factor = n // g
    offset = (b - a) // g * pow(m // g, -1, factor) % factor
    return (a + m * offset) % lcm(m, n), lcm(m, n), torsion


def prime_rows(record, group):
    prime = record["prime"]
    result = set()
    for pair in record["rows"][group]:
        row = []
        for (u, v, j), order in zip(pair, record["orders"], strict=True):
            assert 0 <= u < prime**2 and 0 <= v < order
            combined = intersect((u, prime**2, j), (v, order, j))
            if combined is None:
                break
            row.append(combined)
        if len(row) == 2:
            result.add(tuple(row))
    return result


def same_component(rows):
    """One pair of integer coefficients must satisfy a row at every prime."""
    first, *remaining = sorted(rows, key=len)
    states = first
    for candidates in remaining:
        updated = set()
        for left, right in states:
            for u, v in candidates:
                first_coordinate = intersect(left, u)
                if first_coordinate is not None:
                    second_coordinate = intersect(right, v)
                    if second_coordinate is not None:
                        updated.add((first_coordinate, second_coordinate))
        states = updated
        if not states:
            break
    return states


def elliptic_table(prime, a, b, c, generator, torsion):
    """List free coefficients modulo the generator order on y²=x³+ax²+bx+c."""
    def reduce(point):
        if point is None:
            return None
        x, y = (v % prime for v in point)
        assert (y*y - x**3 - a*x*x - b*x - c) % prime == 0
        return x, y

    def add(point, other):
        if point is None:
            return other
        if other is None:
            return point
        x, y = point
        v, w = other
        if x == v:
            if (y + w) % prime == 0:
                return None
            slope = (3*x*x + 2*a*x + b) * pow(2*y, -1, prime)
        else:
            slope = (w-y) * pow(v-x, -1, prime)
        xsum = (slope*slope - a - x - v) % prime
        return xsum, (slope*(x-xsum) - y) % prime

    generator = reduce(generator)
    multiples = [None]
    current = generator
    while current is not None:
        multiples.append(current)
        current = add(current, generator)
    assert len(set(multiples)) == len(multiples)

    table = {}
    for j, point in enumerate(torsion):
        shift = reduce(point)
        for i, point in enumerate(multiples):
            table.setdefault(add(point, shift), []).append((i, j))
    return len(multiples), table


def auxiliary_images(prime, moduli):
    """Reduce both elliptic images of every point of the second genus-two curve."""
    g1, g2 = GENERATORS[2]
    t1, t2 = TORSION[2]
    o1, left = elliptic_table(prime, -3, -45, 63, g1, t1)
    o2, right = elliptic_table(prime, -45, -189, 3969, g2, t2)
    d1, d2 = gcd(o1, moduli[0]), gcd(o2, moduli[1])
    allowed = set()

    def record(P, Q):
        for i, j in left.get(P, []):
            for k, h in right.get(Q, []):
                allowed.add((i % d1, j, k % d2, h))

    for sign in (-1, 1):
        record(None, (0, sign*63 % prime))
    roots = {}
    for y in range(prime):
        roots.setdefault(y*y % prime, []).append(y)
    for x in range(prime):
        inv = pow(x, -1, prime) if x else 0
        for y in roots.get((x**6 - 3*x**4 - 45*x*x + 63) % prime, []):
            P = (x*x % prime, y)
            Q = (63*inv*inv % prime, 63*y*inv**3 % prime) if x else None
            record(P, Q)
    return d1, d2, allowed


def affine(coords):
    return None if coords[2] == "0" else tuple(map(int, coords[:2]))


def verify(curve, records):
    assert [r["prime"] for r in records] == list(QC_PRIMES)
    group_count = 18 if curve == 1 else 63
    for r in records:
        assert r["model"] == curve and len(r["rows"]) == group_count
        assert tuple(map(affine, r["generators"])) == GENERATORS[curve]
        assert tuple(tuple(map(affine, ts)) for ts in r["torsion"]) == TORSION[curve]
    states = set()
    for group in range(group_count):
        states.update(same_component([prime_rows(r, group) for r in records]))
    print(f"H{curve} after the five Chabauty primes: {len(states)}")
    if curve == 2:
        for p in (23, 29):
            if not states:
                break
            moduli = {(a[1], b[1]) for a, b in states}
            assert len(moduli) == 1
            d1, d2, allowed = auxiliary_images(p, moduli.pop())
            states = {(a, b) for a, b in states
                      if (a[0] % d1, a[2], b[0] % d2, b[2]) in allowed}
            print(f"H2 after auxiliary prime {p}: {len(states)}")
    assert not states


if __name__ == "__main__":
    default = Path(__file__).with_name("chabauty-rows.jsonl.gz")
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else default
    opener = gzip.open if path.suffix == ".gz" else open
    with opener(path, "rt") as source:
        records = [json.loads(line) for line in source if line.strip()]
    assert len(records) == 10
    for model in (1, 2):
        verify(model, sorted((r for r in records if r["model"] == model),
                             key=lambda r: r["prime"]))
