# Fan–Tringali’s power-monoid length-set conjecture

**Screened.** Ranked. Rank 92 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/README.md).

## Recorded scope

The source describes the result as follows.

> Every finite nonempty set of integers at least two is the exact atomic length set in both source power monoids of every Dedekind-finite non-torsion monoid; the exact reduced natural-number system is also proved.

## Audit finding

The October archive gives bounded coverage (up to twice a least positive element); the repository statement concerns realization of arbitrary admissible length sets. An initial interval of coverage does not establish the universal endpoint.

## Source outline

- [1. Setting and the local gadget](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/PROOF.md#L29).
- [2. Graph realization](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/PROOF.md#L60).
- [3. Transfer to one coordinate and apply](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/PROOF.md#L139).
- [Sources and priority](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/PROOF.md#L184).

## Provenance

- Path first added on the first-parent history on 2026-11-24T10:50:18Z. [Commit 0d5b98564](https://github.com/1337isnot1337/solved-conjectures/commit/0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4).
- Latest change to this landing file at the snapshot on 2026-11-24T17:35:46Z. [Commit 95975637e](https://github.com/1337isnot1337/solved-conjectures/commit/95975637ed891b872fdc1eda5e52e7cf51b456f9).
- Coordination and prior review. [#414](https://github.com/1337isnot1337/solved-conjectures/issues/414) · [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/PROOF.md) · [LEAN.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/LEAN.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/fan-tringali-power-monoid-lengths/LEAN_REVIEW.md)

## Literature checks

- Redirecting (HTTP 200). [Retrieved address](https://doi.org/10.1016/j.jalgebra.2018.07.010).
- Power monoids and their arithmetic: a survey (HTTP 200). [Retrieved address](https://arxiv.org/abs/2602.15754v3).
- On the system of length sets of power monoids (HTTP 200). [Retrieved address](https://doi.org/10.4064/aa251028-7-7).
- Citation-index seed records. [Power monoids: A bridge between factorization theory and arithmetic combinatorics](https://doi.org/10.1016/j.jalgebra.2018.07.010) · [Power monoids and their arithmetic: a survey](https://doi.org/10.48550/arxiv.2602.15754).
- External solution records sharing a cited identifier. [b2-continuation-2026-10-12/QUESTION-REGISTER.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b2-continuation-2026-10-12/QUESTION-REGISTER.md) · [arithmetic/MONOID-ATTEMPTS.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b2-continuation-2026-10-12/arithmetic/MONOID-ATTEMPTS.md) · [stirling/POWER-MONOID-REVIEW.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-all-targets-2026-10-13/stirling/POWER-MONOID-REVIEW.md) · [power-monoids/RESULTS.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-all-targets-2026-10-13/power-monoids/RESULTS.md).
- Crossref query “Fan–Tringali’s power-monoid length-set conjecture fan tringali power monoid lengths” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check power-monoid gadgets and the Burstein generating tree — exit 0. [Command and output](../evidence/replays/026.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
