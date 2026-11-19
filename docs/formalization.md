# Full formalization campaign

The objective is to formalize every result in this repository, preserving its
quantifiers and discharging every mathematical dependency. Accepted work goes
to `main`. Li is last. The campaign is incomplete.

## Coordination, 18 November 2026

The four active lanes in [issue 1](https://github.com/1337isnot1337/solved-conjectures/issues/1) are:

- Concrete CUT certificates: the checked composition theorem permits the path
  2 → 3 → 4 → 8 → 9. The eight-pile recognizer is composed from two four-pile
  recognizers. The final option unions remain to be checked.
- Pham denominator degree: actual reverse dynamics, limiting orbit counts,
  finite-prefix recursions and exact polynomial identities.
- Compact Motzkin: finite signed-grid characters, compact-group measure, and
  the exact two-difference formula. The same worker has completed the
  all-parameter gap-five/gap-seven character formulas and an odd-cycle density
  theorem.
- Root: shared integration, reduced-denominator minimality, and the finite
  geometric/combinatorial front end of Erdős 607 under `LineSize*`.

The other team coordinates in
[issue 2](https://github.com/1337isnot1337/solved-conjectures/issues/2). It owns
the independent `ThreeDistanceGraph*` density proof under
[issue 9](https://github.com/1337isnot1337/solved-conjectures/issues/9),
the remaining rectangle asymptotics under
[issue 10](https://github.com/1337isnot1337/solved-conjectures/issues/10), and the
geometric dependencies of the lonely-runner classifications. Haralambis was
published in `22f3a5a`. Read both coordination threads before changing lanes.
Post new claims before editing.

## Complete mathematical formalizations

The fixed-scale solitaire counterexample and corrected arbitrary-layer
solitaire theorem are complete. The corrected theorem concerns actual recurrent
configurations and every positive horizontal scale tending to infinity.
Its finite and analytic chains passed source, axiom and independent kernel
checks, including the maximality of the actual stable reference.

Three-player War, Batista's Egyptian-fraction theorem, and the full CUT Family B
threshold are complete. Family B includes arbitrary infinite cut sets and
proves its base formula internally.

The full symmetric four-point and nonmixed-gap density theorems are complete,
including normalization, literal tile semantics, periodic attainments and the
stated sharp local bounds. The concurrent team's proofs were published in
`6c09508` and merged here through `9b4fff3`.

The general finite CUT decision theorem is complete, with two independent
constructions. Both prove that a finite test accepts exactly the proposed
representations of the actual game. Candidate enumeration is complete when a
representation exists. The two concrete games remain separate obligations.

The combined accepted package passed its source build, the audit of 6,954
project theorem declarations, and independent kernel replay of all 152 proof
modules and both roots. Local verification and hosted CI receipts are recorded
separately.
See [the status report](lean-status.md) for declarations and checked scope.

## Remaining mathematical obligations

1. CUT: finish the concrete three-, four-, eight- and nine-pile certificates,
   both option unions, and the actual game identifications.
2. Pham: identify the infinite-state recursion with stabilized finite orbits,
   prove the finite-prefix generating functions, and derive both exact reduced
   denominators from those functions.
3. Distance graphs: publish and integrate the actual-density endpoint; the
   character formulas, including all exceptional small cases, are checked.
4. Two-difference Motzkin: signed grid, compact-group measure, finite quotients,
   and density of character restrictions.
5. Haralambis is complete: its exact density equality and optimal pair-sum
   periodic attainment were published in `22f3a5a`.
6. Five-speed spectrum: geometric norm reduction and complete modular
   lifting/enumeration outside the already checked critical families.
7. Tight six speeds and critical planes: the uniform reduction, complete
   equality classification, plane enumeration and large-norm consequence.
8. Six-speed spectrum: all infinite families, norm reduction, modular lifting,
   and exhaustive classification.
9. Eight-runner equality cases: the norm reduction, complete modular
   certificates and lifting to the three listed directions.
10. Nine-runner equality case: the norm reduction, modular certificates and
    uniqueness of the consecutive direction.
11. Ten-runner equality case: the corresponding uniform reduction and all
    modular certificates.
12. Seven-speed spectrum: the infinite family, all 27 exceptions, norm
    reduction and complete lifting/enumeration.
13. Eight-speed spectrum: the infinite family, all listed exceptions, norm
    reduction and exhaustive lifting.
14. Eleven-through-fourteen-runner equality: each uniform reduction, all modular
    certificates and every stated primitive equality list.
15. Growing rectangles: the geometric packing injection, ordinary-partition
    estimates and uniform asymptotics over every aspect ratio.
16. Erdős 607: geometric realization, generating-function correspondence,
    local probability estimates and the sharp asymptotic prefactor.
17. Li coefficient sign, last: actual tree properties, all connected partition
    types, chromatic symmetric functions and coefficient extraction.

The pair-sum maximum theorem and the checked values of 31 finite speed lists
are reusable components. They do not establish any exhaustive classification.
The common interface is `Conjectures.LonelinessPairBridge`.

## Verification and continuation

Use the pinned toolchain and Mathlib manifest in `lean/`. Run
`scripts/verify_lean.sh` from the repository root. It builds accepted modules
one at a time, builds the root imports, audits every project theorem including
private declarations, and replays each accepted module with `leanchecker`.
The only permitted transitive axioms are `propext`, `Classical.choice` and
`Quot.sound`.

The hosted Lean action performs setup and cache retrieval; the shared script
performs the source build. This prevents simultaneous large certificate
reductions from exhausting runner memory. No source, axiom or kernel gate is
omitted.

Generated CUT stages remain outside the root imports until their complete
source, axiom and independent kernel gates pass. The local three-pile preparation splits state data into 33 chunks and has a
72-module manifest. That experimental source set is separate from the
accepted proof snapshot until its stage checks finish. The generator's
`--doubling-eight` route preserves the original sequential data while avoiding
unneeded groups five through seven in the accepted dependency path.
See [the concrete CUT plan](../results/cut-arithmetic-periodicity/LEAN_PLAN.md).

Refresh remote `main` before each publication. Preserve concurrent sources,
merge shared imports/audit lists additively, and publish a verified snapshot.
A finite verifier, partial lemma or passing CI run does not close a stronger
mathematical statement.
