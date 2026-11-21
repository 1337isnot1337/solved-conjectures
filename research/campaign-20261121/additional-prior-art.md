# Additional prior-art exclusions

Date: 21 November 2026. Coordination: [issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156).

These entries record exclusions, not new resolutions. The current campaign count is five. Claims below were checked against the indicated primary texts, not inferred from an index's status label.

## Al-Rashed–Zegarliński's quadratic-form conjecture

[Haonan Zhang, arXiv:2108.05785v2](https://arxiv.org/pdf/2108.05785), printed page 4, states Conjecture 3 for the Hessian of the squared Schatten norm under completely positive trace-preserving maps and immediately explains that it cannot hold, citing the theory of monotone metrics. MathDB 351614 nevertheless presents the same conjecture as open. Excluded before proof work.

## Xin–Zhong's Kekulé generating functions

The abstract of [Xin–Zhong, arXiv:2201.02376v1](https://arxiv.org/pdf/2201.02376) explicitly says that all the listed generating-function conjectures are proved in that paper. MathDB 353213 and 353214 extract conjectural statements without that resolution context. Excluded.

## Zhang's Fourier-type Clarkson bound

MathDB 365566 records an old Fourier-type conjecture. The current [arXiv:2410.21961v4](https://arxiv.org/pdf/2410.21961) removes that formulation and gives the Bhatia–Kittaneh estimates as Theorem 1.4. Applying its first estimate to the inverse discrete Fourier transform, then applying the scalar power-mean inequality, yields the indexed bound with the correct nth roots of unity. The index also has a missing factor two in the root-of-unity exponent. Neither that transcription error nor rediscovering a consequence of the stated theorem is a new target.

## Czerwińska–Franco–Merino's radial-convexity conjecture

A full prior refutation of Conjecture 4.10 in arXiv:2610.17393 is recorded in the [trureturing problem dossier](https://github.com/the-omega-institute/trureturing/blob/ae8e0d33fee7570cf5f8e6f9ab86cbc24c66d836/Problems/czerwinska-franco-merino-2026-radial-convexity-matrix-monotonicity.md). It gives one rational function, a global proof of its radial property for the entire degree-three positive cone, and exact matrices showing failure of both monotonicity directions. The full published equivalence is therefore already refuted. Its separate higher-degree extensions are not eligible substitutes.

## Makhija's Schubert-factorization conjecture

[HMS26, arXiv:2610.36993](https://arxiv.org/abs/2610.36993), *Factorizations by column blocks and Schubert polynomials as products of key polynomials*, gives the exact factorization characterization in Theorem 1.2. The proposed elementary-product target was excluded after that full resolution was found.

## Achour's degree-spread conjecture

The assertion that independent domination minus saturation is at most maximum degree minus minimum degree is already refuted by the earlier [connected cubic counterexample](https://github.com/djma/TxGraffiti-conjecture3-counterexample/blob/main/counterexample_note.md): independent domination is 16 and saturation is 15. Since the degree spread of a regular graph is zero, it contradicts the full assertion. The independently noticed corona family is not counted. This exclusion does not concern the different saturation bound under investigation in issue 185.

## Archive screening

The complete recursive tree of PrincipiaMathOrg/math-solutions was retrieved at tree 47371706c400c79d06e3fb62190fcf6f7a725c85. It contains 2,095 entries, including 246 MathDB problem directories. The trureturing Problems tree was retrieved at 8b1276a2e967fdc41c6784a04ecb79e3890741a5 (2,190 entries). Its Blueprint sections S0, S1, S3/Analytic, S3/Combinatorics, S3/Zeros and S3/HilbertOperators were separately retrieved without truncation.

Path searches are an early warning system, not a proof of novelty: titles can differ and proofs can be hidden in issue comments. Candidate audits also search all repository issues, public issue archives, both web search engines and the actual source and follow-up papers. The Yang–Chu–Zhang exclusion illustrates why this matters; see [the pinned audit](../yang-chu-zhang-monotonicity/EXCLUDED.md).
