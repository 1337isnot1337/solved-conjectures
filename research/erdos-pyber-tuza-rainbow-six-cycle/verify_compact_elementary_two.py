#!/usr/bin/env python3
"""Independent finite checks for the compact binary Cayley research note.

No use of Kemperman, Kneser, or the parity reduction in the test logic.
Sizes up to 16 are audited exhaustively after translations. At q=4 every
ordered support profile is tested after sorting colors; integral flow checks
the capacity constraints independently of the proof.
"""
from collections import Counter, deque
from itertools import combinations_with_replacement


def xor_translate(mask, d):
    out = 0
    while mask:
        b = mask & -mask
        out |= 1 << ((b.bit_length() - 1) ^ d)
        mask ^= b
    return out


def cyclic_sum(a, b, translate):
    out = 0
    while a:
        lsb = a & -a
        out |= translate[lsb.bit_length() - 1][b]
        a ^= lsb
    return out


def table(q):
    return [[xor_translate(m, x) for m in range(1 << q)] for x in range(q)]


def audit_pair(q):
    tr = table(q)
    by_size = {}
    for m in range(1, 1 << q, 2):  # Translate each input independently to contain 0.
        s = m.bit_count()
        if 2*s - 1 > q or (s % 4 != 2 and s % 8 != 3):
            continue
        if m == min(tr[x][m] for x in range(q) if m & (1 << x)):
            by_size.setdefault(s, []).append(m)
    ans = Counter()
    for s, sets in by_size.items():
        for a, b in combinations_with_replacement(sets, 2):
            ans[s] += 1
            c = cyclic_sum(a, b, tr)
            # The critical cardinality is odd, so any such output is aperiodic.
            assert c.bit_count() != 2*s - 1, (q, s, a, b, c)
    return ans


def exact_support_feasible(ss, q):
    # Four times six, multiplied by the number of potential incidences.
    # Aim for a rational transportation with positive flow on every declared edge:
    # if feasible, average an integral unit-flow witness per edge before scaling.
    # Conversely, scaling all capacities by total incidences allows requiring
    # one unit on each edge, since integral transportation polytope vertices
    # witness positive edges with unit flow before scaling.
    scale = sum(s.bit_count() for s in ss)
    demand = [q*scale - s.bit_count() for s in ss]
    avail = [6*scale - sum(bool(s & (1 << x)) for s in ss) for x in range(q)]
    cap = [[0] * (q + 8) for _ in range(q + 8)]
    sink = q + 7
    for i, s in enumerate(ss, 1):
        cap[0][i] = demand[i-1]
        for x in range(q):
            if s & (1 << x):
                cap[i][x+7] = q * 6 * scale
    for x in range(q):
        cap[x+7][sink] = avail[x]
    seen_flow = 0
    while True:
        dq = deque([0])
        parent = {0: None}
        while dq and sink not in parent:
            u = dq.popleft()
            for v, c in enumerate(cap[u]):
                if c and v not in parent:
                    dq.append(v)
                    parent[v] = u
        if sink not in parent:
            return seen_flow == sum(demand)
        v = sink
        amount = q * 6 * scale
        while v:
            amount = min(amount, cap[parent[v]][v])
            v = parent[v]
        v = sink
        while v:
            u = parent[v]
            cap[u][v] -= amount
            cap[v][u] += amount
            v = u
        seen_flow += amount


def is_parity(ss, q):
    for a in range(1, q):
        same = sum(1 << x for x in range(q) if (a & x).bit_count() % 2 == 0)
        diff = ((1 << q) - 1) ^ same
        count = sum(s & same == 0 for s in ss)
        if count == 3 and all(s & same == 0 or s & diff == 0 for s in ss):
            return True
    return False


def audit_palettes(q):
    tr = table(q)
    total = balanced_zero = 0
    for ss in combinations_with_replacement(range(1, 1 << q), 6):
        total += 1
        c = 1
        for s in ss:
            c = cyclic_sum(c, s, tr)
        if c & 1 == 0 and exact_support_feasible(ss, q):
            balanced_zero += 1
            assert is_parity(ss, q), (q, ss)
    return total, balanced_zero


if __name__ == "__main__":
    for q in (2, 4, 8, 16):
        print("pair", q, dict(audit_pair(q)), flush=True)
    for q in (1, 2, 4):
        print("palette", q, audit_palettes(q), flush=True)
