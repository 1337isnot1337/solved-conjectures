# Dilcher–Kidwai–Tomkins Stern-polynomial half-plane conjecture

## Independent review

Reviewed read-only by the campaign's claim-audit worker, who did not author these four modules. The checked partial statement is sound and matches the indicated local criterion. No mathematical discrepancy was found in the recurrence, run-index coverage, continuant normalization, or finite continued-fraction argument. The formalization remains incomplete and counts as zero completed conjectures.

The original target is Dilcher, Kidwai and Tomkins, *Zeros and irreducibility of Stern polynomials*, Publ. Math. Debrecen 90 (2017), Conjecture 3.1, printed page 413: every zero for an index at least two has real part less than one. The [original PDF](https://publi.math.unideb.hu/paper/2146/download/10_5486_PMD_2017_7620.pdf#page=7) and [Altizio, arXiv:2511.03847v1](https://arxiv.org/html/2511.03847v1), Theorems 3–4, were opened directly. The recorded argument reviewed is `results/stern-half-plane/PROOF.md` at commit `6a2a2d00c8e352f0f07166fad96dcffa831f9552`, particularly Section 1. Credit remains with the original proposers; the shift identity is credited to Schinzel, the run formula to Reznick and Schinzel, and the continued-fraction criterion to the cited Parabola Theorem and Altizio's use of it. No new priority claim is made.

## Statement and argument checks

- `sternPair` is a binary-recursive pair of actual consecutive Stern values. `sternPair_second`, `stern_even` and `stern_odd` prove the exact source recurrence from the definition, including its initial values. `sternPolynomial` is the corresponding polynomial over the integers, and `eval_sternPolynomial` proves its actual complex evaluation equals `stern`. There is no substituted recurrence hypothesis or finite-degree restriction.
- `stern_shift` proves the Schinzel identity from the recurrence over an arbitrary commutative semiring. The natural-number subtraction is guarded by `r ≤ 2 ^ a`, including both endpoints. `runIndex_bounds` prevents truncation in the alternating-power encoding. `stern_runIndex` derives the continuant from the shift identity with the source's positive sign for the off-diagonal contribution.
- `exists_runIndex` covers every positive odd index by strong induction, using the complement below the next power of two. Every list entry is positive. The empty list correctly represents index one. The bound on the sum of run lengths is an output, not a restriction on the input. Uniqueness or a preferred binary-run encoding is unnecessary for this reduction and is not claimed.
- `Parabolic t a` is the tangent-coordinate form of the recorded element-set inequality. `ValueHalfPlane t v` uses the corresponding half-plane. The rotation/scaling coordinates have squared norm `(1+t²)²‖a‖²`; the resulting quadratic proves closure under `a/(1+v)`. `one_add_ne_zero` separately excludes a zero denominator. The proof permits equality on the parabola and works for every finite real `t`; it does not assume a numerical approximation to an angle.
- `continuedValue_mem` is an induction on an arbitrary finite list. The denominator theorem covers every tail needed in the nested fraction. `geom_ne_zero` proves the geometric sums nonzero for all positive lengths on `Re z ≥ 1`, using `z=1` separately and otherwise `‖z‖>1`. Thus the divisions in `runRho` and `runContinuant_ratio` are discharged internally.
- `runContinuant_ratio` connects the actual continuant to the normalized finite fraction with the exact ordered adjacent factors `z^a/(G_a G_b)`. Its induction establishes nonvanishing and the ratio formula together, avoiding circular use of the desired conclusion. Odd-index coverage and then the even recurrence yield `stern_ne_zero_of_parabolic` for every positive natural index. The extra constant index one is harmless relative to the source's index-at-least-two statement.

## Scope that must remain explicit

The final theorem assumes one common `t` for all positive pairs of run lengths at the fixed point `z`. This premise has not been proved in any of the required near-one, compact-middle, or exterior regions. In particular, the recorded argument explicitly uses a different phased-matrix method in the exterior: the common-parabola criterion is not asserted to hold throughout that region. The full proof must supply the common-parabola hypotheses where appropriate and a separate exterior argument; it must not describe a uniform common-parabola theorem on the entire half-plane as already available. The C++ enclosure experiment is not part of the Lean proof. No full zero-location theorem is present in this checkpoint.

## Evidence review

Current source hashes match the scoped receipt exactly. The separate `strict-source-receipts.json` covers the same four modules, with warnings treated as errors, unchanged source hashes during each run, successful exit codes and compiler-log hashes. The receipt's eight required endpoints are present in the reviewed sources. The all-owned audit reports 134 declarations, 105 theorems and 14 private declarations; only `propext`, `Classical.choice` and `Quot.sound` are allowed. The complete stock-kernel log names precisely the four modules below and ends with a successful entire-closure replay. This review checked those artifacts and the mathematical statements; it did not rerun the compiler or claim an aggregate repository, hosted-CI or website pass.

| Module | SHA256 |
| :--- | :--- |
| `Conjectures.SternHalfPlaneBasic` | `cc421cefcc4244e15d4d5aa67873f8d168a5edc865a6987442f528b41f11dc94` |
| `Conjectures.SternHalfPlaneContinuant` | `3bc0f4d6f851d73119461401ac65c656b6de209c80a25293545459e758a0b02a` |
| `Conjectures.SternHalfPlaneParabola` | `5e6e0ef341f8b3dd70859f5eb77ad89d8efe560f9b13583c983259b37dc70843` |
| `Conjectures.SternHalfPlaneShift` | `22e1b47f69e5420ff9fb3c2be11c6f0f7d4ff32d26322d5aeeae5fb62e23bee0` |
