#!/usr/bin/env python3
"""Emit bounded arithmetic proof blocks for the frozen short-period orbits.

The 9,406 non-pilot representatives are partitioned by period and increasing
representative ID. Every block has at most 128 rows and every private numeric
proof has at most two rows. Groups contain at most four independent blocks.
No all-block Lean root and no member-transport proof table is emitted.

The manifest lookup schema is [representative_id, period, block_id, local_index].
A later transport proof can use that block's Data.entryAt and entryAt_checked;
it never needs to normalize a linear list of all 9,448 representatives.
Generated candidates are not verified merely because this producer succeeds.
"""

from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
ORBIT_FILE = HERE / 'small_cyclic_weight_orbits.json.gz'
MANIFEST_FILE = HERE / 'small_cyclic_weight_orbit_batches.json'
ORBIT_SHA256 = '0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c'
BRIDGE = 'Conjectures.FranklSmallCyclicOrbitArithmetic'
BRIDGE_SHA256 = 'de56e1f63a989f12c33a579b8872b1f9dd476c450d9550a6ea82865fa4fa5be9'
BLOCK_SIZE = 128
CHUNK_SIZE = 2
GROUP_SIZE = 4


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def require(condition, message):
    if not condition:
        raise ValueError(message)


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


def lean_list(values):
    return '[' + ', '.join(map(str, values)) + ']'


def load_packet(path=ORBIT_FILE):
    raw = path.read_bytes()
    require(sha(raw) == ORBIT_SHA256, 'Frozen orbit packet checksum mismatch')
    packet = json.loads(gzip.decompress(raw))
    require(packet['schema'] == 'frankl-small-cyclic-weight-orbits-v1', 'Unexpected orbit schema')
    require(len(packet['representatives']) == 9448, 'Expected exactly 9,448 orbit representatives')
    require({r['id'] for r in packet['representatives']} == set(range(9448)), 'Representative IDs are incomplete')
    original = (HERE / 'width_four_weight_candidates.json').read_bytes()
    require(sha(original) == packet['input']['sha256'], 'Original candidate rows checksum mismatch')
    rows = json.loads(original)
    require(len(rows) == 9088, 'Expected exactly 9,088 original candidate rows')
    for record in packet['representatives']:
        require(record['period'] in (7, 8, 9), 'Unexpected representative period')
        require(0 <= record['source_row'] < len(rows), 'Representative source row is out of bounds')
        entry = record['entry']
        require([entry['word'], entry['weights']] == rows[record['source_row']],
                'Representative differs from its original candidate row')
    return packet


def emit_block(period, period_index, block_id, records, packet_sha256=ORBIT_SHA256):
    stem = f'FranklSmallCyclicOrbit{period}Block{period_index:03d}'
    namespace = f'FranklSmallCyclic.OrbitBatches.P{period}.B{period_index:03d}'
    chunks = [records[i:i + CHUNK_SIZE] for i in range(0, len(records), CHUNK_SIZE)]
    data = f'''module

public import {BRIDGE}

/-! Generated arithmetic block for period {period}. Distinct representative IDs
and original candidate rows are recorded in the companion input manifest.
Orbit packet SHA256: {packet_sha256}
-/
@[expose] public section

namespace {namespace}.Data

def representativeIds : List ℕ := {lean_list(r['id'] for r in records)}

def sourceRows : List ℕ := {lean_list(r['source_row'] for r in records)}

'''
    for i, chunk in enumerate(chunks):
        literals = []
        for record in chunk:
            entry = record['entry']
            literals.append(f"    -- Representative {record['id']}; original row {record['source_row']}.\n"
                            + '    { word := ' + lean_list(entry['word'])
                            + ', weights := ' + lean_list(entry['weights']) + ' }')
        data += f'def chunk{i} : List FranklSmallCyclic.Weights.Entry :=\n  [\n'
        data += ',\n'.join(literals) + '\n  ]\n\n'
    data += 'def entries : List FranklSmallCyclic.Weights.Entry :=\n  '
    data += ' ++ '.join(f'chunk{i}' for i in range(len(chunks))) + '\n\n'
    for name in ('representativeIds', 'sourceRows', 'entries'):
        data += f'theorem {name}_length : {name}.length = {len(records)} := by decide +kernel\n\n'
    data += '''theorem representativeIds_nodup : representativeIds.Nodup := by decide +kernel

'''
    data += f'''def entryAt (index : Fin {len(records)}) : FranklSmallCyclic.Weights.Entry :=
  entries.get ⟨index.val, by simpa only [entries_length] using index.isLt⟩

theorem entryAt_mem (index : Fin {len(records)}) : entryAt index ∈ entries :=
  List.get_mem _ _

end {namespace}.Data
'''
    proof = f'''module

public import Conjectures.{stem}Data

/-! Arithmetic for one bounded representative block. The checked conclusion
is the existing Weights.batchCheck predicate for the actual period {period}. -/
@[expose] public section

namespace {namespace}

open FranklSmallCyclic OrbitArithmetic

'''
    for i in range(len(chunks)):
        proof += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked{i} : cachedBatchCheck {period} Data.chunk{i} = true := by
  decide +kernel

'''
    proof += f'''theorem cached_checked : cachedBatchCheck {period} Data.entries = true := by
  simp only [Data.entries, cachedBatchCheck_append, '''
    proof += ', '.join(f'checked{i}' for i in range(len(chunks)))
    proof += f''', Bool.true_and]

theorem checked : Weights.batchCheck {period} Data.entries = true :=
  cachedBatchCheck_sound cached_checked

theorem entry_checked {{entry : Weights.Entry}} (he : entry ∈ Data.entries) :
    Weights.entryCheck {period} entry = true :=
  List.all_eq_true.mp checked entry he

theorem entryAt_checked (index : Fin {len(records)}) :
    Weights.entryCheck {period} (Data.entryAt index) = true :=
  entry_checked (Data.entryAt_mem index)

theorem window_checked {{entry : Weights.Entry}} (he : entry ∈ Data.entries) :
    MaskWindows.windowCheck {period} (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry checked he

end {namespace}
'''
    files = {stem + 'Data.lean': data.encode(), stem + '.lean': proof.encode()}
    block = {
        'id': block_id, 'period': period, 'period_index': period_index,
        'rows': len(records), 'private_chunks': len(chunks),
        'module': 'Conjectures.' + stem, 'data_module': 'Conjectures.' + stem + 'Data',
        'namespace': namespace, 'representative_ids': [r['id'] for r in records],
        'source_rows': [r['source_row'] for r in records],
        'source_sha256': {name: sha(raw) for name, raw in files.items()},
        'required_endpoints': [namespace + '.Data.' + name for name in (
            'representativeIds_length', 'sourceRows_length', 'entries_length',
            'representativeIds_nodup', 'entryAt_mem')]
            + [namespace + '.' + name for name in (
                'cached_checked', 'checked', 'entry_checked', 'entryAt_checked', 'window_checked')],
        'private_endpoints': [namespace + '.checked' + str(i) for i in range(len(chunks))],
    }
    return files, block


def produce(packet):
    require(sha((REPO / 'lean' / (BRIDGE.replace('.', '/') + '.lean')).read_bytes())
            == BRIDGE_SHA256, 'Frozen arithmetic bridge checksum mismatch')
    pending = sorted((r for r in packet['representatives'] if not r['pilot']), key=lambda r: r['id'])
    require(len(pending) == 9406, 'Expected exactly 9,406 non-pilot representatives')
    require(Counter(r['period'] for r in pending) == {7: 3288, 8: 3421, 9: 2697}, 'Period partition changed')
    files, blocks, lookup = {}, [], []
    for period in (7, 8, 9):
        rows = [r for r in pending if r['period'] == period]
        for period_index, start in enumerate(range(0, len(rows), BLOCK_SIZE)):
            selected = rows[start:start + BLOCK_SIZE]
            block_files, block = emit_block(period, period_index, len(blocks), selected)
            require(not (files.keys() & block_files.keys()), 'Duplicate generated module')
            files.update(block_files)
            blocks.append(block)
            lookup.extend([r['id'], period, block['id'], index] for index, r in enumerate(selected))
    lookup.sort()
    require([row[0] for row in lookup] == [r['id'] for r in pending], 'Incomplete or repeated representative partition')
    require(len(blocks) == 75 and sum(b['private_chunks'] for b in blocks) == 4704, 'Block layout changed')
    groups = []
    for i, start in enumerate(range(0, len(blocks), GROUP_SIZE)):
        selected = blocks[start:start + GROUP_SIZE]
        groups.append({'id': f'g{i:02d}', 'block_ids': [b['id'] for b in selected],
                       'roots': [b['module'] for b in selected],
                       'rows': sum(b['rows'] for b in selected),
                       'private_chunks': sum(b['private_chunks'] for b in selected)})
    manifest = {
        'schema': 'frankl-small-cyclic-orbit-arithmetic-batches-v1',
        'formal_status': 'Unverified candidates until each exact group gate passes; no full transport or span-four conclusion.',
        'producer_sha256': sha(Path(__file__).read_bytes()),
        'orbit_packet_sha256': ORBIT_SHA256, 'original_input_sha256': packet['input']['sha256'],
        'generic_bridge': BRIDGE, 'generic_bridge_sha256': BRIDGE_SHA256,
        'periods': [7, 8, 9], 'representatives': 9406,
        'max_rows_per_block': BLOCK_SIZE, 'max_rows_per_private_chunk': CHUNK_SIZE,
        'max_blocks_per_group': GROUP_SIZE, 'block_count': len(blocks),
        'private_chunk_count': sum(b['private_chunks'] for b in blocks),
        'group_count': len(groups), 'initial_gate_group': 'g00',
        'lookup_schema': ['representative_id', 'period', 'block_id', 'local_index'],
        'lookup': lookup, 'blocks': blocks, 'groups': groups,
        'pilot_representative_ids': sorted(r['id'] for r in packet['representatives'] if r['pilot']),
        'source_coverage': 'All and only the non-pilot records in the frozen orbit packet; literal words and original representative weights are unchanged.',
    }
    return files, manifest


def check_written(files, manifest, output_dir, manifest_path):
    for name, raw in files.items():
        require((output_dir / name).read_bytes() == raw, 'Generated source mismatch: ' + name)
    require(manifest_path.read_bytes() == encoded(manifest), 'Generated block manifest mismatch')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output-dir', type=Path, default=REPO / 'lean/Conjectures')
    parser.add_argument('--manifest', type=Path, default=MANIFEST_FILE)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    files, manifest = produce(load_packet())
    if args.check:
        check_written(files, manifest, args.output_dir, args.manifest)
    else:
        args.output_dir.mkdir(parents=True, exist_ok=True)
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        for name, raw in files.items():
            (args.output_dir / name).write_bytes(raw)
        args.manifest.write_bytes(encoded(manifest))
    print(json.dumps({'mode': 'checked' if args.check else 'emitted',
        'rows': manifest['representatives'], 'blocks': manifest['block_count'],
        'private_chunks': manifest['private_chunk_count'], 'groups': manifest['group_count'],
        'manifest': str(args.manifest), 'manifest_sha256': sha(encoded(manifest)),
        'generated_source_files': len(files), 'generated_source_bytes': sum(map(len, files.values())),
        'scope': manifest['formal_status']}, indent=2))


if __name__ == '__main__':
    main()
