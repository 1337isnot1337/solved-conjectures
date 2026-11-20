# Ferreira–Simon's Wright log-concavity conjecture

## Root mathematical audit

Reviewed the complete written candidate at commit 6f846778c60dfbb91acdf65a6b4ef51ad325e7bf on 20 November 2026. The audit covers the unrestricted parameter-limit argument, not a finite collection of numerical examples.

The proof passes this review.

1. For fixed a>0, b≥0, and 0<t<1/(a+b), the reflection identity has the correct sign: the two factors (−1)^n cancel. For n≥1, (an+b)t<n, so the reflected gamma argument lies in (1,n+1). Log convexity bounds its gamma value by n!. Thus the absolute coefficient divided by t is at most an+b, uniformly in both n and t. The n=0 coefficient is separately b/Γ(1+bt), or zero when b=0.

2. The resulting geometric-series majorants remain summable after any fixed number of x derivatives on every closed disk of radius less than one. This justifies the asserted C² convergence and excludes an unjustified uniform Taylor expansion in n.

3. The limit is h=(b+(a−b)x)/(1−x)². Direct differentiation gives the stated curvature numerator. Its values at zero and one half are respectively a²−2ab−b² and −16(a²+6ab+b²). In particular, the boundary family has curvature limit −16 at one half, while the interior family has limits +2 at zero and −448 at one half.

4. Strict limiting signs imply a nonempty interval of small positive t with those signs. For the interior family, β=t lies in (0,1) and α=1−3t lies in (0,1). The original Theorem D and its §5.1 proof identify positive curvature at zero with α<α*(β). This is the needed source hypothesis, rather than an assumed approximation to the threshold curve.

5. The normalization Γ(α+β) is positive and independent of x, so it multiplies the curvature expression by a positive square. The limiting functions are positive at the violating point. The β=0 family is also admitted by the source, which explicitly sets α*(0)=1 and leaves α>4/5 in its conjecture.

6. Disproving the threshold-to-density implication disproves the full asserted equivalence. The proof does not purport to classify every parameter or settle the remaining density/entropy equivalence separately.

The initial source summary included the degenerate pair α=β=0; the reviewed revision restricts to 0<α<1, which is sufficient for every counterexample and avoids an undefined normalization.

## Independent source and prior-work checks

The primary author preprint [arXiv:2212.07974v2](https://arxiv.org/pdf/2212.07974) was read at Theorem D, its §5.1 threshold proof, and §6.4's conjecture. The publisher metadata and preview were checked separately; the subscription-limited journal body was not read.

Root independently inspected the main statements of Ferreira–Simon [arXiv:2512.04940v1](https://arxiv.org/html/2512.04940v1). Its parameter monotonicity and convex-order theorems are different assertions. The current Simon author list, public Pudim application bodies, Sra's public list, and count-ex-machina's case ledger were screened for this exact target. The Wright references in the latter concern a matrix problem, not the Wright function here.

Root also read the abstract, introduction, and concluding conjecture of Li–Morgan–Siegrist, [DOI 10.1007/s41478-026-01192-9](https://link.springer.com/article/10.1007/s41478-026-01192-9), published 13 October 2026. Its full HTML concerns ordinary curvature under Riemann–Liouville derivatives of order 1<α<2 and zeros of Mittag–Leffler functions. Its concluding conjecture is uniqueness of a fractional differential equation's inflection point. The full HTML contains no Wright-function or Ferreira reference. This related-paper lead does not resolve the target.

Both search engines were used on exact source identifiers and combinations of the authors, Wright density, log concavity, proof, counterexample, and recent dates. No earlier exact resolution was found in the inspected sources. The recent Srivastava–Tomovski manuscript arXiv:2608.08198 remains an abstract-only screen because its full text was inaccessible; this limit is preserved in the result's novelty record.

These checks are internal review and bounded prior search. They do not establish external peer review or exclusive priority.
