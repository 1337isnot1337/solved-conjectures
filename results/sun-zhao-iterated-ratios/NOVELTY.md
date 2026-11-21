# Prior-resolution audit

Target: Brian Y. Sun and James J. Y. Zhao, *Log-behavior of two sequences related to the elliptic integrals*, arXiv:1602.04359v4, Conjecture 5.2. Audit date: 21 November 2026.

Conclusion within the checked scope: no earlier proof, counterexample, or other settlement of this exact assertion was located. This is a bounded public-source audit, not a proof of worldwide novelty. In particular, complete journal text and comprehensive citation-database retrieval were unavailable, as detailed below.

## Exact source and version

1. [Latest arXiv abstract and version history](https://arxiv.org/abs/1602.04359): v1 was submitted 13 February 2016; v4, the latest version listed, is dated 10 April 2017. The [complete primary PDF](https://arxiv.org/pdf/1602.04359) was read, and the conjectures on printed page 14 were inspected in a rendered page image. The printed manuscript itself carries a later body date; the version identification here uses arXiv metadata.
2. The exact ratio definition is $`\mathcal R(a)_n=a_{n+1}/a_n`$, beginning at index zero. Conjecture 5.2 quantifies over every positive iteration order and removes the first $`k`$ terms at order $`k`$. Its remaining sequence is to be log-concave for odd order and log-convex for even order. Both this definition and the source recurrence were independently rechecked by the algebra reviewer.
3. The published article is *Acta Mathematicae Applicatae Sinica, English Series* 36 (2020), 590–602, DOI [10.1007/s10255-020-0952-1](https://doi.org/10.1007/s10255-020-0952-1). The publisher's preview and the [journal's own article page](https://applmath.cjoe.ac.cn/jweb_yysxxb_en/EN/10.1007/s10255-020-0952-1) were inspected. The latter lists a PDF but its extracted link points to an icon; attempted standard journal download endpoints did not return the text. The full journal article was not read. Accordingly this package explicitly resolves the latest arXiv conjecture, without assuming publication-stage wording is unchanged.
4. [James J. Y. Zhao's institutional publication page](https://cam.tju.edu.cn/~zhao/) still links the original preprint and lists the paper as submitted. It contains no update resolving the iterated-ratio conjecture. The page is evidently stale, so absence of an update is weak evidence. Its linked Maple archive, `https://cam.tju.edu.cn/~zhao/soft/FLF_log.zip`, could not be inspected through the web tool, which rejects the ZIP content type.

## Closest mathematical literature

These distinctions concern the actual operations and quantifiers, not just differences in titles.

| Source | What it establishes or discusses | Relation to the target |
| --- | --- | --- |
| Sun and Zhao, arXiv:1602.04359v4 | Among its theorems, the first ratio of $`P_n`$ is log-concave; its final section then states the all-orders Conjecture 5.2. | A theorem at the first ratio does not cover the twelfth ratio. The paper itself distinguishes the theorem from the conjecture. |
| [Maorong Sun and Lily J. Jin, *Proof of a conjecture on the Catalan–Larcombe–French numbers*, Ars Combinatoria 135 (2017), 257–263](https://combinatorialpress.com/article/ars/Volume%20135/volume-135-paper-22.pdf) | The abstract and theorem identify log-concavity of the first quotient sequence; the concluding proof and references were also inspected in PDF images. | Settles the earlier first-ratio conjecture of Sun and Wu, not Sun–Zhao's all-orders assertion. |
| [Brian Y. Sun and Baoyindureng Wu, *Two-log-convexity of the Catalan–Larcombe–French sequence*, Journal of Inequalities and Applications (2015), article 404](https://link.springer.com/article/10.1186/s13660-015-0920-0) | The complete HTML includes Theorem 1.1 on two-log-convexity, Conjecture 3.2 on infinite determinant-transform log-convexity, and Conjecture 3.3 on the first ratio. | The quadratic determinant transform $`a_{n-1}a_{n+1}-a_n^2`$ differs from the successive-ratio transform. Neither an infinite determinant-transform theorem nor a first-ratio theorem establishes the target. |
| [James J. Y. Zhao, *Sun's log-concavity conjecture on the Catalan–Larcombe–French sequence* (2016)](https://doi.org/10.1007/s10114-016-5446-y), with [institutional primary preprint](https://cam.tju.edu.cn/en/research/downAchiev.php?id=77) | Proves log-concavity of the sequences of $`n`$th roots of $`P_n`$ and $`V_n`$. | Roots are not successive applications of the ratio operator. |
| [Qing-Hu Hou and Zuo-Ru Zhang, *Asymptotic r-log-convexity and P-recursive sequences*, arXiv:1609.07840](https://arxiv.org/pdf/1609.07840) | Full text discusses iterates of the quadratic log-convexity transform and eventual inequalities for each fixed order. | Both the operator and the truncation quantifier differ. An unspecified eventual threshold depending on the order would not imply the explicit threshold $`n\ge k`$. |
| [Qing-Hu Hou and Zhongjie Li, *Log-behavior of the root sequences of P-recursive sequences*, arXiv:2310.19234](https://arxiv.org/pdf/2310.19234), journal DOI [10.1007/s11139-026-01371-z](https://doi.org/10.1007/s11139-026-01371-z) | The full preprint treats root sequences and root-ratio inequalities; its 2026 journal metadata was checked. | It does not supply a disproof or proof of the all-orders ratio statement with this truncation. |
| [*The log-behavior of some sequences related to the Catalan–Larcombe–French sequence and the Fennessey–Larcombe–French sequence*, JCMCC 103 (2017), 237–248](https://combinatorialpress.com/article/jcmcc/Volume%20103/vol-103-paper-18.pdf) | Abstract, opening statements, concluding pages and references were inspected; listed examples concern squares, factorial weights, differences, and ordinary ratios. | No all-orders ratio settlement was located in the inspected portions. This is not a claim that every proof line was read. |
| [OEIS A053175](https://oeis.org/A053175) | An update dated 9 September 2026 says a Zhi-Wei Sun conjecture was proved by Zhu and Sun (2018), Theorem 1.2. The conjecture is explicitly the positivity and odd integrality of normalized Hankel determinants. | That known resolution concerns a different conjecture, not the Sun–Zhao ratio assertion. |
| [Roberto Blanco Gómez, *Dwork-type towers for the Catalan–Larcombe–French numbers and a transfer principle for Apéry-like numbers*, aixiv:2611.01464](https://aixiv.online/abs/2611.01464) | Recent title and abstract were checked; the work treats prime-power congruences. | The abstract contains no ratio-inequality resolution. Its full text was not used as a mathematical ingredient. |

The nearby Conjectures 5.1 and 5.3 in the primary source concern a quadratic transform of $`V_n`$ and the iterated ratios of $`V_n`$, respectively. This package does not resolve them or count them separately.

## Search coverage

Both available web search engines were used. Search families included the exact title, arXiv identifier, DOI, author names, sequence names, operator names, conjecture number, and counterexample terminology. Representative exact queries were:

```text
"1602.04359"
"10.1007/s10255-020-0952-1" "conjecture"
"Log-behavior of two sequences related to the elliptic integrals" conjecture
"Catalan-Larcombe-French" "log-monotonicity"
"Catalan-Larcombe-French" "iterated"
"Catalan-Larcombe-French" "ratio" "counterexample"
"Sun Zhao" "Conjecture 5.2" "log"
"Catalan-Larcombe-French" "twelve"
"Catalan-Larcombe-French" "twelfth"
site:zenodo.org "Catalan-Larcombe-French" "log"
site:mathoverflow.net "Larcombe" "ratio"
```

Recent-result searches used a one-year date filter as well as unrestricted searches. Retrieved results led to the primary papers and scope distinctions above. Several superficially relevant hits concerned supercongruences, root sequences, first ratios, or Hankel determinants.

The [MathDB entry 332483](https://mathdb.com/p/332483/alternating-log-concavity-and-log-convexity-of-iterated-rati) was opened and matched to the exact source assertion. It reported zero submitted solutions and no refresh. That stale index status was used only to locate and identify the conjecture; it is not sufficient evidence that the conjecture remains open.

GitHub issue searches covered all accessible repositories for the exact arXiv identifier, DOI, sequence name with ratio terminology, and the named source. Before issue 198 was created, exact identifier searches returned no target resolution. Later exact searches returned the new issue itself. A broader search within `the-omega-institute/trureturing` for `Larcombe` found unrelated claims about Otmani congruences, Schulte's floor-weighted Catalan identity, and Karp's Legendre inequality; their matching passages did not concern this conjecture. A broad author-plus-ratio search failed with a transport error and was not counted as a successful negative result.

The existing local repository Markdown was searched for `Larcombe`, `Fennessey`, `1602.04359`, and Sun–Zhao name variants, without a match. The current remote `HISTORY.md` at commit `444696374a21085f0c8193db5facab49ede6e616` was separately read and searched without a target match. The repository-wide issue search for `Larcombe` returned only issue 198.

## Limits and decision

The full journal version and the author's Maple ZIP were not accessible. OpenAlex API attempts were blocked through the available web route, so no complete forward-citation set was obtained. Some broader GitHub code searches were rate-limited in this session. Search-engine indexing, private work and unpublished work are inherently outside this audit.

Within those limits, the primary conjecture is explicit, the counterexample is exact, an independent source/mathematics review agrees on the indexing, and no inspected earlier source resolves the statement. This is sufficient to present the package as a proposed new disproof with the access limits disclosed, rather than asserting that a search proves absolute priority.

The unrelated literal Brian Yi Sun conjecture in issue 192 was excluded after a source-internal positivity contradiction was identified. That exclusion does not apply here: every $`P_n`$ and every iterated ratio used in the present statement is strictly positive, and all three comparison indices survive the prescribed truncation.

## Additional catalog gate

The root agent checked all 26 source-letter indexes and the complete 2,033-entry tree of [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog/tree/ca8d4d44ba3db527f19f28928c240168f545ecfe) at commit ca8d4d44ba3db527f19f28928c240168f545ecfe. No entry matched the target's title, arXiv identifier, or Catalan–Larcombe–French / Sun–Zhao identifiers. This is an index/path audit, not a full-text audit of every proof in that repository.
