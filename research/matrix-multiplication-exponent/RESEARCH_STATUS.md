# Target 07: the complex matrix multiplication exponent

Research status, 23 November 2026 (America/Chicago): **unresolved in this project**. No proof of $\omega_{\mathbb C}=2$ and no legitimate spectral point with perimeter greater than two has been obtained. The notes below contain proved reductions, independently checked obstructions, and an audit of a public exponent-two claim. They do not turn the conjecture into a solved result.

Coordination uses [issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250). The first reviewed checkpoint is [PR #258](https://github.com/1337isnot1337/solved-conjectures/pull/258), merged into `main`. The source audit and further tensor obstructions are tracked in [PR #262](https://github.com/1337isnot1337/solved-conjectures/pull/262). The earlier scalar-model construction is credited to the concurrent work in [PR #254](https://github.com/1337isnot1337/solved-conjectures/pull/254); this work does not replace that PR's README or branch.

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
| A normalized tripod scalar model retains perimeter $9/4$ even after intersecting submodularity, coherent retraction extension, full crossing, curvature, and all hypergraph terminal-mincut inequalities are imposed. | [Tripod countermodel](TRIPOD_COUNTERMODEL.md), explicit charge formula, mixed-derivative proof, and barycenter calculation. | This disproves sufficiency of the listed scalar requirements, including the proposed uncrossing axiom. It is not a tensor spectral point. |
| Copying a tensor's input index to another party has exact rank equal to the sum of its matrix-slice ranks. | [Copied-input obstruction](COPIED_INPUT_OBSTRUCTION.md), matching flattening and decomposition. | Polynomial multiplication costs $ab$ after copying; matrix multiplication costs at least $n^3$ in every input basis. This is about the changed tensor. |
| Simultaneous separation works for any fixed number of shared parties. | [Multiple-party separator](MULTIPLE_PARTY_SEPARATOR.md), an explicit sum-of-squares degeneration and type argument. | Independently reconstructed prior work of Zhou, not an original escape from Zhou's higher-order barrier. |
| The scalar unit charge $g(P)=2\max_\mu\sum_{i,j}\mu_i\mu_jd_{ij}$ satisfies every graph minimum-cut inequality for Euclidean positions. | [Minimum-cut compatibility](MINCUT_COMPATIBILITY.md), Gaussian projection and threshold integration. | All finite auxiliary configurations, all terminal subsets, and all nonnegative edge weights. |
| The equilateral normalized witness also satisfies hypergraph minimum-cut tests with terminals containing the original triangle. | Same file, explicit cap functions. | It remains a scalar assignment, with no values supplied on arbitrary tensors. |
| Every terminal metric that embeds in a finite tree satisfies the same hypergraph minimum-cut inequality, even with arbitrary metric auxiliaries. | [Tree-terminal proof](TREE_TERMINAL_MINCUT.md), nonexpansive extension, a weighted tree-cut measure, and endpoint randomization. | This includes every terminal triple and every equilateral terminal set. A separate cap certificate also covers square terminals; its failure for thin rectangles is proved. The arbitrary Euclidean terminal case remains unresolved here. |
| The overlapping-unit uncrossing conversion fails for every $q\ge2$ and every common full-unit catalyst. | [Overlapping units](OVERLAPPING_UNITS.md), a determinant-grid valuation argument, with independent binary polynomial certificates. | Source-only overhead is different. A rank-$\sqrt q$ unit suffices when $q$ is a square and is necessary if only the two outer maps are monomial; unrestricted subexponential overhead remains unresolved. |
| A required Weyl phase cannot be inserted freely into a collapsed group tensor. | [Sun phase audit](SUN_PHASE_AUDIT.md), a one-bit obstruction and the minimal-border-rank slice commutativity condition. | It does not exclude a construction from a richer source tensor. |
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

[SUN_PROPAGATION_AUDIT.md](SUN_PROPAGATION_AUDIT.md) separates valid local calculations from the missing implication. The Walsh minors, first-difference identity, combinatorial lift counts, exact ordinary-to-active leakage operator, and a fixed source-side implementation of the face action check. Definition 10.1(iii) also requires the fresh-coordinate residual to lie in a specified five-dimensional subspace after ordinary rows are eliminated. The checked first-jet identity does not establish that residual condition for the bases or prove that it persists after another propagation step.

The phase audit likewise distinguishes a correct desired output and correct scalar identities from three local maps that produce that output from the declared source. The richer map entries and their compatibility are the remaining certificate to verify. This work does not import the exponent-two conclusion while that dependency remains unresolved.

## A full-tensor overlapping-party test

For four parties, a tempting new inequality is intersecting submodularity of partial-unit charges:

```math
u(S)+u(T)\ge u(S\cup T)+u(S\cap T).
```

It passes every flattening point and excludes a small square inside the Euclidean scalar model. A different [tripod scalar model](TRIPOD_COUNTERMODEL.md), however, satisfies this inequality along with normalization, coherent extensions, crossing, curvature, and all hypergraph mincut tests, while retaining perimeter $9/4$. Thus even adding this inequality does not make that enlarged scalar system sufficient. Its most direct finite tensor proof is also impossible. With

```math
X_q=U_{ABC}(q)\otimes U_{ABD}(q),\qquad
Y_q=U_{ABCD}(q)\otimes U_{AB}(q),
```

the determinant-pencil theorem in [OVERLAPPING_UNITS.md](OVERLAPPING_UNITS.md) proves that $Y_q$ is not a degeneration of $X_q$ for any $q\ge2$, even with any common full-unit catalyst. It therefore excludes every equal-power version as well. A separate degree-four covariant proof and an exact degree-eight invariant check confirm the binary case.

The argument does not exclude source-only unit overhead. A sharp calculation in the restricted class with monomial maps on the two outer parties requires overhead at least $\sqrt q$, and an explicit restriction attains it for square $q$. Every three-party regrouping admits the desired conversion. Thus any unrestricted asymptotic obstruction must use four-party information and survive arbitrary mixing on those outer parties. The full spectral inequality remains unresolved; the tripod countermodel shows that it would not alone supply the missing perimeter bound from the listed scalar constraints.

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
```

All scripts except the propagation-local script use Python's standard library; that script also uses SymPy. They check the finite coefficients, flattenings, minors, and local counterexamples described in the proofs. None checks a complete matrix multiplication circuit or the unbounded dyadic induction. No new Lean proof or kernel verification is claimed.

The review scope and reproducible check inventory are recorded in [REVIEW_AND_VERIFICATION.md](REVIEW_AND_VERIFICATION.md).
