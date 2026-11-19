#!/usr/bin/env python3
"""Emit a bounded arithmetic stress pilot from the frozen orbit packet.

This emits at most 128 representative rows. It never emits the full orbit
arithmetic or member transport tables. The generated Lean code uses the
cached evaluator, then proves the existing entry/batch checker conclusions.
All generated source remains a candidate until its exact Lean gates pass.
"""

from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent.parent
ORBIT_SHA256 = '0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c'
CORE = frozenset((3, 4, 5, 6))
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
DATA_MODULE = 'FranklSmallCyclicOrbit128Data'
PILOT_MODULE = 'FranklSmallCyclicOrbit128Pilot'


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def metrics(record):
    period, word = record['period'], record['entry']['word']
    generators = {frozenset((start + offset) % period for offset in tile)
                  for start, letter in enumerate(word)
                  for bit, tile in enumerate(TILES) if letter >> bit & 1}
    local = {generator for generator in generators if generator & CORE}
    support = CORE | frozenset().union(*local)
    boundary = support - CORE
    return {'period': period, 'support_size': len(support),
            'boundary_size': len(boundary), 'local_generator_count': len(local),
            'full_generator_count': len(generators),
            'boundary_condition_count': 3 ** len(boundary)}


def select(packet, count):
    candidates = [(record, metrics(record)) for record in packet['representatives']
                  if not record['pilot']]
    candidates.sort(key=lambda pair: (-pair[1]['period'], -pair[1]['support_size'],
                    -pair[1]['boundary_size'], -pair[1]['local_generator_count'], pair[0]['id']))
    chosen = candidates[:count]
    require(len(chosen) == count, 'Insufficient unproved representative candidates')
    require(all(metric['period'] == 9 and metric['support_size'] == 9
                for _, metric in chosen), 'Stress selection no longer has full nine-point support')
    return chosen


def lean_list(values):
    return '[' + ', '.join(map(str, values)) + ']'


def emit(output, chosen, chunk_size):
    chunks = [chosen[start:start + chunk_size] for start in range(0, len(chosen), chunk_size)]
    data = '''module

public import Conjectures.FranklSmallCyclicOrbitArithmetic

/-! Generated stress representatives from the frozen orbit candidate data.
Rows are ordered by period/support/local-generator cost, then class ID.
The arithmetic proof module checks the actual period-nine masks.

Orbit packet SHA256: ''' + ORBIT_SHA256 + '''
-/
@[expose] public section

namespace FranklSmallCyclic.Orbit128Data

def representativeIds : List ℕ := ''' + lean_list([r['id'] for r, _ in chosen]) + '''

def sourceRows : List ℕ := ''' + lean_list([r['source_row'] for r, _ in chosen]) + '''

'''
    for index, chunk in enumerate(chunks):
        entries = []
        for record, metric in chunk:
            entry = record['entry']
            entries.append('    -- Representative ' + str(record['id']) + ', original row '
                + str(record['source_row']) + ', local generators '
                + str(metric['local_generator_count']) + '.\n'
                + '    { word := ' + lean_list(entry['word']) + ', weights := '
                + lean_list(entry['weights']) + ' }')
        data += 'def chunk' + str(index) + ' : List Weights.Entry :=\n  [\n'
        data += ',\n'.join(entries) + '\n  ]\n\n'
    data += 'def entries : List Weights.Entry :=\n  '
    data += ' ++ '.join('chunk' + str(i) for i in range(len(chunks))) + '\n\n'
    data += 'theorem representativeIds_length : representativeIds.length = ' + str(len(chosen))
    data += ' := by decide +kernel\n\n'
    data += 'theorem entries_length : entries.length = ' + str(len(chosen))
    data += ' := by decide +kernel\n\n'
    data += 'end FranklSmallCyclic.Orbit128Data\n'

    proof = '''module

public import Conjectures.''' + DATA_MODULE + '''

/-! A bounded arithmetic stress pilot. Each private proof checks at most
two original representative vectors on the literal period-nine ground.
The public endpoint is the existing Weights.batchCheck statement. -/
@[expose] public section

namespace FranklSmallCyclic.Orbit128Pilot

open OrbitArithmetic

'''
    for index in range(len(chunks)):
        proof += '''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked''' + str(index) + ' : cachedBatchCheck 9 Orbit128Data.chunk'
        proof += str(index) + ''' = true := by
  decide +kernel

'''
    proof += '''theorem cached_checked : cachedBatchCheck 9 Orbit128Data.entries = true := by
  simp only [Orbit128Data.entries, cachedBatchCheck_append, '''
    proof += ', '.join('checked' + str(i) for i in range(len(chunks)))
    proof += ''', Bool.true_and]

theorem checked : Weights.batchCheck 9 Orbit128Data.entries = true :=
  cachedBatchCheck_sound cached_checked

theorem each_entry_checked {entry : Weights.Entry} (he : entry ∈ Orbit128Data.entries) :
    Weights.entryCheck 9 entry = true :=
  List.all_eq_true.mp checked entry he

theorem each_checked {entry : Weights.Entry} (he : entry ∈ Orbit128Data.entries) :
    MaskWindows.windowCheck 9 (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry checked he

end FranklSmallCyclic.Orbit128Pilot
'''
    files = {DATA_MODULE + '.lean': data, PILOT_MODULE + '.lean': proof}
    output.mkdir(parents=True, exist_ok=True)
    for filename, content in files.items():
        (output / filename).write_text(content)
    return {filename: sha(content.encode()) for filename, content in files.items()}, chunks


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--orbits', type=Path, default=ROOT / 'small_cyclic_weight_orbits.json.gz')
    parser.add_argument('--output-dir', type=Path, default=REPO / 'lean/Conjectures')
    parser.add_argument('--count', type=int, default=128)
    parser.add_argument('--rows-per-chunk', type=int, default=2)
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    require(1 <= args.count <= 128, 'Only a bounded pilot of at most 128 representatives is authorized')
    require(1 <= args.rows_per_chunk <= 2, 'Private arithmetic chunks must contain at most two rows')
    raw = args.orbits.read_bytes()
    require(sha(raw) == ORBIT_SHA256, 'Frozen orbit packet SHA256 mismatch')
    packet = json.loads(gzip.decompress(raw))
    require(packet['schema'] == 'frankl-small-cyclic-weight-orbits-v1', 'Orbit schema mismatch')
    chosen = select(packet, args.count)
    files, chunks = emit(args.output_dir, chosen, args.rows_per_chunk)
    histogram = Counter(metric['local_generator_count'] for _, metric in chosen)
    report = {
        'schema': 'frankl-small-cyclic-orbit-arithmetic-pilot-v1',
        'formal_status': 'Candidate source; exact source, axiom and kernel gates are required.',
        'producer_sha256': sha(Path(__file__).read_bytes()), 'orbit_file_sha256': ORBIT_SHA256,
        'original_input_sha256': packet['input']['sha256'],
        'selection_algorithm': 'non-pilot-period-support-boundary-local-generators-descending-id-ascending-v1',
        'count': len(chosen), 'period': 9, 'rows_per_chunk': args.rows_per_chunk,
        'private_arithmetic_chunks': len(chunks), 'arithmetic_proof_modules': 1,
        'selected_representative_ids': [record['id'] for record, _ in chosen],
        'local_generator_count_histogram': dict(sorted(histogram.items())),
        'selected': [{'representative': record, 'metrics': metric} for record, metric in chosen],
        'generated_source_sha256': files,
        'generic_bridge': 'Conjectures.FranklSmallCyclicOrbitArithmetic',
        'dependency_dag': {
            'Conjectures.FranklSmallCyclicOrbitArithmetic': [
                'Conjectures.FranklSmallCyclicWeights', 'Conjectures.FranklLocalMaskCached'],
            'Conjectures.' + DATA_MODULE: ['Conjectures.FranklSmallCyclicOrbitArithmetic'],
            'Conjectures.' + PILOT_MODULE: ['Conjectures.' + DATA_MODULE],
        },
        'bulk_projection': {
            'unproved_representatives': packet['counts']['new_arithmetic_representatives'],
            'modules_at_128_rows': (packet['counts']['new_arithmetic_representatives'] + 127) // 128,
            'private_chunks_at_two_rows': (packet['counts']['new_arithmetic_representatives'] + 1) // 2,
            'qualification': 'A layout projection only. No bulk files are emitted and no timing or memory bound is inferred before the pilot measurements.',
        },
    }
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2, sort_keys=True) + '\n')
    print(json.dumps({key: value for key, value in report.items() if key != 'selected'}, indent=2, sort_keys=True))


if __name__ == '__main__':
    main()
