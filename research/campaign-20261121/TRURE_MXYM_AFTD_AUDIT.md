# Trure, mxym, and AFTD retrospective priority audit

Later correction, 21 November 2026: Gröchenig’s upper-density package was withdrawn after [a checked earlier public proof](../bounty-continuation-2026-11-21/grochenig-prior-resolution/) was found outside this bounded search. The observations below remain a historical record of the sources inspected; their no-match result does not support a current novelty claim for that package.

Date: 21 November 2026. Reviewer: campaign analysis lane.

This audit covers the exact fourteen campaign families listed below. It replaces filename-only checks of the two large source archives with complete text-content searches, PDF extraction, compressed-source searches, and inspection of plausible matching claims. It also checks the public AFTD knowledgebase and all-state Trure issue searches.

No additional prior resolution of these fourteen targets was identified in these three sources. This finding does **not** reverse the two decisive Principia collisions: Fang–Zhang–Zhao's infinite-log-convexity conjecture and Sun–Zhao's iterated-ratio conjecture were already resolved and have been withdrawn. The [Principia full-text audit](../2026-11-21-principia-fulltext-audit/PRINCIPIA_FULL_TEXT_AUDIT.md) records those independent findings.

A separate issue-history check found a complete earlier proof of the repository's older Karp–Vishnyakova–Zhang Bessel-ratio unimodality entry. That entry is outside this fourteen-target campaign. Its exact overlap is documented below and requires a separate withdrawal.

## The exact target set

The search pattern file is [archive-screen/targets.json](archive-screen/targets.json). It contains source identifiers, author variants, and characteristic statement terms. McCrea and López Pouso–Segura are included explicitly; no other group's targets are substituted for them.

| Target | Original statement compared | Finding in this audit |
|---|---|---|
| Fang–Zhang–Zhao | [2505.05873](https://arxiv.org/abs/2505.05873), Conjecture 4.3, infinite log-convexity | No exact Conjecture 4.3 resolution in these three sources. Trure's same-paper issue concerns Conjecture 4.1. The exact Principia prior remains decisive. |
| McCrea | [2609.12005](https://arxiv.org/abs/2609.12005), Conjecture 9.2, the full density-crossover assertion | No author, source identifier, or matching crossover result. |
| López Pouso–Segura | [2305.19128](https://arxiv.org/abs/2305.19128), [published DOI](https://doi.org/10.1186/s13660-025-03283-w), Bessel-weight Conjectures 2, 5, and 8 | No exact source, Pouso, or matching Bessel-weight assertion. |
| Vishnyakova | [2607.06207](https://arxiv.org/abs/2607.06207), Open Problem 6.2; [2608.03723](https://arxiv.org/abs/2608.03723), Open Problem 7.2 | Same-paper results were read. They explicitly stop at degree two or a linear-factor closure case. |
| Gröchenig | [DOI 10.1007/s44146-026-00264-3](https://doi.org/10.1007/s44146-026-00264-3), Problem 4.12 | Broad zero-density hits concern zeta zeros, arithmetic sets, or density-zero pieces of unrelated problems, not zeros of translates of a totally positive function. |
| Han–Sabag–Kostina–Hassibi | [2406.17196](https://arxiv.org/abs/2406.17196), Conjecture 1, the Lyapunov matrix assertion | No source identifier or matching matrix assertion. |
| Sun–Zhao | [1602.04359](https://arxiv.org/abs/1602.04359), Conjecture 5.2 | Trure references to these surnames concern distinct-sum inequalities; Catalan–Larcombe–French references concern congruences. The exact Principia prior remains decisive. |
| Lyon | [2021 paper](https://doi.org/10.1371/journal.pone.0251626), [2023 paper](https://doi.org/10.1371/journal.pone.0288601), [2611.14429](https://arxiv.org/abs/2611.14429), transformed gamma-median monotonicity | No matching source or gamma-median assertion. Broad surname hits concern Lyons and unrelated work. |
| Ferreira–Simon | [2108.09244](https://arxiv.org/abs/2108.09244), Conjecture 1, beta-prime convolution | Trure issue 22716 settles the same paper's different Conjecture 3 on Mills-ratio derivative quotients. Its full argument and comments were read. |
| Chen–Khare–Sahi | [2509.19649](https://arxiv.org/abs/2509.19649), Conjecture 5, Macdonald membership in the Muirhead semiring | No matching source or semiring assertion. Other Muirhead references concern ordinary majorization inequalities. |
| Dospolova–Germanskov–Zaporozhets | [2507.11626](https://arxiv.org/abs/2507.11626), Conjecture 3.6, intrinsic-volume realizability | No matching source, author, or intrinsic-volume assertion. |
| Roos–Seiringer | [2306.05824](https://arxiv.org/abs/2306.05824), the full radial Dirichlet-kernel sign assertion after Lemma 5.1 | Roos hits concern Joris Roos's different formal libraries or the Ben-Tal–Nemirovski–Roos probability problem. No BCS-kernel assertion. |
| Kovalev | [2607.17373](https://arxiv.org/abs/2607.17373), Conjecture 6.1, the two-sided matrix Hardy-norm comparison | No matching author, source identifier, or matrix-norm assertion. |
| Brown–Mol | [1810.08655](https://arxiv.org/abs/1810.08655), Conjecture 4.2; retained in [2608.07898](https://arxiv.org/abs/2608.07898) | No matching source or translated subtree-root annulus assertion. |

This is a statement-level comparison. A reference to a paper, a common author surname, or an identical sequence name was not treated as a resolution without comparing the actual claim and quantifiers.

## Trure: complete current source snapshot

Repository: [the-omega-institute/trureturing](https://github.com/the-omega-institute/trureturing), pinned commit `de22a48707da1c7a48d032909e821bd481947b45` on its public `dev` branch.

The [immutable codeload archive](https://codeload.github.com/the-omega-institute/trureturing/tar.gz/de22a48707da1c7a48d032909e821bd481947b45) contains 128,899,937 compressed bytes. Its SHA-256 is:

```text
ace9dc893da3c557b0d7423e0360426426a520fd2187827b0b558cc394c526e2
```

Every regular archive member decoded as UTF-8: **75,410 files** were searched in full, with no extension filter and no per-file size cutoff. The only three skipped entries were symlinks. They were not followed. There were no undecodable regular members or PDFs in this snapshot. The broad substring screen returned 116 files. Complete matching files were preserved locally for inspection; the archived contents were never executed.

Many numerical-identifier matches occur inside large integers, hashes, or generated arithmetic certificates. These were separated from actual source references. For example, the digits of a MathDB identifier appearing as a numerator in a rational logarithm bound are not a reference to that MathDB problem.

The source-matching Vishnyakova material was read beyond its filenames:

- [QuadraticRadii.md at the pinned commit](https://github.com/the-omega-institute/trureturing/blob/de22a48707da1c7a48d032909e821bd481947b45/Blueprint/D5/S3/Zeros/PochhammerDeformation/QuadraticRadii.md) defines the full degree-two class and proves its sharp inner and outer radii. Theorem 1.12 explicitly restricts the outer-radius result to degree two and disclaims higher degrees. It therefore does not prove the campaign's all-degree assertion.
- [LinearFactor.md](https://github.com/the-omega-institute/trureturing/blob/de22a48707da1c7a48d032909e821bd481947b45/Blueprint/D5/S3/Zeros/PochhammerDeformation/LinearFactor.md) proves a linear-factor case of the different Open Problem 1.9.
- [The source note](https://github.com/the-omega-institute/trureturing/blob/de22a48707da1c7a48d032909e821bd481947b45/Library/Zeros/vishnyakova2026polynomially.md) distinguishes its quadratic parameter-interval result and small-parameter refutation of Conjecture 6.5 from the unproved higher-degree assertions.

The Karp–Vishnyakova–Zhang log-concavity files concern a different paper and assertion. They are not evidence about Anna Vishnyakova's root-radius problem.

## Trure: issue bodies and comments

The current source tree does not contain every mathematical argument posted in an issue. All-state GitHub issue searches were therefore performed separately, using grouped exact paper identifiers and then author and statement terms. The successful result sets reported `incomplete_results: false`; failed initial queries returning HTTP 422 were discarded. The saved [issue-search summary](archive-screen/issue-search-summary.json) records the returned counts and issue URLs. This is an indexed search of issue bodies and comments, not a claim to have downloaded and manually reviewed every issue in that repository.

The exact-identifier query groups returned one, zero, four, and two issues, respectively. Their source-matching bodies were read. Narrow additional queries for `Muirhead`, `Brown` with `Mol`, `Han` with `Sabag`, and beta-prime-convolution terms were also examined. Broad incidental hits were checked in context rather than accepted from their titles.

Important distinctions:

- [Issue 18758](https://github.com/the-omega-institute/trureturing/issues/18758) gives the already identified full Fang–Zhang–Zhao **Sturm-sequence** proof, Conjecture 4.1. It is not the infinite-log-convexity Conjecture 4.3 audited here. The former had already been withdrawn from this campaign.
- [Issue 22716](https://github.com/the-omega-institute/trureturing/issues/22716) gives a complete refutation of Ferreira–Simon **Conjecture 3**, concerning Gaussian Mills derivative quotients. The campaign resolves **Conjecture 1**, a beta-prime distribution identity. The entire relevant argument and both comments were read; no beta-prime Conjecture 1 resolution is stated there.
- [Issue 5907](https://github.com/the-omega-institute/trureturing/issues/5907) and all five comments were read. The comments explicitly identify degree-two Open Problems 7.1/7.2 and the linear-factor case of Open Problem 1.9. They do not extend the radius theorem to every degree.
- All 109 comments in the broad [research lane 6160](https://github.com/the-omega-institute/trureturing/issues/6160), and all fourteen comments in [issue 5952](https://github.com/the-omega-institute/trureturing/issues/5952), were screened for the fourteen source identifiers and author/statement terms. The only additional relevant surname match concerns a different Katkova–Shapiro–Vishnyakova Newton-inequality paper.
- The Sun–Zhao distinct-sum discussion cites their Erdős–Heilbronn extension, not the Catalan–Larcombe–French iterated-ratio conjecture. The nearby Catalan–Larcombe–French references concern supercongruences or arithmetic identities.

## mxym: source text, every PDF, and compressed bundles

Repository: [mxym/math](https://github.com/mxym/math), pinned commit `4a51ff772a566451627b9ff41f6248518561d9d4`.

The [immutable codeload archive](https://codeload.github.com/mxym/math/tar.gz/4a51ff772a566451627b9ff41f6248518561d9d4) contains 408,975,011 compressed bytes. Its SHA-256 is:

```text
ea9b7ccdc1e8147e8ca02af9099f832b1bd1ff35d082c2a692a4dafd010dca5f
```

The first pass searched **23,631 regular UTF-8 files** and recorded 487 undecodable members. The broad substring screen returned 83 files, predominantly numeric identifiers embedded in integers or hashes and generic terms in unrelated papers.

The binary-source supplement then processed all PDF, ZIP, gzip, and tar payloads without executing them. It searched **24,032 embedded text records** and **192 extracted PDF texts**. The PDF count includes all 129 top-level PDFs plus 63 PDFs embedded in source bundles. Every PDF conversion succeeded and produced nonempty text. Duplicate representations are counted separately; these figures do not mean there are 192 distinct papers.

Five split gzip streams and two base64-encoded split streams were subsequently reconstructed and searched, adding **1,454 text records**. All seven reconstructions succeeded. The initial forty conversion limitations thereby reduce to eighteen nontext objects: ten compiled Lean objects, seven PNG plots/contact sheets, and one binary combinatorial map. Those eighteen objects were not interpreted as text. No mathematical verification or compilation in Lean was performed.

The ordinary and compressed matches were inspected. The substantive broad-term matches concern:

- zero-density gaps in transport estimates or sparse-set similarity constructions;
- fractional matching spectra and unrelated Goldbach estimates;
- the Ben-Tal–Nemirovski–Roos probability conjecture;
- spatial-field work by different Ferreira coauthors;
- a root-radius bound for a graph-coloring polynomial, unrelated to the normalized Pochhammer class.

None states one of the fourteen target conjectures or an equivalent full resolution. The split-stream matches are digits inside generated arithmetic data and provenance hashes.

The supplement used a 256 MiB per-entry expansion bound and recursion depth eight. No entry hit either bound. Its recorded failures were split streams, all resolved in the second pass, and the eighteen nontext objects listed above.

## AFTD: complete published knowledgebase snapshot

Repository: [rainwangphy/aftd-platform](https://github.com/rainwangphy/aftd-platform), pinned commit `a92dfddb67e6569f576a813bc2079f5233540ac9`.

The repository README identifies [web/data/kb.json.gz](https://github.com/rainwangphy/aftd-platform/blob/a92dfddb67e6569f576a813bc2079f5233540ac9/web/data/kb.json.gz) as the knowledgebase snapshot used to build its public site. That complete file was downloaded and decompressed. It has 26,244,074 compressed bytes and SHA-256:

```text
c13c9c28517de2a883717f22b8d6dfa9f58c84367c81540a6bd0ab104b64f372
```

The snapshot was generated on 20 November 2026 at 21:14:25 UTC. All fields of its **17,937 declarations**, **6,424 open entries**, and **1,647 literature entries** were searched, including the actual source text and informal statements. The sole raw substring match was the digits `370539` inside a timestamp attached to an unrelated Kelly–Ulam graph-reconstruction entry. It is not a Chen–Khare–Sahi reference. The pinned news file's 79 entries were also searched and contained no target resolution.

This was a complete search of the published knowledgebase snapshot, not a download of the repository's entire Git history or an assertion that every conceivable unpublished result is represented there.

## Separate correction: the older KVZ Bessel-ratio entry

[Trure issue 25199](https://github.com/the-omega-institute/trureturing/issues/25199) was created and last updated on **1 November 2026**. It contains a complete ordinary analytic proof of the first sentence of Conjecture 1 in [arXiv:2408.01755v2](https://arxiv.org/abs/2408.01755v2), the full real-order modified-Bessel ratio unimodality assertion.

The quantifiers match the repository's older result exactly: every real order pair with $`\nu_1\geq\nu_2>-1`$, and every scale pair with $`0<a_1\leq a_2`$. Monotone and constant functions are included. The unused source parameter is retained in the earlier statement. The later log-concavity clause is expressly excluded in both treatments.

The earlier proof was checked mathematically. It derives the Bessel equation and positive defining series; for $`y=I_{\nu_1}(a_1x)`$ and $`z=I_{\nu_2}(a_2x)`$, it establishes

```math
W=x(y'z-yz'),\qquad
W'=\bigl(\nu_1^2-\nu_2^2-(a_2^2-a_1^2)x^2\bigr)\frac{yz}{x}.
```

For a strict order gap, the defining series gives a positive initial sign for $`W`$, even when the sum of orders is negative. For equal orders, the next series term gives $`W(0+)=0`$ because $`2\nu+2>0`$. The sign of $`W'`$ then yields at most one positive-to-negative crossing, which proves the entire unimodality assertion. These arguments cover negative orders and every equality case. No mathematical gap was found.

The earlier issue says its remaining work is formal translation and repository admission. Those do not make the mathematical conjecture unresolved under this task's rule. The repository's more detailed strict branch classification does not restore priority for the already resolved conjecture. The older `results/kvz-bessel-unimodality` entry must therefore be removed from the original-result collection and preserved as attributed research. This correction does not change the fourteen-target campaign count, because that older entry was not part of it.

The overlap was reported in [campaign issue 156](https://github.com/1337isnot1337/solved-conjectures/issues/156#issuecomment-7059832609) and [target issue 107](https://github.com/1337isnot1337/solved-conjectures/issues/107#issuecomment-7059832754).

## Reproduction and limits

[archive-screen/archive-audit-summary.json](archive-screen/archive-audit-summary.json) records the immutable snapshots, hashes, target list, and coverage counts. The small scripts contain the complete acquisition and search logic. Run them in a disposable directory with Python 3.11 or later and Poppler's `pdftotext` available:

```bash
python3 scan_archive.py trure the-omega-institute/trureturing de22a48707da1c7a48d032909e821bd481947b45
python3 scan_archive.py mxym mxym/math 4a51ff772a566451627b9ff41f6248518561d9d4
python3 scan_supplement.py mxym
python3 scan_supplement.py mxym --splits-only
python3 scan_aftd.py
```

The scripts search complete contents, save complete matching text locally, and report every decoding or expansion failure. Large downloaded archives, copied third-party papers, and full source manifests are not republished here. The compact metadata and source URLs suffice to repeat the searches.

These checks cover current immutable public snapshots and the described issue searches. They do not exhaust deleted Git history, private material, every public mathematical website, or equivalent theorems stated without recognizable terminology. Keyword matching is followed by reading plausible claims; it is not a manual review of every unrelated line. The remaining uncertainty must stay explicit even after replacing the earlier inadequate filename-only screens.
