"""Exact simplicial witness for the E774 ternary-minimal/circuit distinction.

No numerical search and no bounty solution.  All arithmetic is integral.
The accompanying proof gives the uniform family; this script checks its
explicit combinatorial realization and selected join instances.
"""
from __future__ import annotations

from collections import defaultdict, deque
from itertools import combinations
from pathlib import Path
import hashlib
import json


def canonical(vertices):
    vertices = tuple(vertices)
    assert len(set(vertices)) == len(vertices)
    inversions = sum(vertices[i] > vertices[j]
                     for i in range(len(vertices))
                     for j in range(i + 1, len(vertices)))
    return tuple(sorted(vertices)), (-1) ** inversions


def boundary(vertices):
    return [(vertices[:i] + vertices[i+1:], (-1) ** i)
            for i in range(len(vertices))]


def annulus(outer, inner):
    a, b, c = outer
    u, v, w = inner
    return [(a, b, v), (a, v, u), (b, c, w),
            (b, w, v), (c, a, u), (c, u, w)]


def bipyramid(vertices):
    north, south, *ring = vertices
    assert len(ring) >= 3
    out = []
    for i, a in enumerate(ring):
        b = ring[(i + 1) % len(ring)]
        out.append((north, a, b))
        out.append((south, b, a))
    return out


def relation_matrix(m):
    rows = [[0] * (3 * m + 1) for _ in range(2 * m)]
    for j in range(m):
        rows[2*j][0] = 1
        rows[2*j][3*j + 1] = -2
        rows[2*j][3*j + 2] = 1
        rows[2*j + 1][0] = 3
        rows[2*j + 1][3*j + 1] = -4
        rows[2*j + 1][3*j + 3] = 1
    return rows


def make_base(m):
    assert m >= 1
    loops = [tuple(range(3*j, 3*j + 3)) for j in range(2*m)]
    next_vertex = 6*m
    entries = []
    matrix = relation_matrix(m)

    def fresh(count):
        nonlocal next_vertex
        out = tuple(range(next_vertex, next_vertex + count))
        next_vertex += count
        return out

    def add(face, group):
        simplex, sign = canonical(face)
        entries.append({"simplex": simplex, "sign": sign, "group": group})

    def surface(group, ring_size):
        sphere = bipyramid(fresh(ring_size + 2))
        holes = []
        for j, row in enumerate(matrix):
            coefficient = row[group]
            holes.extend([(j, 1 if coefficient > 0 else -1)] * abs(coefficient))
        assert len(holes) <= len(sphere)
        for index, outer in enumerate(sphere):
            if index >= len(holes):
                add(outer, group)
                continue
            loop, required_sign = holes[index]
            middle = fresh(3)
            inner = loops[loop]
            # The two-annulus patch has boundary d(outer)-d(inner).
            # It replaces an oriented sphere face whose old contribution
            # cancels the rest of the sphere.  Thus this hole contributes
            # -d(inner), and reversing inner gives a positive loop.
            if required_sign > 0:
                inner = (inner[0], inner[2], inner[1])
            for face in annulus(outer, middle) + annulus(middle, inner):
                add(face, group)

    surface(0, 2*m + 2)
    for j in range(m):
        surface(3*j + 1, 4)
        add(loops[2*j], 3*j + 2)
        add(loops[2*j + 1], 3*j + 3)
    entries.sort(key=lambda e: e["simplex"])
    return {"m": m, "k": 3, "loops": loops, "matrix": matrix, "entries": entries}


def incidence(entries):
    rows = defaultdict(list)
    for i, entry in enumerate(entries):
        for face, sign in boundary(entry["simplex"]):
            rows[face].append((i, sign))
    return dict(rows)


def verify_base(data):
    m = data["m"]
    entries = data["entries"]
    simplices = [e["simplex"] for e in entries]
    assert len(simplices) == len(set(simplices)) == 124*m + 4
    vertices = set().union(*map(set, simplices))
    assert len(vertices) == 44*m + 4
    rows = incidence(entries)
    assert len(rows) == 174*m + 6
    loop_rows = {}
    for j, loop in enumerate(data["loops"]):
        for edge, sign in boundary(loop):
            assert edge not in loop_rows
            loop_rows[edge] = (j, sign)
    graph = [set() for _ in entries]
    actual = [[0] * (3*m + 1) for _ in rows]
    for row_index, (edge, incidences) in enumerate(rows.items()):
        for index, boundary_sign in incidences:
            e = entries[index]
            actual[row_index][e["group"]] += boundary_sign * e["sign"]
        if edge in loop_rows:
            j, loop_sign = loop_rows[edge]
            assert actual[row_index] == [loop_sign*x for x in data["matrix"][j]]
        else:
            assert len(incidences) == 2
            (i, si), (j, sj) = incidences
            assert entries[i]["group"] == entries[j]["group"]
            assert si * entries[i]["sign"] + sj * entries[j]["sign"] == 0
            assert not any(actual[row_index])
            graph[i].add(j)
            graph[j].add(i)
    assert set(loop_rows) <= set(rows)
    group_sizes = []
    for group in range(3*m + 1):
        ids = {i for i, e in enumerate(entries) if e["group"] == group}
        assert ids
        seen = {next(iter(ids))}
        todo = deque(seen)
        while todo:
            for j in graph[todo.popleft()] - seen:
                seen.add(j)
                todo.append(j)
        assert seen == ids, ("disconnected private-edge dual graph", group)
        group_sizes.append(len(ids))
    assert group_sizes[0] == 48*m + 4
    for j in range(m):
        assert group_sizes[3*j+1:3*j+4] == [74, 1, 1]
    return {
        "m": m, "k": 3, "vertices": len(vertices), "edges": len(rows),
        "facets": len(entries), "group_sizes": group_sizes,
        "private_edge_components": len(group_sizes),
        "reduced_matrix_rows": len(data["matrix"]),
        "rational_nullity": m + 1,
        "private_edge_connectivity_and_boundary_identity": "PASS",
    }


def lift_join(data, k):
    assert k >= 3
    if k == 3:
        return data
    entries = data["entries"]
    start = max(v for e in entries for v in e["simplex"]) + 1
    block = tuple(range(start, start + k - 2))
    joined = []
    for entry in entries:
        for factor, sign in boundary(block):
            joined.append({
                "simplex": entry["simplex"] + factor,
                "sign": entry["sign"] * sign,
                "group": entry["group"],
            })
    joined.sort(key=lambda e: e["simplex"])
    return {**data, "k": k, "entries": joined, "join_vertices": block}


def rank_mod_prime(rows, entries_count, prime=101):
    pivots = {}
    for incidences in rows.values():
        row = {j: c % prime for j, c in incidences if c % prime}
        while row:
            p = min(row)
            if p not in pivots:
                inv = pow(row[p], -1, prime)
                pivots[p] = {j: (c * inv) % prime for j, c in row.items()}
                break
            multiple = row[p]
            for j, c in pivots[p].items():
                new = (row.get(j, 0) - multiple * c) % prime
                if new:
                    row[j] = new
                elif j in row:
                    del row[j]
    return len(pivots)


def verify_kernel_and_rank(data):
    m, k, entries = data["m"], data["k"], data["entries"]
    rows = incidence(entries)
    size = len(entries)
    if k > 3:
        assert size == (124*m + 4) * (k - 2)
        assert len(set().union(*(set(e["simplex"]) for e in entries))) == k + 44*m + 2
    # Basis in reduced coordinates: a=1, and each individual b_j=1.
    reduced_basis = [[1] * (3*m + 1)]
    for j in range(m):
        v = [0] * (3*m + 1)
        v[3*j+1:3*j+4] = [1, 2, 4]
        reduced_basis.append(v)
    for vector in reduced_basis:
        expanded = [e["sign"] * vector[e["group"]] for e in entries]
        assert all(sum(c * expanded[i] for i, c in inc) == 0
                   for inc in rows.values())
    # Independence follows from one central-group coordinate and one
    # coordinate in each negative group.  A modular rank lower bound
    # then certifies that this explicit rational kernel basis is complete.
    rank = rank_mod_prime(rows, size)
    assert rank == size - m - 1
    return {
        "m": m, "k": k, "facets": size, "boundary_rows": len(rows),
        "modular_prime": 101, "modular_rank": rank,
        "independent_integer_kernel_vectors": m + 1,
        "exact_rational_nullity": m + 1, "result": "PASS",
    }


def main():
    output = Path(__file__).resolve().parent
    reports = []
    for m in (1, 2):
        base = make_base(m)
        reports.append(verify_base(base))
        reports.append(verify_kernel_and_rank(base))
        reports.append(verify_kernel_and_rank(lift_join(base, 4)))
        if m == 1:
            witness = {
                "description": "Explicit simplicial base; no E774 solution",
                **base,
            }
            text = json.dumps(witness, separators=(",", ":")) + "\n"
            path = output / "erdos774-simplicial-minimality-witness.json"
            path.write_text(text)
            witness_hash = hashlib.sha256(text.encode()).hexdigest()
    result = {
        "scope": "explicit construction verification, not enumeration or a bounty solution",
        "general_claim_proved_in_companion_note": True,
        "full_bounty_solutions": 0,
        "witness_sha256": witness_hash,
        "reports": reports,
        "result": "PASS",
    }
    (output / "erdos774-simplicial-minimality-check.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()

