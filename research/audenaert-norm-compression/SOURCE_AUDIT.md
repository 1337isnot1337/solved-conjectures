# Source and prior-work audit

Audenaert’s two-row norm-compression conjecture; audit checkpoint on 21 November 2026. This records a bounded source search and research direction. It does not certify that no undiscovered prior resolution exists.

## 1. Binding source and remaining statement

K. M. R. Audenaert, *On a norm compression inequality for 2×N partitioned block matrices*, [arXiv:math/0702186v2](https://arxiv.org/abs/math/0702186v2), 26 March 2007; *Linear Algebra and its Applications* 428 (2008), 781–795, [DOI 10.1016/j.laa.2007.08.007](https://doi.org/10.1016/j.laa.2007.08.007).

The original PDF was downloaded and its statement, duality section, equivalent formulations, special-case proofs, and diagonal-block discussion were read. Conjecture 1, printed page 2, equations (1)–(2), is the all-exponent, arbitrary-block assertion quoted in the landing page. Section 2 proves lower-to-upper duality; it expressly does not prove the converse. Section 4 proves rank-one compression, rank-one blocks, rowwise proportional blocks, and the upper inequality for `p>=4`. The scalar exponent in the positive Gram reformulation is `q=p/2`.

The general open interiors are `1<p<2` for the lower inequality and `2<p<4` for the upper inequality. The entire `p=1` endpoint has a recent prior proof described below. Finite dimensions, a fixed exponent, or an extra commutativity or triangular hypothesis are not being substituted for the original target.

Teng Zhang, [*Clarkson–McCarthy type inequalities, part I*, arXiv:2410.21961v4](https://arxiv.org/html/2410.21961v4), 28 March 2026, states the same conjecture as Conjecture 1.14. Theorem 1.15 contains a weaker rank-dependent factor. Its known-case discussion explicitly distinguishes Hanner’s theorem and the positive/diagonal two-column cases from arbitrary two-row blocks.

## 2. A current claimed-resolution summary identifies the wrong conjecture

[MathDB 414283](https://mathdb.com/p/414283/audenaert-s-conjecture-on-clarkson-mccarthy-inequalities) describes Zhang’s October paper as a claimed proof of this norm-compression conjecture. The exact primary manuscript does not support that identification.

The complete HTML of Zhang’s [*Clarkson–McCarthy type inequalities, part II*, arXiv:2611.00459v1](https://arxiv.org/html/2611.00459v1), 30 October 2026, was inspected. Theorem 1.2 proves the complementary power-trace inequality for positive definite matrices, with its separate exponent ranges. Theorem 1.6 concerns positive semidefinite two-by-two block matrices at `0<p<1`. Neither states arbitrary two-row Schatten norm compression in the Banach range. The abstract’s reference to an Audenaert conjecture concerns the power-trace conjecture. This is a source-scope correction, not a criticism of either theorem’s proof.

Heinävaara’s [*Tracial joint spectral measures*, arXiv:2310.03227](https://arxiv.org/abs/2310.03227), published in *Inventiones Mathematicae* 239 (2025), 505–526, proves Hanner’s Schatten inequality. Zhang’s two manuscripts explicitly distinguish that theorem from norm compression. Hanner’s theorem is not a new target here.

## 3. Prior research that must be credited

### Full trace endpoint

The pinned [mxym/math note](https://github.com/mxym/math/blob/4a51ff772a566451627b9ff41f6248518561d9d4/research/two-row-trace-norm-compression/README.md), dated 18 November 2026, proves the entire `p=1` lower inequality for two block rows and arbitrary compatible dimensions. Its full proof and scope discussion were read.

It factors `T=XY*` through a reduced singular-value decomposition, applies Drury’s published positivity theorem for the three-by-three matrix of block nuclear norms, glues the resulting real Gram representations over their common first two vectors, and uses Schatten Hölder. The proof explicitly includes singular blocks. Its separate strictly positive three-row counterfamilies do not refute the two-row conjecture. The note expressly leaves both exponent interiors open. This endpoint is prior work and will not be rediscovered or counted.

### Column reduction and scalar cone

[Trure issue 13686](https://github.com/the-omega-institute/trureturing/issues/13686), its complete comments, and the current pinned source notes were read. The upper branch reduces to at most three rescaled original columns, preserving the scalar compression Gram and increasing the original Schatten norm. The recorded proof uses a three-moment nonnegative weight polytope and convexity. Its October issue reports no full resolution.

The more recent pinned [Audenaert source note](https://github.com/the-omega-institute/trureturing/blob/de22a48707da1c7a48d032909e821bd481947b45/Library/QuantumStates/audenaert2008normcompression.md) also records a proof of concavity of the full finite two-row scalar power functional for `p=2q` with `1<q<2`, including singular Grams and axial columns. Its local-output gluing theorem consumes this scalar result but expressly leaves the unrestricted common-majorant optimization and original block conjecture open. The prose theorem statements and scope limitations were read; no Lean files were executed or verified.

The prior issue gives explicit failures of direct interpolation, right-block QR, a fixed symmetric dual certificate, and naive majorization. These are known obstacles, not new discoveries in this checkpoint. Its report of Fang’s triangular norm theorem, arXiv:2609.14621v2, is retained as a prior lead; that manuscript’s complete proof was not independently retrieved in this pass.

### Entropy inequalities

Tang–Zhu–Bai–Wang, [arXiv:2609.28592v1](https://arxiv.org/html/2609.28592v1), Theorem 4.2 and Appendix A, prove a triangular block entropy inequality. The complete matching block-entropy proof in the pinned [OpenAI source](https://github.com/openai/math/blob/4eaee87548250b2682affda7d05d947c05554bae/preprints/Classical-capacity-and-entropy-inequalities-for-generalized-amplitude-damping-September-24-2026/build/sections/block.tex) was read. It proves the entropy condition arising here when one of four blocks is zero and explicitly distinguishes this from full norm compression. The proof uses a log-determinant integral, joint convexity, sign averaging, and scalar homogeneity.

Peixue Wu’s [primary repository](https://github.com/pxwu24/additivity-of-classical-communication), associated with arXiv:2610.40585v1, states a Schur-weighted entropy theorem and applications to phase-covariant and qubit channels. Its full README and exact matrix theorem were read. The theorem requires a positive scalar Schur factor, a positive block factor, and block-diagonal noise. Producing these factors for the particular scalar shadow required by our derivative inequality is an additional constraint. The independent review supplies an exact obstruction to that direct representation in a known-positive rank-one-block example. Neither its channel consequences nor the entropy theorem are being relabeled as new work.

## 4. Why pursue the full target

This is a matrix inequality introduced in 2007 with continuing work in operator theory and quantum information. A concrete consequence appears in Negari–Baghali Khanian, [*Rényi entanglement of purification is non-additive*, arXiv:2608.28897v1](https://arxiv.org/html/2608.28897v1), §IV and Appendix D. Their strong-additivity theorem for classical two-qubit states holds for Rényi orders at least two using the known `p>=4` norm-compression theorem. They explain that Audenaert’s conjecture would extend that argument to all orders at least one. The relevant primary statements and reduction were read.

The intended advance is a proof or refutation for arbitrary blocks. The entropy derivative is a possible mechanism for producing a strict counterexample on an open interval of exponents; no such counterexample is supplied. Bounded positive checks would not settle the target and none are offered as a result.

## 5. Search and archive coverage

Both web engines were queried for the author, original identifier, exact norm-compression phrase, proof/counterexample terms, and the entropy connection. Current repository issues and the local historical index were checked. No previous issue in `solved-conjectures` named Audenaert was found before issue 213 was opened. The global issue search led to the Trure research line and its later source notes. The misleading MathDB result was followed through to the actual primary manuscript rather than accepted from its status label.

The accompanying scanner reads native UTF-8 bodies from locally pinned archives, applies Unicode NFKC and case folding, and searches the author, norm-compression phrase, original identifier, and MathDB identifier. Its size cap is 20,000,000 bytes per entry. Numeric identifiers intentionally generate some false matches; relevant retained bodies and theorem scopes were then inspected.

| Archive and immutable pin | UTF-8 bodies scanned | Broad matching bodies | Relevant scope |
|---|---:|---:|---|
| Trure `de22a48707da1c7a48d032909e821bd481947b45` | 75,410 | 103 | Three-column reduction, scalar cone concavity, local-output gluing; original conjecture explicitly remains open |
| ArtificialZeng `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2` | 14,099 | 5 | Embedded digits in unrelated exact data; no author or norm-compression text match |
| mxym/math `4a51ff772a566451627b9ff41f6248518561d9d4` | 23,630 | 26 | Full prior `p=1` endpoint; other Audenaert references concern different inequalities |
| AIM `b2ec0fac559f532fc0ed04fce81deea0ce07c68b` | 4,624 | 23 | Ruskai–Audenaert channel decomposition, a different target |
| OpenAI/math `4eaee87548250b2682affda7d05d947c05554bae` | 173,542 | 89 | Prior one-zero-block entropy proof; other author references concern Araki–Lieb–Thirring; software “NormCompression” names concern Markov type |
| PrincipiaMathOrg/math-solutions `47371706c400c79d06e3fb62190fcf6f7a725c85` | 1,453 | 0 | No matching native body |

These counts are specific to this bounded pass and differ from earlier campaign audits that used different size limits and matching sets. PDFs and other non-UTF-8 bodies, compressed files embedded inside these archives, and entries larger than the cap were not searched by this new native pass. The selected original and recent primary manuscripts were read separately as described above. This is not a claim of complete binary coverage or an exhaustive proof of priority. Any proposed full resolution would require a fresh final audit of the remaining source material and subsequent work.

## Present disposition

No full prior resolution of the exact two-row statement was located in the material inspected. Several strong partial statements are already proved and are recorded above. The original conjecture remains the research target. The entropy necessary condition and its limitations are documented in `ENTROPY_DERIVATIVE.md`; all of this checkpoint stays under research.
