#!/usr/bin/env bash
# Rebuild sources, audit every project theorem's axioms, then replay the kernel.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../l-solitaire-limit-shapes/lean"
lake build
lake env lean -DwarningAsError=true ProofAudit.lean
modules=(
  Solitaire.Counterexample
  Solitaire.Limits
  Conjectures.War
  Conjectures.Denominator
  Conjectures.FiniteCertificate
  Conjectures.Egyptian
  Conjectures.EgyptianBounds
  Conjectures.EgyptianFinite
  Conjectures.EgyptianTheorem
  Conjectures.CutFamily
  Conjectures.BinaryAutomata
  Conjectures.BinaryArithmetic
  Conjectures.BinaryComposition
  Conjectures.BinaryEncoding
  Conjectures.BinaryBoolean
  Conjectures.BinaryOrder
  Conjectures.BinaryProjection
  Conjectures.CutPeriodGraph
  Conjectures.CutPeriodGraphCertificate
  Conjectures.CutPeriodPiles
  Conjectures.CutPeriodLower
  Conjectures.CutPeriodLowerCertificate
  Conjectures.CutPeriodParameters
  Conjectures.CutPeriodMex
)
for module in "${modules[@]}"; do
  printf 'Kernel recheck: %s\n' "$module"
  lake env leanchecker "$module"
done
