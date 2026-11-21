# Sun–Zhao: focused source-access review

**Confirmed prior resolution, 21 November 2026:** the [complete earlier disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex) is pinned at Principia commit `34b8b155d7db464ad7306f70b16d3af9cee34501`, 27 October 2026, 02:59:18 UTC. It uses the identical twelfth ratio iteration, retained indices 12, 13, 14, and an exact integer-product certificate from the same fifteen source terms. The internal manuscript date of 11 September is not the publication evidence. This campaign's counterexample is a rediscovery and is definitively excluded from new-result counts. Historical mathematical and access checks below are preserved; their former priority conclusions are superseded.

Date: 21 November 2026. Related issue: [198](https://github.com/1337isnot1337/solved-conjectures/issues/198).

**Historical access outcome:** neither the complete journal text nor the author's Maple archive was obtained during this follow-up. Those retrieval limits remain accurate. A later, separate direct archive check found the complete earlier disproof, so Conjecture 5.2 is now definitively excluded as prior work; it is no longer merely a candidate awaiting these source files.

The package's source audit is named [NOVELTY.md](https://github.com/1337isnot1337/solved-conjectures/blob/fa34b035f4853c8e790bd520171739ee17923a56/results/sun-zhao-iterated-ratios/NOVELTY.md), not SOURCES.md. That full audit and the issue history were read before this focused follow-up. Mathematical verification and the broader priority review are separate work.

## Journal text

The primary [Springer article page](https://link.springer.com/article/10.1007/s10255-020-0952-1) was retrieved successfully. It identifies the article as *Acta Mathematicae Applicatae Sinica, English Series* 36, 590–602 (2020), published 2 September 2020, received 29 December 2017 and accepted 31 January 2020. The accessible material consists of the abstract, bibliography, acknowledgments and publication information. It explicitly labels the article as subscription content and says a SharedIt link is unavailable. This does not expose the final conjecture section.

The journal's own [DOI route](https://applmath.cjoe.ac.cn/jweb_yysxxb_en/EN/10.1007/s10255-020-0952-1) and [2020 issue page](https://applmath.cjoe.ac.cn/jweb_yysxxb_en/EN/Y2020/V36/I3) returned only a loading page through the available reader. Search-index extracts identify the same article and a PDF label but do not provide the journal text. Previously unsuccessful guessed download endpoints were not retried.

Concrete institutional routes were also checked:

- [James J. Y. Zhao's Tianjin homepage](https://cam.tju.edu.cn/~zhao/) links the arXiv preprint and Maple archive. It still lists the paper as submitted and provides no journal-text mirror.
- Tianjin's [English 2020 research index](https://cam.tju.edu.cn/en/research/index.php?id1=10&y=2020) and [Chinese 2020 research index](https://cam.tju.edu.cn/research/index.php?id1=10&y=2020) were retrieved and searched. No title match supplied a mirror.
- A targeted Xinjiang University search located [Sun's institutional CV PDF](https://math.xju.edu.cn/__local/4/78/50/6E07229927186CDCDDFD4A420E5_DB3C1F6F_42B9F4.pdf). Its indexed excerpt lists the 2020 article bibliographically. The PDF fetch timed out; the excerpt is not a copy of the paper.
- Exact-title, DOI and author/institution searches through both available web engines located no additional readable primary copy.

These are access findings. Absence of a mirror or of a title in an institutional index does not show that the journal wording is unchanged.

## Maple archive

The link labelled “the Maple files” on Zhao's primary homepage resolves to

`https://cam.tju.edu.cn/~zhao/soft/FLF_log.zip`.

Following that link with the web reader produced an unsupported `application/zip` response. One attempt was then made to retrieve the exact public URL through the permitted Pyroam network workflow, after reading the complete skill and creating a dedicated persistent workspace. The connector returned `CONNECTOR_ERROR: fetch failed` with `retryable: false`; it returned neither archive bytes nor an HTTP response status from the university server. The failed request was not repeated.

No archive member names, Maple code, stored computations or modification dates were read. The filename, link placement and inaccessible contents cannot establish whether the archive contains only theorem checks, conjectural experiments, a later correction or a counterexample. Exact archive-name searches did not locate a readable mirror.

## Claim boundary

The historical package disclosed both gaps, and this follow-up did not remove them. Its exact arXiv counterexample remains mathematically valid. The subsequently authenticated earlier public proof supersedes the former unresolved-priority status: the campaign's package is a rediscovery and contributes zero. This note preserves what was and was not retrieved; it does not treat failed access as evidence for novelty.

