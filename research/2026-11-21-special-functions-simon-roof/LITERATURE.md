# Simon's Asian-subroof conjecture: source and priority audit

Date: 2026-11-21. This is a research checkpoint, not a claimed resolution.

## Conclusion

The searches below did not locate a later precise definition of Simon's proposed subroof or a previous proof of the proposed ordering along such a subroof. They do not establish that no such result exists. There is also an explicit full-text access gap described below.

The current proof project establishes an ordering along a specified truncated path. The original informal geometric wording has a material scope ambiguity: the path has a horizontal interval and agrees with parts of the outer boundary. The project must therefore state its explicit theorem and the obstruction to a strictly descending interior right side, without counting an unqualified solution of the conjecture.

## Original source

Thomas Simon, *Comparing Frechet and positive stable laws*, Electronic Journal of Probability 19 (2014), paper 16, 1–25, DOI [10.1214/EJP.v19-3058](https://doi.org/10.1214/EJP.v19-3058).

- [Final journal PDF](https://www.maths.tcd.ie/EMIS/journals/EJP-ECP/article/download/3058/3058-16117-1-PB.pdf), printed pages 23–24.
- [arXiv:1310.1888v2](https://arxiv.org/abs/1310.1888), final discussion on printed page 26 of the preprint.

The final journal text was read directly. Page 23 describes the admissible parameter region with the positivity parameter on the horizontal axis and the stability index on the vertical axis. Page 24 states the proposed ordering along a subroof passing through each specified central point. It supplies no precise definition of a subroof, no differentiability requirement, and no explicit choice between strict interior inclusion and allowing contact with the outer boundary. The preprint and final journal versions do not resolve this issue differently.

## Later primary sources checked

| Source | What was checked | Relation to this target |
| --- | --- | --- |
| [Hasebe, Simon and Wang, *Some properties of the free stable distributions*, arXiv:1805.01133](https://arxiv.org/abs/1805.01133), v2, 2018; AIHP 56 (2020), 296–325 | Full text search for the roof terminology and direct reading of Proposition 12 and the adjacent convex-order discussion | Orders negative powers of positive free stable variables. This is a different family from the positive conditional branches of classical real stable variables. No formalization of the proposed subroof was found. |
| [Boudabsa and Simon, *Some properties of the Kilbas-Saigo function*, Mathematics 9 (2021), 217](https://www.mdpi.com/2227-7390/9/3/217) | Full text search and the beta-product convex-order arguments | Supplies related mean-one multiplicative comparisons and special-function monotonicity. No subroof assertion was found. |
| [Ferreira and Simon, *Mittag-Leffler functions and convex ordering*, arXiv:2512.04940](https://arxiv.org/abs/2512.04940) | Full text search and the order assertions used in the separate Mittag-Leffler investigations | Concerns normalized inverse positive-stable variables and Mittag-Leffler functions. No subroof statement was found. |
| [Joulin and Manou-Abi, *A note on convex ordering for stable stochastic integrals*](https://perso.math.univ-toulouse.fr/joulin/files/2013/12/maj.pdf) | The hypotheses and conclusions of the stable-integral comparison results | Uses stable integrals at a fixed stability index. The results do not themselves state the conditional-branch comparison required here. |
| [Thomas Simon's institutional publication list](https://pro.univ-lille.fr/thomas-simon/publications), displayed update 2026-08-29 | Titles and publication information through the displayed 2026 entries | No title explicitly resolving or formalizing the subroof proposal was found. A publication-list check does not replace reading every paper. |

These exclusions concern what the inspected sources actually state. They do not assert that the new proof method cannot be obtained from their general techniques.

## Explicit access limitation

Marco Massa, *On quantisations of probability measures in convex order, and generalised notions of conditional expectation, with applications*, PhD thesis, Imperial College London, 2023, DOI [10.25560/114852](https://doi.org/10.25560/114852).

The [institutional abstract](https://spiral.imperial.ac.uk/entities/publication/fa8eb2e8-3106-419b-b0aa-60b90e4c2d5a) was read. It says that Chapter 3 constructs explicit martingale transports for broad families of stable and finite-moment log-stable distributions and gives sufficient conditions for convex order, including necessary conditions in the log-stable case.

The full PDF is approximately 28 MB. The web retrieval service rejected it because of its size. A public-file download attempted through the isolated network execution connector failed before a local copy was available. Accordingly, Chapter 3 has **not** been read in full and is **not** excluded as possible prior art. The abstract does not identify positive conditional stable branches or Simon's subroof. That observation alone is insufficient to rule out relevant content.

## Search record

The following query families were searched in the public web search service, including the stronger search engine for the source and priority checks. Exact-phrase searches were supplemented by descriptions that do not depend on the geometric nickname.

- `"Asian subroof"`, `"subroof" stable`, `"Simon's" "subroof"`;
- `"stable" "roof" "convex order"`, `"Simon" "Asian" "roof" conjecture stable`;
- `"stable" "positive branch" "convex order"`;
- `"stable" "one-sided branches" "convex"`;
- `"one-sided stable branches" "convex"`;
- `"stable branches" "convex order"`;
- `"stable distributions" "positivity parameter" "convex order"`;
- `"stable" "conditional" "convex order" "Simon"`;
- variants combining stable skewness, conditional positivity, gamma-ratio moments and Malmsten kernels;
- `"Massa" "stable" "positive" "convex order" 2023 thesis`;
- `"Massa" "Simon" "stable" thesis`;
- `"On quantisations" "stable" "Chapter 3"`.

The relevant returns were the original paper and its mirrors, the later primary sources discussed above, and the Massa thesis. No returned source supplied a precise geometric formalization or an exact prior solution.

## Public proof archives

Successful repository code searches for `subroof` returned no matches in each of:

- [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions);
- [pudim-project/pudim-ai-demo-zetalaw](https://github.com/pudim-project/pudim-ai-demo-zetalaw);
- [the-omega-institute/trureturing](https://github.com/the-omega-institute/trureturing);
- [qqliu/CoPEER](https://github.com/qqliu/CoPEER).

A code search in [KnowledgeSense/math](https://github.com/KnowledgeSense/math) was rate-limited. Its `preprints` directory listing was successfully retrieved and all 56 displayed titles were inspected. None identified stable-branch or roof ordering. This title inspection is weaker than a full-text search. Earlier exact searches for the source identifier `1310.1888` during the separate stable-infimum audit also returned no matches in the five archives; those earlier searches were not an exhaustive content audit of the roof question.

## Claim policy

Do not replace the original geometric conjecture by an invented precise statement and count that replacement as a solution. Preserve the explicit path theorem, its independent mathematical audit, the moment-tail obstruction, the geometric scope distinction, and the unreviewed thesis in the research record. A future priority or source clarification can strengthen the classification, but the present classification remains a partial result with an unresolved interpretation issue.
