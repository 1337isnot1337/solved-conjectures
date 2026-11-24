# Target 07: the complex matrix multiplication exponent

Research status, 23 November 2026 (America/Chicago): **unresolved in this project**. No proof of $\omega_{\mathbb C}=2$ and no legitimate spectral point with perimeter greater than two has been obtained. The notes below contain proved reductions, independently checked obstructions, and an audit of a public exponent-two claim. They do not turn the conjecture into a solved result.

Coordination uses [issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250). The reviewed checkpoints [PR #258](https://github.com/1337isnot1337/solved-conjectures/pull/258), [PR #262](https://github.com/1337isnot1337/solved-conjectures/pull/262), and [PR #269](https://github.com/1337isnot1337/solved-conjectures/pull/269) are merged into `main`. The further full-tensor and weighted-support checkpoints [PR #271](https://github.com/1337isnot1337/solved-conjectures/pull/271) and [PR #274](https://github.com/1337isnot1337/solved-conjectures/pull/274) are also merged. The earlier scalar-model construction is credited to the concurrent work in [PR #254](https://github.com/1337isnot1337/solved-conjectures/pull/254); this work does not replace that PR's README or branch.

## Exact target and significance

Let $L(n)$ be the minimum number of scalar arithmetic operations in a division-free straight-line program over $\mathbb C$ that multiplies two arbitrary $n\times n$ matrices. Constants may depend on $n$ but not on the inputs. Define

```math
\omega_{\mathbb C}=\inf\{\tau:\ \exists C>0\ \forall n\ge2,
\ L(n)\le Cn^\tau\}.
```

The target is $\omega_{\mathbb C}=2$, equivalently: for every $\varepsilon>0$, there is an algorithm family with cost $O_\varepsilon(n^{2+\varepsilon})$. This does not assert a quadratic-time algorithm with a fixed constant. It is the full matrix multiplication exponent problem, rather than a bounded-size rank calculation or a result about one family of spectral points. Its resolution would determine the asymptotic arithmetic complexity of dense matrix multiplication in this model.

The audited prior-result question is not settled by the title of an announcement. Sun's fixed-version paper claims the full result. The audit finds failures in two printed local identities and supplies local corrections. A subsequent source-level audit proves that the specific one-bit quotient construction for $M_{64}$ is inconsistent with a known border-rank lower bound. The other global constructions and repeated propagation remain unverified. The final limiting implication in that paper is valid if its uniform border-rank construction is established. The imported AVZ theorem supplies the rigorous bound used in the present research framework,

```math
2\le\omega_{\mathbb C}\le\frac94.
```

The lower bound follows from flattenings. The upper bound is an imported result, AVZ Theorem 1.1, not a new theorem of this project. See [the source audit](INDEPENDENT_SOURCE_AUDIT.md) for exact versions and locators.

## Spectral formulation

For three parties $A,B,C$, let $\Delta_3$ be the normalized spectrum: functions on all finite complex three-tensors that are additive on direct sums, multiplicative on tensor products regrouped by party, monotone under separate local linear maps, and satisfy $F(U_3(r))=r$ for every diagonal tensor. Put

```math
d_{AB}(F)=\log_2 F(W_{AB}(2)),
```

and define the other two wire exponents cyclically. The tensor identity and Strassen characterization are

```math
M_q\cong W_{AB}(q)\otimes W_{BC}(q)\otimes W_{CA}(q),
\qquad
\omega_{\mathbb C}=
\max_{F\in\Delta_3}\bigl(d_{AB}(F)+d_{BC}(F)+d_{CA}(F)\bigr).
```

[SPECTRAL_MODEL.md](SPECTRAL_MODEL.md) defines the model, proves the wire power law, derives the identity and perimeter formula from the cited duality theorem, and proves every stated elementary implication. Flattening points give $(1,1,0)$ and its permutations. All genuine perimeters are at least two by the tight-tensor subrank theorem. The known singleton quantum points all have perimeter two. Their completeness on the three wire families is itself equivalent to the target, so it cannot be assumed as an intermediate shortcut.

## What has been established independently

| Statement | Proof and dependency | Scope |
| --- | --- | --- |
| Every multiplicative cover functional is either the indicator of nonzero tensors or $F^h$, with $F$ normalized and $0\lt h\le1$. | [Normalized extension](NORMALIZED_EXTENSION.md), tensor-power type argument. | A classification by normalization exponent, not a classification of all normalized points. |
| Any one fixed finite law on retractions admits a normalized extension preserving every old tensor value. | Same file, derived from pinned Anthropic Proposition A.7, a finite-product argument, and compactness. | The law is fixed before the extension is chosen. Different laws cannot be imposed on one extension without a compatibility proof. |
| A geodesic triple determines the entire spectral functional on that triple, and zero-distance parties can be merged without changing any tensor value. | [Full-tensor constraints](FULL_TENSOR_CONSTRAINTS.md), explicit teleportation restrictions, normalization, and Alman--Li--Pratt v2 Corollary 8.10. | Three overlapping rigid restrictions have not been proved to determine the full unit. A genuine normalized quantum point already gives a non-Hilbert tripod. |
| Tetrahedral face units asymptotically produce the six edge wires if and only if the matrix multiplication exponent is two. | [Tetrahedral overhead](TETRAHEDRAL_OVERHEAD.md), exact operational spectral duality, with the finite determinant obstruction in [full-tensor constraints](FULL_TENSOR_CONSTRAINTS.md). | The required overhead exponent satisfies $`\omega-2\le\gamma\le4-8/\omega\le4/9`$. Finite and common-unit impossibility do not imply positive asymptotic overhead. |
| Every intersecting subset-unit uncrossing holds asymptotically; the four-party source-only overhead exponent is zero. | [General free-set separator](GENERAL_FREE_SET_SEPARATOR.md) and [explicit uncrossing](UNCROSSING_ASYMPTOTIC.md), a Latin partition, polynomial separation, interpolation, and exact catalyst recycling. | The four-party maps use a source unit of size $`q^{O_q(N^{2/3})}`$ for $`N`$ copies. The finite/common-unit obstruction remains valid. This does not force the perimeter bound. |
| The unit-star source produces matrix multiplication with overhead exponent at most $`(\omega-2)/2\le1/8`$. | [Full-tensor constraints](FULL_TENSOR_CONSTRAINTS.md), an explicit block construction from a smaller matrix product. | Finite/common-unit degeneration is excluded by the tensor centroid; monomial outer maps require exponent $`1/2`$. Arbitrary linear mixing permits the smaller upper bound. |
| A normalized tripod scalar model retains perimeter $9/4$ even after intersecting submodularity, coherent retraction extension, full crossing, curvature, and all hypergraph terminal-mincut inequalities are imposed. | [Tripod countermodel](TRIPOD_COUNTERMODEL.md), explicit charge formula, mixed-derivative proof, and barycenter calculation. | This disproves sufficiency of the listed scalar requirements, including the now proved intersecting uncrossing inequality. It is not a tensor spectral point. |
| Copying a tensor's input index to another party has exact rank equal to the sum of its matrix-slice ranks. | [Copied-input obstruction](COPIED_INPUT_OBSTRUCTION.md), matching flattening and decomposition. | Polynomial multiplication costs $ab$ after copying; matrix multiplication costs at least $n^3$ in every input basis. This is about the changed tensor. |
| Simultaneous separation works for any fixed number of shared parties and any free set of at least two parties. | [General free-set separator](GENERAL_FREE_SET_SEPARATOR.md), a finite Fourier-rank catalyst, two stages of local weights, and a type argument. | The two-free-party case is Zhou's prior theorem. The broader construction also gives one-way untwisting of full nonzero-weighted hypergraph support. No originality claim is made. |
| The scalar unit charge $g(P)=2\max_\mu\sum_{i,j}\mu_i\mu_jd_{ij}$ satisfies every graph minimum-cut inequality for Euclidean positions. | [Minimum-cut compatibility](MINCUT_COMPATIBILITY.md), Gaussian projection and threshold integration. | All finite auxiliary configurations, all terminal subsets, and all nonnegative edge weights. |
| The equilateral normalized witness also satisfies hypergraph minimum-cut tests with terminals containing the original triangle. | Same file, explicit cap functions. | It remains a scalar assignment, with no values supplied on arbitrary tensors. |
| Every terminal metric that embeds in a finite tree satisfies the same hypergraph minimum-cut inequality, even with arbitrary metric auxiliaries. | [Tree-terminal proof](TREE_TERMINAL_MINCUT.md), nonexpansive extension, a weighted tree-cut measure, and endpoint randomization. | This includes every terminal triple and every equilateral terminal set. A separate cap certificate also covers square terminals; its failure for thin rectangles is proved. The arbitrary Euclidean terminal case remains unresolved here. |
| The overlapping-unit uncrossing conversion fails for every $q\ge2$ and every common full-unit catalyst. | [Overlapping units](OVERLAPPING_UNITS.md), a determinant-grid valuation argument, with independent binary polynomial certificates. | Source-only overhead is different. A rank-$\sqrt q$ unit suffices when $q$ is a square and is necessary if only the two outer maps are monomial; unrestricted subexponential overhead is supplied by the separate separator construction. |
| A required Weyl phase cannot be inserted freely into a collapsed group tensor. | [Sun phase audit](SUN_PHASE_AUDIT.md), a one-bit obstruction and the minimal-border-rank slice commutativity condition. | It does not exclude a construction from a richer source tensor. |
| The entire printed active correction cell has rank at most five over the Laurent-function field, and at most four for the stated diagonal operator. | [Active-cell obstruction](SUN_ACTIVE_CELL_OBSTRUCTION.md), exact product identities. | If the five named source pairs have exactly these complete images, their compression contradicts known lower bounds at $M_{128}$ and $M_{4096}$. Hidden additional output components would require a different, explicit certificate. |
| Sun v1's literal one-bit quotient construction cannot produce $M_{64}$. | [Source-certificate audit](SUN_SOURCE_CERTIFICATE_AUDIT.md), deletion of 64 explicitly zero source directions and Landsberg--Michałek Theorem 1.1. | The resulting upper bound $8128$ contradicts the proved lower bound $8185$. This refutes the stated construction, not the proposed $8192$ bound or $\omega=2$ itself. |
| Two printed local maps in Sun v1 fail exact substitution, and specific local corrections repair those local identities. | [Crossed-map audit](SUN_CROSSED_MAP_AUDIT.md) and exact scripts. | Neither the full claimed theorem nor its negation follows from the local checks. |

No novelty claim is made for elementary deductions or independently reconstructed published results. The named imported theorems remain dependencies. The repository's standing acceptance of Anthropic's result is followed; its circuit lower-bound proof was not re-audited.

## The operational barrier and the attempted escape

AVZ Definition 5.3 and Theorem 5.4 concern a specified formal system of degeneration ingredients and combination rules. Its symmetric operational certificate assigns exponent $3/4$ to each wire. It forbids a better square-matrix bound inside that system; it does not supply a spectral point on all tensors and does not prove a lower bound $\omega_{\mathbb C}\ge9/4$.

Adding parties while preserving full normalization is a valid deduction outside that fixed three-party formal language. The normalization proof here makes that step concrete. Applying multi-party polynomial recurrences alone still falls under Zhou's higher-order analysis. The proposed elimination of the auxiliary parties has not produced a new universal perimeter inequality.

The equilateral Euclidean triangle of side $3/4$ has scalar unit charge one and perimeter $9/4$. Placing auxiliaries in its convex hull preserves the full scalar unit charge. The construction passes midpoint, joint-retraction, crossing, and copositivity constraints, all graph minimum-cut tests, and the special hypergraph terminal tests proved for it. This proves insufficiency of those tested constraints. It does not prove that this scalar model extends to a genuine spectral point.

Ordinary Euclidean realizability has no normalization content. Every nonzero metric triangle is a positive multiple of a singleton quantum wire triple. Multiplying its distances also multiplies its logarithmic full-unit charge. For example, the equilateral $3/4$ triple is $9/8$ times the uniform quantum $2/3$ triple; this rescaling alone does not retain unit charge one.

## Sun audit: exact unresolved step

The [source-certificate audit](SUN_SOURCE_CERTIFICATE_AUDIT.md) now proves an actual contradiction in the printed $M_{64}$ quotient. Appendix A.6's eighth diagonal direction is the completion-only feature-zero graft. Equations (9.18)--(9.19) kill it for every new absolute character permitted by Section 3.2, so all 64 outer copies can be deleted. The reduced source has border rank at most $64\cdot127=8128$, while Landsberg--Michałek Theorem 1.1 gives $8185$. This conclusion survives the two earlier local repairs. It does not settle the independent $M_{32}$/$M_{1024}$ constructions or the unbounded propagation claim.

The [active-cell audit](SUN_ACTIVE_CELL_OBSTRUCTION.md) also proves that equation (10.4)'s entire Laurent family uses at most five products. If the five designated source pairs have those complete images, replacing their eight-direction realizations saves fifteen source directions and contradicts the Landsberg--Michałek lower bound at both first propagation sizes. This addresses the literal full-cell specification without assuming that the spare blocks are unused. If equation (10.4) describes only a projection, the additional components and their global use remain to be supplied.

[SUN_PROPAGATION_AUDIT.md](SUN_PROPAGATION_AUDIT.md) separates valid local calculations from the missing implication. The Walsh minors, first-difference identity, combinatorial lift counts, exact ordinary-to-active leakage operator, and a fixed source-side implementation of the face action check. Definition 10.1(iii) also requires the fresh-coordinate residual to lie in a specified five-dimensional subspace after ordinary rows are eliminated. The checked first-jet identity does not establish that residual condition for the bases or prove that it persists after another propagation step.

The phase audit likewise distinguishes a correct desired output and correct scalar identities from three local maps that produce that output from the declared source. The richer map entries and their compatibility are the remaining certificate to verify. This work does not import the exponent-two conclusion while that dependency remains unresolved.

## A full-tensor overlapping-party test

For every pair of intersecting party sets, the [general separator](GENERAL_FREE_SET_SEPARATOR.md) proves submodularity of partial-unit charges:

```math
u(S)+u(T)\ge u(S\cup T)+u(S\cap T).
```

It passes every flattening point and excludes a small square inside the Euclidean scalar model. A different [tripod scalar model](TRIPOD_COUNTERMODEL.md), however, satisfies this inequality along with normalization, coherent extensions, crossing, curvature, and all hypergraph mincut tests, while retaining perimeter $9/4$. Thus even adding this inequality does not make that enlarged scalar system sufficient. Its most direct finite tensor proof is also impossible. With

```math
X_q=U_{ABC}(q)\otimes U_{ABD}(q),\qquad
Y_q=U_{ABCD}(q)\otimes U_{AB}(q),
```

the determinant-pencil theorem in [OVERLAPPING_UNITS.md](OVERLAPPING_UNITS.md) proves that $Y_q$ is not a degeneration of $X_q$ for any $q\ge2$, even with any common full-unit catalyst. It therefore excludes every equal-power version as well. A separate degree-four covariant proof and an exact degree-eight invariant check confirm the binary case.

Source-only unit overhead has a different outcome. The [explicit separator construction](UNCROSSING_ASYMPTOTIC.md) proves $`U_{ABCD}(r_N)X_q^{\otimes N}\ge Y_q^{\otimes N}`$ with $`\log_q r_N=O_q(N^{2/3})`$. It first partitions the source by $`i+j\pmod q`$, then separates the blocks, interpolates once, and reuses an exact catalyst. Thus the full zero-overhead spectral inequality is proved. The earlier [one-fifth exponent construction](UNCROSSING_OVERHEAD.md) is valid but nonsharp. The sharp square-root lower bound for monomial outer maps still applies to that restricted class, so the new maps necessarily leave it. The tripod countermodel shows that intersecting uncrossing alone does not supply the perimeter bound from the listed scalar constraints.

[UNCROSSING_RANK_TESTS.md](UNCROSSING_RANK_TESTS.md) proves that retained-pair multilinear commutative rank cannot separate the desired uncrossing direction even after arbitrary tensor multipliers. An all-degree exterior covariant supplies finite obstructions, but the entire family stops obstructing after a source unit of size two. These are limitations of the stated tests, not pointwise inequalities for every spectral point.

## Full-tensor constraints and the new remaining conversion

The [geodesic rigidity theorem](FULL_TENSOR_CONSTRAINTS.md) fixes every tensor value on each three-party geodesic restriction. Pairwise losslessness of a projection that identifies two central indices does not prove losslessness of the next projection: the tempting proof treats a duplicated label on two parties as one joint party and then uses maps that are not local. The stronger, explicitly stated target retains all three matrix multiplication edge labels at a fourth party; its exact restriction problem is equivalent to covering the whole matrix multiplication support subspace by a sum of small product subspaces. Counting coordinate supports does not control arbitrary linear cancellation.

The [tetrahedral formulation](TETRAHEDRAL_OVERHEAD.md) gives a second exact target. If $`H_q`$ is the product of four three-party face units and $`K_q`$ is the product of the six tetrahedral wires, then the least extra full-unit exponent is

```math
\gamma=\max_{F\in\Delta_4}\log_q\frac{F(K_q)}{F(H_q)},
\qquad \omega_{\mathbb C}-2\le\gamma\le4-\frac8{\omega_{\mathbb C}}.
```

Thus $`\gamma=0`$ is equivalent to the original objective. The written proof includes the conversion between extra source powers and source-only full-unit overhead. A finite determinant obstruction excludes $`H_q\unrhd K_q`$, even with common full-unit catalysts, while all ordinary cut flattenings agree. That finite obstruction is compatible with vanishing overhead exponent.

## Weighted targets and relaxed repair criteria

[WEIGHTED_SUPPORT_REPAIRS.md](WEIGHTED_SUPPORT_REPAIRS.md) separates two facts. Li's arXiv:2611.04175v1, Lemma 2.9 and Corollary 2.10, prove asymptotic untwisting of full matrix multiplication support and equality of the support-rank exponent with the usual exponent. An independently checked adaptation of the Landsberg--Michałek one-puncture argument proves that every nonzero weighting of full size-n support has border rank at least $`2n^2-n+1`$ for $`n\ge3`$. Its triangular Koszul pivots do not depend on coefficient values. Thus the deleted-graft source of budget $`8128`$ cannot even produce an arbitrary fully supported weighted $`M_{64}`$, whose border rank is at least $`8129`$.

That finite obstruction leaves a weaker constructive route open. Li's Theorem 2.11 gives $`m^{\omega/3}\le r`$ for a partial weighted matrix multiplication tensor with $`m`$ nonzero cycles and border rank at most $`r`$. An unbounded family with $`m=n^{3-o(1)}`$ and $`r=n^{2+o(1)}`$ would suffice. The note proves explicit sufficient rank and density recurrences, with the initial-density condition stated. The [partial-repair audit](SUN_PARTIAL_REPAIR.md) tests a concrete 44-cycle fresh block: every nonzero weighting has border rank at least eighteen, so the sixteen fresh diagonal labels cannot supply this block on their own. The proof does not identify that diagnostic block with the source's unprinted ordinary maps. Controlling every off-cycle term and a valid next-step source state remains necessary.

The weighted-support argument extends, by the [general free-set separator](GENERAL_FREE_SET_SEPARATOR.md), to arbitrary nonzero coefficients on full hypergraph-tensor support with nonempty edges. The [weighted tetrahedral obstruction](WEIGHTED_TETRAHEDRAL_OBSTRUCTION.md) proves that coefficient changes do not remove the finite or common-unit obstruction. It makes no source-only asymptotic-overhead claim. The [four-party resource certificate](TETRAHEDRAL_RESOURCE_LIMITATION.md) explains why the listed face algorithms, graph bounds, terminal mincuts, and even free intersecting uncrossing cannot improve the existing tetrahedral overhead by recombination on those four labels. It is not a spectral point and does not cover additional auxiliary labels or arbitrary coefficient-sensitive maps.

## Remaining mathematical obligation

To prove the target by this route, establish a full-tensor inequality on one compatible normalized extension that forces

```math
d_{AB}+d_{BC}+d_{CA}\le2
\qquad\text{for every }F\in\Delta_3,
```

or supply an equivalent asymptotic degeneration. The tripod theorem identifies a precise limitation: this implication must use information beyond the scalar constraints verified there. To disprove the target, construct a function on all tensors satisfying every spectral axiom and having perimeter greater than two. A scalar metric satisfying necessary inequalities is insufficient. Verifying and repairing Sun's full source-to-target map and the residual induction would be another route; any resulting prior theorem would be credited to its author.

These obligations remain unresolved. All partial results are retained under `research/`; there is no solved-results entry for this target.

## Reproducible verification

From this directory, run:

```bash
python3 check_auxiliary_certificates.py
python3 check_sun_phase_and_mask.py
python3 check_sun_crossed_map.py
python3 check_sun_propagation_local.py
python3 check_unit_uncrossing.py
python3 check_tripod_countermodel.py
python3 check_sun_quotient_budget.py
python3 check_sun_dense_table.py
python3 check_sun_active_cell_compression.py
python3 check_four_party_constraints.py
python3 check_weighted_mm_koszul_pivots.py
python3 check_sun_ordinary_partial_block.py
python3 check_general_free_separator.py
python3 check_uncrossing_separator.py
```

The propagation-local, ordinary-partial-block, and general-free-separator scripts use SymPy; the others use Python's standard library. They check the finite coefficients, flattenings, minors, and local counterexamples described in the proofs. None checks a complete matrix multiplication circuit or the unbounded dyadic induction. No new Lean proof or kernel verification is claimed.

The review scope and reproducible check inventory are recorded in [REVIEW_AND_VERIFICATION.md](REVIEW_AND_VERIFICATION.md).
