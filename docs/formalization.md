# Full formalization campaign

The objective is to formalize every result in this repository, preserving its
quantifiers and discharging every mathematical dependency. Accepted work goes
to `main`. Li is last. The campaign is incomplete.

## Coordination, 18 November 2026

The four active lanes in [issue 1](https://github.com/1337isnot1337/solved-conjectures/issues/1) are:

- Concrete CUT is complete through compact quotient/residue certificates.
  That worker has checked the exact analytic profile for Erdős 607, including
  its integral constant, mean, variance, and global phase bound.
  It now handles the uniform Fourier bounds.
- Pham denominator degree is complete. That worker now handles the
  exact generating function and its analytic evaluation for Erdős 607. Its
  Sylvester–Gallai dependency and finite core/gap foundations are checked.
- Compact Motzkin: finite signed-grid characters, compact-group measure, and
  the exact two-difference formula. The same worker has completed the
  all-parameter gap-five/gap-seven character formulas and an odd-cycle density
  theorem.
- Root: shared integration, the corrected finite Euler product, and the local
  coefficient analysis for Erdős 607. Its actual geometric counting identity
  is checked for every point count.

The other team coordinates in
[issue 2](https://github.com/1337isnot1337/solved-conjectures/issues/2). It owns
the independent `ThreeDistanceGraph*` density proof under
[issue 9](https://github.com/1337isnot1337/solved-conjectures/issues/9),
the completed rectangle asymptotic under
[issue 10](https://github.com/1337isnot1337/solved-conjectures/issues/10), and the
geometric dependencies of the lonely-runner classifications. Haralambis was
published in `22f3a5a`; the full distance-graph endpoint was published in
`a7b1ca1`. A third team coordinates higher-speed families, exact examples,
modular lifting, and the four-speed classification in
[issue 12](https://github.com/1337isnot1337/solved-conjectures/issues/12) and
[issue 13](https://github.com/1337isnot1337/solved-conjectures/issues/13).
That team also owns Graffiti.pc 318 in
[issue 15](https://github.com/1337isnot1337/solved-conjectures/issues/15) and
the newly added fixed-hyperplane loneliness result in
[issue 16](https://github.com/1337isnot1337/solved-conjectures/issues/16).
Its unregistered modules and separate validation lanes are described in
[`lean-candidates.md`](lean-candidates.md).
Read the coordination threads before changing lanes. Post new claims before editing.

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
representation exists. Both concrete games are now complete as well:
`CutPeriod.Weight.both_games_exact` identifies their actual recursive values
and proves least eventual period 12, saltus 8, and earliest start 7.
Its complete 23-module closure passed independent kernel replay.

Pham's primary and dual limiting-series identities are complete. The proof
derives stabilization from actual finite orbit levels, solves finite-prefix
recursions, and proves reduced denominator degrees 5 and 10. It uses no
published rationality or degree bound. Its 36-module closure passed strict
source checks, a 1,080-declaration axiom audit, and independent kernel replay.

The finite Motzkin theorem is also checked: every finite abelian group generated
by the two marked elements has an attaining independent set and an attaining
circle character with the same normalized value. The full compact-group
equality is now checked as well: actual Borel-set density equals the
continuous-character supremum for arbitrary compact Hausdorff abelian groups
with invariant probability measure, including zero differences. Its 34-module
closure passed strict sources, the 664-theorem axiom audit, and independent
kernel replay. Rank-based evaluations, cyclic criteria, and the exact
algorithmic claims remain in progress.

Graffiti.pc Conjecture 318 and its stated sharpness example are complete.
The theorem is quantified over every finite connected simple graph of order at
least two. It uses Mathlib graph distance, counts each undirected complement
edge once, and derives the total-dominating-pair and total-domination-number
conclusions. The contributed proof credit remains with
[@JesterInABarrel](https://x.com/JesterInABarrel/status/2123233964827812334).
The three graph modules passed local checks and the hosted base candidate job
before accepted registration.

The runner family and example components are also registered. They include
the consecutive family for every parameter and every runner count from 2
through 14, the two exceptional eight-speed families, and classification
within all three stated eight-speed product families. The seven- and
eight-speed exceptional examples have exact global values. These statements
do not supply exhaustive higher-speed classifications. The exact shifted
hyperplane maximum and its velocity upper bound are registered; its
probabilistic and counting assertions remain open.

The verified snapshot `c0cf593` passed its source build, the audit of 6,954
project theorem declarations, and independent kernel replay of all 152 proof
modules and both roots. The separate `a7b1ca1` checkpoint passed its complete
hosted source/audit/kernel workflow. The `c862951` integration renamed the two
independent rectangle modules to resolve a namespace collision, replayed both,
and passed the combined source build and 7,581-declaration audit.
Local verification and hosted CI receipts are
recorded separately.
The subsequent `18bf908` Pham/finite-Motzkin checkpoint passed the hosted full
source, audit, and kernel workflow for all 219 accepted proof modules and both
roots, in [run 44450524136](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44450524136).
See [the status report](lean-status.md) for declarations and checked scope.

The full growing-rectangle theorem is complete. The real-to-grid bridge,
cumulative partition asymptotic, both reservation regimes, and the uniform
limit for every width at least the height are checked. The 46-module closure
passed independent kernel replay and its 587-declaration axiom audit.

The unconditional four-speed gap theorem is complete. The cutoff 5,832 and
finite modular certificates prove that the only directions below `2/9` are
`[1,2,3,4]` and `[1,3,4,7]`, up to positive scaling and permutation. Both have
value `1/5`, and the four-speed runner bound follows. All 84 modules in the
closure have source, axiom, and independent kernel component coverage.

The finite plane classification covers all 122,880 indexed candidates. Its
`FourSpeedGap` input is now a proved theorem. With that input, every positive
primitive five-speed tuple below `1/5` either has all coordinates at most
279,841 or contains a dilated critical quadruple. In the second case its
value is `s/(5s+1)`. The bounded five-speed classification remains separate work.

## Campaign checklist

1. CUT is complete: the general finite test, exhaustive candidate enumeration,
   both actual game identifications, and exact arithmetic parameters are proved.
2. Pham is complete: actual orbit limits, both rational identities, and exact
   reduced-denominator minimality are proved.
3. Distance graphs are complete: all density and character formulas, small
   exceptions, periodic attainments, and the infinite discrepancy branch.
4. Two-difference Motzkin: the compact-group upper bound through finite boxes
   and dense character restrictions, followed by the note's annihilator
   evaluations, cyclic criteria, and exact algorithmic bounds.
5. Haralambis is complete: its exact density equality and optimal pair-sum
   periodic attainment were published in `22f3a5a`.
6. Five-speed spectrum: complete the modular lifting/enumeration outside the
   checked critical families. The four-speed gap is proved; the rational-plane
   certificate and coordinate-cutoff reductions are checked.
7. Tight six speeds and critical planes: the uniform reduction, complete
   equality classification, plane enumeration and large-norm consequence.
8. Six-speed spectrum: the remaining family branch, norm reduction, modular
   lifting, and exhaustive classification; the consecutive family is checked.
9. Eight-runner equality cases: the norm reduction, complete modular
   certificates and lifting to the three listed directions.
10. Nine-runner equality case: the norm reduction, modular certificates and
    uniqueness of the consecutive direction.
11. Ten-runner equality case: the corresponding uniform reduction and all
    modular certificates.
12. Seven-speed spectrum: norm reduction and complete lifting/enumeration;
    the infinite family and all 27 exceptional values are checked.
13. Eight-speed spectrum: norm reduction and exhaustive lifting outside the
    three classified product families; the listed exceptional values are checked.
14. Eleven-through-fourteen-runner equality: each uniform reduction, all modular
    certificates and every stated primitive equality list.
15. Growing rectangles are complete: real tiling semantics, cumulative
    partition estimates, and the uniform asymptotic over every width `w ≥ h`.
16. Erdős 607: generating-function evaluation, corrected Euler-product
    asymptotics, Fourier local limits and the sharp coefficient prefactor.
    Actual geometric counting and the exact saddle profile are checked.
17. Graffiti.pc Conjecture 318 is complete, including the all-order theorem
    and sharp five-vertex example.
18. Loneliness on a fixed hyperplane: uniform fixed-tolerance probability
    bound, exceptional-subspace description,
    quasipolynomial counts, and the endpoint density for full-support normals.
19. Li coefficient sign, last: actual tree properties, all connected partition
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

The earlier large higher-pile CUT automata remain preserved outside the accepted
roots. They are no longer needed for either concrete theorem. The accepted
compact certificate route has seven new modules and independently checked
collision and lower-option arguments for every pile size.
See [the concrete CUT plan](../results/cut-arithmetic-periodicity/LEAN_PLAN.md).

Refresh remote `main` before each publication. Preserve concurrent sources,
merge shared imports/audit lists additively, and publish a verified snapshot.
A finite verifier, partial lemma or passing CI run does not close a stronger
mathematical statement.
