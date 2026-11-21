# Sources and priority audit

## Exact primary statement

Barbara Roos and Robert Seiringer, *BCS Critical Temperature on Half-Spaces*, Archive for Rational Mechanics and Analysis **249** (2025), article 20. Published 2 March 2025. DOI [10.1007/s00205-025-02088-x](https://link.springer.com/article/10.1007/s00205-025-02088-x).

The published full HTML was read directly, including the introductory dimension discussion, definitions (1.5)–(1.7), the radial average (5.1), scaling (5.2), Lemma 5.1, its proof, and the paragraph after the figures. Lemma 5.1 gives exactly the scalar formula transcribed in PROOF.md. The following paragraph says the Dirichlet radial kernel appears nonnegative, and identifies its proof as unavailable to the authors. The main theorem treats physical dimensions one through three. There is no arbitrary-dimension version of the kernel conjecture in the source.

The entire positive-real domain of the source assertion is covered. The source's small-argument calculation, Lemma 5.3 and its table, is consistent with the independently derived leading term 2x²/9. That already known local expansion is not claimed as new.

Public primary copies:

- [Publisher full HTML](https://link.springer.com/article/10.1007/s00205-025-02088-x)
- [Publisher PDF](https://link.springer.com/content/pdf/10.1007/s00205-025-02088-x.pdf)
- [PMC published article](https://pmc.ncbi.nlm.nih.gov/articles/PMC11873003/)
- [ISTA published record](https://research-explorer.ista.ac.at/record/19403)
- [arXiv 2306.05824v4](https://arxiv.org/abs/2306.05824v4), dated 3 March 2025 and marked as the published version; independently checked by the priority reviewer.

## Initial screening, 21 November 2026

Both built-in web search engines were used. Successful queries included the exact title, author pair with nonnegativity/positivity/kernel/conjecture/MathDB, and the literal kernel notation. Results located the primary article and its institutional copies, related BCS papers, and unrelated literature, but no prior proof of the exact radial-kernel assertion.

Global GitHub issue searches included the exact DOI stem `s00205-025-02088`, the author names with BCS, and the author names with nonnegativity. No matching resolution appeared. The name/BCS query returned an unrelated continuum-electron bibliography issue, which was not treated as evidence about this problem.

The complete locally fetched public archive trees were searched for Roos and Seiringer in their paths; no matching file appeared. Path searches alone do not exclude proofs under unrelated titles. The open-problems catalog entry Q3875 explicitly retains this same scalar assertion as open at its 10 October 2026 check. That catalog status is a discovery lead, not proof of current novelty.

The independent current source/citation/archive audit is complete and found no prior resolution within its recorded coverage. See [PRIOR_AUDIT.md](PRIOR_AUDIT.md) for exact queries, later papers read, current archive checks, and explicit limits. In particular, the 2025 corner paper is two-dimensional and leaves three dimensions unworked; the later upper-critical-temperature paper does not prove the kernel sign. The current source remains arXiv:2306.05824v4. This is bounded evidence for novelty, not an absolute guarantee.

## Classical identities used

The proof derives its particular integral-to-series identity, harmonic coefficients, signs, and all certificate bounds. It uses the following standard identities, whose official DLMF formulas were read directly:

- [DLMF 6.2.9](https://dlmf.nist.gov/6.2.E9): the sine integral definition.
- [DLMF 6.2.11](https://dlmf.nist.gov/6.2.E11): the cosine integral as the negative cosine tail.
- [DLMF 6.2.12](https://dlmf.nist.gov/6.2.E12): the complementary cosine integral definition.
- [DLMF 6.2.13](https://dlmf.nist.gov/6.2.E13): Ci(y)=−Cin(y)+log(y)+Euler's constant for positive y.
- [DLMF 6.2.14](https://dlmf.nist.gov/6.2.E14): the sine integral tends to pi/2 at positive infinity.

The bound on each oscillatory tail follows immediately by integration by parts, and is proved in the mathematical text. Euler's constant is less than one because H_n−log n decreases from its initial value one to that constant. Machin's identity follows by applying the tangent addition formula twice to arctan(1/5), then subtracting arctan(1/239): the resulting tangent is one and the angle lies in (0,pi/2). Thus its angle is pi/4. These classical ingredients are not new claims.
