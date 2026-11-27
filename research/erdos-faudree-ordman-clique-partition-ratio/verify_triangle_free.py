#!/usr/bin/env python3
"""Exact pair and four-cycle certificates. Use GMP cddexec, not cddexec_f."""
import argparse
from fractions import Fraction as Q
from itertools import combinations
from math import comb
import subprocess

from verify_star import cross, dot


def affine_rows(L, n, edges):
    rows = []
    for k in range(n + len(edges)):
        row = [0] * (n + len(edges))
        row[k] = 1
        rows.append((0, *row))
    for a in range(1, L):
        for b in range(1, L + 1 - a):
            for k, (i, j) in enumerate(edges):
                row = [0] * (n + len(edges))
                row[i], row[j], row[n+k] = comb(a, 2), comb(b, 2), -a*b
                rows.append((1, *row))
    return rows


def verify_pair(L, a0, b2, expected_vertices):
    rows = affine_rows(L, 2, [(0, 1)])
    verts = set()
    for a, b, c in combinations(rows, 3):
        r = [a[1:], b[1:], c[1:]]
        cofactors = [cross(r[(i+1) % 3], r[(i+2) % 3])
                     for i in range(3)]
        den = dot(r[0], cofactors[0])
        if not den:
            continue
        v = tuple(Q(-dot([a[0], b[0], c[0]], w), den)
                  for w in zip(*cofactors))
        if all(y0 + dot(row, v) >= 0 for y0, *row in rows):
            verts.add(v)
    assert len(verts) == expected_vertices
    assert all(max(0, p-a0)**2 <= b2*h*d for h, d, p in verts)


def solve_nonsingular(rows):
    mat = [list(map(Q, row)) for row in rows]
    n = len(mat)
    for i in range(n):
        pivot = next((j for j in range(i, n) if mat[j][i]), None)
        if pivot is None:
            return None
        mat[i], mat[pivot] = mat[pivot], mat[i]
        scale = mat[i][i]
        mat[i] = [v/scale for v in mat[i]]
        for j, row in enumerate(mat):
            if j != i and (c := row[i]):
                mat[j] = [a-c*b for a, b in zip(row, mat[i])]
    return [row[-1] for row in mat]


def verify_square(cddexec):
    edges = [(0, 2), (0, 3), (1, 2), (1, 3)]
    rows = affine_rows(5, 4, edges)
    data = f"H-representation\nbegin\n{len(rows)} 9 rational\n"
    data += "".join(" ".join(map(str, row))+"\n" for row in rows)
    data += "end\n"
    result = subprocess.run([cddexec, "--rep"], input=data, text=True,
                            capture_output=True, check=True)
    lines = result.stdout.splitlines()
    i = lines.index("begin")
    count, dimensions, kind = lines[i+1].split()
    assert int(dimensions) == 9 and kind == "rational"
    generators = [tuple(map(Q, l.split()))
                  for l in lines[i+2:i+2+int(count)]]
    assert len(generators) == len(set(generators)) == 1859
    vertices, rays = 0, 0
    maximum = Q(0)
    for m, *v in generators:
        assert m in (0, 1) and len(v) == 8
        assert all(m*c + dot(a, v) >= 0 for c, *a in rows)
        if m == 0:
            rays += 1
            assert all(h >= 0 for h in v[:4]) and v[4:] == [0]*4
            continue
        vertices += 1
        Y = [[-v[i] if i == j else 0 for j in range(4)] for i in range(4)]
        for k, (i, j) in enumerate(edges):
            Y[i][j] = Y[j][i] = v[4+k]
        # Singleton supports have nonpositive objective.
        for size in range(2, 5):
            for S in combinations(range(4), size):
                aug = [[Y[i][j] for j in S]+[-1, 0] for i in S]
                aug.append([1]*size+[0, 1])
                sol = solve_nonsingular(aug)
                if sol is not None and min(sol[:-1]) > 0:
                    maximum = max(maximum, sol[-1]/2)
    assert (vertices, rays, maximum) == (1855, 4, Q(1, 14))
    print(f"Four-cycle: {vertices} vertices, {rays} rays, exact maximum {maximum}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cddexec", default="cddexec")
    args = parser.parse_args()
    verify_pair(5, Q(1, 4), Q(9, 32), 11)
    verify_pair(6, Q(1, 5), Q(49, 150), 20)
    print("Pair certificates: 11 and 20 exact rational vertices")
    verify_square(args.cddexec)
