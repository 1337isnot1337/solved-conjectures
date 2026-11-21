# Independent review of the finite zeta route

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. Reviewed source: [finite-zeta-route.md](finite-zeta-route.md), SHA256 `656dc9b4cb94ab01f5b293eeebf75cb3f87403503715dc2068983e97bdf298ed`.

## Verdict

The conditional limiting argument and the complete two-class proof pass independent mathematical review. The source consistently leaves the finite comparison for arbitrary family size unproved. Nothing reviewed here is a full resolution of Erdős 25 or an additional bounty completion.

## 1. Passage from the finite comparison to the full target

For each fixed $`s>1`$, the activated finite unions increase to the infinite union. Their nonnegative Dirichlet series therefore converge monotonically. The assumed finite inequality gives the upper bound by the increasing limit $`\mu`$ of periodic union densities.

For every fixed finite truncation, the normalized Dirichlet series converges to its periodic density as $`s\downarrow1`$; finite activation deletions do not affect this limit. Taking the supremum over finite truncations supplies the reverse limiting bound. Thus the two limits are used in the stated safe order. A zero residue in a Hurwitz-zeta formula is represented by $`r=L`$, rather than by a zero argument.

The positive-measure Tauberian proof is valid:

- The normalization $`s=1+u/T`$ gives Laplace-transform limit $`\mu/u`$, using $`\zeta(1+u/T)/T\to1/u`$.
- The transform at $`u=1`$ bounds the masses of each fixed compact interval, giving vague subsequential compactness for the positive locally finite measures.
- The displayed tail bound uses the transform at $`u/2`$ and controls the part not seen by compactly supported test functions.
- Weighting a possible limit by $`e^{-x}`$ and pushing forward by $`y=e^{-x}`$ gives a finite measure on $`[0,1]`$. Its integer moments are determined by the transforms at positive integers. Polynomial approximation proves uniqueness, including total mass.
- The unique limit is $`\mu\,dx`$; the interval used to recover $`H(T)/T`$ has zero boundary mass. This establishes logarithmic density, including the case $`\mu=0`$.

The source does not use Dirichlet-density existence alone without the required positive-measure Tauberian argument.

## 2. Zero-residue comparison

The zeta-distributed integer has independent prime valuations with tail probabilities $`p^{-sj}`$. In the uniform residue modulo the finite least common multiple, the needed capped valuation thresholds have probabilities $`p^{-j}`$. Only thresholds through the prime exponents in that least common multiple are used. Their coordinatewise coupling proves domination of the increasing divisibility event. This verifies equation (5) for every finite zero-residue family.

## 3. Two arbitrary activated classes

The incompatible case is a disjoint periodic union and follows by adding the two single-class bounds.

For compatible classes, the two CRT-residue cases are exhaustive:

- If $`c\ge q_2`$, the activated intersection begins at $`c\le L`$. Its series dominates the zero-class series at modulus $`L`$ term by term.
- If $`c\lt q_2`$, normalization gives $`a_2=c`$, and the activated intersection begins exactly at $`L+c`$. The loss $`D_{q_2}(c)`$ dominates $`D_L(c)`$ by the displayed integral comparison, so the single-class loss is used only once.

This proves the comparison to the zero-residue two-class union, whose Haar density agrees with that of the compatible shifted pair. The earlier valuation coupling finishes the argument for every real $`s>1`$. The cases $`c=0`$, $`L=q_2`$, and $`q_1=1`$ are included.

No numerical case verification is needed for this proof.

## 4. Remaining gap

Applying the two-class payment independently to every pair would reuse single-class losses and would leave higher intersections uncontrolled. The source correctly makes no such inference.

The proposed finite comparison is sufficient for the full target and stronger than necessary. A finite counterexample to it would invalidate this route, not automatically disprove Erdős 25. This distinction is maintained throughout the source.

