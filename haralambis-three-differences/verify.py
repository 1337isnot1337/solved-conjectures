"""Construct and check the signed-edge certificate from a finite avoiding set."""

from fractions import Fraction
from itertools import combinations
from math import gcd
from random import Random


def bezout(a, b):
    if b == 0:
        return 1, 0
    x, y = bezout(b, a % b)
    return y, x - (a // b) * y


def face_incidences(d):
    incidences = {(t, i): [] for i in range(3) for t in range(sum(d) - d[i])}
    for k in range(3):
        i, j = (k + 1) % 3, (k + 2) % 3
        for t in range(d[k]):
            boundary = [((t, i), 1), ((t + d[i], j), 1),
                        ((t + d[j], i), -1), ((t, j), -1)]
            for edge, sign in boundary:
                incidences[edge].append(((k, t), sign))
    for adjacent in incidences.values():
        assert sorted(sign for _, sign in adjacent) == [-1, 1]
    return incidences


def signed_edges(d, occupied, incidences):
    dual = {}
    signs = {}
    for edge, adjacent in incidences.items():
        t, i = edge
        assert not (t in occupied and t + d[i] in occupied)
        if t in occupied or t + d[i] in occupied:
            signs[edge] = 0
            continue
        (a, sign), (b, opposite) = adjacent
        dual.setdefault(a, []).append((b, edge, sign))
        dual.setdefault(b, []).append((a, edge, opposite))
    for root in dual:
        assert len(dual[root]) % 2 == 0

    for root in dual:
        here = root
        while dual[here]:
            other, edge, sign = dual[here].pop()
            if edge not in signs:
                signs[edge] = sign
                here = other
        assert here == root
    assert len(signs) == len(incidences)
    face_sums = {}
    for edge, adjacent in incidences.items():
        for face, sign in adjacent:
            face_sums[face] = face_sums.get(face, 0) + sign * signs[edge]
    assert all(v == 0 for v in face_sums.values())
    return signs


def verify_certificate(d, occupied, incidences):
    signs = signed_edges(d, occupied, incidences)
    minors = [[0] * 3 for _ in range(3)]
    delta = Fraction(1, 2)
    for i, j in combinations(range(3), 2):
        p = d[i] + d[j]
        total = 0
        for t in range(p):
            total += signs[t, i] if t < d[j] else -signs[t - d[j], j]
        count = sum(t < p for t in occupied)
        assert abs(total) <= p - 2 * count
        minors[i][j], minors[j][i] = total, -total
        delta = min(delta, Fraction(count, p))

    x, y = bezout(d[0], d[1])
    z, t = bezout(gcd(d[0], d[1]), d[2])
    coeff = [x * z, y * z, t]
    assert sum(c * v for c, v in zip(coeff, d)) == 1
    w = [sum(c * v for c, v in zip(coeff, row)) + d[i] * (sum(coeff) % 2)
         for i, row in enumerate(minors)]
    assert all(v % 2 == 1 for v in w)
    for i, j in combinations(range(3), 2):
        assert d[j] * w[i] - d[i] * w[j] == minors[i][j]

    error = 1 - 2 * delta
    left = max((x - error) / v for x, v in zip(w, d))
    right = min((x + error) / v for x, v in zip(w, d))
    assert left <= right
    theta = left / 2
    assert all(abs(v * theta - round(v * theta)) >= delta for v in d)


def avoiding_sets(d):
    forbidden = sum(1 << v for v in d)

    def visit(chosen, free):
        yield chosen
        while free:
            bit = free & -free
            free ^= bit
            v = bit.bit_length() - 1
            yield from visit(chosen | {v}, free & ~(forbidden << v))

    yield from visit(set(), (1 << sum(d)) - 1)


def main():
    exhaustive = sampled = 0
    for d in combinations(range(1, 8), 3):
        if gcd(*d) > 1:
            continue
        incidences = face_incidences(d)
        for occupied in avoiding_sets(d):
            verify_certificate(d, occupied, incidences)
            exhaustive += 1

    rng = Random(1977)
    triples = [(6, 10, 15), (4, 9, 13), (17, 31, 47)]
    while len(triples) < 200:
        d = tuple(sorted(rng.sample(range(1, 100), 3)))
        if gcd(*d) == 1:
            triples.append(d)
    for d in triples:
        incidences = face_incidences(d)
        for _ in range(3):
            order = list(range(sum(d)))
            rng.shuffle(order)
            occupied = set()
            for t in order:
                if all(t + v not in occupied and t - v not in occupied for v in d):
                    occupied.add(t)
            verify_certificate(d, occupied, incidences)
            sampled += 1
    print(f"Verified complete circulation and rotation certificates for {exhaustive} "
          f"exhaustively enumerated and {sampled} sampled configurations.")


if __name__ == "__main__":
    main()
