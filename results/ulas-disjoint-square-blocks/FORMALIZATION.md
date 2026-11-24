# Lean formalization

[The Lean theorem](../../lean/Conjectures/UlasDisjointSquareBlocks.lean)
`UlasDisjointSquareBlocks.ulasConjecture` proves Conjecture 4 of Maciej
Ulas, *On products of disjoint blocks of consecutive integers* (2005),
p. 333. For each common length at least five, there is a threshold such that
every fixed count at or above it admits infinitely many distinct collections of
that cardinality. Each collection consists of pairwise disjoint intervals with
a square product. The theorem `eventual_infinite` proves the same result
for every positive common length, including the range of the
[written proof](PROOF.md). The [bounded mixed-length theorem](MIXED-LENGTHS.md)
is outside the scope of this formalization.

The Lean model uses a finite set of starts. A positive start `a` represents
the interval from `a + 1` through `a + length`. The verified witnesses satisfy
this stronger start condition and therefore give the claimed collections of
positive integers. The threshold may depend on the common length.

## Proof

The affine construction and residue reduction reuse the checked development
from research commit `af330908067a565f519904a453652e84d6bac093`. The affine
construction gives a positive repeatable count for each positive length.
The residue argument upgrades this to eventual infinitude once every
prescribed prime can be avoided by a count arbitrarily far out. The recorded
common-length proof is credited to Cinna Davis in commit
`7103d0816dd50269109df21fb7f8370cd582c470`. The printed statement is in the
[original paper](https://www.e-periodica.ch/view/ens-001/2005/51/417).

For an odd prime, choose a basis among the prime-parity columns in a large
disjoint family. Each outside column has a zero-sum subset consisting of
itself and a subset of the basis. If all square subfamilies had cardinality
divisible by that prime, the basis subsets would have size congruent to
minus one and their pairwise intersections would have size congruent to zero.
Their indicators would then form an independent family over the odd prime
field, with more members than the size of the basis.

For the prime two, append a count-parity coordinate to each block column.
Choose a largest independent family among separated blocks in a bounded
tail. Each functional that kills this family must also kill any block
column compatible with its separation conditions. A finite set of test
positions forces the functional's character to be constant on one block's
entries by comparing consecutive starts at multiples of the block length.
For even length this rules out a functional separating the odd-count
target from the selected span. For odd length, use the same positions at
both an anchor and its multiple by the product of one fixed earlier block.
A separating functional would give the same character value at both
anchors while assigning a nonzero value to that fixed product. The
resulting even-count subset cancels the squareclass of the earlier block.
Chebyshev's upper bound on the number of primes supplies enough candidate
positions to avoid the finitely many starts incompatible with the chosen
family.

## Verification

The [local receipt](verification/receipt.json) records the nine-module
strict build, complete owned-declaration axiom audit, and stock-kernel replay
with Lean 4.35.0. The only allowed transitive axioms are `propext`,
`Classical.choice`, and `Quot.sound`. Run the scoped check from the repository
root with the pinned dependencies available.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.UlasDisjointSquareBlocks \
  --require UlasDisjointSquareBlocks.ulasConjecture \
  --require UlasDisjointSquareBlocks.eventual_infinite \
  --out /tmp/ulas-lean-verification
```
