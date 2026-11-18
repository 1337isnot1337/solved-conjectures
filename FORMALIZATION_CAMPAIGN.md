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
   and the proposed-tail decision test. Read low bits first so arithmetic carries
   have a direct inductive semantics. Generated automata need a checked relation
   to the arithmetic/game semantics; empty Python error languages alone are not
   acceptance.
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
