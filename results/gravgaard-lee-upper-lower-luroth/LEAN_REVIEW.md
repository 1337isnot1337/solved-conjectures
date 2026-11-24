# Gravgaard–Lee’s mixed upper/lower Lüroth conjecture

## Review result and authorship

The frozen formalization matches the original Conjecture 2.6 and the stronger exact interval result recorded in the existing repository entry. I found no mathematical or statement-scope discrepancy in the general construction, its endpoint repair, or the final all-threshold wrapper.

This review is independent of the author of the general proof modules `Basic`, `Linked`, `Cylinders`, `Moves`, `Orbit`, `Repair`, `Forcing`, `Convergence`, and the final wrapper. I authored the separate `Two` module, so its treatment below is an author audit, not an independent review. The two older `LargeLuroth` and `MixedLuroth` modules are reused dependencies; their source definitions and the specific series/compactness lemmas used here were inspected. No reused conjecture or boundary case is a separate campaign completion.

The reviewed source set is the twelve-module snapshot in `frozen-sources.json`. All twelve SHA256 hashes were checked against the actual files after the final wrapper was frozen. The final module hash is `def68e499f7aa0323451998e1b1011f4998a142f19f5ce41b557e6affce73b63`; the independently authored boundary module hash is `bc9325aba416841cb5e142cbc10bbdeea06f65424853abc46ef0c16aec185154`. This report evaluates the mathematical statement and implementation. The separate machine-verification receipt must establish the strict builds, full owned/private declaration audit, and exact stock-kernel replay; this report does not substitute for those gates.

## Exact target and sources

Primary source inspected directly: Maiken Gravgaard and Ying Wai Lee, *Decomposition of real numbers into sums of Lüroth sets*, [arXiv:2506.12513v2](https://arxiv.org/html/2506.12513v2), dated 17 February 2026, Section 1.2 and Conjecture 2.6 in Section 2.1. The paper defines the sets by infinite Lüroth series, excludes finite representations from the lower-bounded set, and defines congruence modulo one by adding all integers. Conjecture 2.6 uses the same threshold on the upper and lower digit bounds. The nearby Theorem 2.5 instead uses the upper threshold increased by two; it is not substituted for the conjecture.

Argument inspected: `results/gravgaard-lee-upper-lower-luroth/DIRECT-REFINEMENT.md`, the existing direct-refinement proof recorded by Cinna Davis in commit `06f4ac32f33e84191048569c621ca41b8c9cd91f`. The formalization preserves the original proposer credits and the repository's recorded attribution and uncertainty about priority. This is a formalization review of that existing argument, not a new discovery or a claim of literature priority.

The exact interval theorem is

```math
L_{\le k}+L_{\ge k}=(a_k,1+a_k],\qquad
a_k=\frac{k-1}{k(k-1)-1},\qquad k\ge2.
```

`exact_sum_interval` quantifies over arbitrary natural `k` with `2 ≤ k`. `conjecture_2_6` then quantifies over every real `x` and produces a member of the actual sumset and an integer whose sum is `x`. This is the nontrivial direction of the paper's equality after adjoining the integers; the reverse containment in the real numbers is automatic. `conjecture_2_6_digits` exposes the two actual digit sequences and integer explicitly. There are no hidden regularity, boundedness, termination, classification, or existence assumptions in these final statements.

## Source-series and endpoint semantics

The reused `sourceTerm` is exactly the paper's series term, with zero-based indexing. `smallDigitSet k` is defined by a sequence whose digits lie in `2..k` and a `HasSum` proof. `largeDigitSet k` is defined by a sequence whose digits are all at least `k` and a `HasSum` proof. `value_hasSum` proves that the supremum of finite partial sums is this series sum; the membership equivalences use uniqueness of `HasSum`, so they do not silently change the underlying sets.

`value_mem` proves that every admissible sequence has value strictly above zero and at most one. `value_isExpansion` also verifies the original half-open branch convention using positive shifted tails. Neither definition adjoins zero, finite digit strings, or a closure. In `Basic`, digit monotonicity and the constant-digit value prove the minimum/maximum bounds. The strict lower bound on the second summand gives `sum_subset_target` with `Ioc`, not `Icc`. Both the excluded lower endpoint and the included upper endpoint are therefore reflected in the final equality.

## General refinement and actual upper cylinders

`Frame` carries positive scales and the exact constraints `2 ≤ p < k ≤ e`. Its two link inequalities and the residual invariant are the formulas in Section 1 of the recorded proof, including `0 < z`. The initial frame is constructed for every `k ≥ 3`; the assumptions are satisfiable and are discharged in the final theorem.

`Linked` proves each local refinement inequality and the minimal lower-cutoff argument. The formal bound for the upper gap uses monotonicity of the constant-digit endpoint and a direct polynomial inequality at the neighboring threshold. This is a justified algebraic alternative to the concise concavity argument in the written proof; it is proved uniformly, including its equality case.

`upperTail` and `Scene.upperCylinder` are sets of values of actual infinite bounded-digit expansions. They are not intervals or hulls. `upperTail_compact` is a finite union of affine images of the actual compact bounded-digit set. The underlying compactness theorem uses the product of finite alphabets and uniform convergence of the series. Compactness is not asserted for the unbounded-digit side.

The `appendUpper_subset`, `discardUpper_subset`, and `sibling_cylinder_subset` lemmas prove actual set inclusion. The singleton remaining digit is appended and normalized using the constant-digit fixed-point identity. Thus a geometric hull calculation is not being used as a substitute for an expansion. `Moves.exists_move` accelerates finite groups of lower cuts to their least stopping cutoff and uses a decreasing upper-cutoff measure to force an appended digit. It proves this progress rather than assuming it.

## Zero-tail obstruction and finite repair

`CanAdvance` asks for a valid scene that appends one lower digit while retaining an actual upper cylinder inside the previous one. Assuming it fails, `exists_blocked_upper` and `blockedOrbit` construct an infinite orbit of actual upper digits. All scales, offsets, digit bounds, and cylinder inclusions are proved from the step witnesses.

The upper scale tends to zero geometrically. The proved bound `lowerWidth_square_bound`, together with the second link, forces the lower width to tend to zero even though its scale and offset remain fixed. The residual therefore tends to zero and `value_identity` identifies the target with the genuine infinite upper expansion plus the fixed lower prefix.

`nonmax_arbitrarily_late` excludes an eventually constant maximal-digit tail: such a tail has the constant-digit endpoint value and would make the residual exactly zero at a finite stage, contradicting the strict invariant. This establishes arbitrarily late nonmaximal digits rather than merely assuming a favorable digit occurs.

For a sufficiently late such digit, `repair_digit_exists` uses the floor of the positive ratio to produce a lower digit beyond the required cutoff and bounds the new lower scale by the available sibling-cylinder scale. `dyadic_scale_between` finds a finite number of digit-two refinements with the required scale interval. `repeated_two_mem` and `sibling_cylinder_subset` prove these refinements stay in the original actual upper set while fixing the relevant right endpoint.

`repair_from_cylinder` checks both adjacent lower-digit choices. In both cases it proves the two links, a strictly positive residual, its upper bound, the lower-digit cutoff, and actual upper-cylinder containment. `Forcing.canAdvance` combines those proved lemmas and contradicts the supposed obstruction. There is no unproved endpoint-repair or progress hypothesis left in the final theorem.

## Convergence to two genuine expansions

`LowerOrbit` iterates the proved advance theorem. It appends exactly one lower digit at each step, with digit at least `k`. The lower scale is the product of its digit widths and the lower offset is the corresponding finite series prefix. Consequently its limit is the actual infinite lower expansion with a `HasSum` witness, not an endpoint of a closed hull.

The first link yields the explicit upper-scale bound by a constant multiple of the lower scale, so the upper scale also tends to zero. The residual tends to zero. Each successive upper minimum belongs to the initial actual upper cylinder by the nested-cylinder inclusion proofs. Its limit belongs to that same actual cylinder because only this bounded-digit cylinder is compact and closed. This supplies the upper summand. The initial cylinder is exactly `smallDigitSet k`, and the lower sequence yields membership in `largeDigitSet k`.

The formal limiting step uses compactness of the actual upper set instead of explicitly extracting a concatenated upper digit sequence. The membership definition then supplies a genuine sequence, as exposed in `conjecture_2_6_digits`. This change is valid and preserves the exact statement and positive-tail convention.

## Threshold two and final wrapper

The boundary module is supporting work for the all-threshold result. It proves `smallDigitSet 2 = {1}` and `largeDigitSet 2 = Ioc 0 1` without assuming an external expansion-surjectivity theorem. For a value in `(0,1]`, the canonical digit is the natural floor of its reciprocal plus one. The next tail remains in `(0,1]`, including when the reciprocal is an integer. The exact finite-prefix identity and a geometric remainder bound establish the series value. Thus this boundary proof also excludes a terminating zero tail.

The final wrapper combines the arbitrary `k ≥ 3` construction with this threshold-two case, proves the exact equality using the independently established upper inclusion, and uses the ceiling function to select the appropriate integer translate. No fixed finite range of thresholds is used. No second completion is claimed for the boundary, the exact-interval strengthening, or the two reused supporting conjecture modules.

## Verification receipt review

The frozen scoped receipt has SHA256 `f06a75528115b2bbb590e515a2ad20296ec7c2cfc6cdc4584e1afb26d967c472` and records completion at 17:36:59 UTC on 24 November 2026. I independently compared its twelve source hashes, module order, and twenty-nine required endpoints with the frozen snapshot and actual files. I also checked every source, control, compiler, stock-checker, log, generated audit, declaration-inventory, and compiled-object hash against the receipt.

All twelve source commands exited zero with warnings treated as errors. Re-parsing the complete audit log through the repository validator reproduced the recorded inventory: 664 owned declarations, 475 theorems, 173 private declarations, and 29 required endpoints. The only permitted transitive axioms were `propext`, `Classical.choice`, and `Quot.sound`. The kernel log contains exactly the twelve expected project modules, with no omitted module or additional project module; its recorded command exited zero. The local import-closure calculation from the final theorem also returns precisely those twelve modules. The stock checker matches the pinned SHA256. This validation was a read-only examination of the existing fresh receipt and logs; no redundant compiler or kernel run was performed.

No mathematical gap, source mismatch, or scoped-verification discrepancy was found. The exact publication-tree checks, aggregate-package status, hosted checks, and live publication status remain separate obligations. Do not infer an aggregate build or deployment pass from this review or the scoped receipt.
