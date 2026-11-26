# Dilcher–Kidwai–Tomkins’s Stern-polynomial conjecture

**Earlier public resolution.** Ranked. Rank 92 on the original main table, marker 🟢. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/README.md).

## Recorded scope

The source describes the result as follows.

> Proves that all zeros of all Stern polynomials lie strictly to the left of Re z = 1. Analytic estimates and an exact compact-region certificate cover all binary run lengths.

## Audit finding

Earlier exact resolution. Shunshun Ma’s Theorem 1 treats every positive Stern index and all complex z with Re z ≥ 1. It uses the same Stern recurrence, including the two constant initial polynomials as appropriate. The public October 25 deposit predates the repository proof. Ma supplies exterior estimates, a neighborhood of 1 and exact compact-region coverage. The computational packet and paper have separate SHA-256 hashes in the findings ledger.

[Earlier resolution](https://doi.org/10.5281/zenodo.23639859). [Correction on main](https://github.com/1337isnot1337/solved-conjectures/pull/891).

## Source outline

- [1. A uniform local criterion](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/PROOF.md#L24).
- [2. An explicit neighborhood of 1](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/PROOF.md#L66).
- [3. Exact certificate for the compact region](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/PROOF.md#L143).
- [Prior work and status](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/PROOF.md#L216).

## Provenance

- Path first added on the first-parent history on 2026-11-24T12:25:50Z. [Commit 91cba3995](https://github.com/1337isnot1337/solved-conjectures/commit/91cba3995eb1f05a288f65f08f05ecd08222e983).
- Latest change to this landing file at the snapshot on 2026-11-25T09:29:13Z. [Commit 483da5250](https://github.com/1337isnot1337/solved-conjectures/commit/483da525046ebf672a910f593ef78419073d8e81).
- Coordination and prior review. [#447](https://github.com/1337isnot1337/solved-conjectures/issues/447).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/PROOF.md) · [EXTERIOR.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/EXTERIOR.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/FORMALIZATION.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/stern-half-plane/LEAN_REVIEW.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2511.03847v1) (27 pages). conjecture 1 on PDF p. 3.
- [Source PDF](https://publi.math.unideb.hu/paper/2146/download/10_5486_PMD_2017_7620.pdf) (27 pages). conjecture 3.1 on PDF p. 7, 15, 25.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- PDF header (HTTP 200). [Retrieved address](https://doi.org/10.5486/PMD.2017.7620).
- Zeros of Stern polynomials in the complex plane (HTTP 200). [Retrieved address](https://arxiv.org/abs/2511.03847v1).
- PDF header (HTTP 200). [Retrieved address](https://publi.math.unideb.hu/paper/2146/download/10_5486_PMD_2017_7620.pdf).
- Citation-index seed records. [Zeros and irreducibility of Stern polynomials](https://doi.org/10.5486/pmd.2017.7620) · [Zeros of Stern polynomials in the complex plane](https://doi.org/10.48550/arxiv.2511.03847).
- External solution records sharing a cited identifier. [Problems/altizio-2025-geometric-sum-disk.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/altizio-2025-geometric-sum-disk.md).
- Crossref query “Dilcher–Kidwai–Tomkins’s Stern-polynomial conjecture stern half plane” returned 0 displayed records (HTTP 0).
- DataCite Zenodo search returned 2 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- results/stern-half-plane/check.cpp — exit 0. [Command and output](../evidence/replays/207.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
