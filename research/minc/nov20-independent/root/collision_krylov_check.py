#!/usr/bin/env python3
"""Exact structural checks for the collision-resolvent algorithm.

The small checker uses dense rational reconstruction. The research note
uses the cited fast approximant-basis algorithms for its arithmetic bound.
"""
from itertools import permutations
from math import comb, factorial, prod
import sympy as sp


def compositions(k, n):
    if n == 1:
        yield (k,)
        return
    for a in range(k + 1):
        for rest in compositions(k - a, n - 1):
            yield (a,) + rest


def permanent(a):
    n = a.rows
    return sum(prod(a[i, p[i]] for i in range(n)) for p in permutations(range(n)))


def symmetric_action(a, k):
    """Independent direct polynomial substitution, no repeated permanent."""
    n = a.rows
    basis = list(compositions(k, n))
    pos = {alpha: i for i, alpha in enumerate(basis)}
    result = sp.zeros(len(basis))
    for j, beta in enumerate(basis):
        terms = {(0,) * n: sp.Integer(1)}
        for col, count in enumerate(beta):
            for _ in range(count):
                nxt = {}
                for alpha, coeff in terms.items():
                    for row in range(n):
                        if a[row, col] == 0:
                            continue
                        new = list(alpha)
                        new[row] += 1
                        new = tuple(new)
                        nxt[new] = nxt.get(new, 0) + coeff * a[row, col]
                terms = nxt
        for alpha, coeff in terms.items():
            result[pos[alpha], j] = coeff
    return basis, result


def repeated_entry(a, alpha, beta):
    rows = [i for i, e in enumerate(alpha) for _ in range(e)]
    cols = [i for i, e in enumerate(beta) for _ in range(e)]
    return permanent(a.extract(rows, cols)) / prod(factorial(e) for e in alpha)


def krylov_length(s, b):
    blocks = [b]
    oldrank = b.rank()
    for length in range(1, s.rows + 1):
        nxt = s * blocks[-1]
        augmented = sp.Matrix.hstack(*blocks, nxt)
        newrank = augmented.rank()
        if newrank == oldrank:
            return length
        blocks.append(nxt)
        oldrank = newrank
    raise AssertionError("Krylov span did not stabilize")


def polynomial_det(a, z):
    ring = sp.QQ.poly_ring(z)
    dm = a.to_DM().convert_to(ring)
    return sp.expand(ring.to_sympy(dm.det()))


def trace_charpoly(a, k, dimension, z):
    """Newton trace route, independently of the symmetric matrix."""
    powers = [a.rows]
    cur = sp.eye(a.rows)
    for _ in range(k * dimension):
        cur = cur * a
        powers.append(sp.trace(cur))
    sym_traces = [dimension]
    for t in range(1, dimension + 1):
        h = [sp.Integer(1)]
        for j in range(1, k + 1):
            h.append(sum(powers[i * t] * h[j - i] for i in range(1, j + 1)) / j)
        sym_traces.append(h[k])
    coeffs = [sp.Integer(1)]
    for j in range(1, dimension + 1):
        coeffs.append(-sum(sym_traces[i] * coeffs[j - i] for i in range(1, j + 1)) / j)
    return sp.Poly(sum(c * z**i for i, c in enumerate(coeffs)), z)


def solve_moment_fraction(moments, degree, z):
    """Find D(0)=I using only moments through order 2*degree."""
    q = moments[0].rows
    lhs = sp.Matrix.vstack(*[
        sp.Matrix.hstack(*[moments[t - j] for j in range(1, degree + 1)])
        for t in range(degree, 2 * degree + 1)
    ])
    rhs = sp.Matrix.vstack(*[-moments[t] for t in range(degree, 2 * degree + 1)])
    solution, parameters = lhs.gauss_jordan_solve(rhs)
    if parameters.rows:
        solution = solution.subs({x: 0 for x in parameters})
    ds = [sp.eye(q)] + [solution[j*q:(j+1)*q, :] for j in range(degree)]
    ns = []
    for t in range(degree):
        ns.append(sum((moments[t-j] * ds[j] for j in range(t+1)), sp.zeros(q)))
    # Extra moments were not inputs to the rational reconstruction.
    for t in range(degree, len(moments)):
        residual = sum((moments[t-j] * ds[j] for j in range(min(t, degree)+1)), sp.zeros(q))
        assert residual == sp.zeros(q)
    denominator = sum((d * z**j for j, d in enumerate(ds)), sp.zeros(q))
    numerator = sum((n * z**j for j, n in enumerate(ns)), sp.zeros(q))
    return numerator, denominator


def check(a, k, label):
    n = a.rows
    basis, s = symmetric_action(a, k)
    m = len(basis)
    squarefree = [i for i, alpha in enumerate(basis) if max(alpha) <= 1]
    collisions = [i for i, alpha in enumerate(basis) if max(alpha) > 1]
    q = len(collisions)
    assert len(squarefree) == comb(n, k)
    assert m == comb(n+k-1, k)
    b = sp.eye(m)[:, collisions]
    e = b.T
    metric = sp.diag(*(prod(factorial(x) for x in alpha) for alpha in basis))
    _, st = symmetric_action(a.T, k)
    assert s.T * metric == metric * st
    right_length = krylov_length(s, b)
    left_length = krylov_length(s.T, e.T)
    degree = max(right_length, left_length)
    assert degree <= n + comb(n+1, 2)
    moments = []
    cur = b
    for _ in range(3 * degree + 3):
        moments.append(e * cur)
        cur = s * cur
    # Representation and coefficient normalization, including repeated rows.
    for t in (0, 1, 2, 2 * degree):
        at = a**t
        for ii, i in enumerate(collisions):
            for jj, j in enumerate(collisions):
                assert moments[t][ii, jj] == repeated_entry(at, basis[i], basis[j])
    p = s.extract(squarefree, squarefree)
    for i, alpha_idx in enumerate(squarefree):
        rows = [j for j, x in enumerate(basis[alpha_idx]) if x]
        for j, beta_idx in enumerate(squarefree):
            cols = [ell for ell, x in enumerate(basis[beta_idx]) if x]
            assert p[i, j] == permanent(a.extract(rows, cols))
    z = sp.Symbol('z')
    numerator, denominator = solve_moment_fraction(moments, degree, z)
    detn = polynomial_det(numerator, z)
    detd = polynomial_det(denominator, z)
    fullcoeffs = s.charpoly().all_coeffs()
    smallcoeffs = p.charpoly().all_coeffs()
    full = sp.Poly(sum(c*z**i for i, c in enumerate(fullcoeffs)), z)
    small = sp.Poly(sum(c*z**i for i, c in enumerate(smallcoeffs)), z)
    assert trace_charpoly(a, k, m, z) == full
    assert sp.Poly(full.as_expr()*detn-small.as_expr()*detd, z).is_zero
    quotient, remainder = sp.div(full * sp.Poly(detn, z), sp.Poly(detd, z))
    assert remainder.is_zero and quotient == small
    print(f"PASS {label}: n={n}, k={k}, M={m}, q={q}, left/right={left_length}/{right_length}", flush=True)


def main():
    examples = [
        (sp.Matrix([[2,1],[3,0]]), 2, 'dense2'),
        (sp.zeros(3), 2, 'zero3'),
        (sp.eye(3), 2, 'scalar3'),
        (sp.ones(3), 2, 'rankone3'),
        (sp.Matrix([[0,1,0],[0,0,1],[1,0,0]]), 2, 'cycle3'),
        (sp.Matrix([[1,2,0],[-1,1,1],[2,0,3]]), 2, 'dense3'),
        (sp.Matrix([[1,1,0],[0,1,0],[0,0,0]]), 2, 'jordan_zero3'),
        (sp.Matrix([[1,2,0],[-1,1,1],[2,0,3]]), 3, 'full_degree3'),
        (sp.Matrix([[1,1,0,0],[0,1,0,0],[0,0,0,1],[0,0,0,0]]), 2, 'mixed_jordan4'),
        (sp.diag(1,1,2,2), 3, 'repeated_spectrum4'),
        (sp.Matrix([[0,1,0,0],[0,0,1,0],[0,0,0,1],[0,0,0,0]]), 3, 'nilpotent4'),
        (sp.Matrix([[1,1,0,0],[0,1,0,0],[0,0,0,1],[0,0,0,0]]), 3, 'mixed_jordan_degree3'),
    ]
    for a, k, label in examples:
        check(a, k, label)
    print(f"PASS all {len(examples)} exact reconstruction cases", flush=True)


if __name__ == '__main__':
    main()
