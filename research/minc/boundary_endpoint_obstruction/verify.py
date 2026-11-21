#!/usr/bin/env python3
"""Exact integer certificate for the Problem 8 endpoint-obstruction note.

Reconstructs Wanless's G_(3,6), counts all matchings by a small-frontier
dynamic program, and checks two rational derivative inequalities.
No floating-point arithmetic, third-party packages, or Lean.
"""
from math import comb, factorial
from fractions import Fraction


def jerrum_graph(k=3, f=6):
    n = k * k * f + 1

    def u(a, b, c):
        return 1 + a * k * f + c * k + b

    def v(a, b, c):
        return n + 1 + a * k * f + c * k + b

    edges = []
    for a in range(k):
        for c in range(f):
            if c == 0:
                edges.append((0, v(a, 0, 0)))
            else:
                edges.append((u(a, 0, c - 1), v(a, 0, c)))
            for b in range(k):
                for j in range(k):
                    if b != 0 or j != 0:
                        edges.append((u(a, b, c), v(a, j, c)))
            if c == f - 1:
                edges.append((u(a, 0, c), n))
    return n, edges


def rook_polynomial(n, edges):
    """Coefficient of z^k counts all k-edge matchings, exactly."""
    m = len(edges)
    first, last = [m] * (2 * n), [-1] * (2 * n)
    for idx, (u, v) in enumerate(edges):
        first[u] = min(first[u], idx)
        first[v] = min(first[v], idx)
        last[u], last[v] = idx, idx

    frontier = [
        [x for x in range(2 * n) if first[x] < boundary <= last[x]]
        for boundary in range(m + 1)
    ]
    assert max(map(len, frontier)) <= 8
    states = {0: [1]}
    for idx, (u, v) in enumerate(edges):
        left = {x: i for i, x in enumerate(frontier[idx])}
        right = {x: i for i, x in enumerate(frontier[idx + 1])}
        nxt = {}
        for mask, polynomial in states.items():
            base = 0
            for vertex, pos in left.items():
                if mask >> pos & 1 and vertex in right:
                    base |= 1 << right[vertex]

            omit = nxt.setdefault(base, [0] * (idx + 2))
            for degree, count in enumerate(polynomial):
                omit[degree] += count

            available_u = u not in left or not (mask >> left[u] & 1)
            available_v = v not in left or not (mask >> left[v] & 1)
            if available_u and available_v:
                chosen = base
                if u in right:
                    chosen |= 1 << right[u]
                if v in right:
                    chosen |= 1 << right[v]
                include = nxt.setdefault(chosen, [0] * (idx + 2))
                for degree, count in enumerate(polynomial):
                    include[degree + 1] += count
        states = nxt

    assert set(states) == {0}
    result = states[0]
    return (result + [0] * (n + 1))[: n + 1]


def multiply(p, q):
    result = [0] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            result[i + j] += a * b
    return result


def derivative_ratio(sig, n, a, b):
    """Return exact F'_A(a/b)/(n*per(A)) for A=B/3."""
    delta = b - a
    scaled = 0
    for k, count in enumerate(sig):
        first = k * a ** (k - 1) * delta ** (n - k) if k else 0
        second = (n - k) * a ** k * delta ** (n - k - 1) if k < n else 0
        weight = count * factorial(n - k) * n ** k * 3 ** (n - k)
        scaled += weight * (first - second)
    denominator = n ** (n + 1) * sig[n] * b ** (n - 1)
    return scaled, denominator


def main():
    m, edges = jerrum_graph()
    assert m == 55 and len(edges) == 165
    rook = rook_polynomial(m, edges)
    assert rook[-1] == 3221225472
    assert rook[-2] == 6825441230848

    # B=M direct-sum M direct-sum 3I_3 has 113 rows and columns.
    sigma = multiply(multiply(rook, rook), [comb(3, j) * 3 ** j for j in range(4)])
    n = 113
    assert len(sigma) == n + 1
    assert sigma[-1] == 280159925619463815168
    assert sigma[-2] == 1187539558049736390868992

    at_one = Fraction(n * n * sigma[-1] - 3 * sigma[-2], n * n * sigma[-1])
    assert at_one == Fraction(421, 102152)

    num, den = derivative_ratio(sigma, n, 999, 1000)
    assert den > 0
    assert -den < 500 * num < 0       # ratio > -1/500
    assert 1000 * num < -den           # ratio < -1/1000

    print("exact rational certificate PASSED")
    print("order:", n)
    print("F'(1)/(113 per A) =", at_one)
    print("-1/500 < F'(999/1000)/(113 per A) < -1/1000")
    print("interior sign:", "negative" if num < 0 else "NONNEGATIVE")


if __name__ == "__main__":
    main()
