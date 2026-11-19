# Hadamard order 2396 — partial results

**Open.** The Hadamard conjecture asks whether a sign matrix with mutually orthogonal rows exists at every order divisible by four. Both the November survey and the subsequent construction table list 2396 as the smallest unresolved order. [Egan, Kotsireas, London and Ó Catháin, Table 5](https://arxiv.org/html/2610.27175v2) · [Kumar, updated table](https://github.com/vatskishan03/Hadamard/blob/d885022/FRONTIER.md)

**Automorphism obstruction for the whole order.** Any real Hadamard matrix of order 2396 must have an automorphism group of order coprime to 479, allowing signed row and column permutations. The proof rules out a cyclotomic norm in two ways. [Proof and arithmetic certificate](AUTOMORPHISMS.md)

A binary Legendre pair on an abelian group of order 1197 would yield such a matrix. We bound its group of common multipliers by nine, allowing independent translations of the two rows. For a bordered quadruple of length 598, we also exclude a common order-eleven multiplier fixing the rows in suitable origins. Smaller symmetry groups and other constructions remain possible. The results are unrefereed and carry no priority claim. Their full Lean formalizations remain in progress; the verified automorphism theorem is described below. [Proof](PROOF.md)

For a third route, we show that a core with quotient of order four and the stipulated autocorrelations always admits a fixed border after normalization. At order 2396 this leaves 14 possible coset-sum patterns. A binary core realizing one of them with the required correlations is still needed. [Border reduction and attribution](BORDER.md)

## Checked Lean components

**Lean status:** partial overall. The signed-automorphism theorem, both
norm-obstruction proofs, fixed-border symmetry bounds, complete conditional
border construction with all fourteen patterns, and length-598 order-eleven
obstruction are Lean-verified. For length 1197 the common-multiplier order is
proved to divide 27; the sharper bound of nine, finite quotient/no-lift
certificates, and two-row construction remain separate obligations.

For every real Hadamard matrix of order 2396, the full signed row/column
automorphism group has no element of order 479. Its cardinality and the
cardinality of every subgroup quotient are not divisible by 479. The proof
constructs the actual cycle labels, Fourier indicator matrix, two prime
reductions, and forbidden norm integer. The 28-module closure passed strict
sources, a 297-theorem standard-axiom audit, and unchanged pinned-kernel replay.
[Complete theorem and receipt](../../docs/lean-status.md#complete-hadamard-order-479-automorphism-obstruction).

Both norm proofs are checked in the actual cyclotomic field. The first
constructs a Frobenius unit and root-of-unity twist and descends to the
quadratic norm equation. The independent ideal-class proof establishes the
order-five class of every prime above 599 in the quadratic field and derives
the contradiction from the relative norm. Its 15-module closure passed the
same three gates, with 164 audited project theorems.
[Independent ideal-class proof and receipt](../../docs/lean-status.md#complete-independent-ideal-class-norm-obstruction).

The checked components also include the arithmetic exclusions, integral-basis
coefficient argument, literal Fourier identities, signed normalization,
unique quadratic subfield and its exact equal-parity description of integer
coordinates. [Quadratic-model receipt](../../docs/lean-status.md#complete-quadratic-integer-model). These formalizations do not assert existence of a Hadamard matrix
at 2396.

For an arbitrary finite abelian group with a subgroup of size 149 and index
four, the actual core correlation equations force the full common multiplier
group to be cyclic of order dividing four. Every subgroup preserving the
four rows has at least 151 actual sign orbits. The formal proof constructs
the product coordinates, transports the rows and correlations, and identifies
the full symmetry group and its orbit quotient. No splitting, normalization,
or baseline-pattern enumeration is assumed. All 12 modules passed strict
sources, a 216-theorem standard-axiom audit, and unchanged pinned-kernel replay.
[Complete multiplier theorem and receipt](../../docs/lean-status.md#complete-fixed-border-multiplier-and-orbit-bounds).

The finite-border transport is also checked. Starting from the finite
certificate's explicit sign conditions and five matrix identities, two
modules construct the actual border matrices for every quotient of
cardinality four and prove the reflected cross term. The canonical
sixteen-position layout is connected to the block-product layout. The
exact closure passed a 66-theorem audit and independent kernel replay.
The later literal-certificate and full-construction registrations below
discharge those finite identities and the final Hadamard assembly.
[Transport statement and receipt](../../docs/lean-status.md#fixed-border-certificate-transport).

The actual row-normalization operations are also checked. Given one constant
and three single-exception compression shapes, the theorem constructs a
row permutation, signs, and translations on the original group. The
resulting rows have the stated normalized compressions, remain sign-valued,
and preserve every combined periodic autocorrelation. This two-module
closure passed a 14-theorem audit and independent kernel replay. The later
full-construction proof below derives its input shapes from the raw correlations.
[Actual row operations and receipt](../../docs/lean-status.md#actual-row-normalization-from-compression-shapes).

## Reproduce the finite checks

Run from this directory with a C++17 compiler, Python with assertions enabled, and NumPy.

```sh
c++ -O2 -std=c++17 quotient133.cpp -o /tmp/hadamard-quotient133
/tmp/hadamard-quotient133 > /tmp/hadamard-quotient133.pairs
diff -u quotient133.pairs /tmp/hadamard-quotient133.pairs
python3 audit.py
python3 border.py
python3 automorphisms.py
```

The C++ program lists all 32 ordered pairs that pass the 133-point quotient. The Python audit recovers that list independently, checks all 133 shifts for every survivor, and exhausts the possible 21-point margins of all 32. Every survivor fails this necessary lifting condition.


The literal finite-border certificate is now checked. All sign, Gram,
balanced-column, and cross identities of the displayed matrices are proved,
and actual matrices are transported to every quotient of cardinality four.
[Literal-border receipt](../../docs/verification/hadamard-fixed-border-literal-ee6a8b03.json).

The length-598 obstruction is also checked from the original four sign rows
and their nonzero-shift correlation equation. An actual multiplier of order
eleven cannot fix all four rows, including after independent choices of
origins. Its eight-module closure passed strict source checks, a 141-theorem
axiom audit, and independent pinned-kernel replay.
[Length-598 receipt](../../docs/verification/hadamard598-multiplier-daa7d2c5.json).
The complete conditional border construction is now checked from the original
sign rows and raw correlations on an arbitrary finite abelian group with an
actual index-four subgroup. The proof derives the compression shapes and all
normalization operations, discharges the actual core and literal-border
identities, and constructs the final matrix. For subgroup size 149 it returns
a sign matrix on `Fin 2396` with Gram matrix `2396 • 1`. The fourteen-pattern
classification is also derived from the original rows, with the actual sign,
translation, and permutation witnesses retained.
[Construction and pattern receipts](../../docs/lean-status.md#complete-conditional-fixed-border-construction-and-fourteen-patterns).

For an actual length-1197 Legendre pair, the common-multiplier order is now
proved to divide 27. The row sums, centering, group coordinates, and odd-order
obstruction are all derived. An invariant quotient of order three is also
constructed. The sharper bound of nine still requires exclusion of order 27
through the finite quotient/no-lift packet.
[Reduction receipts](../../docs/lean-status.md#checked-length-1197-reduction-to-order-27).
