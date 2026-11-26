# Csordas–Vishnyakova conjecture

**Correction.** Ranked. Rank 71 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/README.md).

## Recorded scope

The source describes the result as follows.

> Complete proposed disproof of Conjecture 3.6: the quartic polynomial p(z)=z⁴+z²+1 and entire function exp(−z⁴) satisfy every required generalized coefficient inequality, yet the function is not Laguerre–Pólya. The earlier genus-restricted theorem is unaffected.

## Audit finding

The landing page simultaneously reported no Lean verification and linked a complete Lean verification. The formalization states the full Conjecture 3.6 disproof for z⁴+z²+1 and exp(−z⁴). Corrected the landing page to agree with the formal statement and source-matched receipt.

## Source outline

- [Exact statement and result](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L5).
- [1. Every hypothesis is satisfied](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L33).
- [2. The complete coefficient calculation](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L45).
- [3. The function is not in the Laguerre–Pólya class](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L90).
- [4. Scope and the role of the growth assumption](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L125).
- [5. Statement and prior-art audit](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L140).
- [Review status](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md#L160).

## Provenance

- Path first added on the first-parent history on 2026-11-24T07:36:48Z. [Commit 584f430c4](https://github.com/1337isnot1337/solved-conjectures/commit/584f430c4a9138b7a0fee63cffd3949439ebcdf3).
- Latest change to this landing file at the snapshot on 2026-11-25T07:54:54Z. [Commit d8030320b](https://github.com/1337isnot1337/solved-conjectures/commit/d8030320b0b2898a4e820e4983a388ecc0359f29).
- Coordination and prior review. [#132](https://github.com/1337isnot1337/solved-conjectures/issues/132) · [#80](https://github.com/1337isnot1337/solved-conjectures/issues/80).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/csordas-vishnyakova/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://mathdept.byu.edu/cardon/papers/criterion_for_reality_arXiv.pdf) (6 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/0911.1122) (6 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- George Csordás, Anna Vishnyakova (2013-06-28). [The generalized Laguerre inequalities and functions in the Laguerre-Pólya class](https://doi.org/10.2478/s11533-013-0269-x).

- Source URL (HTTP 202). [Retrieved address](https://doi.org/10.2478/s11533-013-0269-x).
- Source URL (HTTP 202). [Retrieved address](https://www.degruyterbrill.com/document/doi/10.2478/s11533-013-0269-x/pdf).
- PDF header (HTTP 200). [Retrieved address](https://mathdept.byu.edu/cardon/papers/criterion_for_reality_arXiv.pdf).
- Citation-index seed records. [The generalized Laguerre inequalities and functions in the Laguerre-Pólya class](https://doi.org/10.2478/s11533-013-0269-x).
- Crossref query “Csordas–Vishnyakova conjecture csordas vishnyakova” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

Independently compiled Conjectures.CsordasVishnyakova from the frozen source, checked its printed axiom reports and ran stock leanchecker. [Exact commands, module scope, outputs and exit status](../evidence/lean-replays/receipts.json).



1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
