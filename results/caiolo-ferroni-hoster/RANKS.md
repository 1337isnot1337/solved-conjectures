# Exact rank threshold for the dual Chow conjecture

This supplements the rank-five counterexample in [PROOF.md](PROOF.md). It is not a separate resolution of
[Caiolo–Ferroni–Hoster Conjecture 7.3](https://arxiv.org/html/2605.28474v1#S7.SS2). The rank-five counterexample is
Cinna Davis's. The rank-threshold supplement and its Lean formalization are by [Keith Adler](https://github.com/keithadler), contributed in [PR #597](https://github.com/1337isnot1337/solved-conjectures/pull/597). The coalescence method is due to
[Bérczi–Coron–Eur–Li](https://arxiv.org/html/2610.17135v1). The gamma expansion is Theorem 4.9 of Caiolo–Ferroni–Hoster.
No priority is claimed, and the result is unrefereed.

## Theorem

Let r be a nonnegative integer.

- If r ≤ 4, the dual Chow polynomial of every finite matroid of rank r is real-rooted with negative zeros.
  If r ≤ 3, the same holds for the dual right augmented polynomial, and for r ≥ 1 the dual Chow polynomial interlaces it.
- If r ≥ 5, then for every sufficiently large prime power q there is a simple matroid of rank r whose dual Chow
  polynomial and dual right augmented polynomial are both not real-rooted.

So real-rootedness of the dual Chow polynomial holds for all matroids of rank r exactly when r ≤ 4. For the augmented
polynomial and for interlacing, rank four is not decided here.

Everything above is verified in Lean except the interlacing clause. See
[the main file](../../lean/Conjectures/CaioloFerroniHosterRanks.lean), theorems
`CaioloFerroniHoster.Ranks.dualChow_realRooted_iff`, `kernel_realRooted_iff`, `counterexamples`, `dualChow_negRooted_of_rank_le_four` and
`dualAug_negRooted_of_rank_le_three`.

## Low ranks

Flag h-numbers of a geometric lattice are nonnegative, and the top one is positive. By Theorem 4.9, for r ≤ 4 only the
first two gamma coefficients a > 0 and b ≥ 0 occur, so up to factors 1+x the polynomial is constant or
a(1+x)² + bx. Its discriminant is b² + 4ab ≥ 0 and its coefficients are positive.
The same argument covers the augmented polynomial for r ≤ 3. Its second gamma coefficient is at least that of the dual
Chow polynomial and the first is the same. In the variable z = x/(1+x)², which increases on (−1,0) and is unchanged by
x → 1/x, the zero −a/b therefore moves toward 0. This gives interlacing.

## Construction in rank k+1, for k ≥ 4

Let K be the field with qᵏ elements and V = K ⊕ K over the field with q elements. Take the projective geometry of V and
qᵏ free points, one for each element of K, truncated to rank k+1. For every linearized polynomial with coefficients
c₀, …, c₍ₖ₋₁₎ in K, its graph W is a k-dimensional subspace of V. Coalesce the block formed by W and the free point
labelled by the top coefficient. There are b = q^(k²) blocks.

Two blocks with the same label differ by a nonzero linearized polynomial of q-degree at most k−2, so they meet in rank at
most k−1. Blocks with different labels also meet in rank at most k−1. Hence an independent k-set lies in at most one
block, and the augmentation argument of the rank-five proof applies unchanged. Flats of rank below k are unchanged. Each
block becomes a hyperplane and replaces exactly W and the rank-k flats formed by a hyperplane of W and the free point.

## Growth of the flag counts

Write α(S) for the number of flags with rank set S, β(S) for the flag h-numbers, and D = k² + k(k−1)/2. Let [k] be the
full set of ranks. All constants below depend only on k.

- α([k]) ≥ q^D, from flags through blocks.
- Deleting one rank from [k] gives α ≤ C q^(D−1).
- α([k] without 1, 3) ≥ q^(D−1)/4, from flags through hyperplanes with two free points.
- Deleting a further rank from [k] without 1, 3 gives α ≤ C q^(D−2).
- Flags that avoid rank k number at most C q^(D−k).

The upper bounds use two facts. A flag in the product of the subspace lattice of a d-dimensional space with a Boolean
lattice, with ℓ chosen ranks, loses max(0, d−1−ℓ) factors of q. The number of hyperplanes formed by a (k−1)-space and one
free point drops by one factor of q after coalescence, because its leading terms cancel.

## Newton's inequality

Let γ₀, γ₁, γ₂ be the first gamma coefficients of the dual Chow polynomial. Nonnegativity of β gives
α(S) ≤ β(S) + Σ α(S without i) and β(S) ≤ α(S). Therefore, for large q,

- γ₀ = β([k]) ≥ q^D/2,
- γ₁ ≤ Σ α([k] without i) ≤ C q^(D−1),
- γ₂ ≥ β([k] without 1, 3) ≥ q^(D−1)/8.

So γ₁² < 2γ₀γ₂ for large q. If the dual Chow polynomial were real-rooted, then so would be Σ γⱼ zʲ: for a zero z, which is
nonzero because γ₀ > 0, choose x ≠ −1 with x = z(1+x)². Then x is a zero of the dual Chow polynomial, so x and z are real.
But a real-rooted polynomial with nonzero constant term satisfies γ₁² ≥ 2γ₀γ₂, a contradiction. The augmented
polynomial only adds flag h-numbers with rank sets avoiding k, which are at most C q^(D−k), and the same inequality holds.

## Exact checks

Run `python3 verify_ranks.py` with SymPy 1.14.0 installed. It reproduces the published rank-five discriminants, checks the
degrees and leading coefficients of γ₀, γ₁ and γ₂ for ranks 5 to 8, checks a product formula for flag h-numbers against
direct counts, and counts real zeros with exact Sturm sequences. Among prime powers at most 37, the first q at which both
polynomials fail is 17 in rank 5, 11 in rank 6, and 7 in ranks 7 and 8. These checks are separate from the Lean proof.

## Lean correspondence

- [Gamma](../../lean/Conjectures/CaioloFerroniHosterRankGamma.lean) defines both polynomials by the recursions of CFH
  Propositions 4.6 and 4.7 on a finite ranked poset, and proves Theorem 4.9 in every rank.
- [Bridge](../../lean/Conjectures/CaioloFerroniHosterRankBridge.lean) states the kernel definitions of CFH (the
  characteristic function, `rev`, `sgn`, the reduced kernel, the Chow function and right KLS functions) and proves that the
  dual Chow function and the dual right augmented Chow function of `(χ^rev)^sgn` are the polynomials used here, on every
  interval from the bottom. It also proves that these functions exist and are unique. `kernel_realRooted_iff` states the
  rank threshold in those terms.
- [Positivity](../../lean/Conjectures/CaioloFerroniHosterRankPositivity.lean) proves nonnegative flag h-numbers by the
  minimal-label shelling, and [Flats](../../lean/Conjectures/CaioloFerroniHosterRankFlats.lean) applies this to the flats
  of any finite Mathlib matroid.
- [Roots](../../lean/Conjectures/CaioloFerroniHosterRankRoots.lean) proves the low ranks and the Newton step.
- [Graphs](../../lean/Conjectures/CaioloFerroniHosterRankGraphs.lean),
  [Coalesce](../../lean/Conjectures/CaioloFerroniHosterRankCoalesce.lean) and
  [Flags](../../lean/Conjectures/CaioloFerroniHosterRankFlags.lean) generalize the existing rank-five modules. They reuse
  the existing Gaussian counts, frames and flag types.
- [Bounds](../../lean/Conjectures/CaioloFerroniHosterRankBounds.lean) proves the growth estimates, and
  [Witness](../../lean/Conjectures/CaioloFerroniHosterRankWitness.lean) supplies the matroid.

The strict target check of 2026-11-24 on Lean 4.35.0 passed for all 16 modules: compilation with warnings as errors, the
audit of 1,162 declarations with only `propext`, `Classical.choice` and `Quot.sound`, and stock-kernel replay. The compiled modules
were also accepted by [Tenet](https://github.com/keithadler/tenet) 0.11.5, a separate kernel. The repository-wide gate was
not run.

## Not settled

- Rank four for the augmented polynomial and for interlacing. In terms of flag h-numbers, interlacing is equivalent to
  β(123)β(2) ≤ β(12)(β(13)+β(23)). A limited search found no violation, which is not a proof.
- An explicit bound on q in the Lean statement.
