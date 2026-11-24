# Hajdu–Sárközy’s shifted-power perturbation conjecture

## Review outcome

The mathematical and statement review passes for the eleven frozen Lean modules listed below. They prove the original conjecture for every integer exponent at least two, including the source’s nonnegative-root convention and total multiplicative primitivity. They also prove the entry’s principal generalization to every nonzero integral shift and every perturbation whose symmetric-difference count is little-oh of the root scale.

Final scoped verification sign-off also passes. The author completed a fresh eleven-module strict rebuild, the repository's all-owned/private audit, and exact stock-kernel replay at 17:30:33 UTC on 24 November 2026. I independently checked the complete receipt, every source and object hash, all command logs, the regenerated audit and declaration inventory, the import closure, and the exact replay set. The earlier interrupted attempt is superseded by this successful fresh run; no interrupted check is counted as a pass.

The written proof’s final paragraph gives a further supplement with only a small added-error count and positive limsup of the retained density. The public Lean endpoints do not separately state that weaker-hypothesis supplement. It remains unformalized. This limitation does not weaken the original conjecture or the principal symmetric-difference theorem, and the supplement is not a separately counted result.

## Exact target, sources, and attribution

The existing entry is `results/hajdu-sarkozy-shifted-power-perturbations`, tracked by [issue #416](https://github.com/1337isnot1337/solved-conjectures/issues/416). It is distinct from the separate shifted-products entry.

I independently read Hajdu and Sárközy’s [author-hosted revised paper, *On multiplicative decompositions of polynomial sequences, III*](https://math.unideb.hu/sites/default/files/inline-files/poly3_revised.pdf). Conjecture 1.2 on PDF page 6 uses every exponent at least two and the full root-scale error tolerance. Formula (1.5) includes the value from the zero root. Definitions 1.3, 1.5, and 1.6 specify eventual equality, positive-integer factors of size at least two, and total multiplicative primitivity. Finite symmetric difference is equivalent to that eventual-equality condition for subsets of the natural numbers.

The exact recorded argument is [the repository proof at commit `83c325ae559864ec0b5e916d90a342b50a81de7f`](https://github.com/1337isnot1337/solved-conjectures/blob/83c325ae559864ec0b5e916d90a342b50a81de7f/results/hajdu-sarkozy-shifted-power-perturbations/PROOF.md), committed by Cinna Davis on 24 November 2026 at 11:03:45 UTC. I checked that the current proof text equals that commit’s file, with SHA-256 `05022690c0b2b62c3a3b7e4f342ec53c3ba41c0d765188fea5599592a951478e`.

I also read Chi Hoi Yip’s [arXiv:2501.16620v3](https://arxiv.org/html/2501.16620v3), dated 25 November 2025. Theorem 1.3 covers general nonzero shifts for exponents at least three; the discussion following the introduction explicitly excludes the square case from that paper’s methods. Lemma 2.3 and the accompanying graph argument are prior ingredients. Hajdu and Sárközy’s Section 6 already uses geometric bins. The Lean proof assumes none of these prior results as unproved theorems. The proposers’ and prior authors’ attribution is retained, and this review makes no new priority claim for the repository argument.

## Statement correspondence

| Mathematical object or quantifier | Lean representation and review |
| --- | --- |
| Positive shifted powers for arbitrary integral shift | `ShiftedPower k c n` requires `n > 0` and a positive natural root with the exact integer equation `n = m^k + c`. `shiftedPowers` is the resulting actual set. Negative shifts are included, with nonpositive values excluded as in the entry. |
| The actual count up to a real threshold | `count S X` is the cardinality of `realPrefix S X`. `mem_realPrefix` proves membership is exactly positivity, membership in `S`, and the real inequality `n ≤ X`; it is not a surrogate sequence or a finite screen. |
| Root-scale symmetric-difference error | `Sparse k (R ∆ shiftedPowers k c)` uses mathlib’s `IsLittleO`, with the real variable tending to positive infinity and the actual power `X^(1/k)`. The terminal hypotheses require `k ≥ 2`, so the exponent is positive. |
| Arbitrary nontrivial product decomposition | `HasNontrivialProduct R` quantifies over arbitrary sets `A` and `B` of positive naturals, each with two distinct elements, and requires the literal equality `R = productSet A B`. Neither factor is assumed finite, ordered, or bounded. |
| Every finite modification | `TotallyMPrimitive R` quantifies over every positive-integer set with finite symmetric difference from `R`, and excludes its nontrivial product decompositions. |
| The original zero-root convention | `originalPowers k` includes all natural roots, including zero. `original_shifted_finite_difference` proves that its difference from the positive-root, shift-one set is contained in `{1}`. |
| Complete endpoints | `no_product_of_sparse_error` excludes a decomposition under the full general-shift error condition. `shiftedPowerPerturbations` includes every finite modification. `hajdu_sarkozy_conjecture` specializes to the original source with every `k ≥ 2` and the zero-root value included. |

The unused positive-set hypothesis in the original endpoint does not conceal a weakening: the general theorem already excludes decompositions into positive sets under a slightly broader input convention. The original source’s positive-input hypothesis is present in the public original-conjecture statement.

## Proof-chain review

The arithmetic module keeps the exact crossed-product determinant. A nonzero shift and two distinct ordered rows and columns force the two integer root products to differ. The integer power-gap argument applies for every exponent at least two. The squared lower-bound comparison avoids fractional-power assumptions and gives the required gap once the smallest product is at least twice the absolute shift. Combining it with the thin-rectangle inequality excludes a four-cycle. The square case uses the same proved inequalities, with no hidden exponent-at-least-three assumption. Both signs of the shift are handled by its absolute value.

The finite incidence bound is proved directly. For each right vertex, one edge is recorded by that vertex; every remaining edge is recorded by an ordered pair of distinct left vertices. Absence of a four-cycle makes this encoding injective. Thus the actual edge count is at most `m²+n`, including empty parts. The proof does not assume an external extremal graph theorem.

The recorded argument uses the stronger estimate `m√n+n`. The formal proof replaces it with `m²+n` and proves the extra summation step needed for that replacement. For bin indices satisfying `i ≤ j` and `i+j ≤ L`, the quadratic term is injected by `(i,j) ↦ (i+j,2i)` into the double prefix sum of `m_(floor(s/2))²`. The linear term is injected by `(i,j) ↦ (i+j,j)` into the double prefix sum of `n_s`. The target indices satisfy all stated bounds; both maps are injective. Squaring a little-oh sequence at half the index retains the required geometric scale, and taking a geometric prefix sum twice preserves little-oh. Swapping the factors covers the other triangle. This proves the full summation without leaving a logarithmic factor or assuming a rate for the little-oh convergence.

The bin modules use actual finite sets of positive integers. Coverage, unique bin indices, and the product index inequality are proved. The graph retains only shifted-power edges above the fixed product cutoff, so the arithmetic obstruction applies in every relevant bin. Distinct actual products are covered by finite images of these edge sets; image-cardinality inequalities are used in the upper-bound direction. Products below the cutoff contribute only a fixed constant.

The common-neighbor argument fixes two distinct positive multipliers. A suitably thin geometric bin contains at most one sufficiently large common neighbor, by the same four-cycle obstruction. Comparing two geometric grids gives a linear bound in the target grid index. The finitely many small neighbors contribute a fixed constant. This supplies the logarithmic-scale ingredient directly, without assuming Diophantine finiteness.

The two multiplication maps on actual finite prefixes are proved injective. Their exceptional images lie in the actual added-error set at the correctly scaled threshold. Every remaining factor element is a common shifted-power neighbor. The resulting count inequality, real-power scaling, and linear-over-geometric limit force the bin counts of both factors to be little-oh. Substitution into the verified triangular sum makes the retained shifted-power count little-oh.

Finally, the density module injects actual values `m^k+c` for roots from `|c|+1` to the integer part of half the geometric root scale. Positivity prevents `Int.toNat` from collapsing distinct roots. The values are below the stated threshold and their cardinality gives a positive proportion of the root scale. This lower bound is sufficient; no full asymptotic counting formula is assumed. Adding back the removed-error count contradicts that lower bound. Finite-error stability and the explicit zero-root comparison then prove the original total-primitivity conclusion.

## Frozen sources reviewed

| Module | SHA-256 |
| --- | --- |
| `HajduSarkozyArithmetic.lean` | `cc26a9d846722e79ac39cfc33ed5e66e4edf69d53edea6a11129e57161a6ec10` |
| `HajduSarkozyIncidence.lean` | `f5929babe3eaed9883e58cb3f535efa07e1d6400a0193f38f83b832409099a63` |
| `HajduSarkozyAsymptotics.lean` | `7e1e3b34d9ba52c3ca0244f66b197fbd432fdc146a9f8868b8b511718004b96d` |
| `HajduSarkozyCounts.lean` | `4e5b6012683d90b49924cc4a34ebf984d8b29ab519ef68b152de87da6880f3fa` |
| `HajduSarkozyBins.lean` | `d101311407bce05878d7330705bf4e47a69910a17abfbb571a33d13d9a2b5dfc` |
| `HajduSarkozyMatrix.lean` | `65c65fef22c45db2e7ed33309f900561e94a680e74121aa8c0b34e33895477a5` |
| `HajduSarkozyProduct.lean` | `a78f0c7f8394bb1df48ddc4ca1fb6c9a58d860d3ff57bfd1f7317f33110be27e` |
| `HajduSarkozyCommon.lean` | `7eeca6b0eec2b54000a886f75304d48801c5a3dc18704c9a1b0f267484f0122f` |
| `HajduSarkozyDensity.lean` | `71de2d8d1441dbb6040c951d33cb304fb6a58a42cf35b073b926544f5f300fd6` |
| `HajduSarkozyFactors.lean` | `7e59906ce3657af165f536068a9082ed96d4e30a4637e26ac95fbbd78c66bbf8` |
| `HajduSarkozy.lean` | `4fa40196f38191939159904231c99bbba097c175f002a25318202a40368d4c17` |

## Verification evidence

The completed author receipt is `hajdu/verification/receipt.json`, SHA-256 `198ef65047e16977e2f74e9e3b0eef2bc541a4321b0be91a206f7ad4d9aa0103`. It records all eleven strict source builds with warnings treated as errors, 185 owned declarations including 157 theorems, zero private declarations, and twenty required named endpoints. The complete axiom audit allows only `propext`, `Classical.choice`, and `Quot.sound`. Stock `leanchecker` replayed exactly the eleven project modules and exited successfully in 21.28 seconds.

My separate validation record is `hajdu-independent-verification.json`, SHA-256 `3214c30998f0a9185b0578b6c750b82199ca13ae561c2174f5d2b13ee209239f`. I rehashed all eleven lane sources and their integrated copies, all eleven compiled objects, and all fourteen command logs. I regenerated the audit source from the repository helper and revalidated its log against the exact module and required-endpoint specification, obtaining the identical declaration inventory. I revalidated the stock replay's exact module set, checked the complete local import closure, and checked the compiler, checker, and verifier hashes. Every frozen source hash above remains unchanged.

Shared-root aggregate verification, exact publication-tree checks, hosted verification, merge, and current-mode website deployment remain separate obligations. This scoped sign-off does not claim those publication gates passed.
