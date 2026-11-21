#!/usr/bin/env python3
"""Bounded exact counterexample search in a small face family.

This looks for a counterexample to the full period claim. An unsuccessful
search does not settle that claim or receive completion credit.
"""
import itertools
import json
import time
from pathlib import Path

from search_nussbaum_orbit import verify


def cyclic_automorphism(adj, seconds=30):
    n = len(adj)
    full = (1 << n) - 1
    signatures = [[(int(bool(adj[i] & (1 << j))),
                    (adj[i] & adj[j]).bit_count())
                   for j in range(n)] for i in range(n)]
    rel = []
    for i in range(n):
        by_sig = {}
        for j in range(n):
            if i != j:
                sig = signatures[i][j]
                by_sig[sig] = by_sig.get(sig, 0) | (1 << j)
        rel.append(by_sig)
    mapping = {}
    nodes = 0
    start = time.monotonic()

    def rec(domains, unused):
        nonlocal nodes
        nodes += 1
        if time.monotonic() - start > seconds:
            raise TimeoutError
        if len(mapping) == n:
            return dict(mapping)
        u = min((i for i in range(n) if i not in mapping),
                key=lambda i: (domains[i] & unused).bit_count())
        choices = domains[u] & unused
        while choices:
            bit = choices & -choices
            choices -= bit
            v = bit.bit_length() - 1
            # A proper directed cycle in the partial permutation can never
            # become the required one cycle of length n.
            tail, length = v, 1
            while tail in mapping:
                tail = mapping[tail]
                length += 1
            if tail == u and length < n:
                continue
            mapping[u] = v
            rem = unused ^ bit
            next_domains = domains[:]
            good = True
            equal_domains = {}
            for w in range(n):
                if w in mapping:
                    continue
                next_domains[w] &= rem & rel[v].get(signatures[u][w], 0)
                if not next_domains[w]:
                    good = False
                    break
                d = next_domains[w]
                equal_domains[d] = equal_domains.get(d, 0) + 1
                if equal_domains[d] > d.bit_count():
                    good = False
                    break
            if good:
                result = rec(next_domains, rem)
                if result is not None:
                    return result
            del mapping[u]
        return None

    try:
        found = rec([full ^ (1 << i) for i in range(n)], full)
        complete = True
    except TimeoutError:
        found, complete = None, False
    return found, complete, nodes, time.monotonic() - start


def main():
    here = Path(__file__).resolve().parent
    data = json.loads((here / 'nussbaum-n4-two-star-regular.json').read_text())
    states = [tuple(x) for x in data['states']]
    index = {x: i for i, x in enumerate(states)}
    cube_permutations = []
    for pi in itertools.permutations(range(4)):
        for flips in itertools.product((0, 1), repeat=4):
            permutation = []
            for x in states:
                y = tuple(-1 if x[pi[j]] == -1 else x[pi[j]] ^ flips[j]
                          for j in range(4))
                permutation.append(index[y])
            cube_permutations.append(permutation)
    covered, rows = {}, []
    for period, candidates in data['regular_candidates'].items():
        period = int(period)
        for missing, degree in candidates:
            if missing in covered:
                rows.append({'period': period, 'missing_mask': missing,
                             'cube_isomorphic_to': covered[missing]})
                continue
            removed = [i for i in range(24) if missing & (1 << i)]
            for pi in cube_permutations:
                covered[sum(1 << pi[i] for i in removed)] = missing
            ids = [i for i in range(24) if not missing & (1 << i)]
            subset = [states[i] for i in ids]
            adj = []
            for i, x in enumerate(subset):
                adj.append(sum(1 << j for j, y in enumerate(subset)
                               if i != j and all(a == -1 or b == -1 or a == b
                                                 for a, b in zip(x, y))))
            mapping, complete, nodes, elapsed = cyclic_automorphism(adj)
            row = {'period': period, 'missing_mask': missing,
                   'search_complete': complete, 'search_nodes': nodes,
                   'seconds': elapsed, 'candidate': None}
            if mapping is not None:
                order, v = [], 0
                while v not in order:
                    order.append(v)
                    v = mapping[v]
                assert len(order) == period and v == 0
                orbit = [subset[i] for i in order]
                row['candidate'] = {'states': orbit,
                                    **verify(orbit, 4, period)}
            rows.append(row)
            print({k: v for k, v in row.items() if k != 'candidate'}, flush=True)
            if not complete or mapping is not None:
                break
    record = {'results': rows,
              'scope': 'No positive finite check is a completed paid target.'}
    (here / 'nussbaum-n4-two-star-automorphisms.json').write_text(
        json.dumps(record, indent=2) + '\n')


if __name__ == '__main__':
    main()
