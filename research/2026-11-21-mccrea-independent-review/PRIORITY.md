# McCrea's conjecture: independent priority review

Audit date: November 21, 2026. Target: [issue 168](https://github.com/1337isnot1337/solved-conjectures/issues/168), with mathematical review recorded separately in `AUDIT.md`. This review adds global issue and public-corpus checks to the result package's existing source search.

## Conclusion

No earlier proof or refutation of McCrea's linear-density single-crossover Conjecture 9.2 was found. The exact source statement and its discussion were independently read. The earlier fixed-number Franklin inequality is already proved and remains excluded from this result's scope. The conclusion is bounded by the searches below; global GitHub code search and Cuthbertson's full text were unavailable.

## Exact source and chronology

Marcus McCrea, *Fixed-Perimeter Franklin Statistics and an Eventual Inequality*, [arXiv:2609.12005v2](https://arxiv.org/abs/2609.12005v2). The [accessible full primary PDF](https://arxiv.cnoctave.top/pdf/2609.12005) has a November 5, 2026 version stamp. Its definitions on printed page 2, coefficient formulas in Section 3, and complete Section 9 were inspected.

Conjecture 9.2, printed page 12, asks for every integer $`k\geq3`$ a unique $`c_k`$ between

```math
a_k=2^{-k-1},\qquad b_k=\frac1{4k},
```

such that the eventual comparison of $`\mathrm{FD}_{\lfloor xn\rfloor,k}(n)`$ and $`\mathrm{FO}_{\lfloor xn\rfloor,k}(n)`$ changes from the first being larger to the second being larger as the fixed density $`x`$ crosses $`c_k`$. The source excludes the transition point and densities outside the two means. The threshold may depend on $`k,x`$. These are the quantifiers proved in the repository package.

The following paragraph says that the earlier fixed-number theorem does not provide an estimate in this regime. Printed page 13 discusses a large-deviation route to existence but explicitly leaves uniqueness unproved. The source therefore does not already contain the full crossover proof. Its occasional preceding cross-reference to a theorem number does not supersede the actual Conjecture 9.2 heading and explicit open-problem discussion.

The earlier result fixes the marked count $`j`$ as $`n`$ grows. McCrea credits Cuthbertson's independent proof of that result in the introduction, then poses the different linear-density statement later in the November version. A source index that attaches the September original-submission date to version 2 is not evidence that the November conjecture had already been proved.

## Successful global issue searches

The following GitHub issue queries were run globally, with no repository restriction. Full bodies were inspected for relevant mathematical matches; unrelated surnames, software, genetics, and paper-digest text were filtered by their actual subject.

| Query | Returned coverage | Relevant outcome |
|---|---:|---|
| `"2609.12005" is:issue` | 1 result | This repository's issue 168 only |
| `"McCrea" "crossover" is:issue` | 2 results | Issues 168 and 156 from this campaign |
| `"McCrea" "conjecture" is:issue` | 7 results | This campaign and unrelated historical/expository material |
| `"fixed-perimeter" "Franklin" is:issue` | 2 results | Issue 168 and a September paper digest of Cuthbertson |
| `"Franklin" "crossover" is:issue` | 49 results | Only issue 168 concerns this mathematical comparison |
| `"Franklin" "linear-density" is:issue` | 11 results | Only issue 168 concerns this mathematical comparison |
| `"perimeter" "transition density" is:issue` | 28 results | Only issue 168 concerns this mathematical comparison |

The September [paper-digest issue](https://github.com/bguanmath/ArXiv_MathNT/issues/395) reproduces the abstract of Cuthbertson's fixed-number/parity paper; it supplies no crossover theorem. A broad unqualified single-crossover query was also attempted, but its first page was dominated by unrelated subjects. It is not treated as exhaustive coverage of that phrase. All comments on this repository's issue 168 were read; they concern the current proof and its independent review.

Unlike the Fang–Zhang–Zhao Sturm audit, these searches produced no earlier public proof dossier for the same theorem.

## Public corpus coverage

The complete available [Principia archive manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/MANIFEST.json) was searched for McCrea, Franklin, perimeter, crossover, and tipping-point titles. Its only perimeter match concerns a reciprocal-supernorm statistic, a different target. KnowledgeSense's current preprint-directory names produced no corresponding match.

The README indexes of [Principia](https://github.com/PrincipiaMathOrg/math-solutions), [pudim](https://github.com/pudim-project/pudim-ai-demo-zetalaw), and [CoPEER](https://github.com/qqliu/CoPEER) were searched for the same terms, with no target match. These are manifest, directory, and index checks, not claims to have read every full manuscript in those repositories. Public web queries restricted to GitHub and Hexagon also found no crossover proof.

## Web and later-paper checks

Both search engines were used, including current-status searches restricted to the last 30 days. Queries covered the exact title, arXiv identifier, conjecture number, author and crossover, linear-density single-crossover, Franklin transition density, and proof/refutation terms. The relevant results were the original conjecture and the older fixed-number papers; no later crossover settlement was located.

The primary arXiv abstract for Philip Cuthbertson, *A perimeter analogue of Franklin's identity and an inequality related to the parity of parts*, [arXiv:2609.17389](https://arxiv.org/abs/2609.17389), describes fixed-perimeter Franklin and parity inequalities. Direct arXiv PDF, HTML, and mirror requests failed. The November McCrea paper's own introduction provides stronger scope evidence than abstract omission: it explicitly credits that earlier proof of the fixed-number conjecture before separately posing Conjecture 9.2. Nevertheless, this audit does not represent Cuthbertson's entire body as inspected.

The original Gray–Payne–Swisher–Watson problem and its different residue-class tipping-point conjecture remain separate, as explained in the result package's `NOVELTY.md`. No claim is made here to re-solve either prior result.

## Limits

Global GitHub code search was already returning HTTP 429 during the adjacent audit. No further retries were made because they were resetting a shared quota. This is an unavailable search channel, not a negative result. Public search engines can miss unindexed pages, and the Cuthbertson full-text limitation remains explicit.

The independent mathematics review and this priority review therefore support retaining the McCrea package as a complete, internally checked proposed resolution with no detected prior resolution, subject to those stated access limits. The classical saddle-point/Fourier methods used in the proof are credited tools; the claim concerns their complete application to the stated crossover conjecture. No Lean work was performed.
