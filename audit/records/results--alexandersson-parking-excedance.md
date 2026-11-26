# Alexandersson’s parking-function excedance conjecture

**Screened.** Ranked. Rank 149 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/README.md).

## Recorded scope

The source describes the result as follows.

> Complete computer-assisted disproof of the original universal conjecture. At length 17, the strict excedance enumerator violates the Laguerre inequality at −1/5. Two exact counting recurrences agree on all coefficients. Ordinary descents and other parking statistics are separate.

## Audit finding

The exact n=17 obstruction uses the excedance enumerator and a violated Laguerre inequality at −1/5. The Omega parking-function match concerns a recurrence for peaks, ties and adjacent descents, with different statistics.

## Source outline

- [Counting the excedance polynomial](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/PROOF.md#L5).
- [An exact rational witness](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/PROOF.md#L24).
- [Attribution and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/PROOF.md#L54).

## Provenance

- Path first added on the first-parent history on 2026-11-24T08:22:50Z. [Commit af75f5c5f](https://github.com/1337isnot1337/solved-conjectures/commit/af75f5c5f76593313d9a2af62780c1dd2f035646).
- Latest change to this landing file at the snapshot on 2026-11-25T12:05:12+01:00. [Commit 1f60e6f9d](https://github.com/1337isnot1337/solved-conjectures/commit/1f60e6f9d772683cf57e82b1bd41c015b6fe0219).
- Coordination and prior review. [#106](https://github.com/1337isnot1337/solved-conjectures/issues/106).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-parking-excedance/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2605.19979) (16 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2609.05131) (19 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Colin Defant (2026-05-19). [Short Proofs in Algebraic and Enumerative Combinatorics](https://doi.org/10.48550/arxiv.2605.19979).
- Per Alexandersson (2026-09-04). [Real-rootedness and interlacing for parking functions and Chow polynomials](https://doi.org/10.48550/arxiv.2609.05131).

- Real-rooted polynomials: open problems \| SymCat (HTTP 200). [Retrieved address](https://www.symmetricfunctions.com/realRootedOpenProblems.htm).
- Short Proofs in Algebraic and Enumerative Combinatorics (HTTP 200). [Retrieved address](https://arxiv.org/abs/2605.19979).
- Real-rootedness and interlacing for parking functions and Chow polynomials (HTTP 200). [Retrieved address](https://arxiv.org/abs/2609.05131).
- Citation-index seed records. [Short Proofs in Algebraic and Enumerative Combinatorics](https://doi.org/10.48550/arxiv.2605.19979) · [Real-rootedness and interlacing for parking functions and Chow polynomials](https://doi.org/10.48550/arxiv.2609.05131).
- External solution records sharing a cited identifier. [Problems/alexandersson-2026-parking-descent-refinement.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/alexandersson-2026-parking-descent-refinement.md).
- Crossref query “Alexandersson’s parking-function excedance conjecture alexandersson parking excedance” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Replay the exact parking-function excedance counterexample — exit 0. [Command and output](../evidence/replays/038.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
