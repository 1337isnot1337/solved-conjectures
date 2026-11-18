# Lean verification of the fixed-scale counterexample

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

**Scope:** the Lean theorem verifies the fixed-scale counterexample. It does
**not** verify the separate theorem in the note for arbitrary layer sets and
diverging scaling factors. The correspondence between the paper's definitions
and their formal transcription remains a matter for mathematical review.

## Reproduce

Requires Lean 4.35.0 through elan and the pinned Mathlib revision in
`lake-manifest.json`:

```sh
MATHLIB_NO_CACHE_ON_UPDATE=1 lake update
lake exe cache get
lake build
lake env leanchecker Solitaire.Limits
```

The final declaration's `#print axioms` reports `propext`, `Classical.choice`,
and `Quot.sound`, the standard Lean axioms; it does not depend on `sorryAx`,
`native_decide`, or a project-specific axiom.

## Additional repository proofs

This package also hosts the War proofs and partial formalizations of the Pham,
Batista, and CUT Family B arguments. See the repository-wide
[Lean verification report](../../LEAN_VERIFICATION.md) for exact scope.
Run `scripts/verify_lean.sh` from the repository root to build and kernel-recheck
all formalizations and audit every project theorem for additional axioms.
