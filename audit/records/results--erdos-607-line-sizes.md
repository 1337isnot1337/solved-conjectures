# Erdős Problem 607: line-size sets

**Correction.** Ranked. Rank 4 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/README.md).

## Recorded scope

The source describes the result as follows.

> Sharp counting asymptotic for records of actual finite real-plane configurations, with the exact leading prefactor. Lean verifies the geometric count, formal and analytic generating functions, Fourier extraction, all limit and domination inputs, and the final stated asymptotic.

## Audit finding

Credit correction. Erdős asked for an exponential-in-square-root upper bound. Szemerédi and Trotter proved that in 1983. The November 13 OEIS record attributes the proposed exponential base and numerical leading constant to Václav Kotesovec, for Seiichi Manyama’s sequence. The note proves the stronger sharp asymptotic. The source verifier also matched all 10,000 published OEIS terms.

## Source outline

- [1. An exact generating function](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/PROOF.md#L18).
- [2. The dominant core length](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/PROOF.md#L47).
- [3. Extraction of the coefficient](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/PROOF.md#L73).
- [Verification and provenance](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/PROOF.md#L132).

## Provenance

- Path first added on the first-parent history on 2026-11-18T18:47:28-06:00. [Commit 56b5895f5](https://github.com/1337isnot1337/solved-conjectures/commit/56b5895f522ed30bd92b8e629a9326db672f73fc).
- Latest change to this landing file at the snapshot on 2026-11-19T08:17:02-06:00. [Commit 59ce1092a](https://github.com/1337isnot1337/solved-conjectures/commit/59ce1092a81f2fa8a6bb0f371c577007a6cbeae6).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/PROOF.md) · [LEAN_PLAN.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-607-line-sizes/LEAN_PLAN.md)

## Literature checks

- A401948 - OEIS (HTTP 200). [Retrieved address](https://oeis.org/A401948).
- The On-Line Encyclopedia of Integer Sequences (OEIS) (HTTP 200). [Retrieved address](https://oeis.org/history?seq=A401948).
- 607 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/607).
- Crossref query “Erdős Problem 607: line-size sets erdos 607 line sizes” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Verify the line-size generating function — exit 0. [Command and output](../evidence/replays/086.txt).
- OEIS independent 10000-point reference — exit 0. [Command and output](../evidence/replays/210.txt).

3 of 3 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
