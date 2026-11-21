# Independent review of the orthogonal construction

Reviewed 21 November 2026 by the separate `demath_agentboard` lane, at the
coordinator's request. The file path was agreed with the owning lane before
writing. No owner source file or frozen research file was changed.

**Finding:** the stated restricted obstructions are correct. The review found
no algebra error or missing rational parameter chart. They do not prove
nonexistence of a general order-five bimagic square and do not complete a
bounty.

## What was checked

The review covers `orthogonal-reduction.md`, `centralizer-exclusion.md`,
`centralizer_elimination.py`, the four `centralizer-b0` component outputs, and
the exact surviving-point verification. The extra `b=2` calculation agrees
with the unreflected calculation after exchanging the two constraint
polynomials; it is not needed for the main exclusion.

The orthogonal model is an additional assumption. A centered bimagic matrix
has equal row and column squared norms, but this does not imply
`AA^T=A^TA=I-J/5`. The notes correctly avoid claiming such an implication.
Affine changes do preserve both sets of equal line sums and distinctness, so
a rational witness within this model would give an integer witness after
scaling and translation.

## Determinant-positive branch

The Cayley/Pfaffian argument is valid.

With `Q1=1`, the restriction to `1^perp` has trace zero and determinant one.
When `I+Q` is invertible, its rational Cayley transform `K` is skew-symmetric
and satisfies `K1=0`. If its two real skew-block parameters are `a,b`, the
trace equation gives `a^2 b^2=1`. Thus `K` has rank four; the argument does
not assume full rank before establishing it.

The signed principal Pfaffian vector is nonzero and lies in `ker K`. That
kernel is one-dimensional and already contains the all-ones vector. Therefore
the five signed Pfaffian coordinates are the same rational number `p`.
Equivalently, the unsigned Pfaffians differ only in the prescribed alternating
signs. The characteristic-polynomial coefficient is the sum of their squares,
so `5p^2=1`, which has no rational solution.

The excluded Cayley chart is also handled. A negative-one eigenvalue on the
four-dimensional orthogonal complement has even multiplicity. Trace zero
rules out multiplicity four. Multiplicity two leaves two unit-modulus
eigenvalues summing to two, so both equal one. Orthogonal matrices are
diagonalizable over the complex numbers; hence this case satisfies `Q^2=I`
and `Q=Q^T`. Subtracting `J/5` preserves symmetry and forces repeated
off-diagonal entries. The singular chart therefore cannot hide a qualifying
witness.

## Determinant-negative branch and its limits

The spectral argument giving eigenvalues `{1,-1,i,-i}` on `1^perp` is correct.
It yields `Q^4=I`; applying it to `RQ` gives `(RQ)^4=I` when the second trace
condition holds. Neither relation makes `Q` a permutation or places it in the
particular centralizer orbit. The notes retain that distinction.

## Independent regeneration of the four components

I regenerated the matrix using a different representation from the source
script's sum of projectors. Let `B=(1,e,f,g,h)` be the column-basis matrix.
Its Gram matrix is exactly

```math
B^TB=\operatorname{diag}(5,4,20,2,2).
```

In this basis the two rotation blocks are

```math
\begin{pmatrix}c&-5s\\s&c\end{pmatrix},\qquad
\begin{pmatrix}d&-t\\t&d\end{pmatrix}.
```

Multiplying these blocks by the coordinate reflections and conjugating by
`B` reproduces all four source matrices `S`. Computing `SPS^T` from these
blocks independently reproduces each stored diagonal and antidiagonal
numerator exactly over the rationals.

Every rational orthogonal `S` fixing `1` and commuting with `R` preserves the
two indicated planes. Its restrictions belong to the orthogonal groups for
the Gram matrices `diag(4,20)` and `diag(2,2)`, each of which has a rotation
and a reflection component. The displayed rational
conic parameterizations cover their rotation components, except for the point
added at infinity. The two fixed reflections supply the other components.
Thus the four-component projective parameter space covers the full stated
centralizer, not merely a finite neighborhood of its identity.

## Finite parameters and projective boundaries

All four difference factorizations in `centralizer-exclusion.md` were checked
against the independently regenerated polynomials. Their irrational factors
have no rational roots; their strictly positive factors cannot vanish over
the reals. The finite lists therefore follow directly from the factored
equations, without assuming that every root of a resultant lifts to a
solution.

I also checked the leading coefficients in each parameter independently.

| Plus-plane reflection | Minus-plane reflection | Complete rational parameter set |
| --- | --- | --- |
| No | No | `{0,infinity} x {0,infinity}` |
| No | Yes | `{0,infinity} x {0,infinity}` |
| Yes | No | `{0,infinity} x {-1,1}` |
| Yes | Yes | `{0,infinity} x {-1,1}` |

For the plus-reflected components, the `v=infinity` difference forces finite
rational `u=0`, where the first boundary polynomial is `-1`. The
double-infinity coefficient is `-625`. These charts contain no additional
solutions. For the other two components, the double-infinity point is
included and was evaluated explicitly. No division by a vanishing rational
denominator occurs in the finite charts, and the actual limiting rotation
matrices were used at infinity.

## Resultant and surviving-point checks

I verified each stored resultant through a decomposition different from the
source script's direct degree-eight resultant. With `H=G-F`, factor `H` in
the eliminated variable and compute the resultants with its linear and
quadratic factors. Restoring the appropriate leading-coefficient power gives
the exact stored resultant in all four components; the quotient is 1.
The common factors divided out by the source script are constants, 4 or 1,
so no common-zero component is discarded.

An independent evaluation using the basis blocks gives all sixteen listed
projective parameter points. Each resulting `Q` is a permutation matrix;
there are eight distinct matrices. Every trace and squared-diagonal condition
holds, but `5Q-J` has only the values `-1` and `4`. It fails the required
pairwise distinctness. The owner's separate `fractions.Fraction` script was
also replayed without modifying its output; its parsed result matches the
stored verification JSON exactly.

As an additional scope check, enumeration of the 120 permutations gives 18
order-four seeds satisfying both trace conditions. The reversal-centralizing
permutation group has order eight and gives seed orbits of sizes 8, 8, and 2.
The first contains the affine seeds `b=0,1,2,4`; the second is its transpose;
the last commutes with reversal. This confirms the coordinator's enumeration.
It is still a statement about permutation seeds, not about all rational
orthogonal matrices.

The subsequently appended corollary for all permutation seeds is valid.
Conjugating a seed first by a reversal-centralizing permutation can be
absorbed into `S`. Transposition preserves the diagonal conditions and
distinctness, covering the second size-eight orbit. A seed in the final
size-two orbit continues to commute with `R` after centralizer conjugation,
so its opposite entries repeat. Determinant-positive permutation seeds are
already covered by the earlier symmetric-matrix obstruction.

## Reviewed computational identities

The following SHA-256 values identify the files reviewed. This review does
not claim Lean verification or independent sponsor acceptance.

| File | SHA-256 |
| --- | --- |
| `centralizer_elimination.py` | `66174bd4589517e5b594519501537f7a4d78fbcf42f5dd6cc9784beb8eb6d88a` |
| `centralizer-b0.json` | `feda32ececb8ec64685411c46a20791423e5e8ed6a74c320ee9d81d3901a7e63` |
| `centralizer-b0-plus.json` | `2df0ee654044c13018c74d12711a7224a31dea30a1581096a6c26216502a4743` |
| `centralizer-b0-minus.json` | `50e4cbcaebd575aa8e6506f62135042d786a098cb0de45cb98c4af92ecf592d3` |
| `centralizer-b0-plus-minus.json` | `254d41055a98373b2591bc888ac802c31786b035663c7609766bbd2ac1faef6b` |
| `verify_centralizer_points.py` | `2d09a039b9b7ddc7bae5ad54e357a6181201652063d6ccfadac89d5face53bdb` |
| `centralizer-point-verification.json` | `30abf8d8d5b3b485eec8d5e18107743d271573386800ab615a09c57550b11d23` |

The correct conclusion is that the determinant-positive orthogonal branch
and the rational centralizer orbits of all permutation seeds cannot supply a
distinct-entry witness. The determinant-negative orthogonal branch outside
those orbits and general bimagic matrices remain unaddressed.
