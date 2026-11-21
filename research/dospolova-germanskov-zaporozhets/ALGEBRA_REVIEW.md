# Independent algebra-agent review

Reviewed 21 November 2026. The proposed disproof of Dospolova–Germanskov–Zaporozhets Conjecture 3.6 passes the mathematical and source-scope audit. This review does not certify novelty; the separate prior-resolution audit must finish before promotion.

## Primary sources checked directly

I read the complete statement of Conjecture 3.6 and the definition of a GB set in the original [arXiv:2507.11626v1](https://arxiv.org/pdf/2507.11626). The conjecture permits equality in every ultra-log-concavity inequality. It asks for realization of a positive infinite sequence by an infinite-dimensional GB set. Here GB is expressly a convex compact subset of a separable real Hilbert space with finite first intrinsic volume. No additional normalization excludes the sequence c^k/k!.

I also read the extracted text of Richard A. Vitale, *Intrinsic volumes and Gaussian processes*, Advances in Applied Probability 33 (2001), 354–364, in the complete published article appended to [the lecture packet](https://case.edu/artsci/math/mwmeckes/perspectivesInHighDimensions/vitale.pdf). **Correction to the earlier review:** explicit inspection of the screenshot tool payload found only text containing an image placeholder, not image bytes. The earlier assertion that printed pages 356 and 357 had been visually inspected was incorrect. The following constants are supported by text extraction and mathematical cross-checks, but that extraction does not resolve whether the inequality in Theorem 1 uses a strict or non-strict glyph. That issue is a priority hold, because a previously published strict inequality would already exclude the proposed target sequence. The extracted text gives:

- V_1(K) = sqrt(2 pi) E sup X_t.
- The local range tends almost surely to twice the deterministic constant osc_K(t).
- The normalized ratio is m_j(K) = j V_j(K) / (sqrt(2 pi) V_(j-1)(K)).
- Theorem 3 states that lim_j m_j(K) = osc(K), with osc(K) the supremum of osc_K(t) over K.

Vitale's printed page 355 specifies suprema over a countable dense indexing subset, whose choice is immaterial almost surely. The source works with nonempty compact convex subsets of Hilbert space. Thus the imported theorem has the required domain.

## Strictness argument

After translating so that 0 lies in K, both S = sup X_t and -I = -inf X_t are nonnegative and have finite expectation. Gaussian sign symmetry gives E(S-I) = 2 E S. No sample continuity is assumed.

For each deterministic t, its limiting local range is bounded by the global range R. Selecting countably many deterministic points whose oscillation constants approach the supremum permits a countable intersection of probability-one events and yields R >= 2 osc(K) almost surely. If the supremum were initially allowed to be infinite, the same argument would contradict the almost-sure finiteness of R; hence it is finite. The countable local indexing sets and two chosen test points can be added to the global countable dense set without changing its supremum almost surely.

For distinct u,v in K, R >= |X_u-X_v| and the increment has the nondegenerate N(0,||u-v||^2) law. Therefore R exceeds the finite constant 2 osc(K) with positive probability. Since R is integrable and bounded below by that constant almost surely, E R > 2 osc(K). This proves the strict inequality osc(K) < V_1(K)/sqrt(2 pi).

Combining with Vitale's ratio theorem gives lim_j j V_j/V_(j-1) < V_1(K). All ratios exist for a proposed realization of the strictly positive target sequence. The general finite-dimensional 0/0 convention is irrelevant to the contradiction.

## Final contradiction

For every c>0, a_k=c^k/k! is strictly positive, a_0=1, and a_k^2=((k+1)/k)a_(k-1)a_(k+1). Its normalized unscaled ratio j a_j/a_(j-1) is identically c=a_1. A realization would be nontrivial because V_1=c>0 and would violate the strict necessary condition above. Thus the complete conjectured sufficiency direction is false.

I found no gap in the countability, integrability, Gaussian-tail, normalization, or limiting-ratio steps. The proof does not identify Gaussian boundedness with Gaussian continuity, and does not assume that local oscillation vanishes. Those distinctions are necessary here and are handled correctly.
