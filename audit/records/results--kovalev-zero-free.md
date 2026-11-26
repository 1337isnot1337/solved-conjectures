# Kovalev’s square-root Taylor-section zero-free conjecture

**Earlier public resolution.** Ranked. Rank 104 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/README.md).

## Recorded scope

The source describes the result as follows.

> The beta–gamma diameter-disk comparison proves zero-freeness in the closed unit disk for every section, also for powers between zero and one-half.

## Audit finding

Earlier exact resolution of the square-root case. MathDB 369171 proves strict positivity of the real part after multiplication by the principal square root of 1−z throughout the closed disk except at 1, and S_n(1)>0. Its theorem allows every q≥1 and n≥0, covering the conjecture’s q≥4. Its Tasks 2 and 4 pose segment and fractional-power questions. The repository’s non-square-root range and sharp segment results are preserved as a supplement.

[Earlier resolution](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-369171/mathdb-369171-solution.tex). [Correction on main](https://github.com/1337isnot1337/solved-conjectures/pull/891).

## Source outline

- [1. The correction as a beta average](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md#L12).
- [2. A disk comparison for two beta averages](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md#L64).
- [3. The coefficient budget](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md#L107).
- [Sharp bounds for arbitrary segments](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md#L137).
- [Scope and attribution](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md#L153).

## Provenance

- Path first added on the first-parent history on 2026-11-24T12:21:20Z. [Commit d7a796c0d](https://github.com/1337isnot1337/solved-conjectures/commit/d7a796c0d20e30d3fd743318ac688dee51496212).
- Latest change to this landing file at the snapshot on 2026-11-24T18:39:40Z. [Commit 1a7487336](https://github.com/1337isnot1337/solved-conjectures/commit/1a74873367b32208c7ce53c894aeda351f92f78c).
- Coordination and prior review. [#444](https://github.com/1337isnot1337/solved-conjectures/issues/444) · [#563](https://github.com/1337isnot1337/solved-conjectures/issues/563).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/PROOF.md) · [EXPONENT-SCOPE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/EXPONENT-SCOPE.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/FORMALIZATION.md) · [INTEGRAL_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/INTEGRAL_REVIEW.md) · [LEAN_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/LEAN_REVIEW.md) · [STATEMENT_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/STATEMENT_REVIEW.md) · [TAYLOR_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/TAYLOR_REVIEW.md) · [TRANSPORT_REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/kovalev-zero-free/TRANSPORT_REVIEW.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2507.04544v1) (10 pages). conjecture 1.2 on PDF p. 2, 10 · conjecture 1.3 on PDF p. 2.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Sharp bounds for some segments of bounded power series (HTTP 200). [Retrieved address](https://arxiv.org/abs/2507.04544v1).
- An exact counterexample to trigonometric positivity for square roots of geometric sums \| MathDB (HTTP 200). [Retrieved address](https://mathdb.com/abs/2610.00766).
- Source URL (HTTP 403). [Retrieved address](https://doi.org/10.4310/ARKIV.2026.v64.n2.a4).
- Citation-index seed records. [Sharp bounds for some segments of bounded power series](https://doi.org/10.4310/arkiv.2026.v64.n2.a4).
- External solution records sharing a cited identifier. [mathdb-369172/mathdb-369172-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369172/mathdb-369172-solution.tex) · [mathdb-369171/mathdb-369171-solution.tex](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-369171/mathdb-369171-solution.tex).
- Crossref query “Kovalev’s square-root Taylor-section zero-free conjecture kovalev zero free” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
