# Lean verification status

The shared package is in [`lean`](../lean/).
It uses Lean **4.35.0** and Mathlib commit
`56a005855ea17e0b0958f73ec801ae140b0a1679`, as pinned in the existing manifest.
The source notes audited for this extension are from repository commit
`b117a3c03f0a6e3812c57d73084d123e3cf3eed3`.

A complete formalization here means that Lean checks the mathematical conclusion
from the definitions in the indicated files. The correspondence between those
definitions and an external publication remains subject to mathematical review.
Published mathematical theorems that have not been formalized are hypotheses,
never additional Lean axioms.

| Note | Status | Checked scope and remaining gap |
| --- | --- | --- |
| L-solitaire | Complete for the fixed-scale counterexample; pre-existing proof replayed | Actual layer-picking dynamics, stable-reference maximality, pointwise limits, and separation at scale 1. The separate arbitrary-layer/diverging-scale theorem is still unformalized. |
| Three-player War | Complete for all three explicit cycling deals | Distinct ranks and round-robin deal sizes; exact transition rules; returns after 90, 180, and 19,320 turns; no earlier positive return; all three players active at every nonnegative time. |
| Pham denominator degree | Partial | General finite-coefficient identity principle for rational formal power series; both exact polynomial certificates; both coprimality certificates. The orbit-count truncations and the published representation/degree bounds are explicit hypotheses. Reverse-solitaire enumeration and its limiting interpretation are not formalized. |
| Batista Egyptian fractions | Complete | An ordered lexicographically first solution uniquely maximizes the last denominator for every admissible positive `k` outside residue class 1. The proof uses the elementary global comparison and a kernel-reduced exhaustive certificate below 100, with proved denominator bounds; no published comparison theorem is a hypothesis. |
| CUT Family B | Partial, including both directions of the new threshold argument | All-size large-cut XOR inequality; mex uniqueness from the actual splitting rules; preservation under all added cuts above `3x`; explicit collision for each smaller admissible odd cut; difference by size `4x`; sharp threshold conditional on the published base formula. Identification of that formula with the base game's mex function is an explicit hypothesis. |
| CUT arithmetic periodicity | General decision theorem complete; concrete examples partial | A computable finite test constructs exact recognizers for every finite cut set and proposed arithmetic tail, and is equivalent to the actual mex equations. Exhaustive candidate enumeration is sound and complete whenever a representation exists. The specialized three-through-nine-pile and option-union certificates for the two displayed games remain open. |
| Li coefficient sign | Not formalized | Tree/partition certificates, chromatic symmetric functions, and the coefficient extraction remain to formalize. |
| Erdős 607 line sizes | Not formalized | Geometric realization, generating-function correspondence, and the local limit/asymptotic analysis remain to formalize. |
| Growing rectangles | Not formalized | Packing injection, partition estimates, and uniform asymptotics remain to formalize. |
| Distance graphs with three missing differences | Not formalized | Strict prefix reduction, strip shortening, the strip classifications, and finite exclusions remain to formalize. |
| Two-difference Motzkin density | Not formalized | Signed square-grid construction, compact-group measure arguments, and character approximation remain to formalize. |
| Symmetric four-point density | Complete | Exact real packing and covering densities for every literal translated symmetric four-point integer set, including common-divisor normalization. Both periodic constructions and the two sharp local interval lengths are proved. |
| Packing with two nonmixed gaps | Complete | The exact three-case packing and real circle formula for every positive gap pair and arbitrary positive gap counts, including gcd normalization, literal tile semantics, periodic attainment, and the stated example. |
| Haralambis three-difference theorem | Not formalized | Balanced orientations, integral cocycle extension, the simultaneous pair inequalities, and density/attainment remain to formalize. |
| Five-speed spectrum | Partial | Exact real-time maxima for all twelve listed examples; every value s/(5s+1) is realized by the positive primitive distinct family [1,2,3,4,5s]; both critical-family reductions and gcd normalization are proved without Cordella hypotheses. The norm bound, modular lifting, and exhaustive classification outside these families remain open. |
| Tight six-speed sets and seven-coordinate critical subtori | Not formalized | The infinite equality classification and critical-plane reduction remain to formalize. |
| Six-speed spectrum | Not formalized | Infinite family reductions, the norm bound, modular lifting, and exhaustive classification remain to formalize. |
| Tight seven-speed sets | Not formalized | The infinite equality classification remains to formalize. |
| Tight eight-speed sets | Not formalized | The infinite equality classification remains to formalize. |
| Tight nine-speed sets | Not formalized | The infinite equality classification remains to formalize. |


## War

[`Conjectures/War.lean`](../lean/Conjectures/War.lean)
defines three ordered queues of natural-number ranks. `step` removes the exposed
cards, compares them, and appends the trick to the winner's queue in decreasing
rank, seat, or clockwise order. An empty queue is absorbing; the checked safety
certificates prove that this case never occurs along any of the three trajectories.

`standard` checks that every rank from 1 through the deck size occurs once and
that the queue lengths are the sizes of a round-robin deal starting at A.
`standard_deal_witnesses` supplies three explicit distinct-rank decks and proves
that actually dealing their cards in A/B/C rotation gives the initial queues.
No particular shuffle or random-deal probability is claimed.

Main theorems:

- `War.standard_deal_witnesses`: explicit standard decks and their round-robin deals.
- `War.three_standard_cycles`: standard deals, returns, and activity for every time.
- `War.rank_first_return`: first return at 90.
- `War.seat_first_return`: first return at 180.
- `War.clockwise_first_return`: first return at 19,320.

The certificates use `decide`, with reduction checked by Lean's kernel.
They use neither `native_decide` nor an external Python replay as a premise.

## Exact denominator certificates

[`Conjectures/Denominator.lean`](../lean/Conjectures/Denominator.lean)
proves `finite_coefficient_identity` using divisibility by a power of `X`, a
polynomial degree bound, and cancellation of the unit denominator series.
`primary_certificate` and `dual_certificate` prove exact polynomial equations
`Q*T - R = X^N * W` for the displayed truncations, with `N = 26` and `31`.
The two `*_coprime` theorems provide explicit Bézout identities over `ℚ[X]`.

`primary_identity_of_representation` and `dual_identity_of_representation`
conclude `Q*H = R` for a formal series `H` **only given** its stated truncation
and a representation `B*H=A` with nonzero constant denominator coefficient and
the published degree bounds. These hypotheses are the outstanding mathematical
work, not facts inferred from running the Python verifier.

## Complete Egyptian-fraction theorem

[`Conjectures/EgyptianTheorem.lean`](../lean/Conjectures/EgyptianTheorem.lean)
proves `Egyptian.batista_admissible_congruence`, the exact statement of the note:
for every positive admissible `k` with `k % 5 != 1`, there exists a strictly
ordered solution that is lexicographically first and uniquely maximizes the
last denominator. `batista_congruence` also proves existence for every `k >= 3`
in those classes, and admissibility is proved to force `k >= 3`.

The original [`Egyptian.lean`](../lean/Conjectures/Egyptian.lean)
proves integrality of the strict-greedy construction. The new
[`EgyptianBounds.lean`](../lean/Conjectures/EgyptianBounds.lean)
proves the all-size competitor bounds, including the modular improvement in
the immediate-neighbor case. A concave quadratic proves positivity throughout
the unbounded interval; explicit endpoint polynomials have positive
coefficients after shifting the first denominator by 20.

[`EgyptianFinite.lean`](../lean/Conjectures/EgyptianFinite.lean)
checks every small `k < 100` by kernel reduction. Its soundness theorem derives
complete bounds on both enumerated denominators from the fraction equation,
then derives the third denominator exactly by integer division. The certificate
checks ordered existence and unique maximality; it is not used as evidence for
an unbounded claim. The infinite regime and the finite regime are combined in
`EgyptianTheorem.lean`, which also proves the lexicographic conclusion.

Chu's best-two-term theorem is not a hypothesis of either completed theorem.

## CUT Family B

[`Conjectures/CutFamily.lean`](../lean/Conjectures/CutFamily.lean)
contains the six-block formula and proves `large_cut_decreases` for every finite
list of positive pile sizes with at least `3x+2` parts, without any upper bound
on the sizes or number of parts. The quotient and residue XOR estimates are
proved, not checked on a finite range.

`OptionValue` implements legal splits, including their positive sizes, total,
arity, allowed cut, and XOR. `grundy_unique` proves uniqueness from the mex
conditions by induction on pile size. `sharp_collision` constructs the
smaller-odd-cut witness, and `small_odd_cut_forces_difference` proves the
size-`4x` distinction for any game containing that cut.

`family_b_threshold_of_base_formula` proves both directions of the sharp
threshold. Its assumption `hbase : SatisfiesMex base (value x)` is exactly the
remaining imported base-game result. For Family B, this assumption combines
the published explicit formula and the theorem about adding larger even cuts.
The Lean theorem does not silently treat either publication as an axiom.

## Reproduce

Install the pinned toolchain with elan, then from the repository root:

```sh
export PATH="$HOME/.elan/bin:$PATH"
cd lean
lake exe cache get
cd ../..
scripts/verify_lean.sh
```

The script rebuilds all sources, runs `ProofAudit.lean`, and rechecks the proof modules using `leanchecker`. The CI workflow runs the same script.
`ProofAudit.lean` checks every theorem in the imported accepted project modules, including
helper theorems, and rejects any transitive axiom other than `propext`,
`Classical.choice`, and `Quot.sound`. It also requires the listed main
declarations to exist. Missing proofs, `sorryAx`, native-computation axioms,
and custom axioms fail the check.

The original Python verifiers remain independent evidence, with their original
scope; their success does not upgrade a partial entry to a complete Lean proof.

## Validation receipt, 18 November 2026

`scripts/verify_lean.sh` completed with exit status 0 locally on Lean 4.35.0.
At the first checkpoint, all six `leanchecker` module rechecks completed successfully. The audit reported
466 project theorem declarations, including generated helper declarations;
this is not a count of independent mathematical results.

The audit was also challenged with three temporary negative controls. It
rejected a custom axiom transitively used by a War theorem, a proof containing
`sorry`, and a theorem proved with `native_decide`. These temporary controls
are not part of the repository's proof sources.

The GitHub Actions workflow has been updated to run the same checks; a hosted
CI run is separate from this local verification receipt.

The unchanged Python source checks also passed for all three War deals, the
primary and dual necklace certificates with direct enumeration through depth
12, Egyptian fractions through `k = 150` (including unpruned enumeration),
and all 46 CUT Family B test cut sets in the original verifier. These checks
corroborate transcription and retain their finite scope.

## Completed Batista checkpoint, 18 November 2026

The full `scripts/verify_lean.sh` passed with all nine proof-module kernel
rechecks, including `EgyptianBounds`, `EgyptianFinite`, and `EgyptianTheorem`.
The whitelist audit accepted 578 project theorem declarations. Both complete
Batista theorem declarations depend only on `propext`, `Classical.choice`, and
`Quot.sound`. The finite certificates use kernel reduction rather than native
computation. The source-level statement retains the exact admissibility,
congruence, lexicographic, maximality, and uniqueness requirements.

## CUT automata foundations

`BinaryAutomata.lean` proves subset-construction semantics and a refinement
certificate theorem that works for every input word. Its active-list variant
avoids scanning every NFA state during a finite certificate check.
`BinaryArithmetic.lean` proves that the carry constraints used by the original
high-bit-first automata are exactly integer addition, including both end
carries, and that columnwise XOR is exactly numerical XOR.

`CutPeriodGraph.lean` proves the arithmetic counter graph recognizes the
proposed pile-value function, including all six prefix exceptions and its
unbounded tail. `CutPeriodGraphCertificate.lean` checks every transition and
acceptance label of the 179-state representation and its 27-state quotient,
then proves the concrete DFA recognizes that graph for every finite word.

The Python producer `results/cut-arithmetic-periodicity/generate_lean_certificates.py`
is untrusted: it produces data that Lean checks. Its intermediate JSON archive
is reproducible and ignored; the checked Lean certificate is versioned. Other
produced automata do not count as proofs until their refinement and arithmetic
semantics are checked. The complete game-period claims remain open.

`BinaryComposition.lean` proves the exact language semantics of addition/XOR
composition in both directions, including safe pruning of rejecting sinks.
Every accepted composed word is decoded to accepted component words with the
actual numerical addition and XOR equations, and every such compatible column
sequence produces a composed path.

## Binary-semantics checkpoint, 18 November 2026

The full package including the four graph/arithmetic foundation modules passed
all kernel rechecks. The added generic composition module then passed its
source build, kernel replay, and a refreshed whitelist audit over 724 project
theorem declarations. The detailed continuation plan and measured certificate
performance limits are in `results/cut-arithmetic-periodicity/LEAN_PLAN.md`.

The [two distance-graph results](../results/distance-graph-densities/PROOF.md) have written proofs and executable finite verifiers. The [classification for every parameter](../results/distance-graph-densities/CLASSIFICATION.md) extends both families. Their Lean formalizations are pending.

The [two-difference Motzkin identity](../results/two-difference-motzkin/PROOF.md) has a written proof and finite checks. Its compact-group theorem awaits Lean formalization.

The [Liu–Zhu packing and Natalchenko–Sagdeev covering proof](../results/symmetric-four-point-density/PROOF.md) is a written argument with finite exact-cover checks. Lean formalization is pending.

The [two-nonmixed-gap packing theorem](../results/nonmixed-gap-packing/PROOF.md) has a written proof and finite checks. The packing density and character identity await Lean formalization.

## Complete padding and lower-value semantics

`BinaryEncoding.lean` supplies fixed-width encodings, uniqueness, shared
arithmetic columns and an encoding for every pair of naturals.
`CutPeriodPiles.lean` defines groups by actual lists of positive pile sizes;
it proves the candidate-value XOR fits within the total pile size. Using that
bound, `sum_recognizes_successor` proves both directions of the group-composition
semantics at every visible word width. No hidden witness is assumed to fit.

`BinaryOrder.lean` verifies the numerical comparison-state update, and
`BinaryProjection.lean` proves exact hidden-track projection semantics.
`CutPeriodLower.lean` specializes this to the proposed sequence.
`CutPeriodLowerCertificate.lean` checks every transition and final label for
the 111-state representation and its 23-state quotient. Its `correct` theorem
recognizes exactly positive sizes paired with a strictly smaller value,
universally over input words. `BinaryBoolean.lean` supplies Boolean product
semantics for the remaining error-language certificates.

The generated two-pile module has passed its source build, axiom audit and
kernel recheck. None of these components alone establishes either game's mex
equation.

`CutPeriodParameters.lean` proves that the proposed function has least positive
eventual additive period 12, unique saltus 8 at that period, and earliest start
at pile seven (preperiod length six). It rules out every smaller positive
period with every possible saltus, by descending any eventual identity to the
12 tail residues. Identification of the function with the games still awaits
the finite option/error certificates.

The 100 small Egyptian cases are now separate theorem declarations aggregated
by `FiniteCertificate.checked_list_rows`. This preserves the exhaustive check
and its soundness theorem while keeping source replay under the project's
4.5 GB Lean memory cap. The earlier single declaration exceeded that cap.

The full source build, refreshed whitelist audit and all 23 listed module
kernel rechecks passed locally for this checkpoint. Adding `CutPeriodMex`
then passed its source build, kernel replay and a refreshed audit over 1,094
project theorem declarations. Its error-language assumptions remain explicit;
the two-pile certificate was validated separately before registration.

## Complete two-pile certificate

`CutPeriodParts2Certificate.lean` checks a cache of all 1,458 finite product-NFA
states against the semantic composition rule, all 402 subset representations
and all quotient labels in the 126-state minimized DFA. `recognizes_piles`
proves its language is exactly the actual two-positive-pile relation, for every
input word. The current source build, whitelist audit and kernel replay passed.
The source build stayed below 3 GB RSS with the 4.5 GB Lean cap.

`BinaryFastComposition.lean` checks an eight-row digit-choice table against the
full numerical enumeration and proves a generic transition equality. Larger
groups use that equality to avoid repeating the numerical enumeration in every
cache row; no external computation or additional axiom is a premise.

The refreshed package audit accepted 3,391 theorem declarations, including
generated finite-row helpers. All newly registered modules passed kernel
replay; this is a two-pile checkpoint, not a proof of the full games.

The [Haralambis three-difference theorem](../results/haralambis-three-differences/PROOF.md) has a written proof and an executable check of the signed-edge and rotation certificates. The general theorem has no Lean formalization.

## Numerical error languages

`CutPeriodOptionData.lean` defines the two numerical 28-state option DFAs.
Their correspondence with actual legal splits is still unproved. Four checked
refinements in the `CollisionA/B` and `MissingA/B` certificate modules establish
that their collision and missing-smaller-value languages are empty for every
word. The collision representations have 32 states; the missing-value
representations have 34. Each quotient is a one-state rejecting DFA.

`CutPeriodCertifiedMex.lean` combines these certificates with the arithmetic
and actual-rule bridge. Its two mex theorems have one explicit remaining
hypothesis each: the numerical option DFA recognizes the actual legal splits.
Groups three through nine and the union refinements must discharge it before
either game theorem is complete. No finite error check supplies that hypothesis.

The added modules passed source builds and kernel replay. The refreshed
whitelist audit accepted 3,710 project theorem declarations, including helpers.

Both hosted workflows passed for the two-pile checkpoint `26b5c11` and the
error-language checkpoint `a6f4d06` on `main`. The three-pile group remains
experimental. Its current modular build checks short row blocks with explicit
interval coverage, rather than retaining the entire finite proof in one file.

`BinarySetCertificate.lean` proves a structural list-based set equality check
implies the original mask equality. `FiniteIntervalCertificate.lean` proves
that a checked proof list covers exactly its recorded numerical interval.
These are general certificate helpers, not completed game theorems.
Both helpers passed source builds and kernel replay; the refreshed package
audit accepted 3,725 theorem declarations using only the permitted axioms.

## Finite decision tests and paused continuation

`BinaryDecision.lean` connects the project automata to Mathlib's DFA interface,
uses the checked cycle-removal theorem to prove a complete short-word bound,
and proves `emptyCheck_correct` for every finite DFA. Its word enumeration is
a total finite computation; it need not be efficient for this termination
claim. `CutMexDecision.lean` proves the two finite error tests are necessary
and sufficient for the actual CUT mex equations, given exact finite graph,
lower-value and actual-option recognizers. Construction of those recognizers
uniformly from an arbitrary proposed arithmetic tail remains open.

The owner paused the campaign. The generated three-pile source build passed
its data, all 27 transition blocks and their aggregation. It was stopped in
the shared subset-data module. The 39 experimental sources and their ordered
manifest are preserved, but are not registered in the accepted root imports
or included in the package's axiom/kernel verification claims. See
`docs/formalization.md` for exact resume commands and remaining checks.

At the paused checkpoint, the accepted source build and refreshed audit passed
over 3,738 theorem declarations. Both newly registered decision modules passed
independent kernel replay. This count excludes all unregistered experimental
three-pile modules and is not a count of independent mathematical results.

The [five-speed loneliness spectrum](../results/five-speed-spectrum/PROOF.md) has a written computer-assisted proof and an exhaustive arithmetic verifier. Its Lean formalization is open.

The [six-speed equality and seven-coordinate plane classifications](../results/tight-six-speeds/PROOF.md) have written proofs and executable finite checks. Their Lean formalizations are open.

The [six-speed loneliness spectrum](../results/six-speed-spectrum/PROOF.md) has a written computer-assisted proof and an exhaustive arithmetic verifier. Its Lean formalization is open.

The [eight-runner equality classification](../results/tight-seven-speeds/PROOF.md) has a written computer-assisted proof and an exhaustive mixed-modulus verifier. Its Lean formalization is open.

The [nine-runner equality classification](../results/tight-eight-speeds/PROOF.md) has a written computer-assisted proof and an exhaustive mixed-modulus verifier. Its Lean formalization is open.

The [ten-runner equality classification](../results/tight-nine-speeds/PROOF.md) has a written computer-assisted proof and an exhaustive verifier. Its Lean formalization is open.

The [eleven- through fourteen-runner equality classification](../results/tight-eleven-to-fourteen/PROOF.md) has a written computer-assisted proof using published sieves. Its Lean formalization is open.

The [eight-speed spectrum classification](../results/eight-speed-spectrum/PROOF.md) has a written computer-assisted proof and an exhaustive verifier. Its Lean formalization is open.

The [seven-speed spectrum classification](../results/seven-speed-spectrum/PROOF.md) has a written computer-assisted proof and an exhaustive verifier. Its Lean formalization is open.

## General finite CUT decision theorem

[`CutGeneralDecision.lean`](../lean/Conjectures/CutGeneralDecision.lean),
[`CutGeneralGraph.lean`](../lean/Conjectures/CutGeneralGraph.lean), and
[`CutGeneralSearch.lean`](../lean/Conjectures/CutGeneralSearch.lean) prove the
uniform construction that the earlier conditional finite-test theorem required.

`CutGeneral.Candidate.test_correct` states that the computable test returns true
if and only if the proposed sequence satisfies the actual CUT mex equations.
The candidate has an arbitrary finite prefix, a positive period, finite natural
number tail entries, and a nonnegative saltus. The cut set is any finite list.
Exact recognizers, complete hidden-witness padding, subset construction, and
finite emptiness checks are all constructed and proved from these inputs.

`verifiedCandidates_sound` and `verifiedCandidates_complete` prove that bounded
finite enumeration finds any valid representation once its explicit search
bound is reached. This does not assert that every CUT game is arithmetic
periodic, or that the decision procedure is practical on large inputs.
The two concrete games still use separate numerical option certificates.
See [the detailed proof and scope](../results/cut-arithmetic-periodicity/GENERAL_LEAN.md).

## Checked five-speed components

[`Loneliness.lean`](../lean/Conjectures/Loneliness.lean) defines actual real
nearest-integer distance, finite-list clearance, and its supremum on the unit
interval. `certified_value` proves exact real maxima from finite rational
interval covers and rational attaining witnesses. The generator proposes the
data; Lean checks their coverage for every real time.

[`LonelinessContinuity.lean`](../lean/Conjectures/LonelinessContinuity.lean)
proves continuity, rational approximation, and attainment of that supremum.
[`LonelinessRational.lean`](../lean/Conjectures/LonelinessRational.lean)
proves the exact remainder formula at rational times.

`Loneliness.five_family_value` proves, for every natural `s >= 1`,
`value [1,2,3,4,5*s] = s/(5*s+1)`. `five_family_realizes` supplies positivity,
distinctness, primitivity, and the strict threshold as well. The twelve
`Loneliness.FiveSpeedExamples.*_value` theorems prove the exact maxima of the
listed sporadic examples. These do not establish that the list is exhaustive.

`Loneliness.CriticalFamilies.critical_family_below_threshold` classifies every
positive primitive list of length five containing a positive dilation of
`[1,2,3,4]` or `[1,3,4,7]`. The second family's exact value is proved for all
`s >= 2`; its `s = 1` value is `2/11`. These are unconditional mathematical
proofs, with no published family theorem as a premise.
See [the critical-family proof](../results/five-speed-spectrum/CRITICAL_FAMILIES_LEAN.md).

The remaining five-speed classification requires the external geometric norm
bound and the complete modular lifting/enumeration argument. Neither the finite
Python verifier nor the twelve checked values discharge those dependencies.

## Local extension validation, 18 November 2026

The 36 new CUT, loneliness, and density source modules compiled with the pinned
toolchain. Each passed an independent `leanchecker` replay. The combined axiom
audit checked 1,025 theorem declarations across the four new namespaces and
allowed only `propext`, `Classical.choice`, and `Quot.sound`. The root
imports, required declarations, and kernel replay list include the new modules.
The full-package rebuild and hosted CI are recorded separately; the module
receipts alone are not a claim that every repository result is formalized.


## Exact density theorems

`SymmetricFourPoint.symmetric_four_point_densities` proves both parity cases
for every positive coprime pair `a < b`. The proof includes the literal tile
interpretation, exact supremum/infimum definitions, periodic attainment, and
both sharp local interval lengths. See
[the checked scope](../results/symmetric-four-point-density/LEAN.md).

`NonmixedGap.nonmixed_gap_density` proves both the actual packing density and
the real circle maximum for every positive coprime gap pair and arbitrary
positive gap counts. Euclidean division handles either sign of `a-b`.
`nonmixed_gap_periodic_optimum` proves attainment by a periodic packing of the
literal tile. See [the checked scope](../results/nonmixed-gap-packing/LEAN.md).

The shared density definitions use centered intervals `[-N,N+1)`. Their finite
window bounds hold uniformly over translations; the exact endpoints do not
assume periodicity of competing center sets. Common-divisor normalization is proved by exact residue counts and periodic
block expansion. `translated_symmetric_four_point_densities` covers arbitrary
integer translations and arbitrary common divisors.
`nonmixed_gap_density_general` and `nonmixed_gap_general_periodic_optimum`
remove the coprimality premise from both nonmixed-gap endpoints.

`Loneliness.Normalization.primitive_representative` proves that division by the
gcd preserves the actual value, list length, positivity, and distinctness and
produces a primitive list. Its `critical_family_below_threshold` removes the
primitivity premise from the checked critical-family reduction.


The norm-reduction development additionally proves coefficient-rounding density
transfer for arbitrary real subspaces modulo integer vectors. Its space value
is identified with the real-time loneliness value for speed lines.
`Loneliness.NormArithmetic.five_speed_threshold` proves the numerical threshold
from explicit lattice-product and larger-subspace hypotheses. The geometric
hypotheses and external exhaustive classifications remain open; the theorem
is not presented as an unconditional norm bound.
See [the exact reduction and dependency stack](../results/five-speed-spectrum/NORM_REDUCTION_LEAN.md).
