"""Exact enumeration through the second shell of Shimada's A24 Leech deep hole.

Uses the two numerical inputs in the adjacent JSON excerpt from Shimada's GAP
data. Optionally pass the original newcompdataLeechHoles.txt to read it directly.
"""

import ast
import hashlib
import json
import re
import sys
from collections import defaultdict
from fractions import Fraction as F
from math import isqrt
from pathlib import Path


def read_geometry(path):
    data = path.read_bytes()
    print("Shimada data SHA-256:", hashlib.sha256(data).hexdigest())
    text = data.decode()
    gram = ast.literal_eval(text.split("GramLeech:=", 1)[1].split(";", 1)[0])
    match = re.search(r'type:=\[\s*"A24"\s*\],\s*center:=\[(.*?)\]', text, re.S)
    center = [F(item.strip()) for item in match[1].split(",")]
    return gram, center


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def multiply(matrix, vector):
    return [dot(row, vector) for row in matrix]


def shells(gram, center, radius_squared):
    """Enumerate lattice coordinates by exact completion of squares G = L D L^T."""
    n = len(gram)
    lower = [[F(i == j) for j in range(n)] for i in range(n)]
    diag = []
    for i in range(n):
        diag.append(F(gram[i][i]) - sum(lower[i][k]**2 * diag[k] for k in range(i)))
        for j in range(i + 1, n):
            remainder = gram[j][i] - sum(lower[j][k] * lower[i][k] * diag[k]
                                         for k in range(i))
            lower[j][i] = remainder / diag[i]

    vectors = defaultdict(list)
    offsets = [F(0)] * n

    def search(i, budget):
        if i < 0:
            vectors[radius_squared - budget].append(tuple(offsets))
            return
        midpoint = center[i] - sum(lower[j][i] * offsets[j] for j in range(i + 1, n))
        p, q = midpoint.as_integer_ratio()
        radius = isqrt(int(budget * q**2 / diag[i]))
        for integer in range(-((radius - p) // q), (p + radius) // q + 1):
            offsets[i] = integer - center[i]
            search(i - 1, budget - diag[i] * (integer - midpoint)**2)

    search(n - 1, radius_squared)
    return vectors


def solve(matrix, rhs):
    rows = [list(row) + [entry] for row, entry in zip(matrix, rhs)]
    n = len(rhs)
    for i in range(n):
        pivot = next(j for j in range(i, n) if rows[j][i])
        rows[pivot], rows[i] = rows[i], rows[pivot]
        factor = rows[i][i]
        rows[i] = [x / factor for x in rows[i]]
        for j in range(n):
            if j != i and rows[j][i]:
                factor = rows[j][i]
                rows[j] = [a - factor*b for a, b in zip(rows[j], rows[i])]
    return [row[-1] for row in rows]


def main():
    fixture = json.loads(Path(__file__).with_name("shimada-a24.json").read_text())
    gram = fixture["gram"]
    d = [F(x, 25) for x in fixture["center_times_25"]]
    if len(sys.argv) > 1 and read_geometry(Path(sys.argv[1])) != (gram, d):
        raise ValueError("The published coordinates differ from the bundled data")
    vectors = shells(gram, d, F(52, 25))
    print("Radii squared and counts:", [(str(s), len(vectors[s])) for s in sorted(vectors)])
    if sorted(vectors) != [2, F(52, 25)]:
        raise ValueError("Unexpected spectrum through the second shell")
    nearest, second = vectors[2], vectors[F(52, 25)]
    if len(nearest) != 25 or any(map(sum, zip(*nearest))):
        raise ValueError("Unexpected nearest shell")
    # In the lattice basis, <v,w> = v^T G w. Thus H = 4 sum v (G v)^T.
    n = len(d)
    g = [2 * sum(coord) for coord in zip(*second)]
    duals = [multiply(gram, v) for v in nearest]
    hessian = [[4 * sum(v[i] * dv[j] for v, dv in zip(nearest, duals))
                for j in range(n)] for i in range(n)]
    w = solve(hessian, g)
    metric_w = multiply(gram, w)
    c0 = dot(g, metric_w) / 2
    c1 = len(nearest) * dot(w, metric_w)
    if (len(second), c0, c1) != (5, F(3, 5), 5):
        raise ValueError("Unexpected second-shell cardinality or asymptotic coefficients")
    print("C0 =", c0, "C1 =", c1, "squared displacement coefficient =", c1 / len(nearest))


if __name__ == "__main__":
    main()
