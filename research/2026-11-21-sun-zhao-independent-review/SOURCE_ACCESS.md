# Sun–Zhao: focused source-access review

Date: 21 November 2026. Related issue: [198](https://github.com/1337isnot1337/solved-conjectures/issues/198).

**Outcome:** neither the complete journal text nor the author's Maple archive was obtained. This review supplies no evidence that changes the scope or prior-resolution status of Conjecture 5.2. The result must continue to identify its verified target as the explicit latest arXiv statement; publication-stage equivalence and archive contents remain unchecked.

The package's source audit is named [NOVELTY.md](../../results/sun-zhao-iterated-ratios/NOVELTY.md), not SOURCES.md. That full audit and the issue history were read before this focused follow-up. Mathematical verification and the broader priority review are separate work.

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

The existing package already discloses both gaps; this follow-up does not remove those caveats. Its exact arXiv counterexample is assessed by the mathematical reviews. This source-access note neither independently certifies novelty nor supplies evidence against it, and makes no change to shared indexes or result counts.
