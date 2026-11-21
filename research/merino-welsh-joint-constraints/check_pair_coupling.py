#!/usr/bin/env python3
"""Test one unproved orientation/resistance inequality on actual graphs.

This is a diagnostic for an auxiliary conjecture, not a Merino--Welsh proof.
Input: the public NetworkX graph-atlas data (all graphs through seven vertices).
Exact counts and rational effective resistances are used.  Exponent comparison
is by integer powers, after cheap integer-exponent bounds.
"""
from collections import Counter
from fractions import Fraction
from itertools import combinations
from pathlib import Path
import hashlib
import json
import math
import sympy as sp

HERE = Path(__file__).resolve().parent


def atlas():
    data = (HERE / "graph-atlas.dat").read_text()
    for block in data.split("GRAPH ")[1:]:
        lines = block.splitlines()
        yield int(lines[0]), int(lines[1].split()[1]), [
            tuple(map(int, line.split())) for line in lines[2:] if line
        ]


def components(n, edges):
    p = list(range(n))
    k = n
    for u, v in edges:
        while p[u] != u:
            u = p[u]
        while p[v] != v:
            v = p[v]
        if u != v:
            p[u] = v
            k -= 1
    return k


def acyclic_counts(n, edges, pairs):
    """Return A and counts D_uv of acyclic orientations with comparable terminals."""
    total = 0
    comparable = [0] * len(pairs)
    # Reversal pairs every orientation; fix the first edge's direction.
    for mask in range(1 << (len(edges) - 1)):
        reach = [0] * n
        u, v = edges[0]
        reach[u] |= 1 << v
        for j, (u, v) in enumerate(edges[1:]):
            if mask >> j & 1:
                u, v = v, u
            reach[u] |= 1 << v
        for k in range(n):
            bit, row = 1 << k, reach[k]
            for i in range(n):
                if reach[i] & bit:
                    reach[i] |= row
        if any(reach[i] >> i & 1 for i in range(n)):
            continue
        total += 2
        for j, (u, v) in enumerate(pairs):
            if (reach[u] >> v & 1) or (reach[v] >> u & 1):
                comparable[j] += 2
    return total, comparable


def cyclic_polynomial(n, edges):
    """C after replacing each edge by q parallels is sum coeff[k]*(2**q-1)**k."""
    coeff = [0] * (len(edges) + 1)
    for mask in range(1 << len(edges)):
        k = components(n, [e for j, e in enumerate(edges) if mask >> j & 1])
        coeff[mask.bit_count()] += (-1) ** (k - 1)
    return coeff


def tree_resistances(n, edges, pairs):
    lap = sp.zeros(n - 1)
    for u, v in edges:
        if u < n - 1:
            lap[u, u] += 1
        if v < n - 1:
            lap[v, v] += 1
        if max(u, v) < n - 1:
            lap[u, v] -= 1
            lap[v, u] -= 1
    trees = int(lap.det())
    inv = lap.inv()
    resistances = []
    for u, v in pairs:
        z = sp.zeros(n - 1, 1)
        if u < n - 1:
            z[u] += 1
        if v < n - 1:
            z[v] -= 1
        r = (z.T * inv * z)[0]
        resistances.append(Fraction(int(sp.numer(r)), int(sp.denom(r))))
    return trees, resistances


def cmp_exp2(lhs, exponent):
    """Exact sign(lhs - 2**exponent) for positive rational lhs and rational exponent."""
    lo = exponent.numerator // exponent.denominator
    hi = -(-exponent.numerator // exponent.denominator)
    power = lambda k: Fraction(2 ** k) if k >= 0 else Fraction(1, 2 ** (-k))
    if lhs < power(lo):
        return -1
    if lhs > power(hi):
        return 1
    a = pow(lhs.numerator, exponent.denominator)
    b = pow(lhs.denominator, exponent.denominator)
    if exponent.numerator >= 0:
        b <<= exponent.numerator
    else:
        a <<= -exponent.numerator
    return (a > b) - (a < b)


def main():
    counts = Counter()
    equalities = []
    failures = []
    least_strict = None
    for index, n, edges in atlas():
        if n < 3 or len(edges) > 12 or components(n, edges) != 1:
            continue
        pairs = [p for p in combinations(range(n), 2) if p not in edges and p[::-1] not in edges]
        if not pairs:
            continue
        counts["base_graphs"] += 1
        a, ds = acyclic_counts(n, edges, pairs)
        coeff = cyclic_polynomial(n, edges)
        trees, resistances = tree_resistances(n, edges, pairs)
        for multiplicity in (1, 2):
            c = sum(v * (2 ** multiplicity - 1) ** j for j, v in enumerate(coeff))
            if c == 0:
                continue  # Exactly the simple graphs with a bridge.
            counts[f"bridgeless_graphs_q{multiplicity}"] += 1
            t = trees * multiplicity ** (n - 1)
            for pair, d, r in zip(pairs, ds, resistances):
                r /= multiplicity
                lhs = Fraction(d * c, t * t)
                exponent = 1 - 2 * r
                sign = cmp_exp2(lhs, exponent)
                counts[f"terminal_pairs_q{multiplicity}"] += 1
                record = {"atlas_index": index, "n": n, "edges": edges,
                          "multiplicity": multiplicity, "terminals": pair,
                          "A": a, "A_minus_Aquot": d, "C": c, "t": t,
                          "R": str(r), "lhs": str(lhs), "exponent": str(exponent)}
                if sign < 0:
                    failures.append(record)
                elif sign == 0:
                    equalities.append(record)
                else:
                    gap = math.log2(float(lhs)) - float(exponent)
                    if least_strict is None or gap < least_strict[0]:
                        least_strict = (gap, record)
        if index % 100 == 0:
            print(index, dict(counts), "failures", len(failures), flush=True)
    result = {"status": "bounded exact diagnostic only; auxiliary statement unproved",
              "input_sha256": hashlib.sha256((HERE / "graph-atlas.dat").read_bytes()).hexdigest(),
              "compressed_source_sha256": "73fc416df0164923607751cb759f4ae81deb5f6550bf25be59c86de3b747e41d",
              "input_url": "https://raw.githubusercontent.com/networkx/networkx/main/networkx/generators/atlas.dat.gz",
              "range": "Atlas connected graphs n<=7, simple-core edges<=12; each edge multiplicity1 or uniformly2; all nonadjacent terminal pairs",
              "counts": dict(counts), "failures": failures, "equality_count": len(equalities),
              "equality_example": equalities[:1], "least_strict_log2_gap": least_strict}
    (HERE / "pair-coupling-check.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2), flush=True)


if __name__ == "__main__":
    main()
