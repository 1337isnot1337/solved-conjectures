#!/usr/bin/env python3
"""Reproduce the literal Lean border matrices from the published sign strings."""
from __future__ import annotations
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DESTINATION = ROOT / 'lean/Conjectures/HadamardFixedBorderLiteral.lean'
TEMPLATE = "import Conjectures.HadamardFixedBorderFin16\nimport Mathlib.Data.Fin.VecNotation\n\n/-!\n# The literal integer fixed-border certificate\n\nGenerated from the exact K/E/F sign strings in\n`results/hadamard-2396/border.json`. Regenerate or check with\n`python3 scripts/generate_hadamard_fixed_border_literal.py --check`.\nAll finite identities below are independently reduced by Lean's kernel.\n-/\n\nnamespace HadamardFixedBorder.Literal\n\nopen Matrix\n\ndef gamma : Matrix (Fin 4) (Fin 4) ℤ :=\n  ![![0, 2, 2, 2], ![-2, 0, 2, -2], ![-2, -2, 0, 2], ![-2, 2, -2, 0]]\n\ndef K : Matrix (Fin 12) (Fin 12) ℤ :=\n@K@\n\ndef E : Matrix (Fin 12) (Fin 16) ℤ :=\n@E@\n\ndef F : Matrix (Fin 16) (Fin 12) ℤ :=\n@F@\n\ntheorem K_sign : SignMatrix K := by\n  unfold SignMatrix\n  decide +kernel\n\ntheorem E_sign : SignMatrix E := by\n  unfold SignMatrix\n  decide +kernel\n\ntheorem F_sign : SignMatrix F := by\n  unfold SignMatrix\n  decide +kernel\n\ntheorem K_gram :\n    K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) := by\n  apply Matrix.ext\n  decide +kernel\n\ntheorem E_gram :\n    E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) := by\n  apply Matrix.ext\n  decide +kernel\n\ntheorem F_gram :\n    F * Fᵀ = (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ) -\n      (4 : ℤ) • flatBlocks := by\n  apply Matrix.ext\n  decide +kernel\n\ntheorem balanced : flatBlocks * Eᵀ = 0 := by\n  apply Matrix.ext\n  decide +kernel\n\ntheorem cross : flatGamma gamma * Eᵀ + F * Kᵀ = 0 := by\n  apply Matrix.ext\n  decide +kernel\n\ndef certificate : FlatCertificate gamma where\n  K := K\n  E := E\n  F := F\n  K_sign := K_sign\n  E_sign := E_sign\n  F_sign := F_sign\n  K_gram := K_gram\n  E_gram := E_gram\n  F_gram := F_gram\n  balanced := balanced\n  cross := cross\n\n/-- The published signs and all five matrix identities, with no certificate\nhypothesis or external finite computation assumed. -/\ntheorem literal_certificate_correct :\n    SignMatrix K ∧ SignMatrix E ∧ SignMatrix F ∧\n      K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧\n      E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧\n      F * Fᵀ = (16 : ℤ) • (1 : Matrix (Fin 16) (Fin 16) ℤ) -\n        (4 : ℤ) • flatBlocks ∧\n      flatBlocks * Eᵀ = 0 ∧ flatGamma gamma * Eᵀ + F * Kᵀ = 0 :=\n  ⟨K_sign, E_sign, F_sign, K_gram, E_gram, F_gram, balanced, cross⟩\n\n/-- The actual fixed border exists for every additive group of cardinality four.\nThe literal finite-certificate premise of the general transport is discharged. -/\ntheorem exists_border_of_card_four {Q : Type*}\n    [Fintype Q] [AddGroup Q] [DecidableEq Q] (hQ : Fintype.card Q = 4) :\n    ∃ (E : Matrix (Fin 12) (BlockIndex Q) ℤ)\n      (F : Matrix (BlockIndex Q) (Fin 12) ℤ),\n      SignMatrix K ∧ SignMatrix E ∧ SignMatrix F ∧\n        K * Kᵀ = (12 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧\n        E * Eᵀ = (16 : ℤ) • (1 : Matrix (Fin 12) (Fin 12) ℤ) ∧\n        F * Fᵀ = (16 : ℤ) • (1 : Matrix (BlockIndex Q) (BlockIndex Q) ℤ) -\n          (4 : ℤ) • blockOnes Q ∧\n        blockOnes Q * Eᵀ = 0 ∧ gammaReflection gamma * Eᵀ + F * Kᵀ = 0 :=\n  exists_transported_matrices_of_card_four certificate hQ\n\nend HadamardFixedBorder.Literal\n"

def generate() -> str:
    data = json.loads((ROOT / 'results/hadamard-2396/border.json').read_text())
    dimensions = {'K': (12, 12), 'E': (12, 16), 'F': (16, 12)}
    if set(data) != set(dimensions):
        raise ValueError('Unexpected border data keys')
    result = TEMPLATE
    for name, (height, width) in dimensions.items():
        rows = data[name]
        if len(rows) != height or any(len(row) != width or set(row) - {'+', '-'} for row in rows):
            raise ValueError('Invalid sign matrix dimensions or entries: ' + name)
        vectors = ['    ![' + ', '.join('1' if x == '+' else '-1' for x in row) + ']' for row in rows]
        literal = '  ![\n' + ',\n'.join(vectors) + '\n  ]'
        result = result.replace('@' + name + '@', literal)
    return result

def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    expected = generate()
    if args.check:
        if DESTINATION.read_text() != expected:
            raise SystemExit('Literal Lean border source differs from the published data')
        print('PASS: exact literal border source reproduced')
    else:
        DESTINATION.write_text(expected)

if __name__ == '__main__':
    main()
