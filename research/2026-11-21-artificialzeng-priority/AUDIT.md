# ArtificialZeng archive priority audit

Date: 21 November 2026. Status: source-discovery audit, not a new mathematical result.

## Finding and scope

This audit found no additional prior resolution of the fourteen campaign targets in the pinned ArtificialZeng archive. It searched every regular UTF-8 file, converted every PDF to text, inspected the non-UTF-8 plain-text exception, and inspected bounded headers of compressed certificates. The substantive matches concern a diameter-at-most-three Brown–Mol theorem and two different Vishnyakova questions. Their exact scopes are recorded below.

This finding is limited to the specified snapshot and searches. It is not a proof that no prior result exists elsewhere. In particular, the Fang–Zhang–Zhao and Sun–Zhao campaign claims have already been excluded because complete earlier resolutions were found in PrincipiaMathOrg: the [Fang–Zhang–Zhao disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/c18609e47b635722206b9a2e9dcd402d0edcfb0a/mathdb/368345/solution.tex) and the [Sun–Zhao disproof](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-332483/mathdb-332483-solution.tex). An absence of matching results in this second archive does not restore either claim.

The search did not execute archive programs, check their certificates, run Lean, or assess every archived theorem for correctness. It searched manuscript and source text for priority leads, then read the mathematical statements behind substantive matches.

## Pinned source

Repository: [ArtificialZeng/AI-Has-Taste](https://github.com/ArtificialZeng/AI-Has-Taste/tree/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2).

Commit: `65eb1f5a92a3a8b80c9e92187825ac9231f86fb2`. The [Git commit metadata](https://api.github.com/repos/ArtificialZeng/AI-Has-Taste/git/commits/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2) records both author and committer times as `2026-11-18T17:37:58Z`. The archive manifest has an internal preparation date of 19 November; that internal date is not substituted for Git chronology.

The downloaded tar archive contains 525,134,571 bytes. Its SHA-256 is:

```text
a716daee14392fb8e614f46b1368dd3b2b05521da44946bcf1f0aabd264478c4
```

The [archive manifest](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/archive-manifest.json) lists 460 papers. The audit uses the complete tar contents, rather than treating the manifest or filename inventory as the full source search.

## Coverage and limits

| Material | Coverage | Limit |
|---|---:|---|
| Regular UTF-8 files | 14,105 complete file bodies searched; 125 files matched at least one initial target pattern | Pattern search is not a semantic reading of all 14,105 files. |
| PDF files | All 472 processed successfully with `pdftotext -layout`; four files matched | 470 outputs contain non-whitespace text. Two are textless figure PDFs, identified below. No claim of OCR or complete mathematical-glyph recovery is made. |
| Gzip files | All 50 headers inspected, with a 1,048,576-byte decompressed cap per file | 21 files fit within the cap; 29 were truncated. Large certificate bodies were not fully searched. |
| Non-UTF-8 plain text | One file decoded and read using a legacy encoding | It describes a Laman-graph data set, unrelated to the fourteen targets. |
| Other binary files | Inventoried; source-text searches include their associated packages | 51 PNG, 31 `.u64le`, five `.npz`, one `.npy`, and one binary `.drat` file were not interpreted or OCRed. |

The initial UTF-8 pass rejected 612 regular files as non-UTF-8. The PDF, gzip, and legacy-text passes cover 523 of those files; the 89 remaining binary files are listed by path in `coverage.json`. The supplemental pass reported no conversion or decompression errors.

The gzip count “48 UTF-8 decodable, two undecodable” describes decoding only. It does not imply that all 48 files are prose: six of the 50 files have `.bin.gz` suffixes, and four of those binary headers happen to be UTF-8 decodable. All compressed members are associated with certificate or data packages. None is a compressed `.tex`, `.md`, or `.html` manuscript. Their headers, package titles, cap status, and format classifications are recorded in `coverage.json`. The 26 associated packages concern, for example, finite graph certificates, linear programs, finite-field data, and bounded subsum calculations; none has the exact scope of a campaign target.

Two PDFs extract only a form-feed:

- `reproducible_source_code/ClaudeCode/CC-P02/source/manuscript/fig_patches.pdf`;
- `reproducible_source_code/ClaudeCode/CC-P02/source/manuscript/fig_tour40.pdf`.

Their [parent manuscript](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/ClaudeCode/CC-P02/source/manuscript/main.tex) is *Closed knight's tours with 7.5 n + O(1) crossings*. Its captions identify the figures as a forty-by-forty knight tour and its corner/wall patches. The manuscript source and its text-bearing final PDF were included in the search. The two figure files are not claimed to have been visually read. Several other short PDF outputs are labeled diagrams in the adjacent knight-tour packages; their associated source manuscripts were also searched.

The non-UTF-8 plain-text exception is `BigWIN2/BW2-B06-P04/source/experiments/upstream/Description.txt`, beneath `reproducible_source_code`. It describes Capco, Gallet, Grasegger, Koutschan, Lubbes, and Schicho's data on realizations of Laman graphs, DOI `10.5281/zenodo.1245517`. It contains no campaign target.

## Exact target list and dispositions

`targets.json` contains the source identifiers, spelling variants, and mathematical phrases used in the initial pass. The list includes McCrea and López Pouso–Segura; it does not substitute unrelated results by other workers.

The counts below are numbers of matching files, not numbers of claims. Multiple targets can match one file, and metadata/manuscript duplicates can count separately. The initial pass searches arbitrary substrings, so numeric problem identifiers also occur accidentally inside long integers. Those hits were inspected and separated from source references.

| Target | UTF-8 files | PDFs | Disposition |
|---|---:|---:|---|
| Fang–Zhang–Zhao, infinite log-convexity | 8 | 0 | Only the digits `368345` inside numerical certificates; no matching source or resolution. Already excluded on independent PrincipiaMath evidence. |
| McCrea, single crossover | 0 | 0 | No match to the source ID, author, or crossover phrases. |
| López Pouso–Segura, Bessel weights | 0 | 0 | No match to the source ID, DOI suffix, author, or title phrase. |
| Vishnyakova, outer root radius | 69 | 2 | Two substantive but different statements; see the exact comparison below. |
| Gröchenig, zero density | 1 | 0 | A stochastic-order citation discussing zero-density cross products; unrelated to Gaussian shift zero sets. |
| Han–Sabag–Kostina–Hassibi, Lyapunov positivity | 0 | 0 | No match; the supplemental author-name pass also found none. |
| Sun–Zhao, iterated ratios | 5 | 1 | UTF-8 hits are the digits `332483` in certificates. The PDF uses “iterated ratios” for renewal-network limits. Already excluded on independent PrincipiaMath evidence. |
| Lyon, gamma median | 2 | 0 | Only the DOI-digit strings `0251626` and `0288601` inside long certificate integers. |
| Ferreira–Simon, beta-prime Conjecture 1 | 0 | 0 | No matching source, author, or convolution phrase. |
| Chen–Khare–Sahi, Macdonald Conjecture 5 | 9 | 0 | Only the digits `370539` inside certificate data/hashes. No matching Macdonald semiring statement. |
| Dospolova–Germanskov–Zaporozhets | 6 | 0 | Only the digits `369313` inside large certificate integers. |
| Roos–Seiringer, radial Dirichlet kernel | 0 | 0 | No matching source, title, or author. |
| Kovalev, Hardy norms of matrices | 0 | 0 | No matching source ID, author, or matrix-norm title. |
| Brown–Mol, translated subtree annulus | 58 | 1 | A complete diameter-at-most-three theorem, explicitly leaving the arbitrary-tree claim open. |

An additional pass searched manuscript-like UTF-8 files for the individual names Khare, Sahi, Lyon, Beurling, Seiringer, Sabag, Kostina, Hassibi, and the spelling stem `chenig`. It found no matches. The PDF/header pass also included these author aliases where applicable. This reduces dependence on source-ID formatting, but does not make the search exhaustive over all possible equivalent formulations.

## Substantive comparisons

### Brown–Mol

Prior package: [BW2-PR20260913-subtree_annulus](https://github.com/ArtificialZeng/AI-Has-Taste/tree/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260913-subtree_annulus), *The shifted subtree-root annulus for trees of diameter at most three*.

The package claim, main manuscript, independent mathematical audit, problem statement, and scope metadata were read. Its theorem handles stars and arbitrary double stars, including the necessary boundary cases. It explicitly leaves trees of diameter at least four outside its proved scope. The campaign's proposed counterexample trees have diameter four, so they are not among the trees covered by this prior theorem. This distinction is also stated in the prior package's README; the conclusion here rests on the manuscript theorem, not merely that README label.

The original source and later restatement remain separate from this archive comparison: Brown–Mol, arXiv `1810.08655`, Conjecture 4.2, and Jin–Ma–Wang, arXiv `2608.07898v2`, Conjecture 5.1. The campaign package contains the independent exact-source audit and the full counterfamily argument. This document addresses the newly discovered ArtificialZeng prior lead only.

### Vishnyakova: multiplication closure

Prior package: [BW2-B45-P02](https://github.com/ArtificialZeng/AI-Has-Taste/tree/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-B45-P02), *Multiplication Closure with a Linear Factor for Normalized Pochhammer Transforms*.

The complete main manuscript was read. It treats Vishnyakova's multiplication-closure Open Problem 1.9 for normalized Pochhammer transforms, for every positive normalization parameter when one factor has transformed degree one. Both input transforms have zeros in the interval from minus one to zero. The proof analyzes a first-order differential operator and its partial fractions. It explicitly leaves the case where both factors have degree at least two untreated.

This is neither the arbitrary-polynomial outer-radius statement nor its weighted analogue addressed in the campaign. It contains no theorem bounding every transformed zero by the campaign's disk. The shared author, transform family, and source paper explain the match; they do not identify the two conjectures.

### Vishnyakova: shifted even powers

Prior package: [BW2-PR20260914-vishnyakova_shifts](https://github.com/ArtificialZeng/AI-Has-Taste/tree/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/reproducible_source_code/BigWIN2/BW2-PR20260914-vishnyakova_shifts), *Interval shape and endpoint collisions for totally positive shifted even powers*.

The frozen claim and the main theorem, introductory scope, and concluding scope of the manuscript were read. The entire source file was searched for the target terms. This is not a claim to have checked every line of its proof.

It addresses Conjecture 5.8 for the set of real shifts for which the even-power sequence is totally positive. It proves that this set is an interval with specified endpoint bounds and collision behavior. Its abstract and theorem explicitly leave successive nesting of those intervals unresolved. It does not resolve the distinct outer-radius question for arbitrary input polynomials.

### Two unrelated phrase matches

The PDF [BM2-B14-P02](https://github.com/ArtificialZeng/AI-Has-Taste/blob/65eb1f5a92a3a8b80c9e92187825ac9231f86fb2/pdfs/BigMac2/BM2-B14-P02_Fixed_Sticky_Refreshing_Preserves_the_Exponent_Two_Degree_Laws_in_Range_Renewal_Networks.pdf) studies degree laws in renewal networks. Its “iterated ratios” are successive limits in a graph model. It neither defines nor discusses the Catalan–Larcombe–French iterated-ratio conjecture.

The Gröchenig phrase hit is a citation note in `BW2-PR20260914-hypercomb_unimodality` referring to Dümbgen–Mösching on stochastic orders and total positivity. Its zero-density cross products concern likelihood-ratio ordering. It is not a result about upper or lower Beurling densities of real zeros of Gaussian shift series.

## Reproduction

The scripts are discovery tools. The source-scope comparisons above require reading the cited statements.

Use Python 3.11 or later and an installed Poppler `pdftotext`. From this directory:

```sh
python3 scan_archive.py artificialzeng ArtificialZeng/AI-Has-Taste 65eb1f5a92a3a8b80c9e92187825ac9231f86fb2
python3 audit_artificial_supplement.py
python3 scan_expanded_names.py
```

The first command downloads the pinned public tarball if absent, computes its hash, searches complete regular UTF-8 bodies without a size cutoff, and preserves matching files locally. Check the reported hash against the one above before relying on the outputs. The second converts PDFs, records textual output lengths and hashes, searches gzip headers with the explicit cap, and processes the legacy-text exception. The third repeats the independent author-name search. None executes source programs from the archive.

`coverage.json` preserves the compact audit record: target counts, all PDF text hashes, all compressed-header coverage states, the 89 unprocessed binary paths, the two textless PDF exceptions, and package-level descriptions for compressed data. Full extracted manuscripts, PDF texts, downloaded binaries, and large certificate payloads are not copied into this repository.
