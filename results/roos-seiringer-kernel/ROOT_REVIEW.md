# Independent root review

Date: 21 November 2026.

The complete written argument and essential exact certificate pass this internal review. No mathematical gap was found. This is not external refereeing or a guarantee of exhaustive priority.

## Source and scope

The published [Roos–Seiringer paper](https://link.springer.com/article/10.1007/s00205-025-02088-x) was opened directly. Section 5, equations (5.1)–(5.2), Lemma 5.1, and the paragraph after Figures 1–2 give exactly the spherical average and unnumbered scalar nonnegativity assertion used here. The four terms, the complementary cosine integral convention, and the positive chemical-potential scaling agree with the proof.

The full assertion concerns this specific radial function at every nonnegative real argument. It is not an arbitrarily selected dimension of a broader conjecture. The unaveraged function mentioned in Remark 1.5 is distinct and is not proved nonnegative here. The small-argument coefficient was already established by the authors; the new claim is the global sign. The author-based title identifies the source assertion and does not claim an established conventional name.

## Independent analytic checks

I rederived the endpoint-cancelled integration by parts for the derivative of the integral. The logarithmic singularity at one is integrable. Dirichlet convergence is uniform on compact positive argument intervals, and the original integral has an integrable majorant. The paired cosine integral produces the odd harmonic numbers with the coefficient stated in the proof. Integrating from zero is justified by dominated convergence and locally uniform convergence of the resulting factorial series.

I separately recomputed the harmonic coefficient in the other trigonometric combination. The integral of its coefficient polynomial is minus the harmonic number of index twice the series index. Combining the two expansions gives the stated even and odd coefficients of the entire continuation. In particular the first two odd coefficients vanish, and the next one is one ninth.

The difference formula for successive odd coefficients, its positive lower bound, and both alternating-series ratios are valid. The three retained small-argument terms and the resulting strict rational lower bound agree. The positive eight-term arccoth truncation, its cosine-tail integration by parts, and the sine/cosine integral estimates give the stated large-argument lower bound. The derivative of that lower bound is positive on the entire large tail.

Differentiating the original expression for the rescaled function cancels the derivatives of the two special-function factors exactly. The displayed uniform derivative bound holds on every compact certificate interval. Its use therefore transfers a midpoint lower enclosure to every point in the whole closed interval.

## Certificate inspection and replay

I inspected all integer rounding operations in `verify.py`. Signed interval multiplication takes all four products, and its floor/ceiling operations have the correct direction. The series recurrence has positive rational multipliers; alternating signs are handled by subtraction. Machin's identity is combined with signed alternating arctangent remainders. The full analytic tail error is added at both endpoints.

The rational comparison of the factorial tail with the error allowance passes. Each failed interval is replaced by both closed halves, and the final adjacency and length checks establish coverage of the entire compact interval. A positive acceptance margin proves positivity on the interval, not just at its midpoint.

The full root replay returned 184 certified intervals, 367 evaluations, maximum depth 11, and `ALL_CONTINUOUS_INTERVAL_CHECKS_PASSED`. The exact minimum margin matches `PROOF.md`. The sorted leaf-record SHA256 is:

`7bf6b5aa90b010e4f66872bdbb4c4110ada7a0e2f55528f86dcfa86c5a107166`.

As an additional implementation cross-check, I independently formed the partial sums using exact `Fraction` powers and factorials, without the checker's rounded recurrence, at the seven rational arguments 1, 3/2, 2, 5, 41/2, 30, and 40. I used the equivalent unreduced harmonic coefficient and checked containment of both exact pi-endpoint partial sums plus the full analytic error inside the checker's enclosure. All seven checks passed. This cross-check is supplementary; the complete-domain proof is the analytic bounds and interval certificate.

## Priority boundary

I read the separate independent archive audit and repeated recent exact-title, author-pair, identifier, kernel, positivity, and proof searches. Those searches located the source and related BCS papers but no earlier exact resolution. The detailed source and archive coverage, including unsuccessful accesses, is recorded in `PRIOR_AUDIT.md`. A finite search cannot exclude an unindexed or inaccessible prior proof.

The package supports one complete proposed resolution of the original scalar assertion. The strict sign, its scaled forms, and physical consequences are not separate conjecture counts. The proof is explicitly computer assisted and does not claim Lean verification.
