#!/usr/bin/env python3
"""Encode the untrusted six-plane certificates as ordinary Lean definitions.

The small pilot theorems measure kernel reduction before the full finite proof
is assembled. Generation alone does not mark any theorem as accepted.
"""

import argparse
import json
from pathlib import Path


def array(values):
    return '#[' + ', '.join(map(str, values)) + ']'


def vector(values):
    return '![' + ', '.join(map(str, values)) + ']'


def write_source(path, source):
    if path.exists() and path.read_text() == source:
        return
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(source)
    temporary.replace(path)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--certificates', type=Path, required=True)
    parser.add_argument('--lean-dir', type=Path, required=True)
    parser.add_argument('--full', action='store_true',
                        help='Also emit all100 finite pair blocks and their closed assembly')
    args = parser.parse_args()
    table = json.loads((args.certificates / 'tables.json').read_text())
    codes = (args.certificates / 'pair-codes.bin').read_bytes()
    assert len(codes) == 1152000
    pool, ids, index = [], [], {}
    for start in range(0, len(codes), 32):
        word = int.from_bytes(codes[start:start + 32], 'little')
        if word not in index:
            index[word] = len(pool)
            pool.append(word)
        ids.append(index[word])
    assert len(ids) == 36000 and len(pool) == 742
    args.lean_dir.mkdir(parents=True, exist_ok=True)
    definitions = ['import Conjectures.LonelinessSixPlaneDefs\n',
                   '/-! Untrusted finite data. Acceptance is proved in separate kernel-checked modules. -/\n',
                   'set_option maxRecDepth 100000\n',
                   'namespace Loneliness.SixPlane.Data\n']
    definitions.append('def positivePacked : Array (Array ℕ) := #[\n  ' +
                       ',\n  '.join(array(row) for row in table['positive_packed']) + '\n]\n')
    definitions.append('def rankRows : Array (Array ℕ) := #[\n  ' +
                       ',\n  '.join(array(row) for row in table['rank_to_row']) + '\n]\n')
    definitions.append('def certificateWords : Array ℕ :=\n  ' + array(pool) + '\n')
    definitions.append('noncomputable def certificateWordIds : Array (Array ℕ) := #[\n  ' +
                       ',\n  '.join(array(ids[i:i + 360]) for i in range(0, len(ids), 360)) + '\n]\n')
    definitions.append('end Loneliness.SixPlane.Data\n')
    write_source(args.lean_dir / 'LonelinessSixPlaneDataTables.lean', '\n'.join(definitions))

    definitions = ['import Conjectures.LonelinessSixPlaneEnumeration',
                   'import Conjectures.LonelinessSixPlaneDataTables\n',
                   'namespace Loneliness.SixPlane.Data\n',
                   '''def directionAt (j : Fin 10) (row : Fin 360) : Vector :=
  fun i => Int.ofNat ((((positivePacked.getD j.val #[]).getD row.val 0) >>>
    (4 * i.val)) % 16)

def rankToRow (j : Fin 10) (rank : Fin 720) : Fin 360 :=
  ⟨((rankRows.getD j.val #[]).getD rank.val 0) % 360, Nat.mod_lt _ (by decide)⟩
''']
    for k, witness in enumerate(table['acceptances']):
        p = witness['permutation']
        inv = [p.index(i) for i in range(6)]
        definitions.append(f'''def acceptance{k} : Acceptance where
  kind := {witness['kind']}
  permutation := {{
    toFun := {vector(p)}
    invFun := {vector(inv)}
    left_inv := by decide +kernel
    right_inv := by decide +kernel }}
  mask := {witness['mask']}
''')
    definitions.append('def acceptances : Array Acceptance := ' +
                       array(f'acceptance{k}' for k in range(len(table['acceptances']))) + '\n')
    pairs = [f'({i}, {j})' for i in range(6) for j in range(i + 1, 6)]
    definitions.append('def rejectionPairs : Array (Fin 6 × Fin 6) := ' + array(pairs) + '\n')
    definitions.append('''def decodeCertificate (code : ℕ) : PairCertificate :=
  if code = 0 then .dependent
  else if code ≤ 30 then
    let ij := rejectionPairs.getD ((code - 1) / 2) (0, 1)
    .coordinate ij.1 ij.2 ((code - 1) % 2 == 0)
  else if code ≤ 60 then
    let ij := rejectionPairs.getD ((code - 31) / 2) (0, 1)
    .line ij.1 ij.2 ((code - 31) % 2 == 0)
  else .accepted (acceptances.getD (code - 61) acceptance0)

noncomputable def rowCertificates (i j : Fin 10) (row : Fin 360) (mask : Fin 32) : PairCertificate :=
  let wordId := (certificateWordIds.getD (10 * i.val + j.val) #[]).getD row.val 0
  let word := certificateWords.getD wordId 0
  decodeCertificate ((word >>> (8 * mask.val)) % 256)

noncomputable def partialCheck (i j : Fin 10) (start count : ℕ) : Bool :=
  (List.range count).all fun offset =>
    let row : Fin 360 := ⟨(start + offset) % 360, Nat.mod_lt _ (by decide)⟩
    certificateRowCheck directionAt i j row (rowCertificates i j row)

end Loneliness.SixPlane.Data
''')
    write_source(args.lean_dir / 'LonelinessSixPlaneDataDefs.lean', '\n'.join(definitions))
    for name, count in [('Small', 1), ('Eight', 8), ('Forty', 40)]:
        source = f'''import Conjectures.LonelinessSixPlaneDataDefs

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pilot{name} : partialCheck 0 0 0 {count} = true := by
  decide +kernel

end Loneliness.SixPlane.Data
'''
        write_source(args.lean_dir / f'LonelinessSixPlaneDataPilot{name}.lean', source)
    for j in range(10):
        parts = ['import Conjectures.LonelinessSixPlaneDataCoverageSoundness',
                 'import Mathlib.Tactic.FinCases\n',
                 'namespace Loneliness.SixPlane.Data\n']
        for block in range(12):
            parts.append(f'''set_option maxRecDepth 100000 in
theorem direction_{j:02}_{block:02} : partialDirectionCheck {j} {60*block} 60 = true := by
  decide +kernel
''')
        parts.append(f'''theorem direction_cases_{j:02} (block : Fin 12) :
    partialDirectionCheck {j} (block.val * 60) 60 = true := by
  fin_cases block''')
        parts += [f'  · exact direction_{j:02}_{block:02}' for block in range(12)]
        parts.append('\nend Loneliness.SixPlane.Data\n')
        write_source(args.lean_dir / f'LonelinessSixPlaneDataCoverage{j:02}.lean', '\n'.join(parts))
    parts = [f'import Conjectures.LonelinessSixPlaneDataCoverage{j:02}' for j in range(10)]
    parts += ['\nnamespace Loneliness.SixPlane.Data\n',
              '''theorem directions_complete : directionCoverageCheck directionAt rankToRow = true := by
  apply directionCoverageCheck_of_fixed_chunks 60 12 (by decide) (by decide)
  intro j block
  fin_cases j''']
    parts += [f'  · exact direction_cases_{j:02} block' for j in range(10)]
    parts.append('\nend Loneliness.SixPlane.Data\n')
    coverage = '\n'.join(parts)
    write_source(args.lean_dir / 'LonelinessSixPlaneDataCoverage.lean', coverage)
    if args.full:
        for i in range(10):
            for j in range(10):
                parts = ['import Conjectures.LonelinessSixPlaneDataDefs',
                         'import Mathlib.Tactic.FinCases\n',
                         'namespace Loneliness.SixPlane.Data\n']
                for block in range(9):
                    parts.append(f'''set_option maxRecDepth 100000 in
theorem pair_{i:02}_{j:02}_{block:02} : partialCheck {i} {j} {40*block} 40 = true := by
  decide +kernel
''')
                parts.append(f'''theorem pair_cases_{i:02}_{j:02} (block : Fin 9) :
    partialCheck {i} {j} (block.val * 40) 40 = true := by
  fin_cases block''')
                parts += [f'  · exact pair_{i:02}_{j:02}_{block:02}' for block in range(9)]
                parts.append('\nend Loneliness.SixPlane.Data\n')
                write_source(args.lean_dir / f'LonelinessSixPlaneDataBlock{i:02}_{j:02}.lean', '\n'.join(parts))
        parts = ['import Conjectures.LonelinessSixPlaneChunkSoundness',
                 'import Conjectures.LonelinessSixPlaneDataCoverage']
        parts += [f'import Conjectures.LonelinessSixPlaneDataBlock{i:02}_{j:02}'
                  for i in range(10) for j in range(10)]
        parts += ['\nnamespace Loneliness.SixPlane.Data\n',
                  '''theorem all_pair_chunks (i j : Fin 10) (block : Fin 9) :
    partialCheck i j (block.val * 40) 40 = true := by
  fin_cases i''']
        for i in range(10):
            parts.append('  · fin_cases j')
            parts += [f'    · exact pair_cases_{i:02}_{j:02} block' for j in range(10)]
        parts.append('''
theorem candidate_pairs_checked : CandidatePairsChecked :=
  candidatePairsChecked_of_fixed_chunks directions_complete 40 9
    (by decide) (by decide) all_pair_chunks

end Loneliness.SixPlane.Data
''')
        write_source(args.lean_dir / 'LonelinessSixPlaneDataComplete.lean', '\n'.join(parts))
    report = {'pairs': len(codes), 'positive_rows': 3600, 'rank_coverage_entries': 7200,
              'certificate_words': len(pool), 'row_word_ids': len(ids),
              'acceptance_witnesses': len(table['acceptances']), 'lean_verified': False}
    print(json.dumps(report))


if __name__ == '__main__':
    main()
