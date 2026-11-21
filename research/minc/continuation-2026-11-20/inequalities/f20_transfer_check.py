#!/usr/bin/env python3
"""Exact obstruction to transferring two known POT examples through F20.

All matrix and permutation arithmetic uses Python integers.  This does not
claim permanental dominance for arbitrary matrices or resolve a MINC entry.
"""

from itertools import combinations, permutations
import json
from pathlib import Path


ZERO = (0, 0)
ONE = (1, 0)


def gauss(z):
    z = complex(z)
    assert z.real.is_integer() and z.imag.is_integer()
    return int(z.real), int(z.imag)


def add(a, b):
    return a[0] + b[0], a[1] + b[1]


def mul(a, b):
    return a[0] * b[0] - a[1] * b[1], a[0] * b[1] + a[1] * b[0]


def scale(k, a):
    return k * a[0], k * a[1]


def conj(a):
    return a[0], -a[1]


def gsum(xs):
    out = ZERO
    for x in xs:
        out = add(out, x)
    return out


def gprod(xs):
    out = ONE
    for x in xs:
        out = mul(out, x)
    return out


def real(z):
    assert z[1] == 0
    return z[0]


def sign(p):
    return (-1) ** sum(p[i] > p[j] for i in range(len(p)) for j in range(i + 1, len(p)))


def compose(p, q):
    return tuple(p[q[i]] for i in range(len(p)))


def char_values(p):
    fixed1 = sum(i == p[i] for i in range(5))
    fixed2 = sum({p[i], p[j]} == {i, j} for i, j in combinations(range(5), 2))
    std = fixed1 - 1
    two = fixed2 - fixed1
    p2 = compose(p, p)
    wedge2 = (std * std - (sum(i == p2[i] for i in range(5)) - 1)) // 2
    s = sign(p)
    return {"5": 1, "41": std, "32": two, "311": wedge2,
            "221": s * two, "2111": s * std, "11111": s}


def gram(W):
    W = [[gauss(x) for x in row] for row in W]
    return [[gsum(mul(conj(row[i]), row[j]) for row in W)
             for j in range(len(W[0]))] for i in range(len(W[0]))]


PERMS = tuple(permutations(range(5)))
PAIRS = tuple(combinations(range(5), 2))
PAIR_INDEX = {p: i for i, p in enumerate(PAIRS)}
PAIR_ACTION = {
    p: tuple(PAIR_INDEX[tuple(sorted((p[i], p[j])))] for i, j in PAIRS)
    for p in PERMS
}
F20 = tuple(tuple((a * x + b) % 5 for x in range(5))
            for a in range(1, 5) for b in range(5))


def line_image(w, p):
    out = [0] * 10
    for i, j in enumerate(PAIR_ACTION[p]):
        out[j] = w[i]
    return tuple(out)


def canonical(w):
    return tuple(x * w[0] for x in w)


def spherical_lines():
    w = tuple(1 if (j - i) % 5 in (1, 4) else -1 for i, j in PAIRS)
    lines = sorted({canonical(line_image(w, p)) for p in PERMS})
    assert len(lines) == 6
    # Each line is orthogonal to the vertex-incidence subspace.  This is the
    # five-dimensional (3,2) Specht component of the action on two-subsets.
    for v in lines:
        assert sum(x * x for x in v) == 10
        assert all(sum(v[k] for k, pair in enumerate(PAIRS) if i in pair) == 0
                   for i in range(5))
        H = [p for p in PERMS if canonical(line_image(v, p)) == v]
        assert len(H) == 20
        assert all(line_image(v, p) == tuple(sign(p) * x for x in v) for p in H)
    # Equiangular tight frame: its Gram matrix has diagonal 10 and all
    # off-diagonal entries of absolute value 2; WW^T W = 12W.
    G = [[sum(x * y for x, y in zip(v, w)) for w in lines] for v in lines]
    assert all(abs(G[i][j]) == 2 for i in range(6) for j in range(6) if i != j)
    assert all(sum(G[i][j] * lines[j][k] for j in range(6)) == 12 * lines[i][k]
               for i in range(6) for k in range(10))
    return lines, G


def verify_induction():
    # Multipliers 1,2,4,3 correspond to the four powers of the generator 2.
    logs = {1: 0, 2: 1, 4: 2, 3: 3}
    powers_i = (ONE, (0, 1), (-1, 0), (0, -1))
    result = {}
    for j in range(4):
        multiplicities = {}
        for name in char_values(PERMS[0]):
            value = gsum(scale(char_values(p)[name], powers_i[(-j * logs[(p[1] - p[0]) % 5]) % 4])
                         for p in F20)
            assert value[1] == 0 and value[0] % 20 == 0
            multiplicities[name] = value[0] // 20
        result[str(j)] = multiplicities
    assert result["0"] == {"5": 1, "41": 0, "32": 0, "311": 0,
                            "221": 1, "2111": 0, "11111": 0}
    assert result["2"] == {"5": 0, "41": 0, "32": 1, "311": 0,
                            "221": 0, "2111": 0, "11111": 1}
    assert result["1"] == result["3"] == {
        "5": 0, "41": 0, "32": 0, "311": 1,
        "221": 0, "2111": 0, "11111": 0}
    return result


def check_matrix(A, expected_per, lines):
    terms = {p: gprod(A[i][p[i]] for i in range(5)) for p in PERMS}
    P = real(gsum(terms.values()))
    assert P == expected_per
    B = [[ZERO for _ in PAIRS] for _ in PAIRS]
    for p, term in terms.items():
        for i, j in enumerate(PAIR_ACTION[p]):
            B[j][i] = add(B[j][i], term)
    values = []
    for w in lines:
        H = [p for p in PERMS if canonical(line_image(w, p)) == w]
        f = real(gsum(scale(sign(p), terms[p]) for p in H))
        rayleigh_numerator = real(gsum(scale(w[i] * w[j], B[i][j])
                                      for i in range(10) for j in range(10)))
        assert rayleigh_numerator == 12 * f  # f = (5/6) (w*Bw)/(w*w).
        assert 0 <= f <= P
        values.append(f)
    trace_32 = real(gsum(scale(char_values(p)["32"], a) for p, a in terms.items()))
    assert sum(values) == trace_32  # tight-frame trace identity
    return {"permanent": P, "six_F20_sign_values": values,
            "trace_32_block": trace_32,
            "max_ratio_numerator": max(values), "max_ratio_denominator": P}


def main():
    lines, G = spherical_lines()
    induction = verify_induction()
    A = gram([[4 - 2j, 2 + 3j, -4 + 4j, -3 - 4j, 1],
              [2 + 4j, 3j, 2 + 4j, 3j, -5 + 7j]])
    H = [[gauss(z) for z in row] for row in [
        [3, 1 - 2j, -1, 1 + 2j, 1],
        [1 + 2j, 3, 1 - 2j, -1, 1],
        [-1, 1 + 2j, 3, 1 - 2j, 1],
        [1 - 2j, -1, 1 + 2j, 3, 1],
        [1, 1, 1, 1, 1]]]
    # Exact comparisons of published top eigenvalues with (6/5) per(A).
    P, T, D = 814016640, 2185775, 160600333345
    margin = 3 * P - 800 * T
    assert margin > 0 and margin * margin > 800 * 800 * D
    assert 5 * 512 < 6 * 504
    result = {
        "status": "no full conjecture resolved; exact transfer obstruction",
        "induced_characters": induction,
        "pairs": PAIRS, "spherical_line_vectors": lines, "line_Gram_matrix": G,
        "Shchesnovich": check_matrix(A, P, lines),
        "Tran": check_matrix(H, 504, lines),
        "checks": "all exact integer assertions passed",
    }
    path = Path(__file__).with_name("f20_transfer_certificate.json")
    path.write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps({k: result[k] for k in ("Shchesnovich", "Tran", "checks")}, indent=2))


if __name__ == "__main__":
    main()
