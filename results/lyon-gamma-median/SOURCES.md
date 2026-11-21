# Source and prior-resolution audit

Audit date: 2026-11-21. Scope: Lyon’s monotonicity conjecture for $`A(a)=2^{1/a}m(a)-a`$, on all $`a>0`$. No earlier proof or disproof of this exact assertion has been located in the sources examined. This is a bounded search report, not a proof that no inaccessible or unindexed work exists.

## Original and current primary statements

| Source | Inspected scope | Relevance |
|---|---|---|
| Richard F. Lyon, [*On closed-form tight bounds and approximations for the median of a gamma distribution*](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0251626), PLOS ONE 16(5), e0251626 (2021) | Full publisher article; formulation of the transformed median | Introduces the transformed function and reports its apparent monotonicity; the paper distinguishes numerical support from proof. |
| Richard F. Lyon, [*Tight bounds for the median of a gamma distribution*](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0288601), PLOS ONE 18(9), e0288601 (2023) | Theorems U6/L8, discussion of interpolation, and conclusion | Proves endpoint bounds for the transformed median while expressly retaining its decreasing monotonicity as conjectural. Those endpoint bounds alone do not give its derivative sign. |
| Richard F. Lyon, [*Analytic and optimized approximations to the median of the gamma distribution*](https://arxiv.org/abs/2611.14429), v1, submitted 10 November 2026; [full PDF](https://borowiecki.dev/pdf/2611.14429) | Introduction, Section 3, Appendices A/B, and references | Explicitly states that the monotonicity conjecture for $`A`$ remains open. The later function $`C`$ has a separate unproved increasing property and is not treated as equivalent. |
| Richard F. Lyon, [*On the median of the beta distribution in relation to the median of the gamma distribution*](https://borowiecki.dev/pdf/2610.39202), arXiv:2610.39202v1, 29 October 2026 | Gamma-median comparison in Section 6 and Theorem 3, summary of results | Proves the crossing bound involving $`\log2/(2^{1/a}-1)`$. This is a comparison of function values, not a proof of the derivative inequality for $`A`$. |

The target is the entire published monotonicity assertion, with a strict derivative conclusion. It is not the already-proved pair of constant bounds, the older Chen–Rubin conjecture about $`m(a)-a`$, or a new parameter-restricted variant.

## Established inputs and nearby results

- Berg and Pedersen, [*The Chen–Rubin conjecture in a continuous setting*](https://arxiv.org/pdf/math/0411282), Methods and Applications of Analysis 13(1), 63–88 (2006), DOI 10.4310/MAA.2006.v13.n1.a4: Theorem 3.3 proves $`0<m'<1`$; the paper records the Chen–Rubin bound $`a-1/3<m(a)`$. These facts are inputs to the large-parameter proof, not the target itself.
- Berg and Pedersen, [*Convexity of the median in the gamma distribution*](https://arxiv.org/pdf/math/0609442), Arkiv för Matematik 46, 1–6 (2008), DOI 10.1007/s11512-006-0037-2: Theorem 1.1 proves $`m''>0`$, used to extend endpoint secants over real intervals.
- [DLMF 5.11.1 and 5.11(ii)](https://dlmf.nist.gov/5.11): Stirling expansion and the signed first-neglected-term bound at positive real arguments. The certificate uses eight terms after shifting the argument by sixteen.
- [DLMF 8.11.4](https://dlmf.nist.gov/8.11.E4): the positive, absolutely convergent incomplete-gamma expansion. The certificate supplies an explicit geometric bound for its remaining tail.
- Principia Math in Progress, [*The McKay Type I median: strict monotonicity and correction of a conjectured lower bound*](https://principia-math.com/api/ws/files/31f48fc760fd14252b7ec826f376e59e), 12 September 2026: full five-page proof inspected. It changes a weighting parameter between two independent gamma variables, with fixed shape. Its endpoint gamma bounds do not prove monotonicity of Lyon’s shape-dependent transform.

A search also surfaced Gaunt–Ouimet, *Bounds for the median of the generalized hyperbolic and related distributions*, arXiv:2609.20212. The available search record concerns variance-gamma and McKay medians. Attempts to retrieve the full primary PDF from arXiv and two mirrors failed, so this audit does not represent that text as inspected. The newer November primary source still explicitly states the exact Lyon target is open.

## Literature searches

Both available web search engines were used, with recent searches in the stronger engine. Queries included the original and current titles and identifiers, author plus gamma median plus monotonicity, the transformed expression, and combinations of proof, conjecture, decreasing, counterexample, and resolution. Additional searches were directed at public proof archives and GitHub.

The returned exact target discussions were the 2021, 2023, and November 2026 primary sources. Older Chen–Rubin proofs concern the unscaled difference between mean and median. Recent beta-median and McKay-median results were examined as described above. No matching full resolution was found.

Representative query strings:

```text
"Lyon" "gamma median" monotonicity proof
"Lyon" median "conjecture" decreasing
"gamma median" "monotonicity" proof conjecture 2026
"2^{1/k}" "median" "conjecture"
"Lyon" "gamma" "median" "proof" monotonicity
"Lyon" "median" "MathDB"
"Lyon" "median" "monotonicity" "github.com"
"gamma median" "conjecture" "solved"
```

## Repository history and issue audit

The local repository’s `HISTORY.md`, `research/`, `README.md`, and `CONTENTS.md` were searched for Lyon, gamma-median variants, both PLOS identifiers, and arXiv:2611.14429. No prior target entry was found.

Global GitHub issue searches used the exact author/topic combination and the original/current paper identifiers, including narrower searches inside `the-omega-institute/trureturing` and `1337isnot1337/solved-conjectures`.

- The sole older hit for Lyon in this repository was [issue #139](https://github.com/1337isnot1337/solved-conjectures/issues/139). Its body and all 192 comments were fetched in two pages. The only relevant string match was an `ens-lyon.fr` link in an unrelated invariant-factor algorithm discussion. It contains no gamma-median resolution.
- Global DOI searches found [VBA probability issue #7](https://github.com/danielep71/VBA-PROBABILITY-DISTRIBUTIONS/issues/7) and [issue #14](https://github.com/danielep71/VBA-PROBABILITY-DISTRIBUTIONS/issues/14). Both complete bodies were inspected; both had zero comments. They cite Lyon’s published bounds as possible numerical checks or starting estimates. Neither claims a monotonicity proof.
- Searches for the exact author and median monotonicity inside the trureturing issues found no exact target. Broader searches produced unrelated geometry, quantum-information, and coordination issues, not a target-specific solution.
- The new reservation [issue #196](https://github.com/1337isnot1337/solved-conjectures/issues/196) and its subsequent checkpoint are our own disclosures and are excluded from the prior-art evidence.

Complete, nontruncated local path trees were searched for Lyon, gamma-median, and equivalent filename forms:

| Public archive tree | Entries |
|---|---:|
| PrincipiaMathOrg/math-solutions | 2095 |
| trureturing Problems | 2190 |
| trureturing Blueprint S0 | 1459 |
| trureturing Blueprint S1 | 2794 |
| trureturing S3 Analytic | 1508 |
| trureturing S3 Zeros | 341 |
| trureturing S3 Combinatorics | 5872 |
| trureturing S3 HilbertOperators | 38 |
| trureturing Evidence | 14 |
| trureturing X_Frontier | 2 |

No matching target path appeared. This is a filename audit, not a claim to have read every archived proof. The complete public `APPLICATIONS.md` and `theory/versions/v022/THEORY_v022.tex` of [pudim-project/pudim-ai-demo-zetalaw](https://github.com/pudim-project/pudim-ai-demo-zetalaw) were also searched for Lyon and gamma-median phrases; none appeared.

Global GitHub code searches were rate-limited repeatedly. One successful search for the exact PLOS identifier `0288601` returned many unrelated numerical-data matches and the [open-problems catalog source index](https://github.com/10m-u/open-problems-catalog/blob/main/sources/L.md). Its linked [entries Q3197 and Q3198](https://github.com/10m-u/open-problems-catalog/blob/main/problems/mathematics/probability-stochastic-processes-part-2.md#q3197) were then read in full. Q3197 records this exact monotonicity question as open after a literature check dated 8 October 2026; Q3198 is the separate rational-interpolation problem. The catalog is a secondary discovery aid, not a mathematical input. A narrower code query adding `gamma` was blocked by HTTP 429. Neither blocked queries nor unexamined result pages are counted as negative evidence. The independent algebra reviewer performed separate current-source and archive-path searches and reported the same absence of a located prior resolution.

## Priority assessment

The exact assertion remains expressly open in a primary source submitted eleven days before this audit. The checked prior literature, repository history, matching issues, and available archive indexes revealed no earlier resolution. The proposed result therefore passes the searches completed so far, subject to the stated limitations and any later-discovered prior work. Mathematical correctness is reviewed separately from this priority assessment.
