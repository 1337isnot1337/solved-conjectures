# Two-difference Motzkin density

[Collection](../../README.md) · [Catalogue](../../CONTENTS.md) · [Verification](../../docs/verification.md) · [Lean status](../../docs/lean-status.md)

## Result

The exact character formula for any pair in any compact abelian group, including noncyclic finite subgroups. The cyclic maximum-independent-set problem has a prior 2026 solution.

## Proof and sources

Read [the proof](PROOF.md) for the original problem, assumptions, argument, and cited sources. These notes are unrefereed.

## Verification

Run from the repository root:

```bash
python3 results/two-difference-motzkin/verify.py
```

See [the verification guide](../../docs/verification.md) for dependencies and the distinction between computational checks and formal proofs.

## Formalization

`Motzkin.compact_two_difference_theorem` proves the general compact-group
character formula. Its definitions use actual Borel avoiding sets and actual
continuous circle characters. The group is any compact Hausdorff abelian
group with Borel measurable space and a given invariant probability measure.
The statement includes zero differences and imposes no generation, rank,
closed-subgroup, or second-countability condition.

The complete 34-module closure passed strict source checking, a 664-theorem
standard-axiom audit, and independent kernel replay in
[the hosted job](https://github.com/1337isnot1337/solved-conjectures/actions/runs/44460317093/job/135345252509).
The [exact receipt](../../docs/motzkin-compact-hosted-receipt.json) records the
unchanged sources, gate inputs, and completed checks.

The finite theorem also supplies both an attaining independent set and an
attaining circle character. The formulas for explicitly stated relation bases
and Borel attainment under two independent finite relations are now checked;
their 39-module closure passed a 729-theorem audit and independent replay.
See [the relation receipt](../../docs/motzkin-relations-hosted-receipt.json).
The cyclic formulas for all positive moduli, gcd scaling, generated-case
Hermite basis, odd-cycle sharpness criterion, and stated example are now
checked. Rational-circle density and abstract Borel attainment are included.
The 48-module closure passed strict sources, an 812-theorem axiom audit, and
independent replay; see the [cyclic receipt](../../docs/motzkin-cyclic-hosted-receipt.json).

The literal fixed character-window witness is now checked. Its unshifted
half-open preimage has exactly the minimum of the two character distances as
its measure and avoids both differences, including finite-image and zero-score
cases. The exact five-module closure passed strict sources, a 53-theorem axiom
audit, and independent kernel replay; see the
[character-window receipt](../../docs/verification/motzkin-character-window-fea6cba2.json).

The exact floor-sum evaluator, attaining character, Hermite independence
number, cyclic gcd conversion, and explicit arithmetic complexity bounds
are checked and registered. For positive normalized Hermite inputs, the
formal algorithm uses at most `256*((m*k).log2+1)^2` metered arithmetic
operations, and its recorded integers have at most `6*((m*k).log2+1)` bits.
The 65-module closure passed strict sources, a 1,212-theorem audit, and
independent replay; see the [evaluator receipt](../../docs/verification/motzkin-evaluator-df244bd9.json).

Literal half-open rational interval unions now provide explicit maximizing
sets with proved measure and avoidance. Their 46-module closure passed strict
sources, a 795-theorem audit, and independent replay; see the
[rational-interval receipt](../../docs/verification/motzkin-rational-intervals-ad125705.json).

Exhaustive relation-basis existence and the resulting all-subgroup evaluation
trichotomy remain candidates.
See [the status report](../../docs/lean-status.md) for the precise checked scope.

## Supporting files

- [`exact.py`](exact.py)
