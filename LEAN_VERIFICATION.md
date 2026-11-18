# Lean verification status

The shared package is in [`l-solitaire-limit-shapes/lean`](l-solitaire-limit-shapes/lean/).
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
| CUT arithmetic periodicity | Partial | Subset construction, checked minimization/refinement, exact binary addition and XOR, generic composition semantics, and the candidate graph DFA are formalized for all finite words. Connections to arbitrary legal pile groups, both mex emptiness certificates, exact least periods and the general decision test remain to formalize. |
| Li coefficient sign | Not formalized | Tree/partition certificates, chromatic symmetric functions, and the coefficient extraction remain to formalize. |
| Erdős 607 line sizes | Not formalized | Geometric realization, generating-function correspondence, and the local limit/asymptotic analysis remain to formalize. |
| Growing rectangles | Not formalized | Packing injection, partition estimates, and uniform asymptotics remain to formalize. |

## War

[`Conjectures/War.lean`](l-solitaire-limit-shapes/lean/Conjectures/War.lean)
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

[`Conjectures/Denominator.lean`](l-solitaire-limit-shapes/lean/Conjectures/Denominator.lean)
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

[`Conjectures/EgyptianTheorem.lean`](l-solitaire-limit-shapes/lean/Conjectures/EgyptianTheorem.lean)
proves `Egyptian.batista_admissible_congruence`, the exact statement of the note:
for every positive admissible `k` with `k % 5 != 1`, there exists a strictly
ordered solution that is lexicographically first and uniquely maximizes the
last denominator. `batista_congruence` also proves existence for every `k >= 3`
in those classes, and admissibility is proved to force `k >= 3`.

The original [`Egyptian.lean`](l-solitaire-limit-shapes/lean/Conjectures/Egyptian.lean)
proves integrality of the strict-greedy construction. The new
[`EgyptianBounds.lean`](l-solitaire-limit-shapes/lean/Conjectures/EgyptianBounds.lean)
proves the all-size competitor bounds, including the modular improvement in
the immediate-neighbor case. A concave quadratic proves positivity throughout
the unbounded interval; explicit endpoint polynomials have positive
coefficients after shifting the first denominator by 20.

[`EgyptianFinite.lean`](l-solitaire-limit-shapes/lean/Conjectures/EgyptianFinite.lean)
checks every small `k < 100` by kernel reduction. Its soundness theorem derives
complete bounds on both enumerated denominators from the fraction equation,
then derives the third denominator exactly by integer division. The certificate
checks ordered existence and unique maximality; it is not used as evidence for
an unbounded claim. The infinite regime and the finite regime are combined in
`EgyptianTheorem.lean`, which also proves the lexicographic conclusion.

Chu's best-two-term theorem is not a hypothesis of either completed theorem.

## CUT Family B

[`Conjectures/CutFamily.lean`](l-solitaire-limit-shapes/lean/Conjectures/CutFamily.lean)
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
cd l-solitaire-limit-shapes/lean
lake exe cache get
cd ../..
scripts/verify_lean.sh
```

The script rebuilds all sources, runs `ProofAudit.lean`, and rechecks the proof modules using `leanchecker`. The CI workflow runs the same script.
`ProofAudit.lean` checks every theorem in all project namespaces, including
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

The Python producer `cut-arithmetic-periodicity/generate_lean_certificates.py`
is untrusted: it produces data that Lean checks. Its intermediate JSON archive
is reproducible and ignored; the checked Lean certificate is versioned. Other
produced automata do not count as proofs until their refinement and arithmetic
semantics are checked. The complete game-period claims remain open.

`BinaryComposition.lean` proves the exact language semantics of addition/XOR
composition in both directions, including safe pruning of rejecting sinks.
Every accepted composed word is decoded to accepted component words with the
actual numerical addition and XOR equations, and every such compatible column
sequence produces a composed path. Fixed-width padding and its connection to
arbitrary pile groups remain part of the unfinished game proof.

## Binary-semantics checkpoint, 18 November 2026

The full package including the four graph/arithmetic foundation modules passed
all kernel rechecks. The added generic composition module then passed its
source build, kernel replay, and a refreshed whitelist audit over 724 project
theorem declarations. The detailed continuation plan and measured certificate
performance limits are in `cut-arithmetic-periodicity/LEAN_PLAN.md`.

The [two distance-graph results](distance-graph-densities/PROOF.md) have written proofs and executable finite verifiers. The [classification for every parameter](distance-graph-densities/CLASSIFICATION.md) extends both families. Their Lean formalizations are pending.
