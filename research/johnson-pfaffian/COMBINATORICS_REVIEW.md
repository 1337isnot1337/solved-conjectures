# Independent mathematical review

Reviewer: combinatorics lane. Date: 21 November 2026.

**Outcome: the proposed proof of Johnson's Conjecture 7.1 passes this independent mathematical review.** This is a review of the mathematical argument and the exact source statement. The independent priority audit remains a separate requirement.

## Material inspected

I read the complete local `PROOF.md` and the primary paper, William Johnson, *Pfaffian Positivity for Convex Kernels and Optimal Matching Bounds*, arXiv:2610.24371v1. In particular, I checked the interval convention and inversion in Section 2, the statement and proof of Proposition 4.2 on printed pages 8–9, and Conjecture 7.1 and its following uncrossing observation on printed page 14. The source files inspected were `source.pdf` and its extracted `source.txt`; the mathematical inspection used the text, with no claim of a separate visual inspection of the PDF.

The conjecture quantifies over every positive, nonincreasing, log-convex function on the positive real axis, every increasing even list of nodes, and every perfect matching. The proposed conclusion matches all these quantifiers. It is not the already proved rainbow bound for all convex kernels, and it is not the earlier positivity assertion.

## Imported result and its scope

Proposition 4.2 applies to an arbitrary skew-symmetric matrix with nonnegative additive interval coefficients. It is not restricted to distance-kernel matrices. Its endpoint inequality is therefore available after the proposed algebraic transformations. I also checked the proof's relevant mechanism: nonnegative alternating-prefix sums, summation by parts in the first-row Pfaffian expansion, and nonnegative differences of consecutive first-row entries. The draft uses only the real inequality supplied by that proposition.

The source's coefficientwise theorem is not being silently assumed for the new multiplicative interval class. Expansion of the finite interval product gives a nonnegative additive representation; that elementary expansion is all that is needed to apply the imported result.

## Hostile checks

### 1. Product expansion and the full-set factor

Every factor is exactly `1 + (t_I-1) 1_I(i) 1_I(j)`, with a nonnegative coefficient. Intersections of ordinary linear intervals are ordinary intervals. Empty or singleton intersections contribute zero to off-diagonal entries. The empty selection contributes the constant one and is represented by the full interval. Thus no missing baseline term or negative additive coefficient occurs.

### 2. Circular complement identity

For binary indicators `u_i,u_j`, the exponent identity

```math
u_i u_j=(u_i-1/2)+(u_j-1/2)+(1-u_i)(1-u_j)
```

holds in all four cases. Consequently, replacing a wrapped proper circular interval by its complement keeps the parameter at least one and introduces only positive vertex factors. A singleton complement is harmless: its remaining off-diagonal factor is one, and its effect is already accounted for by the vertex factors. The full circular interval is left in place as an ordinary full interval.

### 3. Pfaffian scaling and rotation signs

Positive diagonal congruence multiplies every term in the Pfaffian expansion by the same product of vertex factors. The endpoint-entry times the complementary Pfaffian has precisely the same scale factor. Hence the endpoint inequality survives the removal and restoration of the gauge.

After a one-step cyclic permutation in even order, the permutation determinant is minus one. The moved vertex has all its edge signs reversed relative to the convention of positive entries above the diagonal; negating its row and column has determinant minus one and restores that convention. The two signs cancel. Equivalently, chord alternation and hence crossing parity are invariant under changing the cyclic cut. This invariance also holds for the remaining principal submatrix because its order is even. There is no unaccounted Pfaffian sign in restoring the original induced ordering after deleting the adjacent pair.

### 4. Deletion closure

The intersection of a circular interval with an arbitrary subset is consecutive in that subset's induced cyclic order, possibly empty, a singleton, or the full subset. Thus every principal submatrix retains the same multiplicative circular-interval form with positive vertex factors. Deleting matched ears can therefore be repeated without strengthening the hypotheses.

### 5. Noncrossing induction

A noncrossing perfect matching in a linear cut has a matched pair of minimum index separation. If that pair enclosed another vertex, the latter's partner would have to lie inside the same pair, producing a matched pair of smaller separation. Thus there is an adjacent matched pair. Applying the adjacent-pair inequality and deleting it preserves noncrossing. The empty Pfaffian is one, and all removed edge weights are positive, so the induction proves the required product bound.

### 6. Uncrossing for the enlarged circular class

For four cyclically ordered vertices, the intersection with a circular interval is a consecutive subset in their cyclic order. For sizes zero, one, three, or four, the two sums of indicator products in the draft's equation (6) agree. For size two, the only possibilities are the four cyclic adjacent pairs; neither diagonal crossing pair can occur. The right-hand sum is then zero and the left-hand sum is nonnegative. This verifies the factorwise inequality for every possible restriction, including wrapped supports.

The common vertex factors cancel between the two matching products. Replacing crossing edges `(i,k),(j,l)` by `(i,j),(k,l)` therefore does not reduce weight. The sum of index lengths decreases by exactly `2(k-j)>0`. It is a nonnegative integer, so the process terminates at a noncrossing matching even if individual steps create other crossings. No unjustified claim that the number of crossings itself decreases is needed.

### 7. Log-convex kernel decomposition

Subtracting `log f(D)`, where `D` is the full diameter, gives nonnegative finite entries and zero full-interval coefficient. The boundary coefficients are nonnegative by monotonicity. The interior coefficient is

```math
g(r)+g(r+h+k)-g(r+h)-g(r+k),
```

which is nonnegative for every convex `g=log f`, without differentiability. This can also be seen by the two complementary convex combinations of `r` and `r+h+k`. The double telescoping uses only entries with first index smaller than second, so it never requires a value of the kernel at zero. Exponentiating the finite sum produces interval factors at least one, and the constant `f(D)` is exactly absorbed by the vertex factors `sqrt(f(D))`.

The proof also covers nonstrict monotonicity, constant kernels, zero interval coefficients, and the smallest order two. These are not omitted limiting cases.

## Conclusion and limits

No mathematical correction is requested. The circular-complement gauge supplies the missing extension from the source's endpoint inequality to arbitrary matched ears, and the rest of the argument proves the complete conjecture.

This review does not certify novelty, peer review, or formal verification. It does not use finite numerical checks as evidence for the universal theorem. The source's endpoint inequality and its existing uncrossing observation must retain explicit attribution.
