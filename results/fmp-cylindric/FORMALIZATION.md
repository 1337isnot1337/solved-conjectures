# Lean verification

The Lean module verifies the **counterexample** side of the [written resolution](PROOF.md). It does not formalize the separate general positivity theorem for standard periodic partition boundaries. The combined catalogue entry is therefore marked partial.

The counterexample addresses the relaxed seam inequalities (7.1) of [Ferroni–Morales–Panova, Conjecture 7.9](https://doi.org/10.1112/plms.70204), read with the unpinned wrap described in §7.2 and in [Morales's Conjecture 4](https://ems.press/content/serial-article-files/53596?nt=1#page=68). The listed shape has outer partition `(9,9,8,6,2)`, inner partition `(7,7,6,1,0)`, and period shift 6. Its 13 cells satisfy the relaxed seam condition; it is not a counterexample under the stronger standard seam. See the [source audit](AUDIT.md) for the boundary-convention distinction and attribution.

- `no_nonnegative_source_count_polynomial` rules out **every** real polynomial with nonnegative coefficients that agrees with the adjacent-edge filling counts at all positive integers.
- `no_nonnegative_full_column_count_polynomial` proves the same under the convention comparing vertically aligned cells across gaps.
- The source proves the cell and edge correspondences and evaluates a linear functional on both count sequences. It is nonnegative on every polynomial with nonnegative coefficients. No bounded degree assumption is used.
- This does not check the general standard-boundary positivity proof, the family of larger counterexamples, or the distinct width-two and shifted-shape conjectures. Nor does it resolve the original pinned-boundary interpretation.

The authors proposed the conjecture, and Cinna Davis is credited for the repository's written solution. The Lean code is the exact existing research snapshot. There is no new claim of priority.

## Reproduction

Against the repository's pinned Lean 4.35.0 and Mathlib:

```sh
cd lean
lake env lean -j1 -DwarningAsError=true -o .lake/build/lib/lean/Conjectures/FMPCylindric.olean Conjectures/FMPCylindric.lean
lake env lean -j1 -DwarningAsError=true ../results/fmp-cylindric/verification/TargetAudit.lean
lake env leanchecker Conjectures.FMPCylindric
```

Use a prepared Lake build directory and dependencies. [Exact receipt](verification/lean-receipt.json): strict source build, 256 owned declarations including 182 theorems and 149 private declarations, 14 named theorem endpoints, and stock kernel replay passed. The replay covers this proof module, not the aggregate CI run.
