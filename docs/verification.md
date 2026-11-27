# Verification

## Replaying the catalogue’s finite checks

Run each linked Python file from the repository root. These checkers use the standard library. The [Lean status table](lean-status.md) gives the exact scope and verification receipt for each formalized result.

| Subject | Checks |
| --- | --- |
| Planar geometry and finite incidence | [Pinned distances](../results/erdos-general-position-pinned-distances/verify.py) · [Point-degree spectrum](../results/erdos-gyarfas-point-degree-spectrum/verify.py) · [Planar degree repetition](../results/gyarfas-planar-degree-repetition/verify.py) · [Blocking pencils](../results/asgarli-ghioca-yip-blocking-pencil/verify.py) |
| Designs, graphs and codes | [Steiner triple system sails](../results/steiner-triple-system-sail/verify.py) · [Tomdif’s seven circular-index certificates](../results/circular-index-upper-half-remaining-deltas/verify.py) · [Constant-weight write-once codes](../results/constant-weight-strong-wom/verify.py) |
| Polynomial roots and positivity | [Fuss–Narayana matrices](../results/wang-yang-fuss-narayana/check.py) · [Unscaled Narayana rows](../results/zeng-unscaled-interlacing/check.py) · [Transportation polytopes](../results/alexandersson-transportation/check.py) · [Graphical dist](../results/alexandersson-graphical-dist/check.py) |

## Dilcher–Kidwai–Tomkins’s Stern-polynomial conjecture

The [four-module partial](../results/stern-half-plane/FORMALIZATION.md) verifies the actual Stern recurrence and polynomial evaluation, the Schinzel identity, all-odd-index run coverage, and nonvanishing for every positive index under an explicit common-parabola hypothesis. All strict source builds, the owned/private audit of 134 declarations (105 theorems, 14 private declarations and eight required endpoints), and exact stock replay passed. The [independent review](../results/stern-half-plane/LEAN_REVIEW.md) and [receipt](verification/lean-stern-half-plane-partial-20261124-162051/receipt.json) preserve the exact scope. The near-one estimates, compact certificate and separate exterior proof remain unformalized; count zero.

## Hartke–Stolee–West–Yancey matching-excess conjecture

The [eight-module checkpoint](../results/hartke-stolee-west-yancey-matching-excess/FORMALIZATION.md) proves binary-weight subadditivity, the sparse Mersenne-division bound, actual split-graph matching and path-permutation bijections, the return-path counting formula, and the base-edge cardinality. All eight strict builds, the all-owned audit of 179 declarations (152 theorems, 19 private declarations and ten required endpoints), and exact stock-kernel replay passed. [Receipt](verification/lean-hartke-matching-excess-partial-20261124-162051/receipt.json). The graph witnesses, extremal constants and tail-minimum divergence remain unformalized. This is incomplete and contributes zero complete results.

## Németh–Seberry–Shu conjecture

The [target receipt](verification/lean-nemeth-seberry-shu-20261124/receipt.json)
covers the two-module closure, all 49 owned declarations (37 theorems), and six
required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` occur
transitively. The target check does not report the combined repository gate as
passed. The [scope audit](../results/nemeth-seberry-shu/LEAN_STATUS.md) records the
missing analytic construction and the exact source argument.

Reproduce with the pinned dependencies installed:

```bash
python3 scripts/verify_lean_target.py \
  --root Conjectures.NemethSeberryShuCounting \
  --require NemethSeberryShu.permanent_modEq_card \
  --require NemethSeberryShu.card_eq_of_permanent_eq \
  --require NemethSeberryShu.row_family_count \
  --require NemethSeberryShu.dense_family_count \
  --require NemethSeberryShu.eventually_superlinear_of_dense_families \
  --require NemethSeberryShu.no_eventual_linear_bound_of_dense_families \
  --out .candidate-artifacts/nemeth-seberry-shu
```

## Complex BSS separation research

The [full-decider soft compiler](../research/complex-bss-p-vs-np/FULL_DECIDER_SOFT_COMPILER.md) and its conditional supplied-denominator extraction have two full internal written reviews. The integrator checked all fixed-input germs, charged tape/control size, shared fraction clearing and the elementary root-persistence proof. The extended soft tests and irreducible coefficient-tensor calculation are separately proved and reviewed. The finite checker below additionally tests the exact replacement formulas, inactive division, generic-prefix identities, moving-pole denominator and coefficient ranks for D=4,8,16. These checks do not provide the missing denominator normalizer, establish a field-hypothesis transfer, or verify the full separation. No Lean file changed.

Run `python3 research/complex-bss-p-vs-np/verify_obstructions.py` from the repository root with SymPy installed. The checker validates symbolic Ryser identities for sizes 1–3, interpolation counterexamples, the single-triangle quotient norm, selected jet-masking identities, and two-by-two matching/strategy examples. Its [review record](../research/complex-bss-p-vs-np/REVIEW.md) separates these finite algebraic checks from the arbitrary-size written arguments and the imported circuit lower bound. It does not prove `P_C != NP_C`. No Lean source changed and no local Lean verification of these deductions is claimed. The later singular-witness, dense-boundary, and hypersurface-degeneration arguments were checked by separate internal reviewers as written mathematics. Their analytic and algebraic-geometric steps are not covered by the finite symbolic checker; see the review record for the precise hypotheses and source dependencies.

The later Boolean-potential certificate work has three additional finite checks:

```bash
python3 research/complex-bss-p-vs-np/verify_boolean_potentials.py
python3 research/complex-bss-p-vs-np/verify_canonical_potentials.py
python3 research/complex-bss-p-vs-np/verify_gradient_flow.py
```

The first uses SymPy to check bounded-rank potentials, full flip averages, Boolean quotient identities, and delta-path certificates on the cases listed in its output. The second checks the block-diagonal cancellation gadget and exact Cauchy recovery coefficients. The third uses exact integer and finite-field arithmetic to certify inconsistency of the stated gradient-flow ansatz at one explicit invertible 7 by 7 matrix: a 106 by 106 augmented minor is 64147 modulo the prime 1000003, while the ansatz has 105 unknown coefficients. These computations verify the stated identities and counterexample, not the general certificate lower bound.

The [critical-incidence argument](../research/complex-bss-p-vs-np/CRITICAL_INCIDENCE_BARRIER.md) has [two independent internal written reviews](../research/complex-bss-p-vs-np/CRITICAL_REVIEW.md) and an integrator review. Its component and differential argument, generic-matrix consequence, singular-witness dependency, and imported permanent lower bound are written mathematics. No Lean or external refereeing is claimed. The target separation remains unresolved.

The subsequent [finite-residual critical-point proof](../research/complex-bss-p-vs-np/REAL_KKT_RADICAL_EXTENSION.md) and [block extension](../research/complex-bss-p-vs-np/BLOCK_KKT_FINITE_EXISTENTIAL_EXTENSION.md) have explicit equations and witness/gate counts, with separate internal written reviews. They allow finite Boolean challenges and local complex existential witnesses; they do not cover arbitrary complex universal challenges. The [restricted-cofactor review](../research/complex-bss-p-vs-np/RESTRICTED_COFACTOR_REVIEW.md) records the reviewed jet arguments and the repaired specialization error. The bounded-counterexample cutoff has a complete two-case verification in its note. The tagged-trace construction has a complete digit-recurrence induction and free-basis specialization proof, independently reviewed in its own note. No numerical checks or Lean build are presented as verification of these new analytic arguments.

The continued [directional cofactor extraction](../research/complex-bss-p-vs-np/DIRECTIONAL_COFACTOR_LOG_JETS.md), [squarefree-cofactor bound](../research/complex-bss-p-vs-np/RADICAL_COFACTOR_JETS.md), [universal certificate equivalence](../research/complex-bss-p-vs-np/UNIVERSAL_CERTIFICATES.md), [recursive finite-prefix theorem](../research/complex-bss-p-vs-np/TREE_KKT_FINITE_PREFIX_EXTENSION.md), and [restricted continuous sampling](../research/complex-bss-p-vs-np/CONTINUOUS_NONDENSE_FIBER_SAMPLING.md) have separate internal written reviews linked from the campaign review record. Their bounds and counterexamples are proved in the notes; no finite numerical screen or Lean build verifies these general arguments. The main separation remains unresolved.

The [continuous finite-fiber attempt](../research/complex-bss-p-vs-np/SKEW_PRODUCT_MOVING_FIBER_ATTEMPT.md), [polynomial-support exclusion](../research/complex-bss-p-vs-np/SKEW_POLYNOMIAL_SUPPORT_EXCLUSION.md), [moving algebraic challenge lemma](../research/complex-bss-p-vs-np/MOVING_ALGEBRAIC_CHALLENGES.md), and [pole-cluster counterexample](../research/complex-bss-p-vs-np/RECIPROCAL_POLE_CLUSTER_OBSTRUCTION.md) have written proofs and internal reviews recorded in the campaign. The three-block verifier has only exponential-size completeness; the required polynomial bound remains open. An independent exact symbolic computation checks the finite relative-invariant cancellation example, not a growing-resultant lower bound. No Lean change or formal verification of these new arguments is claimed.

The [saturated-path and radical-jet note](../research/complex-bss-p-vs-np/SATURATED_PATH_RADICAL_JETS.md), [signed-multiplicity map](../research/complex-bss-p-vs-np/SIGNED_MULTIPLICITY_RATIONAL_MAP.md), [orbit-product obstruction](../research/complex-bss-p-vs-np/ORBIT_PRODUCT_COMPRESSION_ATTEMPT.md), and [auxiliary finite-fiber verifier](../research/complex-bss-p-vs-np/AUXILIARY_FINITE_FIBER_ATTEMPT.md) have complete written reductions and separate internal reviews linked from the campaign record. The radical-jet bound and polynomial completeness are explicitly unproved. Exact local counterexamples delimit the failed steps; they are not a computation of permanent complexity or a verification of the target separation. No Lean files changed in this checkpoint.

The marked-factor continuation has separate internal reviews of the [multiplicity encoding](../research/complex-bss-p-vs-np/MULTIPLICITY_MARKER.md), [resolvent and Hermite identities](../research/complex-bss-p-vs-np/RESIDUE_RESOLVENT_FRONTIER.md), [regular-value certificate attempts](../research/complex-bss-p-vs-np/REGULARITY_CERTIFICATE_ATTEMPTS.md), [direct regular-value obstruction](../research/complex-bss-p-vs-np/REGULAR_VALUE_GRAPH_OBSTRUCTION.md), and [square-zero socle/deformation](../research/complex-bss-p-vs-np/SQUARE_ZERO_SOCLE_AND_DEFORMATION.md). The [existential regularity extension](../research/complex-bss-p-vs-np/EXISTENTIAL_REGULARITY_SAMPLING_EXTENSION.md) has a full separate review of projective norm control, moving witnesses, scaled critical values and actual-component preservation. The [general Hermite-part counterexample](../research/complex-bss-p-vs-np/HERMITE_PART_OBSTRUCTION.md) has its own full algebraic review. The source audit retains the dense-versus-circuit and derivative-order distinctions. The aggregate circuit bounds are unproved. The general proofs rely on the cited written geometric lemmas; finite exact examples and Markdown rendering do not verify the full separation.

The [generic-quantifier audit](../research/complex-bss-p-vs-np/GENERIC_QUANTIFIER_SUMCHECK_AUDIT.md) and [rational-exactness argument](../research/complex-bss-p-vs-np/RATIONAL_EXACTNESS_BARRIER.md) have separate full internal reviews. Review checked original-prefix sampling, reached-mask validation, uniform construction costs and retained adaptive rounds; it also checked the residue identity, all-register division guard, actual graph incidence and quantitative generic primitive-size bound. The integrator read both proofs and the cited Koiran statements. These written deductions use the earlier geometric transfer lemmas. Finite symbolic residue examples and rendering checks do not verify their general lower bounds or the HN separation. No Lean source changed.

The [full-partition](../research/complex-bss-p-vs-np/FULL_PARTITION_CERTIFICATE_ATTEMPT.md), [stable-rewrite](../research/complex-bss-p-vs-np/STABLE_REWRITE_FRONTIER.md), [transcript](../research/complex-bss-p-vs-np/TRANSCRIPT_ESCAPE_EXAMPLE.md), [implicit-operator](../research/complex-bss-p-vs-np/IMPLICIT_SYLVESTER_FRONTIER.md) and [partial cutting compiler](../research/complex-bss-p-vs-np/CUTTING_COMPILER_ATTEMPT.md) notes have separate internal reviews linked from the campaign record. The cutting review repaired the scalar cost of finite slot selection. Its recurrence remains conditional and retains the missing plain-program interface, inherited-input and hypothesis-use steps. The inverse-jet example does not establish gcd hardness.

Run the additional finite exact checker with SymPy:

```bash
python3 research/complex-bss-p-vs-np/verify_branch_and_operator_identities.py
```

Its seven check groups cover the specified gluing, involution, transcript, small digit, double-pole gcd, compressed-matrix and modular-inverse-jet examples, plus local cutting identities with cancellation. They are finite symbolic checks, distinct from the written all-size and analytic arguments. No Lean build or verification of the target separation is claimed.

The [supplied-exclusion](../research/complex-bss-p-vs-np/SUPPLIED_EXCLUSION_SIMPLE_POLES.md) and [countable-range oracle](../research/complex-bss-p-vs-np/COUNTING_ORACLES_AND_CYCLIC_TRACE.md) notes have separate full internal reviews. The integrator read both proofs and rechecked the primary theorem directions. The same exact checker now has nine groups: its additions check a localized multiplicity remainder, finite log/exp normalized jets, and the uniform cyclic weighted trace for symbolic matrices through size three. Those computations do not prove the general oracle or jet bounds, and neither note establishes the missing HN reduction. No Lean source changed.

## Boolean Hamiltonicity research lemmas

Run these standard-library checks from the repository root:

```bash
python3 research/boolean-hamiltonicity/verify_layers.py
python3 research/boolean-hamiltonicity/verify_invariants.py
```

The first compares truth-table Möbius coefficients with cycle-family inclusion-exclusion, checks the two-extra-vertex restriction, and checks the sparse and monotone cutoff predicates and mixed-radix logspace algorithm on all graphs through four vertices. First-overlap counts are checked through six vertices. The second checks exact rational and finite-field ranks, gate bounds and every assignment of the Hamiltonicity module gadget through four modules. [Scope and review](../research/boolean-hamiltonicity/REVIEW.md) · [Local receipt](../research/boolean-hamiltonicity/CHECKS.json) · [Dedicated workflow](../.github/workflows/boolean-hamiltonicity.yml).

The general auxiliary lemmas have written proofs. The research target, an unrestricted superpolynomial Boolean circuit lower bound or uniform time lower bound, remains unproved. These scripts do not verify P != NP, and no Lean verification is claimed.

## Weighted counting for bounded-occurrence 3-CNF (conditional research note)

Run `python3 research/vp-vnp-bounded-occurrence-3cnf/verify_reduction.py` from the repository root. The verifier checks all primary assignments for n=3,4, plus clause width and maximum-three-occurrence properties through n=8. The proof of the projection is in [the note](../research/vp-vnp-bounded-occurrence-3cnf/README.md). The circuit lower bound is conditional on Anthropic's November 23, 2026 preprint and is **not** proved by the script or Lean. This note is not part of the solved-conjecture count.

## Steinke–Zakynthinou’s agnostic VC learning conjecture

The same workflow checks the [measurable local reconstruction theorem](../lean/Conjectures/AgnosticVC/LocalReconstructionMeasurable.lean), including the [iid rates for the circle-orbit class](../lean/Conjectures/AgnosticVC/OrbitIidRates.lean).

The [dedicated GitHub Actions workflow](https://github.com/1337isnot1337/solved-conjectures/actions/workflows/lean-agnostic-vc.yml) runs on proof and verifier changes pushed to or proposed against `main`. To reproduce it locally, run `python3 scripts/verify_agnostic_vc.py --fetch-cache` from the repository root with the pinned toolchain on PATH. The command builds the [combined theorem](../lean/Conjectures/AgnosticVC/Theorem.lean) and the [fixed-pairing theorem](../lean/Conjectures/AgnosticVC/FixedPairing.lean), elaborates the full project import closure with warnings as errors, checks the transitive axioms of its declarations and replays the compiled objects with the pinned Lean checker. The [receipt](../results/steinke-zakynthinou-agnostic-vc/verification.json) records the checks. The [proof supplement](../results/steinke-zakynthinou-agnostic-vc/PROOF.md#4-information-in-the-returned-hypothesis) gives the fixed-pairing argument. The [manuscript](../results/steinke-zakynthinou-agnostic-vc/paper.pdf) gives the original proof and its Lean correspondence. Section 6 proves two obstructions to Borel measurability. Their Lean counterparts are included in the same verification workflow.

## Steinke–Zakynthinou threshold proof

Lean verifies the proper real-threshold case with a Borel output kernel, an information bound of 300 nats using Mathlib KL, and an empirical bound against the full source class, including the threshold at infinity. The [review](../results/steinke-zakynthinou-thresholds/LEAN_REVIEW.md) identifies the exact mathematical and formal statements. The [receipt](../results/steinke-zakynthinou-thresholds/verification.json) distinguishes the kernel replay from the supplementary finite checks. The private-tag constants and the efficient and deterministic variants have separate written proofs.

Gröchenig’s upper-density result is excluded after a [checked earlier resolution](../research/bounty-continuation-2026-11-21/grochenig-prior-resolution/). Its independent proof and verification receipts remain in [immutable Git history](https://github.com/1337isnot1337/solved-conjectures/blob/628270dc5e07d7924de265d2ac1beee4b5634b80/docs/verification/lean-grochenig-20261121/receipt.json). The reused KVZ results remain active.

[Home](../README.md) · [Catalogue](../CONTENTS.md) · [Lean status](lean-status.md)

## Chen–Khare–Sahi stable Hall local verification

The twelve new modules and seven reused semiring modules form an exact
nineteen-module closure. All nineteen sources passed strict compilation.
The unchanged modern owned/private audit covers eleven modules; the
unchanged complete audit covers 1,489 declarations, 1,294 theorem declarations, 950 private declarations and all 42 required endpoints. Only `propext`,
`Classical.choice` and `Quot.sound` occur. Stock-kernel replay passed for
this exact frozen nineteen-module closure, including all 41 object parts.
The combined repository gate and hosted validation remain separate pending
checks.

The receipt preserves all source commands, raw strict logs and process metrics,
both current raw audit logs and their revalidated inventories, and the complete
stock-replay log. The frozen inventory includes nineteen sources, 33 modern
object parts and eight legacy public objects, the unchanged verification
helpers, pins, generated audits, gate runner and checker binaries. Legacy
private/server facets are required to be absent.

The ten earlier modern helper records contain source and all output-object
hashes plus imported-object hashes. They do not contain historical compiler,
control or dependency-source hashes; those are not invented. The fresh seven
legacy records and the two final single-module receipts include their recorded
pre/post source, dependency and control checks. The full gate independently
freezes and rechecks the complete current source/object closure.

The earlier sixteen-module compatibility receipt remains a separate
checkpoint. Its strict sources and owned/private audit passed, but its
fresh stock replay remains pending. This nineteen-module replay shares
only seven modules with that closure and does not certify its other nine
modules.

See the [stable-Hall receipt](verification/lean-cks-hall-20261121/receipt.json).

## KVZ complete local verification

The full gamma-quotient theorem has an exact 15-module closure. The [receipt](verification/lean-kvz-20261121/receipt.json)
records all strict source commands, frozen source and object hashes, the
complete owned/private audit, and stock-kernel replay. All 62 required
endpoints passed. The mathematical scope includes arbitrary real translated
node grids, every determinant order, the positive-integer cutoff, and the
parameter-dependent signature.

Historical Wronskian strict receipts are accompanied by a separately dated
post-build frozen inventory; unavailable pre-build hashes are not claimed.
Other historical records retain their actual source/public-object hash
coverage. The convolution records identify their source, direct dependencies,
and every object part. The complete gate freezes and replays all 45 object
parts. No source-only refresh is relabeled as an object rebuild.

The combined repository gate and hosted verification of this checkpoint
remain separate pending checks.

## Chen–Khare–Sahi compatibility checkpoint

All 16 existing modules passed fresh strict Lean 4.35 compilation with warnings treated as errors. The complete owned/private audit checked 1,454 declarations, including 1,254 theorem declarations, 816 private declarations and all 49 required endpoints. Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Independent stock-kernel replay of the revised closure and the combined repository gate remain pending. The README badge remains partial.

[Receipt](verification/lean-cks-compatibility-20261121/receipt.json) and [complete owned audit](verification/lean-cks-compatibility-20261121/audit.log). The current endpoints use the standard monic triangular Macdonald eigenfunctions. Stable Hall orthogonality followed by specialization is being formalized separately. The manuscript's literal truncated finite-variable Hall pairing conflicts with that convention; the [degree-three diagnostic](https://github.com/1337isnot1337/solved-conjectures/issues/201#issuecomment-7065320695) must be reconciled before claiming a full literal-source formalization.

## Chow complete local verification

The unweighted strict strengthening and its weak initial case have a checked 11-module closure. The positive-parameter extension remains written only.
The [receipt](verification/lean-chow-20261121/receipt.json) records every strict
source command, all source and object hashes, the complete owned/private
axiom audit, and exact stock-kernel replay. All 48 required endpoints passed.
The source bridge uses actual signed permutations and their descent statistic.
The combined repository gate and hosted verification remain separate.

## Oravcová–Soták local verification checkpoint

All nine new modules passed strict compilation with warnings treated as errors. The exact 28-module project closure passed an all-owned audit of 1239 declarations (1084 theorem declarations and 40 required endpoints) and independent stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. The [receipt](verification/lean-named-20261121/oravcova-receipt.json) binds the exact project sources and objects, the full declaration audit and the kernel replay. [Source records](verification/lean-named-20261121/oravcova-source-evidence.json) cover every new file. The [literal data comparison](verification/lean-named-20261121/oravcova-literal-data-comparison.json) independently matches the source certificate tables. `R5`–`R8` remain explicit inputs. The combined package gate and hosted validation are separate.

## Vishnyakova complete local verification

The original sampled-sequence and weighted root-radius theorems have a
checked 17-module closure. The
[receipt](verification/lean-vishnyakova-20261121/complete-receipt.json)
records source and object hashes, strict source commands, the complete axiom
audit, and stock-kernel replay. The audit covers all 439 declarations,
including 172 private declarations and all 66 required endpoints.
The independent checker replayed the frozen objects without changes.

This checkpoint proves the complete result-level assertions. The combined
repository gate and hosted verification of this checkpoint remain separate.

## Bernardi–Morales local verification checkpoint

The 13-module closure passed strict compilation with warnings treated as errors, an all-owned audit of 269 declarations (205 theorem declarations and 23 required endpoints), and independent replay by the pinned stock kernel. Only `propext`, `Classical.choice`, and `Quot.sound` are permitted. The [receipt](verification/lean-named-20261121/bernardi-receipt.json) records exact source/object hashes and toolchain pins; [source records](verification/lean-named-20261121/bernardi-source-evidence.json) preserve all 13 strict successes; the [kernel log](verification/lean-named-20261121/bernardi-kernel.log) covers the exact local module union. The scope is the full fixed-map tree and fixed-surjection event identities, including their source semantics. The combined repository gate is not claimed by this checkpoint.

## Ekhad–Zeilberger’s most unfair bet conjecture

Run `python results/ekhad-zeilberger-unfair-bet/verify.py`. It compares squared asymptotic advantages by integer cross-multiplication for all unordered pairs in the listed alphabet and word-length ranges. The all-length variance bound is in the [proof](../results/ekhad-zeilberger-unfair-bet/PROOF.md).

## Kauers–Koutschan recurrence conjecture

With SymPy 1.14 installed, run `python results/kauers-koutschan-recurrence/verify.py`. The checker substitutes the exact Schur sum into both published operators over a rational polynomial ring, verifies the initial indices separately, and compares the count with all permutations through length eight. [Proof](../results/kauers-koutschan-recurrence/PROOF.md) · [Checker](../results/kauers-koutschan-recurrence/verify.py)

## Circular-index local verification checkpoint

The main circulant theorems and C31/C33 regular examples have a checked 19-module closure. The [receipt](verification/lean-named-20261121/circular-receipt.json), [all-owned inventory](verification/lean-named-20261121/circular-all-owned-inventory.json), and [raw kernel log](verification/lean-named-20261121/circular-kernel.log) record the exact source/object hashes, compiler/checker pins, 171 required theorem endpoints, and replay of only that closure. The receipt distinguishes the individual strict source checks from the subsequent combined audit and replay. It does not attest to the complete shared-package gate or to the nonregular Section 7 certificates.

## Requirements

- Python 3.12, matching CI. The Hadamard audit uses NumPy. The Frankl window enumeration uses NumPy and SciPy. The Chow checks use SymPy 1.14.0.
- A C++20 compiler available as `c++` for distance-graph checks and the lonely-runner spectrum/equality verifiers. Some Python entry points compile and launch C++ programs themselves.
- For formal proofs: Lean and Mathlib pinned in [the shared Lean package](../lean/). Use its `lean-toolchain` and `lake-manifest.json`; do not substitute a different toolchain.

Run commands from the repository root with Python assertions enabled (do not use `python -O`). Keep the whole checkout: some verifiers reuse code in sibling result directories.

The [Hadamard order-2396 replay](../results/hadamard-2396/) compares the C++ output with the archived pairs and runs a separate Python audit.

The partial-result entries contain their replay commands for the [Frankl generator theorems](../results/frankl-generator-families/), [two-speed insertion](../results/lonely-runner-two-insertions/) and [abelian cover certificate and sharpness example](../results/erdos-gyarfas-abelian-covers/). Their current formalized scope and remaining dependencies are recorded in the [Lean status](lean-status.md).

## Analytic proofs without computation

The [Dospolova–Germanskov–Zaporozhets disproof](../results/dospolova-germanskov-zaporozhets/PROOF.md) is analytic throughout. The strict Gaussian-range argument applies to every nontrivial Gaussian-bounded compact, including bounded discontinuous processes; Vitale's published normalized intrinsic-volume limit excludes every sequence c^k/k! with positive c. Three [independent reviews](../results/dospolova-germanskov-zaporozhets/ROOT_REVIEW.md) check the separability argument, strictness and normalization. The source audit credits Vitale and Long, and actual image inspection resolved an OCR ambiguity in an earlier inequality. There is no numerical verifier or new workflow step for this proof.


The [Ferreira–Simon stochastic-order proof](../results/ferreira-simon-stochastic/PROOF.md) and [diagonal Mittag–Leffler proof](../results/ferreira-simon-diagonal/PROOF.md) establish their full real-parameter statements by integral identities and pointwise comparisons. Neither depends on numerical tests, finite enumeration or computer algebra. Their separate [stochastic audit](../results/ferreira-simon-stochastic/AUDIT.md) and [diagonal audit](../results/ferreira-simon-diagonal/AUDIT.md) reconstruct the argument and check normalization, domains, strictness and convergence. No new executable verifier or workflow test is assigned to these analytic proofs. Source and priority review are documented separately in each package.

The [Simon stable-infimum proof](../results/simon-stable-infimum/PROOF.md) is also analytic. Its [independent audit](../results/simon-stable-infimum/AUDIT.md) verifies the source normalization, prior Mellin transform, Brownian endpoint, positivity and parameter monotonicity of the logarithmic Lévy kernels, exponential integrability and independent mean-one multiplier. Conditional Jensen gives the full convex order. There is no numerical verifier or workflow test for this argument; the [source audit](../results/simon-stable-infimum/SOURCES.md) documents priority separately.

## Johnson's analytic proof and supplementary checks

The [Johnson proof](../results/johnson-pfaffian/PROOF.md) is a finite algebraic argument valid in every even order. Its use of Johnson's published additive-interval endpoint theorem is explicit. Three [independent mathematical reviews](../results/johnson-pfaffian/ROOT_REVIEW.md) check the complement scaling, cyclic Pfaffian signs, closure under deleting adjacent pairs, uncrossing, and nonnegative mixed-difference reconstruction. The separate [priority audit](../results/johnson-pfaffian/PRIOR_AUDIT.md) compares the exact source statement and seven public archives.

```sh
python3 results/johnson-pfaffian/verify.py
```

The standard-library checker uses exact rational arithmetic for supplementary identity and indexing checks. It explicitly records that finite checks do not prove the universal assertion. No Lean formalization is claimed.

## Analytic disproofs with supplementary exact checks

The [Brown–Mol disproof](../results/brown-mol/PROOF.md) establishes an infinite tree counterfamily by an analytic local zero argument. Its checker verifies exact polynomial identities, independently enumerates the connected vertex sets of three small trees, and proves a separate Rouché certificate for a 1001-vertex example. The finite checks are not the basis for the infinite-family conclusion.

The [Kovalev disproof](../results/kovalev-hardy-duality/PROOF.md) uses a supporting functional and analytic expectation bounds for every matrix order in its counterfamily. Its two independently written checkers verify the fixed rational comparisons in the proof, including the positive gap above the conjectured constant. They do not approximate Gaussian integrals or perform a finite-dimensional matrix search.

```bash
python3 results/brown-mol/check.py
python3 results/kovalev-hardy-duality/verify.py
python3 results/kovalev-hardy-duality/review_constants.py
```

All three scripts use only the Python standard library and exact integer or rational arithmetic. The packages contain independent mathematical reviews, root reviews, exact source statements, and current prior-resolution audits. No Lean formalization is claimed for either package.

## Computer-assisted proof of Roos–Seiringer's conjecture

The [Roos–Seiringer package](../results/roos-seiringer-kernel/) proves positivity of the radial Dirichlet kernel on the whole positive real axis, together with its continuous value at zero. Analytic arguments cover arguments at most one and at least forty. On the intervening interval, an analytic derivative bound transfers each exact midpoint enclosure to a whole closed interval.

```bash
python3 results/roos-seiringer-kernel/verify.py
```

The standard-library verifier uses only integers and rational numbers. It retains 160 series terms, encloses pi by signed Machin-series remainders, rounds every operation outward at 384 binary fractional bits, and adds the proved full series-tail allowance. The 184 successful closed intervals cover exactly [1,40], including shared endpoints. Independent full replays reproduce 367 evaluations, maximum subdivision depth eleven, the strictly positive margin in the [proof](../results/roos-seiringer-kernel/PROOF.md), and the [recorded output](../results/roos-seiringer-kernel/check-output.json). The computation is essential, not a finite sample of kernel values. Both [mathematical](../results/roos-seiringer-kernel/ALGEBRA_REVIEW.md) and [root](../results/roos-seiringer-kernel/ROOT_REVIEW.md) reviews passed; no Lean verification is claimed.

## Computer-assisted proof of Lyon's conjecture

The [Lyon package](../results/lyon-gamma-median/) proves the monotonicity assertion on the entire positive half-line. Its exact certificate is an essential part of the proof. Analytic bounds cover the two tails; the [written interval criterion](../results/lyon-gamma-median/PROOF.md) uses known convexity of the gamma median to extend each certified inequality throughout a real cell.

```bash
python3 results/lyon-gamma-median/verify.py
```

The standard-library verifier independently checks 4258 rational median brackets and 4256 cells covering exactly the interval from one tenth to seven. Every sign assertion uses 128-bit-scaled integer intervals with outward rounding, convergent series and explicit signed remainder bounds. The JSON data are proposed brackets, not trusted quantile values. Both independent full replays passed with minimum margin 38316221661991044002598352939471477 divided by 2^128. Typical replay time is one to two minutes. The package has no Lean formalization; the unformalized marker does not erase the essential role of the exact certificate.

## Computational checks

The [Chen–Khare–Sahi proof](../results/chen-khare-sahi-macdonald/PROOF.md) reduces every degree-six Muirhead-semiring representation to 38 displayed products and seven pure monomials. An exact rational functional is nonnegative on all of them and negative on the specified normalized Macdonald difference. This exhaustive reduction proves nonmembership in the full semiring. The [independent reviews](../results/chen-khare-sahi-macdonald/ROOT_REVIEW.md) also verify the rectangular-translate and continuous-parameter families.

```bash
python3 results/chen-khare-sahi-macdonald/verify.py
python3 results/chen-khare-sahi-macdonald/independent_cone_check.py
python3 results/chen-khare-sahi-macdonald/independent_orthogonality_check.py
```

All three scripts use only exact integers and fractions from the Python standard library. The main verifier checks the full cone, cleared-denominator Macdonald difference equations, and exact normalized separator value. The other scripts independently regenerate the cone values and derive both polynomials from the Hall inner product on all eleven partitions of six before specialization to three variables. Numerical linear programming was used only during discovery and is not a proof premise.


The [Ferreira–Simon beta-prime proof](../results/ferreira-simon-beta-prime/PROOF.md) is a complete analytic Mellin-transform argument for the full parameter range. Its [two](../results/ferreira-simon-beta-prime/ALGEBRA_REVIEW.md) [independent reviews](../results/ferreira-simon-beta-prime/ROOT_REVIEW.md) check the normalization, domains, positive-series interchanges, and uniqueness step. The standard-library script checks 18 exact identities in formal parameters; these are supplementary algebra checks, not a finite-parameter proof.

```bash
python3 results/ferreira-simon-beta-prime/verify.py
```


The [Han–Sabag–Kostina–Hassibi checker](../results/han-sabag-kostina-hassibi/verify.py) performs 16 exact rational and symbolic checks of the feasible Lyapunov solution, all four sparse power thresholds, the strict objective gap, the determinant factorization and the open family. SymPy supplies only symbolic identity checks. The [written proof](../results/han-sabag-kostina-hassibi/PROOF.md) supplies the exhaustive classification and full disproof.

```bash
python3 results/han-sabag-kostina-hassibi/verify.py
```





The [López Pouso–Segura node disproof](../results/lopez-pouso-segura-quadrature/PROOF.md) has an exact rational comparison at the two-point Gauss–Legendre rule and an all-large-even-degree argument from the Legendre differential equation. The [independent audit](../results/lopez-pouso-segura-quadrature/AUDIT.md) reconstructs the perturbation coefficients, the central normalization, the Gaussian weight conversion and the strictly positive fourth-order term, with analytic remainder justification. Symbolic consistency checks supplement the written proof; no finite root screen or Lean formalization is used.

The [Vishnyakova checker](../results/vishnyakova-root-radius/verify.py) uses SymPy for 73 exact algebraic checks of the generating recurrence, reflection, finite Vandermonde identity, tridiagonal characteristic polynomials, matrix quadratic estimate, reciprocal-segment crossing, and sharpness witness. The [written proof](../results/vishnyakova-root-radius/PROOF.md) covers every degree, every positive weight, and arbitrary independent parameters. The finite checks diagnose algebra and transcription errors; they are not the unrestricted proof.

```sh
python3 results/vishnyakova-root-radius/verify.py
```

The [Novelli–Thibon checker](../results/novelli-thibon/verify.py) independently converts permutation fundamental expansions to Schur coefficients using Kostka numbers. It checks all first-moment identities for 209 partition pairs and all 135 hook coefficients through size six, and exactly matches the source's printed polynomial. These finite checks verify conventions; the [written proof](../results/novelli-thibon/PROOF.md) establishes both identities for every size. The script uses only the Python standard library.

```bash
python3 results/novelli-thibon/verify.py
```

The [López Pouso–Segura checker](../results/lopez-pouso-segura-bessel/verify.py) checks exact polynomial and rational identities used by the analytic proof, with the square of pi treated as a formal variable. The full all-index signs, strict monotonicity, and limits follow from the [written argument](../results/lopez-pouso-segura-bessel/PROOF.md), which has two independent internal reviews. The checker uses only the Python standard library and performs no floating-point root screen.

```bash
python3 results/lopez-pouso-segura-bessel/verify.py
```

The [McCrea checker](../results/mccrea-single-crossover/verify.py) independently enumerates profile words and checks both generating-function rewrites and mean values. It uses only the Python standard library; the full parameter claim is proved in the accompanying note.

```bash
python3 results/mccrea-single-crossover/verify.py
```

The [Chen–Kitaev–Zhang verifier](../results/chen-kitaev-zhang-records/verify.py) checks exact polynomial identities, regenerates the sixteen certificates in the credited tail argument, and checks the class conventions by enumerating separable permutations through length eight. The new result is the full written all-length proof. The [Zhu verifier](../results/zhu-jacobi-stirling/verify.py) independently constructs sparse integer polynomials from the original recurrence and expands the complete determinant by permutations. It verifies the disproof identity, including its negative coefficient. Both scripts use only the standard library.

```bash
python3 results/chen-kitaev-zhang-records/verify.py
python3 results/zhu-jacobi-stirling/verify.py
```

The Fang–Zhang–Zhao infinite-log-convexity and Sun–Zhao iterated-ratio disproofs were already public before this campaign. Their duplicate result packages and computational workflow entries have been removed. The [priority correction](../research/campaign-20261121/PRIOR_RESOLUTION_CORRECTION.md) links the immutable prior proofs. Existing unique Lean modules are preserved, with their exact previously checked scope in [Lean status](lean-status.md#formalizations-of-previously-resolved-results). The separate prior Sturm reproof remains only as [credited research](../research/fang-zhang-zhao-sturm/).

These are the commands in [the verification workflow](../.github/workflows/verify.yml). They include finite tests, exact certificates, and exhaustive searches; their mathematical roles are explained in the corresponding proof notes. A passing computation is not a claim that a full theorem has been formalized.

The older Karp–Vishnyakova–Zhang Bessel-ratio unimodality package was withdrawn after [a complete earlier analytic proof](https://github.com/the-omega-institute/trureturing/issues/25199) was found. Its duplicate verifier and workflow step are removed. The [priority correction](../research/kvz-bessel-unimodality/PRIOR_RESOLUTION_CORRECTION.md) preserves the exact domain comparison and historical proof links.

The [Wright verifier](../results/ferreira-simon-wright/verify.py) checks
the general curvature identity as an exact polynomial in three variables,
its two parameter-polynomial specializations, and the displayed derivative
values. The [analytic proof](../results/ferreira-simon-wright/PROOF.md) supplies
the uniform convergence and whole intervals of counterexamples.

The [Wright Lean module](../lean/Conjectures/FerreiraSimonWright.lean) now proves
the original universal conjecture false through its continuous beta-zero
family, directly from the infinite series. Strict compilation, the full
owned-declaration axiom audit, and stock-kernel replay passed; the
[receipt](verification/lean-wright-20261121/wright-receipt.json) records the
exact source, objects, compiler, audit, and replay. The written positive-beta
refinements are not formalized, and the combined repository gate is pending.

The [gamma-quotient verifier](../results/kvz-gamma-quotient/verify.py)
uses exact rational arithmetic for 115 checks of half-integer determinant
signs, integer rank cutoffs, and gamma-moment normalization. The complete
all-order result follows from the [integral proof](../results/kvz-gamma-quotient/PROOF.md),
not from these finite diagnostics.

The [Fuss–Catalan verifier](../results/alexandersson-fuss-catalan/verify.py)
enumerates small paths directly to check the north/east convention and
both marked factors against the classical formula. Its all-parameter
real-rootedness proof is written separately and uses no numerical roots.

The workflow also regenerates the two compact CUT certificate sources with
`results/cut-arithmetic-periodicity/generate_weight_certificates.py` into a
temporary directory and compares them byte for byte with the checked-in files.
Generation alone does not check a proof. The accepted Lean workflow checks the
finite tables, their collision and lower-option interpretation, and both actual
recursive-game identities through `CutPeriodWeightTheorem`.

```bash
python3 -m pip install sympy==1.14.0
python3 results/ferreira-simon-wright/verify.py
python3 results/kvz-gamma-quotient/verify.py
python3 results/alexandersson-fuss-catalan/verify.py
python3 results/sagan-swanson-normality/verify_model.py
python3 results/bernardi-morales-delta/verify.py
python3 results/bernardi-morales-delta/verify_events.py
python3 results/gilmore-crossing-nesting/verify.py
python3 results/chow-conjecture/verify.py
python3 results/erdos-granville-pomerance-spiro/verify.py
python3 results/hornak-wozniak/verify.py
python3 results/sonntag-teichert/verify.py
python3 docs/nss/sanity_check.py --output /tmp/nss-sanity-results.json
python3 results/l-solitaire-limit-shapes/verify.py
python3 results/pham-denominator-degree/verify.py
python3 results/pham-denominator-degree/verify.py --dual --brute-depth 13
(cd results/pham-denominator-degree && python3 -m unittest discover -s tests -v)
python3 results/graffiti-pc-318/verify.py
python3 results/li-coefficient-sign/verify.py
python3 results/li-coefficient-sign/independent_check.py
python3 results/batista-egyptian-fractions/verify.py
python3 results/erdos-607-line-sizes/verify.py
python3 results/rectangle-partition-asymptotics/verify.py
python3 results/spivey-multiplayer-war/verify.py
python3 results/cut-family-b/verify.py
python3 results/cut-arithmetic-periodicity/verify.py
c++ -std=c++20 -O3 results/distance-graph-densities/verify.cpp -o /tmp/verify-distance-graphs
/tmp/verify-distance-graphs
python3 results/distance-graph-densities/counterexample.py
python3 results/oravcova-sotak/verify.py
python3 results/babai-spectrum-paths/verify.py
python3 results/two-difference-motzkin/verify.py
python3 results/symmetric-four-point-density/verify.py
python3 results/nonmixed-gap-packing/verify.py
python3 results/haralambis-three-differences/verify.py
python3 results/circular-index-upper-half-circulants/verify.py
python3 results/circular-index-upper-half-circulants/verify_part2.py
python3 results/circular-index-upper-half-delta-2-mod-4/verify.py
python3 results/circular-index-upper-half-delta-3-mod-4/verify.py
python3 results/five-speed-spectrum/verify.py
python3 results/tight-six-speeds/verify.py
python3 results/six-speed-spectrum/verify.py
python3 results/tight-seven-speeds/verify.py
python3 results/tight-eight-speeds/verify.py
python3 results/eight-speed-spectrum/verify.py
python3 results/seven-speed-spectrum/verify.py
python3 results/tight-eleven-to-fourteen/verify.py
python3 results/currie-conjecture-19/verify.py
python3 results/tight-nine-speeds/verify.py
python3 results/zhang-deletion-values/verify.py
python3 results/shifted-lonely-runner-counterexamples/verify.py --quick
python3 results/circular-index-complete-minus-edge/verify.py
python3 results/circular-index-complete-minus-edges/verify.py
python3 results/circular-index-complete-minus-edges/verify_seq.py
python3 results/wild-number-complete-graphs/verify.py
```

The latest workflow is the executable reference when new checks are added.

## Circulants in the upper half of the circular chromatic index

Run `python3 results/circular-index-upper-half-circulants/verify.py` and `python3 results/circular-index-upper-half-circulants/verify_part2.py` with assertions enabled. The first standard-library script checks the `(2n,3)`-edge-colourings of Theorem 1 for `g = 2..30` (partition into classes, matchings, the window condition per vertex and per window, `α' = (n-1)/2` and `|E|/α' = 2n/3`), the vertex connectivity `4g` for `g <= 8` with its own max-flow routine, and the `(75,4)`-edge-colouring and connectivity of Theorem 2. The second rebuilds every certificate of Section 7 from `data/part2_certificates.json` and checks that it is a perfect colouring of a simple graph with the stated `Δ` and `χ'_c`, and the connectivity of the regular circulants. The scripts in `review/` (which need `networkx`) and in `search/` (most need `python-sat`) are not run by CI. The [written proof](../results/circular-index-upper-half-circulants/PROOF.md) covers every `g >= 2`; no Lean verification is included.

## Graphs with circular chromatic index in the upper half for Δ ≡ 2 mod 4

Run `python3 results/circular-index-upper-half-delta-2-mod-4/verify.py` with assertions enabled. The standard-library script builds the base matchings of Section 3 for `6 <= g <= 60` (the `g = 6` base from `certificates.json`), checks their lengths, the partition of the circulant into `2n` classes, the windows of the base colouring and the two insertion blocks, and then checks for both final graphs simplicity, `Δ`, the `(p,3)`-colouring per vertex from the definition and `|E|/((n-1)/2) = p/3 = Δ+2/3`. Part 2 rechecks the `(3n-1,3)`-colourings of `K_n-tK_2` for `n = 11, 15, 19, 23, 27`, and five negative controls must be rejected. The referee scripts in `review/` are not run by CI; `indep_check.py` and `mut_test.py` need `numpy` and `networkx`. The [written proof](../results/circular-index-upper-half-delta-2-mod-4/PROOF.md) covers every `g >= 6`; no Lean verification is included.

## Graphs with circular chromatic index in the upper half for Δ ≡ 3 mod 4

Run `python3 results/circular-index-upper-half-delta-3-mod-4/verify.py` with assertions enabled. The standard-library script builds the base matchings and the three insertion blocks of Sections 4 and 5 for `15 <= g <= 60` and checks the claimed lengths. For each graph it checks that the base matchings are perfect on `W_0`, `W_1` with `2g` distinct lengths, that every block class is a matching on the vertex set it copies, simplicity, that the graph contains `C_n(S)`, `Δ = 4g+3`, `|E| = 2gn+9g`, the `(2n+9,3)`-colouring per vertex from the definition and `|E|/((n-1)/2) = p/3 = Δ+2/3`. It runs the same checks on the nine certificates of Proposition B (`6 <= g <= 14`) from `certificates.json`, and six negative controls must be rejected. The independent re-check `indep_check.py` and the referee scripts in `review/` use only the standard library but are not run by CI. The [written proof](../results/circular-index-upper-half-delta-3-mod-4/PROOF.md) covers every `g >= 15`; no Lean verification is included.

## Perron root of permanental compounds

Run `python3 results/perron-root-permanental-compounds/verify.py` with assertions enabled. It uses only the Python standard library and checks 126 exact cyclic-permanent identities, 81 Newton inequalities and 2,048 support/zero-root comparisons. These finite checks validate the reduction formulas. They do not implement the permanent approximation sampler or prove the FPRAS's unbounded scope; those claims depend on the [written proof](../results/perron-root-permanental-compounds/proof.md), Gurvits's theorem and the Jerrum–Sinclair–Vigoda theorem. The result has no Lean verification or computer-assisted proof badge.

## Malek's conjecture

Run `python3 results/malek-subpermanent/verify.py` with assertions enabled. The standard-library checker verifies the exact scalar upper constants, the two expansions used to compute them, the positive cubic certificate, the all-order shifted polynomial, and the remaining small-degree coefficient. These are algebraic checks of the [written proof](../results/malek-subpermanent/proof.md), not a finite matrix search. The unbounded statement rests on the analytic argument and its cited inputs. Two internal review receipts and a bounded source audit accompany it. No Lean verification is included.

## Currie's complexity 2n+1 conjecture

Run `python3 results/currie-conjecture-19/verify.py` with assertions enabled. The standard-library script checks the morphism identities of the reduction, exact factor sets of the fixed point, the hypotheses of the insertion lemmas and the short bispecial factors, and the critical-exponent inequality for the 72 families by exact arithmetic in `Q(λ)`. As cross-checks it compares the bispecial factors with an exhaustive enumeration up to length 300, checks the complexity `2n+1` up to length 300 for all twenty words, and searches long prefixes for repetitions. It takes about 15 to 50 seconds. The standard-library scripts in `review/` are the independent referee pass's checks and are not run by CI. The [written proof](../results/currie-conjecture-19/PROOF.md) covers all lengths; no Lean verification is included.

## Pula–Song–Wanless conjecture

Run `python3 results/pula-song-wanless/verify.py` with assertions enabled and SymPy 1.14.0 installed. The script audits generic derivative/crossing identities, 72 coefficient ODE/variance cases, 48 direct permanent counts and 42 exact barycenter inequalities. The full proof, including the real-rooted-minor reduction repair and independent uniqueness argument, is [written separately](../results/pula-song-wanless/proof.md). These finite checks do not establish the unbounded statement on their own. No Lean verification is included.

## Mazák–Zrubák complete graphs minus an edge

Run `python3 results/circular-index-complete-minus-edge/verify.py` with assertions enabled. The standard-library script enumerates the 2160 proper 5-edge-colourings of `K_5-e`, checks Lemmas 2, 3, 4 and 5(1) on the 180 with acyclic digraph, and shows that no edge ordering with the properties of Lemma 3 exists for `d=6`. The optional `verify_sat.py` and `review/sat_levels.py` check `d=6` directly from the definition, need `python-sat`, and are not run by CI; the other `review/` scripts are the referee pass's independent checks. The [written proof](../results/circular-index-complete-minus-edge/PROOF.md) covers every even `d >= 6`; no script completed `d=8`. No Lean verification is included.

## Circular chromatic index of complete graphs minus a few edges

Run `python3 results/circular-index-complete-minus-edges/verify.py` and `python3 results/circular-index-complete-minus-edges/verify_seq.py` with assertions enabled. The first standard-library script checks the 32 explicit `(p,q)`-edge-colourings of `K_n-F` in `colourings.json` from the definition and prints the matching lower bound `N/m`. The second searches exhaustively for perfect sequencings of `K_5-e`, `K_7-e`, `K_9-e`, `K_7-P_3` and `K_7-2K_2` and checks Lemmas A2 to A4 and the class counts of A5 on those of `K_5-e`; it takes about 25 seconds. The optional `verify_sat.py` and `drat/mkproof.py` need `python-sat` and are not run by CI, nor are the referee scripts in `review/`. The [written proof](../results/circular-index-complete-minus-edges/PROOF.md) of Theorem A covers every odd `n >= 7`; the exact values for small `n` also rest on exhaustive searches and SAT runs. No Lean verification is included.

## Wild number of complete graphs for n ≥ 155

Run `python3 results/wild-number-complete-graphs/verify.py` with assertions enabled. The standard-library script checks in exact rationals the counting inequality for the fixed block, condition (*) of Theorem B for every odd `n` from 155 to 189 with the author's coefficients and with the second referee's independent coefficients, the lopsided local-lemma condition of Theorem A for every odd `n` from 189 to 1201, and the first referee's monotone tail bound at `n = 1201`. It takes a few seconds. The counts themselves are proved in the [written notes](../results/wild-number-complete-graphs/); the scripts in `improvement/`, `review/` and `review2/` are optional cross-checks, and `theorem-a/verify.py` needs NumPy and SciPy. None of these checks decides any `n` in the open range `13 <= n <= 154`. No Lean verification is included.

## Zhang's Question 8.4

Run `python3 results/zhang-deletion-values/verify.py` with assertions enabled. The standard-library script checks the closed deletion-value formula in all 779 cases with `3 <= n <= 40`, the strict inequality in all 740 cases with `n >= 4` and `r <= n-2`, and the witness time used in the second case. The [elementary proof](../results/zhang-deletion-values/PROOF.md) is unconditional; the finite check confirms the formula in the stated range. No Lean verification is included.

## Zhang's Question 8.5: shifted lonely runner counterexamples

Run `python3 results/shifted-lonely-runner-counterexamples/generate_lean.py --check` to compare the Lean witnesses with all 40 records in the published JSON. The [target replay command](../results/shifted-lonely-runner-counterexamples/FORMALIZATION.md) rebuilds the proof of the real-time maxima, audits every declaration and replays the stock kernel. For an independent rational calculation run `python3 results/shifted-lonely-runner-counterexamples/verify.py --full`. Its `--quick` option checks arc coverage for every record and recomputes the exact maximum for $18\le n\le24$ and $n=41$.

Run `python3 results/shifted-lonely-runner-counterexamples/verify_frozen_extension.py` to check the exact optimum, the full interval of optimal phases and the stability margin for adding one runner to the fixed 57-runner seed. [Statement and proof](../results/shifted-lonely-runner-counterexamples/FROZEN_EXTENSION.md).

## Baricz–Pogány coefficient positivity

The existing result package's standard-library diagnostic is `python3 results/baricz-pogany-coefficients/verify.py`. It checks the formal-series identities and finite source fixtures described in its [landing page](../results/baricz-pogany-coefficients/). The full coefficient theorem and source-recurrence endpoint are Lean-verified; the [local receipt](verification/lean-named-20261121/baricz-receipt.json) records strict source compilation, the all-owned axiom audit, and stock-kernel replay.

## Oravcová–Soták distance-graph classification

Run `python3 results/oravcova-sotak/verify.py` with assertions enabled. The standard-library script checks the 65 spectrum-table sets and their exact `L(D)`, the 62 periodic colourings, the three exceptional sets, the 37 loop certificates for the four one-parameter families, the two-parameter family, and the small cases of the clique lemma. The classification is [proved relative to](../results/oravcova-sotak/PROOF.md) the repository's five- to eight-speed spectrum classifications. The optional SAT scan in `search/` is independent of those classifications and is not run by CI. The [Lean checkpoint](verification/lean-named-20261121/oravcova-receipt.json) verifies all explicit coloring certificates and the full relative deduction; `R5`–`R8` remain unproved inputs.

## Johnson–Kaya–Matzke path spectra

Run `python3 results/babai-spectrum-paths/verify.py` with assertions enabled. The standard-library script computes the chromatic number of every distance graph of `P_n` with `2 <= n <= 14`, 16,369 distance sets in all, and checks that each `Spec(P_n,k)` is the interval from `ceil(n/(n-k))` to `k+1`. It also checks the independence bound by exhaustive search for `n <= 10` and the integer `m` of Johnson–Kaya–Matzke's Theorem 2.3. The [Lean formalization](../lean/Conjectures/BabaiPathSpectrum.lean) proves both bounds and every realization for all admissible `n,k`; [local validation](verification/lean-named-20261121/babai-receipt.json) passed strict sources, all-owned axioms, and stock-kernel replay. The finite Python check is supplementary.

## Lean proofs

```bash
bash scripts/verify_lean.sh
```

The script builds each accepted module sequentially, builds the shared root imports, runs `ProofAudit.lean` with warnings treated as errors, and independently rechecks the listed compiled modules with `leanchecker`. The audit covers private declarations as well as public theorems, and rejects project axioms even when unused. Sequential builds keep large finite reductions from competing for memory. [The Lean workflow](../.github/workflows/lean.yml) runs the same audit in CI.

`scripts/replay_lean.py` checks that the replay list exactly matches the project
source-import closure. It stages those compiled objects, including their server
and private data, and replaces only the project entry in Lean's import path.
The unchanged pinned `leanchecker` then replays the two project namespaces.
This avoids repeated dependency-directory scans and excludes unfinished cached
modules. It does not change the kernel or omit any accepted proof module.

After building and auditing a separate candidate, replay its exact local import
closure from `lean/` with:

```bash
lake env python3 ../scripts/replay_lean.py --root Conjectures.DenominatorTheorem
```

The helper derives the closure from the selected source, requires every project
source and compiled object, stages only that closure, and propagates checker
failure. Cross-namespace candidates use the complete accepted-module mode.
`python3 scripts/test_replay_lean.py` checks the closure, staging, missing-object,
and failure-propagation rules with isolated fixtures. The kernel executable is
unchanged in both modes.

The [status report](lean-status.md) records the exact statements checked and dependencies that remain. Partial certificates do not establish the full conjecture. Accepted proofs permit only `propext`, `Classical.choice`, and `Quot.sound` as transitive axioms, as required by [the repository instructions](../AGENTS.md).

## What the checks establish

The two `results/bernardi-morales-delta/` verifiers use only the Python standard library. `verify.py` directly constructs the delta process and checks all membership coefficients for 71 fixed maps and 111,721 process pairs, including nonsurjective maps. It also checks 25 arbitrary-matrix determinant identities in sizes two through six. `verify_events.py` builds the source's cyclic I/J event matrices literally and compares every membership coefficient for 342 marked-surjection profiles and 438,952 exact determinants. These are independent finite checks of the [tree proof](../results/bernardi-morales-delta/PROOF.md) and [event proof](../results/bernardi-morales-delta/EVENT_PROOF.md), which cover every admissible parameter.

`results/gilmore-crossing-nesting/verify.py` compares the literal matrix product and the independently implemented recurrence through row seven, and compares the first column with all perfect matchings on at most twelve vertices. All four variables remain formal. The [written proof](../results/gilmore-crossing-nesting/PROOF.md) proves the identity in every row. The complete Lean proof and its [local validation receipt](verification/lean-named-20261121/gilmore-receipt.json) cover every row; the finite Python checks are supplementary.

`results/chow-conjecture/verify.py` compares signed-permutation enumeration with the refined recurrence through rank six, checks the separate Stembridge identity through rank 32, and checks exact degree, squarefreeness, consecutive gcd, and cutoff identities. These are finite consistency checks. The [written proof](../results/chow-conjecture/PROOF.md) uses Savage–Visontai's published theorem and a separate strictness argument for every rank.

`results/sonntag-teichert/verify.py` enumerates the minimal dominating sets of every labelled tournament through order six and every labelled oriented graph through order five. It also checks the two-star construction. The [proof](../results/sonntag-teichert/PROOF.md) covers every order.

`results/hornak-wozniak/verify.py` compares the five arithmetic tests against direct allocation of prescribed parts on small trees and checks the local transfer lemma by enumerating allocations. The [written proof](../results/hornak-wozniak/PROOF.md) covers both conjectures. The optional [symbolic check](../results/hornak-wozniak/verify_symbolic.py) uses `z3-solver` for the local endpoint implications.

`results/erdos-granville-pomerance-spiro/verify.py` checks finite instances of the quadratic-root bounds, the bilinear congruence lift and local sieve counts, and the cofactor identities in the [written partial result](../results/erdos-granville-pomerance-spiro/). The asymptotic statements use the analytic proofs.

`results/graffiti-pc-318/verify.py` uses only the Python standard library. It checks all 419,235 labeled graphs on 2–7 vertices with at most `n+1` missing edges; 7,337 satisfy the original hypothesis and each passes the total-domination test. A sharp five-vertex counterexample to a one-unit relaxation is separately verified. See [the all-order proof](../results/graffiti-pc-318/PROOF.md), **credited to [@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334)**. This is not a Lean proof.

`results/l-solitaire-limit-shapes/verify.py` is the original embedded PDF attachment, extracted byte-for-byte. The finite search checks all pick-layer sets and integer partitions for deck sizes 1 through 14 and separately verifies the specific counterexample for sizes 1 through 1000. Exhaustive tests do not replace the general argument in the PDF.

`results/pham-denominator-degree/verify.py` checks a finite certificate of 26 coefficients and applies Pham's *proved* degree bounds to deduce the entire rational-function identity. Optional `--dual` checks a second exact identity.

The Li verifier also checks all 6,842 partition types of 31 and the coefficient `+29` using exact edge-cut and coloring calculations. Its independent parity-based check is included. The original PDF has the verifier embedded as an attachment.

## Reporting a check

Record the commit, command, toolchain, and result. Distinguish computational tests, source builds, axiom audits, kernel replay, and hosted CI. Do not infer that an unrun check passed.

## Loneliness on a fixed hyperplane

The complete original note is formally verified in the exact 72-module
`LonelinessHyperplaneMain` closure. The fresh gate checks strict sources,
every owned declaration including raw private declarations, all 106 named
theorem endpoints, and every exact stock-kernel target. The original
[statements and evidence](../results/loneliness-on-a-hyperplane/LEAN.md)
include the uniform-over-shifts estimate, exact positive-N counts and degree
bound, Haar-shift law, endpoint formula and sharpness.

Run `python3 results/loneliness-on-a-hyperplane/verify.py` for the additional
finite circle maxima, endpoint congruences and shifted examples.

## Complete rectangle proof and finite plane certificates

The accepted Lean root includes the full growing-rectangle theorem, including
its real-position tiling interpretation and uniform quantifiers over `w ≥ h`.
Its 46 proof modules passed source checks and independent kernel replay; the
final rectangle audit checked 587 theorem declarations. See the
[exact statement and receipt](../results/rectangle-partition-asymptotics/LEAN.md).

The accepted plane development includes all 64 finite certificate blocks and
their normalization and geometric soundness proofs. The matrix checks all
122,880 indexed cases by kernel reduction. The two complete hosted matrix
runs passed; [the source receipts](../results/five-speed-spectrum/plane-certificate-receipts.json)
bind their sources and generator. Run `python3 scripts/verify_plane_certificates.py --row N` for one row, with `0 ≤ N < 8`. The full accepted package is checked
by `scripts/verify_lean.sh`.

The accepted four-speed coordinate cutoff 5,832 is unconditional. The plane
classification and five-speed cutoff 279,841 retain `FourSpeedGap` as an
explicit premise. Neither the finite matrix nor that conditional cutoff is
a proof of the exhaustive five-speed classification.

## Selecting accepted-package checks

The full Lean workflow derives the transitive source closure of both
accepted roots and `ProofAudit`. Any change to that closure, the pinned
configuration, or the verification scripts runs the complete build, axiom
audit, and unchanged independent kernel checker. Missing roots, missing
imports, unknown change information, and manual runs also select the full
gate. Only candidate-only or documentation-only changes can skip it.

A skipped job is not a new proof receipt. Each unregistered candidate has
its own complete closure checks. Negative controls check transitive public
imports, missing-source handling, newly registered candidates, and stale
dependent-object rejection after a candidate source error.

## Frankl high-girth theorem

Run `python3 scripts/verify_frankl_high_girth_theorem.py --jobs 4` from the
repository root after preparing the pinned Lean package. This focused gate
rebuilds the exact 64-module theorem closure with warnings treated as errors,
audits every owned declaration against the standard three-axiom whitelist,
requires 35 named endpoints, and replays every project module with the
unchanged stock checker. It rejects changed source, object, compiler,
checker, or gate hashes.

[Successful hosted run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44516856625) ·
[Original receipt](verification/frankl-components-44516856625/high-girth-theorem.json).
This verifies the complete high-girth frequency theorem. The cyclic
span-four theorem has separate finite graph, transport, coverage, and final
assembly gates. The registered full package is checked by
`scripts/verify_lean.sh`.

## Complete two-speed insertion gate

From the repository root with the pinned toolchain and Mathlib cache:

```sh
python3 scripts/verify_two_insertions_exact.py --plan
python3 scripts/verify_two_insertions_exact.py
```

The exact source model fixes all 27 project modules, 49 required theorem
endpoints, the toolchain configuration, and all transitive gate helpers.
The gate rebuilds every project source with warnings treated as errors and
no linter override, audits all owned declarations and raw private names,
then replays each of the 27 modules as an exact singleton target with the
unchanged stock checker in a fresh one-worker process. It rehashes the
sources, helpers, compiler, checker, every compiled facet, and proof
evidence before writing a passing receipt.

[Run 44524198858/job 135562276051](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44524198858/job/135562276051)
passed for source snapshot `9f51470529423e8135c08de881cd56f5b1fd9a95`.
It checked 563 owned declarations, including 424 theorems and 11 private
declarations. The [original receipt](verification/two-insertions-exact-44524198858/receipt.json)
and [authenticated original evidence](verification/two-insertions-exact-44524198858/)
are public. Receipt preservation performs byte and policy validation;
it is not an additional Lean proof run. This component pass is separate
from the full merged-package gate.

## Six-speed spectrum realization

```sh
python3 scripts/verify_six_spectrum_realization.py --plan
python3 scripts/verify_six_spectrum_realization.py
```

This dedicated gate rebuilds the exact 11-module closure, treats all source
warnings as errors without disabling linters, audits every owned declaration
and raw private name, requires theorem kind for all 15 endpoints, and replays
all 11 modules as exact singleton stock-kernel targets. Source, configuration,
transitive helper, compiler, checker, object and process-evidence hashes are
fixed and rechecked.

The [passed original receipt](verification/six-spectrum-realization-44527134869/receipt.json)
and [authenticated evidence](verification/six-spectrum-realization-44527134869/)
cover 392 owned declarations, 306 theorems and 30 private declarations.
The gate establishes realization of the proposed six-speed values; universal
classification and the full accepted-package verification are separate.

## Complete fixed-hyperplane theorem

All original statements of the fixed-hyperplane note are registered. They
use the original ordered positive, pairwise-distinct integer sample and
the actual time maximum. The general normal is primitive and real-admissible;
the endpoint formula alone additionally requires every normal coordinate
to be nonzero.

The theorem closure proves the deterministic bound and exact containing-torus
maximum, the uniform `O(1/N)` probability error over all shifts, fixed-shift
and independent Haar-shift laws, the exact finite proper-subspace description,
the denominator quasipolynomial, the actual subthreshold numerator at every
`N≥1` with degree at most `k−2`, the endpoint frequency including `k=2`,
and the sharp `(1,2,3)` example. No density, finite-fan, Ehrhart, counting
or classification statement is an unproved premise.

[Run 44531509741/job 135585736594](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44531509741/job/135585736594)
freshly checked the exact 72-module closure at `ee1f018fef258cdd54f73af31cdaf6485fd151cb`.
Sources used warnings as errors with no linter override. The all-owned audit
checked 1,403 declarations, including 1,149 theorems and 44
private declarations, and confirmed theorem kind for all 106 required
endpoints. Only `propext`, `Classical.choice` and `Quot.sound`
were allowed. All 72 modules passed exact singleton stock-kernel replay in
fresh one-worker processes.

The [unchanged raw receipt](verification/hyperplane-main-exact-44531509741/receipt.json)
has SHA-256 `1c0d6a6fbe2ea16bbcfa88808ec8d83f0e412217e76c03803780ff0737fa1c15`.
The [preservation record](verification/hyperplane-main-exact-44531509741/preservation.json)
authenticates the actual original source, object, audit, log and progress
bytes. Artifact `14535236819` has ZIP SHA-256 `27d65f3b5d667260dfad8d639f6d1182a3b5e54c032a2e2954d7764e060fe638`.

Registration adds 63 previously unregistered proof modules and 102 new
required endpoints, with all 72 checked source blobs guarded. The accepted
list has 969 proof modules plus two roots. This completes the fixed-hyperplane
result; verification of the merged accepted package remains a separate gate.
The [result-level scope](../results/loneliness-on-a-hyperplane/LEAN.md)
records the precise sample, formulas and distributional formulation.

## Conditional nine-through-thirteen speed norm reduction

The 81-module closure of `LonelinessTightNormBounds` is checked and
registered. For a positive primitive `k`-tuple with `9≤k≤13` and actual
loneliness value at most `1/(k+1)`, it proves the literal squared-norm
cutoff and a listed prime dividing no speed, under the explicit hypothesis
`∀ m, 1≤m → m<k → LonelyRunnerBound m`. The basis geometry,
nearest-plane bounds, all 7,936 KZ subset rows and prime-product margins
are proved internally.

[Run 44530735399/job 135583044214](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44530735399/job/135583044214)
passed at `8162a5dfbe89e441600e7a3bbcc03b573df0880e`: all 81 strict source checks, the all-owned
audit of 1,696 declarations (1,445 theorems and 538 private declarations),
all 25 required theorem endpoints, and all 81 exact singleton stock-kernel
replays. Sources and audit used warnings as errors without a linter override;
the only allowed axioms were `propext`, `Classical.choice` and `Quot.sound`.

The [unchanged receipt](verification/loneliness-large-norm-exact-44530735399/receipt.json)
has SHA-256 `fba4b952a87271f9691e983dd69dafc0be5c07617e412884eb82f2894ec2fef5`.
The [preservation record](verification/loneliness-large-norm-exact-44530735399/preservation.json)
authenticates the actual original sources, objects, audit and process records.
Artifact `14535137698` has ZIP SHA-256
`b6678fb2e27c872d01a2bbd6bea9982abc42411e79999b6c4113961195ab3366`.

Registration adds 64 proof modules and 25 required endpoints. The accepted
list then contains 1,033 proof modules plus two roots. The merged-package
gate remains separate. Lower-runner assumptions, exhaustive modular
classification and final uniqueness remain open, so no result directory
becomes complete from this reduction.
[Exact hypotheses, cutoffs and scope](loneliness-large-norm-lean.md).

## Gravgaard–Lee’s mixed upper/lower Lüroth conjecture

The complete 12-module closure passed fresh strict source builds, the all-owned/private audit (664 declarations, 475 theorems, 173 private declarations, 29 required endpoints), and exact stock-kernel replay. Only `propext`, `Classical.choice`, and `Quot.sound` occur. The [receipt](verification/lean-gravgaard-lee-upper-lower-complete-20261124-162051/receipt.json), [statement correspondence](../results/gravgaard-lee-upper-lower-luroth/FORMALIZATION.md), and [independent review](../results/gravgaard-lee-upper-lower-luroth/LEAN_REVIEW.md) bind those checks to the all-threshold theorem and actual infinite expansions. The portable command is `cd lean && lake env python3 ../scripts/verify_gravgaard_lee_upper_lower.py`. The aggregate gate and public deployment remain separate; see [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

## Hartke–Stolee–West–Yancey matching-excess conjecture

The complete 22-module closure passed fresh strict source builds, the all-owned/private audit (505 declarations, 435 theorems, 32 private declarations, 42 required endpoints), and exact stock-kernel replay. The [receipt](verification/lean-hartke-matching-excess-complete-20261124-162051/receipt.json), [statement correspondence](../results/hartke-stolee-west-yancey-matching-excess/FORMALIZATION.md), and [independent review](../results/hartke-stolee-west-yancey-matching-excess/LEAN_REVIEW.md) bind the checks to the original all-count tail-minimum conjecture. Only the three allowed standard axioms occur. The portable command is `cd lean && lake env python3 ../scripts/verify_hartke_matching_excess.py`; the dedicated workflow preserves its result separately. The aggregate dependency-artifact and public-site obligations remain tracked in [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).
