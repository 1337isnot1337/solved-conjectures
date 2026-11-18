# Full formalization campaign

Objective: formalize every proof and mathematical result in this repository in
Lean, preserving the stated scope and discharging unformalized mathematical
inputs. All accepted work belongs on `main`; other branches were removed after
their work was fast-forwarded into `main`.

## Checked baseline

`b9b826e46a9c33fb369f2ea46b8a94f36fad2262` supplies the complete fixed-scale
solitaire counterexample and all three War cycle proofs, plus intermediate
Pham, Egyptian-fraction and CUT Family B arguments. Its local kernel/audit checks
and both hosted workflows passed. See `LEAN_VERIFICATION.md` for exact scope.

## Completed extension: Batista

The complete theorems are `Egyptian.batista_congruence` and
`Egyptian.batista_admissible_congruence` in `EgyptianTheorem.lean`.
`EgyptianBounds.lean` proves the unbounded elementary competitor comparison;
`EgyptianFinite.lean` supplies exhaustive small-case certificates with proved
search bounds. The combined theorem no longer assumes global pair optimality.
The complete package passed the full source build, axiom audit (578 project
theorem declarations), and all nine kernel module rechecks. No global
optimality, finite-search completeness, or published mathematical result is an
unproved premise of the completed theorem.

## Remaining queue

1. CUT arithmetic periodicity (current lane): formalize finite binary automata
   semantics, option composition and mex emptiness certificates for both games,
   and the proposed-tail decision test. The checked working foundations are
   `BinaryAutomata.lean`, `BinaryArithmetic.lean`, `CutPeriodGraph.lean`, and
   `CutPeriodGraphCertificate.lean`; they prove subset/refinement semantics,
   high-bit addition/XOR, and the complete 27-state candidate graph language.
   `BinaryComposition.lean` now proves addition/XOR composition in both
   directions and sound pruning of rejecting sinks. Next: generated refinement
   certificates for pile groups, fixed-width padding/arbitrary-pile connection,
   lower-value relation, union and the
   two mex emptiness checks, then the game theorem and minimal-period claims.
   The generator preserves all representations in a reproducible ignored JSON
   archive and emits the checked graph Lean certificate. Generated data alone
   is not acceptance.
   Do not repeat the low-bit-first construction unchanged: determinization
   reached 301,768 states for three piles even after pruning rejecting sinks;
   the unpruned trial used over 5 GiB and was terminated. Original high-bit
   construction has 179→27 graph states, 402→126 for two parts, 2013→89 for
   three parts, 2324→22 for four parts, and at most 668 represented states for
   each later group. Both Python profiling workers were stopped.
2. CUT Family B: discharge the published base-formula/mex hypothesis, including
   preservation by additional even cuts. The new large-odd-cut threshold and
   sharpness arguments are already formalized.
3. Pham denominator degree: connect the listed truncations to actual limiting
   reverse-solitaire orbit counts, and prove the required representation/degree
   bounds or replace that route with an unconditional generating-function proof.
4. Li coefficient sign: explicit tree properties, all connected partition types,
   chromatic symmetric function interpretation and coefficient extraction.
5. Corrected solitaire theorem: arbitrary admissible layers, return times,
   interlacing and convergence for every diverging scale.
6. Growing rectangles: packing injection and uniform partition asymptotics.
7. Erdős 607: geometric realization, generating-function correspondence, local
   probability estimate and the sharp asymptotic including its prefactor.

The campaign is INCOMPLETE until this queue and every gap in
`LEAN_VERIFICATION.md` are closed. A passing verifier or CI run does not close an
unformalized mathematical dependency.

## Next concrete checks

The first two-pile generated module is `CutPeriodParts2Certificate.lean`.
Its encoding/refinement checks are being tested against `BinaryComposition`;
do not treat its generated data as accepted until the module and kernel checks
pass. The generator supports `--parts-until N`, defaulting to the checked graph
alone. Avoid generating every unchecked stage into the Lean source tree at
once: build one stage, resolve its proof/performance issues, then proceed.

Current CUT continuation details: `cut-arithmetic-periodicity/LEAN_PLAN.md`.
The first monolithic two-pile check was stopped after exceeding 10 GiB.
Use cached successor matrices and rowwise proofs before retrying that stage.

The [distance-graph note](distance-graph-densities/PROOF.md) adds two formalization targets. Conjecture 38 uses the strict prefix reduction, strip shortening and finite strip decision. Conjecture 39 uses the period-58 construction and length-116 exclusion. The [full classification](distance-graph-densities/CLASSIFICATION.md) also needs the nine-cycle strip and the 20 small cases. These results await Lean formalization.

The [two-difference compact-group theorem](two-difference-motzkin/PROOF.md) requires the signed square-grid construction, integration over the relation lattice, finite-quotient approximation and density of character restrictions. Its Lean proof is pending.

The [symmetric four-point density theorem](symmetric-four-point-density/PROOF.md) reduces to the two finite interval obstructions, their density consequences and the periodic constructions. All three steps await formalization.
