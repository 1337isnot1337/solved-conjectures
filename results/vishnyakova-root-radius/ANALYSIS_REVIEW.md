# Independent analysis review

21 November 2026. Reviewer: analysis lane. Reviewed the complete written proof, including the corrected finite Vandermonde identity in Section 5. The all-degree, all-positive-weight proof passes this review. This is an internal mathematical review, not external peer review or a guarantee of priority.

## Exact scope

The original source is Anna Vishnyakova, *Polynomials interpolated totally positive sequences*, arXiv:2607.06207v1, Open Problem 6.2, printed page 24. It asks whether the supremum of the largest complex-root modulus is n for every degree n in the sampled-total-positivity class.

I independently read the weighted source, *Polynomially Deformed Normalized Pochhammer Sequences Having Generating Functions With Only Real Non-positive Zeros*, arXiv:2608.03723v1, in its author-uploaded full text:
https://www.researchgate.net/publication/411305396_Polynomially_Deformed_Normalized_Pochhammer_Sequences_Having_Generating_Functions_With_Only_Real_Non-positive_Zeros

Definition 1.4, formula (8), uses exactly the map L_beta in PROOF.md. Open Problem 7.1 defines the class U_n by the condition that L_beta(P) have all roots in [-1,0]; Open Problem 7.2, printed page 27, conjectures R_n=beta+n-1. The proof covers precisely this class for every beta>0 and every positive integer n. No extra nonnegative-coefficient condition on P, real-rootedness condition on P, or integer restriction on beta is inserted. Normalizing the leading coefficient of L_beta(P) is valid because nonzero scalar multiplication does not change either root set.

The original and weighted forms are one conjecture family and one count.

## Mathematical checks

1. **Normalization and generating function.** The family in (2) has degree exactly n with leading coefficient 1/(beta)_n, even for complex parameters. On the diagonal, multiplication by (beta)_n makes it monic. In the formal exponential generating series, setting n=k+j produces the binomial series with parameter beta+k, and then the second binomial expansion gives (5). Differentiating that expression gives exactly the stated recurrence. No convergence or orthogonality assumption is needed.

2. **Tridiagonal representation.** The diagonal entries of J are j-(2j+beta)t. The product of its two off-diagonal entries at position j equals -t(1-t)j(j+beta-1); the minus sign in the determinant recurrence therefore gives the positive second term in (4). Since beta>0, K is real symmetric. Complex t and a nonnormal J cause no problem: an eigenvector still satisfies v*Jv=z, while v*Dv and v*Kv are real because D and K are Hermitian.

3. **Quadratic estimate.** Summing the pairwise elementary inequalities gives exactly
   |v*Kv| <= 2d+beta-(n+beta-1)|v_(n-1)|^2 <= 2d+beta.
   The empty-sum n=1 case also agrees with this equality. Consequently c=d+beta/2 is strictly positive and kappa is real in [-1,1].

4. **Reciprocal-segment geometry.** For Im u<0 the two endpoints have product one and opposite nonzero imaginary parts. Choosing r in the upper half-plane gives |r|<1 directly from the imaginary part of r+1/r. The real-axis intersection is 2 Re(r)/(1+|r|^2), strictly between -1 and 1. The entire upper part of the segment is therefore strictly inside the unit disk. This is valid for either square-root branch, including arbitrarily large complex t. It gives the asserted diagonal zero exclusion.

5. **Grace–Walsh–Szegő.** For fixed z, the parameter polynomial is symmetric and multiaffine. The open upper half-plane is a convex circular domain. I independently read Borcea–Brändén, arXiv:0809.3087, Theorem 1.1, printed page 4:
   https://arxiv.org/pdf/0809.3087
   Its conclusion supplies a common upper-half-plane parameter with the same value. A zero with all parameters in the upper half-plane would contradict the diagonal exclusion. Convexity makes any separate full-degree hypothesis unnecessary.

6. **Boundary specialization.** A pointwise limit of nonzero numbers would be insufficient. The proof correctly uses Hurwitz on the connected open domain Omega_(n,beta) in the z variable. The polynomials converge locally uniformly there. Their common nonzero leading coefficient excludes an identically zero limiting function. This validates the real-parameter specialization, including repeated parameters and endpoints. Real coefficients give the lower-half-plane conclusion by conjugation.

7. **Real roots and reflection.** For z>n-1 all falling-factorial terms in (2) are positive and the coefficients are nonnegative. The corrected finite Vandermonde identity has no alternating factor inside the sum. In applying it to Q(-w-1), the global factor (-1)^j comes from the monomial w^j, yielding exactly the reflection identity (13). This excludes roots below -beta-n+1. Thus the real roots lie in the diameter of the claimed disk.

8. **Sharpness.** Parameters all equal to one give (z+beta)_n/(beta)_n. Its root -(beta+n-1) realizes the upper modulus bound from the disk. The supremum is attained. The conclusion concerns all roots, not only nonreal roots or fixed degree.

## Correction found during review

The first written draft put (-1)^k inside the finite Vandermonde sum in Section 5. Already j=1 would contradict that display. The author removed that factor and explicitly placed (-1)^j in the subsequent expansion of Q(-w-1). I reread the corrected passage. This was an error in a supporting displayed identity, not an obstruction to the reflection identity or the main argument.

## Additional priority checks

The following substantial earlier work was located by global GitHub searches for the exact arXiv identifiers and inspected directly.

- 10m-u/open-problems-catalog, immutable snapshot ca8d4d44ba3db527f19f28928c240168f545ecfe, records Q1442 as **open, partial results**:
  https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/problems/mathematics/analysis.md#q1442

- Its 7 October report proves the same stronger disk for independent parameters through degree five and for equal parameters in every degree:
  https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-continuation-2026-10-07/interpolation/REPORT.md
  The report explicitly leaves the all-degree independent-parameter disk theorem open. The equal-parameter tridiagonal recurrence is therefore prior work and should be acknowledged. The new step assessed here is the complex-parameter exclusion followed by upper-half-plane polarization, which supplies arbitrary independent real parameters in every degree. The report also gives a non-TP shift-mixture counterexample; it does not refute the present class.

- The public Trure Turing record for the weighted problem proves the outer and inner radii only in degree two:
  https://github.com/the-omega-institute/trureturing/blob/f289261bc3ed0ffa16f39f87868e93638d77f0c8/Blueprint/D5/S3/Zeros/PochhammerDeformation/QuadraticRadii.md
  Its Theorem 1.12 expressly limits the outer-radius conclusion to n=2. I inspected the ordinary mathematical scope descriptions; no Lean verification was performed.

- Cheng–Xin, *Weighted Euler transforms, real-rootedness, and gamma-positivity*, arXiv:2611.17839, has the same weighted transform and resolves multiplication closure. Its stated main theorems are distinct from the root-radius assertion:
  https://arxiv.cnoctave.top/pdf/2611.17839
  A search result incorrectly associated this abstract with arXiv:2611.19665; direct primary-source opening identifies 2611.19665 as a Durfee-polynomial paper, so that mismatched metadata was discarded.

The shared repository HISTORY.md and all-state GitHub issue search for Vishnyakova were checked. They expose no older root-radius resolution or exclusion; issue 182 is this investigation. Both search engines were also used for Meixner complex zeros, falling-factorial zero localization, Grace/polarization disk bounds, the exact source identifiers, and the author's root-radius statement. These are bounded searches; the absence of a located earlier full proof does not establish exhaustive priority.

