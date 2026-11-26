# Németh–Seberry–Shu conjecture

**Screened.** Ranked. Rank 2 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/README.md).

## Recorded scope

The source describes the result as follows.

> The number of distinct permanent values of prime-order binary circulants grows superlinearly, contrary to the 1979 conjecture. A refinement gives a quadratic lower bound.

## Audit finding

Checked the role of the uniformity assumption in Divoux–Wang, Proposition 3.1 and Remark 2.1. The proof first fixes finitely many amplitudes and then takes the prime order large, so no convergence rate is needed for the basic disproof. The translation action gives permanent congruent to the row sum modulo the prime: the fixed permutations are exactly allowed translations. An independent matching-count dynamic program confirmed the congruence for every binary circulant at orders 2, 3, 5 and 7. The quadratic strengthening has its own proof.

## Source outline

- [1. Binary circulants with a prescribed Fourier mode](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/PROOF.md#L5).
- [2. Separation within a row sum](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/PROOF.md#L19).
- [3. Separation across row sums](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/PROOF.md#L39).

## Provenance

- Path first added on the first-parent history on 2026-11-20T11:50:50-06:00. [Commit eecf732fd](https://github.com/1337isnot1337/solved-conjectures/commit/eecf732fda58692af53c748c915da1d31e3bac7d).
- Latest change to this landing file at the snapshot on 2026-11-25T09:11:13Z. [Commit 69a8cd0aa](https://github.com/1337isnot1337/solved-conjectures/commit/69a8cd0aaeb7de8eada373f9e24c19120e84df3c).
- Coordination and prior review. [#54](https://github.com/1337isnot1337/solved-conjectures/issues/54).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nemeth-seberry-shu/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf) (12 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2610.23755v1) (49 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Alexander Divoux, Shouda Wang (2026-10-16). [The maximum number of Hamiltonian cycles in tournaments](https://doi.org/10.48550/arxiv.2610.23755).

- Conjecture 27: Few permanents of prime circulants – Yair Lavi (HTTP 200). [Retrieved address](https://yair-lavi.com/mincs-list/conjecture-27/index.html).
- PDF header (HTTP 200). [Retrieved address](https://documents.uow.edu.au/~jennie/WEBPDF/071_1979.pdf).
- The maximum number of Hamiltonian cycles in tournaments (HTTP 200). [Retrieved address](https://arxiv.org/abs/2610.23755v1).
- Citation-index seed records. [The maximum number of Hamiltonian cycles in tournaments](https://doi.org/10.48550/arxiv.2610.23755).
- Crossref query “Németh–Seberry–Shu conjecture nemeth seberry shu” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

[Independent finite comparison](../evidence/check_proof_steps.py).

- Check finite prime-order circulant permanent examples — exit 0. [Command and output](../evidence/replays/079.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
