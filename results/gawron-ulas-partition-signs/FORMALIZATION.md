# Lean verification: Gawron–Ulas’s partition-sign conjecture

[Gawron–Ulas, Conjecture 4.3](https://arxiv.org/html/2202.05221#S4) asks whether the signs of the even-minus-odd partition counts for parts in the progression $`1,4,7,\ldots`$ are nonperiodic. The theorem [`GawronUlasPartitionSigns.gawron_ulas_partition_signs`](../../lean/Conjectures/GawronUlasPartitionSigns.lean) rules out every positive eventual period: for every period and every cutoff, some index at or beyond the cutoff has a different sign from the index one period later. The proofs of both signs in every index progression and of the general odd-step case are in [PROOF.md](PROOF.md), not in this formalization.

[`GawronUlasPartitionSeries.lean`](../../lean/Conjectures/GawronUlasPartitionSeries.lean) represents an unordered partition by its finitely supported multiplicities at parts `3 * j + 1`. It proves that the signed count series equals the exponential of its logarithmic Lambert series inside the unit disk. [`GawronUlasPartitionCusps.lean`](../../lean/Conjectures/GawronUlasPartitionCusps.lean) proves the boundary limit by dominated convergence. [`GawronUlasPartitionBounds.lean`](../../lean/Conjectures/GawronUlasPartitionBounds.lean) bounds every radial rate by $`1/6`$ and proves that the selected oblique rate exceeds $`1/6`$. The final module uses finite Fourier inversion to turn any eventual sign period into a radial upper bound, contradicting the oblique rate.

## Verification

The [receipt](verification/receipt.json) records strict Lean 4.35.0 compilation, the [all-owned transitive axiom audit](verification/TargetAudit.lean), and stock-kernel replay of the exact four-module closure. The audit covers 112 declarations, including 93 theorems and 67 private declarations. The allowed axioms are `propext`, `Classical.choice`, and `Quot.sound`.

From the repository root, with the pinned Mathlib cache installed in `lean/`:

```bash
python3 scripts/verify_lean_target.py \
  --root Conjectures.GawronUlasPartitionSigns \
  --require GawronUlasPartitionSigns.gawron_ulas_partition_signs \
  --per-module-replay \
  --out /tmp/gawron-ulas-partition-signs
```
