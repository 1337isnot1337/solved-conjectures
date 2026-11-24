# Hajdu–Sárközy’s shifted-products conjecture

Independent mathematical and statement review by the `lean_environment` lane,
24 November 2026. The review does not change the author's Lean sources.

## Finding

The 13 new `HajduSarkozyProducts*.lean` modules prove the full original
two-variable conjecture, with every pair of exponents at least two and every
finite modification. They also prove the recorded summable-family theorem and
the all-nonzero-integral-shift perturbation theorem. I found no missing
mathematical bridge or weakened endpoint. The separate last-sentence extension
to an arbitrary finite number of variables is not formalized and must not be
described as completed.

The fresh 24-module strict build, all-owned declaration audit, and stock
kernel replay have passed. I independently validated the finished receipt,
all source and object hashes, all 27 command logs, the generated audit source,
the complete declaration inventory, the exact local import closure, the
stock-checker replay set, the verification controls, and both executable
hashes. The receipt SHA-256 is
`7e4fcf8ae68dbfdac616ec763d407ccd87db22693422ff620001b219ed586124`.
The audit includes 294 owned declarations, 250 theorems, no private
declarations, and all 53 required endpoints; the only allowed transitive
axioms are `propext`, `Classical.choice`, and `Quot.sound`. Exact 24-module
stock replay passed in 539.473 seconds. The independent artifact check is
[the independent artifact validation](verification/independent-verification.json), SHA-256
`3651c569434c7724fe51d84bc0405b7f560e1bf4c0be6aa98fdbf793b843bb08`.

## Sources and frozen scope

The original statement is Conjecture 1, printed page 198, in L. Hajdu and
A. Sárközy, *On multiplicative decompositions of polynomial sequences, II*,
Acta Arithmetica 186 (2018), 191–200, DOI
[10.4064/aa171116-7-3](https://doi.org/10.4064/aa171116-7-3).
I read the [publisher's primary PDF](https://www.impan.pl/shop/en/publication/transaction/download/product/112684),
including its positive-integer convention, Definitions 1.1–1.3, Remark 2,
Conjecture 1, and the separately highlighted Problem 2′. The conjecture is
about all exponents greater than one; it is not restricted to the coprime case,
the pair (2,3), or a fixed exponent.

The exact argument used is the existing
`results/hajdu-sarkozy-shifted-products/PROOF.md` at commit
`83c325ae559864ec0b5e916d90a342b50a81de7f`, SHA-256
`78fcdb7eaebf0e5f6ae1a8b844d64f479ee4df0d3b5b7cbcd0780f4c016c6e74`.
It was recorded by Cinna Davis and credits Hajdu–Sárközy's prior cases and
C. H. Yip's graph and geometric-bin methods. The source's bounded priority
search is not a proof of worldwide priority, and the Lean headers preserve
that qualification.

The reviewed source manifest is
[the frozen source manifest](verification/frozen-sources.json), SHA-256
`28fae8b3f12950ecdca6268cd67c4a9fd67cdbe6c01f78428e21543a41df0384`.
I independently rehashed all 24 files. The 11 earlier shifted-power modules
are byte-identical to the previously reviewed and checked perturbation
development; their hashes match its original receipt. I read all 13 new
modules in full and reused the earlier independent review only for those
unchanged dependencies.

## Endpoint correspondence

`originalProducts k l` is the literal set of natural numbers
`x^k*y^l+1` with both roots strictly positive. Its conversion to
`shiftedProducts k l 1` is proved, including the positive-value and integer-cast
conditions. `hajdu_sarkozy_shifted_products_conjecture` has only the exponent
hypotheses `2 ≤ k` and `2 ≤ l` and concludes `TotallyMPrimitive` of that set.

`TotallyMPrimitive` quantifies over every positive-integer set with finite
symmetric difference from the target and rules out equality with `productSet
A B`, where each factor consists of positive integers and has two distinct
elements. There is no finiteness assumption on either factor. This is the
content of the primary paper's Definition 1.3. Finite symmetric difference of
natural-number sets is equivalent to agreement beyond an integer threshold.
The theorem `original_finite_modification_not_product` exposes those
quantifiers directly.

`shifted_product_perturbations` covers every pair `k,l ≥ 2`, every nonzero
integer shift `c`, and every symmetric-difference error whose actual
positive-value counting function is little-oh of
`X^(1 / (min k l : ℝ))` as the real variable `X` tends to infinity. The
positive-root convention remains in the actual set definition. Equal
exponents are reduced by a proved set identity; unequal exponents use the
summable family of actual coefficients `(i+1)^l`. Interchanging the exponents
is proved through the commutativity of their actual products.

`summable_family` uses an arbitrary nonempty set of positive natural
coefficients and subtype-indexed summability of `q^(-1/k)`. Its added-error
condition and retained-count positive limsup are the literal real-threshold
conditions in the written proof. It does not replace them with a geometric
subsequence hypothesis, a supplied density estimate, an abstract color bound,
or a finite coefficient family. The auxiliary enumeration assigns coefficient
zero to disabled indices, then proves the exact set equality and summability
bridge. The cutoff is a finite initial segment, which is equivalent to the
source's coefficient cutoff for this enumeration.

## Proof correspondence

The mixed-coefficient rectangle calculation is proved for two fixed row
coefficients. It does not assert an invalid obstruction for four unrelated
edge colors. The crossed products satisfy the exact integer determinant
identity; the checked scaled power-gap estimate yields the contradiction in
a thin rectangle. Its constants depend on the two chosen factor elements
and the shift, but not on either coefficient. This uniformity is retained in
the common-neighbor bound and its finite-head sum.

The scaled counting bound injects distinct values into their positive roots
and has no additive coefficient-dependent error. The infinite tail argument
chooses one coefficient for each value in a finite prefix and sums over the
finite image of that choice. Multiple representations are allowed. The
resulting tail bound is controlled by the actual nonnegative summable tail,
with a constant independent of its cutoff. The order of limits is explicit:
fix the finite head, let the geometric index grow, and then make the
coefficient tail arbitrarily small.

For each factor, two fixed elements of the other factor give an injective
map of exceptional values into the actual added-error set. This proves
little-oh growth of both factors from the added-error hypothesis. Each fixed
coefficient then uses the thin-bin four-cycle obstruction and the previously
checked incidence summation. The formal proof uses the weaker finite bound
`E ≤ m²+n` in both orientations rather than the written proof's sharper
square-root bound. The checked half-range square and double-prefix estimates
make this weaker bound sufficient for the same full little-oh conclusion.
No sharp incidence estimate is assumed without proof.

Finite bin-edge images cover actual retained products; counting images only
overcounts representations. Finite heads and the uniform coefficient tail
then prove that a hypothetical product's retained count is sparse. The new
`sparse_of_grid` proves the real-threshold extension using monotonicity of
the actual counting function. The literal positive real limsup contradicts
that sparseness. Finite modifications preserve both hypotheses by elementary
set inclusions and the checked finite-set sparsity lemma.

Finally, the p-series calculation is proved for every strict exponent
inequality. The choice of one root equal to one supplies the actual
single-power subset, whose non-sparseness was already established in the
unchanged perturbation development. Symmetric-difference perturbations
retain non-sparseness; no stronger positive-density premise is imposed on the
original conjecture.

## Publication boundary

The fresh verification receipt passed the separate artifact check. This is
one completed entry. Do not count the summable-family theorem,
nonzero shifts, coprime cases, or old shifted-power dependencies again. Keep
the arbitrary finite-variable supplement marked unformalized. This review
does not assert a repository-wide aggregate build, hosted CI pass, deployment
result, or research priority.

## Publication integration note

The following metadata note is separate from the independent mathematical review above. The publication uses the same twenty-four frozen proof sources. Its full source/audit/stock-kernel evidence is [verification/receipt.json](verification/receipt.json); publication registration/hash binding is reported separately in [verification/publication-binding.json](verification/publication-binding.json). No metadata-only preflight is represented as a new proof rebuild.

The separate [publication-control review](verification/publication-control-review.json) independently checked the portable runner, workflow, all twenty-four source hashes, exact closure, all fifty-three required endpoints, ten publication controls and six original proof controls. It ran no additional Lean process and records the [initial binding](verification/publication-binding-initial.json) and [initial preflight](verification/publication-preflight-initial.json), which are retained unchanged. The subsequent main refresh has its own [current-tree binding](verification/publication-binding.json); it preserves every proof source and original proof control while checking the updated registrations.

The [second independent publication-control review](verification/publication-control-review-cee778.json) revalidated the additive refresh onto main `cee778057fd74a681f14c49a9af90aac677d4b6b`, with its [binding](verification/publication-binding-cee778.json) and [preflight](verification/publication-preflight-cee778.json) retained. Main subsequently added the separate Thue–Morse sign-density formalization. The current binding checks the combined registrations and unchanged proof sources again; it does not claim another independent mathematical review or a new Lean build.
