"""Finite regression checks for the directed-Hamiltonicity layer lemmas.

This is not a proof of any asymptotic circuit lower bound.
"""

from collections import Counter
from itertools import combinations, permutations, product
from math import comb, factorial


def cycles(m):
    edges = [(u, v) for u in range(m) for v in range(m) if u != v]
    index = {e: i for i, e in enumerate(edges)}
    masks = []
    for tail in permutations(range(1, m)):
        order = (0,) + tail
        masks.append(sum(1 << index[order[i], order[(i + 1) % m]] for i in range(m)))
    return edges, masks


def mobius(values, n):
    out = values[:]
    for bit in range(n):
        for mask in range(1 << n):
            if mask & (1 << bit):
                out[mask] -= out[mask ^ (1 << bit)]
    return out


def check_layers(m):
    edges, hs = cycles(m)
    n = len(edges)
    hs_set = set(hs)
    count = [sum((h & mask) == h for h in hs) for mask in range(1 << n)]
    exact = [int(mask in hs_set) for mask in range(1 << n)]
    contains = [int(k > 0) for k in count]
    exact_coeff = mobius(exact, n)
    contains_coeff = mobius(contains, n)
    inclusion = [0] * (1 << n)
    for family in range(1, 1 << len(hs)):
        union = 0
        for i, h in enumerate(hs):
            if family & (1 << i):
                union |= h
        inclusion[union] += 1 if family.bit_count() % 2 else -1
    assert inclusion == contains_coeff
    for mask in range(1 << n):
        d = mask.bit_count()
        expected_exact = 0 if d < m else (-1) ** (d - m) * count[mask]
        assert exact_coeff[mask] == expected_exact
        if d <= m:
            assert contains_coeff[mask] == exact_coeff[mask]
        if d in (m + 1, m + 2):
            assert contains_coeff[mask] == 0
        if d == m + 3:
            assert count[mask] <= 2
            assert contains_coeff[mask] == -int(count[mask] == 2)
    hist = Counter()
    for mask, coefficient in enumerate(contains_coeff):
        if coefficient:
            hist[mask.bit_count()] += 1
    return {"vertices": m, "graphs": 1 << n, "nonzero_contains_coefficients_by_degree": dict(sorted(hist.items()))}


def check_first_correction(m):
    _, hs = cycles(m)
    first_unions = [a | b for a, b in combinations(hs, 2) if (a | b).bit_count() == m + 3]
    expected = factorial(m - 1) * comb(m, 3) // 2
    assert len(first_unions) == len(set(first_unions)) == expected
    return {"vertices": m, "first_overlap_monomials": expected}


def check_restriction(m):
    edges, hs = cycles(m)
    n = m + 2
    new_edges, new_hs = cycles(n)
    new_index = {e: i for i, e in enumerate(new_edges)}
    a, b, c = 0, m, m + 1
    fixed = [(a, b), (b, c), (b, a)]
    fixed_mask = sum(1 << new_index[e] for e in fixed)
    mapping = [(c if u == 0 else u, a if v == 0 else v) for u, v in edges]
    embedded_masks = [1 << new_index[e] for e in mapping]
    for mask in range(1 << len(edges)):
        image = fixed_mask
        for i, e in enumerate(embedded_masks):
            if mask & (1 << i):
                image |= e
        original_count = sum((h & mask) == h for h in hs)
        image_count = sum((h & image) == h for h in new_hs)
        assert original_count == image_count
        assert image not in new_hs
    return {"vertices": m, "image_vertices": n, "restrictions_checked": 1 << len(edges)}


def outgoing_choice_decision(m, edges, mask, cutoff):
    """An independent sparse-excess algorithm, without listing known cycles."""
    if mask.bit_count() > m + cutoff:
        return False
    neighbors = [[] for _ in range(m)]
    for i, (u, v) in enumerate(edges):
        if mask & (1 << i):
            neighbors[u].append(v)
    if any(not ns for ns in neighbors):
        return False
    choices = 1
    for ns in neighbors:
        choices *= len(ns)
    assert choices <= 2 ** (mask.bit_count() - m) <= 2**cutoff
    for successor in product(*neighbors):
        current = 0
        visited = set()
        for _ in range(m):
            if current in visited:
                break
            visited.add(current)
            current = successor[current]
        if len(visited) == m and current == 0:
            return True
    return False


def row_degree(edges, mask, vertex):
    return sum(u == vertex and bool(mask & (1 << i)) for i, (u, _) in enumerate(edges))


def mixed_radix_successor(edges, mask, choice, vertex):
    """Decode on demand by input scans; do not store a successor vector."""
    quotient = choice
    for u in range(vertex):
        degree = row_degree(edges, mask, u)
        assert degree > 0
        quotient //= degree
    degree = row_degree(edges, mask, vertex)
    assert degree > 0
    digit = quotient % degree
    for i, (u, v) in enumerate(edges):
        if u == vertex and mask & (1 << i):
            if digit == 0:
                return v
            digit -= 1
    raise AssertionError("Mixed-radix digit did not select an outgoing arc")


def mixed_radix_sparse_decision(m, edges, mask, cutoff):
    """Sparse decision using only on-demand successors and first return."""
    if mask.bit_count() > m + cutoff:
        return False
    choices = 1
    for vertex in range(m):
        degree = row_degree(edges, mask, vertex)
        if degree == 0:
            return False
        choices *= degree
    for choice in range(choices):
        current = 0
        for step in range(1, m + 1):
            current = mixed_radix_successor(edges, mask, choice, current)
            if current == 0:
                if step == m:
                    return True
                break
    return False


def check_mixed_radix_choices(m, edges, mask, cutoff):
    """Finite checker may store all choices; the decision routine does not."""
    if mask.bit_count() > m + cutoff:
        return
    neighbors = [
        [v for i, (u, v) in enumerate(edges) if u == vertex and mask & (1 << i)]
        for vertex in range(m)
    ]
    if any(not row for row in neighbors):
        return
    expected = set(product(*neighbors))
    decoded = {
        tuple(mixed_radix_successor(edges, mask, choice, vertex) for vertex in range(m))
        for choice in range(len(expected))
    }
    assert decoded == expected


def check_sparse_prefix(m, c):
    edges, hs = cycles(m)
    n = len(edges)
    cutoff = (m**c).bit_length() - 1
    contains = [int(any((h & mask) == h for h in hs)) for mask in range(1 << n)]
    sparse = [int(outgoing_choice_decision(m, edges, mask, cutoff)) for mask in range(1 << n)]
    expected = [value * int(mask.bit_count() <= m + cutoff) for mask, value in enumerate(contains)]
    assert sparse == expected
    mixed_radix = [int(mixed_radix_sparse_decision(m, edges, mask, cutoff)) for mask in range(1 << n)]
    assert mixed_radix == expected
    for mask in range(1 << n):
        check_mixed_radix_choices(m, edges, mask, cutoff)
    monotone = [
        int(mask.bit_count() > m + cutoff or outgoing_choice_decision(m, edges, mask, cutoff))
        for mask in range(1 << n)
    ]
    expected_monotone = [
        int(value or mask.bit_count() > m + cutoff) for mask, value in enumerate(contains)
    ]
    assert monotone == expected_monotone
    monotonicity_pairs = 0
    for mask in range(1 << n):
        for i in range(n):
            if not mask & (1 << i):
                assert monotone[mask] <= monotone[mask | (1 << i)]
                monotonicity_pairs += 1
    contains_coeff = mobius(contains, n)
    sparse_coeff = mobius(sparse, n)
    monotone_coeff = mobius(monotone, n)
    for mask in range(1 << n):
        if mask.bit_count() <= m + cutoff:
            assert sparse_coeff[mask] == contains_coeff[mask]
            assert monotone_coeff[mask] == contains_coeff[mask]
    return {
        "vertices": m, "c": c, "cutoff_excess": cutoff, "graphs": 1 << n,
        "monotone_cutoff_cover_pairs": monotonicity_pairs,
    }


if __name__ == "__main__":
    import json

    print(json.dumps({
        "layers": [check_layers(m) for m in (2, 3, 4)],
        "first_overlap": [check_first_correction(m) for m in (3, 4, 5, 6)],
        "restriction": [check_restriction(m) for m in (2, 3, 4)],
        "sparse_prefix": [check_sparse_prefix(m, c) for m in (2, 3, 4) for c in (0, 1, 2)],
    }, indent=2))
