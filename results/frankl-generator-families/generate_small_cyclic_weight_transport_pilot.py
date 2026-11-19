#!/usr/bin/env python3
"""Emit a bounded pilot for explicit orbit transport with block-local lookup.

At most eight cases use the public period-nine pilot on full nine-point
support. The other cases use representatives from arithmetic group g00 and
exercise its Data.entryAt dispatch. Every target carries its transported
weight vector, which may differ from the original candidate vector.

The only computed Lean premises are maskTransportCheck equalities. Actual
source window checks come from previously checked arithmetic theorem APIs.
This producer emits 128 mapped rows, never the full 27,264-member table.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import importlib.util
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
BATCH_MANIFEST = HERE / 'small_cyclic_weight_orbit_batches.json'
BATCH_MANIFEST_SHA256 = '18246e0188eedf9ca9074b1d8bec301cc70f0ee4570aa20d0ee36789378a2ebc'
ORBIT_SHA256 = '0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c'
PILOT_ROWS = (0, 143, 224, 288, 469, 1553, 3447, 3506,
              6030, 6279, 7962, 8172, 8307, 8361, 9045, 9087)
SOURCE_HASHES = {
    'FranklSmallCyclicMaskTransport.lean':
        '121d6c388f8fe14de8a5711ee0a3dde83c52dbb6e8be40e3888fbd73971c2da0',
    'FranklSmallCyclicWeights9Pilot.lean':
        'abc2f026c5683407b6193841e6109a8f76d7c6f878d7771978c8b084e54d34b6',
    'FranklSmallCyclicWeightsPilotData.lean':
        '40eb9cb97f33e279a9032697c545de612cd373d7417e6a37bb74c9bb354ff308',
}
CORE = frozenset((3, 4, 5, 6))
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
COUNT = 128
DATA_NAME = 'FranklSmallCyclicOrbitTransportPilotData'
PROOF_NAME = 'FranklSmallCyclicOrbitTransportPilot'
NAMESPACE = 'FranklSmallCyclic.OrbitTransportPilot'


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


def lean_list(values):
    return '[' + ', '.join(map(str, values)) + ']'


def entry_literal(entry):
    return '{ word := ' + lean_list(entry['word']) + ', weights := ' + lean_list(entry['weights']) + ' }'


def geometry(period, entry):
    require(period in (7, 8, 9), 'Unsupported short period')
    require(len(entry['word']) == 7 and len(entry['weights']) == 4, 'Malformed literal entry')
    require(all(type(a) is int and 0 <= a < 16 for a in entry['word']), 'Invalid shape letter')
    require(all(type(w) is int and w >= 0 for w in entry['weights']), 'Invalid natural weight')
    full = {frozenset((start + offset) % period for offset in tile)
            for start, letter in enumerate(entry['word'])
            for bit, tile in enumerate(TILES) if letter >> bit & 1}
    local = {generator for generator in full if generator & CORE}
    support = CORE | frozenset().union(*local)
    return {'full': full, 'local': local, 'support': support}


def validate_witness(rep, member):
    source = geometry(rep['period'], rep['entry'])
    target = geometry(member['period'], member['entry'])
    pairs = member['point_map']
    require(pairs == sorted(pairs), 'Point map is not sorted by source point')
    mapping = dict(pairs)
    require(len(mapping) == len(pairs), 'Repeated source point')
    require(set(mapping) == set(source['support']), 'Source support is incomplete')
    require(len(set(mapping.values())) == len(mapping), 'Point map is not injective')
    require(all(0 <= x < rep['period'] and 0 <= y < member['period']
                for x, y in pairs), 'Point map is outside the literal periods')
    require({mapping[x] for x in CORE} == set(CORE), 'Core image mismatch')
    require({frozenset(mapping[x] for x in generator) for generator in source['local']}
            == target['local'], 'Local generator image mismatch')
    require(all(member['entry']['weights'][mapping[x] - 3] == rep['entry']['weights'][x - 3]
                for x in CORE), 'Transported natural weights mismatch')
    return source, target


def load_inputs():
    producer_path = HERE / 'generate_small_cyclic_weight_orbit_batches.py'
    spec = importlib.util.spec_from_file_location('orbit_arithmetic_batches', producer_path)
    producer = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(producer)
    packet = producer.load_packet()
    require(producer.ORBIT_SHA256 == ORBIT_SHA256, 'Different orbit packet')
    files, expected = producer.produce(packet)
    producer.check_written(files, expected, REPO / 'lean/Conjectures', BATCH_MANIFEST)
    require(sha(BATCH_MANIFEST.read_bytes()) == BATCH_MANIFEST_SHA256, 'Arithmetic manifest changed')
    for name, expected_hash in SOURCE_HASHES.items():
        require(sha((REPO / 'lean/Conjectures' / name).read_bytes()) == expected_hash,
                'Frozen public source changed: ' + name)
    rows = json.loads((HERE / 'width_four_weight_candidates.json').read_bytes())
    return packet, expected, rows


def available_sources(packet, manifest):
    records = {rep['id']: rep for rep in packet['representatives']}
    group = next(group for group in manifest['groups'] if group['id'] == 'g00')
    require(group['block_ids'] == [0, 1, 2, 3], 'Unexpected first arithmetic group')
    available = {}
    for representative_id, period, block_id, local_index in manifest['lookup']:
        if block_id not in group['block_ids']:
            continue
        block = manifest['blocks'][block_id]
        require(period == 7 and block['rows'] == 128, 'g00 block layout changed')
        available[representative_id] = {
            'kind': 'block', 'period': period, 'block_id': block_id,
            'local_index': local_index, 'namespace': block['namespace'],
            'module': block['module'], 'data_module': block['data_module'],
        }
    for rep in packet['representatives']:
        if rep['pilot'] and rep['period'] == 9:
            require(rep['source_row'] in PILOT_ROWS, 'Pilot representative is not in the public pilot')
            if len(geometry(9, rep['entry'])['support']) == 9:
                available[rep['id']] = {
                    'kind': 'pilot9', 'period': 9,
                    'module': 'Conjectures.FranklSmallCyclicWeights9Pilot',
                    'source_row': rep['source_row'],
                }
    return records, available


def candidate(rep, member, dispatch, original_rows):
    require(member['entry']['word'] == original_rows[member['source_row']][0],
            'Target word differs from the original candidate row')
    source, target = validate_witness(rep, member)
    changed = member['entry']['weights'] != original_rows[member['source_row']][1]
    moved_core = any(x in CORE and x != y for x, y in member['point_map'])
    cross_period = rep['period'] != member['period']
    nontrivial = (rep['period'], rep['source_row'], rep['entry']) != (
        member['period'], member['source_row'], member['entry']) or any(
            x != y for x, y in member['point_map'])
    features = {
        ('target_period', member['period']), ('changed_weights', changed),
        ('core_moved', moved_core), ('cross_period', cross_period),
        ('support_size', len(source['support'])),
        ('source_kind', dispatch['kind']),
    }
    if dispatch['kind'] == 'block':
        features.add(('source_block', dispatch['block_id']))
        features.add(('index_half', dispatch['local_index'] // 64))
    cost = (int(nontrivial), member['period'], len(target['support']),
            len(target['local']), len(target['full']), dispatch.get('local_index', -1),
            -member['source_row'], -rep['id'])
    return {'key': (member['period'], member['source_row']), 'rep': rep, 'member': member,
            'dispatch': dispatch, 'features': features, 'cost': cost,
            'metrics': {'source_support': len(source['support']),
                        'target_support': len(target['support']),
                        'local_generators': len(target['local']),
                        'full_generators': len(target['full']),
                        'changed_weights': changed, 'core_moved': moved_core,
                        'cross_period': cross_period, 'nontrivial': nontrivial}}


def select(packet, manifest, rows):
    records, sources = available_sources(packet, manifest)
    pool = [candidate(records[member['representative_id']], member,
                      sources[member['representative_id']], rows)
            for member in packet['members'] if member['representative_id'] in sources]
    require(len({c['key'] for c in pool}) == len(pool), 'Repeated target row/period')
    full9 = [c for c in pool if c['dispatch']['kind'] == 'pilot9' and c['metrics']['nontrivial']]
    require(full9, 'No nontrivial full-nine-point pilot transport is available')
    chosen = sorted(full9, key=lambda c: c['cost'], reverse=True)[:8]
    selected = {c['key'] for c in chosen}
    base = [c for c in pool if c['dispatch']['kind'] == 'block']

    def add_best(options):
        options = [c for c in options if c['key'] not in selected]
        if options:
            best = max(options, key=lambda c: c['cost'])
            chosen.append(best)
            selected.add(best['key'])

    for block_id in range(4):
        add_best(c for c in base if c['dispatch']['block_id'] == block_id)
    for period in (7, 8, 9):
        if not any(c['member']['period'] == period for c in chosen):
            add_best(c for c in base if c['member']['period'] == period)
    covered = set().union(*(c['features'] for c in chosen))
    while len(chosen) < COUNT:
        left = [c for c in base if c['key'] not in selected]
        require(left, 'Insufficient distinct bounded pilot cases')
        best = max(left, key=lambda c: (len(c['features'] - covered), c['cost']))
        chosen.append(best)
        selected.add(best['key'])
        covered |= best['features']
    chosen.sort(key=lambda c: c['key'])
    require(len(chosen) == COUNT, 'Pilot count changed')
    require({c['member']['period'] for c in chosen} == {7, 8, 9}, 'Pilot omits a target period')
    require({c['dispatch']['block_id'] for c in chosen if c['dispatch']['kind'] == 'block'}
            == {0, 1, 2, 3}, 'Pilot omits block-local dispatch')
    require(any(c['metrics']['source_support'] == 9 for c in chosen), 'No full-nine-point support case')
    return chosen, len(pool)


def render(chosen):
    blocks = {c['dispatch']['module']: c['dispatch'] for c in chosen
              if c['dispatch']['kind'] == 'block'}
    data = 'module\n\npublic import Conjectures.FranklSmallCyclicMaskTransport\n'
    data += ''.join('public import ' + blocks[name]['data_module'] + '\n' for name in sorted(blocks))
    data += f'''
/-! Bounded explicit transport candidates: {COUNT} literal row/period cases.
Target weights are transported witnesses and may differ from original weights.
This sample is not the complete 9,088-row table for any period.
Orbit packet SHA256: {ORBIT_SHA256}
-/
@[expose] public section

namespace {NAMESPACE}.Data

'''
    for i, case in enumerate(chosen):
        rep, member, dispatch = case['rep'], case['member'], case['dispatch']
        data += f"-- Target period {member['period']}, row {member['source_row']}; representative {rep['id']}.\n"
        if dispatch['kind'] == 'block':
            expression = dispatch['namespace'] + '.Data.entryAt ⟨' + str(dispatch['local_index']) + ', by decide +kernel⟩'
        else:
            expression = entry_literal(rep['entry'])
        data += f'def source{i} : Weights.Entry :=\n  {expression}\n\n'
        data += f'def target{i} : Weights.Entry :=\n  {entry_literal(member["entry"])}\n\n'
        points = '[' + ', '.join(f'({x}, {y})' for x, y in member['point_map']) + ']'
        data += f'def points{i} : List (ℕ × ℕ) := {points}\n\n'
    for period in (7, 8, 9):
        numbered = [(i, c) for i, c in enumerate(chosen) if c['member']['period'] == period]
        data += f'def period{period}Rows : List ℕ := ' + lean_list(c['member']['source_row'] for _, c in numbered) + '\n\n'
        data += f'def period{period}Entries : List Weights.Entry := [' + ', '.join(f'target{i}' for i, _ in numbered) + ']\n\n'
        data += f'theorem period{period}Entries_length : period{period}Entries.length = {len(numbered)} := by decide +kernel\n\n'
        data += f'theorem period{period}Rows_nodup : period{period}Rows.Nodup := by decide +kernel\n\n'
        data += f'theorem period{period}Rows_length : period{period}Rows.length = period{period}Entries.length := by decide +kernel\n\n'
    data += f'''theorem total_entries_length :
    period7Entries.length + period8Entries.length + period9Entries.length = {COUNT} := by
  decide +kernel

end {NAMESPACE}.Data
'''
    proof = 'module\n\npublic import Conjectures.' + DATA_NAME + '\n'
    proof += ''.join('public import ' + name + '\n' for name in sorted(blocks))
    proof += 'public import Conjectures.FranklSmallCyclicWeights9Pilot\n'
    proof += f'''
/-! Only the finite injective transport checks are computed here.
Source window checks are supplied by the arithmetic block and public pilot
theorems. These {COUNT} sample rows do not assert full short-period coverage. -/
@[expose] public section

namespace {NAMESPACE}

'''
    for i, case in enumerate(chosen):
        member, dispatch = case['member'], case['dispatch']
        proof += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked{i} : Weights.entryCheck {member['period']} Data.target{i} = true := by
  apply MaskTransport.maskTransportCheck_entryCheck
    (n := {dispatch['period']}) (source := Data.source{i}) (points := Data.points{i})
  · decide +kernel
'''
        if dispatch['kind'] == 'block':
            prefix = dispatch['namespace']
            proof += f'''  · exact {prefix}.window_checked
      ({prefix}.Data.entryAt_mem ⟨{dispatch['local_index']}, by decide +kernel⟩)

'''
        else:
            proof += f'''  · exact Weights.Period9Pilot.each_checked (e := Data.source{i}) (by decide +kernel)

'''
    for period in (7, 8, 9):
        indices = [i for i, c in enumerate(chosen) if c['member']['period'] == period]
        proof += f'''theorem period{period}_checked : Weights.batchCheck {period} Data.period{period}Entries = true := by
  simp only [Data.period{period}Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    ''' + ', '.join(f'checked{i}' for i in indices) + ''', Bool.true_and]

'''
        proof += f'''theorem period{period}_each_checked {{entry : Weights.Entry}}
    (he : entry ∈ Data.period{period}Entries) :
    MaskWindows.windowCheck {period} (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period{period}_checked he

'''
    proof += f'end {NAMESPACE}\n'
    return {DATA_NAME + '.lean': data.encode(), PROOF_NAME + '.lean': proof.encode()}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output-dir', type=Path, default=REPO / 'lean/Conjectures')
    parser.add_argument('--report', type=Path, required=True)
    args = parser.parse_args()
    packet, manifest, original_rows = load_inputs()
    chosen, pool_count = select(packet, manifest, original_rows)
    files = render(chosen)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    for name, raw in files.items():
        (args.output_dir / name).write_bytes(raw)
    public = [NAMESPACE + '.period' + str(n) + suffix
              for n in (7, 8, 9) for suffix in ('_checked', '_each_checked')]
    public += [NAMESPACE + '.Data.period' + str(n) + suffix
               for n in (7, 8, 9) for suffix in ('Entries_length', 'Rows_nodup', 'Rows_length')]
    public += [NAMESPACE + '.Data.total_entries_length']
    report = {
        'schema': 'frankl-short-orbit-transport-pilot-v1',
        'formal_status': 'Unverified generated pilot; fresh source, all-declaration audit, and exact stock-kernel gate required.',
        'producer_sha256': sha(Path(__file__).read_bytes()),
        'orbit_packet_sha256': ORBIT_SHA256, 'arithmetic_manifest_sha256': BATCH_MANIFEST_SHA256,
        'frozen_public_source_sha256': SOURCE_HASHES,
        'count': COUNT, 'available_pool_count': pool_count,
        'target_period_counts': dict(sorted(Counter(c['member']['period'] for c in chosen).items())),
        'source_kind_counts': dict(sorted(Counter(c['dispatch']['kind'] for c in chosen).items())),
        'source_support_counts': dict(sorted(Counter(c['metrics']['source_support'] for c in chosen).items())),
        'changed_weight_count': sum(c['metrics']['changed_weights'] for c in chosen),
        'core_moving_count': sum(c['metrics']['core_moved'] for c in chosen),
        'cross_period_count': sum(c['metrics']['cross_period'] for c in chosen),
        'selection': 'Up to eight nontrivial full-nine-support public-pilot cases; every g00 block and target period; then deterministic feature coverage and descending literal-mask cost.',
        'member_map_direction': 'representative source to target',
        'selected': [{'period': c['member']['period'], 'row': c['member']['source_row'],
                      'representative_id': c['rep']['id'], 'dispatch': c['dispatch'],
                      'source_entry': c['rep']['entry'], 'target_entry': c['member']['entry'],
                      'point_map': c['member']['point_map'], 'metrics': c['metrics']}
                     for c in chosen],
        'generated_source_sha256': {name: sha(raw) for name, raw in files.items()},
        'root': 'Conjectures.' + PROOF_NAME, 'required_endpoints': public,
        'new_private_endpoints': [NAMESPACE + '.checked' + str(i) for i in range(COUNT)],
        'coverage_limit': 'Only these 128 explicit row/period cases. No complete 9,088-row coverage, no full ShortChecked assembly, and no period-10 claim.',
        'future_full_coverage_requirements': [
            'Partition every original row 0..9087 once for each target period 7, 8, and 9.',
            'Retain the original word at every row and store the transported alternative weight vector.',
            'Check each explicit source-to-target point map using the proved mask transport API.',
            'Compose separate per-period batchCheck theorems, then apply shortWeightCheck_of_batchCheck fieldwise.',
            'Prove exact word coverage against the final Assembly input table; untrusted manifest counts do not supply that theorem.',
        ],
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_bytes(encoded(report))
    print(json.dumps({key: value for key, value in report.items() if key != 'selected'}, indent=2))


if __name__ == '__main__':
    main()
