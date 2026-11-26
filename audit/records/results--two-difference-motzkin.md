# Two-difference Motzkin density

**Screened.** Ranked. Rank 37 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/README.md).

## Recorded scope

The source describes the result as follows.

> The exact character formula for every pair in every compact abelian group, including noncyclic finite subgroups. Lean verifies the exhaustive relation-basis classification, compact and cyclic formulas, exact evaluator with explicit complexity bounds, and literal attaining witnesses. The cyclic maximum-independent-set problem has a prior 2026 solution.

## Source outline

- [The lower bound](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L17).
- [The upper bound for finite groups](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L21).
- [Passing to a compact abelian group](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L59).
- [Computing the value from the relations](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L69).
- [Evaluation without enumerating the finite quotient](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L77).
- [Two consequences](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L101).
- [Checks and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md#L115).

## Provenance

- Path first added on the first-parent history on 2026-11-18T18:47:28-06:00. [Commit 56b5895f5](https://github.com/1337isnot1337/solved-conjectures/commit/56b5895f522ed30bd92b8e629a9326db672f73fc).
- Latest change to this landing file at the snapshot on 2026-11-19T05:41:41-06:00. [Commit 699f0fe3a](https://github.com/1337isnot1337/solved-conjectures/commit/699f0fe3a62435e639dd98bd114d99778f13f68e).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/two-difference-motzkin/PROOF.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2408.09301) (21 pages). problem 1.1 on PDF p. 1, 2, 4, 5, 6.
- [Source PDF](https://arxiv.org/pdf/1611.03940) (18 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- On sets with missing differences in compact abelian groups (HTTP 200). [Retrieved address](https://arxiv.org/abs/2408.09301).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1134/S0081543821040039).
- Redirecting (HTTP 200). [Retrieved address](https://doi.org/10.1016/j.dam.2026.02.005).
- Citation-index seed records. [On Motzkin’s Problem in the Circle Group](https://doi.org/10.1134/s0081543821040039) · [The Maximum Independent Set problem on circulant graphs C n (a, b)](https://doi.org/10.1016/j.dam.2026.02.005).
- Crossref query “Two-difference Motzkin density two difference motzkin” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the two-difference Motzkin formula — exit 0. [Command and output](../evidence/replays/095.txt).

7 of 7 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
