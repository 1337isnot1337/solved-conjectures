#!/usr/bin/env python3
"""Produce candidate local-family orbits for periods 7, 8 and 9.

The original 9,088-row input is unchanged. Classes ignore its weight vectors:
one member supplies its original successful vector, which is transported to
every other member by a bijection of the actual finite support. Target vectors
can therefore differ from their original input vectors.

This producer and its output are untrusted. Lean must check representative
arithmetic and every transport. The separate witness replay does not import
this producer. Only the Python standard library is required.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from dataclasses import dataclass
from functools import lru_cache
import gzip
import hashlib
from io import BytesIO
from itertools import permutations
import json
from pathlib import Path
import platform
import sys
from time import monotonic
import zlib


ROOT = Path(__file__).resolve().parent
INPUT_NAME = 'width_four_weight_candidates.json'
INPUT_SHA256 = '5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a'
SCHEMA = 'frankl-small-cyclic-weight-orbits-v1'
PERIODS = (7, 8, 9)
CORE = (3, 4, 5, 6)
CORE_MASK = sum(1 << point for point in CORE)
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
PILOT_INDICES = (0, 143, 224, 288, 469, 1553, 3447, 3506,
                 6030, 6279, 7962, 8172, 8307, 8361, 9045, 9087)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def canonical_bytes(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


def load_rows(path):
    raw = path.read_bytes()
    require(sha256(raw) == INPUT_SHA256, 'Input differs from the pinned original rows')
    rows = json.loads(raw)
    require(raw == canonical_bytes(rows), 'Input is not canonically encoded')
    require(len(rows) == 9088, 'Expected the complete 9,088-row input')
    for index, (word, weights) in enumerate(rows):
        require(len(word) == 7 and len(weights) == 4, f'Invalid dimensions at row {index}')
        require(all(type(a) is int and 0 <= a < 16 for a in word),
                f'Invalid letter at row {index}')
        require(all(type(w) is int and 0 <= w <= 3 for w in weights) and any(weights),
                f'Invalid original weights at row {index}')
    return rows


@dataclass(frozen=True, slots=True)
class Geometry:
    period: int
    row: int
    generators: tuple[int, ...]
    boundary: tuple[int, ...]
    coded: tuple[tuple[int, int], ...]


def geometry(period, row, word):
    generators = set()
    for start, letter in enumerate(word):
        for bit, tile in enumerate(TILES):
            if letter >> bit & 1:
                generator = 0
                for offset in tile:
                    generator |= 1 << ((start + offset) % period)
                if generator & CORE_MASK:
                    generators.add(generator)
    support = 0
    for generator in generators:
        support |= generator
    boundary = tuple(point for point in range(period)
                     if support >> point & 1 and point not in CORE)
    coded = tuple(sorted(((generator >> 3) & 15,
                          sum(1 << bit for bit, point in enumerate(boundary)
                              if generator >> point & 1))
                         for generator in generators))
    return Geometry(period, row, tuple(sorted(generators)), boundary, coded)


@lru_cache(maxsize=None)
def permutation_tables(size):
    """A permutation maps each old coordinate to its new coordinate."""
    return tuple(
        (perm, tuple(sum(1 << perm[i] for i in range(size) if mask >> i & 1)
                     for mask in range(1 << size)))
        for perm in permutations(range(size)))


@lru_cache(maxsize=60000)
def canonical_boundary(size, coded):
    best = None
    best_perm = None
    for perm, table in permutation_tables(size):
        candidate = tuple(sorted((inside, table[outside]) for inside, outside in coded))
        if best is None or candidate < best:
            best, best_perm = candidate, perm
    return best, best_perm


@lru_cache(maxsize=None)
def canonical_geometry(size, coded):
    """Try all 24 core permutations and all actual-boundary permutations."""
    best = None
    best_core = None
    best_boundary = None
    for core_perm, table in permutation_tables(4):
        shifted = tuple(sorted((table[inside], outside) for inside, outside in coded))
        candidate, boundary_perm = canonical_boundary(size, shifted)
        if best is None or candidate < best:
            best, best_core, best_boundary = candidate, core_perm, boundary_perm
    return best, best_core, best_boundary


def orbit_key(case):
    canonical, _, _ = canonical_geometry(len(case.boundary), case.coded)
    return len(case.boundary), canonical


def canonical_point_map(case):
    _, core_perm, boundary_perm = canonical_geometry(len(case.boundary), case.coded)
    result = {point: core_perm[i] for i, point in enumerate(CORE)}
    result.update({point: 4 + boundary_perm[i] for i, point in enumerate(case.boundary)})
    return result


def map_generator(generator, point_map):
    result = 0
    while generator:
        bit = generator & -generator
        result |= 1 << point_map[bit.bit_length() - 1]
        generator ^= bit
    return result


def representative_map(source, target):
    target_inverse = {label: point for point, label in canonical_point_map(target).items()}
    mapping = {point: target_inverse[label]
               for point, label in canonical_point_map(source).items()}
    source_support = set(CORE) | set(source.boundary)
    target_support = set(CORE) | set(target.boundary)
    require(set(mapping) == source_support, 'Source support coverage failed')
    require(len(set(mapping.values())) == len(mapping), 'Support map is not injective')
    require(set(mapping.values()) == target_support, 'Target support coverage failed')
    require({mapping[point] for point in CORE} == set(CORE), 'Core image failed')
    require({map_generator(generator, mapping) for generator in source.generators}
            == set(target.generators), 'Local-generator image failed')
    return mapping


def build_packet(rows):
    groups = defaultdict(list)
    timings = {}
    for period in PERIODS:
        started = monotonic()
        for index, (word, _) in enumerate(rows):
            case = geometry(period, index, word)
            groups[orbit_key(case)].append(case)
        timings[str(period)] = round(monotonic() - started, 3)
        print(f'period {period}: all {len(rows)} rows classified in '
              f'{timings[str(period)]:.3f}s', file=sys.stderr, flush=True)

    representatives = []
    members = []
    changed_by_period = Counter()
    multiplicities = Counter()
    for identifier, (_, group) in enumerate(sorted(groups.items())):
        source = min(group, key=lambda case:
                     (case.row not in PILOT_INDICES, case.period, case.row))
        source_word, source_weights = rows[source.row]
        representatives.append({
            'id': identifier, 'period': source.period, 'source_row': source.row,
            'entry': {'word': source_word, 'weights': source_weights},
            'pilot': source.row in PILOT_INDICES,
        })
        multiplicities[len(group)] += 1
        for target in group:
            mapping = representative_map(source, target)
            new_weights = [0] * 4
            for point, weight in zip(CORE, source_weights):
                new_weights[mapping[point] - 3] = weight
            require(any(new_weights), 'Transport erased the nonzero weight vector')
            require(all(new_weights[mapping[point] - 3] == weight
                        for point, weight in zip(CORE, source_weights)),
                    'Natural-weight transport failed')
            changed_by_period[target.period] += new_weights != rows[target.row][1]
            members.append({
                'period': target.period, 'source_row': target.row,
                'representative_id': identifier,
                'entry': {'word': rows[target.row][0], 'weights': new_weights},
                'point_map': sorted(mapping.items()),
            })
    members.sort(key=lambda member: (member['period'], member['source_row']))
    coverage = [(member['period'], member['source_row']) for member in members]
    require(coverage == [(period, row) for period in PERIODS for row in range(len(rows))],
            'The complete ordered original row/period coverage failed')
    seeded = sum(rep['pilot'] for rep in representatives)
    counts = {
        'representatives': len(representatives), 'members': len(members),
        'pilot_seeded_representatives': seeded,
        'new_arithmetic_representatives': len(representatives) - seeded,
        'changed_member_weight_vectors': sum(changed_by_period.values()),
    }
    require(counts == {'representatives': 9448, 'members': 27264,
                      'pilot_seeded_representatives': 42,
                      'new_arithmetic_representatives': 9406,
                      'changed_member_weight_vectors': 6618},
            'The pinned original input no longer reproduces the validated census')
    packet = {
        'schema': SCHEMA,
        'formal_status': 'Untrusted candidate data. Representative arithmetic and every '
                         'transport still require Lean proofs.',
        'input': {'name': INPUT_NAME, 'sha256': INPUT_SHA256, 'rows': len(rows)},
        'producer': {'name': Path(__file__).name,
                     'sha256': sha256(Path(__file__).read_bytes()),
                     'algorithm': 'exhaustive-core-boundary-canonicalization-v1'},
        'periods': PERIODS, 'core': CORE, 'pilot_indices': PILOT_INDICES,
        'representative_policy': 'Prefer a pilot case, then the lowest period and row index.',
        'member_order': 'Increasing period, then original zero-based input row.',
        'point_map_direction': 'Representative actual support to member actual support; '
                               'pairs are ordered by source point.',
        'weight_semantics': 'Representative entries retain original input weights. Member '
                            'entries contain transported alternatives and may differ from '
                            'their original input vectors.',
        'counts': counts, 'representatives': representatives, 'members': members,
    }
    statistics = {'classification_seconds': timings,
                  'changed_weights_by_period': dict(sorted(changed_by_period.items())),
                  'class_multiplicity_histogram': dict(sorted(multiplicities.items()))}
    return packet, statistics


def deterministic_gzip(raw):
    stream = BytesIO()
    with gzip.GzipFile(filename='', mode='wb', fileobj=stream, compresslevel=9, mtime=0) as out:
        out.write(raw)
    return stream.getvalue()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--input', type=Path, default=ROOT / INPUT_NAME)
    parser.add_argument('--output', type=Path,
                        default=ROOT / 'small_cyclic_weight_orbits.json.gz')
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    require(args.output.resolve() != args.input.resolve(), 'Output must not overwrite input')
    started = monotonic()
    rows = load_rows(args.input)
    packet, statistics = build_packet(rows)
    raw = canonical_bytes(packet)
    compressed = deterministic_gzip(raw)
    require(sha256(args.input.read_bytes()) == INPUT_SHA256, 'Original input changed during generation')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(compressed)
    report = {
        'schema': SCHEMA + '-producer-report', 'formal_status': packet['formal_status'],
        'input_sha256': INPUT_SHA256, 'producer_sha256': packet['producer']['sha256'],
        'output': str(args.output.resolve()), 'compressed_bytes': len(compressed),
        'compressed_sha256': sha256(compressed), 'canonical_json_bytes': len(raw),
        'canonical_json_sha256': sha256(raw), 'counts': packet['counts'],
        'python': platform.python_version(), 'zlib': zlib.ZLIB_RUNTIME_VERSION,
        'gzip': {'compression_level': 9, 'mtime': 0, 'filename': ''},
        'seconds': round(monotonic() - started, 3), **statistics,
    }
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps(report, indent=2, sort_keys=True))


if __name__ == '__main__':
    main()
