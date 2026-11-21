"""Exact two-row Wishart identity. No floating-point computation is used."""
from itertools import permutations
import sympy as sp


def cycles(p):
    seen, count = set(), 0
    for i in range(len(p)):
        if i in seen:
            continue
        count += 1
        while i not in seen:
            seen.add(i)
            i = p[i]
    return count


def moment(rows, cols, A, s):
    """E product B[rows[k],cols[k]], B=X G G* X*, XX*=A."""
    total = 0
    for p in permutations(range(len(rows))):
        term = s ** cycles(p)
        for i in range(len(rows)):
            term *= A[rows[i], cols[p[i]]]
        total += term
    return sp.expand(total)


def main():
    a, b, c, cb, s = sp.symbols("a b c cb s")
    A = sp.Matrix([[a, c], [cb, b]])
    pp = qq = 0
    for sigma in permutations(range(2)):
        for tau in permutations(range(2)):
            pp += moment([0, 1, 0, 1], list(sigma) + list(tau), A, s)
        qq += moment([0, 1] + list(sigma), list(sigma) + [0, 1], A, s)
    P = a * b + c * cb
    Q = (a * b) ** 2 + (c * cb) ** 2
    D = a * b - c * cb
    rising = s * (s + 1) * (s + 2) * (s + 3)
    beta = 2 * s * (s + 1) ** 2
    assert sp.expand(pp - rising * P**2 + beta * D**2) == 0
    assert sp.expand(qq - rising * Q + 2 * beta * D**2) == 0
    assert sp.expand(pp - qq - rising * (P**2 - Q) - beta * D**2) == 0
    print("Exact Wick identities verified over Z[a,b,c,cb,s].")
    print("E F(B) = (s)_4 F(A) + 2s(s+1)^2 det(A)^2")


if __name__ == "__main__":
    main()
