# Ulas's conjecture

## Verified partial result

For every positive block length `length`, the Lean development proves that
there is a positive count `r` such that every positive multiple `k * r`
admits infinitely many collections of exactly that many disjoint consecutive
blocks with square product. The construction actually places all starts
beyond any prescribed lower endpoint.

This does not prove the all-sufficiently-large-count conclusion. The campaign
completion count for this entry remains zero.

The exact finite-collection model uses positive natural starts `a`; its block
is `a+1, ..., a+length`. A solution is a finite set of starts with
`a + length ≤ b` whenever `a < b`, and the product of all block entries is a
natural square. Infinitude refers to infinitely many distinct collections.
It does not assert that every pair of different collections is disjoint.

The unconditional endpoint is
`UlasDisjointSquareBlocks.infinite_solutions_at_all_positive_multiples`.
The underlying stronger placement endpoint is
`UlasDisjointSquareBlocks.exists_positive_repeatable_count`.

## Source, argument, and attribution

Maciej Ulas posed Conjecture 4 on p. 333 of *On products of disjoint blocks of
consecutive integers*, Enseignement Mathématique 51 (2005), 331–334. The
statement fixes the length before the eventual block-count threshold.
The original range begins at length five; the repository proves a stronger
range beginning at length two. The checked partial theorem applies at every
positive length but does not settle the missing counts at any general length.

Primary source: <https://www.e-periodica.ch/view/ens-001/2005/51/417>;
publisher text: <https://www.e-periodica.ch/download/ens-001:2005:51/ocr-fulltext>.

This work formalizes sections 1 and 4 of the existing repository argument in
`results/ulas-disjoint-square-blocks/PROOF.md`, inspected on main commit
`23af608da3c74e58e894f793f62ee93e56450221`. The recorded proof was contributed
by Cinna Davis in commit `7103d0816dd50269109df21fb7f8370cd582c470`.
The repository credits earlier work of Ulas, Skałba, Bauer–Bennett,
Bennett–van Luijk, and Yıldız–Gürel. Its bounded literature search did not find
an earlier all-count result; this is not an absolute priority claim.

The affine proof uses the same parity mechanism with a different finite
encoding. Choose `n` whose harmonic sum exceeds `length`, and set `A = n!`.
Every `d` from one through `n` divides `A`. Candidate starts are
`(A / d) * t + length * j`, with `j < (A / d) * (n + 1)`.
After scaling a factor by `d`, all roots belong to one interval of length
`length * A * (n + 1)`. One extra coordinate for each denominator `d`
replaces the prime-factor coordinates in the written argument. The harmonic
surplus makes the number of candidate blocks exceed the number of binary
coordinates. A nonzero dependence over `ZMod 2` selects one fixed nonempty
subset in which every factor multiplicity is even. Evaluation gives a square
in the rationals; Mathlib's `Rat.isSquare_natCast_iff` returns the natural
square. Positive slopes and separated equal-slope offsets give disjoint
positive blocks for every sufficiently large parameter.

The residue reduction formalizes the source's stabilization argument.
Decreasing finite sets of available residues eventually stabilize. Persistent
residues form an additive monoid. Prime avoidance forces its set-gcd to one,
and Mathlib's proved numerical-semigroup conductor theorem supplies every
residue. Appending repeatable collections to one representative of each
residue then yields every sufficiently large count, with infinitely many
collections. This proof replaces the source's finite-group classification
with the equivalent numerical-semigroup argument.

## Explicit remaining obligations

`UlasDisjointSquareBlocks.eventual_infinite_of_prime_avoiding_tails` proves
the full eventual conclusion under the explicit hypothesis that, for every
prime `q` and every tail endpoint `T`, there is a valid collection beyond `T`
whose count is not divisible by `q`.

For `q = 2`, the written proof uses the uniform mean bound in Corollary 1 of
Andrew Granville and Kannan Soundararajan, *The spectrum of multiplicative
functions*, Annals of Mathematics 153 (2001), 407–470, followed by disjoint
probabilistic sampling and binary orthogonality. The relevant primary sources
are <https://annals.math.princeton.edu/2001/153-2/p04> and
<https://arxiv.org/pdf/math/9909190>. These analytic and probabilistic inputs
remain unformalized here.

For odd primes, the written proof uses a large binary-code kernel and a Walsh
inversion argument excluding prime divisibility of all nonzero weights.
That component also remains unformalized here. No custom axiom stands in
for any of these missing results.

## Verification

All six source modules were freshly compiled with Lean 4.35.0 and
`-DwarningAsError=true`. The repository's unchanged all-owned audit generator
checked every owned declaration, including private serialized declarations,
allowing only `propext`, `Classical.choice`, and `Quot.sound` transitively.
The unchanged repository replay helper ran the pinned stock `leanchecker`
over the exact six-module local import closure. All three scoped gates passed.

The [receipt](../../docs/verification/lean-ulas-20261124-162051/verification.json) contains exact source hashes and checked endpoints. The same directory holds the complete strict-build, all-owned axiom-audit, and kernel-replay logs, together with the generated audit source. All six modules and the six endpoint requirements are registered in the repository roots. The repository-wide build and website checks are separate gates and are not claimed by this scoped receipt.

From the `lean` directory, compile each listed module with `lake build`, run the generated `Audit.lean` through `lake env lean -DwarningAsError=true`, then run `lake env python3 ../scripts/replay_lean.py --root Conjectures.UlasDisjointSquareBlocks`. The default `scripts/verify_lean.sh` additionally checks the complete accepted repository package.
