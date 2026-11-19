#!/usr/bin/env python3
"""Replay original width-four weights on literal cyclic grounds of size 7, 8, 9.

This is untrusted computational evidence, not a Lean proof. The input is an
ordered JSON list of [[seven letters], [four weights]] rows. Each letter's
four low bits select tiles 012, 013, 023, 0123 at that start. Tile coordinates
are reduced modulo the period before any generator union is formed.

The replay enumerates actual distinct local unions. For every M subset E
subset B, it counts each compatible inside set once. It does not use the
producer's maximal-cover test, its weight search, or any graph reduction.
Only the Python standard library is required.
"""

from __future__ import annotations

import argparse
from collections import Counter
from functools import lru_cache
import hashlib
from itertools import product
import json
from pathlib import Path
import platform
import sys
from time import monotonic


TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
CORE = (3, 4, 5, 6)


def canonical_bytes(rows):
    return (json.dumps(rows, separators=(',', ':')) + '\n').encode()


def load_rows(path):
    raw = path.read_bytes()
    rows = json.loads(raw)
    if not isinstance(rows, list):
        raise ValueError('candidate input must be an ordered JSON list')
    for index, row in enumerate(rows):
        if not isinstance(row, list) or len(row) != 2:
            raise ValueError(f'row {index}: expected [word, weights]')
        word, weights = row
        if not isinstance(word, list) or len(word) != 7:
            raise ValueError(f'row {index}: expected seven letters')
        if not isinstance(weights, list) or len(weights) != 4:
            raise ValueError(f'row {index}: expected four weights')
        if any(type(letter) is not int or not 0 <= letter < 16 for letter in word):
            raise ValueError(f'row {index}: a letter is outside 0..15')
        if any(type(weight) is not int or not 0 <= weight <= 3 for weight in weights):
            raise ValueError(f'row {index}: a weight is outside 0..3')
        if not any(weights):
            raise ValueError(f'row {index}: all weights are zero')
    return rows, hashlib.sha256(raw).hexdigest(), hashlib.sha256(canonical_bytes(rows)).hexdigest()


def local_union_family(word, period):
    """Use literal residue sets; deduplicate generators and every resulting union."""
    window = frozenset(CORE)
    generators = {
        frozenset((start + offset) % period for offset in tile)
        for start, letter in enumerate(word)
        for bit, tile in enumerate(TILES)
        if (letter >> bit) & 1
    }
    local = sorted((generator for generator in generators if generator & window),
                   key=lambda generator: (len(generator), tuple(sorted(generator))))
    unions = {frozenset()}
    for generator in local:
        additions = {member | generator for member in unions}
        unions.update(additions)
    support = frozenset().union(*local)
    return local, unions, tuple(sorted(support - window))


@lru_cache(maxsize=None)
def boundary_conditions(size):
    """Every boundary point is forbidden, optional, or mandatory."""
    conditions = []
    for digits in product(range(3), repeat=size):
        allowed = sum(1 << bit for bit, digit in enumerate(digits) if digit != 0)
        mandatory = sum(1 << bit for bit, digit in enumerate(digits) if digit == 2)
        conditions.append((allowed, mandatory))
    return tuple(conditions)


@lru_cache(maxsize=None)
def admissibility(size):
    conditions = boundary_conditions(size)
    return tuple(
        sum(1 << index for index, (allowed, mandatory) in enumerate(conditions)
            if mandatory & trace == mandatory and trace & allowed == trace)
        for trace in range(1 << size)
    )


def balances_from_literal_unions(unions, boundary, weights):
    """Bitsets accelerate a union of witnesses, never count their multiplicity."""
    permitted = admissibility(len(boundary))
    possible = [0] * 16
    for member in unions:
        inside = sum(1 << bit for bit, point in enumerate(CORE) if point in member)
        outside = sum(1 << bit for bit, point in enumerate(boundary) if point in member)
        possible[inside] |= permitted[outside]
    balances = [0] * (3 ** len(boundary))
    total = sum(weights)
    for inside, conditions in enumerate(possible):
        score = 2 * sum(weight for bit, weight in enumerate(weights)
                        if inside & (1 << bit)) - total
        while conditions:
            bit = conditions & -conditions
            balances[bit.bit_length() - 1] += score
            conditions ^= bit
    return balances


def reference_balances(unions, boundary, weights):
    """Direct definition used for a few cross-checks of the bitset aggregation."""
    window = frozenset(CORE)
    traces = {(member & window, member - window) for member in unions}
    result = []
    for allowed, mandatory in boundary_conditions(len(boundary)):
        exterior = frozenset(point for bit, point in enumerate(boundary)
                             if allowed & (1 << bit))
        required = frozenset(point for bit, point in enumerate(boundary)
                             if mandatory & (1 << bit))
        compatible = {inside for inside, outside in traces if required <= outside <= exterior}
        result.append(sum(sum(weight if point in inside else -weight
                              for point, weight in zip(CORE, weights))
                          for inside in compatible))
    return result


def self_check(rows, periods):
    checks = 0
    for period in periods:
        _, unions, boundary = local_union_family([0, 0, 0, 1, 0, 0, 0], period)
        assert min(balances_from_literal_unions(unions, boundary, [1, 0, 0, 0])) == 0
        assert min(balances_from_literal_unions(unions, boundary, [0, 0, 0, 1])) == -2
        checks += 2
        for index in sorted({0, len(rows) // 2, len(rows) - 1}) if rows else []:
            word, weights = rows[index]
            _, unions, boundary = local_union_family(word, period)
            assert balances_from_literal_unions(unions, boundary, weights) == \
                reference_balances(unions, boundary, weights)
            checks += 1
    return checks


def failure_details(index, word, weights, period, unions, boundary, balances):
    condition_index = min(range(len(balances)), key=balances.__getitem__)
    allowed, mandatory = boundary_conditions(len(boundary))[condition_index]
    exterior = frozenset(point for bit, point in enumerate(boundary) if allowed & (1 << bit))
    required = frozenset(point for bit, point in enumerate(boundary) if mandatory & (1 << bit))
    window = frozenset(CORE)
    compatible = {member & window for member in unions if required <= member - window <= exterior}
    patterns = sorted(compatible, key=lambda pattern: tuple(sorted(pattern)))
    values = [sum(weight if point in pattern else -weight
                  for point, weight in zip(CORE, weights)) for pattern in patterns]
    assert sum(values) == balances[condition_index]
    return {'row_index': index, 'period': period, 'word': word, 'weights': weights,
            'boundary': list(boundary), 'E': sorted(exterior), 'M': sorted(required),
            'compatible': [sorted(pattern) for pattern in patterns],
            'imbalances': values, 'sum': sum(values)}


def replay_period(rows, period):
    started = monotonic()
    failures = []
    boundary_sizes = Counter()
    minima = Counter()
    union_counts = Counter()
    condition_count = 0
    row_digest = hashlib.sha256()
    for index, (word, weights) in enumerate(rows):
        local, unions, boundary = local_union_family(word, period)
        assert all(0 <= point < period for member in unions for point in member)
        assert len(boundary) <= period - len(CORE)
        balances = balances_from_literal_unions(unions, boundary, weights)
        minimum = min(balances)
        boundary_sizes[len(boundary)] += 1
        minima[minimum] += 1
        union_counts[len(unions)] += 1
        condition_count += len(balances)
        row_digest.update(canonical_bytes([index, len(local), len(unions), list(boundary), balances]))
        if minimum < 0:
            failures.append(failure_details(index, word, weights, period, unions, boundary, balances))
        if (index + 1) % 1000 == 0:
            print(f'period {period}: {index + 1}/{len(rows)} rows; {len(failures)} failures',
                  file=sys.stderr, flush=True)
    return {'status': 'passed' if not failures else 'failed',
            'rows_checked': len(rows), 'rows_failed': len(failures),
            'boundary_conditions_checked': condition_count,
            'minimum_imbalance_histogram': dict(sorted(minima.items())),
            'boundary_size_histogram': dict(sorted(boundary_sizes.items())),
            'distinct_local_union_count_histogram': dict(sorted(union_counts.items())),
            'row_results_sha256': row_digest.hexdigest(), 'failures': failures,
            'seconds': round(monotonic() - started, 3)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('candidates', type=Path)
    parser.add_argument('--periods', type=int, nargs='+', choices=(7, 8, 9), default=[7, 8, 9])
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    periods = sorted(set(args.periods))
    rows, input_hash, rows_hash = load_rows(args.candidates)
    checks = self_check(rows, periods)
    report = {'status': 'running', 'verification_kind': 'untrusted literal finite enumeration',
              'input_path': str(args.candidates.resolve()), 'input_sha256': input_hash,
              'canonical_rows_sha256': rows_hash, 'input_rows': len(rows),
              'replay_source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'python': platform.python_version(),
              'semantics': {'tiles': TILES, 'core': CORE,
                            'weights': 'the four original weights apply to sites 3,4,5,6',
                            'mapping': 'reduce each tile point modulo the period before forming unions',
                            'counting': 'distinct local unions and distinct compatible inside sets',
                            'boundary': 'actual local-generator support outside the core',
                            'conditions': 'all M subset E subset actual boundary'},
              'sanity_and_direct_definition_checks': checks, 'periods': {}}
    for period in periods:
        report['periods'][str(period)] = replay_period(rows, period)
        if args.output:
            args.output.parent.mkdir(parents=True, exist_ok=True)
            args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    report['status'] = 'passed' if all(r['status'] == 'passed' for r in report['periods'].values()) else 'failed'
    if args.output:
        args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0 if report['status'] == 'passed' else 1


if __name__ == '__main__':
    raise SystemExit(main())
