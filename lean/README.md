# Shared Lean formalizations

## Fixed-scale solitaire counterexample

The main declaration is
`SolitaireCounterexample.eriksson_jonsson_sjoestrand_conjecture1_counterexample`
in `Solitaire/Limits.lean`. It proves a counterexample to Conjecture 1 as stated in
[Eriksson, Jonsson, and Sjoestrand (2020)](https://combinatorialpress.com/article/ojac/vol15/192.pdf),
with every scaling factor equal to 1.

The formal theorem constructs consecutive pick-layer sets, the unique stable
reference of largest mass at most `n`, and a sequence of recurrent partitions
of mass `n`. It proves pointwise convergence of the stable profiles for every
positive `x`, and proves that their limit is not a common limit of all recurrent
profiles. The two limits differ at `x = 1/2`. The convergence proofs also cover
`x = 1` and `x = 2`.

`Counterexample.lean` defines picking by counting layers, proves that its move
sorts the nonzero survivors and the new pile, and proves the finite dynamics and
maximality of the reference. `Limits.lean` defines the paper's downscaled profile
and proves the asymptotics and the final counterexample. For `n >= 5` the rule
and configurations are exactly those in the note. For `1 <= n < 5` the formal
sequence picks all layers through `n` and uses `[n]`; this finite modification
ensures the quantified sequences are defined on every positive deck size and
does not affect the limit.

## Corrected solitaire theorem

`Solitaire/GeneralTheorem.lean` proves the separate corrected theorem for
arbitrary layer sets containing 1, every actual recurrent configuration, and
every positive scaling sequence tending to infinity. The finite proof uses
actual multiset moves, exact return-time rank periodicity, attained birth
ranges and sorted-column interlacing. Stable configurations are classified,
and the reference has the largest mass at most n among all actual fixed points.

The explicit estimate is `4/(a*ε^2)+sqrt(2)/(ε*sqrt(n))`. It proves uniform
agreement of the recurrent and reference profiles on every interval `x≥ε>0`.
Every pointwise limit of the reference profiles therefore transfers to every
recurrent sequence. The public arbitrary-set wrapper is
`SolitaireGeneral.arbitrary_layers_uniform`.

The definitions' correspondence with the source publication remains subject
to mathematical review. The stated dynamical and analytic conclusions are
checked internally without unformalized mathematical lemmas as premises.

## Reproduce

Requires Lean 4.35.0 through elan and the pinned Mathlib revision in
`lake-manifest.json`:

```sh
MATHLIB_NO_CACHE_ON_UPDATE=1 lake update
lake exe cache get
cd ..
bash scripts/verify_lean.sh
```

The final declaration's `#print axioms` reports `propext`, `Classical.choice`,
and `Quot.sound`, the standard Lean axioms; it does not depend on `sorryAx`,
`native_decide`, or a project-specific axiom.

## Additional repository proofs

This package also hosts the complete War, Pham, Batista, CUT Family B, symmetric
four-point density and nonmixed-gap density proofs, the general CUT
arithmetic-periodicity test, and partial formalizations of
the remaining repository results. See the repository-wide
[Lean verification report](../docs/lean-status.md) for exact scope.
Run `scripts/verify_lean.sh` from the repository root to build and kernel-recheck
all formalizations and audit every project theorem for additional axioms.

## Pham denominator degree

`Conjectures.DenominatorTheorem` proves the primary and reverse-complement
identities from actual Bulgarian-solitaire dynamics. The main declarations are
`DenominatorForest.pham_denominator_counterexample` and
`DenominatorForest.pham_dual_denominator`. They include primitive period 10,
coefficientwise limits of the finite first-entry orbit levels, coprimality,
reduced denominator degrees 5 and 10, and minimality among all nonzero
alternative denominators. The proof derives rationality from finite prefix
recursions. See the [direct proof guide](../results/pham-denominator-degree/FORMAL_PROOF.md).

## General compact Motzkin theorem

`Conjectures.MotzkinCompact` proves `Motzkin.compact_two_difference_theorem`: the
actual density equals the continuous-character supremum in any compact
Hausdorff abelian group with invariant probability measure, including zero
differences. Its 34-module closure passed strict source, the 664-theorem
standard-axiom audit, and exact independent kernel replay.
`MotzkinRankTwoRelations` adds formulas for the stated relation generators and
finite-relation Borel attainment. Its 39-module closure passed a 729-theorem
audit and independent replay. The cyclic formulas for all positive moduli,
gcd scaling, odd-cycle criterion, and example passed a 48-module closure
with an 812-theorem audit and independent replay. Exhaustive basis existence,
explicit interval witnesses, and algorithmic claims remain candidates.


`Conjectures.MotzkinDensity` connects actual measurable-set density and the
continuous-character supremum. `Motzkin.finite_two_difference_theorem` proves
the exact equality for every finite abelian group generated by the two marked
elements, with an actual optimizing independent set and circle character.
`Motzkin.characterValue_le_density` is the general measurable lower bound.

## Concrete CUT games

`Conjectures.CutPeriodWeightTheorem` proves `CutPeriod.Weight.both_games_exact`.
The actual games with cuts `{1,2,8}` and `{1,2,7,8}` equal the stated sequence
for every natural pile size. Both have least positive eventual period 12,
saltus 8, and earliest period-12 start 7. The compact certificates cover both
collision exclusion and every smaller option value. The seven new sources and
all 23 modules in their exact closure passed the source, axiom, and independent
kernel gates.

## Erdős 607 geometry and profile

`LineSizeRecordCount` proves equality of actual geometric record counts and
canonical feasible-tuple counts for every n. Its exact construction and
ordinary-line dependency have no unproved geometric premise. The core/gap
weight equivalence is checked separately.

`LineSizeAnalyticProfile` proves the exact saddle value, unique critical
point, curvature, global Gaussian bound, and moment identities.
`LineSizeEulerKernel` gives the smooth regular part at the singular endpoint.
`LineSizeEulerProduct` proves the exact square-root correction and the uniform
logarithmic error bound for the literal finite product. `LineSizeTuplesCandidate`
provides canonical core/tail reconstruction and cumulative cost counting.
All these components have source, axiom, and independent kernel receipts.
`LineSizeGeneratingFunction` adds the exact coefficientwise generating
function; its 14-module closure passed a 496-theorem audit and independent
replay. Analytic evaluation and the sharp coefficient asymptotic remain
unfinished.

## Growing rectangles and finite planes

`Conjectures.RectangleAsymptotic` proves the full logarithmic asymptotic for
integer-sided real-position tilings, uniformly over every width at least the
height. `Conjectures.RectangleRealBoundary` includes boundary coverage.
See [the checked statement](../results/rectangle-partition-asymptotics/LEAN.md).

`Loneliness.Pigeonhole.four_speed_cutoff` gives the unconditional coordinate
bound 5,832 below `2/9`. The accepted plane theorem includes all 64 finite
certificate blocks. With the explicit `FourSpeedGap` input,
`five_speed_finite_or_critical_quadruple` bounds every primitive nonfamily
five-speed tuple below `1/5` by 279,841. The remaining bounded classification
is separate work. See [the cutoff guide](../results/five-speed-spectrum/PIGEONHOLE_REDUCTION_LEAN.md).

## Li coefficient-sign formalization

`Conjectures.LiMain` proves `Li.li_coefficient`, and
`Conjectures.LiFullCoeff` / `Conjectures.LiFullCoeffTrunc` prove the full
`e_3 e_2^14` coefficient `+29` for every finite colour type with at least 31
colours. `Conjectures.LiTriplesFinal` proves the connected-partition count
`b_{(3,2^14)}(T) = 8`; `Conjectures.LiPartitionsFinal` and
`Conjectures.LiPartitionsCount` prove that all 6,842 integer partitions of 31
occur as connected partition types, with a checked graph-component bridge and
exact cardinality. See [the Lean note](../results/li-coefficient-sign/LEAN.md).
