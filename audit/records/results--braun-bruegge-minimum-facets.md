# Braun–Bruegge’s minimum facet conjecture

**Screened.** Ranked. Rank 120 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/README.md).

## Recorded scope

The source describes the result as follows.

> Proves both global minimum clauses and a stronger sharp bound at fixed maximum matching size, with unique complete-bipartite minimizers.

## Audit finding

The Omega same-source theorem treats the common-parity binomial facet sum in Conjecture 5.1. The global bicyclic maximum and theta optimizers also require mixed parities. The separate minimum-facet claim fixes a matching parameter. The common-parity identity alone is insufficient for either recorded endpoint.

## Source outline

- [1. The polar and its matching faces](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/PROOF.md#L13).
- [2. A maximum matching with two or more uncovered vertices](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/PROOF.md#L26).
- [3. A maximum matching with zero or one uncovered vertex](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/PROOF.md#L55).
- [4. Sharpness and uniqueness](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/PROOF.md#L69).

## Provenance

- Path first added on the first-parent history on 2026-11-24T14:27:11Z. [Commit 716b4bac8](https://github.com/1337isnot1337/solved-conjectures/commit/716b4bac8ad32e3a03e0238e1600d9b90587b1dd).
- Latest change to this landing file at the snapshot on 2026-11-24T20:39:10-06:00. [Commit 4090cb2e4](https://github.com/1337isnot1337/solved-conjectures/commit/4090cb2e4c5eb8bc5a6e9a4c92c51653bff8defe).
- Coordination and prior review. [#484](https://github.com/1337isnot1337/solved-conjectures/issues/484).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/PROOF.md) · [FIXED-MATCHING.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/FIXED-MATCHING.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-minimum-facets/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf) (29 pages). conjecture 2 on PDF p. 2, 3, 25.
- [Source PDF](https://publications.mfo.de/bitstream/handle/mfo/4147/OWR_2023_58.pdf?isAllowed=y&sequence=6) (70 pages). conjecture 2 on PDF p. 8, 55 · problem 2 on PDF p. 57.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- PDF header (HTTP 200). [Retrieved address](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf).
- PDF header (HTTP 200). [Retrieved address](https://publications.mfo.de/bitstream/handle/mfo/4147/OWR_2023_58.pdf?isAllowed=y&sequence=6).
- Number of facets of symmetric edge polytopes arising from join graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2312.11287v3).
- External solution records sharing a cited identifier. [Problems/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1.md).
- Crossref query “Braun–Bruegge’s minimum facet conjecture braun bruegge minimum facets” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Additional results/braun-bruegge-minimum-facets/check.py — exit 0. [Command and output](../evidence/replays/122.txt).
- results/braun-bruegge-minimum-facets/check_exhaustive.cpp — exit 0. [Command and output](../evidence/replays/208.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
