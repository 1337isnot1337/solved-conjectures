#!/usr/bin/env python3
"""Generate complete literal-period transport candidates, grouped by source proof.

Every bounded proof group imports one arithmetic block or one public pilot.
Original row indices are preserved even though target rows are reordered.
The canonical input remains separate from transported alternative weights.
Per-source-group gates do not by themselves verify the integration root.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import gzip
import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parent.parent
LEAN = REPO / 'lean' / 'Conjectures'
MANIFEST = HERE / 'small_cyclic_weight_transport_batches.json'
PERIODS = (7, 8, 9, 10)
COUNT = 9088
BATCH_SIZE = 128
WORD_BLOCK_SIZE = 128
CORE = frozenset((3, 4, 5, 6))
TILES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))
PILOT_ROWS = (0, 143, 224, 288, 469, 1553, 3447, 3506,
              6030, 6279, 7962, 8172, 8307, 8361, 9045, 9087)
INPUTS = {
    'width_four_weight_candidates.json':
        '5594610818abd7f41c76121924259bd1a9a1f86417da91dce2c0f8171bcceb6a',
    'small_cyclic_weight_orbits.json.gz':
        '0994809d949f2eb51a6fa9a4899e60b87476a7fe0479bd428f4280ccd801bd6c',
    'literal_ten_weight_orbits.json.gz':
        'a361100bee79d5e087d091ce4f4b95c51992c6527edc8a8d9d98e62e1bb44416',
    'small_cyclic_weight_orbit_batches.json':
        '18246e0188eedf9ca9074b1d8bec301cc70f0ee4570aa20d0ee36789378a2ebc',
    'literal_ten_weight_orbit_batches.json':
        '250139bd7ccdf709b286bba4a3fe16830fa3c9542453c82236f196efc00f6c3b',
}
JSON_HASHES = {
    'small_cyclic_weight_orbits.json.gz':
        '337ab867a0cf0bd022db4b90cd786bbf1792d7f908900c2942beed111de3ece4',
    'literal_ten_weight_orbits.json.gz':
        'c10addb1335928af58b86e17dff93358bae8844ecfbd18020a9d8650766fec4c',
}
HELPERS = (
    'FranklSmallCyclicMaskTransport.lean',
    'FranklSmallCyclicRowCoverage.lean',
    'FranklSmallCyclicWeightsPilotData.lean',
    'FranklSmallCyclicWeights7Pilot.lean',
    'FranklSmallCyclicWeights8Pilot.lean',
    'FranklSmallCyclicWeights9Pilot.lean',
)
WORD_NAME = 'FranklSmallCyclicCanonicalWords'
WORD_NS = 'FranklSmallCyclic.CanonicalWords'
COVERAGE_NAME = 'FranklSmallCyclicTransportCoverage'
COVERAGE_NS = 'FranklSmallCyclic.TransportBatches.Coverage'
RESULT_NAME = 'FranklSmallCyclicTransportResults'
RESULT_NS = 'FranklSmallCyclic.TransportBatches'
ROW_ENDPOINTS = (
    'indexCheck_sound', 'wordsCheck_sound', 'coverageCheck_sound',
    'decode_combinedMask', 'indices_toFinset', 'allRows_length',
    'entries_length', 'indices_nodup', 'entries_checked',
    'entry_for_index', 'checked_entry_for_index', 'entry_words_toFinset',
    'entry_for_original',
)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


def encoded(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


def lean_list(values):
    return '[' + ', '.join(map(str, values)) + ']'


def entry_literal(entry):
    return '{ word := ' + lean_list(entry['word']) + ', weights := ' + lean_list(entry['weights']) + ' }'


def source_file_hash(name):
    path = LEAN / name
    require(path.is_file(), 'Missing dependency source: ' + str(path))
    return digest(path.read_bytes())


def load_checked(name):
    raw = (HERE / name).read_bytes()
    require(digest(raw) == INPUTS[name], 'Input SHA256 mismatch: ' + name)
    if name.endswith('.gz'):
        raw = gzip.decompress(raw)
        require(digest(raw) == JSON_HASHES[name], 'Canonical JSON SHA256 mismatch: ' + name)
    return json.loads(raw)


def geometry(period, entry):
    require(type(period) is int and period in PERIODS, 'Invalid literal period')
    word, weights = entry['word'], entry['weights']
    require(len(word) == 7 and len(weights) == 4, 'Invalid entry dimensions')
    require(all(type(a) is int and 0 <= a < 16 for a in word), 'Invalid shape letter')
    require(all(type(w) is int and w >= 0 for w in weights), 'Invalid natural weight')
    full = {frozenset((p + q) % period for q in tile)
            for p, letter in enumerate(word)
            for bit, tile in enumerate(TILES) if letter >> bit & 1}
    local = {generator for generator in full if generator & CORE}
    support = CORE | frozenset().union(*local)
    return local, support


def verify_witness(source, member, source_geometry):
    local, support = source_geometry
    target_local, target_support = geometry(member['period'], member['entry'])
    pairs = member['point_map']
    require(all(isinstance(pair, list) and len(pair) == 2 and
                all(type(x) is int for x in pair) for pair in pairs), 'Malformed point map')
    require(pairs == sorted(pairs), 'Unsorted point map')
    mapping = dict(pairs)
    require(len(mapping) == len(pairs), 'Repeated source key')
    require(set(mapping) == set(support), 'Incomplete source support')
    require(len(set(mapping.values())) == len(mapping), 'Noninjective point map')
    require(all(0 <= x < source['period'] and 0 <= y < member['period']
                for x, y in pairs), 'Point map outside literal periods')
    require(set(mapping.values()) == set(target_support), 'Target support mismatch')
    require({mapping[x] for x in CORE} == set(CORE), 'Core image mismatch')
    require({frozenset(mapping[x] for x in generator) for generator in local}
            == target_local, 'Local-generator image mismatch')
    require(all(member['entry']['weights'][mapping[x] - 3]
                == source['entry']['weights'][x - 3] for x in CORE),
            'Transported weight mismatch')


def block_sources(manifest, representatives, expected_ids, kind):
    require(len({block['id'] for block in manifest['blocks']}) == len(manifest['blocks']),
            'Repeated arithmetic block ID')
    blocks = {block['id']: block for block in manifest['blocks']}
    dispatch = {}
    for record in manifest['lookup']:
        require(isinstance(record, list) and len(record) == 4, 'Invalid arithmetic lookup')
        rid, period, block_id, index = record
        require(rid not in dispatch and rid in expected_ids, 'Invalid or repeated lookup ID')
        require(block_id in blocks, 'Unknown arithmetic block')
        block = blocks[block_id]
        require(type(index) is int and 0 <= index < block['rows'], 'Invalid local source index')
        representative = representatives[rid]
        require(period == representative['period'] == block['period'], 'Source period mismatch')
        require(block['representative_ids'][index] == rid, 'Source representative mismatch')
        require(block['source_rows'][index] == representative['source_row'], 'Source row mismatch')
        dispatch[rid] = {
            'kind': kind, 'block_id': block_id, 'local_index': index, 'period': period,
            'module': block['module'], 'data_module': block['data_module'],
            'namespace': block['namespace'], 'rows': block['rows'],
            'private_endpoints': block['private_endpoints'],
        }
    require(set(dispatch) == set(expected_ids), 'Incomplete arithmetic source coverage')
    for block in manifest['blocks']:
        for name, expected in block['source_sha256'].items():
            require(source_file_hash(name) == expected, 'Arithmetic source changed: ' + name)
    return dispatch


def load_inputs():
    original = load_checked('width_four_weight_candidates.json')
    short = load_checked('small_cyclic_weight_orbits.json.gz')
    literal = load_checked('literal_ten_weight_orbits.json.gz')
    short_manifest = load_checked('small_cyclic_weight_orbit_batches.json')
    literal_manifest = load_checked('literal_ten_weight_orbit_batches.json')
    require(len(original) == COUNT, 'Wrong original row count')
    require(short['schema'] == 'frankl-small-cyclic-weight-orbits-v1', 'Wrong short schema')
    require(literal['schema'] == 'frankl-literal-ten-weight-orbits-v2', 'Wrong literal schema')
    require(literal['base_packet']['sha256'] == INPUTS['small_cyclic_weight_orbits.json.gz'],
            'Wrong reused representative base')
    representatives = {}
    for representative in short['representatives'] + literal['new_representatives']:
        rid, row = representative['id'], representative['source_row']
        require(type(rid) is int and rid not in representatives, 'Repeated representative ID')
        require(type(row) is int and 0 <= row < COUNT, 'Representative row out of range')
        require(representative['entry'] == {'word': original[row][0], 'weights': original[row][1]},
                'Representative changed its original input entry')
        geometry(representative['period'], representative['entry'])
        representatives[rid] = representative
    require(set(representatives) == set(range(11020)), 'Incomplete representative ID range')
    short_ids = {r['id'] for r in short['representatives'] if not r['pilot']}
    literal_ids = {r['id'] for r in literal['new_representatives']}
    require(len(short_ids) == 9406 and literal_ids == set(range(9448, 11020)),
            'Arithmetic representative partition changed')
    sources = block_sources(short_manifest, representatives, short_ids, 'short')
    sources.update(block_sources(literal_manifest, representatives, literal_ids, 'literal10'))
    for rid, representative in representatives.items():
        if not representative['pilot']:
            continue
        period = representative['period']
        require(period in (7, 8, 9) and representative['source_row'] in PILOT_ROWS,
                'Unrecognized public pilot representative')
        sources[rid] = {
            'kind': 'pilot', 'period': period,
            'module': f'Conjectures.FranklSmallCyclicWeights{period}Pilot',
            'data_module': 'Conjectures.FranklSmallCyclicWeightsPilotData',
            'namespace': f'FranklSmallCyclic.Weights.Period{period}Pilot',
            'private_endpoints':
                [f'FranklSmallCyclic.Weights.Period{period}Pilot.checked{i}' for i in range(8)],
        }
    require(set(sources) == set(representatives), 'A representative has no source proof')
    members = short['members'] + literal['members']
    seen = set()
    source_geometry = {rid: geometry(rep['period'], rep['entry'])
                       for rid, rep in representatives.items()}
    cases = []
    for member in members:
        period, row, rid = member['period'], member['source_row'], member['representative_id']
        require(period in PERIODS and type(row) is int and 0 <= row < COUNT, 'Invalid target row')
        require((period, row) not in seen, 'Repeated original row/period pair')
        seen.add((period, row))
        require(rid in representatives, 'Unknown target representative')
        require(member['entry']['word'] == original[row][0], 'Changed original target word')
        source = representatives[rid]
        verify_witness(source, member, source_geometry[rid])
        direct = source['period'] == period and source['entry'] == member['entry']
        cases.append({
            'member': member, 'representative': source, 'source': sources[rid],
            'direct': direct,
            'changed_weights': member['entry']['weights'] != original[row][1],
        })
    require(seen == {(period, row) for period in PERIODS for row in range(COUNT)},
            'Incomplete original row/period coverage')
    require(sum(case['direct'] for case in cases) == 11020, 'Direct-source reuse count changed')
    helper_hashes = {name: source_file_hash(name) for name in HELPERS}
    return original, cases, helper_hashes


def source_key(source):
    if source['kind'] == 'short':
        return 0, source['block_id']
    if source['kind'] == 'pilot':
        return 1, source['period']
    return 2, source['block_id']


def balanced_lookup(low, high, indent):
    if high - low == 1:
        return (indent + f'⟨block{low:03d}.getD offset 0,\n' + indent +
                f'  getD_lt block{low:03d} offset block{low:03d}_bounded_check⟩\n')
    middle = (low + high) // 2
    return (indent + f'if block < {middle} then\n' +
            balanced_lookup(low, middle, indent + '  ') +
            indent + 'else\n' + balanced_lookup(middle, high, indent + '  '))


def render_words(original):
    codes = [sum(letter * 16 ** p for p, letter in enumerate(row[0])) for row in original]
    require(all(0 <= code < 16 ** 7 for code in codes), 'Canonical code outside seven nibbles')
    text = f'''module

public import Conjectures.FranklSmallCyclicWeights

/-! Canonical original words in their published row order.
Input SHA256: {INPUTS['width_four_weight_candidates.json']}
Codes are little-endian base16; only the word is stored here.
The original weight vectors remain in the frozen JSON input.
-/
@[expose] public section

namespace {WORD_NS}

def count : ℕ := {COUNT}

'''
    blocks = [codes[i:i + WORD_BLOCK_SIZE] for i in range(0, len(codes), WORD_BLOCK_SIZE)]
    require(len(blocks) == 71 and all(len(block) == 128 for block in blocks),
            'Unexpected canonical block layout')
    for index, block in enumerate(blocks):
        text += f'def block{index:03d} : List ℕ := ' + lean_list(block) + '\n\n'
        text += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem block{index:03d}_bounded_check :
    block{index:03d}.all (fun code => decide (code < 16 ^ 7)) = true := by
  decide +kernel

'''
    text += '''theorem getD_lt (values : List ℕ) (i : ℕ) :
    values.all (fun code => decide (code < 16 ^ 7)) = true →
      values.getD i 0 < 16 ^ 7 := by
  induction values generalizing i with
  | nil =>
      intro _
      change 0 < 16 ^ 7
      decide
  | cons a rest ih =>
      intro h
      cases i with
      | zero =>
          change a < 16 ^ 7
          exact of_decide_eq_true (Bool.and_eq_true_iff.mp h).1
      | succ i =>
          change rest.getD i 0 < 16 ^ 7
          exact ih i (Bool.and_eq_true_iff.mp h).2

def boundedCodeAt (i : ℕ) : {code : ℕ // code < 16 ^ 7} :=
  if i < count then
    let block := i / 128
    let offset := i % 128
'''
    text += balanced_lookup(0, len(blocks), '    ')
    text += '''  else ⟨0, by decide⟩

def codeAt (i : ℕ) : ℕ := (boundedCodeAt i).val

def wordAt (i : ℕ) : List ℕ :=
  let code := codeAt i
  List.ofFn (fun p : Fin 7 => code / 16 ^ p.val % 16)

def codes : List ℕ := (List.range count).map codeAt

def words : List (List ℕ) := (List.range count).map wordAt

theorem count_eq : count = 9088 := rfl

theorem codes_length : codes.length = count := by
  simp [codes]

theorem words_length : words.length = count := by
  simp [words]

theorem wordAt_eq (i : ℕ) :
    wordAt i = List.ofFn (fun p : Fin 7 => codeAt i / 16 ^ p.val % 16) := rfl

theorem wordAt_length (i : ℕ) : (wordAt i).length = 7 := by
  simp [wordAt]

theorem codeAt_all_lt (i : ℕ) : codeAt i < 16 ^ 7 :=
  (boundedCodeAt i).property

theorem codeAt_lt {i : ℕ} (_hi : i < count) : codeAt i < 16 ^ 7 :=
  codeAt_all_lt i

theorem codeAt_bounded_check :
    (List.range count).all (fun i => decide (codeAt i < 16 ^ 7)) = true := by
  apply List.all_eq_true.mpr
  intro i _
  exact decide_eq_true (codeAt_all_lt i)

'''
    text += f'end {WORD_NS}\n'
    endpoints = [WORD_NS + '.' + name for name in (
        'count_eq', 'codes_length', 'words_length', 'wordAt_eq', 'wordAt_length',
        'getD_lt', 'codeAt_all_lt', 'codeAt_bounded_check', 'codeAt_lt')]
    endpoints += [WORD_NS + f'.block{i:03d}_bounded_check' for i in range(len(blocks))]
    return text.encode(), endpoints


def source_expression(case):
    source = case['source']
    if source['kind'] == 'pilot':
        return entry_literal(case['representative']['entry'])
    return (source['namespace'] + '.Data.entryAt ⟨' + str(source['local_index']) +
            ', by decide +kernel⟩')


def source_window_proof(case):
    source = case['source']
    if source['kind'] == 'pilot':
        return source['namespace'] + '.each_checked (e := Data.source{index}) (by decide +kernel)'
    return (source['namespace'] + '.window_checked\n      (' + source['namespace'] +
            '.Data.entryAt_mem ⟨' + str(source['local_index']) + ', by decide +kernel⟩)')


def proof_all(definition, proofs):
    require(proofs, 'A generated all-proof must be nonempty')
    return ('  simp only [' + definition + ', List.all_cons, List.all_nil,\n    ' +
            ', '.join(proofs) + ', Bool.true_and]\n')


def render_batch(group_index, batch_index, batch_id, cases):
    require(0 < len(cases) <= BATCH_SIZE, 'Invalid transport batch size')
    source = cases[0]['source']
    require(all(source_key(case['source']) == source_key(source) for case in cases),
            'Transport batch spans source arithmetic blocks')
    stem = f'FranklSmallCyclicTransportG{group_index:03d}B{batch_index:03d}'
    namespace = f'{RESULT_NS}.G{group_index:03d}.B{batch_index:03d}'
    data = ('module\n\npublic import Conjectures.FranklSmallCyclicRowCoverage\n' +
            f'public import Conjectures.{WORD_NAME}\n' +
            'public import ' + source['data_module'] + '\n')
    data += f'''
/-! {len(cases)} literal targets sharing one source proof block.
Original words and row indices are retained; weights may be transported.
-/
@[expose] public section

namespace {namespace}.Data

'''
    for index, case in enumerate(cases):
        member, representative = case['member'], case['representative']
        data += (f'-- Period {member["period"]}, original row {member["source_row"]}, '
                 f'representative {representative["id"]}.\n')
        data += f'def source{index} : Weights.Entry :=\n  {source_expression(case)}\n\n'
        data += f'def target{index} : Weights.Entry :=\n  {entry_literal(member["entry"])}\n\n'
        if not case['direct']:
            pairs = ', '.join(f'({x}, {y})' for x, y in member['point_map'])
            data += f'def points{index} : List (ℕ × ℕ) := [{pairs}]\n\n'
    period_metadata = {}
    required = []
    for period in PERIODS:
        numbered = [(i, c) for i, c in enumerate(cases) if c['member']['period'] == period]
        if not numbered:
            continue
        row_mask = sum(1 << c['member']['source_row'] for _, c in numbered)
        require(len({c['member']['source_row'] for _, c in numbered}) == len(numbered),
                'Duplicate row within a period chunk')
        entries = ', '.join(f'target{i}' for i, _ in numbered)
        rows = ', '.join(f'⟨{c["member"]["source_row"]}, target{i}⟩' for i, c in numbered)
        data += f'''def period{period}Entries : List Weights.Entry := [{entries}]

def period{period}Chunk : RowCoverage.Chunk where
  rows := [{rows}]
  indexMask := {row_mask}
  count := {len(numbered)}

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}Chunk_entries :
    period{period}Chunk.rows.map RowCoverage.TaggedRow.entry = period{period}Entries := rfl

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_index_check :
    RowCoverage.indexCheck CanonicalWords.count period{period}Chunk = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_words_check :
    RowCoverage.wordsCheck CanonicalWords.wordAt period{period}Chunk = true := by
  decide +kernel

'''
        period_metadata[str(period)] = {
            'rows': len(numbered), 'row_mask': str(row_mask),
            'source_rows': [c['member']['source_row'] for _, c in numbered],
            'chunk': namespace + f'.Data.period{period}Chunk',
            'entries': namespace + f'.Data.period{period}Entries',
            'index_check': namespace + f'.Data.period{period}_index_check',
            'words_check': namespace + f'.Data.period{period}_words_check',
            'chunk_checked': namespace + f'.period{period}_chunk_checked',
        }
        required += [namespace + f'.Data.period{period}' + suffix for suffix in
                     ('Chunk_entries', '_index_check', '_words_check')]
    data += f'end {namespace}.Data\n'
    proof = ('module\n\npublic import Conjectures.' + stem + 'Data\n' +
             'public import ' + source['module'] + '\n')
    proof += f'''
/-! Literal source entries reuse their existing proof directly.
Other targets use the finite injective mask-transport theorem.
-/
@[expose] public section

namespace {namespace}

'''
    for index, case in enumerate(cases):
        member, dispatch = case['member'], case['source']
        proof += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked{index} : Weights.entryCheck {member['period']} Data.target{index} = true := by
'''
        if case['direct']:
            if dispatch['kind'] == 'pilot':
                proof += (f'  exact List.all_eq_true.mp {dispatch["namespace"]}.checked '
                          f'Data.target{index} (by decide +kernel)\n\n')
            else:
                proof += (f'  exact {dispatch["namespace"]}.entryAt_checked '
                          f'⟨{dispatch["local_index"]}, by decide +kernel⟩\n\n')
        else:
            proof += f'''  apply MaskTransport.maskTransportCheck_entryCheck
    (n := {dispatch['period']}) (source := Data.source{index}) (points := Data.points{index})
  · decide +kernel
  · '''
            proof += source_window_proof(case).replace('{index}', str(index)) + '\n\n'
    for period in PERIODS:
        numbered = [i for i, c in enumerate(cases) if c['member']['period'] == period]
        if not numbered:
            continue
        proof += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_checked :
    Weights.batchCheck {period} Data.period{period}Entries = true := by
  simp only [Data.period{period}Entries, Weights.batchCheck, List.all_cons, List.all_nil,
    ''' + ', '.join(f'checked{i}' for i in numbered) + ''', Bool.true_and]

'''
        proof += f'''theorem period{period}_chunk_checked :
    Weights.batchCheck {period} (Data.period{period}Chunk.rows.map RowCoverage.TaggedRow.entry) = true := by
  rw [Data.period{period}Chunk_entries]
  exact period{period}_checked

theorem period{period}_each_checked {{entry : Weights.Entry}}
    (he : entry ∈ Data.period{period}Entries) :
    MaskWindows.windowCheck {period} (Weights.shapeWord entry) (Weights.siteWeights entry) = true :=
  Weights.batchCheck_entry period{period}_checked he

'''
        required += [namespace + f'.period{period}' + suffix for suffix in
                     ('_checked', '_chunk_checked', '_each_checked')]
    proof += f'end {namespace}\n'
    files = {stem + 'Data.lean': data.encode(), stem + '.lean': proof.encode()}
    record = {
        'id': batch_id, 'group_index': group_index, 'group_batch_index': batch_index,
        'module': 'Conjectures.' + stem, 'data_module': 'Conjectures.' + stem + 'Data',
        'namespace': namespace, 'rows': len(cases),
        'private_chunks': len(cases),
        'direct_source_reuse': sum(case['direct'] for case in cases),
        'transport_checks': sum(not case['direct'] for case in cases),
        'periods': period_metadata,
        'private_endpoints': [namespace + f'.checked{i}' for i in range(len(cases))],
        'required_endpoints': required,
        'source_sha256': {name: digest(raw) for name, raw in files.items()},
    }
    return files, record


def render_coverage(blocks):
    text = 'module\n\n'
    text += ''.join('public import ' + block['data_module'] + '\n' for block in blocks)
    text += f'''
/-! Complete original-row coverage, independent of numeric proof modules.
The row-mask/count checks establish each original index exactly once.
-/
@[expose] public section

namespace {COVERAGE_NS}

'''
    required = []
    for period in PERIODS:
        selected = [block['periods'][str(period)] for block in blocks
                    if str(period) in block['periods']]
        chunks = ', '.join(item['chunk'] for item in selected)
        text += f'''def period{period}Chunks : List RowCoverage.Chunk := [{chunks}]

def period{period}Entries : List Weights.Entry := RowCoverage.entries period{period}Chunks

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_coverage_check :
    RowCoverage.coverageCheck CanonicalWords.count period{period}Chunks = true := by
  decide +kernel

theorem period{period}_coverage : RowCoverage.Covers CanonicalWords.count period{period}Chunks :=
  RowCoverage.coverageCheck_sound period{period}_coverage_check

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_index_checks :
    period{period}Chunks.all (RowCoverage.indexCheck CanonicalWords.count) = true := by
'''
        text += proof_all(f'period{period}Chunks', [item['index_check'] for item in selected]) + '\n'
        text += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_word_checks :
    period{period}Chunks.all (RowCoverage.wordsCheck CanonicalWords.wordAt) = true := by
'''
        text += proof_all(f'period{period}Chunks', [item['words_check'] for item in selected]) + '\n'
        text += f'''theorem period{period}_indexed :
    ∀ chunk ∈ period{period}Chunks, RowCoverage.Indexed CanonicalWords.count chunk := by
  intro chunk hchunk
  exact RowCoverage.indexCheck_sound (List.all_eq_true.mp period{period}_index_checks chunk hchunk)

theorem period{period}_words :
    ∀ chunk ∈ period{period}Chunks, RowCoverage.WordsAgree CanonicalWords.wordAt chunk := by
  intro chunk hchunk
  exact RowCoverage.wordsCheck_sound (List.all_eq_true.mp period{period}_word_checks chunk hchunk)

theorem period{period}_indices_nodup : (RowCoverage.indices period{period}Chunks).Nodup :=
  RowCoverage.indices_nodup period{period}_indexed period{period}_coverage

theorem period{period}_indices_toFinset :
    (RowCoverage.indices period{period}Chunks).toFinset = Finset.range CanonicalWords.count :=
  RowCoverage.indices_toFinset period{period}_indexed period{period}_coverage

theorem period{period}_entries_length : period{period}Entries.length = CanonicalWords.count :=
  RowCoverage.entries_length period{period}_indexed period{period}_coverage

theorem period{period}_entry_words :
    (period{period}Entries.map Weights.Entry.word).toFinset =
      (Finset.range CanonicalWords.count).image CanonicalWords.wordAt :=
  RowCoverage.entry_words_toFinset period{period}_indexed period{period}_coverage period{period}_words

'''
        required += [COVERAGE_NS + f'.period{period}' + suffix for suffix in (
            '_coverage_check', '_coverage', '_index_checks', '_word_checks',
            '_indexed', '_words', '_indices_nodup', '_indices_toFinset',
            '_entries_length', '_entry_words')]
    text += f'end {COVERAGE_NS}\n'
    return text.encode(), required


def render_results(blocks):
    text = 'module\n\npublic import Conjectures.' + COVERAGE_NAME + '\n'
    text += ''.join('public import ' + block['module'] + '\n' for block in blocks)
    text += f'''
/-! Integration of every source-group transport proof.
This root is excluded from the bounded group selector. Its own complete
source, axiom, and exact-kernel gate is required before accepting its claims.
Canonical graph-word coverage remains a separate assembly obligation.
-/
@[expose] public section

namespace {RESULT_NS}

'''
    required = []
    for period in PERIODS:
        selected = [block['periods'][str(period)] for block in blocks
                    if str(period) in block['periods']]
        text += f'''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem period{period}_chunk_checks :
    Coverage.period{period}Chunks.all (fun chunk =>
      Weights.batchCheck {period} (chunk.rows.map RowCoverage.TaggedRow.entry)) = true := by
'''
        text += proof_all(f'Coverage.period{period}Chunks', [item['chunk_checked'] for item in selected]) + '\n'
        text += f'''theorem period{period}_chunks_checked :
    ∀ chunk ∈ Coverage.period{period}Chunks,
      Weights.batchCheck {period} (chunk.rows.map RowCoverage.TaggedRow.entry) = true :=
  fun chunk hchunk => List.all_eq_true.mp period{period}_chunk_checks chunk hchunk

theorem period{period}_checked :
    Weights.batchCheck {period} Coverage.period{period}Entries = true :=
  RowCoverage.entries_checked period{period}_chunks_checked

theorem period{period}_checked_entry_for_index {{i : ℕ}} (hi : i < CanonicalWords.count) :
    ∃ entry ∈ Coverage.period{period}Entries,
      entry.word = CanonicalWords.wordAt i ∧ Weights.entryCheck {period} entry = true :=
  RowCoverage.checked_entry_for_index Coverage.period{period}_indexed
    Coverage.period{period}_coverage Coverage.period{period}_words period{period}_chunks_checked hi

'''
        required += [RESULT_NS + f'.period{period}' + suffix for suffix in (
            '_chunk_checks', '_chunks_checked', '_checked', '_checked_entry_for_index')]
    text += f'end {RESULT_NS}\n'
    return text.encode(), required


def produce():
    original, cases, helper_hashes = load_inputs()
    buckets = defaultdict(list)
    for case in cases:
        buckets[source_key(case['source'])].append(case)
    require(len(buckets) == 103, 'Source group count changed')
    files = {}
    word_source, word_endpoints = render_words(original)
    files[WORD_NAME + '.lean'] = word_source
    blocks, groups, lookup = [], [], []
    for group_index, key in enumerate(sorted(buckets)):
        records = sorted(buckets[key], key=lambda case:
                         (case['member']['period'], case['member']['source_row']))
        source = dict(records[0]['source'])
        source.pop('local_index', None)
        group_blocks = []
        for offset in range(0, len(records), BATCH_SIZE):
            chosen = records[offset:offset + BATCH_SIZE]
            batch_index, batch_id = offset // BATCH_SIZE, len(blocks)
            generated, block = render_batch(group_index, batch_index, batch_id, chosen)
            require(not (set(files) & set(generated)), 'Repeated generated filename')
            files.update(generated)
            blocks.append(block)
            group_blocks.append(block)
            for local_index, case in enumerate(chosen):
                member = case['member']
                lookup.append([member['period'], member['source_row'], group_index,
                               batch_id, local_index, member['representative_id'],
                               'direct' if case['direct'] else 'transport'])
        group_required = (word_endpoints +
                          ['FranklSmallCyclic.RowCoverage.' + name for name in ROW_ENDPOINTS] +
                          [endpoint for block in group_blocks for endpoint in block['required_endpoints']])
        groups.append({
            'id': f'g{group_index:03d}', 'index': group_index, 'source': source,
            'block_ids': [block['id'] for block in group_blocks],
            'modules': [block['module'] for block in group_blocks],
            'rows': len(records),
            'direct_source_reuse': sum(case['direct'] for case in records),
            'transport_checks': sum(not case['direct'] for case in records),
            'changed_weight_vectors': sum(case['changed_weights'] for case in records),
            'period_counts': {str(period): count for period, count in
                              sorted(Counter(case['member']['period'] for case in records).items())},
            'required_endpoints': sorted(set(group_required)),
            'private_endpoints': (source['private_endpoints'] +
                                  [endpoint for block in group_blocks for endpoint in block['private_endpoints']]),
        })
    require(len(blocks) == 335 and len(lookup) == 36352, 'Final transport partition changed')
    coverage_source, coverage_endpoints = render_coverage(blocks)
    result_source, result_endpoints = render_results(blocks)
    files[COVERAGE_NAME + '.lean'] = coverage_source
    files[RESULT_NAME + '.lean'] = result_source
    manifest = {
        'schema': 'frankl-small-cyclic-weight-transport-batches-v1',
        'formal_status': ('Generated candidates. Each bounded source group needs a fresh proof gate. '
                          'The coverage and full integration roots have separate gates; group passes '
                          'do not establish canonical graph-word coverage or final assembly.'),
        'producer_sha256': digest(Path(__file__).read_bytes()),
        'input_sha256': INPUTS, 'canonical_json_sha256': JSON_HASHES,
        'helper_sha256': helper_hashes,
        'periods': list(PERIODS), 'rows_per_period': COUNT,
        'max_rows_per_batch': BATCH_SIZE, 'source_group_count': len(groups),
        'block_count': len(blocks), 'target_count': len(cases),
        'direct_source_reuse': sum(case['direct'] for case in cases),
        'transport_check_count': sum(not case['direct'] for case in cases),
        'private_target_proofs': len(cases),
        'changed_weight_vectors': sum(case['changed_weights'] for case in cases),
        'source_group_order': 'short arithmetic block; public pilot period; literal10 arithmetic block',
        'target_order_within_group': 'period then original source_row',
        'target_lookup_schema': ['period', 'original_row', 'source_group_index', 'block_id',
                                 'block_local_index', 'representative_id', 'proof_method'],
        'target_lookup': sorted(lookup),
        'weight_semantics': ('Each target uses its frozen orbit-member entry.weights, which may differ '
                             'from the original candidate vector. Direct cases are the identical '
                             'source entry at the identical period; their serialized map is unused '
                             'by Lean. All point maps are independently replayed by this producer.'),
        'canonical_words': {
            'module': 'Conjectures.' + WORD_NAME, 'namespace': WORD_NS,
            'lookup': '71 bounded128-row lists selected by a balanced binary decision tree',
            'code': 'sum(word[p] *16^p), first letter least significant',
            'required_endpoints': word_endpoints,
        },
        'initial_gate_group': groups[0]['id'],
        'groups': groups, 'blocks': blocks,
        'separate_coverage_gate': {
            'root': 'Conjectures.' + COVERAGE_NAME, 'required_endpoints': coverage_endpoints,
            'numeric_proof_modules_imported': False,
        },
        'separate_integration_gate': {
            'root': 'Conjectures.' + RESULT_NAME, 'required_endpoints': result_endpoints,
            'excluded_from_bounded_group_selection': True,
        },
        'source_sha256': {name: digest(raw) for name, raw in sorted(files.items())},
    }
    return files, manifest


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, default=LEAN)
    parser.add_argument('--manifest', type=Path, default=MANIFEST)
    parser.add_argument('--check', action='store_true',
                        help='reproduce every byte and compare, without writing')
    args = parser.parse_args()
    files, manifest = produce()
    expected_manifest = encoded(manifest)
    if args.check:
        for name, raw in files.items():
            path = args.output / name
            require(path.is_file() and path.read_bytes() == raw, 'Generated source mismatch: ' + name)
        require(args.manifest.is_file() and args.manifest.read_bytes() == expected_manifest,
                'Transport manifest mismatch')
    else:
        args.output.mkdir(parents=True, exist_ok=True)
        for name, raw in files.items():
            (args.output / name).write_bytes(raw)
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        args.manifest.write_bytes(expected_manifest)
    print(json.dumps({
        'source_groups': manifest['source_group_count'], 'batches': manifest['block_count'],
        'targets': manifest['target_count'], 'direct_source_reuse': manifest['direct_source_reuse'],
        'transport_checks': manifest['transport_check_count'], 'files': len(files),
        'generated_source_bytes': sum(map(len, files.values())),
        'manifest_sha256': digest(expected_manifest),
        'status': 'reproduced candidates' if args.check else 'generated candidates',
    }, sort_keys=True))


if __name__ == '__main__':
    main()
