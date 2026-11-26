# Rowland–Sistos Barrón conjecture

**Earlier public resolution.** Ranked. Rank 92 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/README.md).

## Recorded scope

The source describes the result as follows.

> Complete exact rank formula for every integer M≥49 for a single integer constant-recursive sequence of rank six. Square-dependent cancellations force failure of eventual quasipolynomiality. Refutes the particular-rank clause of Conjecture 5.3 under the standard quasipolynomial interpretation of the undefined source term pseudo-polynomial; the general-rank clause is separate.

## Audit finding

Earlier exact disproof of the particular-rank clause of Conjecture 5.3. Both sources interpret pseudo-polynomial as eventual quasipolynomial. MathDB 366795 gives a rank-eight integer recurrence with a square-indicator term in its exact rank formula. The audit independently expanded its Mth powers for M=5 through 30. This repository’s later rank-six family is a distinct quantitative supplement. The separate Omega rank-three result concerns fixed-rank finiteness.

[Earlier resolution](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-366795/mathdb-366795-solution.tex). [Correction on main](https://github.com/1337isnot1337/solved-conjectures/pull/891).

## Source outline

- [Status and precise scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L3).
- [Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L25).
- [1. Rank of an exponential polynomial](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L51).
- [2. Exact coefficient expansion](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L82).
- [3. The initial degree sum](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L151).
- [4. All coefficient cancellations](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L177).
- [Residue zero and the upper tail](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L179).
- [Residue one](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L188).
- [Residue two](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L206).
- [5. Failure of eventual quasipolynomiality](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L244).
- [Verification and limits](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L266).
- [Sources and prior-work distinction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md#L284).

## Provenance

- Path first added on the first-parent history on 2026-11-24T07:36:48Z. [Commit 584f430c4](https://github.com/1337isnot1337/solved-conjectures/commit/584f430c4a9138b7a0fee63cffd3949439ebcdf3).
- Latest change to this landing file at the snapshot on 2026-11-24T17:25:50Z. [Commit 6e3e7c8d3](https://github.com/1337isnot1337/solved-conjectures/commit/6e3e7c8d36949098235f493604b7492ca4d9c154).
- Coordination and prior review. [#115](https://github.com/1337isnot1337/solved-conjectures/issues/115).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/PROOF.md) · [INDEPENDENT-AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/INDEPENDENT-AUDIT.md) · [LEAN_STATUS.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/LEAN_STATUS.md) · [NOVELTY.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/rowland-sistos-barron/NOVELTY.md)

## Literature checks

- Complexity of powers of a constant-recursive sequence (HTTP 200). [Retrieved address](https://arxiv.org/abs/2501.14643v1).
- Complexity of powers of a constant-recursive sequence (HTTP 200). [Retrieved address](https://arxiv.org/abs/2501.14643).
- PDF header (HTTP 200). [Retrieved address](https://ericrowland.github.io/papers/Complexity_of_powers_of_a_constant-recursive_sequence.pdf).
- Citation-index seed records. [Complexity of powers of a constant-recursive sequence](https://doi.org/10.48550/arxiv.2501.14643).
- External solution records sharing a cited identifier. [Problems/rowland-sistos-barron-2025-rank-sequences.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/rowland-sistos-barron-2025-rank-sequences.md) · [mathdb-366795/mathdb-366795-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-366795/mathdb-366795-solution.tex).
- Crossref query “Rowland–Sistos Barrón conjecture rowland sistos barron” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check Cardon cubic and Rowland rank-sequence certificates — exit 0. [Command and output](../evidence/replays/119.txt).
- results/rowland-sistos-barron/verify_expansion.py — exit 0. [Command and output](../evidence/replays/206.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
