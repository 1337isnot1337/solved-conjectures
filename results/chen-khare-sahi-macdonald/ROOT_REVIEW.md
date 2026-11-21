# Independent root review

Reviewed 21 November 2026. The complete disproof passes this second independent mathematical review. The exact target is the majorization-to-Muirhead-semiring implication in Conjecture 5 of [Chen–Khare–Sahi, arXiv:2509.19649v2](https://arxiv.org/html/2509.19649v2#S5). Ordinary evaluation positivity is a separate assertion and is not refuted here.

## Source scope

I read the semiring definition preceding Theorem 1.4, the integer-partition conventions, and every clause of Conjecture 5. The semiring contains nonnegative real linear combinations of finite products of normalized monomials and same-degree dominance differences. Assertion (2') explicitly quantifies over every parameter pair in the open unit square. The partitions (4,2,0) and (4,1,1), with q=1/10 and t=9/10, satisfy the source's exact hypotheses.

The distinction between the full semiring and the smaller cone is essential. A functional that tests only individual dominance differences would not prove this result. The proof does not make that mistake.

## Exhaustive coverage of the semiring

I independently checked the reduction to homogeneous degree six. Projecting a semiring representation onto this degree preserves nonnegative coefficients and keeps exactly the products of total degree six. The proof's noncancellation argument also justifies discarding the other degrees.

Telescoping along saturated dominance chains replaces every difference by a sum of cover differences. Products of ordinary normalized monomials have nonnegative monomial coefficients and can be replaced by nonnegative combinations of individual normalized monomials. Thus the exhaustive list contains at most three difference factors, because each nonzero difference has degree at least two.

The degree-two through degree-six cover counts are 1, 2, 3, 4, and 7. With a possible remaining ordinary monomial factor, they give 27 one-difference products, 10 two-difference products, and one triple product. Together with the seven pure degree-six monomials, these generate the entire required homogeneous cone. This is a proof of exhaustiveness, not a search cutoff.

I inspected and replayed both independently written cone implementations. Both reproduce all 38 displayed rational values; every value is nonnegative, including the exact zeros. The orbit normalization converts the functional values on normalized monomials to those in equation (4) correctly.

## Polynomial identification and strict separation

I checked the first Macdonald difference operator and its eigenvalues against the primary [Garsia–Haiman formulas (2.1)–(2.5)](https://math.berkeley.edu/~mhaiman/ftp/remarkable-qtcat/qtcat.pdf), printed page 14. The three cleared-denominator factors in PROOF.md have the correct signs. The explicit polynomials are monic with the required dominance support, and all seven degree-six eigenvalues at the chosen parameters are distinct. The exact coefficient identities therefore identify the two Macdonald polynomials uniquely.

The main verifier passed both eigenidentities, the normalizations at the all-ones vector, and the final functional subtraction. I also inspected and replayed the independent Hall-inner-product construction. It uses all eleven partitions of six before specialization to three variables; it imports no discovery, branching, or eigenoperator code. It produces the same coefficients.

The resulting functional value on the normalized difference is exactly

```math
-\frac{4538292661539}{106631184392870}\lt0.
```

This is incompatible with membership in the complete homogeneous semiring cone. It refutes the conjecture's full equivalence, even though the polynomial takes nonnegative values on the nonnegative orthant.

## Family extensions

The saturation proof for multiplication by powers of e3 passes. Removing each generator's lowest power of e3 leaves a nonzero polynomial with a nonnegative restriction to the boundary x3=0. For a dominance difference the smallest-part inequality gives precisely the claimed power; distinct residual monomial orbits cannot cancel identically on the boundary. Products retain this property. The least boundary order in a finite sum with nonnegative coefficients cannot cancel. Division by a common e3 power therefore preserves semiring membership, which proves the counterexamples for every rectangular translate.

I checked the Hall–Littlewood note's orbit multiplicities, normalization polynomials, functional values and factorization. Its quadratic numerator is negative throughout the stated interval, and its two normalization denominators stay positive. The full Hall inner product has positive Gram–Schmidt norm denominators at q=0 for each fixed interior t. This supplies the continuity needed to obtain positive-q counterexamples. The boundary limit is an additional family argument, not a substitute for the explicit admissible rational point.

## Prior-resolution review

The separate [source audit](SOURCE_AUDIT.md) records both search engines, the author-hosted latest manuscript, current papers, prior examples, public archives, issue searches and failed-access limits. I independently read [Sra's October 2026 manuscript](https://hexagonmath.org/pdf/2610.00725v1), especially Certificate 4.1 and its sorted-chamber construction. It proves ordinary evaluation positivity for exactly the same partition pair. Its rational Bernstein coefficients certify positivity after a change to ordered variables; they do not represent the symmetric polynomial as a product-sum of Muirhead generators. That theorem is compatible with this disproof.

Fresh searches for the exact identifier, Macdonald Muirhead-semiring counterexamples and Hall–Littlewood semiring results found no earlier settlement. I also searched all 26 complete source-letter indexes of [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog/tree/ca8d4d44ba3db527f19f28928c240168f545ecfe), extending the independent audit's C/K/S index checks. No exact target match appeared. Failed global code searches are not treated as negative evidence.

The source's existing cone counterexample and reverse-parameter Jack example concern different statements. Neither settles this Macdonald semiring conjecture. No earlier resolution was located within the documented search limits. The package supplies a complete exact algebraic disproof, two independent mathematical reviews and separately reproducible checks. It remains unrefereed and has no Lean formalization.
