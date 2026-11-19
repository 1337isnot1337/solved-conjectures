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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--certificates', type=Path, required=True)
    parser.add_argument('--lean-dir', type=Path, required=True)
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
    definitions.append('def certificateWordIds : Array (Array ℕ) := #[\n  ' +
                       ',\n  '.join(array(ids[i:i + 360]) for i in range(0, len(ids), 360)) + '\n]\n')
    definitions.append('end Loneliness.SixPlane.Data\n')
    (args.lean_dir / 'LonelinessSixPlaneDataTables.lean').write_text('\n'.join(definitions))

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

def rowCertificates (i j : Fin 10) (row : Fin 360) (mask : Fin 32) : PairCertificate :=
  let wordId := (certificateWordIds.getD (10 * i.val + j.val) #[]).getD row.val 0
  let word := certificateWords.getD wordId 0
  decodeCertificate ((word >>> (8 * mask.val)) % 256)

def partialCheck (i j : Fin 10) (start count : ℕ) : Bool :=
  (List.range count).all fun offset =>
    let row : Fin 360 := ⟨(start + offset) % 360, Nat.mod_lt _ (by decide)⟩
    certificateRowCheck directionAt i j row (rowCertificates i j row)

end Loneliness.SixPlane.Data
''')
    (args.lean_dir / 'LonelinessSixPlaneDataDefs.lean').write_text('\n'.join(definitions))
    for name, count in [('Small', 1), ('Eight', 8), ('Forty', 40)]:
        source = f'''import Conjectures.LonelinessSixPlaneDataDefs

namespace Loneliness.SixPlane.Data

set_option maxRecDepth 100000 in
theorem pilot{name} : partialCheck 0 0 0 {count} = true := by
  decide +kernel

end Loneliness.SixPlane.Data
'''
        (args.lean_dir / f'LonelinessSixPlaneDataPilot{name}.lean').write_text(source)
    report = {'pairs': len(codes), 'positive_rows': 3600, 'rank_coverage_entries': 7200,
              'certificate_words': len(pool), 'row_word_ids': len(ids),
              'acceptance_witnesses': len(table['acceptances']), 'lean_verified': False}
    print(json.dumps(report))


if __name__ == '__main__':
    main()
