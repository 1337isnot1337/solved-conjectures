# Lean scope for Novelli–Thibon's conjecture

Partial Lean verification of the existing [written proof](PROOF.md)
of the intended Conjecture 5.7 in the
[primary source](https://arxiv.org/html/2502.09072v2#S5.SS7).
The published index correction and attribution are unchanged.

Lean constructs left-to-right standardization by stable sorting.
It checks that the inverse-descent fundamental word condition is
exactly the fiber of that standardization, and proves the strict
comparison identity for any distinct ordered positions. The
[linear response](../../lean/Conjectures/NovelliThibonLinearResponse.lean)
sums the identity with arbitrary weights on the ordered comparisons.
It holds in any finite ordered alphabet and in any commutative
semiring, including rings with signed edge contributions. This is
the exact comparison identity in §2 of the written proof, not a
finite numerical test of particular shapes.

Lean now checks the [literal diagram](../../lean/Conjectures/NovelliThibonDiagram.lean):
French reading order, the within-row and adjacent-row attacks, and
the vertical optional edges. It counts the leg-label fibers by the
original row lengths and proves the exact cancellation of the
adjacent-row count against the arm sum. For each fixed selection of
inversion indicators, Lean verifies the full
[optional-edge normalization](../../lean/Conjectures/NovelliThibonSourceNormalization.lean)
in the convention of Definition 5.3, including signed Laurent
exponents after canceling the powers of (q-1) and (q).

For the normalized finite-alphabet cell-filling expansion, Lean proves
the constant term and the full simultaneous
[first-order formula](../../lean/Conjectures/NovelliThibonFillingFirstOrder.lean)
of equations (9)–(11). It works in actual Mathlib dual numbers over any
commutative ring, for every diagram and every finite ordered alphabet.
No leg parameter is omitted: the formal support bound covers every
vertical edge.

The [Pieri checkpoint](../../lean/Conjectures/NovelliThibonPieriFirstMoments.lean)
proves the determinant extraction directly with signed alternants.
It shows that Mathlib's elementary symmetric polynomial of degree two
starts at the vertical two-box shape and that each multiplication by
the first power sum adds one literal Young diagram cell. The dominant
coefficient counts precisely the corresponding diagram chains. The
Schur extractor is the coordinate functional on the bialternant
characterization; applying it to the normalized filling moments gives
the row and leg factors times the diagram-chain count.

The [standard tableau model](../../lean/Conjectures/NovelliThibonTableauVertical.lean)
uses order-preserving, bijective labels on the actual diagram; the
first two labels occupy the prescribed French vertical pair. It
constructs the completion bijection by deleting and reinserting the
first remaining cell. The resulting cardinality is exactly the
Pieri chain count.

Lean also proves the [signed Laurent monomial product](../../lean/Conjectures/NovelliThibonLaurentProduct.lean)
for the normalized finite filling model. It groups each Schur
coefficient by its actual parameter exponent vector, sums the signed
multiplicities, and checks the product under arbitrary independent unit
specializations. The exponent on the right is the literal standard
tableau cardinality, not an abstract chain parameter.

The [source certificate](../../lean/Conjectures/NovelliThibonSourceCertificate.lean)
checks the commutative finite-alphabet identification for the original
graph sum in Definition 5.3. Right-to-left tie standardization derives
the ordinary strict-ascent LLT expansion. Complementing the fundamental
descent set and inverting the parameter gives the commutative descent
expansion of Lemma 4.2. Lean checks the exact diagram prefactors and
reassembles the original intermediate graphs, then identifies the
result with a genuine Mathlib Laurent polynomial under every unit
specialization for which the original rational expression is defined.
The monomial-product theorem is stated on the actual Laurent
coefficients using the bialternant Schur extractor.

The [signed graph checkpoint](../../lean/Conjectures/NovelliThibonSignedShape.lean)
checks the source expression when each fundamental function is evaluated
in the negative-first two-letter alphabet. Signed standardization
assigns an edge descent exactly when its head is marked negative.
The local incoming-attack count minus its vertical arm correction is
the literal column index. Reflecting each column then gives the exact
row-indexed product of the proposed hook specialization.

Lean additionally checks the [residual polynomial coefficients](../../lean/Conjectures/NovelliThibonHookProductCoefficients.lean)
after deleting the distinguished unit factor, the
[hook and nonhook Jacobi–Trudi determinants](../../lean/Conjectures/NovelliThibonHookJacobiTrudi.lean)
on the specialized complete homogeneous sequence, and
[the final comparison](../../lean/Conjectures/NovelliThibonHookExtraction.lean)
under an explicit signed Schur-expansion hypothesis.

This checks the intended monomial-product argument for Conjecture 5.7
in the finite commutative source model. Relating the finite signed
fundamental evaluation to the actual Schur expansion by virtual-alphabet
specialization remains open in Lean, as do independent general LLT
symmetry and Schur basis theorems. The general noncommutative lift,
Conjecture 5.4, and the trace assertions are outside this scope.

- [Finite-alphabet comparison replay](verification/finite-alphabet-comparison/receipt.json)
- [Diagram and first-order replay](verification/diagram-first-order/receipt.json)
- [Pieri and diagram-chain replay](verification/pieri-diagram-chains/receipt.json)
- [Standard tableau and Laurent product replay](verification/tableau-laurent-product/receipt.json)
- [Source graph to formal Laurent polynomial replay](verification/source-laurent-certificate/receipt.json)
- [Signed hook cell product and determinant replay](verification/signed-hook-cell-product/receipt.json)
