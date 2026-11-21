"""Exact border identities; no assertion of the open operator inequality."""

from itertools import permutations
import sympy as s


def permanent(a):
    n = a.rows
    assert a.cols == n
    return s.expand(sum(s.prod(a[i, p[i]] for i in range(n))
                        for p in permutations(range(n))))


def cofactors(a):
    return s.Matrix(a.rows, a.cols,
                    lambda i, j: permanent(a.minor_submatrix(i, j)))


def border_operator(v):
    a = v.H * v
    return permanent(a) * s.eye(v.rows) + v * cofactors(a).T * v.H


def main():
    v = s.Matrix([[1, s.I, 1], [0, 1, 1 + s.I]])
    u = s.Matrix([[1, 1, s.I], [1, 0, 1], [0, 1, 1]])
    h = s.Matrix([1 + s.I, 2])
    k = s.Matrix([1, s.I, 2 - s.I])
    a, b = v.H * v, u.H * u
    ca, cb = border_operator(v), border_operator(u)
    va, ub = v.row_join(h), u.row_join(k)
    aa, bb = va.H * va, ub.H * ub
    pa, pb = permanent(aa), permanent(bb)
    assert s.expand((h.H * ca * h)[0] - pa) == 0
    assert s.expand((k.H * cb * k)[0] - pb) == 0
    wrong = permanent(a) * s.eye(v.rows) + v * cofactors(a) * v.H
    assert s.expand((h.H * wrong * h)[0] - pa) != 0
    w = s.Matrix.hstack(*(s.kronecker_product(v[:, i], u[:, i])
                          for i in range(v.cols)))
    e = a.multiply_elementwise(b)
    assert (w.H * w - e).applyfunc(s.expand) == s.zeros(v.cols)
    d = border_operator(w)
    m = s.kronecker_product(ca, cb) - d
    hk = s.kronecker_product(h, k)
    gap = s.expand(pa * pb - permanent(aa.multiply_elementwise(bb)))
    assert s.expand((hk.H * m * hk)[0] - gap) == 0
    x = w * cofactors(e).T * w.H
    assert s.expand(s.trace(x) - v.cols * permanent(e)) == 0
    print("Exact complex border identities passed.")
    print("Wrong cofactor orientation gives a different border value.")
    print("Product-vector gap:", gap)


if __name__ == "__main__":
    main()
