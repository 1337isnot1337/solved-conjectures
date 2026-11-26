# Hartke–Stolee–West–Yancey matching-excess conjecture

**Screened.** Ranked. Rank 55 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/README.md).

## Recorded scope

The source describes the result as follows.

> Full Conjecture 9.15: the eventual perfect-matching excess and its all-count tail minimum diverge, with the recorded uniform square-root-log lower bound.

## Source outline

- [1. From a directed path sum to matching excess](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/PROOF.md#L11).
- [2. Mersenne division of a sparse binary integer](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/PROOF.md#L41).

## Provenance

- Path first added on the first-parent history on 2026-11-24T09:41:11Z. [Commit a84f0efd3](https://github.com/1337isnot1337/solved-conjectures/commit/a84f0efd3a7899a73c78019e48b3dfdf62e6a0d7).
- Latest change to this landing file at the snapshot on 2026-11-24T19:47:49Z. [Commit ea1b8bdb2](https://github.com/1337isnot1337/solved-conjectures/commit/ea1b8bdb276c1b244b918f1942496566f7c430f4).
- Coordination and prior review. [#387](https://github.com/1337isnot1337/solved-conjectures/issues/387) · [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/FORMALIZATION.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/LEAN_REVIEW.md) · [STATEMENT_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/hartke-stolee-west-yancey-matching-excess/STATEMENT_REVIEW.md)

## Literature checks

- [Source PDF](https://dwest.web.illinois.edu/pubs/perfmat.pdf) (22 pages). conjecture 9.15 on PDF p. 21.
- [Source PDF](https://arxiv.org/pdf/1105.1764) (25 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- PDF header (HTTP 200). [Retrieved address](https://dwest.web.illinois.edu/pubs/perfmat.pdf).
- Source URL (HTTP 403). [Retrieved address](https://doi.org/10.1002/jgt.21687).
- Generating p-extremal graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/1105.1764).
- Citation-index seed records. [Extremal Graphs With a Given Number of Perfect Matchings](https://doi.org/10.1002/jgt.21687) · [Generating p-extremal graphs](https://doi.org/10.48550/arxiv.1105.1764).
- Crossref query “Hartke–Stolee–West–Yancey matching-excess conjecture hartke stolee west yancey matching excess” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check matching excess via literal graph witnesses — exit 0. [Command and output](../evidence/replays/028.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
