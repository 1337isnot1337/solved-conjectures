# Target 07: the complex matrix multiplication exponent

Research status, 23 November 2026 (America/Chicago): **unresolved in this project**. No proof of $\omega_{\mathbb C}=2$ and no legitimate spectral point with perimeter greater than two has been obtained. The notes below contain proved reductions, independently checked obstructions, and an audit of a public exponent-two claim. They do not turn the conjecture into a solved result.

Coordination uses [issue #250](https://github.com/1337isnot1337/solved-conjectures/issues/250). The first reviewed checkpoint is [PR #258](https://github.com/1337isnot1337/solved-conjectures/pull/258), merged into `main`. The earlier scalar-model construction is credited to the concurrent work in [PR #254](https://github.com/1337isnot1337/solved-conjectures/pull/254); this work does not replace that PR's README or branch.

## Exact target and significance

Let $L(n)$ be the minimum number of scalar arithmetic operations in a division-free straight-line program over $\mathbb C$ that multiplies two arbitrary $n\times n$ matrices. Constants may depend on $n$ but not on the inputs. Define

```math
\omega_{\mathbb C}=\inf\{\tau:\ \exists C>0\ \forall n\ge2,
\ L(n)\le Cn^\tau\}.
```

The target is $\omega_{\mathbb C}=2$, equivalently: for every $\varepsilon>0$, there is an algorithm family with cost $O_\varepsilon(n^{2+\varepsilon})$. This does not assert a quadratic-time algorithm with a fixed constant. It is the full matrix multiplication exponent problem, rather than a bounded-size rank calculation or a result about one family of spectral points. Its resolution would determine the asymptotic arithmetic complexity of dense matrix multiplication in this model.

The audited prior-result question is not settled by the title of an announcement. Sun's fixed-version paper claims the full result; the audit below finds failures in two printed local identities, supplies local corrections, and leaves its global construction and repeated propagation unverified. The final limiting implication in that paper is valid if its uniform border-rank construction is established. The imported AVZ theorem supplies the rigorous bound used in the present research framework,

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
| Copying a tensor's input index to another party has exact rank equal to the sum of its matrix-slice ranks. | [Copied-input obstruction](COPIED_INPUT_OBSTRUCTION.md), matching flattening and decomposition. | Polynomial multiplication costs $ab$ after copying; matrix multiplication costs at least $n^3$ in every input basis. This is about the changed tensor. |
| Simultaneous separation works for any fixed number of shared parties. | [Multiple-party separator](MULTIPLE_PARTY_SEPARATOR.md), an explicit sum-of-squares degeneration and type argument. | Independently reconstructed prior work of Zhou, not an original escape from Zhou's higher-order barrier. |
| The scalar unit charge $g(P)=2\max_\mu\sum_{i,j}\mu_i\mu_jd_{ij}$ satisfies every graph minimum-cut inequality for Euclidean positions. | [Minimum-cut compatibility](MINCUT_COMPATIBILITY.md), Gaussian projection and threshold integration. | All finite auxiliary configurations, all terminal subsets, and all nonnegative edge weights. |
| The equilateral normalized witness also satisfies hypergraph minimum-cut tests with terminals containing the original triangle. | Same file, explicit cap functions. | It remains a scalar assignment, with no values supplied on arbitrary tensors. |
| Every terminal metric that embeds in a finite tree satisfies the same hypergraph minimum-cut inequality, even with arbitrary metric auxiliaries. | [Tree-terminal proof](TREE_TERMINAL_MINCUT.md), nonexpansive extension, a weighted tree-cut measure, and endpoint randomization. | This includes every terminal triple and every equilateral terminal set. Arbitrary non-tree terminal configurations remain outside the theorem. |
| A required Weyl phase cannot be inserted freely into a collapsed group tensor. | [Sun phase audit](SUN_PHASE_AUDIT.md), a one-bit obstruction and the minimal-border-rank slice commutativity condition. | It does not exclude a construction from a richer source tensor. |
| Two printed local maps in Sun v1 fail exact substitution, and specific local corrections repair those local identities. | [Crossed-map audit](SUN_CROSSED_MAP_AUDIT.md) and exact scripts. | Neither the full claimed theorem nor its negation follows from the local checks. |

No novelty claim is made for elementary deductions or independently reconstructed published results. The named imported theorems remain dependencies. The repository's standing acceptance of Anthropic's result is followed; its circuit lower-bound proof was not re-audited.

## The operational barrier and the attempted escape

AVZ Definition 5.3 and Theorem 5.4 concern a specified formal system of degeneration ingredients and combination rules. Its symmetric operational certificate assigns exponent $3/4$ to each wire. It forbids a better square-matrix bound inside that system; it does not supply a spectral point on all tensors and does not prove a lower bound $\omega_{\mathbb C}\ge9/4$.

Adding parties while preserving full normalization is a valid deduction outside that fixed three-party formal language. The normalization proof here makes that step concrete. Applying multi-party polynomial recurrences alone still falls under Zhou's higher-order analysis. The proposed elimination of the auxiliary parties has not produced a new universal perimeter inequality.

The equilateral Euclidean triangle of side $3/4$ has scalar unit charge one and perimeter $9/4$. Placing auxiliaries in its convex hull preserves the full scalar unit charge. The construction passes the midpoint, joint-retraction, crossing, copositivity, and minimum-cut constraints recorded in these notes. This proves insufficiency of those tested constraints. It does not prove that this scalar model extends to a genuine spectral point.

Ordinary Euclidean realizability has no normalization content. Every nonzero metric triangle is a positive multiple of a singleton quantum wire triple. Multiplying its distances also multiplies its logarithmic full-unit charge. For example, the equilateral $3/4$ triple is $9/8$ times the uniform quantum $2/3$ triple; this rescaling alone does not retain unit charge one.

## Sun audit: exact unresolved step

[SUN_PROPAGATION_AUDIT.md](SUN_PROPAGATION_AUDIT.md) separates valid local calculations from the missing implication. The Walsh minors, first-difference identity, and combinatorial lift counts check. Definition 10.1(iii) also requires the fresh-coordinate residual to lie in a specified five-dimensional subspace after ordinary rows are eliminated. The checked first-jet identity does not establish that residual condition for the bases or prove that it persists after another propagation step.

The phase audit likewise distinguishes a correct desired output and correct scalar identities from three local maps that produce that output from the declared source. The richer map entries and their compatibility are the remaining certificate to verify. This work does not import the exponent-two conclusion while that dependency remains unresolved.

## Remaining mathematical obligation

To prove the target by this route, establish a full-tensor inequality on one compatible normalized extension that forces

```math
d_{AB}+d_{BC}+d_{CA}\le2
\qquad\text{for every }F\in\Delta_3,
```

or supply an equivalent asymptotic degeneration. To disprove the target, construct a function on all tensors satisfying every spectral axiom and having perimeter greater than two. A scalar metric satisfying necessary inequalities is insufficient. Verifying and repairing Sun's full source-to-target map and the residual induction would be another route; any resulting prior theorem would be credited to its author.

These obligations remain unresolved. All partial results are retained under `research/`; there is no solved-results entry for this target.

## Reproducible verification

From this directory, run:

```bash
python3 check_auxiliary_certificates.py
python3 check_sun_phase_and_mask.py
python3 check_sun_crossed_map.py
python3 check_sun_propagation_local.py
```

The first three scripts use Python's standard library. The propagation-local script also uses SymPy. They check the finite coefficients, flattenings, minors, and local counterexamples described in the proofs. None checks a complete matrix multiplication circuit or the unbounded dyadic induction. No new Lean proof or kernel verification is claimed.
