# Ferreira–Simon's Wright log-concavity conjecture

**Screened.** Ranked. Rank 64 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/README.md).

## Recorded scope

The source describes the result as follows.

> The full threshold-to-log-concavity implication is false. Lean proves a continuous boundary family directly from the infinite Wright series and a strict midpoint violation. The written proof also gives interior positive-parameter families.

## Source outline

- [1. Source and precise assertion](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md#L5).
- [2. Counterexample families](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md#L49).
- [3. A locally uniform limit](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md#L73).
- [4. The curvature calculation](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md#L139).
- [5. Scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md#L218).

## Provenance

- Path first added on the first-parent history on 2026-11-20T13:30:40-06:00. [Commit 53744e09e](https://github.com/1337isnot1337/solved-conjectures/commit/53744e09edbe98ecc1fbb9277cb3e3a65470d14a).
- Latest change to this landing file at the snapshot on 2026-11-24T04:00:34Z. [Commit 9ff45916e](https://github.com/1337isnot1337/solved-conjectures/commit/9ff45916e73de83d2ea64ef1bcc1750f102ea206).
- Coordination and prior review. [#100](https://github.com/1337isnot1337/solved-conjectures/issues/100).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/PROOF.md) · [NOVELTY.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/ferreira-simon-wright/NOVELTY.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2212.07974) (25 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2512.04940) (25 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/s00365-023-09666-w).
- On the log-concavity of the Wright function (HTTP 200). [Retrieved address](https://arxiv.org/abs/2212.07974).
- DLMF: §5.5 Functional Relations ‣ Properties ‣ Chapter 5 Gamma Function (HTTP 200). [Retrieved address](https://dlmf.nist.gov/5.5.E3).
- Citation-index seed records. [On the Log-Concavity of the Wright Function](https://doi.org/10.1007/s00365-023-09666-w) · [Mittag-Leffler functions and convex ordering](https://doi.org/10.48550/arxiv.2512.04940) · [Moments of Gamma type and three-parametric Mittag-Leffler function](https://doi.org/10.48550/arxiv.2410.19330).
- External solution records sharing a cited identifier. [Problems/li-morgan-siegrist-2026-inflection-points-conjecture-6-1.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/li-morgan-siegrist-2026-inflection-points-conjecture-6-1.md) · [Problems/ggps2025.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/ggps2025.md) · [Problems/garrappa-gerhold-popolizio-simon-2025-kummer-modulus.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/garrappa-gerhold-popolizio-simon-2025-kummer-modulus.md).
- Crossref query “Ferreira–Simon's Wright log-concavity conjecture ferreira simon wright” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check Wright disproof curvature identities — exit 0. [Command and output](../evidence/replays/054.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
