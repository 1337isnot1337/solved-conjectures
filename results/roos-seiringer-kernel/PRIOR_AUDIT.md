# Roos–Seiringer's conjecture

Independent source and prior-resolution audit, 21 November 2026.

**Outcome:** no earlier resolution of the exact scalar nonnegativity assertion was found in the sources and archives checked below. The source and scope checks pass. This is a bounded priority audit, separate from review of the proposed proof and exact certificate.

## Exact source and scope

The primary source is Barbara Roos and Robert Seiringer, [*BCS Critical Temperature on Half-Spaces*](https://link.springer.com/article/10.1007/s00205-025-02088-x), *Archive for Rational Mechanics and Analysis* **249**, article 20, published 2 March 2025. The [arXiv record](https://arxiv.org/abs/2306.05824) gives the following history: v1, 9 June 2023; v2, 14 August 2023; v3, 2 July 2024; latest v4, 3 March 2025. It identifies v4 as the published version. No later arXiv version is displayed.

I read the published Section 5, including equations (5.1)–(5.2), Lemma 5.1, the paragraph following Figures 1–2, Remark 5.2, and Lemma 5.3. The proposed target is exactly the global nonnegativity of the radial Dirichlet function in that paragraph. The paper does not assign this assertion a conjecture number. The repository's author-based title identifies that unnumbered assertion.

The function is

```math
\begin{aligned}
m_3^D(x;1)
={}&\frac{4}{\pi x}\int_1^\infty
 \frac{\sin^2(xk)}{k}\mathop{\mathrm{arcoth}}(k)\,dk
-\frac{2\sin^2x}{\pi x}-\frac{2\sin^2x}{x^2}
\\ &+\frac{4\sin x}{\pi x^2}
\left(\sin x\mathop{\mathrm{Si}}(2x)
-\cos x\mathop{\mathrm{Cin}}(2x)\right),\qquad x>0.
\end{aligned}
```

Here $`\mathop{\mathrm{arcoth}}k=\frac12\log\frac{k+1}{k-1}`$, $`\mathop{\mathrm{Si}}y=\int_0^y\sin(t)/t\,dt`$, and $`\mathop{\mathrm{Cin}}y=\int_0^y(1-\cos t)/t\,dt`$. In particular, the source uses Cin, not the alternative cosine integral Ci. Lemma 5.3 gives a continuous extension with $`m_3^D(0;1)=0`$.

The assertion is $`m_3^D(x;1)\ge0`$ for all $`x>0`$. Equation (5.2) gives

```math
m_3^D(r;\mu)=\mu^{-1/2}m_3^D(\sqrt\mu\,r;1),\qquad \mu>0.
```

Thus this is the complete scalar assertion for all positive chemical potentials as well. The dimension-three index is part of the function originally singled out by the authors; this is not a newly selected positive case of an arbitrary-dimensional conjecture. The source separately states that the Neumann function changes sign. The unaveraged kernel and the complete physical model are distinct assertions.

The source proves nonnegativity near zero, sufficient for its small-chemical-potential theorem. That local result does not prove the all-x statement. An exact interval certificate covering a compact interval, combined with analytic proofs covering both remaining tails, would address the whole original assertion. A finite collection of positive sample values would not.

## Related primary sources checked

| Source | Directly inspected material | Why it is not a prior resolution |
|---|---|---|
| Roos, [*Boundary Superconductivity in BCS Theory*](https://research-explorer.ista.ac.at/download/14374/14398/phd-thesis-draft_pdfa_acrobat.pdf), September 2023, [institutional record](https://research-explorer.ista.ac.at/record/14374) | Section 5.5, printed pages 116–118; Lemma 5.5.1 and following discussion; Table 5.1. | It repeats the same formula and the same open nonnegativity assertion. The table confirms the zero endpoint and local second derivative. This is the same problem's earlier thesis appearance. |
| Roos–Seiringer, [*Enhanced superconductivity at a corner for the linear BCS equation*](https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/enhanced-superconductivity-at-a-corner-for-the-linear-bcs-equation/39F8C08749921E9C64E9EF8C5E5076A2), *Forum of Mathematics, Sigma* **13**, e71, 14 April 2025, DOI 10.1017/fms.2024.145 | Assumption 1.2, Theorems 1.4 and 1.6, Remarks 1.12–1.13. | The proved corner comparison is in two dimensions. Remark 1.13 discusses an expected three-dimensional extension and explicitly leaves its detailed calculation unworked. It does not prove the radial kernel inequality. |
| Roos, [*Linear Criterion for an Upper Bound on the Bardeen–Cooper–Schrieffer Critical Temperature*](https://arxiv.org/pdf/2407.00796), arXiv:2407.00796v2, 22 January 2025; published DOI 10.1063/5.0230179 | Introduction and Section 1.2.2, especially Theorem 1.10 and the description of the remaining sections. | The theorem gives the weak-coupling asymptotic agreement of an upper critical-temperature bound on a half-space with the full-space temperature. It does not establish the strict lower-temperature comparison by proving the sign of the Section 5 radial function. Searches of its extracted full text for arcoth and Cin found neither. |

The 2025 published main paper still explicitly leaves the global kernel sign open after these earlier preprints. No correction link was found in the current publisher full text.

## Author and current-publication checks

I inspected Robert Seiringer's author-hosted [February 2026 publication list](https://pub.ista.ac.at/~rseiring/Robert_Seiringer/Robert_Seiringers_Homepage_files/List%20of%20Publications.pdf). Entries 171–172 are the half-space and corner papers. The more recent listed work concerns different problems; no later kernel resolution is listed. The list is dated February, so it does not cover the entire period to this audit date.

Barbara Roos's [ISTA publication page](https://research-explorer.ista.ac.at/person/5DA90512-D80F-11E9-8994-2E2EE6697425?style=chicago), her older Tübingen CV, and indexed material from her [ORCID record](https://orcid.org/0000-0002-9071-5880) were checked. The ORCID search result includes a 2026 rapid-mixing preprint and the known BCS papers, with no claimed kernel resolution. Direct ORCID opening returned a JavaScript-only page; the new GSSI profile request timed out. Those failed page requests are not negative evidence.

Both search engines were used for the exact title, arXiv identifier, complete DOI, author pair, nonnegativity/positivity, proof, conjecture, kernel, and arcoth/arccoth variants. Recent-date searches covered 2025–2026. Searches also used the two author-name spellings with an en dash or hyphen. Retrieved technical leads were checked against primary papers, rather than being excluded solely by titles. No later proof of this exact assertion was found.

An attempted OpenAlex citing-works endpoint was inaccessible through the web tool. I therefore do not claim that every citing article was enumerated. Search results for the exact title and identifier, the author's current list, the main paper, the thesis, and the two closest follow-ups were checked as described above.

## Repository and public proof archives

The current [solved-conjectures HISTORY](https://github.com/1337isnot1337/solved-conjectures/blob/main/HISTORY.md) was fetched and searched for Roos, Seiringer, the identifier, BCS, and half-spaces. It had no earlier target entry. Global GitHub issue searches for the exact arXiv identifier returned no issue; a search for both author surnames returned only our new [issue #204](https://github.com/1337isnot1337/solved-conjectures/issues/204).

The [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog) complete tree at tree SHA `ca8d4d44ba3db527f19f28928c240168f545ecfe` has 2,033 entries and is nontruncated. I fetched `sources/R.md` and `problems/mathematics/analysis.md`. The latter's [Q3875](https://github.com/10m-u/open-problems-catalog/blob/main/problems/mathematics/analysis.md#q3875) is exactly this scalar inequality, with the same normalization and zero endpoint. It remains marked Open and records a 10 October 2026 literature check. This was used as a secondary status lead, not as the authority for the mathematical statement.

Direct checks of public solution repositories included:

- [mxym/math](https://github.com/mxym/math): README, CONTENTS, RESEARCH_HISTORY, and SOLVED_PROBLEMS contain no matching author, identifier, title, or BCS entry. At root tree SHA `9837717cf4b8fef116219666fe18883b20228dcc`, the complete `notes` subtree has 2,490 entries, the complete `preprints` subtree has 721, and the complete `manuscripts` subtree has 41; none has a matching path. The full root recursive request failed, so the successful subtree requests and index reads are the claimed scope.
- [xzwwwwww/math](https://github.com/xzwwwwww/math): README plus the complete 28-entry tree at SHA `93f15f5e04e25384d5eb3661bbfe53bac850f25f` have no matching entry.
- [suvrit/count-ex-machina](https://github.com/suvrit/count-ex-machina): current README has no matching entry.
- [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions): the locally retained complete 2,095-entry tree at SHA `47371706c400c79d06e3fb62190fcf6f7a725c85` has no matching author or identifier path.
- [the-omega-institute/trureturing](https://github.com/the-omega-institute/trureturing): all nine locally retained, nontruncated subtree inventories were searched for the authors and identifier. They cover S0, S1, Problems, Evidence, X_Frontier, and the saved Analytic, Combinatorics, Zeros, and HilbertOperators portions of S3. No matching author or identifier path appeared. These are path inventories, not a full-text audit of every proof. A broad BCS substring also matched unrelated graph filenames, which were not treated as a kernel result.

Domain-restricted searches also covered Trure Turing, Principia, ProbXiv, Hexagon, MathDB, and public GitHub pages. No prior exact-resolution lead appeared. This archive check deliberately includes direct mxym index and subtree reads: an earlier target in this campaign was excluded only after a direct mxym proof was found, despite weak search-engine recall.

## Admission boundary

The source does state the whole scalar assertion, and the closest retrieved follow-ups do not resolve it. No prior full proof or counterexample was located in the bounded audit above. The proposed result may proceed to independent mathematical review; this note does not certify its analytic estimates, interval coverage, integer rounding, or executable certificate. It also makes no claim that an unindexed or inaccessible prior proof cannot exist.
