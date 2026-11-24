# Target 07: the complex matrix multiplication exponent

Research status, 24 November 2026 (UTC): **unresolved in this project**. No proof of $\omega_{\mathbb C}=2$ and no legitimate spectral point with perimeter greater than two has been obtained. The notes below contain proved reductions, independently checked obstructions, and an audit of a public exponent-two claim. They do not turn the conjecture into a solved result.

Coordination uses [issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250). The campaign and its reviewed checkpoints are preserved on the permanent `research` branch. Earlier PRs initially merged into the former mixed-purpose `main`; the [branch migration ledger](../../docs/branch-migration.md) preserves those commits and review records after `main` became publication-only. The earlier scalar-model construction is credited to [PR #254](https://github.com/1337isnot1337/solved-conjectures/pull/254). It remains part of the research history, and no solved-result entry is claimed.

## Exact target and significance

Let $L(n)$ be the minimum number of scalar arithmetic operations in a division-free straight-line program over $\mathbb C$ that multiplies two arbitrary $n\times n$ matrices. Constants may depend on $n$ but not on the inputs. Define

```math
\omega_{\mathbb C}=\inf\{\tau:\ \exists C>0\ \forall n\ge2,
\ L(n)\le Cn^\tau\}.
```

The target is $\omega_{\mathbb C}=2$, equivalently: for every $\varepsilon>0$, there is an algorithm family with cost $O_\varepsilon(n^{2+\varepsilon})$. This does not assert a quadratic-time algorithm with a fixed constant. It is the full matrix multiplication exponent problem, rather than a bounded-size rank calculation or a result about one family of spectral points. Its resolution would determine the asymptotic arithmetic complexity of dense matrix multiplication in this model.

The audited prior-result question is not settled by the title of an announcement. Sun's fixed-version paper claims the full result. The audit finds failures in two printed local identities and supplies local corrections. Subsequent source-level audits prove that the specific one-bit quotient for $M_{64}$ and the combination of the complete tangent ledger with fixed degree-zero globalization for $M_{32}$ are inconsistent with known border-rank lower bounds. These arguments do not exclude every alternative construction with the proposed source budgets. The other global constructions and repeated propagation remain unverified. The final limiting implication in that paper is valid if its uniform border-rank construction is established. The imported AVZ theorem supplies the rigorous bound used in the present research framework,

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
| Every tensor's logarithmic value is convex under simultaneous geodesic placement of its factors; every coupling with the same midpoint marginals gives a valid bound. | [Tensor midpoint convexity](TENSOR_MIDPOINT_CONVEXITY.md), duplicate labels, normalized extension, CN uniqueness, and explicit zero-price factor transport. | Applying these inequalities only to units or their products still admits the normalized energy tripod. |
| Conditional geodesic uncrossing on all normalized four-party points is equivalent to the exponent being two. | [Geodesic uncrossing equivalence](GEODESIC_UNCROSSING_EQUIVALENCE.md), unit convexity, a one-dimensional density bound, and CAT(0) first variation. | The reverse unit inequality is unproved. The geometric implication does not assume a Euclidean realization or a common tripod extension. |
| A geodesic triple determines the entire spectral functional on that triple, and zero-distance parties can be merged without changing any tensor value. | [Full-tensor constraints](FULL_TENSOR_CONSTRAINTS.md), explicit teleportation restrictions, normalization, and Alman--Li--Pratt v2 Corollary 8.10. | Three overlapping rigid restrictions have not been proved to determine the full unit. A genuine normalized quantum point already gives a non-Hilbert tripod. |
| Every normalized spectral point with a wire of exponent one has an interval metric on all its parties. | [Edge metric rigidity](EDGE_METRIC_RIGIDITY.md), three-party edge classification and pinned price curvature; every finite interval metric is realized by one threshold-retraction law. | All subset-unit charges equal interval diameters. This is a boundary theorem, not an interior perimeter bound. |
| A specified normalized point has an all-values-preserving geodesic tripod extension if and only if it satisfies the arm-weighted dimension bound on every old tensor. | [Tripod extension criterion](TRIPOD_EXTENSION_CRITERION.md), star routing, a cover gauge, saturation, and pinned Proposition A.5. | The weaker wire-only problem has a separate finite-cover criterion. Neither existence condition is proved universally. |
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
| Sun v1's complete tangent ledger cannot produce M32 through its stated fixed degree-zero side maps. | [Tangent-globalization audit](SUN_TANGENT_GLOBALIZATION_OBSTRUCTION.md), a six-product degeneration retaining all raw records and independent source-cost certificates. | Compressing one pair per outer row gives 2032, below the published lower bound 2042. Additional leading records or later Laurent poles define a different construction. The abstract border-rank-2048 claim is not refuted. |
| The entire printed active correction cell has rank at most five over the Laurent-function field, and at most four for the stated diagonal operator. | [Active-cell obstruction](SUN_ACTIVE_CELL_OBSTRUCTION.md), exact product identities. | If the five named source pairs have exactly these complete images, their compression contradicts known lower bounds at $M_{128}$ and $M_{4096}$. Hidden additional output components would require a different, explicit certificate. |
| The size-three trace-cubic apolar algebra, and every positive tensor power of that algebra, is nonsmoothable. | [Trace-cubic certificate](TRACE_CUBIC_NONSMOOTHABILITY.md), one exact integer-matrix rank certificate, Frobenius duality, a conormal tensor-product lemma, and Jelisiejew v5 Theorem 1.2(1). | This is a computer-assisted failed-source certificate. It does not prove a matrix multiplication asymptotic-rank gap. |
| Full nonzero weighted matrix multiplication cannot be extracted from a finite lower-ideal polynomial algebra by the specified coordinate selections and diagonal degenerations at a subcubic source size. | [Polynomial-source obstruction](POLYNOMIAL_SOURCE_OBSTRUCTION.md), an explicit smoothing and an injective lattice-point construction. | Arbitrary linear mixing, coordinate merging, and partial support remain outside the obstruction. |
| The proposed retained-sum convolution block extraction needs linear source overhead; its equal-size contracted alternative has a symmetrizer obstruction. | [Convolution block obstructions](CONVOLUTION_BLOCK_OBSTRUCTIONS.md), a two-versus-two flattening, balanced trade, and closed symmetrizer condition. | Constant-factor rectangular compression and source-only overhead are not excluded by the symmetrizer. |
| Sun v1's literal one-bit quotient construction cannot produce $M_{64}$. | [Source-certificate audit](SUN_SOURCE_CERTIFICATE_AUDIT.md), deletion of 64 explicitly zero source directions and Landsberg--Michałek Theorem 1.1. | The resulting upper bound $8128$ contradicts the proved lower bound $8185$. This refutes the stated construction, not the proposed $8192$ bound or $\omega=2$ itself. |
| Two printed local maps in Sun v1 fail exact substitution, and specific local corrections repair those local identities. | [Crossed-map audit](SUN_CROSSED_MAP_AUDIT.md) and exact scripts. | Neither the full claimed theorem nor its negation follows from the local checks. |

No novelty claim is made for elementary deductions or independently reconstructed published results. The named imported theorems remain dependencies. The repository's standing acceptance of Anthropic's result is followed; its circuit lower-bound proof was not re-audited.

## The operational barrier and the attempted escape

AVZ Definition 5.3 and Theorem 5.4 concern a specified formal system of degeneration ingredients and combination rules. Its symmetric operational certificate assigns exponent $3/4$ to each wire. It forbids a better square-matrix bound inside that system; it does not supply a spectral point on all tensors and does not prove a lower bound $\omega_{\mathbb C}\ge9/4$.

Adding parties while preserving full normalization is a valid deduction outside that fixed three-party formal language. The normalization proof here makes that step concrete. Applying multi-party polynomial recurrences alone still falls under Zhou's higher-order analysis. The proposed elimination of the auxiliary parties has not produced a new universal perimeter inequality.

The equilateral Euclidean triangle of side $3/4$ has scalar unit charge one and perimeter $9/4$. Placing auxiliaries in its convex hull preserves the full scalar unit charge. The construction passes midpoint, joint-retraction, crossing, and copositivity constraints, all graph minimum-cut tests, and the special hypergraph terminal tests proved for it. This proves insufficiency of those tested constraints. It does not prove that this scalar model extends to a genuine spectral point.

Ordinary Euclidean realizability has no normalization content. Every nonzero metric triangle is a positive multiple of a singleton quantum wire triple. Multiplying its distances also multiplies its logarithmic full-unit charge. For example, the equilateral $3/4$ triple is $9/8$ times the uniform quantum $2/3$ triple; this rescaling alone does not retain unit charge one.

## Sun audit: exact unresolved step

The [source-certificate audit](SUN_SOURCE_CERTIFICATE_AUDIT.md) proves an actual contradiction in the printed $M_{64}$ quotient. Appendix A.6's eighth diagonal direction is the completion-only feature-zero graft. Equations (9.18)--(9.19) kill it for every new absolute character permitted by Section 3.2, so all 64 outer copies can be deleted. The reduced source has border rank at most $64\cdot127=8128$, while Landsberg--Michałek Theorem 1.1 gives $8185$. This conclusion survives the two earlier local repairs. That deletion argument alone does not settle the independent base constructions or the unbounded propagation claim.

The separate [tangent-globalization audit](SUN_TANGENT_GLOBALIZATION_OBSTRUCTION.md) addresses the M32 base directly. The complete tangent output in Section 6.2 and Appendix A.5 has border rank at most six, including all eight raw dense records and all three clean endpoints. The claimed source charges seven. Replacing only one pair in each of the sixteen rows reduces the budget to 2032, contradicting the lower bound 2042. Section 8's fixed degree-zero side maps preserve the complete leading tensor, which is the precise globalization premise used. Merely retaining the printed one-leg record names does not evade the compression. Additional leading components or later poles require a changed full source map; no such repair is validated here.

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


The [tripod extension criterion](TRIPOD_EXTENSION_CRITERION.md) separates
what must be proved before using a geodesic auxiliary center. Preserving
a specified old point on every tensor is equivalent to an all-tensor
dimension bound with exponents equal to the three arm lengths. The
perimeter argument needs only some representative with the same old
wire values. That weaker existence condition is equivalent to the absence
of a strict finite-cover saving on every power of
$`U_{ABC}(2)M_2`$ in the explicit resource gauge. The old unit is priced
exactly at its rank in both formulations. A fixed random-retraction law
does not establish either condition automatically.

[COPIED_FACTOR_COUNTEREXAMPLE.md](COPIED_FACTOR_COUNTEREXAMPLE.md) gives
a normalized quantum point where copying a local factor fails monotonicity
under an invertible shear. [TRIANGLE_SUBSPACE_FRAME.md](TRIANGLE_SUBSPACE_FRAME.md)
gives a lower bound for the stronger retained-label lift under a uniform
frame bound, including commuting product-space projectors. The unrestricted
case permits the frame bound to approach zero. The stronger lift does have
an explicit overhead exponent at most $`(\omega_{\mathbb C}-2)/2`$,
by an outer triangle algorithm followed by three independent face-unit
distillations; this upper bound is proved in
[FULL_TENSOR_CONSTRAINTS.md](FULL_TENSOR_CONSTRAINTS.md), Section 4.4.

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

## An exact exterior output and its computed spectral value

[EXTERIOR_INCIDENCE_SOURCE.md](EXTERIOR_INCIDENCE_SOURCE.md) gives an
exact restriction from the geodesic source itself. For
$`q=2L+1`$ and $`N=\binom qL`$, it maps

```math
U_{ABC}(q)W_{CD}(q)W_{AD}(N)W_{BD}(N)
\ \ge\ W_{q,L}^{\mathrm{empty}}\ \ge\ W_{q,L}.
```

All local maps are explicit. The A/B maps retain their common outer
index. Occupied and empty exterior-coordinate restrictions force the
creation index of each D operator to match that outer index, leaving
exactly the matching C/D edge tags. The earlier two-family derivation
was redundant: one family is killed by the occupied projection. Both
A and B flattenings of $`W_{q,L}`$ have rank $`LN`$.
The checker verifies every C/D coefficient at sizes three and five.

The leading spectral value is now determined on every normalized
geodesic point:

```math
\frac1{48}N^{d_{AB}}q^{1+d_{CD}}
\le F(W_{q,L})\le N^{d_{AB}}q^{1+d_{CD}}
\quad\text{if }d_{AD}+d_{BD}=d_{AB}.
```

The lower bound uses a genuine full direct sum after a cross-edge
restriction, the free-CD partial-sum inequality, and a two-copy cover
of the empty-sector output by the kernel output. The upper bound is
the source restriction. The proof also recovers the known normalization
$`u_{ABC}=u_{ABCD}=1`$ on this geodesic face.

Consequently a lower bound with exponent $`u_{ACD}+u_{BCD}`$ in
place of $`1+d_{CD}`$ is exactly equivalent to the missing unit
inequality. The construction does not prove it. Treating the overlapping
B-subset blocks as an AB-disjoint partial sum would hide this gap.

[EXTERIOR_PARTIAL_TARGETS.md](EXTERIOR_PARTIAL_TARGETS.md) proves
that two more structured exterior outputs would suffice, by extracting
large rectangles whose blocks really are disjoint at A and B. It also
proves that fixed incident-edge supports at C cannot produce either
output with subpolynomial overhead. The quotient argument survives
Laurent limits by saturated lattices. The same argument extends the
fixed row/column bound in
[OPERATOR_TRADE_OBSTRUCTIONS.md](OPERATOR_TRADE_OBSTRUCTIONS.md)
to Laurent maps retaining those supports. Arbitrary dense C maps remain
outside these obstructions.

Two other necessary tests are recorded separately. The displayed-basis
monomial A/B/C class requires $`rN/M\ge\sqrt q`$, even with
arbitrary D maps and different C maps in each family; see
[MONOMIAL_GEODESIC_COVERAGE.md](MONOMIAL_GEODESIC_COVERAGE.md).
At fixed outer size two, arbitrary Laurent maps require
$`2rN\ge3M`$, by a matrix-pencil contraction and the commutator
rank bound; see [Q2_BORDER_FLAG_BOUND.md](Q2_BORDER_FLAG_BOUND.md).
Neither test excludes the unrestricted growing-size construction.

[INFINITESIMAL_GEODESIC_UNCROSSING.md](INFINITESIMAL_GEODESIC_UNCROSSING.md)
gives an equivalent local target: for each fixed anchor, the
nonnegative uncrossing defect must be $`o(h)`$ at almost every
endpoint split of length $`h`$. Absolute continuity then proves
exact additivity on every subdivision. A merely linear estimate is
insufficient: the normalized energy tripod has derivative $`1/9`$
at its symmetric endpoint. This criterion is proved; the required
spectral estimate remains unresolved.

## Constructive sources and exact failed steps

The [polynomial-source note](POLYNOMIAL_SOURCE_OBSTRUCTION.md) supplies
an explicit rank-$`|D|`$ border family for every finite lower ideal
$`D`$. Full weighted matrix multiplication cannot be obtained by the
stated coordinate-selection and diagonal-weight method unless
$`|D|\ge n^3`$. Dense partial support and general linear compression
remain separate construction problems.

The [convolution note](CONVOLUTION_BLOCK_OBSTRUCTIONS.md) rules out the
proposed $`m`$-block retained-output extraction even with arbitrary maps
at subpolynomial overhead: a cut requires at least
$`m^3/(2m-1)^2`$ extra unit rank. After contracting the output, an
independent symmetrizer invariant excludes the exact-size target of
$`m`$ copies of $`M_m`$. Rectangular compression is not settled.

The [trace-cubic certificate](TRACE_CUBIC_NONSMOOTHABILITY.md) rules out
smoothability of the length-twenty algebra
$`\mathop{\mathrm{Ap}}(\mathop{\mathrm{tr}}(X^3))`$ at size three.
An exact $`495\times666`$ integer-matrix calculation and a written
Frobenius-duality argument establish trivial negative tangents. The
property persists under tensor products. This is a computer-assisted
proof about this particular source algebra, with an imported geometric
theorem; it is not a border-rank or exponent lower bound for matrix
multiplication.

[SMOOTHABLE_MM_ENLARGEMENT.md](SMOOTHABLE_MM_ENLARGEMENT.md) gives a
different algebra containing $`M_n`$ and an explicit splitting deformation
followed by a smoothing at cubic length. The proposed quadratic module
source is now excluded by
[SQUARE_ZERO_MODULE_OBSTRUCTION.md](SQUARE_ZERO_MODULE_OBSTRUCTION.md),
Theorem 7. For $`n\ge2`$ and $`1\le m\le n`$, the tuple with
upper-right blocks $`X\otimes I_m`$ admits no formal simultaneous
diagonal smoothing. The proof retains every perturbation and iterates
a radical-filtration obstruction using convergent formal shears. Its
Laurent-border-rank consequence concerns the identity-completed tensor,
not $`M_n`$ itself. Multiplicity greater than $`n`$ and changed module
sources remain outside the theorem. The enlargement note also records
exact constant errors in two fixed-v2 source corollaries and uses only
the full-dimension proposition.
The [Heisenberg target](HEISENBERG_CHIRP_TARGET.md) gives another precise
construction problem: rank $`p^{3+o(1)}`$ for its multiplication tensor
would suffice. A chirp realizes one matrix block at cubic cost; the tested
central Fourier packing yields commutative blocks and supplies no bound.

[SUN_M32_MAP_AUDIT.md](SUN_M32_MAP_AUDIT.md) separately records the
unresolved source-local arrays for the claimed size-thirty-two base.
That base is logically independent of the refuted size-sixty-four
quotient. Its scalar identities and terminal relabelling do not specify
the needed three local maps. The base remains unverified here; it is not
rejected solely because the later quotient fails.

## A first-order spectral reduction

[FLATTENING_TANGENTS.md](FLATTENING_TANGENTS.md) uses Strassen's
star-convexity only on the three wire values. A two-star restriction
and an explicit transfer of a factor along a wire bound every fixed
tensor value by its $`A`$-flattening rank plus $`O_T(t)`$.
Product compactness gives one additive derivation $`D`$ on all tensors,
with the Leibniz rule based at $`r_A`$ and monotonicity only for
comparisons that preserve the $`A`$ rank. For a starting point with
wire prices $`x,y,z`$,

```math
D(M_q)=q^2\log q\,(x+y+z-2).
```

Thus nonpositivity on $`M_2`$ for every derivation obtained in this way
is equivalent to the target. This sign is unresolved. No differentiable
path of full spectral points, classification of all derivations, or
integration of arbitrary abstract derivations is asserted.

[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md) isolates a related
four-party target. On a genuine geodesic face, forward uncrossing forces
$`u_{ABC}=u_{ABCD}=1`$; the missing reverse inequality is
$`u_{ACD}+u_{BCD}\le1+d_{CD}`$. A concrete resource trade would
prove it. A common-centroid invariant excludes that trade at equal
size, at every equal tensor power, and with common full-unit catalysts.
Source-only subexponential overhead remains open. In the conditional
spectral test, the neutral wire size can grow arbitrarily quickly,
since its price cancels exactly.

## The geometric reduction is complete; the unit equality is not

[TENSOR_MIDPOINT_CONVEXITY.md](TENSOR_MIDPOINT_CONVEXITY.md) proves the
full tensor placement inequality, including noninjective placements
and arbitrary couplings with fixed midpoint marginals. A new extension
is allowed for each coupling: CN uniqueness identifies its new midpoint
copies with the already fixed old labels, so the bounds concern one
old tensor value. This does not impose incompatible arbitrary laws on
one extension.

[GEODESIC_UNCROSSING_EQUIVALENCE.md](GEODESIC_UNCROSSING_EQUIVALENCE.md)
now proves the equivalence

```math
\omega_{\mathbb C}=2
\quad\Longleftrightarrow\quad
u(A,C,D)+u(B,C,D)=u(A,B,C)+d(C,D)
\quad\text{whenever }D\in[A,B],
```

where the right side is required for every actual normalized four-party
point. For the nontrivial implication, put $`\varepsilon=P/2-u`$.
The conditional equality makes this nonnegative triangle content
additive under geodesic subdivision. Unit convexity controls its
one-dimensional density by the derivative of the distance function.
Contracting the opposite vertex toward a differentiability point then
forces the total content to be both $`o(s)`$ and at least a positive
constant times $`s`$, unless the content vanishes. The proof applies
to arbitrary CAT(0) completions; no regularity or dimension assumption
is omitted.

The converse follows by normalizing every three-label restriction and
applying the spectral perimeter characterization. The note also retains
a counterexample to the rejected single-root metric-rigidity lemma.
Compactness and spectral duality make the finite family in
[GEODESIC_UNIT_TRADE.md](GEODESIC_UNIT_TRADE.md) an equivalent
operational target, with the neutral-flag parameter fixed before each
asymptotic limit. No such family is constructed. Its output flag may
also lose a factor whose logarithm is $`o(\log q)`$, as proved there.
Forward intersecting uncrossing alone does not give the required reverse
inequality.

## Mixed valuations and the next flag-exchange constructions

[ADJACENT_MODULE_DEFORMATIONS.md](ADJACENT_MODULE_DEFORMATIONS.md)
records necessary conditions beyond the excluded multiplicity range.
For $`n\ge3,m=n+1`$, a nontrivial first diagonal term has the form
$`\Phi_X=\chi(X)I+\ell(X)H`$ with $`H^2=0`$. Exact commuting
completions with upper block $`X\otimes I_m`$ are excluded at every
multiplicity. A hyperplane cocycle lemma specifies the next necessary
condition on a perturbed upper block. It does not exclude all
deformations at $`m=n+1`$.

[MIXED_VALUATION_PADDING.md](MIXED_VALUATION_PADDING.md) gives an
exact diagonal smoothing of $`N_{2,2}\oplus0_3`$ in dimension eleven.
It uses the seven-product Strassen identity and therefore gives no new
rank bound. It explicitly exhibits the alternating product through
added trivial directions which is absent from the unpadded equations.
The remaining target is a family of quadratic total dimension whose
construction does not already assume a quadratic multiplication rank.

The geodesic construction audit now preserves three distinct failures.
[FLAG_EXCHANGE_OBSTRUCTIONS.md](FLAG_EXCHANGE_OBSTRUCTIONS.md)
proves exact flattening bounds with changed spectator catalysts and,
for a common invertible $`C`$ map across $`r`$ source summands,
the bound $`rN/N'\ge\sqrt q`$.
[FOURIER_TRADE_OBSTRUCTIONS.md](FOURIER_TRADE_OBSTRUCTIONS.md)
computes the full off-diagonal output of a Fourier attempt and the
rank of its proposed coefficient repair.
[OPERATOR_TRADE_OBSTRUCTIONS.md](OPERATOR_TRADE_OBSTRUCTIONS.md)
proves the row/column-support bound $`qN'\le rN`$, allowing
arbitrary mixing at $`A,B`$, and records an
invertible off-support coefficient in the two-family Weyl attempt.
The latter formula cancels only after imposing an index relation that
the local maps do not enforce.

These results exclude the stated map classes. Arbitrary mixed maps
and degenerations remain outside their scope. The general criterion
allows a constant flag loss, such as $`N'=N/2`$, as $`q\to\infty`$;
an obstruction to near-full retention alone would not rule it out.

## Operator identities as finite tensor maps

[WEYL_DIVISION_TRADE_TRANSFER.md](WEYL_DIVISION_TRADE_TRANSFER.md)
proves an exact conversion from a legal joint coefficient identity
over a filtered Ore division algebra to finite four-party tensor
maps with neutral-flag ratio tending to one. For Weyl algebras, PBW
dimension growth supplies the finite spaces. A common right
denominator protects every multiplication prefix; the construction
never inverts a truncated operator. A central-parameter version
also handles rational families and honest Laurent series with finite
pole order. The regular retraction and finite-jet bound are proved.

The missing input is a joint identity with subpolynomial family count.
[JOINT_FOURIER_CCR_RESIDUAL.md](JOINT_FOURIER_CCR_RESIDUAL.md)
gives a Fourier and commutator candidate whose scalar contraction
has exactly the required four label comparisons. Its complete
coefficient contains a nonzero normally ordered monomial, so it is
not a valid trade. The note preserves that residual explicitly.

The 784-column exact replay checks a separate rational Weyl identity
on the finite retained spaces. It checks the denominator/projection
mechanism, not the unresolved geodesic trade. No matrix multiplication
bound or new Lean verification follows from this checkpoint.

## Tagged sources and weaker sufficient outputs

[TAGGED_OPERATOR_TRADE_TRANSFER.md](TAGGED_OPERATOR_TRADE_TRANSFER.md)
shows how the existing polynomial separator explicitly supplies the
shared source label at D. The resulting operator identity may depend
on both h and c at D; the extra path-flag factor tends to one on the
geodesic face. This enlarges the construction criterion without
changing the original untagged theorem or silently adding an input.

[TAGGED_GEODESIC_SUBSPACE_COVER.md](TAGGED_GEODESIC_SUBSPACE_COVER.md)
gives an exact equivalent formulation using overlapping product
subspaces of dimensions at most N, N, and Q. The D slices are
independent linear combinations of those subspaces. It also specifies
an exact kernel calculation for the largest support-correct partial
output obtainable from fixed A/B/C maps.

Two proved relaxations reduce what an eventual construction must
produce. [PARTIAL_HYPERGRAPH_DENSITY.md](PARTIAL_HYPERGRAPH_DENSITY.md)
shows that a partial target of density rho has spectral value at least
rho times the full target's value. The proof covers tensor powers
before taking limits, so it imposes no growth bound on the neutral
flag. [SINGLE_PARTY_PROJECTION_TRADE.md](SINGLE_PARTY_PROJECTION_TRADE.md)
gives an exact orbit-cover construction for a rank-k linear map at one
party of dimension d, and the lower bound k/d times the full target's
value. It does not allow arbitrary incompatible projections at two
parties.

Thus a support-correct partial output of density p^{-o(1)}, or a
single-party compression retaining a p^{-o(1)} fraction of dimension,
would suffice with the stated subpolynomial source and flag losses.
No such asymptotic construction is proved. Numerical spans have not
been substituted for exact kernel or coefficient certificates.

[INDEPENDENT_WIRE_AMPLIFICATION_FAILURE.md](INDEPENDENT_WIRE_AMPLIFICATION_FAILURE.md)
preserves a different failed attack. Its projective cover functional
has the correct values separately on old tensors and an independent
new matrix wire, but cannot retain their product value on all powers
of MM_2 times that wire. A.5 pinning would otherwise combine a
known equilateral quantum wire triangle with a wire of exponent one,
contradicting interval rigidity. The finite cover saving exists
nonconstructively; its size and coefficients are not exhibited.
This is not a new bound on the matrix multiplication exponent.

## Exact compression criteria and revised source constructions

[ARBITRARY_C_COMPRESSION.md](ARBITRARY_C_COMPRESSION.md) gives a
necessary and sufficient column-membership condition for an arbitrary
C compression from fixed tagged A/B/C maps. Its maximum possible rank
has a subspace Hall formula. The same independent D-slice freedom gives
aggregate flattening bounds on the row and column sums of the allowable
subspaces. Those bounds rule out the earlier proposed shortcut of asking
for nearly p-squared-dimensional spaces at nearly p-squared positions.
They do not rule out high collective rank from many small subspaces.

[CONTROLLED_EXTERIOR_COMPRESSION.md](CONTROLLED_EXTERIOR_COMPRESSION.md)
proves two explicit C maps retain at least one quarter and one third,
respectively, of the target C dimension. The maps are not conversions:
[GAUSSIAN_SINGLE_TRANSFER_FAILURE.md](GAUSSIAN_SINGLE_TRANSFER_FAILURE.md)
exhibits two coefficients that sum to zero for the stated modewise
Gaussian source class, while the proposed transfer target has values
one and zero there. Independent dense ground changes are outside that
counterexample's hypotheses.

[FIXED_FLAVOUR_FUSION_FAILURE.md](FIXED_FLAVOUR_FUSION_FAILURE.md)
derives a complete legal determinant-fusion identity, including all
off-target coefficients. Its separate operator factors give a rank
bound after a precisely scoped formal adjoint. In the sparse-subset
regime the rank is at most p^(1+o(1)), too small for a p^(2-o(1))
compression. The obstruction also covers C-only postprocessing of that
exact output. Coherent ambient flavour sums and arbitrary different
source maps are not covered.

[SQUARE_C_LAURENT_OBSTRUCTION.md](SQUARE_C_LAURENT_OBSTRUCTION.md)
proves a different restricted failure: with one source family and a
square C map, even Laurent degeneration to the full target requires
N/M at least sqrt(p). A limiting covector subspace preserves the needed
flattening bounds even when C becomes singular. The theorem covers
the unit source and local Frobenius trace-four sources; larger source
C spaces, distinct C maps across families, and lower-rank targets
remain outside its scope.

Two explicit constructions define the revised search. The
[Grassmannian Weyl operators](GRASSMANNIAN_WEYL_FLAG_CANDIDATE.md)
give actual ordered local maps, with a stated unresolved joint equation.
The [Grassmannian Frobenius source](GRASSMANNIAN_FROBENIUS_SOURCE.md)
has an explicit degeneration from the rank-p four-party unit, a
nondegenerate complement pairing, and additive exterior multiplication
matrices. Its algebra and root-subset description are prior results of
Rietsch; the four-party coefficient normalization is independently
reconstructed here. A [quadratic Frobenius source](QUADRATIC_FROBENIUS_SOURCE.md)
provides another explicit coherent-flavour system, but a stronger
source-level argument now excludes its classical tensor powers.
All printed coefficient equations retain the actual D inputs.

[SLICE_COVER_TARGET_CAPACITY.md](SLICE_COVER_TARGET_CAPACITY.md)
proves that a three-space source cover of dimensions u, v, w can produce
a C-compressed target only with rank at most w+p(u+v)/M. It permits
arbitrary local maps, distinct C maps across families, and border limits.
For powers of the quadratic Frobenius source, this bounds the attainable
rank by p^(5/3+o(1)) at the proposed budgets. It also bounds the density
of weighted partial targets by p^(-1/3+o(1)).

The [Grassmannian degree count](GRASSMANNIAN_SLICE_CAPACITY.md)
excludes the classical balanced source with the fixed exponent loss
delta=1/(12 log 4), and gives a positive loss whenever k/s tends to an
interior constant. The same low-degree space has dimension at least
3^(-k) times binom(s,k), so this particular obstruction has no fixed
exponent loss in the sparse regime. Quantum-wrap components and
simultaneous singular constructions retaining them are outside the
classical source argument. They remain active candidates.

[GRASSMANNIAN_SOURCE_SCOPE.md](GRASSMANNIAN_SOURCE_SCOPE.md)
rules out an exact trade using only commuting coefficient operators,
by a scalar character and an AB|CD flattening. It also records necessary
degree and unit-slice conditions for a coordinate matrix multiplication
embedding. Those conditions do not exclude arbitrary embeddings and do
not produce a superquadratic lower bound.

[INDEPENDENT_FLAG_PROJECTIONS.md](INDEPENDENT_FLAG_PROJECTIONS.md)
allows rank fractions to multiply for two projections supported on
different factors of the target. It does not assert a general
two-party compression theorem. These exact reductions and failed
ansatzes leave the exponent target unresolved.

## Quantum sources, recoverable channels and conditional shifts

[QUANTUM_GRASSMANNIAN_COMPONENTS.md](QUANTUM_GRASSMANNIAN_COMPONENTS.md)
constructs each quantum-degree component of the Grassmannian trace-four
source by exact Fourier interpolation. Its ordinary tensor rank is at
most O(k) binom(s,k). An explicit middle component has full one-party
flattenings, proved by private columns from cyclic exterior shifts.
The middle support does not satisfy the classical low-degree condition.
This supplies a controlled source, not a map to matrix multiplication.

[EQUIVARIANT_FLAG_CHANNELS.md](EQUIVARIANT_FLAG_CHANNELS.md) allows
successive large equivariant A/B channels on independent target factors,
followed by an arbitrary C map. Its signed-permutation stabilizer is
explicit. The orbit-cover proof gives actual recovery on tensor powers,
so [RECOVERABLE_OUTPUT_CAPACITY.md](RECOVERABLE_OUTPUT_CAPACITY.md)
extends the classical source deficits to these recoverable outputs.
The retained product of the three channel fractions still has a fixed
exponent loss for the quadratic and balanced classical sources. The
quantum middle components are outside that obstruction.

[FINITE_OPERATOR_WEIGHT_OBSTRUCTION.md](FINITE_OPERATOR_WEIGHT_OBSTRUCTION.md)
proves that an exact Weyl identity with finite outside weight supports
scalarizes, even with arbitrary middle division-ring operators. The
resulting AB-versus-CD rank bound excludes subpolynomial support counts
at the proposed source budget. It also excludes the specified bounded
bosonic Pieri words, including uniform fixed flag rotations. Its finite
flag version has a border extension with fixed supports; the abstract
Laurent-series argument does not silently commute with another limit.

The difference construction now has an exact
[subset inverse-row identity](DIFFERENCE_PROJECTOR_IDENTITY.md),
with the required k-times spectral shift and a shifted-projector
product. [IRF_SHARED_INVERSE_FAILURE.md](IRF_SHARED_INVERSE_FAILURE.md)
prints one complete legal completion and its nonzero rational residual.
Thus the ordinary matrix inverse sums cannot be substituted for the
single shared source label. The
[collision channel](DIFFERENCE_COLLISION_CHANNEL.md) has a proved large
rank and an explicit coordinate restriction to a nearly full target.
Directly copying its two passive subset labels costs too much; the
existing noncommuting flags are outside that restricted cost bound.

[SHIFTED_PATH_RESIDUE.md](SHIFTED_PATH_RESIDUE.md) gives a distinct
positive rank calculation. Conditional prefix heights make all k inverse
gauge poles survive exterior projection, with rank binom(s-1,k-1).
The proof uses an exact Lagrange-polynomial basis at every next height.
This is not standard RTT fusion, and its q-dependent residue is not a
scalar C map. The complete natural block braid is now calculated: the
opposite gauge cancels every negative pole, so that proposed extraction
does not give a trade. Other semidynamical completions still require a
complete six-index local source identity.

[TIGHT_PATH_CONTEXT_FAILURE.md](TIGHT_PATH_CONTEXT_FAILURE.md) records
an actual normalized quantum point where tight path contraction becomes
strict after a coherent record is added. The lost factor is exactly the
CD wire value, so the required correctly charged geodesic inequality is
neither proved nor contradicted. Its one-copy star obstruction is
explicitly a reformulation of the existing centroid argument.

The [columnwise weight bound](COLUMNWISE_OPERATOR_WEIGHT_BOUND.md)
sharpens scalarization for a tagged unit: supports are counted separately
at each shared source label. A single-shift path contributes only one
rank-one AB factor, even when different paths have different shifts.
Full Lax columns with many internal shifts are outside that special case.

The [completed Latin-square test](PARITY_LATIN_TEST.md) has exact value
q^(a+b+c) at a genuine geodesic tripod. Its cyclic Fourier contraction
gives the existing direction a+b+c at least one; it supplies no reverse
inequality. [STABILIZER_TRANSFER_OBSTRUCTION.md](STABILIZER_TRANSFER_OBSTRUCTION.md)
proves rN/M at least sqrt(q) for the specified global Clifford/code
projections at A, B and C, allowing any D map. The Pauli transfer count
does not apply to arbitrary complex filters or sums of independently
controlled Clifford branches.

## Fixed central source, relative gauges and complete operator tests

[CENTRAL_QUANTUM_SOURCE.md](CENTRAL_QUANTUM_SOURCE.md) gives a fixed
four-party tensor on a central Schur slice. For even k, its local
dimension t is within a polynomial factor of p=binom(2k,k), its ordinary
rank is at most p, and a fixed two-leg contraction is a signed
permutation matrix. The leading quantum coefficient is independent of
all characteristic-polynomial parameters. Cyclic root-subset orbits
give a smaller exact rank budget. The first nontrivial case has local
dimension eight and both ordinary and border rank ten, certified by
a flattening minor of determinant one. The proof uses a finite
root-subset sum and formal coefficient extraction; it does not assume
an operator identity or move a parameter-dependent basis into the C
party. This supplies a source at the required asymptotic scale.

[RELATIVE_OUTPUT_GAUGE.md](RELATIVE_OUTPUT_GAUGE.md) proves that the
output ratio g(v,q)g(u,q)^{-1} is a fixed Pascal matrix plus a rank-one
term with fixed image. Its kth exterior power lies in an (s+1)-dimensional
fixed matrix span, and each column lies in a fixed span of at most k+1
vectors. Bounded products admit a controlled family expansion. The
scalar coefficients can be absorbed into the outside A map without
changing operator order; h-dependent fibers are allowed, while an
uncontrolled c-dependent flag shift is not. The opposite gauge ratio
does not satisfy the asserted fixed-image statement.

[FINITE_PROPAGATION_KERNEL_TRANSFER.md](FINITE_PROPAGATION_KERNEL_TRANSFER.md)
realizes a complete entrywise identity with finite-propagation outside
maps and arbitrary middle kernels on finite flags with N/M tending to
one. It also states the exact finite-consistency criterion. This does
not construct the missing kernel. For one specified two-family
difference-Lax candidate,
[DIFFERENCE_KERNEL_CERTIFICATES.md](DIFFERENCE_KERNEL_CERTIFICATES.md)
proves that every target C column vanishes on the stated finite window,
both for the original and the explicitly rotated second family. The
unrotated rational source rank is 320 and each target-column augmentation
has rank at least 324; the rotated ranks are 328 and at least 332.

[DIFFERENCE_RTT_AND_FUSION.md](DIFFERENCE_RTT_AND_FUSION.md) proves the
full-shift RTT identity with parameter minus eta and the complete
arithmetic exterior fusion. The latter equals the ordinary exterior
Lax operator, including its scalar factor. The
[Cartan defect](SEMIDYNAMICAL_CARTAN_DEFECT.md) and
[height commutator](DIFFERENCE_HEIGHT_COMMUTATOR.md) retain their exact
operator order and common source index. None supplies the two independent
copied output labels required by the tensor trade.

[CONTROLLED_STABILIZER_SPAN.md](CONTROLLED_STABILIZER_SPAN.md) proves a
span bound using the stabilizer projector gap. Its growing-prime result
does not imply a power lower bound for arbitrary qubit systems.
[CLIFFORD_BRANCH_OVERLAP.md](CLIFFORD_BRANCH_OVERLAP.md) gives the sharp
full-rank branch overlaps. In particular, the tagged overlap can be
q^{-1/2}, correcting a proposed q^{-1} bound. The
[legal first-zero maps](FIRST_ZERO_TAGGED_MAP.md) have a quantified flag
loss, and the [parity-core calculation](FIRST_ZERO_PARITY_CORE.md) shows
that a simple interference residual is a local copy of the target.

[EQUAL_FLAGS_SINGULAR_C.md](EQUAL_FLAGS_SINGULAR_C.md) bounds the retained
C rank by q^{3/2} for one exact equal-flags branch with arbitrary singular
C map and a concise A/B target; an explicit construction is sharp.
[ROW_COLUMN_C_COMPRESSION_CAPACITY.md](ROW_COLUMN_C_COMPRESSION_CAPACITY.md)
extends a separate row/column-support obstruction to arbitrary C
compression and proves its stated Laurent extension. These bounds retain
their map-class hypotheses; they are not lower bounds on omega.

[MULTI_SHEAR_RIGIDITY_FAILURE.md](MULTI_SHEAR_RIGIDITY_FAILURE.md)
prints a complete square-zero differential-shear source equation,
including the off-target residual and an elementary finite-flag
realization with N/M tending to one. Its dense C planes are unrestricted.
The [subspace sampling theorem](MOTION_SUBSPACE_SAMPLING_CAPACITY.md)
nevertheless bounds the retained C rank by r q^{3/2}, even when each
target column chooses its own motion. The proof samples endpoint spaces
and uses a finite-vector rank argument; it does not count distinct
intersection lines. Ordered products with surviving nonlinear terms
remain outside this particular obstruction.

## Coupled-source capacity, finite channels and weighted targets

[COUPLED_FIRST_ORDER_SELECTOR.md](COUPLED_FIRST_ORDER_SELECTOR.md)
gives the complete first-order Laurent map for an arbitrary coupled
four-party source, including the actual source C/D indices and the
positive-order term that need not vanish. Its finite polynomial flags
have source/target dimension ratio tending to one. The
[capacity theorem](COUPLED_FIRST_ORDER_CAPACITY.md) nevertheless bounds
the retained C rank by

```math
\mathop{\mathrm{rank}}L
 \le 2\sqrt{w\left(\sum_zR_z\right)
                 \left(\sum_{b\in Q}\dim K_b\right)}.
```

Here R_z is the border rank of each base source and w is the CD-wire
size. The theorem permits deficient coefficient spans, arbitrary dense
C maps and a different admissible middle choice for every target
column. Its universal D output is one actual local image of the source;
an AC|BD flattening then bounds all outgoing C-image dimensions before
the weighted sampling lemma is applied. The proposed parameters give
q^{3/2+o(1)}, which is insufficient for q^{2-o(1)}. Higher coefficients
and noncentral retained flag targets are outside this theorem.

[CENTRAL_QUANTUM_SMALL_BLOCKS.md](CENTRAL_QUANTUM_SMALL_BLOCKS.md)
splits the eight-dimensional central source into explicit blocks of
dimensions five and three and ranks six and four. It lists the exact
cyclotomic basis changes and quartic circuit coefficients. Its complete
coupled operator equation retains the dense term as products of sums
of the same local maps; that term does not provide an independently
controlled extra unit label.

[ORDERED_COHERENT_PROJECTOR.md](ORDERED_COHERENT_PROJECTOR.md) proves
a rational Weyl projector identity and a polynomial rank-transfer
estimate. [COHERENT_MULTIPLICATION_CHANNEL.md](COHERENT_MULTIPLICATION_CHANNEL.md)
gives its direct finite counterpart: a multiplication pseudoinverse,
exact boundary maps, equivariance and retained A-rank fraction tending
to m/p. The complete coefficient includes the copied-C residual. The
[common-image bound](COHERENT_COMMON_IMAGE_OBSTRUCTION.md) and its
[independent-Y extension](INDEPENDENT_Y_CAPACITY.md) prove retained
C rank at most r w in their stated linear-Y classes. The latter allows
different X-only A images and noncommuting X-only flavour operators.

[MIXED_Y_DOUBLE_CHANNEL_CAPACITY.md](MIXED_Y_DOUBLE_CHANNEL_CAPACITY.md)
constructs the exact finite complementary Y channel and retains the
full ordered double-channel residual. Constants and degree-one harmonic
Y vectors prove the same r w C-rank bound for a common Y frame, even
with arbitrary distinct X-side A maps. Finite polynomial inverses are
defined directly; their ranks are not inferred from a representation
of the entire Weyl division ring. The one-dimensional example records
why that distinction matters.

[DEPTH_TWO_SHEAR_COEFFICIENTS.md](DEPTH_TWO_SHEAR_COEFFICIENTS.md)
retains every degree-two shear coefficient. In that particular
symmetric ordering, eliminating the X-Euler residual also eliminates
the desired scalar. The proposed right inverse has the wrong auxiliary
orientation: the actual B factor has division rank at most the internal
flavour dimension. These are scope-limited failures of the displayed
words, not exponent lower bounds.

[TORUS_FILTERED_WEIGHTED_TARGET.md](TORUS_FILTERED_WEIGHTED_TARGET.md)
supplies a weaker sufficient target. An already correctly C/D-labelled
additive exterior Casimir commutator can be filtered by s local phases
to diagonal weighted support of density at least
(1-1/p)L/(L+s-1). The weights need not be equal. The reviewed weighted
support theorem recovers the full target with this density loss; in the
sparse exterior regime the phase cost is subpolynomial. Wrong copied
labels and multi-exchange zero-charge terms are explicitly retained as
obligations. No legal source construction of that Casimir target is
established.

[GRAM_FRAME_COPIED_TAG_OBSTRUCTION.md](GRAM_FRAME_COPIED_TAG_OBSTRUCTION.md)
tests one actual two-family Gram completion. Quotienting by the common
C-plane intersection and taking differential order proves rank L at
most Q+2H even for rational Weyl middles. The same frame fails the
copied additive Casimir target when its principal commutator rank
2 binom(s-1,k) binom(s-1,k-1) exceeds Q+2H. The unlabelled Gram identity
remains true; it is not a copied-label source conversion.

[CAPELLI_ROW_FLAGS_NORMAL_FORM.md](CAPELLI_ROW_FLAGS_NORMAL_FORM.md)
gives a complete positive shared-flavour source map with both source
flag domains counted. After local row alignment its output is exactly
W_AD(p) W_BD(p) U_ABC(q^2) W_AB(R), with N=p r^k R. Its sparse-exterior
consequence is the already available inequality d_AB+d_CD>=1. The
flavour labels at C have not become the physical-row labels at D.
This exact normal form preserves the successful conversion and the
reason it does not prove the required reverse geodesic inequality.

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
python3 check_convolution_block_trade.py
python3 check_trace_cubic_nonsmoothable.py
python3 check_hyperplane_cocycle.py
python3 check_mixed_valuation_padding.py
python3 check_exterior_incidence_source.py
python3 check_weyl_transfer_example.py
python3 check_grassmannian_frobenius_source.py
python3 check_quantum_component_witnesses.py
python3 irf_vertex_exact_candidate.py
python3 check_irf_shared_inverse.py
python3 check_difference_projector_and_collision.py
python3 check_shifted_path_residue.py
python3 check_difference_kernel_system.py --certify
python3 check_difference_kernel_system.py --rotate-family --certify
python3 check_difference_rtt_fusion.py
python3 check_clifford_branch_overlaps.py
python3 check_relative_output_gauge.py
python3 check_central_quantum_source.py
python3 check_central_quantum_orbits.py
python3 check_central_quantum_blocks.py
python3 check_torus_weighted_target.py
python3 check_gram_frame_copied_tags.py
python3 check_capelli_row_flags.py
```

The propagation-local, ordinary-partial-block, general-free-separator, mixed-padding, and Grassmannian Frobenius scripts use SymPy. The trace-cubic and hyperplane-cocycle checks use NumPy integer arrays with explicit overflow bounds. The exterior-incidence checker uses both NumPy integer arrays and exact SymPy rational ranks, with an explicit arithmetic bound. The Weyl transfer replay and the other scripts use Python's standard library. The trace-cubic calculation is an essential finite certificate in its stated computer-assisted proof. The other scripts check the finite coefficients, flattenings, minors, and local counterexamples described in the proofs. None checks a complete matrix multiplication circuit or the unbounded dyadic induction. No new Lean proof or kernel verification is claimed.

The review scope and reproducible check inventory are recorded in [REVIEW_AND_VERIFICATION.md](REVIEW_AND_VERIFICATION.md).

The quantum-component witness replay uses only the Python standard
library. The difference-projector, collision, shared-inverse residual
and conditional-height path checks use exact SymPy arithmetic. These
checks concern the printed finite identities and counterexamples; they
do not verify the missing source-to-target equation.

The finite kernel certificates use exact rational coefficients, modular
elimination with explicit int64 bounds, and a proved characteristic-zero
rank upper bound. The rotated variant also uses SymPy. The RTT, relative
gauge and central quantum checks use exact SymPy arithmetic. The Pauli
overlap replay uses binary integer arithmetic from the standard library.

The additional block checker uses exact arithmetic in Q(zeta_8). The
Gram replay uses symbolic polynomial identities, exact integer upper
rank certificates and modular lower rank certificates. The torus and
Capelli replays use finite integer combinatorics. None tests an
unprovided source conversion to the copied Casimir target.
