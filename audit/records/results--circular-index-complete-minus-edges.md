# Circular chromatic index of complete graphs minus a few edges

**Screened.** Ranked. Rank 149 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/README.md).

## Recorded scope

The source describes the result as follows.

> Mazák–Zrubák, arXiv Conjecture 2, second proof: `χ'_c(K_n-e) = n` for odd `n>=7`, via cyclic orders of the edges in which every `(n-1)/2` consecutive edges are disjoint. Exact values for `K_n` minus 2 or 3 edges for small `n`, including `χ'_c(K_11-2K_2) = 32/3`. Explicit colourings below `n` for `K_n-tK_2` at `n = 15, 19, 23, 27, 47` give `χ'_c` in `(Δ+1/2, Δ+1)` for `Δ = 14, 18, 22, 26, 46`. Two independent model referee passes; the colourings for `n>=19` and the symmetry and structure lemmas added afterwards are unrefereed.

## Audit finding

The two packages share the exact single-edge theorem: in the second notation n=d+1. The catalogue identifies the second proof explicitly. The few-edge package also determines exact indices for deletion patterns and gives a counterexample on eleven vertices. The two result directories must not be interpreted as two independent resolutions of Mazák–Zrubák Conjecture 2.

## Source outline

- [0. Preliminaries](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L14).
- [Part A. $`chi'_c(K_n-e)=n`$ for odd $`nge7`$ (Mazák–Zrubák Conjecture 2)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L28).
- [Part B. Perfect sequencings of $`K_n-F`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L75).
- [Part C. Exact values, and the refutation of Conjecture H](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L92).
- [Part E. Colourings below $`n`$ for $`K_n-tK_2`$ with $`2tlt m`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L144).
- [Part D. Conjectures (not proved)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L208).
- [Verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L244).
- [Referee pass](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L258).
- [Second referee pass](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L277).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md#L290).

## Provenance

- Path first added on the first-parent history on 2026-11-21T23:18:31-06:00. [Commit e24cae081](https://github.com/1337isnot1337/solved-conjectures/commit/e24cae081c0788dce49553cbb5439c49144ebd8c).
- Latest change to this landing file at the snapshot on 2026-11-26T01:20:56-06:00. [Commit 7d6d7e7b4](https://github.com/1337isnot1337/solved-conjectures/commit/7d6d7e7b47b5837995bae07409d567fbae0f6dd4).
- Coordination and prior review. [#147](https://github.com/1337isnot1337/solved-conjectures/issues/147) · [#152](https://github.com/1337isnot1337/solved-conjectures/issues/152).

The original record contains 35 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/FORMALIZATION.md) · [REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/review/REVIEW.md) · [REVIEW2.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-complete-minus-edges/review/REVIEW2.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2603.08822) (15 pages). conjecture 2 on PDF p. 7 · problem 2 on PDF p. 12.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Ján Mazák, Filip Zrubák (2026-03-09). [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).

- aadrianvv · GitHub (HTTP 200). [Retrieved address](https://github.com/aadrianvv).
- Circular chromatic index of small graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2603.08822).
- Citation-index seed records. [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).
- Crossref query “Circular chromatic index of complete graphs minus a few edges” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the colourings and perfect-sequencing searches for complete graphs minus a few edges — exit 0. [Command and output](../evidence/replays/117.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
