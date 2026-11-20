# Robin's conjecture

Research date: 20 November 2026. [Issue #134](https://github.com/1337isnot1337/solved-conjectures/issues/134). Coordination: [issue #80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

## Full statement

Let
\[
\sigma(n)=\sum_{d\mid n}d
\]
and let \(\gamma\) be Euler's constant. Robin's conjecture is
\[
\boxed{\sigma(n)<e^\gamma n\log\log n
       \qquad\text{for every integer }n>5040.}                 \tag{R}
\]

All logarithms are natural. The target includes every integer above the exact historical threshold. A statement for sufficiently large integers, a finite verification range, or a fixed class of integers is not substituted for (R).

**Status:** complete credited transfer from the accepted RH input; independent review requested. The implication used below is Robin's published theorem. This note supplies the source-to-target application and scope/prior-art audit. It claims no new proof of the classical implication and no result independent of RH.

## The established theorem

G. Robin, *Grandes valeurs de la fonction somme des diviseurs et hypothèse de Riemann*, Journal de Mathématiques Pures et Appliquées, ninth series, **63** (1984), 187–213, **Théorème 1, printed page 188**, proves
\[
\mathrm{RH}\quad\Longleftrightarrow\quad (R).                   \tag{1}
\]

Three primary source records were checked for the formula, strict sign, and complete range:

1. The [original paper's publicly readable scan/OCR](https://www.scribd.com/document/812769429/Robin-1984-OCR-compressed), printed pp.187–188, contains Théorème 1. The OCR damages some mathematical glyphs, so it was cross-checked against the following sources.
2. [Choie–Lichiardopol–Moree–Solé, *On Robin's criterion for the Riemann hypothesis*](https://www.numdam.org/article/JTNB_2007__19_2_357_0.pdf), Journal de Théorie des Nombres de Bordeaux **19** (2007), 357–372, DOI [10.5802/jtnb.591](https://doi.org/10.5802/jtnb.591), abstract and introduction, states the exact \(n\ge5041\) result and attributes it to Robin.
3. [Axler, *On Robin's inequality*](https://link.springer.com/article/10.1007/s11139-022-00683-0), The Ramanujan Journal **61** (2023), 909–919, Proposition 1, explicitly identifies (1) with Robin's Théorème 1 and writes \(n>5040\).

These statements agree, since \(n\) is an integer. The original implication retains all of Robin's proof dependencies, including the finite part below his analytic threshold. Those dependencies are imported as part of the published theorem; this note does not claim to have independently reproduced the 1984 computations.

## Complete deduction

The source accepted for this campaign is
[1337isnot1337/riemann-hypothesis-solved at 9d5316ec73f5df89c4d95703ed106837b8a4060e](https://github.com/1337isnot1337/riemann-hypothesis-solved/tree/9d5316ec73f5df89c4d95703ed106837b8a4060e).

**Theorem.** Under the RH conclusion accepted from that source, (R) holds for every integer \(n>5040\).

**Proof.** Fix an arbitrary integer \(n>5040\). The accepted source gives RH for the Riemann zeta function, which is exactly the hypothesis of the forward implication of Robin's theorem (1). Apply that implication to \(n\). It yields
\[
\sigma(n)<e^\gamma n\log\log n.
\]
Since \(n\) was arbitrary, the full statement follows. \(\square\)

Equivalently, divisor complementation \(d\mapsto n/d\) gives
\[
\frac{\sigma(n)}n=\sum_{d\mid n}\frac1d
                  <e^\gamma\log\log n.
\]
This is the same statement, not an additional target.

Only zeta RH is used. Rational Dirichlet GRH, other \(L\)-function families, zero simplicity, independence of zero ordinates, and pair correlation are unnecessary.

### Relation to Nicolas's conjecture

The [Nicolas entry](nicolas.md) proves a different full historical arithmetic inequality under the same RH input. One must not replace Robin's theorem by the elementary bound
\[
\frac{\sigma(n)}n
=\prod_{p^a\parallel n}\frac{1-p^{-(a+1)}}{1-p^{-1}}
<\prod_{p\mid n}(1-p^{-1})^{-1}
=\frac n{\varphi(n)}.
\]
Nicolas gives a **lower** bound on the last expression at primorials. That direction does not provide the upper bound on \(\sigma(n)\) required here. The deduction above uses Robin's own established theorem.

Robin and Nicolas remain related RH consequences. Their two historical statements do not represent two independent advances in proving RH.

## Current prior-art audit

Audit date: 20 November 2026. Both search engines were used, with exact-title/name searches and current-year queries for full proofs, disproofs, corrections, and unconditional results. The inspected primary records distinguish the following scopes.

| Source | Scope relevant to the complete target |
|---|---|
| Robin (1984), Théorème 1 | The full conditional implication is already proved. It is credited and used directly. |
| Choie–Lichiardopol–Moree–Solé (2007) | Restricted integer families and structural conditions on any counterexample; the introduction retains the full RH equivalence. |
| Axler (2023), Proposition 1 and Theorem 1 | Restates the full equivalence and proves the inequality for every 21-free integer above 5040. That restricted result is not all integers. |
| [Solé–Zhu, *An asymptotic Robin inequality*](https://www.rxiv.org/pdf/1512.0006v2.pdf) | The stated unconditional conclusion concerns the limit inferior of a normalized defect. A limiting statement does not establish its strict positive sign at every integer. |
| [Vega, *Robin's Inequality at Colossally Abundant Numbers and Nicolas' Inequality at Their Largest Prime Factor*, version 2, 2 November 2026](https://hexagonmath.org/2610.00702v2) | Gives two-sided comparisons and a stronger negative defect bound under RH. The author explicitly retains RH for the latter conclusion and identifies the unresolved comparison interval. |
| [Vega, *Robin's Inequality and Superabundant Counterexamples*, version 6, posted 26 October 2026](https://www.preprints.org/manuscript/202409.1972) | Gives restricted families, bounds on hypothetical counterexamples, and a sufficient condition. It does not prove the sufficient condition for all required superabundant numbers. |
| [Vega, *An Explicit Window for Hypothetical Colossally Abundant Counterexamples to Robin's Criterion*, version 13, posted 11 May 2026](https://www.preprints.org/manuscript/202408.0348/v13) | Explicitly states that it does not establish RH. Its bound depends on the largest prime factor and leaves a fractional-part contribution unresolved. It is not a fixed upper bound excluding every counterexample. |
| [Polak's Robin research archive](https://github.com/robopol/Riemann-hypothesis), updated finite theorem dated 5 August 2026 | The author withdraws the earlier conclusive claim and explicitly limits the current theorem to a finite range. The full inequality is not claimed. |
| [Project Riemann's current author statement](https://bentleyperkins.com/riemann/) | Explicitly records that the decisive unconditional inequality and a proof of Robin's full statement have not been obtained. Earlier affected claims are recorded as withdrawn. |
| [teal-sea, Robin research results](https://zeta.teal-sea.com/read/hunts/robin_tfree/RESULTS.html) | The stated claims are \(t\)-free and valuation-restricted consequences and an upper bound for a primorial margin. They do not give the full all-integer strict inequality. |
| [October 2026 QRH applications survey](https://hexagonmath.org/pdf/2610.00178v1), 164 pages | Full-text searches for “Robin” and “Nicolas” returned no matches. The weaker zero-free-strip premise is not substituted for RH. |
| Accepted RH archive and the original QRH manuscript corpus | Targeted repository searches returned only unrelated Frobenius/Robin-boundary-condition substrings and numerical constants. No earlier explicit application to (R) was located. The [original QRH audit](qrh-prior-art.md) records the manuscripts and prior applications already excluded from this campaign. |

Indexed current catalogues also report finite-range and \(t\)-free improvements in November 2026. Some linked records were not directly retrievable in this audit. Their summaries are used only as discovery leads; no claim of checking their full proofs is made.

Searches also returned recent formalizations of **Robin's equivalence**. An unconditional proof that RH is equivalent to (R) is not an unconditional proof of either side. No Lean verification was performed.

The audit found no established earlier unconditional proof or disproof of the complete statement apart from application of the RH input accepted for this campaign. This is bounded search evidence, not an exhaustive priority certification. The older conditional theorem is already complete and is expressly credited.

## Source access and review

The original 1984 statement was read through extracted scan/OCR text. The old archived direct PDF link and some author/publisher endpoints were unavailable. No local raster inspection of that unavailable original PDF is claimed. The two readable later primary papers fix the strict sign and exact endpoint independently of the damaged OCR.

Independent review is requested for the exact theorem match, original threshold, current-status scope, and attribution. This entry represents one full historical target. Restricted families, equivalent rewritings, and finite checks are not additional solutions.

Internal review is distinct from external mathematical acceptance.
