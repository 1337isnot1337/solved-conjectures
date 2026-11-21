#!/usr/bin/env python3
"""All-vector, exact obstruction to a specific POT counterexample transfer.

For each known five-vector Gram configuration and each exceptional S5<=S6,
verify positivity of the 2x2 matrix representing the dominance difference
after appending an arbitrary vector.  Extra orthogonal components contribute
a strictly positive scalar term, so the conclusion is not restricted to a
finite set of vectors or to an ambient dimension of two.
"""

from itertools import permutations
import json
from pathlib import Path

import f20_transfer_check as f
import exceptional_transfer_check as e


def matmul(A, B):
    return [[f.gsum(f.mul(x, y) for x, y in zip(row, col))
             for col in zip(*B)] for row in A]


def star(A):
    return [[f.conj(x) for x in col] for col in zip(*A)]


def exceptional_groups():
    H0 = e.outer_s5()
    groups = set()
    for p in permutations(range(6)):
        q = e.inverse(p)
        groups.add(tuple(sorted(f.compose(f.compose(p, h), q) for h in H0)))
    assert len(groups) == 6
    return sorted(groups)


def difference_for_appended_vector(raw, v, group):
    W = [row + [v[j]] for j, row in enumerate(raw)]
    B = f.gram(W)
    terms = {p: f.gprod(B[i][p[i]] for i in range(6))
             for p in permutations(range(6))}
    return f.real(f.add(f.gsum(terms.values()),
                        f.scale(-1, f.gsum(f.scale(f.sign(p), terms[p]) for p in group))))


def check(raw, groups):
    W = [[f.gauss(x) for x in row] for row in raw]
    A = f.gram(raw)
    terms = {p: f.gprod(A[i][p[i]] for i in range(5)) for p in f.PERMS}
    P = f.real(f.gsum(terms.values()))
    D = [[f.ZERO for _ in range(5)] for _ in range(5)]
    for p in f.PERMS:
        for i, j in enumerate(p):
            D[j][i] = f.add(D[j][i], f.gprod(A[k][p[k]] for k in range(5) if k != i))
    certificates = []
    for group in groups:
        fK = f.ZERO
        DH = [[f.ZERO for _ in range(5)] for _ in range(5)]
        for p in group:
            if p[5] == 5:
                fK = f.add(fK, f.scale(f.sign(p), terms[p[:5]]))
            else:
                i, j = p.index(5), p[5]
                DH[j][i] = f.add(DH[j][i], f.scale(f.sign(p),
                    f.gprod(A[k][p[k]] for k in range(5) if k != i)))
        delta = P - f.real(fK)
        E = [[f.add(D[j][i], f.scale(-1, DH[j][i])) for i in range(5)] for j in range(5)]
        M = matmul(matmul(W, E), star(W))
        for j in range(2):
            M[j][j] = f.add(M[j][j], (delta, 0))
        assert M[0][1] == f.conj(M[1][0])
        a, d = f.real(M[0][0]), f.real(M[1][1])
        b = M[0][1]
        determinant = a*d - b[0]*b[0] - b[1]*b[1]
        assert delta > 0 and a > 0 and d > 0 and determinant > 0
        # Independent direct degree-six evaluations verify the orientation
        # and all four real coefficients of this Hermitian quadratic form.
        for v in ([1,0], [0,1], [1,1], [1,1j]):
            gv = [f.gauss(x) for x in v]
            predicted = f.real(f.gsum(f.mul(f.conj(gv[i]), f.mul(M[i][j], gv[j]))
                                     for i in range(2) for j in range(2)))
            assert difference_for_appended_vector(raw, v, group) == predicted
        certificates.append({"delta": delta, "M": M, "determinant": determinant})
    return {"permanent_of_core": P, "six_positive_definite_certificates": certificates}


def main():
    groups = exceptional_groups()
    result = {
        "status": "no full conjecture resolved; one-vector transfer excluded",
        "scope": "every appended Gram vector, including arbitrary orthogonal components, for six exceptional S5 subgroups",
        "Shchesnovich": check([[4-2j, 2+3j, -4+4j, -3-4j, 1],
                                [2+4j, 3j, 2+4j, 3j, -5+7j]], groups),
        "Tran": check([[1,1,1,1,1], [1-1j,-1-1j,-1+1j,1+1j,0]], groups),
        "checks": "all exact Gaussian-integer assertions passed",
    }
    path = Path(__file__).with_name("one_vector_transfer_certificate.json")
    path.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({"checks": result["checks"], "certificates": 12,
                      "Shchesnovich_min_determinant": min(c["determinant"] for c in result["Shchesnovich"]["six_positive_definite_certificates"]),
                      "Tran_min_determinant": min(c["determinant"] for c in result["Tran"]["six_positive_definite_certificates"])}, indent=2))


if __name__ == "__main__":
    main()
