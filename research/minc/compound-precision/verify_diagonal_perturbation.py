"""Rational reference implementation of a simultaneous permanental compound action."""

from fractions import Fraction as Q
from itertools import combinations, permutations, product
from math import factorial, prod
from random import Random

from sympy import Matrix, Symbol, cancel, eye, zeros


def lagrange_at_zero(points):
    return [prod(Q(-y, x-y) for y in points if x != y) for x in points]


def cardinal_coefficients(k):
    rows = []
    for i in range(k+1):
        poly = [Q(1)]
        for j in range(k+1):
            if i == j:
                continue
            extended = [Q(0)] * (len(poly) + 1)
            for d, value in enumerate(poly):
                extended[d] -= value * Q(j, i-j)
                extended[d+1] += value * Q(1, i-j)
            poly = extended
        rows.append(poly)
    return rows


def local_layers(blocks, vector, weight):
    n = len(blocks)
    bins = [sum(1 << i for i in sub) for d in range(weight+1)
            for sub in combinations(range(n), d)]
    data = {mask: vector.get(mask, 0) for mask in bins}
    for i, (p, q, _, _) in enumerate(blocks):
        bit = 1 << i
        for mask in bins:
            if mask & bit:
                data[mask ^ bit] += data[mask] * Q(q, p)
    for mask in bins:
        for i, (p, q, u, v) in enumerate(blocks):
            data[mask] *= v - Q(u*q, p) if mask & (1 << i) else p
    for i, (p, _, u, _) in enumerate(blocks):
        bit = 1 << i
        for mask in bins:
            if mask & bit:
                data[mask] += data[mask ^ bit] * Q(u, p)
    return {mask: data[mask] for mask in vector}


def action(diag, u, v, k, vector):
    n, rank = len(diag), len(u[0])
    full = (1 << n)-1
    holes = k > n//2
    work = {full ^ s if holes else s: val for s, val in vector.items()}
    result = dict.fromkeys(work, Q(0))
    cardinal = cardinal_coefficients(k)
    weights = [[sum(factorial(m)*a*b for m, (a, b) in enumerate(zip(left, right)))
                for right in cardinal] for left in cardinal]
    avoided = 0
    for point in product(range(k+1), repeat=2*rank):
        factor = prod(weights[point[i]][point[i+rank]] for i in range(rank))
        if not factor:
            continue
        x = [sum(a*b for a, b in zip(row, point[:rank])) for row in u]
        y = [sum(a*b for a, b in zip(row, point[rank:])) for row in v]
        pivots = [d+a*b for d, a, b in zip(diag, x, y)]
        if holes:
            shifts = [h for h in range(n+k+1) if all(p+h for p in pivots)][:k+1]
            avoided += int(0 not in shifts)
        else:
            shifts = [0]
        for shift, scale in zip(shifts, lagrange_at_zero(shifts)):
            if holes:
                maps = [(p+shift, a, b, 1) for p, a, b in zip(pivots, x, y)]
            else:
                maps = [(1, b, a, p) for p, a, b in zip(pivots, x, y)]
            evaluated = local_layers(maps, work, min(k, n-k))
            for mask in result:
                result[mask] += factor * scale * evaluated[mask]
    return {full ^ s if holes else s: val for s, val in result.items()}, avoided


def direct(diag, u, v, k):
    n = len(diag)
    a = [[(diag[i] if i == j else 0) + sum(x*y for x, y in zip(u[i], v[j]))
          for j in range(n)] for i in range(n)]
    bins = list(combinations(range(n), k))
    mat = Matrix([[sum(prod(a[i][j] for i, j in zip(row, p))
                       for p in permutations(col)) for col in bins] for row in bins])
    return [sum(1 << i for i in sub) for sub in bins], mat


def main():
    rng = Random(118)
    cases, avoided = 0, 0
    for n, r in [(3, 0), (3, 2), (4, 1), (5, 1)]:
        u, v = [[[rng.randint(-2, 2) for _ in range(r)] for _ in range(n)] for _ in (0, 1)]
        diag = [0] + [rng.randint(-1, 2) for _ in range(n-1)]
        for k in range(n+1):
            bins, mat = direct(diag, u, v, k)
            vector = {s: rng.randrange(-3, 4) for s in bins}
            got, count = action(diag, u, v, k, vector)
            assert [got[s] for s in bins] == list(mat*Matrix([vector[s] for s in bins]))
            avoided += count
            cases += 1
    z = Symbol("z")
    # Reducible, periodic, and nilpotent examples of positive-pole visibility.
    for a, pole in [(Matrix([[0, 4], [1, 0]]), Q(1, 2)),
                    (Matrix([[2, 1], [0, 2]]), Q(1, 2)),
                    (Matrix([[0, 1], [0, 0]]), None),
                    (zeros(2), None)]:
        fun = cancel(sum((eye(2) - z*a).inv()))
        den = fun.as_numer_denom()[1]
        if pole is None:
            assert not den.has(z)
        else:
            assert den.subs(z, pole) == 0
    assert avoided
    print(f"{cases} simultaneous actions, {avoided} zero-pivot grids, four Perron cases")


if __name__ == "__main__":
    main()
