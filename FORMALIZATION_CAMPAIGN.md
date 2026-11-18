# Full formalization campaign

Objective: formalize every proof and mathematical result in this repository in
Lean, preserving the stated scope and discharging unformalized mathematical
inputs. All accepted work belongs on `main`; other branches were removed after
their work was fast-forwarded into `main`.

## Paused checkpoint, 18 November 2026

Paused at the owner's explicit request. The task-owned build supervisor and
its compiler were stopped; no local campaign build is running or scheduled.
The campaign is INCOMPLETE. All work, including the experimental generated
three-pile sources, is preserved on `main`.

The accepted package includes the complete War cycles and Batista theorem,
the CUT two-pile and four numerical error certificates, complete padding,
candidate period parameters, finite certificate helpers, and the generic
finite emptiness/mex tests. `BinaryDecision` proves every reachable state has
a word shorter than the state count and gives a terminating complete emptiness
test. `CutMexDecision` proves necessary and sufficient finite mex tests given
exact graph/lower/actual-option recognizers. Uniform construction of those
recognizers is still unfinished.

Resume with the three-pile group. Its data module, all 27 transition blocks
(6,804 product states), and the transition aggregation passed source builds.
The build was interrupted in `Conjectures.CutPeriodParts3StateData`; subset
refinement blocks, the final group theorem, its axiom audit and independent
kernel replays remain pending. The 39 experimental modules are deliberately
not imported by the accepted package and are not included in its verification
claims. Their exact ordered list is
`l-solitaire-limit-shapes/lean/Conjectures/CutPeriodParts3.modules`.

To resume the finite build from the repository root:

```sh
export PATH="$HOME/.elan/bin:$PATH"
export LEAN_NUM_THREADS=1
cd l-solitaire-limit-shapes/lean
while IFS= read -r module; do
  lake build "$module" || break
done < Conjectures/CutPeriodParts3.modules
```

After every listed module passes, register the final certificate in
`Conjectures.lean`, require `CutPeriod.Parts3Certificate.recognizes_piles` in
`ProofAudit.lean`, and add every module in the manifest to the kernel-recheck
script. Run the source/axiom checks and independently replay every new module
before promoting the stage. Then continue groups four through nine, the union
refinements and the remaining repository queue below. Refresh remote `main`
before each push, preserving concurrent mathematical additions.

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
   directions and sound pruning of rejecting sinks. `BinaryEncoding`,
   `CutPeriodPiles`, `BinaryOrder` and `BinaryProjection` discharge complete
   fixed-width padding and the actual positive-pile-list connection.
   `CutPeriodLowerCertificate` checks the complete 23-state lower-value DFA.
   `CutPeriodParts2Certificate` now checks the two-pile group completely.
   All four numerical error-language refinements are now checked.
   `CutPeriodCertifiedMex` reduces each complete game theorem to the explicit
   hypothesis that its numerical option DFA recognizes actual legal splits.
   Next: groups three through nine and the union refinements to discharge that
   hypothesis. Candidate-function minimal-period claims are already checked;
   identification with the games and the general decision test remain open.
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

The two-pile generated module passed its source, axiom and kernel checks.
The three-pile stage is now being checked. The generator supports
`--parts-until N`, defaulting to the checked graph
alone. Avoid generating every unchecked stage into the Lean source tree at
once: build one stage, resolve its proof/performance issues, then proceed.

Current CUT continuation details: `cut-arithmetic-periodicity/LEAN_PLAN.md`.
The first monolithic two-pile check was stopped after exceeding 10 GiB.
Use cached successor matrices and rowwise proofs before retrying that stage.
Those changes passed the two-pile stage, together with balanced table lookup,
symbolic product inverses and checked proof-list aggregation. Larger groups
also use the kernel-checked digit-choice optimization. See the
continuation plan for measured limits and approaches already ruled out.

The [distance-graph note](distance-graph-densities/PROOF.md) adds two formalization targets. Conjecture 38 uses the strict prefix reduction, strip shortening and finite strip decision. Conjecture 39 uses the period-58 construction and length-116 exclusion. The [full classification](distance-graph-densities/CLASSIFICATION.md) also needs the nine-cycle strip and the 20 small cases. These results await Lean formalization.

The [two-difference compact-group theorem](two-difference-motzkin/PROOF.md) requires the signed square-grid construction, integration over the relation lattice, finite-quotient approximation and density of character restrictions. Its Lean proof is pending.

The [symmetric four-point density theorem](symmetric-four-point-density/PROOF.md) reduces to the two finite interval obstructions, their density consequences and the periodic constructions. All three steps await formalization.

The [nonmixed-gap theorem](nonmixed-gap-packing/PROOF.md) requires the ordering of coprime lattice lifts, the two interval counts, the block-density argument, and the character construction. Its Lean proof is pending.

The [Haralambis proof](haralambis-three-differences/PROOF.md) has a combinatorial route to formalization through balanced dual orientations, extension of closed signed-edge values across cubes, integral periods, and three pair-sum cycles. Its Lean proof is pending.
