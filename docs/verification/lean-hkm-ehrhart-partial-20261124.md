# Higashitani–Kummer–Michałek conjecture

**Partial Lean verification.** [Original paper, Definition 2.2 and Conjecture 4.10](https://arxiv.org/pdf/1612.07538) · [Written disproof and attribution](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/hkm-ehrhart/PROOF.md) · [Issue #316](https://github.com/1337isnot1337/solved-conjectures/issues/316).

The analytic and interpolation components are now checked. At `x = 4/3`, `scaled_defect` proves the exact Laguerre defect multiplied by `3^20` is `-168180657231060341757399375`. The existing Alexandersson Laguerre lemma gives an actual nonreal root. The exact complex rotation and twelve integer evaluations of the unrotated candidate are proved. The endpoint `off_line_of_counts` shows that any degree-at-most-11 polynomial matching those values has a complex root off the line `Re(z) = -1/2`. The hypotheses have **not** yet been discharged for the literal symmetric edge polytope.

The second module identifies the actual integer pairs with prescribed positive/negative masses and proves their local cardinality for every pair of masses. It does not yet prove the six-part convolution is the literal lattice-point count. The remaining obligations are the geometric membership bridge, convolving the six parts, certifying the twelve literal counts, and connecting the Ehrhart degree bound. The original paper’s definition of line interlacing requires both root sets to lie on the line, so the same literal off-line root would refute both clauses with the prescribed largest-part deletion. The exact real-root count and the stronger comparison with both polynomials separately on the line remain written only and are not claimed here.

## An alternative membership route (not Lean-checked)

The written proof uses Hall’s theorem. Alternatively, induct on the integer budget `m`. A part is saturated when its absolute mass is `m`. For nonzero `m`, at most two parts are saturated since total absolute mass is at most `2m`. If two are saturated, all support is in those two parts. If there is one saturated part and the support spans multiple parts, an opposite-sign pair across parts can be chosen incident to the saturated part: if it contains both signs, use any nonzero entry outside it; if it contains only one sign, the opposite sign lies outside. In the two-saturated case, a cross-part opposite-sign pair necessarily touches both. With no saturated part, use any cross-part pair. Remove its two unit masses. This decreases total positive mass by one and pushes every saturated part below `m`, so the residual vector fits budget `m-1`. If no cross-part opposite-sign pair exists and the vector is nonzero, all nonzero entries lie in one part. Match its positive and negative units arbitrarily, and use a two-edge path through any different part for each pair. The number of edges is then the sole part’s absolute mass, at most `m`. This is a possible replacement for the Hall formalization, not a replacement for the reviewed written argument.

## Verification receipt

Pinned Lean 4.35.0 (`eb6cafb7290e8bd5f2937522d8d804f58f02bafc`) and Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. Strict compilation passed. The all-owned axiom audit passed for 119 declarations (86 theorems, 52 private declarations, seven required endpoints) in three source modules. Only `propext`, `Classical.choice` and `Quot.sound` were allowed. Independent stock-kernel replay passed for the two new modules, the reused Laguerre module, and a local import-only replay wrapper.

| Module | SHA-256 |
| --- | --- |
| `HKMEhrhart` | `c4a974de0d9efec51dc2bf2b1b426f5ad7e988d14fa0be1114cee37a48931c9f` |
| `HKMEhrhartLocalCount` | `f5318823a4908fa83d2beea299d9abc788a69fc354d221fbf21f03c22955fbc4` |
| `AlexanderssonParkingExcedanceRoots` (reused; unchanged) | `b50114d6a41fbb09f4f9ab99f3ba6b125b799156271366d5fbf16502432bc6b5` |

No new conjecture count, complete formalization badge, aggregate build, outside verification, or priority claim.
