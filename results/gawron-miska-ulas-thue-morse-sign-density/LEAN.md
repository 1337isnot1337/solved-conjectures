# Lean verification status

**Incomplete formalization.** This candidate addresses Gawron–Miska–Ulas,
Conjecture 5.8 (arXiv:1703.01955), via the documented proof in [PROOF.md](PROOF.md).
Proposers: M. Gawron, P. Miska, and M. Ulas. The original repository-level
proof attribution and priority limitations remain as documented in
[the mathematical audit](AUDIT.md). The stronger exact-density theorem is
outside this formalization.

## Partial verification receipt, 24 November 2026

- Exact source: [ThueMorseSignDensityCore.lean](../../lean/Conjectures/ThueMorseSignDensityCore.lean)
  at commit `425030c794f62e96ea84b1e9a62b5eaafc3e7517`.
- SHA-256: `a4f715d8e08a77a826ac92e982ca123dce651ff0afc5b905214af8000682bbbf`.
- Lean: 4.35.0, commit `eb6cafb7290e8bd5f2937522d8d804f58f02bafc`, x86_64-unknown-linux-gnu.
- Strict compilation completed in a disposable public-network execution job
  using `lean -j1 -DwarningAsError=true -o Conjectures/ThueMorseSignDensityCore.olean Conjectures/ThueMorseSignDensityCore.lean`.
- A separate `Audit.lean` imported that olean and printed the transitive
  axiom sets below. All ten outputs were `[propext, Quot.sound]`.
- The shell reached the end of these audit outputs, but timed out during
  the subsequent checker probe. This is **not** a completed repository
  all-owned audit or independent kernel-replay receipt.

| Checked theorem (namespace `ThueMorseSignDensityCore`) | Transitive axioms |
|---|---|
| `parity_pair` | `propext`, `Quot.sound` |
| `nonzero` | `propext`, `Quot.sound` |
| `identity0` | `propext`, `Quot.sound` |
| `identity1` | `propext`, `Quot.sound` |
| `block0` | `propext`, `Quot.sound` |
| `block1` | `propext`, `Quot.sound` |
| `lower_bound0` | `propext`, `Quot.sound` |
| `lower_bound1` | `propext`, `Quot.sound` |
| `not_zero_density0` | `propext`, `Quot.sound` |
| `not_zero_density1` | `propext`, `Quot.sound` |

The checked result applies to any integer sequences satisfying the stated
base values and digit recurrences. It proves nonvanishing, the two exact
weighted identities, a wrong-sign coefficient in every block in each
exception-index variable, the finite-prefix lower bounds, and failure of
density zero in the reciprocal-integer epsilon formulation.

## Remaining obligations

1. Compile and audit [ThueMorseSignDensity.lean](../../lean/Conjectures/ThueMorseSignDensity.lean),
   which establishes the hypotheses for the stabilized polynomial coefficient
   model from the distinct valuation PR #526 and connects the core count
   to the original sign exceptions and real-valued natural-density definition.
2. Complete the repository all-owned axiom audit and independent stock-kernel
   replay on the exact import closure. The scoped GitHub workflow runs these
   checks; results were pending at the time of this receipt.
3. Audit the original conjecture's quantification and density definition,
   register the proof in the accepted proof inventory only after verification,
   and run the full repository checks.
4. Retarget the stacked PR #565 after its coefficient-model dependency merges.

Completion count: **0**. The recurrence reduction is checked, but the original
conjecture is not yet fully formalized and verified.
