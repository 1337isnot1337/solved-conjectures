#!/usr/bin/env python3
"""Reproduce span-four graph candidates and emit bounded Lean certificates.

The Python SCCs, counts and tables are untrusted witnesses. Only fresh Lean
source checks, explicit axiom audits and stock kernel replay verify them.
This recovery version preserves the original word order and weight input.
"""

from __future__ import annotations

import argparse
from collections import deque
from itertools import combinations
import gzip
import hashlib
import importlib.util
import json
from pathlib import Path
import subprocess
import tempfile
import time

import numpy as np
from scipy.sparse import coo_matrix
from scipy.sparse.csgraph import connected_components

ROOT = Path(__file__).resolve().parent


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def word_code(word) -> int:
    return sum(a << (4 * i) for i, a in enumerate(word))


def canonical_bytes(value) -> bytes:
    return (json.dumps(value, separators=(',', ':'), sort_keys=True) + '\n').encode()


def rank_witness(words):
    vertices = sorted({v for word in words for v in (word[:-1], word[1:])})
    index = {v: i for i, v in enumerate(vertices)}
    pairs = [(index[word[:-1]], index[word[1:]]) for word in words]
    rows, cols = zip(*pairs)
    graph = coo_matrix((np.ones(len(pairs), dtype=bool), (rows, cols)),
                       shape=(len(vertices), len(vertices))).tocsr()
    count, labels = connected_components(graph, directed=True, connection='strong')
    successors = [set() for _ in range(count)]
    indegree = [0] * count
    for a, b in pairs:
        x, y = int(labels[a]), int(labels[b])
        if x != y and y not in successors[x]:
            successors[x].add(y)
            indegree[y] += 1
    queue = deque(i for i, degree in enumerate(indegree) if degree == 0)
    order = []
    while queue:
        x = queue.popleft()
        order.append(x)
        for y in sorted(successors[x]):
            indegree[y] -= 1
            if indegree[y] == 0:
                queue.append(y)
    assert len(order) == count
    ranks = [0] * count
    for x in reversed(order):
        ranks[x] = max((ranks[y] + 1 for y in successors[x]), default=0)
    vertex_ranks = [ranks[int(label)] for label in labels]
    kept = [word for word, (a, b) in zip(words, pairs) if labels[a] == labels[b]]
    for _, (a, b) in zip(words, pairs):
        assert vertex_ranks[b] <= vertex_ranks[a]
        assert vertex_ranks[b] < vertex_ranks[a] or labels[a] == labels[b]
    table = sorted([word_code(v), rank] for v, rank in zip(vertices, vertex_ranks) if rank)
    return table, kept, {'vertices': len(vertices), 'components': int(count),
                        'nonzero_rank_entries': len(table), 'maximum_rank': max(ranks)}


def reproduce():
    began = time.monotonic()
    spec = importlib.util.spec_from_file_location('public_span_four', ROOT / 'span_four.py')
    public = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(public)
    levels = [[()]]
    for length in range(1, 7):
        levels.append([word + (a,) for word in levels[-1] for a in public.LETTERS
                       if public.possible(word + (a,))])
        print('level', length, len(levels[-1]), flush=True)
    states = levels[6]
    state_set = set(states)
    edges = [word + (a,) for word in states for a in public.LETTERS
             if word[1:] + (a,) in state_set and public.pair_survives(word + (a,))]
    pair_ranks, recurrent, pair_info = rank_witness(edges)
    assert recurrent == public.recurrent(edges)
    print('edges', len(edges), 'recurrent', len(recurrent), flush=True)
    source = ''.join(' '.join(map(str, word)) + '\n' for word in recurrent)
    with tempfile.TemporaryDirectory(prefix='frankl-span-four-graph-') as directory:
        finder, replay = Path(directory) / 'finder', Path(directory) / 'replay'
        for filename, output in [('window_filter.cpp', finder), ('window_replay.cpp', replay)]:
            subprocess.run(['c++', '-O3', '-std=c++20', str(ROOT / filename), '-o', str(output)],
                           check=True)
        found = subprocess.run([str(finder), '4'], input=source, text=True,
                               capture_output=True, check=True)
        lines = found.stdout.splitlines()
        assert len(lines) == len(recurrent)
        accepted, left4, accepted_lines = [], [], []
        for word, line in zip(recurrent, lines):
            key, separator, values = line.partition(':')
            assert tuple(map(int, key.split())) == word
            if separator:
                weights = list(map(int, values.split()))
                assert len(weights) == 4 and any(weights)
                accepted.append([list(word), weights])
                accepted_lines.append(line)
            else:
                left4.append(word)
        replayed = subprocess.run([str(replay), '4'],
            input='\n'.join(accepted_lines) + '\n', text=True, capture_output=True, check=True)
        assert int(replayed.stdout) == len(accepted)
    canonical_input = ROOT / 'width_four_weight_candidates.json'
    assert accepted == json.loads(canonical_input.read_text()), 'Original finder output changed'
    residual_ranks, residual, residual_info = rank_witness(left4)
    assert residual == public.recurrent(left4)
    data = {
        'schema': 'frankl-span-four-graph-candidate-v1',
        'encoding': 'sum(letter[p] * 16**p); first letter is least significant',
        'letters': public.LETTERS,
        'levels': [[word_code(word) for word in level] for level in levels],
        'edges': [word_code(word) for word in edges],
        'recurrent': [word_code(word) for word in recurrent],
        'left4': [word_code(word) for word in left4],
        'residual': [word_code(word) for word in residual],
        'pair_ranks': pair_ranks,
        'residual_ranks': residual_ranks,
    }
    counts = {'states': len(states), 'edges': len(edges), 'recurrent': len(recurrent),
              'weight4': len(accepted), 'left4': len(left4), 'residual': len(residual)}
    assert counts == {'states': 65248, 'edges': 227424, 'recurrent': 20265,
                      'weight4': 9088, 'left4': 11177, 'residual': 35}
    report = {'schema': 'frankl-span-four-graph-provenance-v1',
        'producer_sha256': digest(Path(__file__)),
        'source_sha256': {name: digest(ROOT / name) for name in
                         ['span_four.py', 'window_filter.cpp', 'window_replay.cpp',
                          'width_four_weight_candidates.json']},
        'counts': counts, 'level_counts': list(map(len, levels)),
        'pair_rank': pair_info, 'residual_rank': residual_info,
        'original_width_four_rows_equal': True,
        'elapsed_seconds': round(time.monotonic() - began, 3),
        'formal_status': 'Untrusted candidate snapshot; Lean coverage and rank gates required.'}
    return data, report


def tree_literal(rows, queries=None):
    if not rows or queries == set():
        return '.empty', 0
    middle = len(rows) // 2
    key, value = rows[middle]
    left_queries = None if queries is None else {x for x in queries if x < key}
    right_queries = None if queries is None else {x for x in queries if x > key}
    left, left_count = tree_literal(rows[:middle], left_queries)
    right, right_count = tree_literal(rows[middle + 1:], right_queries)
    return f'(.node {key} {value} {left} {right})', left_count + right_count + 1


def local_masks():
    tiles = (7, 11, 13, 15)
    triples = [(4 * p + j, tiles[j] << p) for p in range(4) for j in range(3)]
    patterns = set()
    for selected in combinations(triples, 3):
        if selected[0][1] & selected[1][1] & selected[2][1]:
            patterns.add(sum(1 << item[0] for item in selected))
    for p in range(4):
        quad = 15 << p
        contained = [item for item in triples if item[1] & quad == item[1]]
        for first, second in combinations(contained, 2):
            patterns.add((1 << (4 * p + 3)) | (1 << first[0]) | (1 << second[0]))
    rows = []
    for j, tile in enumerate(tiles):
        central = tile << 3
        for x, y in combinations([i for i in range(10) if central >> i & 1], 2):
            forbidden = sum(1 << (4 * p + t)
                for p in range(7) for t, h in enumerate(tiles)
                if (h << p) & central and not (h << p) & ((1 << x) | (1 << y)))
            rows.append({'shape': j, 'x': x, 'y': y, 'forbidden': forbidden})
    return {'patterns': sorted(patterns), 'pair_rows': rows}


def emit_local_metadata(data, output):
    masks = local_masks()
    patterns, rows = masks['patterns'], masks['pair_rows']
    avoiders = [a for a in range(16**4) if all(p & a != p for p in patterns)]
    assert avoiders == sorted(data['levels'][4])
    text = '''module

public import Conjectures.FranklSpanFourGraphMasks

/-! Fixed occurrence patterns. Their semantic checks below use Lean's
kernel reduction; the Python geometry is only a witness producer. -/
@[expose] public section

namespace FranklSpanFour.Graph.LocalData

def patterns : List ℕ := ''' + str(patterns) + '''

def pairRows : List PairRow :=
  [
'''
    text += ',\n'.join('    { shape := ' + str(row['shape']) + ', x := ' + str(row['x']) +
        ', y := ' + str(row['y']) + ', forbidden := ' + str(row['forbidden']) + ' }'
        for row in rows)
    text += '''
  ]

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem patterns_checked : patternMetadataCheck patterns = true := by
  decide +kernel

set_option maxRecDepth 65536 in
set_option maxHeartbeats 0 in
theorem pairRows_checked : pairMetadataCheck pairRows = true := by
  decide +kernel

theorem pair_prune_sound (a : ℕ) (hc : pairMaskCheck pairRows a = true) :
    FranklCyclic.windowPairCheck (wordOfCode 7 a) = true :=
  pairMaskCheck_sound pairRows_checked a hc

end FranklSpanFour.Graph.LocalData
'''
    output.mkdir(parents=True, exist_ok=True)
    target = output / 'FranklSpanFourGraphLocalData.lean'
    target.write_text(text)
    return {'patterns': len(patterns), 'pair_rows': len(rows), 'four_avoiders': len(avoiders),
            'source_sha256': digest(target), 'source': str(target),
            'status': 'Candidate source; strict Lean source, audit and replay required.'}


def header(imports, namespace):
    return ('module\n\n' + ''.join('public import Conjectures.' + x + '\n' for x in imports) +
            '\n@[expose] public section\n\nset_option maxRecDepth 65536\n' +
            'set_option maxHeartbeats 0\n\nnamespace ' + namespace + '\n\n')


def emit_pilot(data, output):
    ranks = dict(data['pair_ranks'])
    kept = set(data['recurrent'])
    chosen = {}
    for index, code in enumerate(data['edges']):
        feature = (ranks.get(code % 16**6, 0), ranks.get(code // 16, 0), code in kept)
        chosen.setdefault(feature, index)
    indices = set(chosen.values())
    for j in range(128):
        if len(indices) >= 128:
            break
        indices.add(j * (len(data['edges']) - 1) // 127)
    for index in range(len(data['edges'])):
        if len(indices) >= 128:
            break
        indices.add(index)
    indices = sorted(indices)
    codes = [data['edges'][index] for index in indices]
    assert len(codes) == 128
    queries = {vertex for code in codes for vertex in (code % 16**6, code // 16)}
    rank_tree, rank_nodes = tree_literal(data['pair_ranks'], queries)
    keep_queries = {code for code in codes
                    if ranks.get(code % 16**6, 0) == ranks.get(code // 16, 0)}
    keep_tree, keep_nodes = tree_literal([[code, 0] for code in sorted(kept)], keep_queries)
    four_tree, four_nodes = tree_literal([[code, 0] for code in sorted(data['levels'][4])])
    ns = 'FranklSpanFour.Graph.Pilot'
    files = {}
    files['FranklSpanFourGraphPilotData.lean'] = header(
        ['FranklSpanFourGraphAdmissible'], ns) + (
        'def indices : List ℕ := ' + str(indices) + '\n\n' +
        'def codes : List ℕ := ' + str(codes) + '\n\n' +
        'def ranks : Table :=\n  ' + rank_tree + '\n\n' +
        'def kept : Table :=\n  ' + keep_tree + '\n\n' +
        'def fours : Table :=\n  ' + four_tree + '\n\nend ' + ns + '\n')
    files['FranklSpanFourGraphRankPilot.lean'] = header(
        ['FranklSpanFourGraphPilotData'], ns) + '''theorem rank_checked :
    rankCodeCheck 6 codes kept ranks = true := by
  decide +kernel

theorem rank_semantic :
    FranklCyclic.rankListCheck ((decodeWords 7 codes).map Assembly.edge)
      (fun e => decide (Assembly.sevenOfEdge e ∈ decodeWords 7 kept.keys))
      (fun v => ranks.get (wordCode v)) = true :=
  rankCodeCheck_seven rank_checked

end ''' + ns + '\n'
    files['FranklSpanFourGraphCoveragePilot.lean'] = header(
        ['FranklSpanFourGraphPilotData'], ns) + '''theorem four_slice_checked :
    fourSliceCheck fours 0 256 = true := by
  decide +kernel

theorem four_slice_semantic {a : ℕ} (ha : a < 256)
    (hv : windowAdmissibleCheck 1 (wordOfCode 4 a) = true) :
    fours.contains a = true := by
  have hv' : windowAdmissibleCheck 1 (wordOfCode 4 (0 + a)) = true := by
    simpa only [Nat.zero_add] using hv
  simpa only [Nat.zero_add] using fourSliceCheck_sound four_slice_checked ha hv'

end ''' + ns + '\n'
    files['FranklSpanFourGraphMaskPilot.lean'] = header(
        ['FranklSpanFourGraphPilotData', 'FranklSpanFourGraphLocalData'], ns) + '''theorem fast_four_slice_checked :
    patternSliceCheck fours LocalData.patterns 0 256 = true := by
  decide +kernel

theorem fast_four_slice_semantic : fourSliceCheck fours 0 256 = true :=
  fourSliceCheck_of_patterns LocalData.patterns_checked fast_four_slice_checked

theorem pair_survivors_checked :
    codes.all (fun a => !(pairMaskCheck LocalData.pairRows a)) = true := by
  decide +kernel

end ''' + ns + '\n'
    files['FranklSpanFourGraphPilot.lean'] = header(
        ['FranklSpanFourGraphRankPilot', 'FranklSpanFourGraphCoveragePilot',
         'FranklSpanFourGraphMaskPilot'], ns) + 'end ' + ns + '\n'
    output.mkdir(parents=True, exist_ok=True)
    for name, text in files.items():
        (output / name).write_text(text)
    return {'indices': indices, 'edge_count': len(codes), 'rank_tree_nodes': rank_nodes,
            'keep_tree_nodes': keep_nodes, 'four_tree_nodes': four_nodes,
            'source_sha256': {name: digest(output / name) for name in files},
            'formal_status': 'Candidate sources; fresh Lean gate required.'}


def emit_prefix(data, output, chunk_size):
    ns = 'FranklSpanFour.Graph.PrefixCertificate'
    body = header(['FranklSpanFourGraphPrefixCoverage',
                   'FranklSpanFourGraphLocalData'], ns)
    for k in range(5):
        tree, _ = tree_literal([[a, 0] for a in sorted(data['levels'][k])])
        body += f'def level{k} : Table :=\n  {tree}\n\n'
    for k in range(4):
        values = sorted(data['levels'][k])
        chunks = [values[i:i+chunk_size] for i in range(0, len(values), chunk_size)]
        for j, chunk in enumerate(chunks):
            body += f'def seeds{k}_{j} : List ℕ := {chunk}\n\n'
        names = ', '.join(f'seeds{k}_{j}' for j in range(len(chunks)))
        body += f'def chunks{k} : List (List ℕ) := [{names}]\n\n'
        body += f'theorem chunks{k}_exact : chunks{k}.flatten = level{k}.keys := by\n  decide +kernel\n\n'
        for j in range(len(chunks)):
            body += (f'private theorem checked{k}_{j} :\n'
                f'    patternExtensionCodesCheck {k} LocalData.patterns seeds{k}_{j} level{k+1} = true := by\n'
                '  decide +kernel\n\n')
        checks = ', '.join(f'checked{k}_{j}' for j in range(len(chunks)))
        body += (f'theorem extension{k}_checked :\n'
            f'    patternExtensionCheck {k} LocalData.patterns level{k} level{k+1} = true := by\n'
            '  unfold patternExtensionCheck\n'
            f'  rw [← chunks{k}_exact, patternExtensionCodesCheck_chunks]\n'
            f'  simp only [chunks{k}, List.all_cons, List.all_nil, {checks}, Bool.true_and]\n\n')
    body += '''theorem zero_checked : level0.contains 0 = true := by decide +kernel

theorem covers0 : CoversPatterns 0 LocalData.patterns level0 :=
  coversPatterns_zero LocalData.patterns level0 zero_checked

'''
    for k in range(4):
        body += (f'theorem covers{k+1} : CoversPatterns {k+1} LocalData.patterns level{k+1} :=\n'
            f'  patternExtensionCheck_sound covers{k} extension{k}_checked\n\n')
    body += '''theorem fours_checked : fourCoverageCheck level4 = true :=
  fourCoverageCheck_of_patternPrefixes LocalData.patterns_checked covers4

theorem fours_bounded : fourBoundCheck level4 = true := by
  decide +kernel

theorem states_cover (v : Assembly.Word 6)
    (hv : windowAdmissibleCheck 3 v = true) :
    v ∈ decodeWords 6 (sixCodes level4) :=
  six_states_cover fours_checked v hv

theorem edges_cover (v : Assembly.Word 7)
    (hp : FranklCyclic.wordPrefix v ∈ decodeWords 6 (sixCodes level4))
    (hs : FranklCyclic.wordSuffix v ∈ decodeWords 6 (sixCodes level4))
    (hn : FranklCyclic.windowPairCheck v = false) :
    v ∈ decodeWords 7 (edgeCodes level4 (pairMaskCheck LocalData.pairRows)) :=
  seven_edges_cover_masks fours_bounded LocalData.pairRows_checked v hp hs hn

end ''' + ns + '\n'
    output.mkdir(parents=True, exist_ok=True)
    target = output / 'FranklSpanFourGraphPrefixCertificate.lean'
    target.write_text(body)
    return {'source': str(target), 'source_sha256': digest(target),
            'chunk_size': chunk_size, 'prefix_counts': [len(x) for x in data['levels'][:5]],
            'formal_status': 'Candidate source; fresh Lean gate required.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, required=True)
    parser.add_argument('--report', type=Path, required=True)
    parser.add_argument('--pilot-dir', type=Path)
    parser.add_argument('--local-metadata-dir', type=Path)
    parser.add_argument('--prefix-dir', type=Path)
    parser.add_argument('--prefix-chunk-size', type=int, default=32)
    args = parser.parse_args()
    assert args.prefix_chunk_size > 0
    data, report = reproduce()
    raw = canonical_bytes(data)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(gzip.compress(raw, mtime=0))
    report.update({'canonical_json_sha256': hashlib.sha256(raw).hexdigest(),
                   'gzip_sha256': digest(args.output)})
    assert report['canonical_json_sha256'] == '59de019740b6317c6976e41444c647369bf67099f0238641d47d21aba3b9750f'
    if args.local_metadata_dir:
        report['local_metadata'] = emit_local_metadata(data, args.local_metadata_dir)
    elif args.pilot_dir or args.prefix_dir:
        report['local_metadata'] = emit_local_metadata(data, args.pilot_dir or args.prefix_dir)
    if args.pilot_dir:
        report['pilot'] = emit_pilot(data, args.pilot_dir)
    if args.prefix_dir:
        report['prefix'] = emit_prefix(data, args.prefix_dir, args.prefix_chunk_size)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report['counts'], sort_keys=True), flush=True)


if __name__ == '__main__':
    main()
