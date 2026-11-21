# Review of the algebraic-degree obstruction

Reviewed 20 November 2026 (America/Chicago).

Target: [perron_algebraic_degree.md](../compound/perron_algebraic_degree.md).

The explicit companion construction and the generic irreducibility
argument are valid on their stated domains. Their conclusions concern
algebraic degree and an expanded coefficient-list output format. They do
not resolve P17 or P18, and they do not exclude compact exact descriptions
or approximation algorithms.

## Companion construction

Every row before the last has one supported column. Once those rows
are matched, the last row has at most one available column in a specified
square minor. Thus there is at most one matching per minor. When the last
row participates, its selected column is the smallest: if it uses column
two, row one cannot also participate. The matching has exactly
$`k-1`$ inversions. This proves the permanent/determinant compound
identity for odd $`k`$, including its sign convention.

I independently opened Osada's original paper and read Theorem 1 and the
Remark on printed page 441. The Remark removes the two extra hypotheses
when $`s=1`$. Substitution $`a=b=-1,c=1`$ satisfies the remaining
coprimality condition. Conrad's all-order theorem and proof give an
independent statement of the same classical Galois input and its credit
to Nart and Vila. The source record correctly says that the retrieved
Selmer scan exposed no readable body; no inspection of that scan is
claimed in this review.

The subset-product argument handles the only exceptional combinatorial
case. After cancelling a common intersection, an unused root permits a
transposition that forces two roots equal. When no root is unused, all
cross transpositions instead force all root squares equal, contradicting
distinctness for $`n\ge3`$. The case $`n=2,k=1`$ is direct. No
unproved multiplicative-independence theorem is needed.

Transitivity on subsets and their distinct products give orbit size
$`\binom nk`$. The nonnegative compound has a Perron eigenvalue; its
invertibility excludes zero. Its minimal polynomial therefore has that
same degree. In the specified central odd-degree subsequence, the
coefficient-list output bound follows from
$`\binom n{n/2}\ge2^n/(n+1)`$.

I reran the exact checker. It passed 8,757 minor identities, all tested
companion orientations, and nine rational irreducibility diagnostics.
These checks validate conventions; the general degree conclusion comes
from the Galois argument.

## Generic characteristic-polynomial irreducibility

A monic factor over the fraction field has coefficients integral over
$`\mathbb Q[x_{ij}]`$, since they are elementary symmetric functions
of integral roots. Integral closedness therefore puts the coefficients
in the polynomial ring. Specialization preserves both monicity and
degree. This step is essential to the argument and is present in the
proof.

On a diagonal matrix, distinct squarefree monomials label all roots.
Retaining the two opposing off-diagonal entries couples precisely the
two subsets differing in those coordinates. The resulting quadratic
discriminant is a square factor times
$`(d_i-d_j)^2+4bc`$. Over $`\mathbb Q(d_1,\ldots,d_n,c)`$, this
has valuation one at the linear polynomial
$`b+(d_i-d_j)^2/(4c)`$ and hence is not a rational-function square.
This is not a valuation at $`b=0`$.

Different outside subsets give distinct quadratic trace coefficients.
The other compound blocks have dimension one and supply only linear
factors, including the factor involving the two-by-two permanent
$`d_i d_j+bc`$. On returning to the diagonal, these blocks have distinct
root monomials. A polynomial factor must therefore select both endpoints
or neither endpoint of every subset-exchange edge. That graph is
connected, so a nontrivial factor is impossible.

This proves generic irreducibility for every $`1\le k<n`$. It does
not assert the same for every specialization and cannot justify dropping
invariant-factor recovery on an arbitrary input. No new full list entry
is counted by either result.

