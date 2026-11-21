# Marcus and Lih–Wang research checkpoint

21 November 2026 UTC (20 November in the user's timezone).

**Status: no full proof or counterexample. This work contributes zero solved MINC entries.**

## Exact targets and scope

Marcus's block-permanent inequality, MINC Conjecture 9, concerns a Hermitian positive semidefinite matrix A with m-by-m blocks of common size k. Put G_ij = per(A_ij). The assertion is per(A) >= per(G), with a block-diagonal equality characterization when k >= 2 and all diagonal blocks are positive definite.

Lih–Wang's inequality, MINC Conjecture 34, concerns a nonnegative doubly stochastic matrix A of arbitrary order n. With J having entries 1/n and c_n = n!/n^n, the target is

    per(J + t(A-J)) <= (1-t)c_n + t per(A),  0 <= t <= 1/2.

Finite-order verification, a proper matrix subclass, or a separate intermediate conjecture does not settle either target.

## Current literature and coordination

The exact live statements are:

- https://yair-lavi.com/mincs-list/conjecture-9/index.html
- https://yair-lavi.com/mincs-list/conjecture-34/index.html

The recent source that materially changes the C9 research frontier is Daniel Tubbenhauer, *Positivity in symmetric webs and block permanents*, arXiv:2611.22058v1 (17 November 2026), https://arxiv.org/html/2611.22058v1 . Theorem 1A.1 proves m <= 4 for every k, m = 5 for k >= 3, and arbitrary m whenever

    2^k - 1 >= m(m-1)(2m-1) / (6 floor(m/2)).

The author's description is https://www.dtubbenhauer.com/blockpermanents.html . These are prior results, not results of this campaign. The first uncovered case in that paper is five blocks of size two. Section 9 contains a negative individual marked closure, but its average is strictly positive. That example is expressly not a counterexample to Marcus's inequality.

For C34, the published paper D. K. Udayan and K. Somasundaram, *Lih Wang's and Dittert's conjectures on permanents*, Special Matrices 12 (2024), 20240006, https://doi.org/10.1515/spma-2024-0006 , proves order four and a restricted order-six result. Its published statements must be used instead of the broader 2023 preprint abstract.

K. A. Kopotun, *A note on the convexity of the sum of subpermanents*, LAA 245 (1996), 157–169, https://doi.org/10.1016/0024-3795(94)00228-2 , already covers normal matrices with eigenvalues in a suitable narrow sector. The repository's PSD-orbit work in issue #60 has already recorded the consequent priority limitation; that qualitative case is not new.

S.-G. Hwang, *Convexity of the permanent for doubly stochastic matrices*, LMA 30 (1991), 129–134, https://doi.org/10.1080/03081089108818095 , explicitly conjectures strict convexity of t -> per(J+t(A-J)) on 0 <= t <= 1/2. Thus proposing that property is not a new reduction or a solved lemma.

Searches included the problem names with proof, counterexample, 2026, block permanents, symmetric products, Bombieri, holomorphic Gaussian polynomials, normalized subpermanents, and convexity. Sources above and the 2005 Cheon–Wanless survey were inspected. No unrestricted resolution was located. This is a bounded literature search, not a proof that no unindexed resolution exists.

Repository coordination was inspected through #139, #56 and #60. C20 was left to the active worker using Poisson/stable-polynomial routes. The C34 PSD-orbit note was not duplicated.

## Why large block size does not settle C9 by padding

Two exact identities eliminate tempting shortcuts.

First replace every block A_ij by A_ij direct-sum I_r, including off-diagonal blocks. After a simultaneous permutation of rows and columns, the new positive semidefinite matrix is

    A direct-sum (ones(m,m) tensor I_r).

Therefore its permanent is (m!)^r per(A), while the matrix of block permanents remains exactly G. Applying a large-block theorem gives only

    per(A) >= per(G)/(m!)^r.

If I_r is instead added only to diagonal blocks, the matrix of block permanents becomes diagonal and gives only the already known product-of-diagonal-blocks bound.

Second, replacing each A_ij by a direct sum of r copies gives a matrix permutation-equivalent to r direct copies of A. Its permanent is per(A)^r, but its block-permanent matrix is the entrywise power G^{circ r}, not a direct sum of G. Consequently the imported inequality is

    per(A) >= per(G^{circ r})^(1/r).

Writing d = product_i G_ii, positive semidefiniteness implies |G_ij| <= sqrt(G_ii G_jj), so every diagonal product in G has modulus at most d. The standard permanent Hadamard bound and the triangle inequality give

    d^r <= per(G^{circ r}) <= m! d^r.

Thus the right side tends to d as r tends to infinity. Replication therefore recovers the known block-product bound, rather than the required per(G). These calculations are obstructions to the proposed descent arguments; no novelty claim is made.

## C34 coefficient and curvature obstacles

Put B=A-J and let sigma_k(B) be the sum of all k-by-k subpermanents. With (n)_k = n(n-1)...(n-k+1), multilinearity gives

    per(J+tB)/c_n = sum_{k=0}^n n^k sigma_k(B) t^k/(n)_k.

The degree-one term is zero. Higher coefficients can have either sign. For A=(I_3+C_3)/2, where C_3 is a cyclic permutation,

    per(J_3+t(A-J_3))/c_3 = 1 + 3t^2/8 - t^3/4,

and the normalized chord gap is exactly

    t(1-t)(1-2t)/8.

This rules out coefficientwise positivity and rules out extending the claimed chord inequality to all 0 <= t <= 1. It also shows that the half-segment endpoint is sharp in order three. These facts are prior background, not new counterexamples.

For C=J+tB and t != 0, differentiation gives the useful exact identity

    t^2 f''(t) = n(n-1) per(C)
                 - 2(n-1) sigma_{n-1}(C)/n
                 + 4 sigma_{n-2}(C)/n^2,

where f(t)=per(J+tB). Showing this is nonnegative throughout the half-segment would be Hwang's conjecture, still an unproved intermediary here. It does not by itself prove the C34 midpoint inequality.

## Exploratory computation and limits

`permanent.cpp` implements subset dynamic programming and its reverse derivative. `search_inequalities.py` uses it for floating-point optimization. `curvature_probe.py` investigates the stronger curvature statement with a finite-difference second derivative. Compile with

    g++ -O3 -std=c++17 -shared -fPIC permanent.cpp -o permanent.so

Reproducible commands used in this checkpoint:

    python search_inequalities.py marcus 5 2 5 12
    python search_inequalities.py marcus 5 2 2 16
    python search_inequalities.py marcus 6 2 6 10
    python search_inequalities.py lihw 5 24
    python search_inequalities.py lihw 7 12
    python curvature_probe.py 7 24

No violation was found. The complex Marcus derivative was checked by a directional finite difference before optimization. The PSD searches parameterize A=XX*, so positive semidefiniteness is automatic. The C34 searches use nonnegative entries and linear row/column constraints. The order-five midpoint ratios found were below 0.385, and the order-seven ratios below 0.288; neither is a certified global bound. No finite computation here is a proof, a resolution claim, or a contribution to the requested count.

## Remaining work

A C9 proof needs control of the average of the problematic packet contractions, or another argument that does not lose whole-block permutation correlations under padding. A C34 proof needs an inequality coupling the endpoint permanent to the signed centered coefficients. Replacing either missing step by a known partial theorem is insufficient.
