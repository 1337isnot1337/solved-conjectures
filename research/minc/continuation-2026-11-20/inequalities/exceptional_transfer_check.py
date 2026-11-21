#!/usr/bin/env python3
"""Exact S6/Fano subgroup checks for a blocked POT-to-dominance transfer.

Uses integer Gaussian arithmetic for S6 and Z[zeta_5] for S7.  The finite
computations check identities and obstruction bounds, not open conjectures.
"""

from itertools import combinations, permutations
import json
from pathlib import Path

import f20_transfer_check as f


def inverse(p):
    out = [0] * len(p)
    for i, j in enumerate(p):
        out[j] = i
    return tuple(out)


def fixed_subsets(p, k):
    return sum(tuple(sorted(p[i] for i in I)) == I
               for I in combinations(range(len(p)), k))


def outer_s5():
    lines, _ = f.spherical_lines()
    index = {v: i for i, v in enumerate(lines)}
    H = {tuple(index[f.canonical(f.line_image(v, p))] for v in lines)
         for p in f.PERMS}
    assert len(H) == 120
    return H


def s6_check():
    H = outer_s5()
    S6 = tuple(permutations(range(6)))
    conjugates = set()
    for p in S6:
        q = inverse(p)
        conjugates.add(tuple(sorted(f.compose(f.compose(p, h), q) for h in H)))
    conjugates = sorted(conjugates)
    assert len(conjugates) == 6
    sets = [set(K) for K in conjugates]
    # Exact equality of characters Ind_H^S6(sign|H) = sign + chi_(3,3).
    # H is self-normalizing, so its six conjugates identify its six cosets.
    for p in S6:
        chi33 = fixed_subsets(p, 3) - fixed_subsets(p, 2)
        induced_sign = f.sign(p) * sum(p in K for K in sets)
        assert induced_sign == f.sign(p) + chi33
    W = [[1, 0, 1, 1, 1, 1], [0, 1, 1, -1, 1j, -1j]]
    A = f.gram(W)
    terms = {p: f.gprod(A[i][p[i]] for i in range(6)) for p in S6}
    P = f.real(f.gsum(terms.values()))
    assert P == 240
    trace33 = f.real(f.gsum(f.scale(fixed_subsets(p, 3) - fixed_subsets(p, 2), a)
                           for p, a in terms.items()))
    assert trace33 == 336
    # Schur--Weyl: rank(A)=2 and dim S_(3,3)(C^2)=1, so this trace is the
    # sole nonzero eigenvalue of the positive semidefinite (3,3) block.
    values = [f.real(f.gsum(f.scale(f.sign(p), terms[p]) for p in K))
              for K in conjugates]
    assert sorted(values) == [24, 24, 24, 24, 120, 120]
    assert sum(values) == trace33
    assert 5 * trace33 > 6 * P  # raw dimension threshold is passed
    assert max(values) < P     # yet the actual spherical directions fail
    return {"group_order": len(H), "number_of_conjugates": len(conjugates),
            "permanent": P, "trace_33_block": trace33,
            "six_sign_values": values,
            "generators_not_required": "H is exactly the S5 action on the six F20 lines",
            "group_elements": sorted(H)}


# The field Z[zeta], zeta^4+zeta^3+zeta^2+zeta+1=0.
Z0 = (0, 0, 0, 0)
Z1 = (1, 0, 0, 0)


def zadd(a, b):
    return tuple(x + y for x, y in zip(a, b))


def zscale(c, a):
    return tuple(c * x for x in a)


def zmul(a, b):
    coeff = [0] * 5
    for i, x in enumerate(a):
        for j, y in enumerate(b):
            coeff[(i + j) % 5] += x * y
    return tuple(coeff[i] - coeff[4] for i in range(4))


def zpow(k):
    k %= 5
    if k == 4:
        return (-1, -1, -1, -1)
    return tuple(int(i == k) for i in range(4))


def zconj(a):
    return zsum(zscale(c, zpow(-i)) for i, c in enumerate(a))


def zsum(xs):
    out = Z0
    for x in xs:
        out = zadd(out, x)
    return out


def zprod(xs):
    out = Z1
    for x in xs:
        out = zmul(out, x)
    return out


def zint(a):
    assert a[1:] == (0, 0, 0)
    return a[0]


def gl32():
    H = set()
    for a, b, c in permutations(range(1, 8), 3):
        def transform(x):
            return (a if x & 1 else 0) ^ (b if x & 2 else 0) ^ (c if x & 4 else 0)
        images = [transform(x) for x in range(1, 8)]
        if set(images) == set(range(1, 8)):
            H.add(tuple(x - 1 for x in images))
    assert len(H) == 168 and all(f.sign(p) == 1 for p in H)
    return H


def orbits_on_subsets(H, n, k):
    unseen = set(combinations(range(n), k))
    count = 0
    while unseen:
        I = next(iter(unseen))
        orbit = {tuple(sorted(p[i] for i in I)) for p in H}
        unseen -= orbit
        count += 1
    return count


def compound_from_terms(terms, n, k):
    subsets = tuple(combinations(range(n), k))
    index = {I: j for j, I in enumerate(subsets)}
    C = [[Z0 for _ in subsets] for _ in subsets]
    for p, a in terms.items():
        for i, I in enumerate(subsets):
            j = index[tuple(sorted(p[t] for t in I))]
            C[j][i] = zadd(C[j][i], a)
    assert all(C[i][j] == zconj(C[j][i])
               for i in range(len(C)) for j in range(len(C)))
    return subsets, C


def matrix_trace_square(C):
    return zsum(zmul(C[i][j], C[j][i])
                for i in range(len(C)) for j in range(len(C)))


def fano_check():
    H = gl32()
    orbit_counts = [orbits_on_subsets(H, 7, k) for k in range(4)]
    assert orbit_counts == [1, 1, 1, 2]
    # Differences give multiplicities of (7),(6,1),(5,2),(4,3).
    assert [orbit_counts[0]] + [orbit_counts[k] - orbit_counts[k-1] for k in range(1,4)] == [1,0,0,1]
    W = [[Z1, Z0] + [Z1] * 5, [Z0, Z1] + [zpow(j) for j in range(5)]]
    A = [[zsum(zmul(zconj(row[i]), row[j]) for row in W) for j in range(7)]
         for i in range(7)]
    S7 = tuple(permutations(range(7)))
    terms = {p: zprod(A[i][p[i]] for i in range(7)) for p in S7}
    P = zint(zsum(terms.values()))
    assert P == 1440
    triples, C3 = compound_from_terms(terms, 7, 3)
    _, C2 = compound_from_terms(terms, 7, 2)
    trace43 = zint(zadd(zsum(C3[i][i] for i in range(len(C3))),
                       zscale(-1, zsum(C2[i][i] for i in range(len(C2))))))
    trace_square43 = zint(zadd(matrix_trace_square(C3), zscale(-1, matrix_trace_square(C2))))
    assert trace43 == 4200 and trace_square43 == 8820000
    # Rank <= dim S_(4,3)(C^2)=2, and PSD.  These two exact moments force
    # the two nonzero eigenvalues to be 2100 and 2100.
    assert trace43 * trace43 == 2 * trace_square43
    fano_lines = {I for I in triples if ((I[0]+1) ^ (I[1]+1) ^ (I[2]+1)) == 0}
    assert len(fano_lines) == 7
    w = tuple(4 if I in fano_lines else -1 for I in triples)
    assert sum(x*x for x in w) == 140
    assert all(sum(w[j] for j, I in enumerate(triples) if set(T) <= set(I)) == 0
               for T in combinations(range(7),2))
    value = zsum(terms[p] for p in H)
    numerator = zsum(zscale(w[i]*w[j], C3[i][j])
                     for i in range(35) for j in range(35))
    assert zscale(30*140, value) == zadd(zscale(140, (P,0,0,0)), zscale(14, numerator))
    upper = (P + 14 * 2100) // 30
    assert P + 14 * 2100 == 30 * upper
    assert upper == 1028 < P
    return {"group_order": len(H), "index": 30,
            "subset_orbit_counts": orbit_counts,
            "rank_two_multiplicities": [1,0,0,1],
            "permanent": P, "trace_43_block": trace43,
            "trace_square_43_block": trace_square43,
            "nonzero_43_eigenvalues": [2100,2100],
            "one_exact_subgroup_value_in_Z_zeta5": value,
            "all_conjugates_upper_bound": upper,
            "normalization": "divide all degree-seven values by32 to obtain Drury's correlation matrix"}


def main():
    result = {"status": "no full conjecture resolved; exact transfer obstructions",
              "S6": s6_check(), "Fano_S7": fano_check()}
    result["checks"] = "all exact integer and cyclotomic assertions passed"
    path = Path(__file__).with_name("exceptional_transfer_certificate.json")
    path.write_text(json.dumps(result, indent=2) + "\n")
    summary = dict(result)
    summary["S6"] = {k:v for k,v in result["S6"].items() if k != "group_elements"}
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
