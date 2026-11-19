#!/usr/bin/env python3
"""Reproduce public width-four rows and emit short-cycle Lean pilot batches.

The public span_four.py and window_filter.cpp select candidate rows. This
producer verifies their complete ordered output before selecting the pilot.
The generated Lean theorem then checks each literal modulo-n window itself;
no Python count or native replay result is a theorem premise.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent.parent
SOURCE_NAMES = ('span_four.py', 'window_filter.cpp', 'window_replay.cpp')
SHAPES = ((0, 1, 2), (0, 1, 3), (0, 2, 3), (0, 1, 2, 3))


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical_rows(rows: list) -> bytes:
    return (json.dumps(rows, separators=(',', ':')) + '\n').encode()


def reproduce_rows() -> tuple[list, dict]:
    spec = importlib.util.spec_from_file_location('public_span_four', ROOT / 'span_four.py')
    public = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(public)
    states = [()]
    for _ in range(6):
        states = [word + (a,) for word in states for a in public.LETTERS
                  if public.possible(word + (a,))]
    state_set = set(states)
    edges = [word + (a,) for word in states for a in public.LETTERS
             if word[1:] + (a,) in state_set and public.pair_survives(word + (a,))]
    recurrent = public.recurrent(edges)
    source = ''.join(' '.join(map(str, word)) + '\n' for word in recurrent)
    with tempfile.TemporaryDirectory(prefix='frankl-small-weights-') as temp:
        finder = Path(temp) / 'finder'
        replay = Path(temp) / 'replay'
        for filename, target in [('window_filter.cpp', finder), ('window_replay.cpp', replay)]:
            subprocess.run(['c++', '-O3', '-std=c++20', str(ROOT / filename), '-o', str(target)],
                           check=True)
        result = subprocess.run([str(finder), '4'], input=source, text=True,
                                capture_output=True, check=True)
        lines = result.stdout.splitlines()
        assert len(lines) == len(recurrent)
        rows = []
        accepted_lines = []
        for word, line in zip(recurrent, lines):
            key, separator, values = line.partition(':')
            assert tuple(map(int, key.split())) == word
            if separator:
                weights = list(map(int, values.split()))
                assert len(weights) == 4 and any(weights)
                assert all(0 <= value <= 3 for value in weights)
                rows.append([list(word), weights])
                accepted_lines.append(line)
        replayed = subprocess.run([str(replay), '4'],
            input='\n'.join(accepted_lines) + '\n', text=True, capture_output=True, check=True)
        assert int(replayed.stdout) == len(rows)
    assert len({tuple(word) for word, _ in rows}) == len(rows)
    assert rows == sorted(rows, key=lambda row: row[0])
    return rows, {
        'six_letter_states': len(states), 'pair_test_edges': len(edges),
        'recurrent_seven_letter_words': len(recurrent),
        'original_width_four_rows': len(rows),
        'public_native_replay_count': int(replayed.stdout),
        'source_sha256': {name: sha_bytes((ROOT / name).read_bytes()) for name in SOURCE_NAMES},
        'ordered_rows_sha256': sha_bytes(canonical_rows(rows)),
    }


def geometry(n: int, word: list[int]) -> dict:
    core = sum(1 << i for i in range(3, 7))
    generators = set()
    for p, letter in enumerate(word):
        for j, shape in enumerate(SHAPES):
            if letter >> j & 1:
                mask = 0
                for offset in shape:
                    mask |= 1 << ((p + offset) % n)
                if mask & core:
                    generators.add(mask)
    support = 0
    for generator in generators:
        support |= generator
    boundary = support & ~core
    return {'generator_count': len(generators), 'support_size': support.bit_count(),
            'boundary_size': boundary.bit_count(),
            'relevant_boundary_assignments': 3 ** boundary.bit_count()}


def row_features(row: list) -> tuple[set, int, dict]:
    word, weights = row
    info = {str(n): geometry(n, word) for n in (7, 8, 9)}
    features = {('weight_vector', tuple(weights)), ('max_weight', max(weights)),
                ('positive_weight_sites', sum(value > 0 for value in weights))}
    for period, values in info.items():
        for name in ('generator_count', 'support_size', 'boundary_size'):
            features.add((period, name, values[name]))
    cost = sum(values['relevant_boundary_assignments'] * values['generator_count']
               for values in info.values())
    return features, cost, info


def select_pilot(rows: list, count: int) -> tuple[list[int], dict]:
    assert 1 <= count <= len(rows)
    details = [row_features(row) for row in rows]
    selected = []
    for index in (0, len(rows) - 1,
                  max(range(len(rows)), key=lambda i: (details[i][1], -i))):
        if index not in selected and len(selected) < count:
            selected.append(index)
    covered = set().union(*(details[i][0] for i in selected))
    while len(selected) < count:
        best = max((i for i in range(len(rows)) if i not in selected),
                   key=lambda i: (len(details[i][0] - covered), details[i][1], -i))
        selected.append(best)
        covered |= details[best][0]
    selected.sort()
    return selected, {
        'algorithm': 'first-last-max-cost-then-greedy-feature-coverage-v1',
        'feature_count': len(covered),
        'selected_zero_based_indices': selected,
        'selected_rows': [{'source_index': i, 'word': rows[i][0], 'weights': rows[i][1],
                           'literal_geometry': details[i][2]} for i in selected],
    }


def lean_list(values: list[int]) -> str:
    return '[' + ', '.join(map(str, values)) + ']'


def emit(output: Path, rows: list, selected: list[int], digest: str, chunk_size: int) -> dict:
    output.mkdir(parents=True, exist_ok=True)
    data_name = 'FranklSmallCyclicWeightsPilotData'
    data = '''module

public import Conjectures.FranklSmallCyclicWeights

/-! Generated representative rows from the original public width-four finder.
The input is candidate data. Period-specific batch theorems check the actual
modulo-n generator families through the verified window semantics.

Canonical complete-input SHA256: ''' + digest + '''
-/
@[expose] public section

namespace FranklSmallCyclic.Weights.Pilot

def sourceIndices : List ℕ := ''' + lean_list(selected) + '''

'''
    chunks = [selected[start:start + chunk_size] for start in range(0, len(selected), chunk_size)]
    for number, chunk in enumerate(chunks):
        data += f'def chunk{number} : List Entry :=\n  [\n'
        entries = []
        for index in chunk:
            word, weights = rows[index]
            entries.append('    -- Original zero-based row ' + str(index) + '.\n'
                           '    { word := ' + lean_list(word) + ', weights := ' + lean_list(weights) + ' }')
        data += ',\n'.join(entries) + '\n  ]\n\n'
    data += 'def entries : List Entry :=\n  ' + ' ++ '.join(f'chunk{i}' for i in range(len(chunks)))
    data += '\n\nend FranklSmallCyclic.Weights.Pilot\n'
    files = {data_name + '.lean': data}
    for n in (7, 8, 9):
        name = f'FranklSmallCyclicWeights{n}Pilot'
        text = '''module

public import Conjectures.''' + data_name + '''

/-! Every row is checked on the literal period-''' + str(n) + ''' quotient.
No native replay result or external count is a theorem premise. -/
@[expose] public section

namespace FranklSmallCyclic.Weights.Period''' + str(n) + '''Pilot

'''
        for i in range(len(chunks)):
            text += '''set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
private theorem checked''' + str(i) + ' : batchCheck ' + str(n) + ' Pilot.chunk' + str(i) + ''' = true := by
  decide +kernel

'''
        text += 'theorem checked : batchCheck ' + str(n) + ' Pilot.entries = true := by\n'
        if len(chunks) == 1:
            text += '  simpa only [Pilot.entries] using checked0\n'
        else:
            text += '''  have hjoin (left right : List Entry) :
      batchCheck ''' + str(n) + ' (left ++ right) = (batchCheck ' + str(n) + ' left && batchCheck ' + str(n) + ''' right) := by
    simp only [batchCheck, List.all_append]
  simp only [Pilot.entries, hjoin, ''' + ', '.join(f'checked{i}' for i in range(len(chunks))) + ''', Bool.true_and]
'''
        text += '''
theorem each_checked {e : Entry} (he : e ∈ Pilot.entries) :
    MaskWindows.windowCheck ''' + str(n) + ''' (shapeWord e) (siteWeights e) = true :=
  batchCheck_entry checked he

end FranklSmallCyclic.Weights.Period''' + str(n) + 'Pilot\n'
        files[name + '.lean'] = text
    for name, text in files.items():
        (output / name).write_text(text)
    return {name: sha_bytes(text.encode()) for name, text in files.items()}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output-dir', type=Path, default=REPO / 'lean/Conjectures')
    parser.add_argument('--compare-cache', type=Path)
    parser.add_argument('--batch-size', type=int, default=16)
    parser.add_argument('--proof-chunk-size', type=int, default=2)
    parser.add_argument('--rows-output', type=Path,
                        help='export the complete canonical original row sequence')
    parser.add_argument('--report', type=Path)
    args = parser.parse_args()
    if args.proof_chunk_size < 1:
        parser.error('--proof-chunk-size must be positive')
    rows, provenance = reproduce_rows()
    if args.rows_output:
        args.rows_output.parent.mkdir(parents=True, exist_ok=True)
        args.rows_output.write_bytes(canonical_rows(rows))
    if args.compare_cache:
        cached = json.loads(args.compare_cache.read_text())
        candidate_rows = next(block['certificates'] for block in cached['10'] if block['width'] == 4)
        assert rows == candidate_rows, 'Complete public output differs from cached rows or order'
        provenance['compared_cache_sha256'] = sha_bytes(args.compare_cache.read_bytes())
        provenance['complete_cache_order_match'] = True
    selected, selection = select_pilot(rows, args.batch_size)
    generated = emit(args.output_dir, rows, selected, provenance['ordered_rows_sha256'],
                     args.proof_chunk_size)
    report = {'schema': 'frankl-small-cyclic-weights-pilot-v1',
              'producer_sha256': sha_bytes(Path(__file__).read_bytes()),
              'canonical_rows_encoding': "json.dumps(rows,separators=(',', ':')) + '\\n'",
              'provenance': provenance, 'selection': selection,
              'periods': [7, 8, 9], 'proof_chunk_size': args.proof_chunk_size,
              'private_chunks_per_period': (len(selected) + args.proof_chunk_size - 1) // args.proof_chunk_size,
              'generated_source_sha256': generated,
              'formal_status': 'candidate source; Lean source/audit/kernel gates required'}
    if args.report:
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({'rows': len(rows), 'rows_sha256': provenance['ordered_rows_sha256'],
                      'selected_indices': selected, 'generated_files': list(generated),
                      'cache_order_match': provenance.get('complete_cache_order_match')}, indent=2))


if __name__ == '__main__':
    main()
