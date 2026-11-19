#!/usr/bin/env python3
"""Produce untrusted, exhaustive witnesses for the six-coordinate plane gap.

Every emitted pair is checked independently by a small Python replay here.
Acceptance still requires Lean source checking, the all-owned axiom audit,
and stock-kernel replay. This producer is not part of the trusted proof.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path


BASES = ((1, 2, 3, 4, 5), (1, 3, 4, 5, 9))
CANONICAL = tuple(tuple(sorted(base + (d,))) for base in BASES for d in base)
PAIRS = tuple(itertools.combinations(range(6), 2))
PERMUTATIONS = tuple(itertools.permutations(range(6)))
POSITIVE = tuple(tuple(sorted(set(itertools.permutations(q)))) for q in CANONICAL)
assert all(len(rows) == 360 for rows in POSITIVE)
RANK_TO_ROW = tuple(
    tuple({v: k for k, v in enumerate(rows)}[tuple(q[i] for i in p)]
          for p in PERMUTATIONS)
    for q, rows in zip(CANONICAL, POSITIVE)
)


def signed(v: tuple[int, ...], mask: int) -> tuple[int, ...]:
    return (v[0],) + tuple(x if mask & (1 << (i - 1)) else -x
                           for i, x in enumerate(v[1:], 1))


def critical(u: tuple[int, ...]) -> bool:
    values = {abs(x) for x in u}
    m = min(values)
    return any(values == {m * b for b in base} for base in BASES)


def line(q: tuple[int, ...], c: tuple[int, ...], i: int, j: int,
         epsilon: int) -> tuple[int, ...]:
    a, b = q[i] - epsilon * q[j], c[i] - epsilon * c[j]
    return tuple(a * y - b * x for x, y in zip(q, c))


def standard(kind: int, s: int, t: int) -> tuple[int, ...]:
    if kind < 2:
        return tuple(k * s for k in BASES[kind]) + (t,)
    return (s, t, s + t, 2 * s + t, 3 * s + t, 3 * s + 2 * t)


def acceptance_check(q: tuple[int, ...], c: tuple[int, ...], witness: dict) -> bool:
    kind, p, mask = witness['kind'], witness['permutation'], witness['mask']
    if kind not in range(3) or sorted(p) != list(range(6)) or mask not in range(64):
        return False
    for v in (q, c):
        w = tuple(v[p[i]] if mask & (1 << i) else -v[p[i]] for i in range(6))
        if w != standard(kind, w[0], w[1] if kind == 2 else w[5]):
            return False
    return True


def acceptance(q: tuple[int, ...], c: tuple[int, ...]) -> dict:
    rows = tuple(zip(q, c))
    lookup = {tuple(e * x for x in row): (i, e)
              for i, row in enumerate(rows) for e in (1, -1)}
    assert len(lookup) == 12
    for kind in range(3):
        for p0 in range(6):
            for e0 in (1, -1):
                s = tuple(e0 * x for x in rows[p0])
                choices = ((0, 1),) if kind < 2 else itertools.product(range(6), (1, -1))
                for p1, e1 in choices:
                    if kind == 2 and p0 == p1:
                        continue
                    t = tuple(e1 * x for x in rows[p1])
                    columns = tuple(zip(standard(kind, s[0], t[0]),
                                        standard(kind, s[1], t[1])))
                    desired = columns[:5] if kind < 2 else columns
                    matched = [lookup.get(row) for row in desired]
                    if any(item is None for item in matched):
                        continue
                    indices = [item[0] for item in matched]
                    if len(set(indices)) != len(indices):
                        continue
                    if kind < 2:
                        matched.append((next(i for i in range(6) if i not in indices), 1))
                    witness = {'kind': kind, 'permutation': [item[0] for item in matched],
                               'mask': sum(1 << i for i, item in enumerate(matched) if item[1] == 1)}
                    assert acceptance_check(q, c, witness)
                    return witness
    raise ValueError(f'No critical-plane witness for {q}, {c}')


def reject(q: tuple[int, ...], c: tuple[int, ...]) -> int | None:
    if all(y == c[0] * x for x, y in zip(q, c)):
        return 0
    for k, (i, j) in enumerate(PAIRS):
        if q[i] == q[j] and c[i] == c[j]:
            return 1 + 2 * k
    for k, (i, j) in enumerate(PAIRS):
        for bit, epsilon in enumerate((1, -1)):
            u = line(q, c, i, j, epsilon)
            if all(u) and not critical(u):
                return 31 + 2 * k + bit
    return None


def replay(q: tuple[int, ...], c: tuple[int, ...], code: int,
           acceptances: list[dict]) -> bool:
    if code == 0:
        return all(y == c[0] * x for x, y in zip(q, c))
    if code <= 30:
        k, bit = divmod(code - 1, 2)
        i, j = PAIRS[k]
        epsilon = 1 if bit == 0 else -1
        return i < j and q[i] == epsilon * q[j] and c[i] == epsilon * c[j]
    if code <= 60:
        k, bit = divmod(code - 31, 2)
        i, j = PAIRS[k]
        u = line(q, c, i, j, 1 if bit == 0 else -1)
        return i < j and all(u) and not critical(u)
    return acceptance_check(q, c, acceptances[code - 61])


def packed(values: tuple[int, ...] | list[int], bits: int) -> int:
    assert all(0 <= x < (1 << bits) for x in values)
    return sum(x << (bits * i) for i, x in enumerate(values))


def sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--original-survivors', type=Path)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)
    stream = bytearray()
    acceptances: list[dict] = []
    acceptance_ids: dict[tuple, int] = {}
    counts: Counter = Counter()
    survivors: list[dict] = []
    for qi, q in enumerate(CANONICAL):
        for cj, rows in enumerate(POSITIVE):
            for row_id, positive in enumerate(rows):
                for mask in range(32):
                    c = signed(positive, mask)
                    code = reject(q, c)
                    if code is None:
                        witness = acceptance(q, c)
                        key = (witness['kind'], tuple(witness['permutation']), witness['mask'])
                        if key not in acceptance_ids:
                            acceptance_ids[key] = len(acceptances)
                            acceptances.append(witness)
                        code = 61 + acceptance_ids[key]
                        survivors.append({'first': qi, 'second': cj, 'row': row_id,
                                          'mask': mask, 'acceptance': code - 61})
                    assert replay(q, c, code, acceptances), (qi, cj, row_id, mask, code)
                    assert code < 256, 'Expand the code width instead of dropping witnesses'
                    stream.append(code)
                    counts['dependent' if code == 0 else 'coordinate' if code <= 30
                           else 'line' if code <= 60 else 'accepted'] += 1
        print(json.dumps({'first': qi, 'pairs': len(stream), 'counts': dict(counts)}), flush=True)
    assert len(stream) == 10 * 10 * 360 * 32 == 1152000
    assert counts['accepted'] == len(survivors) == 190
    if args.original_survivors:
        old = set()
        for row in args.original_survivors.read_text().splitlines():
            values = tuple(map(int, row.split()))
            assert len(values) == 12
            q, c = values[:6], values[6:]
            p = sorted(range(6), key=q.__getitem__)
            old.add((tuple(q[i] for i in p), tuple(c[i] for i in p)))
        new = {(CANONICAL[s['first']], signed(POSITIVE[s['second']][s['row']], s['mask']))
               for s in survivors}
        assert len(old) == 190 and new == old
    (args.out / 'pair-codes.bin').write_bytes(stream)
    data = {'canonical': CANONICAL,
            'positive_packed': [[packed(v, 4) for v in rows] for rows in POSITIVE],
            'rank_to_row': RANK_TO_ROW, 'acceptances': acceptances, 'survivors': survivors}
    (args.out / 'tables.json').write_text(json.dumps(data, separators=(',', ':')) + '\n')
    root = Path(__file__).resolve().parent.parent
    manifest = {'schema': 'six-plane-untrusted-certificates-v1', 'pairs': len(stream),
                'counts': dict(counts), 'distinct_acceptances': len(acceptances),
                'source_sha256': {str(p.relative_to(root)): sha(p) for p in
                                  (Path(__file__).resolve(),
                                   root / 'lean/Conjectures/LonelinessSixPlaneDefs.lean',
                                   root / 'results/six-speed-spectrum/check-gap.cpp')},
                'output_sha256': {name: sha(args.out / name)
                                  for name in ('pair-codes.bin', 'tables.json')},
                'original_survivor_set_compared': bool(args.original_survivors),
                'lean_verified': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2, sort_keys=True) + '\n')
    print(json.dumps(manifest), flush=True)


if __name__ == '__main__':
    main()
