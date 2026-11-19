# Lean verification status

The shared package is in [`lean`](../lean/).
It uses Lean **4.35.0** and Mathlib commit
`56a005855ea17e0b0958f73ec801ae140b0a1679`, as pinned in the existing manifest.
The campaign has incorporated the source collection and layout through commit
`daad0edf918f12cd57f6b30d3f16b28e7a12d2c5`. Earlier receipts below retain their
original checked scope.

Unregistered proofs and their separate hosted checks are tracked in
[`lean-candidates.md`](lean-candidates.md). Their presence in the repository
does not expand the accepted scope in the table below.

At candidate snapshot `75df6294`, the six-speed classification-to-bound
adapter passed its 21-module closure and 284-theorem axiom audit. The
hyperplane residue and endpoint-component closures also passed, covering
26 modules/463 theorems and 29 modules/490 theorems respectively. Each job
rebuilt sources, checked the standard axiom whitelist, independently replayed
every project kernel object, and confirmed unchanged sources. These remain
unregistered components. In particular, the adapter retains its five-speed
bound and primitive six-speed classification hypotheses. Exact job links and
scopes are in [`loneliness-75df-component-receipts.json`](loneliness-75df-component-receipts.json).

A complete formalization here means that Lean checks the mathematical conclusion
from the definitions in the indicated files. The correspondence between those
definitions and an external publication remains subject to mathematical review.
Published mathematical theorems that have not been formalized are hypotheses,
never additional Lean axioms.

| Note | Status | Checked scope and remaining gap |
| --- | --- | --- |
| L-solitaire | Complete for both the counterexample and corrected theorem | Actual moves for arbitrary layer sets containing 1; all recurrent states; classification and maximality of stable references; one-column interlacing; the explicit uniform profile bound and convergence for every diverging scale. The separate fixed-scale counterexample remains checked. |
| Three-player War | Complete for all three explicit cycling deals | Distinct ranks and round-robin deal sizes; exact transition rules; returns after 90, 180, and 19,320 turns; no earlier positive return; all three players active at every nonnegative time. |
| Pham denominator degree | Complete | Both exact rational identities follow from actual Bulgarian-solitaire cycles and coefficientwise stabilization of their first-entry levels. The primitive period-10 words have reduced denominator degrees 5 and 10, with coprimality and minimality against every nonzero alternative denominator. No published rationality or degree-bound theorem is assumed. |
| Batista Egyptian fractions | Complete | An ordered lexicographically first solution uniquely maximizes the last denominator for every admissible positive `k` outside residue class 1. The proof uses the elementary global comparison and a kernel-reduced exhaustive certificate below 100, with proved denominator bounds; no published comparison theorem is a hypothesis. |
| CUT Family B | Complete | The actual well-founded mex games have identical values at every positive pile size iff `3x < y`, including infinite cut sets. The six-block base formula, preservation under all even cuts, and discrepancy by `4x` are proved internally. |
| CUT arithmetic periodicity | Complete | The uniform terminating decision test and exhaustive candidate enumeration are proved for every finite cut set and proposed arithmetic tail. Compact quotient/residue certificates identify both actual example games at every pile size and prove least eventual period 12, saltus 8, and earliest start 7, hence positive-pile preperiod 6. |
| Loneliness on a fixed hyperplane | Partial | Exact shifted hyperplane maximum, attainment, integer Bézout construction, and the upper bound for every orthogonal integer velocity are checked. The uniform probability estimate, exceptional-subspace counts, Haar limiting law, and endpoint density remain open. |
| Graffiti.pc Conjecture 318 ([@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)) | Complete | The all-order theorem uses actual graph distances and undirected complement-edge counts. Every total dominating set contains an adjacent total dominating pair; every minimal set has size two. The stated five-vertex graph proves sharpness of a one-unit relaxation. |
| Hadamard order-2396 partial results | Partial overall; automorphism, both norm proofs, and border symmetry bounds complete | For every real Hadamard matrix of order 2396, the full signed row/column automorphism group has no element of order 479, and 479 divides neither its cardinality nor any subgroup-quotient cardinality. Both norm proofs and the exact quadratic-integer model are checked. For the fixed-border core on every finite abelian domain with a subgroup of size 149 and index four, the full common multiplier group is cyclic of order dividing four; every preserving subgroup leaves at least 151 actual sign orbits. Finite-border transport and actual-row normalization are also checked, with the finite identities and compression shapes retained as explicit inputs. The length-1197/598 sequence restrictions, quotient certificates, and full fixed-border construction remain obligations under issue 17. |
| Lonely-runner two insertions | Not formalized | The arbitrary two-speed insertion theorem, acceleration bridge, unbounded branch, finite cases, and three-insertion obstruction are not registered in the accepted package. Published candidate sources remain under issue 12. |
| Erdős–Gyárfás abelian covers | Partial: sharp example and voltage normalization complete | The literal connected 95-vertex cyclic cover has attained least power-of-two cycle length 32. Every seven-voltage assignment in an abelian group is normalized by an explicit graph isomorphism preserving actual cycles. The universal cover cycle theorem remains under issue 18; the general minimum-degree-three conjecture is outside this result. |
| Li coefficient sign | Not formalized | Tree/partition certificates, chromatic symmetric functions, and the coefficient extraction remain to formalize. |
| Frankl generating families | Partial: large-generator bound and cyclic components checked | The full `k ≥ 15` theorem is checked: in every finite `k`-uniform generating family with exactly three generators through each point and pairwise intersections of size at most one, every point belongs to at least `657/1000` of the distinct unions, including the empty union. The full Vaughan shortcut, all cyclic span-four families on at most six sites, conditional residual cases at periods seven through ten, and exact local weight-checker semantics are also checked. The conditional all-period assembly, 48-case literal pilot, and exact injective weight transport are checked. The complete cyclic span-four theorem and the `3 ≤ k ≤ 14` high-girth cases remain incomplete. |
| Erdős 607 line sizes | Partial | The exact realizability criterion and geometric counting identity are proved for every n. Canonical core/tail reconstruction, cumulative counting, and the exact coefficientwise formal generating function are checked. The saddle profile and uniform corrected finite Euler product, including the square-root factor, are checked. Analytic evaluation, the Fourier local limit, and the sharp coefficient asymptotic remain open. |
| Growing rectangles | Complete | The logarithmic asymptotic is proved uniformly for every `w ≥ h` as `h → ∞`, for literal integer-sided real-position tilings counted by block multiset. The real-to-grid bridge, cumulative partition asymptotic, both packing reservations, and exact leading constant are checked. |
| Distance graphs with three missing differences | Complete | The actual extremal densities and circle maxima for `{1,k,k+5}` and `{1,k,k+7}` are classified for every positive `k`, including every small exception. Explicit periodic optima, the exact Conjecture 39 discrepancy, and infinitely many strict counterexamples are proved. |
| Two-difference Motzkin theorem | Partial: compact equality and fixed character-window witness complete | Equality of actual Borel-set density and continuous-character supremum for every compact Hausdorff abelian group with invariant probability measure, including zero differences. The literal unshifted half-open character window now has its exact measure and avoidance proved, including finite character images. Rank formulas for the stated relation generators, finite-relation attainment, the cyclic theorem for every positive modulus, gcd scaling, the odd-cycle criterion, the exact example, and abstract rational-circle attainment are checked. Exhaustive basis existence, explicit rational interval witnesses, and evaluator/complexity claims remain candidates. |
| Tight six speeds and critical planes | Partial | The consecutive six-speed set has global value `1/7`. Uniqueness, plane classification, and the large-norm consequence remain open. |
| Six-speed spectrum | Partial | Global values of the consecutive set, nine sporadic examples, the displayed `5/33` example, and the positive primitive family `[1,2,3,4,5,6s]` for every `s≥1` are checked. The remaining family branch, norm reduction and exhaustive classification remain open. |
| Eight-runner equality cases | Partial | All three displayed sets have global value `1/8`. Exhaustiveness remains open. |
| Nine-runner equality case | Partial | The consecutive set has global value `1/9`. Uniqueness remains open. |
| Symmetric four-point density | Complete | Exact real packing and covering densities for every literal translated symmetric four-point integer set, including common-divisor normalization. Both periodic constructions and the two sharp local interval lengths are proved. |
| Packing with two nonmixed gaps | Complete | The exact three-case packing and real circle formula for every positive gap pair and arbitrary positive gap counts, including gcd normalization, literal tile semantics, periodic attainment, and the stated example. |
| Haralambis three-difference theorem | Complete | Exact equality of actual extremal density and real circle value for every positive triple, with no coprimality premise. An optimal periodic set has a pair-sum period. The proof includes finite balanced orientations, signed defects, odd periods, interval counting, and the explicit `{2,5,9}` example. |
| Five-speed spectrum | Partial | All twelve example values and both critical-family reductions are checked. The unconditional four-speed gap theorem is proved: below `2/9`, precisely the two scaled critical directions occur, both with value `1/5`. This also proves the four-speed runner bound. All 122,880 indexed plane cases and the five-speed coordinate cutoff are checked, and their gap input is now available. The bounded five-speed classification remains open. |
| Tight nine-speed sets | Partial | The consecutive direction has exact global value `1/10`; uniqueness remains open. |
| Seven-speed spectrum | Partial | The infinite consecutive family and all 27 displayed exceptional values are checked. The geometric norm bound and exhaustive classification remain open. |
| Eight-speed spectrum | Partial | All three displayed product families are classified and evaluated within those families, including both exceptional `s=1` values. All 17 displayed sporadic values are checked. The norm bound and exhaustive classification outside the families remain open. |
| Eleven-through-fourteen-runner equality | Partial | The consecutive directions and the displayed exceptional thirteen-speed direction have their exact global values. Uniform reduction, modular exhaustiveness, and uniqueness remain open. |

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

The five new modules `CutFamilyBlocks`, `CutFamilyBase`, `CutFamilyCover`,
`CutFamilyGame`, and `CutFamilyTheorem` remove the former base-formula
hypothesis. `gameValue` is defined by well-founded recursion using the mex of
actual positive-pile split options. Its mex existence and recursion equations
are proved for arbitrary, possibly infinite cut sets.

`even_base_mex` proves the six-block formula for `{1}` together with any set
of even cuts whose minimum is the given even `x >= 4`. The proof uses a finite
XOR-subadditive block cost table and explicit witnesses for every smaller
value; it is an all-size argument. `family_b` then states the exact comparison
with `{1,x}` for arbitrary sets of even and odd cuts, with minima `x` and `y`.
It proves equality at every positive size iff `3*x < y`.
`family_b_difference_by_four_x` proves the stated finite discrepancy bound.
No published base formula or mex equation is an unproved hypothesis of these
two complete theorems.

## Reverse-solitaire dynamics

`DenominatorDynamics.lean` works with actual multisets of positive pile sizes.
It proves that choosing a legal distinct size gives precisely one reverse
image, that every positive preimage arises this way, and that different chosen
sizes give different preimages. Forward and reverse moves preserve mass.
These results establish the enumeration model, but do not yet prove the
stabilized orbit coefficients or the representation bounds required by the
Pham denominator certificate.

## Exact loneliness certificates

`LonelinessMax.lean` defines distance to the nearest integer and the minimum
of the distances for a finite speed set. It proves continuity, attainment of
a global maximum, and a pair-sum maximizer: for distinct positive speeds there
are `a != b` in the set and an integer `0 <= k <= a+b` at which `k/(a+b)` is a
global maximizer. The proof covers every real time. It uses the intersection
of phase intervals and a strict improvement argument, not a sampled-time
assumption.

`LonelinessCertificate.lean` proves sound upper and lower Boolean checks using
exact natural-number remainder arithmetic. `LonelinessExamples.lean` checks
31 explicit values by ordinary kernel reduction. The Python generator is an
untrusted producer. The resulting theorems state an attained value and its
upper bound at every real time; they do not assert that the examples exhaust
any classification.

## Reproduce

Install the pinned toolchain with elan, then from the repository root:

```sh
export PATH="$HOME/.elan/bin:$PATH"
cd lean
lake exe cache get
cd ..
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

At this 18 November checkpoint, the distance-graph classifications, compact
Motzkin theorem, symmetric-four-point densities, and nonmixed-gap formulas
were still pending. Their later verified scopes appear in the current status
table and the subsequent component sections below.

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

At the earlier paused checkpoint, the generated three-pile source build passed
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

## Resumed campaign, 18 November 2026

The new Family B modules passed their source builds, a namespace audit of 575
project theorem declarations, and all five independent `leanchecker` replays.
The three loneliness modules, the reverse-solitaire dynamics module, the
uniform affine/tail graph modules, and the first three packing-density modules
also passed source builds and independent kernel replay locally. The shared
package verification is being rerun with the accepted root imports and audit
requirements. This paragraph does not claim a hosted CI result.

Li remains last in the active queue. The repository-wide campaign is incomplete.

## Complete general CUT decision test

`BinaryFiniteNFA`, `BinaryGenericComposition`, and `BinaryGenericProjection`
construct executable finite recognizers for arbitrary finite state types.
Hidden-number completeness uses an explicit common padded width, without an
assumption that values are bounded by pile size. `BinaryRecognizers` packages
finite union, difference, composition, projection, and complete emptiness.

`CutArithmeticTest.finiteSetTest_iff_gameValue` states that for every finite
cut set and every proposed finite prefix plus arithmetic tail, the constructed
Boolean test accepts iff the candidate equals the actual recursively defined
game value at every positive size. The test terminates for every input; no
practical complexity claim is made. No graph, option, projection, or mex
recognizer is an unproved input. This completes the general test in the note.
It does not replace the remaining finite certificate work for its two examples.

## Checked analytic solitaire transfer

`Solitaire/ProfileTransfer.lean` proves the explicit error bound
`4/(a*ε^2) + sqrt(2)/(ε*sqrt(n))`, its convergence to zero for diverging scales,
uniform convergence on `x >= ε`, and transfer of every pointwise stable limit.
`Solitaire/GeneralTheorem.lean` discharges every field of the finite input
`SolitaireGeneral.ProfileComparison` from the actual arbitrary-layer dynamics.
The completed chain proves return-time rank periodicity, the attained birth
range, sorted-column interlacing, stable mass and length estimates, and
classification of every positive fixed configuration. The reference is an
actual fixed configuration of largest mass at most n.

`corrected_solitaire_uniform` proves uniform convergence away from zero for
every rule sequence and every recurrent configuration sequence of mass n,
at every positive horizontal scale tending to infinity.
`corrected_solitaire_pointwise` transfers every stable pointwise limit.
`arbitrary_layers_uniform` accepts arbitrary (including infinite) layer sets
containing the bottom layer. The only recurrence premise is actual periodicity
under the defined move; no interlacing or return-period lemma is assumed.

All twelve finite-dynamics modules passed warning-as-error source checks and
independent kernel replay; the finite namespace audit checked 348 theorem
declarations. ProfileTransfer, StableCore, StableBounds and GeneralTheorem
also passed source checks and independent kernel replay. The combined package
gate is being rerun after the concurrent repository merge.

The floor step in the written note was corrected: `floor(a*x) >= a*ε/2` and
`floor(a*x)+1 > a*ε` follow when `a*ε >= 2`. These valid inequalities give the
same stated error bound. No stronger floor inequality is assumed in Lean.

## Complete symmetric four-point densities

`PackingFourPoint.symmetric_four_point_densities` proves the exact supremum of
upper packing densities and infimum of lower covering densities for every
coprime pair `0<a<b`. Opposite parity gives `1/4` for both. For odd steps,
`P=ab+b-a` and `Q=ab+a+b` give `(P-1)/(4P)` and `(Q+1)/(4Q)` respectively.
The density definitions use actual symmetric integer windows and real limsup
and liminf, not a periodic-only optimization.

The proof combines the all-size local obstruction with uniform count bounds,
passage to asymptotic density, and fully checked modular constructions.
`PackingLocalSharpness` additionally proves existence of global packings and
coverings with exactly-once intervals of lengths `P-1` and `Q-1`; together with
the obstruction the lengths are optimal. All ten packing modules passed local
source checks and independent kernel replay. Their main and helper theorems
are included in the shared whitelist audit.

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

## Common loneliness interface

`LonelinessPairBridge.lean` proves equality of the fractional-part and
nearest-integer distances, and of finite-set score and list clearance.
`Loneliness.exists_pair_sum_maximum` gives the pair-sum maximizer for the shared
`Loneliness.value`; `certified_pair_value` turns the finite Boolean checks into
that same real supremum. The earlier certificates now live in
`Loneliness.PairSum`, avoiding declaration collisions.

## Rectangle combinatorial inputs

`RectangleFinite.shelf_packing` assigns every positive width list to at most Q
strips of width B when every width is at most M≤B and the total is at most
Q(B−M). It preserves the input list exactly and applies at every size.
`RectangleFinite.deletion_count_bound` proves that deleting parts
below a from any finite family of partitions of T loses at most a factor
(T+1)^(a−1). Its proof recovers each original partition from the retained
multiset and the bounded small-part multiplicities. Both modules passed
warning-as-error source checks and independent kernel replay.

## Gap-five and gap-seven character classification

The nine `DistanceGraph` modules prove `gap_five_value` and `gap_seven_value`
for every positive integer parameter, with the seven/nine residue tables and
21 small value certificates. `corrected_prediction_strict` proves the infinite
strict-discrepancy branch; `counterexample_character_difference` is the exact
1/2958 difference at k=50, where the true character value is 25/58.
All nine modules passed strict source checks and independent kernel replay;
all 263 namespace theorem declarations passed the standard-axiom audit.
The separately checked `ThreeDistanceGraph` endpoint below completes the
actual-density classification. Haralambis permits repeated entries and
therefore also applies directly at k=1.


## Complete Haralambis theorem, 18 November 2026

`Haralambis.three_difference_theorem` proves the full result for every function
`d : Fin 3 → ℕ` with positive entries. The extremal density is the supremum
of the actual upper densities of all subsets of the integers avoiding the
three differences. The circle value is the existing real-time supremum of
the minimum distance to the nearest integer. The same theorem supplies an
avoiding set of period `d i + d j`, with `i ≠ j`, whose density is that supremum.
Repeated entries are allowed; distinct triples are included.

The finite proof constructs balanced signs on the defect multigraph, obtains
three square identities, and derives an odd integer period vector by finite
weighted sums and Bézout. Pair inequalities give intersecting real intervals.
Uniform finite-window counting proves the density upper bound for arbitrary
sets. Exact residue counts remove the gcd. A compactness argument places a
circle maximizer at a pair-sum denominator, and the rational-character
packing theorem preserves that denominator even for a nonprimitive character.
No infinite cocycle extension or external Haralambis theorem is a premise.

`Haralambis.example_two_five_nine_centers` checks the literal period-seven
center set with residues `0,1,4`; both its density and the optimum are `3/7`.
See [the complete checked scope](../results/haralambis-three-differences/LEAN.md).

`Loneliness.Packing.one_div_length_add_one_le_density` additionally proves the
general greedy packing lower bound. Combined with Haralambis,
`Loneliness.SmallRunner.lonelyRunnerBound` proves the lonely-runner bound for
at most three speeds. No small-runner theorem is left as a hypothesis.

The new coalescence files prove that a coordinate-free rational subspace of
dimension `d` in `n` coordinates contains an integer direction with at most
`n-d+1` distinct absolute speeds. The real span has the same dimension, and
subspace extensions by independent projected integer vectors have the claimed
dimension and coefficient-rounding value bound. The dimension-three, -four,
and -five lower bounds in five coordinates now follow unconditionally.
The lattice covolume, successive minima, cube-section estimate, and four-speed
classification remain explicit outstanding dependencies of the full norm bound.

All twenty new modules passed source compilation and separate independent
kernel replay. The Haralambis/packing audit checked 233 declarations, and
the coalescence and small-runner headline checks used only `propext`,
`Classical.choice`, and `Quot.sound`. The combined accepted-package axiom audit checked 5,077 theorem declarations
and accepted only those three axioms. Hosted source and kernel validation for
this checkpoint are tracked separately.

The earlier density/CUT/loneliness checkpoint `6c095083d6c17eff3797f798cbfe35d0ea98c1f6`
passed the complete [hosted Lean workflow](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44433833213),
including the source build, project axiom audit, and every registered kernel replay.

`DistanceGraphOddCycle.lean` separately proves the exact l/(2l+1) density
for every pair {1,2l}, l>0, with periodic attainment and an upper bound for
arbitrary avoiding sets. Its source, kernel and 30-theorem axiom checks passed.

## Combined verified checkpoint, 18 November 2026

The immutable verification gate for commit `c0cf593d22cfb8bb927274a3032b664a32ad45cd`
completed locally with exit status 0.
The full source build passed. Both the compiled audit and the direct
warning-as-error audit checked 6,954 project theorem declarations and accepted
only `propext`, `Classical.choice`, and `Quot.sound`.

All 152 proof modules registered in that snapshot and both project roots completed the pinned
`leanchecker` replay. The script checked that the registered list equals the
local project source-import closure, staged the exact accepted compiled objects
including private/server data, and used the unchanged checker on the two
project namespaces. The replay finished with 154 reported targets and its
success footer. Accepted mathematical sources remained unchanged during the
gate. The theorem count includes helper declarations and is not a count of
independent mathematical results.

Two additional negative controls passed: the ownership-based audit rejected
an unused private project axiom, and the replay helper rejected an incomplete
module list before launching the checker. Temporary controls are outside the
repository's proof sources.

The Pham orbit/recurrence extensions, further concrete CUT certificates,
compact-group Motzkin work, and Erdős 607 work remain separate ongoing source
trees. Their unfinished scope is not covered by this receipt. Hosted CI for
the publication is a separate validation run.

## Additive integration, 19 November 2026

The merged accepted package contains 177 proof modules and two roots. Its
registered replay list equals the source-import closure. The combined
`lake build` passed, followed by a direct warning-as-error `ProofAudit.lean`
check. Both the compiled and direct audits checked 7,581 project theorem
declarations and accepted only the three standard logical axioms. The local
repair-and-integration runner completed with exit status 0.

The kernel receipts have the following exact scope:

- The `c0cf593d22cfb8bb927274a3032b664a32ad45cd` gate above replayed its
  152 proof modules and both roots. Of those proof sources, 150 remain
  byte-for-byte unchanged in this integration.
- The 25 additional proof sources match
  `a7b1ca1a96abc67e1dbc6c547629409c25ad2964` byte-for-byte. They rebuilt locally,
  and that commit's [hosted Lean run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44439617882)
  passed source compilation, axiom audit, and independent kernel replay.
- The two changed proof sources, `RectanglePacking.lean` and
  `RectanglePartitionCounts.lean`, now use `RectangleFinite` instead of
  `RectanglePartitions`. Their statements and proof bodies are unchanged.
  Both passed fresh warning-as-error source checks and independent kernel
  replay of their exact local import closures. The rename resolves the
  duplicate `RectanglePartitions.shelf_packing` declaration detected by the
  first combined root build.

These component receipts cover every accepted proof module. The full hosted
replay of the merged publication is a separate run and was not yet available
when this integration receipt was written. Unregistered Pham, finite/compact
Motzkin, concrete CUT, Erdős 607, and other teams' candidate work is excluded
from this accepted-module count.

## Complete distance-graph classifications, 18 November 2026

`ThreeDistanceGraph.gap_five_classification` and `gap_seven_classification`
prove the complete tables for every positive `k`, for the actual upper-density
supremum and the actual real-time circle maximum. The proof applies the
checked Haralambis theorem, reduces a maximizer to one of three pair-sum
denominators, and proves each residue-class bound by integer arithmetic.
Exact rational interval certificates discharge the small cases.

`gap_five_periodic_classification` and `gap_seven_periodic_classification`
supply actual periodic avoiding sets. The Conjecture 39 residue-five branch
has density `(4k+25)/(9(k+8))` for `k>=41`, `k mod 9=5`; its claimed value
exceeds this by `(k-41)/(9(k+1)(k+8))`. The proof gives strict counterexamples
for every `k=50+9n` and proves that their set is infinite. At `k=50`, the
checked discrepancy is `1/2958`.

All ten modules passed source compilation and independent kernel replay.
The namespace axiom audit checked 399 declarations with only the three
permitted logical axioms. See [the complete checked scope](../results/distance-graph-densities/LEAN.md).
The `ThreeDistanceGraph` prefix avoids collisions with a concurrent team's
independent `DistanceGraph` development.

## Rectangle components, 18 November 2026

Seven finite modules prove the actual grid-placement and multiset semantics,
shelf packing, recovery after unit-square filling, finite bounded-partition
counts, deletion multiplicity, and the logarithmic packing lower bound.
Their 125 theorem declarations passed the whitelist audit and all seven
modules passed independent kernel replay.

Four analytic modules prove the finite Euler-product bound, the sharp limit
`t*logEuler(B,t) -> pi^2/6` when `t -> 0+` and `B*t -> infinity`, and the
uniform ordered-rectangle and diagonal upper bounds. Mathlib's checked
Basel-sum theorem supplies the exact constant. The 38 analytic theorem
declarations passed the same axiom audit; all four modules were independently
replayed. These were partial components at that checkpoint; the complete theorem is
recorded in the later rectangle receipt below.
See [the checked components](../results/rectangle-partition-asymptotics/LEAN.md).

## Two-direction plane reduction

`Loneliness.CoordinateSubspace.two_integer_directions` proves that every
coordinate-free rational plane in `n` coordinates is spanned by two integer
vectors, both having nonzero coordinates and at most `n-1` distinct absolute
speeds. The coalescence step can avoid a prescribed nonzero-coordinate point;
its coefficients remain exactly `+1` or `-1`.

`two_critical_integer_directions` applies this in five coordinates below
value `2/9`, with the exact `FourSpeedGap` statement retained as an explicit
hypothesis. The gap states that four distinct positive speeds below `2/9`
are a dilation and permutation of `[1,2,3,4]` or `[1,3,4,7]`. This hypothesis
is not an axiom or a proved classification. The at-most-three-speed cases
are discharged by the previously checked small-runner bound. The four new
modules passed source, axiom, and independent kernel checks.


The combined accepted-package audit for this checkpoint checked 5,655 theorem
declarations and accepted only the three permitted logical axioms. All
twenty-five new modules passed individual source compilation and independent
kernel replay. The generated distance-graph examples reproduce byte-for-byte.
The source build and full hosted replay for this commit are tracked separately.

## Complete Pham denominator result, 19 November 2026

`DenominatorForest.pham_denominator_counterexample` proves the complete
primary result for the word `0001001011`.
`DenominatorForest.pham_dual_denominator` proves the stated reverse-complement
result for `0010110111`. Both words have length ten and distinct rotations.
Their reduced denominators have degrees five and ten, respectively.

The proof uses actual positive multiset partitions. It proves the complete
inverse-move correspondence, the repeated-word forward cycles, and the
cardinality of each first-entry orbit level. For every depth `n`,
`primary_level_stabilizes` and `dual_level_stabilizes` identify the exact finite
level with the limiting coefficient for every repetition count `k ≥ n + 2`.
`IsOrbitLevelLimit` explicitly quantifies over all coefficients and all
sufficiently large repetitions.

Finite head/tail recursions derive the two formal-power-series identities.
The rationality and degree bounds used in the original written certificate
are not hypotheses of these endpoints. Coprimality is proved, and
`Denominator.reduced_denominator_dvd` shows divisibility into every alternative
nonzero denominator, giving the exact minimal degrees. The common degree-ten
denominator identity is proved as a separate statement.

The strict source sweep completed successfully. The ownership-based audit
checked all 1,080 Denominator theorem declarations, including private
declarations, and accepted only `propext`, `Classical.choice`, and `Quot.sound`.
The unchanged pinned `leanchecker` independently replayed all 36 project
modules in the exact local import closure of `Conjectures.DenominatorTheorem`.
Both source/audit and kernel runners returned exit status 0; the replay
printed its completion footer.

The 418 polynomial-recursion identities and their aggregate certificates were
checked in Lean. All 15 generated Lean files reproduced byte-for-byte from
the deterministic producer. The [direct proof guide](../results/pham-denominator-degree/FORMAL_PROOF.md)
explains the mathematical construction and its correspondence with the code.

## Checked finite Motzkin theorem, 19 November 2026

For every finite abelian group algebraically generated by the two marked
elements, `Motzkin.finite_two_difference_theorem` supplies an independent set
and a circle-valued additive character attaining the same normalized value.
It proves maximality against every independent set and every such character.
Zero marked elements are allowed; no cyclic-group assumption is used.

`Motzkin.finite_density_eq_characterValue` states the equality for the actual
measurable-set and continuous-character suprema with invariant probability
measure on the finite discrete group. `Motzkin.characterValue_le_density`
proves the general character lower bound for Borel probability measure.
The signed-grid, cocycle and defect arguments are internal proof steps.

Eight new modules passed source checks. The Motzkin audit checked all 115
namespace theorem declarations and accepted only the three allowed logical
axioms. Independent kernel replay completed all 12 project modules in the
exact local closure of `Conjectures.MotzkinDensity`, with exit status 0 and the
completion footer. The eight source files remained unchanged during replay
and registration preparation.

The arbitrary compact-group upper bound, the annihilator evaluations and
cyclic sharpness criteria, and the full exact algorithm with its complexity
bound remain separate unfinished work. The imported character-separation and
biduality developments are not part of this finite checkpoint.

## Pham and finite Motzkin integration receipt

Registration adds 42 previously checked modules to `c862951`: 34 Denominator
modules and eight Motzkin modules. The accepted package now contains 219 proof
modules and two roots. The replay helper verified that its 221 targets equal
the exact local source-import closure.

The combined `Conjectures.lean` root passed a fresh strict pinned-Lean source
check against the checked objects. `ProofAudit.lean` then passed its strict
source check and audited 8,653 project theorem declarations, including private
declarations. Only `propext`, `Classical.choice`, and `Quot.sound` were accepted.
All accepted source hashes were checked before and after this integration
gate; the runner returned exit status 0.

The 36-module Pham and 12-module finite Motzkin kernel receipts above cover
every new proof module. The full package rebuild and whole-package replay in
the hosted workflow are tracked separately from these local component checks.

## Complete rectangle asymptotic, 19 November 2026

`RectangleAsymptotics.uniform_log_asymptotic` proves that one height threshold
works for every larger height and every width `w ≥ h`:

\[
\left|\frac{\log p(h,w)}{\sqrt{hw\log\min(h,(hw)^{1/4})}}
      -\pi\sqrt{2/3}\right|<\varepsilon.
\]

The count uses finite, integer-sided, axis-parallel blocks at arbitrary real
positions. Rotation and arrangement do not distinguish block multisets.
`realTiles_iff_gridTiles` and `realRectangleCount_eq` prove the exact bridge
to the grid count; `RealTiling.cover_closed` checks the outer boundary.
The joint-filter and arbitrary-filtered-family endpoints are also proved.

The proof derives the cumulative bounded-partition asymptotic from finite
Euler products and tail estimates. It verifies both strip/column reservation
budgets, all floor errors, the harmonic active range, and the negligible
small-part deletion loss. The exact Basel constant closes the uniform squeeze.
There is no unproved Hardy–Ramanujan or real-tiling premise.

All 46 modules passed source and stock kernel checks; the final audit checked
587 theorem declarations and permitted only the three standard logical
axioms. Eleven inherited source files match the successful `a7b1ca1` hosted
checkpoint. The 35 new modules have local source, axiom, and kernel receipts.
See [the complete scope](../results/rectangle-partition-asymptotics/LEAN.md)
and [source hashes](../results/rectangle-partition-asymptotics/lean-verification-receipt.json).

## Finite planes and coordinate cutoffs, 19 November 2026

`Loneliness.Pigeonhole.four_speed_cutoff` proves that every coordinate of a
positive primitive four-speed tuple below value `2/9` is at most 5,832.
It assumes neither distinctness nor the four-speed gap. The proof combines
an exact finite pigeonhole approximation with the proved three-speed bound.

The 64 plane certificate blocks cover all `8 × 8 × 120 × 16 = 122,880`
indexed direction pairs. Both [run 44446557652](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44446557652)
and [run 44447687031](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44447687031)
passed every row's source check, independent stock kernel replay, and axiom
audit. Every generated-source hash, support-source hash, and generator hash
was checked against the retrieved receipts. The second run also retained
compiled artifacts; their ZIP digests and source hashes matched.

The semantic normalization, admissibility, product-plane identification,
finite-coverage aggregate, and spectrum conversion passed separate source,
axiom, and kernel checks. `critical_product_of_low_value` now discharges
finite coverage internally; `FourSpeedGap` remains an explicit mathematical
input of this accepted theorem.

With that input, `five_speed_finite_or_critical_quadruple` bounds every
positive primitive nonfamily five-speed tuple below `1/5` by `23^4 = 279841`.
The weaker `five_speed_finite_or_spectrum` also follows. The two structural
modules passed their six-declaration audit and separate stock kernel replays.
This does not establish the enumeration of the bounded tuples.
See [the plane proof](../results/five-speed-spectrum/PLANE_REDUCTION_LEAN.md),
[the cutoff proof](../results/five-speed-spectrum/PIGEONHOLE_REDUCTION_LEAN.md),
and [the finite receipts](../results/five-speed-spectrum/plane-certificate-receipts.json).

## Combined rectangle and plane integration, 19 November 2026

The accepted source-import closure now contains 338 proof modules and two
roots. The registration script checked exact equality between that closure
and the replay list. Both combined root compilations passed with the pinned
Lean toolchain and the configured 4,500 MB allocation limit. The final
warning-as-error `ProofAudit.lean` compilation passed at 6,000 MB and checked
9,424 project theorem declarations, including private declarations. It
accepted only `propext`, `Classical.choice`, and `Quot.sound`.

The 119 newly registered modules consist of 35 rectangle modules and 84
plane/pigeonhole modules. Every new proof source has a successful component
source check, transitive axiom audit, and independent stock kernel replay.
The inherited 219 accepted modules retain the source-matched receipts from
the preceding checkpoints. The finite plane blocks also have both complete
hosted matrix receipts recorded above.

The full combined audit took about nine and a half minutes and exited
successfully; no interruption or partial audit is counted as a pass.
This integration uses the exact frozen proof sources. The hosted package
build and complete combined kernel replay are a separate validation run;
no hosted result for this publication was available when this receipt was
written.

The [integration receipt](rectangle-plane-integration-receipt.json) records
the exact accepted source hashes, root hashes, and gate results.


## Complete concrete CUT games, 19 November 2026

`CutPeriod.Weight.both_games_exact` proves equality of the actual recursively
defined `CutFamily.gameValue` with the stated candidate for cuts `{1,2,8}` and
`{1,2,7,8}`, including pile zero. Its `ExactArithmeticParameters` conclusion
states all four requirements: period 12 with saltus 8 holds from pile 7; every
positive eventual arithmetic period is at least 12; every period-12 saltus is
8; and the period-12/saltus-8 law holds from a start exactly when that start is
at least 7. This gives preperiod 6 on positive piles.

The seven `CutPeriodWeight*` modules prove finite shape classification,
collision exclusion, lower-option construction, both actual mex equations,
and game identification. A quotient/residue representation reduces collisions
to finitely checked weight masks. Explicit lower-option templates lift to all
quotients. The extra eight-pile options in the second game remain collision
free. Both generated table files reproduce byte for byte from
`generate_weight_certificates.py`. The large higher-pile automata drafts are
preserved, but are not dependencies of this complete proof.

All seven sources passed their checks. The ownership-based closure audit
checked 1,127 theorem declarations and allowed only `propext`,
`Classical.choice`, and `Quot.sound`. The pinned unchanged independent checker
replayed all 23 project modules in the exact import closure successfully.
Frozen source, generator, manifest, and toolchain hashes matched after replay.

## Erdős 607 checked foundations, 19 November 2026

Seven modules are accepted as components of the full line-size result:

- `LineSizeCost` and `LineSizeGeometry` prove the incidence cost bound for actual
  distinct affine lines in the real plane, with their actual point counts.
- `LineSizeCore` proves existence and uniqueness of the positive core, the
  staircase and tail bounds, and the exact core cost formula.
- `LineSizeImported.SylvesterGallai` and `LineSizeOrdinary` prove ordinary-line
  existence for every noncollinear finite real-plane point set, and bridge the
  coordinate determinant statement to Mathlib affine lines and collinearity.
  The upstream source is pinned, ported locally, and retains its CC0 license
  and provenance. No Sylvester–Gallai theorem is assumed as an axiom.
- `LineSizeGraphCounts` proves the selected-graph incidence degree identities,
  exact tail degrees, core capacity bounds, and the total point-cost identity.
- `LineSizeCoreGaps` gives an explicit core/gap equivalence and both inverse
  identities, its exact weighted sum, the last-gap shift, and the exceptional
  minimum weights 3 and 6 for core lengths one and two.

The ordinary-line, selected-graph, and core-gap closures passed strict source
checks and independent kernel replay of respectively four, three, and three
project modules. Their ownership audits checked 54, 97, and 122 theorem
declarations respectively, allowing only the three standard axioms. These
closures overlap; these numbers are not separate mathematical-result counts.
Their seven distinct source files matched the frozen replay hashes.

The actual geometric construction and padding, the bijection to full records,
the exact generating function, and the sharp asymptotic prefactor remain
ongoing work. This result is partial.

## Hosted verification of the Pham/finite-Motzkin checkpoint

Commit `18bf908ae3b19c293aba07944d339e5193ec483f` passed the complete hosted Lean
workflow: [run 44450524136](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44450524136),
job `135313034960`. Source build, the project axiom audit, and independent
kernel replay all succeeded for its 219 proof modules and both project roots.
This confirms the complete published Pham result and the stated finite Motzkin
scope; it does not establish the still unregistered compact-group theorem.

## CUT and line-size foundation integration, 19 November 2026

Fourteen checked proof modules are added to the 338-module rectangle and
plane checkpoint: seven complete CUT modules and seven line-size foundation
modules. The accepted import closure and replay list agree exactly on
352 proof modules and two roots. Every inherited proof source matches its
previous receipt, and every new proof source matches the component source,
axiom, and independent kernel checks recorded above.

Before this merge, the 233-module CUT/line-size snapshot passed a fresh
strict root compilation and the complete 9,035-theorem ownership audit.
The root compilation took 311.6 seconds; the audit took 677.8 seconds.
These checks and the separate 338-module rectangle/plane receipt establish
component coverage. The full 352-module hosted rebuild, combined audit,
and whole-package kernel replay remain a separate pending check.

The [integration receipt](cut-line-integration-receipt.json) records the
frozen accepted sources and both validation scopes. Unregistered line-size
and Motzkin candidates are excluded from the accepted roots and replay list.

## Graph theorem, runner families, and deterministic hyperplane registration

This checkpoint registers 27 additional proof modules and preserves the complete
rectangle/plane registration. The separately checked snapshot has 365 proof modules
and two roots. Its replay list matches that source-import closure exactly.

The all-order Graffiti.pc318 theorem and its sharpness example are complete.
The consecutive families for counts 2 through 14, both exceptional eight-speed
families, all three stated eight-speed product-family classifications, and the
listed higher-speed examples are registered components. The exact shifted
hyperplane maximum, attainment, and orthogonal-velocity upper bound are also
registered. The remaining runner classifications and hyperplane statistics
are not marked complete.

All 27 added modules passed their individual local Lake source gates. The
strict combined roots passed at a 4,500 MB allocation limit. The complete
warning-as-error ownership/axiom audit passed at 6,000 MB, checking **10,144**
project theorem declarations, including private declarations, and allowing
only `propext`, `Classical.choice`, and `Quot.sound`. The audit completed in
about 563 seconds and exited successfully.

The source-identical `base`, `product`, and `hyperplane` jobs in
[run 44451283261](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44451283261)
passed source builds, transitive axiom audits, and independent stock kernel
replay of their complete project closures. Their union covers every added
module. All 338 inherited proof-source hashes match the prior integration
receipt. The earlier 219-module accepted snapshot also passed its complete
hosted gate in run 44451283317. No interrupted broad local Lake build is
counted as a full build; the full merged hosted package gate remains a
separate check after this publication.

See the [source hashes and gate receipts](graph-family-hyperplane-integration-receipt.json).


## Concurrent registration union

The graph, runner-family, and deterministic-hyperplane registration is merged
additively with the 14 CUT and line-size modules from `5981218`. The accepted
import closure and replay list agree on **379 proof modules and two roots**.
All accepted proof sources match the union of the two component receipts.
The 365-module, 10,144-theorem local audit described above does not include
those 14 concurrent additions. Their checked scope is recorded separately
in the CUT/line-size receipt. A full 379-module combined source, axiom, and
kernel run remains pending; neither earlier receipt is relabeled as that run.
The five-speed candidates from `06747c7` remain outside the accepted roots.

## Erdős 607 geometry and analytic profile, 19 November 2026

`LineSize.exists_large_record_iff` proves both directions of the literal
real-plane realizability criterion. The construction provides actual
carrier lines, canonical distinct intersections, exact filling, and generic
padding, with no unintended three-point line. Ordinary-line existence and
the collinear case give `LineSize.lineSizeCount_eq_tupleCount` for every
natural n, including zero, one, and two.

The geometry job in [run 44456107859](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44456107859)
passed every source, the 342-theorem ownership audit, and unchanged pinned
kernel replay of all 20 project modules. The smooth Euler-kernel job in
the same run passed its 11-theorem audit and one-module kernel replay.

`LineSize.Profile.saddle_profile_exact` establishes the exact integral
constant, saddle at log 2, curvature 3, and the mean/variance identities
for the literal functions in the proof. The global Gaussian phase bound
is proved too. Its five-module closure passed local source checks, the
137-theorem ownership audit, and full independent kernel replay. The
integral constant is derived from the exponential series and the Basel
sum; no dilogarithm evaluation is assumed.

This registration adds 18 proof modules to the concurrent 379-module
checkpoint. The exact accepted closure is 397 proof modules and two roots.
Every added component has source-matched axiom and kernel coverage. The
full merged hosted build/audit/replay remains pending. The shared
`HaralambisFaces` lint repair also passed source, its complete 62-theorem
audit, and independent replay without changing any theorem statement.

See the [source-bound integration receipt](line-size-integration-receipt.json).
The formal generating function and corrected Euler-product sources remain
unregistered candidates. The Fourier local limit and the final asymptotic
prefactor are still being formalized; Erdős 607 is not yet complete.


## Complete four-speed gap and runner bound

The accepted package now contains `Loneliness.CoordinateSubspace.four_speed_gap`,
`four_speed_below_gap_value`, and `four_speed_lonelyRunnerBound`. For every
positive distinct four-speed list with value below `2/9`, the first theorem
identifies a positive scaling and permutation of `[1,2,3,4]` or `[1,3,4,7]`.
Both directions have value exactly `1/5`. The runner lower bound covers every
nonempty distinct positive list of length at most four.

The proof joins the unconditional coordinate cutoff 5,832 to the ten exact
prime residue covers and their exhaustive lifting certificates. It assumes no
unformalized four-speed theorem. The finite plane and five-speed reductions
can now use this proved gap input; their bounded five-speed classification is
still separate work.

The exact four-speed closure contains 84 project modules. Its ownership and
transitive axiom audit passed for 1,880 theorems, including private declarations.
The four aggregate modules passed fresh strict source checks and stock
independent kernel replay. A dependency-coverage check identified the separate
`LonelinessFourSpeedClassification` module; that module then passed its own
fresh strict source check and independent replay. Every other dependency has
an exact source-matched accepted or hosted leaf receipt.

This registration preserves the concurrent 18-module line-size addition and
adds 36 proof modules to its 397-module package, giving 433 accepted proof
modules and two roots. The import closure and replay list agree exactly.
Inherited sources match the line-size integration receipt or the subsequent
five-module profile gate, which passed at `65435fc` with a 120-theorem audit.
The proof-only `HaralambisFaces` lint repair is a shared four-speed dependency and
has separate fresh source, 62-theorem audit, and kernel checks; the earlier
84-module audit keeps its original source snapshot. These are component
receipts; a whole 433-module combined hosted pass is not asserted here.
See the [four-speed integration receipt](four-speed-integration-receipt.json)
and the [statement and proof map](../results/five-speed-spectrum/FOUR_SPEED_GAP_LEAN.md).

## General compact Motzkin equality, 19 November 2026

`Motzkin.compact_two_difference_theorem` proves equality of the actual
measurable-set density and continuous-character supremum for every compact
Hausdorff abelian group with Borel measurable space and a given invariant
probability measure. The two differences may be zero. The finitely generated
subgroup they generate need not be closed; no rank, cyclicity, or second
countability hypothesis is added.

[Hosted job 135345252509](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44460317093/job/135345252509)
checked all 34 project sources with warnings as errors, audited all 664 project
theorem declarations against the standard axiom whitelist, and replayed all
34 project modules through the pinned independent kernel checker. The source
and gate hashes remained unchanged. The exact artifact receipt is preserved
in [motzkin-compact-hosted-receipt.json](motzkin-compact-hosted-receipt.json).

This adds 22 proof modules to the concurrent 433-module accepted package.
The combined closure is 455 proof modules and two roots; its full merged
hosted gate remains pending. The
[integration receipt](motzkin-compact-integration-receipt.json) binds every
accepted source to this registration snapshot. The note's further rank,
cyclic, evaluation, and exact complexity claims remain separate candidates.

## Relation formulas, Euler correction, and finite tuple reconstruction

Three previously separate passing components are now registered. Their
statements retain the hypotheses in their exact source receipts.

| Component | Strict source closure | Theorem axiom audit | Independent kernel replay |
| --- | --- | --- | --- |
| Motzkin relation formulas and attainment | 39 modules | 729 theorems | 39 modules |
| Corrected finite Euler product | 8 modules | 122 theorems | 8 modules |
| Finite tuple/core/tail reconstruction | 9 modules | 307 theorems | 9 modules |

`Motzkin.rank_zero_density`, `rank_one_density`, and `rank_two_density`
evaluate the compact density for the relation data stated in each theorem.
`finite_relation_density_attained` constructs an actual Borel avoiding set
when two independent finite relations hold. The formulas take relation
generators as input. A theorem producing the appropriate generators for
every subgroup of the integer plane is still being formalized.

`LineSize.EulerKernel.finiteProduct_correction_exact` proves the literal
finite-product correction with its square-root factor. The accompanying
uniform bound controls the logarithmic error by a constant times the positive
scale on each fixed compact range of positive `r*t`. The proof includes the
Stirling remainder and a trapezoidal estimate for the smooth regular part.

The tuple component proves canonical reconstruction, exact cost weights, and
the identity relating cumulative and exact-cost formal series. It does not
yet establish the complete explicit generating function.

The new registration adds 13 proof modules to the 455-module package, giving
468 proof modules and two roots. All inherited proof source hashes match the
preceding registration. The full merged hosted gate remains pending.
See the [integration receipt](motzkin-relations-euler-tuples-integration-receipt.json),
[Motzkin receipt](motzkin-relations-hosted-receipt.json),
[Euler receipt](line-size-euler-correction-hosted-receipt.json), and
[tuple receipt](line-size-tuples-hosted-receipt.json).


## Exact generating function and cyclic Motzkin formulas, 19 November 2026

Both components passed strict source checking with warnings treated as errors,
the complete project-theorem axiom audit, and independent replay with the
unchanged pinned checker at `8da1d13a6d09a740bda9300205a22c2da2a5f03b`.
Their recorded source hashes match the registered sources.

| Component | Strict source closure | Audited theorems | Kernel replay |
| --- | --- | --- | --- |
| Exact coefficientwise line-size generating function | 14 modules | 496 | 14 modules |
| Cyclic Motzkin formulas and sharpness | 48 modules | 812 | 48 modules |

`LineSize.Generating.exactCount_formula` and
`one_sub_X_mul_tupleCountSeries_eq` identify the literal formal series from
canonical core encodings, including the exceptional small cores. The finite
product denominators are proved coefficientwise. Convergence at complex
arguments and the coefficient asymptotic remain separate candidate work.
See the [generating-function receipt](line-size-generating-function-hosted-receipt.json)
and [hosted job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44462991011/job/135354045624).

`Motzkin.Cyclic.finite_cyclic_theorem_all` covers every positive modulus;
`independenceNumber_gcd` proves the component scaling. The generated-case
Hermite basis and odd-closed-walk sharpness criterion are proved. For the
stated modulus 24 with jumps 3 and 4, the independence number is 9, the odd
girth is 7, the odd-cycle upper bound is 10, and no pair is sharp. Rational
circle density and abstract Borel attainment are also proved. The explicit
finite union of half-open intervals remains a candidate construction.
See the [cyclic receipt](motzkin-cyclic-hosted-receipt.json) and
[hosted job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44462990839/job/135354043741).

Registration adds six generating-function modules and eight cyclic modules,
giving 482 proof modules and two roots. The empty cyclic candidate wrapper
is omitted; four real imports cover all 47 real modules in its checked
closure. All 468 inherited proof source hashes remain unchanged. The
combined hosted gate is pending. The
[integration receipt](generating-cyclic-integration-receipt.json) records
all accepted source hashes and the component evidence.

## Full hosted verification of the 397-module checkpoint

The complete accepted-package workflow at
`42fff1a2f87955f29c25beb0d16f23d46e91b489` has now passed its source build,
10,843-theorem axiom audit, and independent pinned kernel replay of all
397 proof modules and both roots. The completion log is dated 19 November
2026 at 05:02:59 UTC. See
[run 44458108002](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44458108002)
and the [exact-commit receipt](full-397-hosted-receipt.json).
This historical receipt does not verify later source revisions or additions.

## Hosted replay of the four-speed integration snapshot

On 18 November 2026, [run 44459759725](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44459759725)
completed the full accepted-package gate at
`3349777d40eacc26df93df09dad3d95c0333e59b`. The source build passed, the
axiom audit checked 11,867 project theorem declarations, and stock Lean
4.35.0 replayed all 433 proof modules and both root modules. Only
`propext`, `Classical.choice`, and `Quot.sound` occurred in the audit.

The [machine-readable receipt](accepted-3349777-hosted-receipt.json) lists
every replayed module. Later registrations require their own merged hosted
receipts; this snapshot covers only the 433-module integration commit.


## Five-speed finite certificate checkpoint, 19 November 2026

All 260 scalar tables and 574 required canonical-plane candidates are now
published in 24 separately gated groups. Their complete hosted gates are
still running. The 29-module cached-root checkpoint at `108168d` passed its
full hosted source, axiom, and stock-kernel gate. The new packed selector
and oracle let the previously failing p1789 ordinary row compile locally.
The repaired map 26 and bounded block helper passed their local source,
axiom, and independent kernel gates. Eight new groups cover all 164 maps;
the final aggregate and complete root-prime coverage remain open. See
[the scoped checkpoint](five-speed-packed-bounded-candidates.md). Accepted
roots are unchanged, and Li remains last.


## Five-speed root candidate and component gates, 19 November 2026

The 227-module finite-assembly closure passed hosted source compilation,
the owned transitive axiom audit, and stock-kernel replay. Its coverage
hypotheses are still explicit. Five of the 24 scalar/plane groups also
passed their complete hosted gates. A complete p179 root candidate is now
published in 14 modules; only its cache, packed oracle, helper, and first
part have local source evidence so far. Its full hosted gate remains
pending. See [the exact scope](five-speed-root179-candidate.md) and
[component receipts](five-speed-receipts/hosted-component-index.json).


## Frankl counting components — 19 November 2026

Six proof modules were checked at `57d699c770471fc898850079bde384a269da5d4f` in
[run 44475531664](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44475531664).
All four component jobs rebuilt their exact source closures, audited all
113 project theorem declarations using only `propext`, `Classical.choice`, and
`Quot.sound`, and replayed all six kernel objects with the unchanged pinned
checker. The accepted root, required endpoints, and replay list now include
those exact modules. The full merged-package run is a separate gate.

This verifies the general local-certificate implication, actual graph
bijection, finite lopsided-conditioning theorem, and numerical inequalities.
It does not yet verify either complete Frankl result. See
[the scope and remaining obligations](frankl-formalization.md) and
[the exact hosted receipt](frankl-foundations-hosted-receipt.json).


## Frankl large-generator theorem — 19 November 2026

The full `k ≥ 15` theorem is checked: in every finite `k`-uniform generating family with exactly three generators through each point and pairwise intersections of size at most one, every point belongs to at least `657/1000` of the distinct unions, including the empty union. The cyclic span-four theorem and the `3 ≤ k ≤ 14` high-girth cases remain incomplete.

The exact 16-module closure at `663f72751f7cfb13e533050985072e59204cbd26`
passed strict source checking, a 231-theorem transitive axiom audit, and
independent kernel replay in [job 135402205987](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44477677129/job/135402205987).
The only allowed axioms are `propext`, `Classical.choice`, and `Quot.sound`.
The probability estimates, lopsided dependence, query independence, and
bijection with actual distinct unions are all proved internally. Thirteen
additional modules are registered here. The full merged-package gate is
separate from this exact component receipt.
See [the source-hash receipt](frankl-large-hosted-receipt.json).

## Hadamard automorphism arithmetic

The arithmetic and integral-basis coefficient component passed its exact hosted
checks at `56cb125ec61bbac0d95d2dba9a2099b42a242d78`: strict compilation of
five local modules, a transitive axiom audit of 38 project theorems, and an
independent replay of all five modules with the unchanged pinned kernel.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44478301527/job/135404210981) ·
[Exact receipt](verification/hadamard-automorphism-arithmetic-56cb125e.json).

The accepted source files are `HadamardAutomorphismArithmeticBasic`,
`HadamardAutomorphismArithmetic`, `HadamardAutomorphismArithmeticRational`,
and `HadamardAutomorphismCoefficients`. They prove order 239 for the residue
of 599 modulo 479; the absence of the required integer and rational norm
representations; the exact fifth-power norm witness; and coefficient
congruences in the full ring of integers of the 479th cyclotomic field.
The arithmetic certificate uses ordinary kernel reduction, with no native
computation axiom. The permitted transitive axioms are only `propext`,
`Classical.choice`, and `Quot.sound`.

The full signed-automorphism obstruction and the independent ideal-class proof
are checked below under [issue 21](https://github.com/1337isnot1337/solved-conjectures/issues/21).
Hadamard existence at 2396 remains open.

## Hadamard automorphism Fourier component

At `ee1be6e0e00c49beadf5f3a563473f86346bf618`, the six-module Fourier
candidate closure passed strict compilation, a 32-theorem transitive axiom
audit, and independent pinned-kernel replay with unchanged sources.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44479208216/job/135407227160) ·
[Exact receipt](verification/hadamard-automorphism-fourier-ee1be6e0.json).

The five proof files `HadamardAutomorphismBinary`,
`HadamardAutomorphismDeterminant`, `HadamardAutomorphismFourier`,
`HadamardAutomorphismIndicator`, and `HadamardAutomorphismDeterminantNorm`
are registered. They construct the literal character embedding and Fourier
matrix, prove the inherited Gram equation, replace sign entries by their
negative-position indicators, and prove determinant divisibility and the
norm 599³ quotient from the stated residue obstructions. The binary overlap
lemma is also checked. These general components are connected to the actual signed Hadamard
automorphism theorem by the completed assembly below.


## Hadamard automorphism permutation component

At `e9a9bb45e2935112239380212b5977dd5fca2a2b`, the seven-module
permutation closure passed strict source checks, a transitive axiom audit of
100 project theorems, and independent replay with the unchanged pinned kernel.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44480689737/job/135412036944) ·
[Exact receipt](verification/hadamard-automorphism-permutation-e9a9bb45.json).

The six registered proof files are `HadamardAutomorphismPermutation`,
`HadamardAutomorphismPermutationMatrix`, `HadamardAutomorphismFixedPoints`,
`HadamardAutomorphismPermutationCycles`, `HadamardAutomorphismPermutationIntegral`,
and `HadamardAutomorphismGroupBasic`. They normalize an odd-order signed
permutation by explicit diagonal signs, derive one fixed index and five
479-cycles in each permutation at order 2396, construct compatible cyclic
labels, and transport the real sign matrix into a number field's ring of
integers. They also construct the full signed row/column automorphism subgroup.
The completed assembly below proves that its order is coprime to 479. This
permutation component alone does not prove that obstruction.


## Hadamard quadratic field and class-order component

At `ae7871fc31c478e00b0c1f2778e707081c1af9a2`, the class-order
closure passed strict source checks, a transitive axiom audit of 111 project
theorems, and independent pinned-kernel replay of all nine local modules.
The source files and verification inputs remained unchanged during the checks.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44483833039/job/135422470403) ·
[Exact receipt](verification/hadamard-automorphism-class-order-ae7871fc.json).

Six additional files are registered: `HadamardAutomorphismClassGroup`,
`HadamardAutomorphismCyclotomic`, `HadamardAutomorphismCyclotomicGauss`,
`HadamardAutomorphismCyclotomicQuadratic`, `HadamardAutomorphismQuadraticNorm`,
and `HadamardAutomorphismClassOrder`. They construct the actual Frobenius and
quadratic fixed field, a generator whose square is −479, and a quadratic model
whose algebraic norm is the required quadratic form. They exclude absolute
norm 599 for quadratic integers. The explicit fifth-power norm witness then
constructs a prime ideal above 599 with norm 599 and proves that its ideal class
has exact order five. The proof establishes principality of the fifth power
and nonprincipality of the prime itself.

This earlier component constructs such a prime. The stronger universal
prime-pair and independent relative-ideal-norm results have since passed the
separate checks recorded below, as has the full signed-automorphism theorem.


## Hadamard cyclotomic norm obstruction

At `7098a0e8dccd5273be61bdb4108529dbcd169544`, the twelve-module
cyclotomic closure passed strict source checks, a transitive axiom audit of
128 project theorems, and independent replay with the unchanged pinned kernel.
The source files and verification inputs were unchanged throughout the checks.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44485841643/job/135429136270) ·
[Exact receipt](verification/hadamard-automorphism-cyclotomic-7098a0e8.json).

Five more proof files are registered: `HadamardAutomorphismCyclotomicCharacter`,
`HadamardAutomorphismCyclotomicPrimes`, `HadamardAutomorphismDescentIdeals`,
`HadamardAutomorphismDescentUnits`, and `HadamardAutomorphismDescent`.
They construct the integer-valued primitive character and prove that the two
primes above 599 are distinct, conjugate, and unramified, with intersection
equal to the principal ideal generated by 599. Frobenius fixes those primes.
For a hypothetical integer of conjugate norm 599³, the proof constructs the
Frobenius unit ratio, proves it is a root of unity, removes its sign, and twists
the integer into the actual quadratic fixed field. The checked quadratic norm
exclusion then proves `cyclotomic_norm_cube_impossible`. No descent or norm
obstruction is assumed as a hypothesis.

The completed signed-matrix assembly and independent class-group proof are
recorded below. The additional uniqueness and exact integer-coordinate
endpoints are checked in the final component below. Hadamard existence at 2396 is not asserted.


## Complete Hadamard order-479 automorphism obstruction

At `fb6b6e068efa37c5b5834b8f969211c951cac2d5`, the assembly closure
passed strict source checks, a transitive axiom audit of 297 project theorems,
and independent pinned-kernel replay of all 28 local modules. Source and gate
hashes matched the published snapshot and remained unchanged during checking.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44486671857/job/135431911100) ·
[Exact receipt](verification/hadamard-automorphism-assembly-fb6b6e06.json).

`HadamardAutomorphismAutocorrelation`, `HadamardAutomorphismMatrixObstruction`,
`HadamardAutomorphismMain`, and `HadamardAutomorphismGroup` complete the chain.
Starting from any real matrix with Mathlib's `Matrix.IsHadamard` predicate and
index-set cardinality 2396, the proof normalizes the signed symmetry, derives
one fixed point and five 479-cycles, reindexes the actual matrix, constructs
the indicator Fourier matrix, proves nonzero reductions at both primes, and
constructs an integer of the forbidden conjugate norm 599³. No symmetry
normal form, Fourier identity, prime nonvanishing, or norm obstruction is an
extra input to the final theorem.

The registered endpoints include `hadamard_signed_pair_order_ne_479`,
`isHadamard_automorphism_card_not_dvd_479`, and
`isHadamard_automorphism_quotient_card_not_dvd_479`. The group carrier contains
all signed row/column permutation pairs preserving the given matrix. The
quotient statement holds for the coset cardinality of every subgroup, and
therefore covers the common-sign quotient.

This completes the automorphism theorem. The sequence restrictions and
fixed-border construction remain separate obligations. The later fixed-border
symmetry result is completed in the section below.

## Complete independent ideal-class norm obstruction

At the same snapshot, the independent class-group closure passed strict
sources, a 164-theorem transitive axiom audit, and independent pinned-kernel
replay of all 15 local modules, with unchanged sources and gate inputs.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44486671857/job/135431911435) ·
[Exact receipt](verification/hadamard-automorphism-class-alternative-fb6b6e06.json).

Five additional files are registered: `HadamardAutomorphismClassArithmetic`,
`HadamardAutomorphismClassPair`, `HadamardAutomorphismNormFactorization`,
`HadamardAutomorphismQuadraticIntegers`, and `HadamardAutomorphismRelativeNorm`.
Every prime above 599 in the actual quadratic fixed field has norm 599 and
ideal-class order five. The proof constructs the distinct conjugate pair and
its inverse classes. A hypothetical integer of conjugate norm 599³ gives a
principal ideal factorization with exponents a+b=3. The relative ideal norm
has residue degree 239 and forces the class exponent 239(a−b) to vanish,
contradicting the order-five calculation. The endpoint
`cyclotomic_norm_cube_impossible_by_class_group` does not import or call the
unit-descent norm obstruction.

The final quadratic-model component below brings the union of registered
Hadamard automorphism proof source modules to 37.


## Complete quadratic integer model

At `0a1deef73d38965fc62e0d42070450079fec850a`, the expanded
cyclotomic closure passed strict sources, a 157-theorem standard-axiom audit,
and independent pinned-kernel replay of all 16 local modules. The checked
sources and verification inputs remained unchanged.
[Hosted check](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44487424755/job/135434449472) ·
[Exact receipt](verification/hadamard-automorphism-quadratic-model-0a1deef7.json).

`HadamardAutomorphismQuadraticUnique` proves that every degree-two intermediate
field of the actual cyclotomic extension is the constructed fixed field, and
identifies it with the field generated by the explicit square root of −479.
`HadamardAutomorphismQuadraticConverse` proves that an element of that field
is integral over the integers if and only if it has the form
(a+b√(−479))/2 with integers a,b of equal parity. The converse uses the monic
polynomial T²−T+120 for the half generator. Both files are registered.

Together with the preceding components, this checks the full automorphism
note, including both norm-obstruction routes and its stated quadratic-field
model. The separate sequence and border notes remain incomplete.

## Frankl local certificate checkers — 19 November 2026

The accepted package now includes `FranklLocalCertificate` and
`FranklLocalMaximalCover`. The first checker tests every boundary pair
`M ⊆ E ⊆ B`. A successful nonzero nonnegative integer weight vector gives
an abundant point in the actual family of distinct unions.

The maximal-cover checker is proved equal to the first checker. For each
inside pattern, it uses the union of all local generators contained in the
allowed inside and exterior set. It therefore avoids enumerating every local
union without changing the compatible-pattern count.

The exact five-module closure at `ad07e385` passed strict source checks, an
explicit import-all audit of 66 project theorems, all eight required endpoint
checks, and the unchanged pinned kernel replay.
[Hosted receipt](verification/frankl-maximal-cover-ad07e385.json) ·
[Scope and reproduction](frankl-fc-formalization.md#local-maximal-cover-checker).

This registration asserts no finite window weight certificate. The cyclic
window data, graph reduction, and complete span-four assembly remain separate.
The full merged-package gate is also separate from this exact component check.

## Frankl FC and small cyclic components — 19 November 2026

The accepted package now contains the full Vaughan shortcut. Every finite
union-closed family containing three distinct triples through a common point
has an abundant point in the union of those triples. The proof has no ambient
ground-size restriction and does not assume that the family contains the
empty set. Classification, integer certificates, and finite-support transport
are all proved in Lean.

Every nontrivial cyclic span-four generator family on at most six sites also
has an abundant point. The proof permits arbitrary generator sizes and cyclic
overlaps. It uses exact search trees, the Vaughan shortcut, a Pasch certificate,
and the two-point shortcut.

Further checked results concern the specified 35-edge residual graph. Its
period-seven, period-eight, and period-ten words are zero. Every nonzero
period-nine word generates a family with an abundant point. These statements
retain explicit residual-graph membership. The reduction of arbitrary larger
cyclic families to that graph still needs its finite window and rank data.

At source snapshot `6544adcc`, the exact 53-module closure passed strict source
checks, an import-all audit of 2,057 project theorems, 56 required endpoint
checks, visibility checks for all 534 private certificate nodes, and stock
kernel replay of every module. The 50 newly registered sources match that
snapshot byte for byte.
[Hosted receipt](verification/frankl-fc-packet-6544adcc.json) ·
[Detailed scope and reproduction](frankl-fc-formalization.md).

The complete span-four theorem and the small-degree high-girth theorem remain
incomplete. The full merged-package gate is separate from these component
checks. Li remains deferred.

## Frankl mask checker and exact domains — 19 November 2026

The accepted package includes `FranklLocalMaskCertificate` and
`FranklLocalMaskDomains`. The mask checker decodes the actual finite generator
family and counts each compatible inside set once. Its domain constructor
proves the exact inside and boundary powersets, including code bounds and
absence of duplicate inside codes. Literal quotient masks can therefore be
checked without assuming an injective unwrapping map.

At `a632fc82`, all ten sources passed strict checking, an import-all audit of
163 project theorems, all 38 required endpoints, and stock kernel replay of
every module. The two newly registered sources match that snapshot exactly.
[Hosted receipt](verification/frankl-mask-domains-a632fc82.json) ·
[Scope and reproduction](frankl-fc-formalization.md#local-mask-checker-and-domains).

This registers reusable checker semantics. The full finite weight collection
and graph/rank tables remain separate obligations. The complete span-four
theorem remains incomplete, and the full merged-package gate is separate.

## Complete fixed-border multiplier and orbit bounds

The exact source snapshot `682d0917b1cf7cfbe3bee2e003e1df0735b23d0f`
passed strict source compilation for all 12 modules, a transitive standard-axiom
audit of 216 project theorems, and independent replay by the unchanged pinned
kernel checker. The receipt records every source, toolchain, manifest, and
gate hash. All registered proof sources match that snapshot.
[Exact receipt](verification/hadamard-border-transfer-682d0917.json) ·
[Hosted gate](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44492941039/job/135452942122).
The product-domain assembly also has its own ten-module, 154-theorem receipt
at `2006a76a`.
[Product-domain receipt](verification/hadamard-border-main-2006a76a.json).

The hypotheses are the actual four sign rows on an arbitrary finite abelian
group `G`, a subgroup `S` of cardinality 149 and index four, and combined
periodic autocorrelation −12 on nonzero elements of `S` and 4 outside `S`.
The full group of additive automorphisms preserving those rows is cyclic
and has order dividing four. For every subgroup `U` preserving the rows,
its order also divides four and its actual action on `G` has at least 151
orbits. The group definition imposes no coordinate-form or subgroup-preservation
hypothesis on its automorphisms.

The strongest original-domain endpoints are
`symmetry_subgroup_card_dvd_four_on_subgroup149`,
`symmetry_subgroup_isCyclic_on_subgroup149`, and
`symmetry_subgroup_orbit_count_ge_151_on_subgroup149`. The corresponding
`common_multiplier_*_on_subgroup149` endpoints apply to the full actual group.
They are registered in the root import, required-theorem audit, and replay list.

The proof constructs `G ≃+ (G ⧸ S) × ZMod 149`, maps `S` exactly to the
second factor, and transports the actual rows, correlations, symmetry group,
and orbit quotient. The multiplier injection follows from raw compressed
correlations: energy 608 bounds every fiber sum by 24, while a nontrivial
quotient symmetry forces a weighted correlation 298 whose absolute value is
at most 48. An order-37 multiplier would force all 16 fiber sums to be signs,
contradicting that energy. The cyclic unit group has order 148, so Cauchy's
theorem leaves only group orders dividing four. The origin orbit and a small
nonzero four-torsion orbit then give the 151-orbit bound.

This completes the final symmetry section of `BORDER.md`. The length-1197
and length-598 sequence restrictions, quotient/no-lift certificates, pattern
enumeration, and fixed-border matrix construction remain under issue 17.
The full merged-package gate is separate from this exact component check.
Hadamard existence at order 2396 remains open, and Li remains deferred.

## Frankl cyclic assembly and weight helpers — 19 November 2026

The accepted package includes the all-period span-four assembly with its
original eleven finite-check premises: eight graph, rank and literal-weight
checks, plus three actual short-period weight checks. The family transfer
retains arbitrary finite union-closed families and requires no empty member.
The theorem is still conditional; the concrete finite packet is unfinished.

The unchanged components passed five hosted proof jobs:

| Closure | Modules | Audited theorems | Private finite nodes |
| --- | ---: | ---: | ---: |
| Assembly and weight batches | 76 | 2,440 | 597 |
| Literal period-7/8/9 pilot | 25 | 378 | 24 |
| Word coverage | 1 | 22 | 0 |
| Exact injective transport | 23 | 371 | 0 |
| Cached mask evaluator | 10 | 155 | 0 |

Each job rebuilt its complete closure, audited every owned theorem with
explicit private imports, and replayed the exact closure with the unchanged
pinned stock checker. Only the three standard logical axioms are allowed.
The closures overlap; their union has 86 modules. This registration adds
32 unchanged proof modules, bringing the accepted set to 636 proof modules
plus two roots. The merged full-package gate remains separate.

The pilot checks only 16 original rows at each of periods seven, eight and
nine. The transport and caching theorems are generic. The 9,448-class orbit
dataset remains candidate data; it does not prove the full arithmetic,
transport or coverage tables.

[Assembly receipt](verification/frankl-span-four-77fa9a75.json) ·
[Pilot receipt](verification/frankl-cyclic-pilot-77fa9a75.json) ·
[Word-coverage receipt](verification/frankl-word-coverage-77fa9a75.json) ·
[Transport receipt](verification/frankl-mask-transport-5d86c291.json) ·
[Cache receipt](verification/frankl-mask-cached-5d86c291.json) ·
[Remaining finite work](frankl-cyclic-weight-orbits.md).

## Complete sharp 95-vertex example and arbitrary-voltage normalization

The seven `ErdosGyarfasSharp*.lean` modules prove the exact finite example in
`results/erdos-gyarfas-abelian-covers/sharpness.py`. The literal graph is a
connected cyclic nineteen-sheeted cover of the displayed subdivided tetrahedron.
It has 95 vertices, an explicit simple 32-cycle, and no simple cycles of lengths
4, 8, or 16. The endpoint `sharp95_cyclic_cover_and_least_power_cycle` states
that 32 is the attained least power-of-two cycle length.

The covering statement concerns the actual projection: every neighbor map is
bijective, and actual sheet translations act freely and transitively on each
fiber. Search soundness excludes actual graph cycles. Translation reduces
their starting points to five roots. Each complete root search is assembled
from its checked four-extension frontier and fourteen smaller kernel
computations, for seventy subtrees in total. The finite data, frontier
completeness, search semantics, and cycle witness are checked in Lean.
No native-evaluation axiom or external search result is a premise.

The two `ErdosGyarfasVoltage*.lean` modules normalize every assignment of
seven voltages in every abelian group. An explicit graph isomorphism
subtracts the tree potential from each sheet coordinate, making the four
tree voltages zero and giving three explicit chord voltages. It preserves
the existence of actual simple cycles of every specified length in both
directions. Normalized adjacency is expressed through a homomorphism from
`Fin 3 → ℤ`. The assignment `[0,0,0,0,1,8,0]` over `ZMod 19` is proved to
give exactly the sharp graph.

| Exact checked snapshot | Project closure | Audited project theorems | Receipt |
| --- | --- | --- | --- |
| `c6735b93` | Seven sharp-example modules | 288 | [Sharp example](verification/erdos-gyarfas-sharp-main-c6735b93.json) |
| `0cf8667d` | Four modules, including the actual base graph | 131 | [Voltage normalization](verification/erdos-gyarfas-voltage-normalization-0cf8667d.json) |

Both exact component closures passed strict source checking, the standard
transitive axiom whitelist, and independent replay with the unchanged pinned
kernel checker. The receipts bind the exact sources, toolchain, manifest,
and gate inputs. The universal theorem asserting a 4-, 8-, 16-, or 32-cycle
in every abelian cover remains under issue 18. The general minimum-degree-three
conjecture is outside this result. Li remains deferred.

## Fixed-border certificate transport

`HadamardFixedBorderTransport.lean` and `HadamardFixedBorderFin16.lean` prove
the reindexing and reflection step of `BORDER.md`. Their input is an explicit
finite certificate: sign matrices `K`, `E`, and `F`, their three Gram
identities, the balanced-column identity, and the cross identity. All five
identities and all three sign conditions remain input premises.

The formalization connects the canonical index `position + 4 * block` with
`Fin 4 × Fin 4`. For every finite additive quotient `Q` of cardinality four,
it constructs actual transported matrices on `Fin 4 × Q`, preserving
sign-valuedness and all five identities with the original corner `K`.
The left border uses the actual permutation `q ↦ -q`; the reflected cross
term is proved for those same matrices. Cardinality four supplies the
labeling equivalence. No splitting of the ambient group, classification
of order-four groups, or oddness assumption is needed.

The endpoint is `HadamardFixedBorder.exists_transported_matrices_of_card_four`.
Its exact two-module closure at `23b2b187` passed strict source checks,
a 66-theorem standard-axiom audit, and independent pinned-kernel replay.
[Receipt](verification/hadamard-fixed-border-fin16-23b2b187.json).
The literal finite certificate, derivation of the compression shapes, and
final bordered Hadamard construction remain separate obligations under issue 17.

## Actual row normalization from compression shapes

`HadamardBorderNormalizationTransportOps.lean` and
`HadamardBorderNormalizationTransport.lean` construct operations on the
original sign rows. Their inputs are a surjective additive map, one constant
compressed row, and three compressed rows with one exceptional coset of
jump `2` or `-2`. Deriving these shapes from the original autocorrelations
remains a separate obligation under issue 17.

The theorem constructs a row permutation, signs, and translations in the
original group. The actual transformed rows are
`f'_i(x) = ε_i * f_(σ(i))(x + t_i)`. Their compressions are exactly `d`,
`a + 2δ₀`, `b + 2δ₀`, and `c + 2δ₀`. Every transformed entry remains in
`{-1,1}`, and the combined periodic autocorrelation is unchanged at every
group element. The constant compressed row retains its baseline. No
positivity condition on `d`, split extension, or quotient-cardinality
premise is added. Surjectivity supplies the lifts that move the exceptional
cosets to zero.

The final endpoint is
`HadamardBorderNormalizationTransport.exists_normalized_sign_rows`.
Its exact two-module closure at `14ab84e7` passed strict source checks,
a 14-theorem standard-axiom audit, and unchanged pinned-kernel replay.
[Receipt](verification/hadamard-border-normalization-main-14ab84e7.json).

## Exact fixed character-window witness

The literal witness from the Motzkin note is now checked and registered.
For an actual measurable additive circle character \(\chi\), write
\(h=\min(\|\chi(a)\|,\|\chi(b)\|)\). The set
\(\chi^{-1}([0,h))\) is measurable, avoids both differences, and has measure
exactly \(h\) under the given invariant probability measure. The proof also
covers finite character images and \(h=0\); it does not replace the fixed
window by a separately shifted or abstract maximizing set.

The proof integrates an exact representative identity. For a general endpoint
\(0\le h\le1\), the measure lemma explicitly requires that \(h\) lie in the
character image. For the stated minimum-distance endpoint, an actual preimage
is constructed from one of \(a,-a,b,-b\), so the final witness theorem has no
extra endpoint-image hypothesis.

Required endpoints are `Motzkin.characterWindow_measure`,
`Motzkin.character_window_exact`, and
`Motzkin.continuous_character_window_exact`, together with the two underlying
representative identities recorded in the receipt. Three newly registered
modules extend the two already accepted foundations.

The exact five-module closure at
`fea6cba2091c38a7cca5561b039eac262f4a3f61` passed strict source checks,
a transitive audit of **53 project theorems**, and unchanged pinned-kernel
replay. [Passing job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44504300869/job/135494637842)
· [Exact receipt](verification/motzkin-character-window-fea6cba2.json).
All sixteen source and gate-input paths were compared with their frozen Git
blobs before registration and were unchanged. The receipt export independently
verified original artifact `14520517281`, whose ZIP SHA-256 is
`47e0b7df5fca6bd5efeabe514071a241841f6754def5100221fe9b26807ef8a8`.
[Receipt export](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44509280655/job/135508967148).

This is a component registration. The separate basis-existence, explicit
rational-interval, and evaluator obligations still prevent a complete
Motzkin-note status. The full merged package has its own verification run.
