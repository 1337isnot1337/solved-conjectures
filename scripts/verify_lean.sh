#!/usr/bin/env bash
# Rebuild sources, audit every project theorem's axioms, then replay the kernel.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/../l-solitaire-limit-shapes/lean"
lake build
lake env lean -DwarningAsError=true ProofAudit.lean
for module in Solitaire.Counterexample Solitaire.Limits Conjectures.War Conjectures.Denominator Conjectures.Egyptian Conjectures.EgyptianBounds Conjectures.EgyptianFinite Conjectures.EgyptianTheorem Conjectures.CutFamily Conjectures.BinaryAutomata Conjectures.BinaryArithmetic Conjectures.BinaryComposition Conjectures.CutPeriodGraph Conjectures.CutPeriodGraphCertificate; do
  printf 'Kernel recheck: %s\n' "$module"
  lake env leanchecker "$module"
done
