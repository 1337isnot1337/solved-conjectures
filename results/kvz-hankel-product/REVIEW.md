# Independent review of the Karp–Vishnyakova–Zhang Hankel-product disproof

Reviewed `agent-analysis/kvz-hankel-product/PROOF.md` on 2026-11-21.

## Scope and source correspondence

I independently opened both versioned primary sources:

- <https://arxiv.org/html/2408.01755v1>, Section 3, item 11, Conjecture 1.
- <https://arxiv.org/html/2408.01755v2>, Section 3, item 11.

The first source explicitly conjectures closure of all sign-regular Hankel kernels of infinite order under pointwise multiplication. Definition 2.1 allows a separate sign for each order. No matching-signature hypothesis occurs. The second source retains the same general belief without a numbered conjecture. Its reference to a possible future argument by Khare is not a proof; the relevant published or later treatment still needs the independent priority audit described in the main source log.

## Mathematical audit

The elementary family is valid. Each factor has rank at most two on every finite grid. Its first-order minors are positive; its second-order minors have the claimed constant sign. All higher-order minors vanish. Thus both factors satisfy the full source hypothesis, not merely an order-two truncation.

I independently expanded the product minor symbolically and recomputed, using exact rational arithmetic, the values at c=3 and s=2,10:

    59/64
    -3998721/4194304

The general c>=3 family follows from the positive value at s=2 and the limit -1 as s tends to infinity. Two allowed minors with opposite signs refute sign regularity.

The stronger strict-factor construction also passes review. For the square-root kernel, factoring the derivative rows and reversing the descending-power Vandermonde gives the stated Wronskian formula. At exponent 1/2 its sign is (-1)^(r-1), and it never vanishes. The initial-Wronskian criterion is correctly proved by division by the first function, differentiation, and Rolle's theorem. It establishes nonvanishing of every evaluation minor, at every order, on the whole positive quadrant. Its confluent-node limit determines the asserted sign.

For the geometric-series kernel, Cauchy–Binet applied to finite sums gives a sum of positive products of generalized Vandermonde determinants. The term with indices 0,...,r-1 remains strictly positive independently of the truncation. Entrywise convergence then proves strict total positivity at every order.

The logarithmic second derivative of the product is positive near zero and negative sufficiently far to the right. The displayed small-step determinant expansion is correct and uses allowed positive nodes. I also independently recomputed both exact strict-factor sign certificates:

    35*49^2 - (6*45)^2 = 11135
    196*(1023*4095)^2 - 195*2047^4 = 15876073570305

## Finding

No mathematical gap found in either construction. Both refute the same universal conjecture and count as one proposed resolution. The proof makes no assertion about products restricted to equal signatures. This review confirms correctness and source correspondence; it is not an exhaustive priority audit.
