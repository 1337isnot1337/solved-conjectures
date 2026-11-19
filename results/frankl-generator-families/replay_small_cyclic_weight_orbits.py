#!/usr/bin/env python3
"""Independently replay candidate short-cycle orbit witnesses.

This replay never imports the producer or performs its canonicalization.
It reconstructs literal sets from the original words, checks complete row
and period coverage, and checks every support bijection and transported
weight. It does not certify representative arithmetic or replace Lean.
"""

from __future__ import annotations

import argparse
from collections import Counter
from functools import lru_cache
import gzip
import hashlib
import json
from pathlib import Path
import platform
import sys
from time import monotonic


ROOT = Path(__file__).resolve().parent
INPUT_SHA256 = '5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a'
SCHEMA = 'frankl-small-cyclic-weight-orbits-v1'
PERIODS = (7, 8, 9)
CORE = frozenset((3, 4, 5, 6))
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
PILOT_INDICES = (0, 143, 224, 288, 469, 1553, 3447, 3506,
                 6030, 6279, 7962, 8172, 8307, 8361, 9045, 9087)
PRODUCER_NAME = 'generate_small_cyclic_weight_orbits.py'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(raw):
    return hashlib.sha256(raw).hexdigest()


def canonical_bytes(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


def natural(value):
    return type(value) is int and value >= 0


def validate_entry(entry, label):
    require(isinstance(entry, dict) and set(entry) == {'word', 'weights'},
            f'{label}: expected word/weights entry')
    word, weights = entry['word'], entry['weights']
    require(isinstance(word, list) and len(word) == 7 and
            all(natural(letter) and letter < 16 for letter in word),
            f'{label}: malformed seven-letter word')
    require(isinstance(weights, list) and len(weights) == 4 and
            all(natural(weight) and weight <= 3 for weight in weights) and any(weights),
            f'{label}: malformed nonzero four-weight vector')


def load_rows(path):
    raw = path.read_bytes()
    require(sha256(raw) == INPUT_SHA256, 'Original input SHA256 mismatch')
    rows = json.loads(raw)
    require(isinstance(rows, list) and len(rows) == 9088, 'Original input count mismatch')
    require(raw == canonical_bytes(rows), 'Original input encoding mismatch')
    for index, row in enumerate(rows):
        require(isinstance(row, list) and len(row) == 2, f'Original row {index} malformed')
        validate_entry({'word': row[0], 'weights': row[1]}, f'original row {index}')
    return rows


@lru_cache(maxsize=None)
def literal_local_family(period, word):
    """Deduplicate actual residue sets before forming the local subfamily."""
    family = {
        frozenset((start + offset) % period for offset in tile)
        for start, letter in enumerate(word)
        for bit, tile in enumerate(TILES)
        if letter >> bit & 1
    }
    local = frozenset(generator for generator in family if generator & CORE)
    support = CORE | frozenset().union(*local)
    return local, support


def validate_reference(record, rows, label):
    period, row = record.get('period'), record.get('source_row')
    require(natural(period) and period in PERIODS, f'{label}: invalid period')
    require(natural(row) and row < len(rows), f'{label}: invalid original row index')
    validate_entry(record.get('entry'), label)
    require(record['entry']['word'] == rows[row][0], f'{label}: word differs from original row')
    return period, row


def replay(packet, rows, producer_sha256):
    require(isinstance(packet, dict) and packet.get('schema') == SCHEMA, 'Orbit schema mismatch')
    require(packet.get('input') == {'name': 'width_four_weight_candidates.json',
                                    'sha256': INPUT_SHA256, 'rows': len(rows)},
            'Pinned input metadata mismatch')
    require(packet.get('periods') == list(PERIODS), 'Period domain mismatch')
    require(packet.get('core') == sorted(CORE), 'Core mismatch')
    require(packet.get('pilot_indices') == list(PILOT_INDICES) and
            all(natural(i) for i in packet['pilot_indices']), 'Pilot index metadata mismatch')
    require(packet.get('producer') == {'name': PRODUCER_NAME, 'sha256': producer_sha256,
                                      'algorithm': 'exhaustive-core-boundary-canonicalization-v1'},
            'Producer source identity mismatch')

    representatives, members = packet.get('representatives'), packet.get('members')
    require(isinstance(representatives, list) and len(representatives) == 9448,
            'Representative inventory count mismatch')
    require(isinstance(members, list) and len(members) == len(rows) * len(PERIODS),
            'Complete row/period coverage count mismatch')
    source_refs = set()
    source_geometries = []
    for identifier, source in enumerate(representatives):
        label = f'representative {identifier}'
        require(isinstance(source, dict) and set(source) ==
                {'id', 'period', 'source_row', 'entry', 'pilot'}, f'{label}: record fields mismatch')
        require(natural(source['id']) and source['id'] == identifier, f'{label}: ID order mismatch')
        period, row = validate_reference(source, rows, label)
        require((period, row) not in source_refs, f'{label}: duplicate representative case')
        source_refs.add((period, row))
        require(source['entry']['weights'] == rows[row][1],
                f'{label}: weights differ from the original successful vector')
        require(type(source['pilot']) is bool and source['pilot'] == (row in PILOT_INDICES),
                f'{label}: pilot flag mismatch')
        source_geometries.append(literal_local_family(period, tuple(source['entry']['word'])))

    group_counts = Counter()
    changed = Counter()
    preferred = {}
    maps_digest = hashlib.sha256()
    for position, member in enumerate(members):
        label = f'member {position}'
        require(isinstance(member, dict) and set(member) ==
                {'period', 'source_row', 'representative_id', 'entry', 'point_map'},
                f'{label}: record fields mismatch')
        period, row = validate_reference(member, rows, label)
        require((period, row) == (PERIODS[position // len(rows)], position % len(rows)),
                f'{label}: exact ordered original row/period coverage failed')
        identifier = member['representative_id']
        require(natural(identifier) and identifier < len(representatives),
                f'{label}: invalid representative ID')
        source = representatives[identifier]
        source_family, source_support = source_geometries[identifier]
        target_family, target_support = literal_local_family(period, tuple(member['entry']['word']))
        pairs = member['point_map']
        require(isinstance(pairs, list) and all(
            isinstance(pair, list) and len(pair) == 2 and all(natural(x) for x in pair)
            for pair in pairs), f'{label}: malformed finite point-map list')
        keys = [source_point for source_point, _ in pairs]
        require(keys == sorted(source_support), f'{label}: exact source-support keys/Nodup failed')
        mapping = dict(pairs)
        images = list(mapping.values())
        require(len(set(images)) == len(images), f'{label}: support map is not injective')
        require(set(images) == target_support, f'{label}: target support image mismatch')
        require({mapping[x] for x in CORE} == CORE, f'{label}: core image mismatch')
        mapped_family = frozenset(frozenset(mapping[x] for x in generator)
                                  for generator in source_family)
        require(mapped_family == target_family, f'{label}: exact local-generator image mismatch')
        source_weights = source['entry']['weights']
        target_weights = member['entry']['weights']
        require(all(target_weights[mapping[x] - 3] == source_weights[x - 3] for x in CORE),
                f'{label}: transported natural-weight agreement failed')
        changed[period] += target_weights != rows[row][1]
        group_counts[identifier] += 1
        preference = (row not in PILOT_INDICES, period, row)
        preferred[identifier] = min(preferred.get(identifier, preference), preference)
        maps_digest.update(canonical_bytes([period, row, identifier, pairs, target_weights]))

    require(set(group_counts) == set(range(len(representatives))), 'An unused representative remains')
    for identifier, source in enumerate(representatives):
        expected = (source['source_row'] not in PILOT_INDICES, source['period'], source['source_row'])
        require(preferred[identifier] == expected, f'Representative {identifier}: selection policy failed')
        position = PERIODS.index(source['period']) * len(rows) + source['source_row']
        member = members[position]
        require(member['representative_id'] == identifier and member['entry'] == source['entry'],
                f'Representative {identifier}: own member does not retain its original entry')
        require(all(x == y for x, y in member['point_map']),
                f'Representative {identifier}: own support map is not the identity')

    seeded = sum(source['pilot'] for source in representatives)
    counts = {'representatives': len(representatives), 'members': len(members),
              'pilot_seeded_representatives': seeded,
              'new_arithmetic_representatives': len(representatives) - seeded,
              'changed_member_weight_vectors': sum(changed.values())}
    require(packet.get('counts') == counts, 'Claimed counts differ from the replayed records')
    require(counts == {'representatives': 9448, 'members': 27264,
                      'pilot_seeded_representatives': 42, 'new_arithmetic_representatives': 9406,
                      'changed_member_weight_vectors': 6618}, 'Validated census totals changed')
    return {'counts': counts, 'changed_weights_by_period': dict(sorted(changed.items())),
            'class_multiplicity_histogram': dict(sorted(Counter(group_counts.values()).items())),
            'checked_maps_sha256': maps_digest.hexdigest(),
            'complete_ordered_original_row_period_coverage': True,
            'all_representative_original_vectors_preserved': True,
            'all_support_bijections_and_local_images_checked': True,
            'all_new_natural_weights_checked': True,
            'all_representatives_follow_pilot_preference': True}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('orbits', type=Path)
    parser.add_argument('--input', type=Path, default=ROOT / 'width_four_weight_candidates.json')
    parser.add_argument('--output', type=Path)
    args = parser.parse_args()
    started = monotonic()
    try:
        rows = load_rows(args.input)
        encoded = args.orbits.read_bytes()
        raw = gzip.decompress(encoded) if encoded.startswith(b'\x1f\x8b') else encoded
        packet = json.loads(raw)
        require(raw == canonical_bytes(packet), 'Orbit JSON is not canonically encoded')
        producer_sha256 = sha256((ROOT / PRODUCER_NAME).read_bytes())
        result = replay(packet, rows, producer_sha256)
        require(sha256(args.input.read_bytes()) == INPUT_SHA256, 'Original input changed during replay')
    except ValueError as error:
        print(f'FAIL: {error}', file=sys.stderr)
        return 1
    report = {
        'schema': SCHEMA + '-witness-replay', 'status': 'passed',
        'verification_kind': 'Untrusted independent literal-set witness replay.',
        'formal_scope': 'Representative arithmetic, all finite transport premises and final '
                        'coverage still require Lean proofs. This replay does not establish '
                        'that the representative list is a minimal isomorphism quotient.',
        'input_sha256': INPUT_SHA256, 'producer_sha256': producer_sha256,
        'replay_source_sha256': sha256(Path(__file__).read_bytes()),
        'orbit_file_sha256': sha256(encoded), 'canonical_json_sha256': sha256(raw),
        'python': platform.python_version(), 'seconds': round(monotonic() - started, 3),
        **result,
    }
    if args.output:
        args.output.parent.mkdir(parents=True, exist_ok=True)
        args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
