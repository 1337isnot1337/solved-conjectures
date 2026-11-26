# Braun–Bruegge’s bicyclic facet conjectures

**Screened.** Ranked. Rank 120 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/README.md).

## Recorded scope

The source describes the result as follows.

> Proves the sharp global bicyclic facet maximum and the exact theta-graph optimizers, including the previously open mixed-parity cases.

## Audit finding

The Omega same-source theorem treats the common-parity binomial facet sum in Conjecture 5.1. The global bicyclic maximum and theta optimizers also require mixed parities. The separate minimum-facet claim fixes a matching parameter. The common-parity identity alone is insufficient for either recorded endpoint.

## Source outline

- [Normalized path counts](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md#L7).
- [The wedge benchmark](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md#L36).
- [Large total length](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md#L52).
- [Finite base and the full extremal conjecture](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md#L75).
- [Priority and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md#L81).

## Provenance

- Path first added on the first-parent history on 2026-11-24T14:12:23Z. [Commit 9415898e8](https://github.com/1337isnot1337/solved-conjectures/commit/9415898e8c7dfa9681946b8a94a83ba678de3b00).
- Latest change to this landing file at the snapshot on 2026-11-25T23:59:21-06:00. [Commit 7aa1993e5](https://github.com/1337isnot1337/solved-conjectures/commit/7aa1993e5d396f7902d2423871329a53b7b3b622).
- Coordination and prior review. [#481](https://github.com/1337isnot1337/solved-conjectures/issues/481).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/FORMALIZATION.md) · [THETA-MAXIMIZER.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/braun-bruegge-bicyclic-facets/THETA-MAXIMIZER.md)

## Literature checks

- PDF header (HTTP 200). [Retrieved address](https://cs.uwaterloo.ca/journals/JIS/VOL26/Braun/braun6.pdf).
- Braun–Bruegge Conjecture 5.1 \| trureturing (HTTP 200). [Retrieved address](https://www.trureturing.org/research/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1/).
- Facets of Symmetric Edge Polytopes for Graphs with Few Edges (HTTP 200). [Retrieved address](https://arxiv.org/abs/2201.13303v4).
- Citation-index seed records. [Facets of Symmetric Edge Polytopes for Graphs with Few Edges](https://doi.org/10.48550/arxiv.2201.13303).
- External solution records sharing a cited identifier. [Problems/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/braun-bruegge-2022-symmetric-edge-polytope-facet-sum-conjecture-5-1.md).
- Crossref query “Braun–Bruegge’s bicyclic facet conjectures braun bruegge bicyclic facets” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Additional results/braun-bruegge-bicyclic-facets/check.py — exit 0. [Command and output](../evidence/replays/121.txt).
- results/braun-bruegge-bicyclic-facets/check_maximizer.py — exit 0. [Command and output](../evidence/replays/200.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
