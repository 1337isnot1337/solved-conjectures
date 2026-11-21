# Bounded archive comparison for the small negative correlation theorem

Algebra lane, 21 November 2026. Frozen independent archive-scope note.

## Target and outcome

The statement under review is the partial theorem in [NEGATIVE_CORRELATION.md](NEGATIVE_CORRELATION.md): for every fixed integer $`q\ge3`$, there is $`t_q>0`$ such that a central regular-simplex partition minimizes Gaussian noise stability at every correlation $`-t`$, $`0\lt t\le t_q`$, among all measurable $`q`$-partitions in every $`d\ge q-1`$. Competitor masses are unrestricted and empty cells are permitted.

No exact prior proof or refutation of this all-cell small-negative-correlation statement was found in the bounded rereading recorded here. The three-cell case is already known and must be credited. The balanced all-cell first-moment theorem is also prior work and is an input to the present deduction. This note is not a worldwide priority assertion and does not turn the partial theorem into a resolution of the full Standard Simplex conjecture.

This audit specifically checks negative correlation. It does not infer its conclusion from the earlier positive-correlation audit. The separate [primary and search audit](NEGATIVE_PRIOR_AUDIT.md) records the analysis lane's current-source work.

## Corpus and limits

The review reused the previously downloaded, pinned bodies in the six archives below. It did not download new archives or rerun a full scan.

| Archive | Pinned commit |
|---|---|
| the-omega-institute/trureturing | `de22a48707da1c7a48d032909e821bd481947b45` |
| PrincipiaMathOrg/math-solutions | `47371706c400c79d06e3fb62190fcf6f7a725c85` |
| MColbrook/AIM | `b2ec0fac559f532fc0ed04fce81deea0ce07c68b` |
| mxym/math | `4a51ff772a566451627b9ff41f6248518561d9d4` |
| ArtificialZeng/AI-Has-Taste | `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2` |
| openai/math | `4eaee87548250b2682affda7d05d947c05554bae` |

[NEGATIVE_PRIOR_REREAD.json](NEGATIVE_PRIOR_REREAD.json) records 22 archive bodies and four locally retrieved primary texts actually reread, their hashes, exact reading scope and immutable source links. The existing main and broader residual matches were used to locate plausible claims. The supplemental AIM/OpenAI classifications were also consulted.

This is a semantic follow-up to [LOW_CORRELATION_ARCHIVE_SCOPE.md](LOW_CORRELATION_ARCHIVE_SCOPE.md) and [the independent supplemental scope report](low-correlation-supplement/SUPPLEMENTAL_SCOPE.md). Their acquisition, conversion and size limits remain in force. In particular, oversized compressed certificates, unidentified binary bodies and textless figures were not newly cleared by this review. No assertion is made that every byte of all six archives was reread here.

## AIM negative records and their actual primary sources

The original [Isaksson–Mossel Conjecture 1.4(ii)](https://arxiv.org/pdf/0903.3362v3) reverses the noise-stability inequality for negative correlation without imposing balance on the competing partition. Its positive clause separately imposes equal masses. The proposed partial theorem uses the original negative scope. The restriction $`\rho\ge-1/(q-1)`$ that occurs in discrete applications is not a restriction on that Gaussian conjecture.

The full current [AIM 637 record](https://github.com/MColbrook/AIM/blob/b2ec0fac559f532fc0ed04fce81deea0ce07c68b/problems/637-the-standard-simplex-inequality-for-negative-gaussian-correlations.md) and its [3 November status audit](https://github.com/MColbrook/AIM/blob/b2ec0fac559f532fc0ed04fce81deea0ce07c68b/research/solution-status-audit-2026-11-03/lane-c/637.json) were reread. They state the unrestricted-mass negative target and route to three-cell and conditional hyperstability results. The record is a source guide, not proof that no later result exists. Its cited theorem scopes were checked in the actual retrieved primary texts:

| Source and locator | Actual claim | Comparison |
|---|---|---|
| Heilman, [Three Candidate Plurality is Stablest for Correlations at most 1/10](https://arxiv.org/abs/2306.03312), Theorem 1.5 | Three Gaussian cells, arbitrary ambient dimension at least two, an explicit negative interval near zero, and no mass restriction in that negative clause | This already proves the three-cell case. It does not assert arbitrary cell count. |
| Heilman, [Sharp Hardness for MAX-3-CUT and Quantum MAX-CUT](https://arxiv.org/pdf/2608.00333v1), Theorem 7.1 and Section 1.4 | Three Gaussian cells and $`-1/2\le\rho<0`$, with arbitrary masses | This is a stronger interval for three cells. The same manuscript separately identifies the extension to four or more cells as further work. |
| Heilman, [Hyperstable Sets with Voting and Algorithmic Hardness Applications](https://arxiv.org/pdf/2209.11216v1), Problem 7.1 and Theorem 7.9 | A bilinear minimization problem for two partitions whose corresponding masses agree, together with dimension reduction of minimizers | The masses are otherwise free, so this is relevant. Dimension reduction alone does not identify the regular simplex or prove a nonzero all-cell interval. |
| The same paper, Theorem 8.5 | Classification of bilinear minimizers for at most four cells, under the additional hyperstability hypothesis | Neither restriction can be omitted when comparing its scope with the proposed theorem. |

The unequal-volume counterexamples mentioned by AIM concern improving a shifted simplex under the same fixed unequal masses. That is a different benchmark from the central equal-mass simplex. The mxym first-moment counterexample below was independently reread at its exact objective and constraints.

## mxym Gaussian manuscripts

The exact bodies, rather than just their titles or catalogue labels, distinguish the following results.

1. **Balanced all-cell first moments.** [Equal Gaussian cells: the sharp simplex first-moment theorem](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-balanced-simplex-all-k/paper.md), Theorem 1 and Section 5, optimizes the squared first-moment sum for equal masses. It includes fractional labels and supplies the covariance comparison used by the proposed proof. It does not optimize the complete finite-correlation noise functional. Its all-cell first-moment conclusion is already established in that manuscript and is not a new claim here.

2. **Mass envelope.** [Gaussian centroid partitions with arbitrary prescribed masses](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-centroid-mass-envelope/paper.md), Section 6, Theorem 11, gives an additive envelope for a prescribed-mass noise-stability supremum at $`0\le\rho<1`$. Its following remark expressly says that alternating Hermite signs prevent using its monotone remainder argument for $`\rho<0`$. It also makes no exact optimizer claim at fixed positive correlation. It therefore does not imply the negative minimum under review.

3. **Balanced fans.** [Sharp mass-constrained Gaussian propeller fans](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-propeller-balanced-fans/paper.md), Theorems 16–17 in Sections 12–13, compare the regular simplex against one equiangular planar fan at positive correlation. The all-partition first-moment dual and dimension reduction later in the paper do not add a finite-correlation optimizer theorem. Its final scope section makes the restricted comparison explicit.

4. **Prescribed-mass ellipsoid.** [A sharp Gaussian first-moment inequality for every prescribed mass vector](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-prescribed-mass-centroid-ellipsoid/paper.md), Theorem 1 and Section 5, uses the inverse Gaussian profile-Hessian metric on the moment matrix. At unequal masses this is generally anisotropic. It is a first-moment functional inequality, not the unrestricted-mass minimum of the original finite-noise functional.

5. **Unequal-mass counterexample.** [A facet-exchange counterexample to the fixed-mass regular-simplex conjecture](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/gaussian-fixed-mass-propeller-counterexample/paper.md), Theorem 1 and Corollary 1.1, improves the squared first-moment objective over a translated tetrahedron while keeping a specified unequal mass vector fixed. Its benchmark is that translated tetrahedron. It does not exhibit a partition whose negative noise value beats the central equal-mass simplex.

6. **Rigidity and dimension papers.** The four-cell global and rank-rigidity papers, the centroid symmetry-rigidity manuscript, and the spherical-cap and dimension-accuracy papers were reread at their defining objectives and main statements. Their objectives are first-moment sums, stationary moment configurations or dimension costs for approximating those sums. No all-cell negative finite-noise optimizer assertion occurs in the statements inspected.

These distinctions are mathematical, not merely differences in names. For negative correlation the degree-zero term is the mass collision probability. An unrestricted first-moment comparison by itself does not control the change in that term.

## OpenAI Gaussian and Boolean sources

The actual [Gaussian propeller manuscript](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/The-Gaussian-Propeller-Bound-in-Every-Dimension-September-24-2026/main.pdf) was reread at Theorem 1.1 and its surrounding scope discussion. It proves the unrestricted squared-first-moment bound $`9/(8\pi)`$, attained by three sectors and additional empty cells. It explicitly distinguishes the finite-noise problem. In particular, its unrestricted masses do not make it a prior proof of the proposed negative statement: for $`q>3`$ the attaining propeller has a different degree-zero mass contribution from the regular $`q`$-simplex.

The Hellinger paper's Theorem 1.1 concerns a Boolean function on a uniform discrete cube and a Hellinger-affinity loss, even though it permits negative noise and arbitrary output bias. The Min-UnCut manuscript concerns binary graph-cut hardness. The Unique Games manuscript's main statement is a reduction theorem; its Isaksson–Mossel citation and previously classified invariance inputs do not assert a Gaussian optimizer. These actual objective and domain distinctions persist for negative correlation. Their exact paths and reading scopes are in the rereading manifest.

## Remaining archive matches and conclusion

The plausible Gaussian match in Trure is a counterexample to centered convex-body Gaussian dilation log-concavity. The two Principia source forms concern Stolarsky means and a uniform ordinary simplex. The inspected ArtificialZeng matches concern Atiyah–Sutcliffe linear independence and domination polynomials; the author-name and independence matches are unrelated to Gaussian partitions. Their exact problem statements were reread, not treated as missing-source exclusions.

Within this bounded comparison, the all-cell small-negative-correlation theorem has no identified prior collision. The result must nevertheless retain the credited three-cell and balanced first-moment precedents, the source and archive limits above, and its status as a partial theorem. The full negative interval and the complete named conjecture remain outside its claim.
