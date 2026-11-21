# Root mathematical review

Date: 21 November 2026. The complete mathematical argument passes this review. This is an internal review of an unrefereed proposed proof. The current prior-resolution audit is a separate requirement and is not established by this document.

## Exact statement and imported theorem

I read the actual primary text of William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, [arXiv:2610.24371v1](https://arxiv.org/abs/2610.24371v1), including Conjecture 7.1 on printed page 14 and Proposition 4.2 on printed pages 8–9. The conjecture concerns every positive nonincreasing log-convex function on the positive real axis, every strictly ordered finite real configuration of positive even size, and every perfect matching. No differentiability, strict monotonicity, equal spacing, or bounded-size hypothesis appears in the proposed proof.

Proposition 4.2 applies to arbitrary nonnegative additive interval coefficients. It is not restricted to matrices obtained from a common distance kernel. That generality is essential to the new argument. I also read the source's coefficient-positivity proof, its alternating-prefix-sum lemma, and the summation-by-parts proof of Proposition 4.2. The support-size argument supplies adjacent twin rows; deleting those twins preserves nonnegative interval substitutions. The prefix sums arise as the coefficient of the new interval variable after adjoining a vertex. The endpoint inequality then follows from nonnegative first-row differences. These arguments support the exact imported theorem used here.

The source already proves the rainbow bound and the relevant Albouy–Moeckel nonvanishing assertions. The package explicitly credits them and claims only the stronger all-matching conclusion and the stated more general matrix theorem.

## Independent reconstruction of the argument

For positive vertex factors and interval parameters at least one, each entry is a finite product of interval factors. Expanding a factor as one plus its nonnegative increment shows that the product of ordinary interval matrices has nonnegative additive interval coefficients: every term is supported on an intersection of ordinary intervals. Empty and singleton intersections contribute no off-diagonal entry, and the empty selection contributes the full interval. This step uses the entries above the diagonal and then imposes skew-symmetry; it does not take a Hadamard product of the full skew matrices and mistakenly change the lower signs.

The decisive closure is after changing the cut in the cyclic order. If a circular interval wraps across that cut, its complement is an ordinary interval. Writing its indicators as zero-one numbers, I independently checked

```math
u_i u_j=(u_i-1/2)+(u_j-1/2)+(1-u_i)(1-u_j).
```

Exponentiation moves that interval factor to its complement while multiplying the two endpoint vertex factors by positive numbers. The parameter remains at least one. This handles every wrapped proper interval. Full intervals need no replacement; singleton or empty complements have no off-diagonal factor. All diagonal factors are finite and strictly positive, including when an interval parameter is one.

Positive diagonal congruence multiplies the Pfaffian and every matching product by the same product of vertex factors. It also multiplies the two sides of the endpoint-deletion inequality by that same number. Thus it can be introduced and removed without changing the desired comparison.

Cyclic relabeling requires care because a bare permutation can change a Pfaffian's sign. The draft correctly restores the convention that each unordered edge weight is placed above the diagonal. Moving one vertex across the cut in even order has permutation sign minus one; reversing that moved row and column supplies a second minus sign. Alternatively, the crossing parity in the perfect-matching expansion is invariant under cyclic rotation. Both derivations give the asserted invariance. It applies equally to the even submatrix left after deleting the chosen pair, so the draft's restoration to the original increasing order is valid.

After a cut between any cyclically adjacent pair, that pair becomes the two endpoints. The complement transformation and positive diagonal scaling place the reordered matrix in the imported theorem's additive interval class. Undoing the scaling and rotation gives the adjacent-pair deletion inequality for the original matrix. Restriction to a subset preserves circular intervals in the induced cyclic order, and it preserves all positive factors. Therefore the same argument can be repeated after each deletion.

Every noncrossing perfect matching has an adjacent matched pair. A shortest matched interval containing an internal vertex would force a shorter pair wholly inside it, which is impossible. Removing an adjacent pair preserves noncrossing. Induction therefore proves domination of every noncrossing matching product, with the empty Pfaffian and empty product both equal to one. Multiplication of the induction inequality is legitimate because the deleted edge weight is positive.

For a crossing pair on four cyclically ordered vertices, a circular interval meets those vertices in a circularly consecutive set. The two alternating pairs cannot occur as size-two intersections. The four possible adjacent size-two intersections, and all other sizes, satisfy the displayed disjoint-uncrossing indicator inequality. Multiplying the interval factors and canceling the vertex factors therefore shows that the disjoint replacement cannot decrease the matching weight. The sum of index lengths decreases strictly by twice the middle gap. Hence repeated replacements terminate even if an individual replacement changes crossings with other edges. The terminal matching is noncrossing, so the previously proved bound implies the assertion for the original matching. The proof does not assume that the number of crossings itself decreases at every step.

## Reconstruction from the distance kernel

Subtracting the logarithm of the value at the configuration's diameter makes all upper logarithmic entries nonnegative and the outermost entry zero. I checked the four-term interval coefficient formula with its zero boundary conventions. At either boundary its sign follows from monotonicity. In the interior it is an increment difference of the convex function logarithm of the kernel, hence nonnegative. Finite convex functions have the required monotone increments without a derivative assumption.

The two sums telescope exactly to the normalized logarithmic entry. Exponentiating gives an interval product with parameters at least one; the removed constant is restored by assigning its positive square root to every vertex. This places the entire original matrix in the proved circular-interval class. The argument includes constant kernels, affine logarithms, zero interval coefficients, and the two-vertex case.

## Scope of the conclusion

The proof establishes the whole universal assertion, rather than an inequality in selected orders or a numerical improvement. The stronger theorem for circular interval products is also proved in full. Exploratory finite screens and the supplementary exact checker are not premises. In particular, the separate conjectural coefficientwise domination suggested by finite screens is not asserted.

I found no missing hypothesis or mathematical gap in the written argument. Independent combinatorics and analysis reviews provide separate checks. None of these internal reviews establishes public priority or external acceptance; those distinctions must remain in the final package.
