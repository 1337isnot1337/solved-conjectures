# Independent analysis review

Date: 21 November 2026.

Status: the complete mathematical argument in `PROOF.md` passes this independent review. This is a proof review, not a conclusion about priority. The separate prior-art audit is still in progress.

## Exact source and scope

I read the source PDF's extracted text, including Conjecture 7.1 on printed page 14 and the statement and proof of Proposition 4.2 on printed pages 8–9. The conjecture quantifies over every positive even order, every strictly ordered real node configuration, every positive nonincreasing log-convex function on the positive half-line, and every perfect matching. The proposed proof retains all these quantifiers. It assumes neither differentiability of the kernel nor equally spaced nodes.

The imported proposition applies to arbitrary nonnegative additive interval coefficients. It is not restricted to convex distance kernels. Its stated inequality is precisely the endpoint comparison used in the draft. This matters: applying a result restricted to distance kernels after a cyclic cut would not have been justified. The source's coefficientwise argument establishes the required larger class.

Johnson already proves the rainbow bound for all positive nonincreasing convex kernels and the resulting Albouy–Moeckel nonvanishing assertions. Those are not new resolutions in this package. The all-matching log-convex assertion is explicitly left conjectural in the source.

## Checks of the circular interval argument

1. Positive diagonal congruence multiplies both a Pfaffian and every matching product by the product of all diagonal factors. In an endpoint comparison, the edge factor supplies the two factors missing from the smaller Pfaffian. Thus no normalization factor is lost.

2. Expanding each ordinary interval factor as one plus a nonnegative multiple of its pair indicator produces a finite sum of pair indicators of intersections. Intersections of ordinary intervals are intervals. Empty and singleton intersections contribute zero off the diagonal; the empty selection is represented by the full interval. Hence the resulting skew matrix satisfies the imported additive-interval hypothesis exactly.

3. The complement identity is correct for all four choices of the two indicator values. Its exponent identity is

```math
u_i u_j-(1-u_i)(1-u_j)=u_i+u_j-1.
```

All compensating vertex factors are strictly positive. A proper interval wrapping across a chosen cut has an ordinary-interval complement. The full interval is left intact. This accounts for every interval factor and does not impose a new restriction on the parameters.

4. Cyclic relabeling of the edge weights, followed by the convention of placing the positive weights above the diagonal, leaves the Pfaffian unchanged. The matching expansion proves this because chord-crossing parity is a cyclic-order invariant. As a separate sign check, a one-step rotation of an even number of vertices has odd permutation sign; changing the signs of the moved row and column contributes the second minus sign. The cancellation applies also to the even induced submatrix after deleting an adjacent pair.

5. Cutting between two cyclic neighbors makes them the endpoints. The preceding facts therefore give the claimed deletion inequality for every such pair. Restriction preserves circular intervals in the induced cyclic order, including the cases of an empty support, a singleton, or the whole surviving set. Repeated deletion is consequently legitimate.

6. A noncrossing perfect matching contains an adjacent pair. The minimum-index-span argument in the draft proves this without assuming that a particular pair is an ear. Multiplying by the deleted positive edge preserves the inequality direction. Induction reaches the empty Pfaffian, which is one.

## Checks of the arbitrary-matching and kernel reductions

For four cyclically ordered vertices, the restriction of a circular interval is cyclically consecutive. In the two-point case it can never consist of one of the two crossing pairs. The draft's four-point exponent comparison is therefore valid, while the zero-, one-, three-, and four-point cases give equality. Multiplication by parameters at least one and cancellation of vertex factors give the required uncrossing inequality.

Uncrossing need not monotonically reduce the number of crossings with all other edges; the proof does not rely on that claim. Its integer potential, the total span in the fixed index order, decreases by twice the positive gap between the two middle vertices. There are finitely many matchings, so repeated uncrossing terminates at a noncrossing matching without decreasing the matching product.

For the kernel reduction, subtracting the logarithm at the diameter gives nonnegative finite entries and zero at the full-span edge. The boundary mixed differences have the stated nonnegative signs by monotonicity. Every interior mixed difference has the form

```math
g(r)-g(r+h)-g(r+k)+g(r+h+k),
```

which is nonnegative for a finite convex function because its increments over a fixed positive distance are nondecreasing in the starting point. All arguments of the logarithm lie in the original positive domain. Double telescoping restores each entry; every interval appearing in that sum has at least two vertices. Exponentiating gives exactly the original kernel after multiplying by the common vertex factor given in the draft. The order-two case and constant kernels are included.

## Conclusion and boundary

The circular interval-product theorem follows from the cited endpoint inequality, and the full statement of Conjecture 7.1 follows from that theorem. No numerical search, finite-order verification, smooth approximation, or unproved Pfaffian closure principle is needed. I found no mathematical gap requiring correction. The claim about absence of a prior all-matching proof must still be assessed separately against primary sources and public solution archives.
