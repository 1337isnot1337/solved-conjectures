# Asgarli–Ghioca–Yip blocking-pencil problem

**Correction.** Ranked. Rank 37 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/README.md).

## Recorded scope

The source describes the result as follows.

> The minimum number of vertical translates of a fixed monomial needed to block the projective plane has logarithmic order over all finite fields.

## Audit finding

The logarithmic bound fixes a monomial degree d≥2. The compact catalogue and historical summary omitted the lower degree restriction. For d=1 the projective closure of y=x is itself a projective line and meets every projective line. The landing page and proof had the correct hypothesis. For fixed d, the implied constants can depend on d.

## Source outline

- [Choosing a common polynomial with no rational zero](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/PROOF.md#L13).
- [A curve recording the degrees of the roots](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/PROOF.md#L31).
- [Counting good parameters](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/PROOF.md#L45).

## Provenance

- Path first added on the first-parent history on 2026-11-26T07:16:50-06:00. [Commit 89bd49697](https://github.com/1337isnot1337/solved-conjectures/commit/89bd49697bfd695c79f430cdbe25653ce37a122e).
- Latest change to this landing file at the snapshot on 2026-11-26T09:00:46-08:00. [Commit 8d693f83e](https://github.com/1337isnot1337/solved-conjectures/commit/8d693f83e0dd03b327bcf7260829e802132a8d8c).
- Coordination and prior review. [#826](https://github.com/1337isnot1337/solved-conjectures/issues/826).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/FORMALIZATION.md) · [FROBENIUS.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/FROBENIUS.md) · [REFLEXIVE.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/asgarli-ghioca-yip-blocking-pencil/REFLEXIVE.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2510.15332v2) (15 pages). question 5.4 on PDF p. 14.
- [Source PDF](https://arxiv.org/pdf/2301.06019) (9 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/s10623-026-01958-z).
- Cinna Davis (@1337isnot1337) / X (HTTP 200). [Retrieved address](https://x.com/1337isnot1337).
- Blocking sets from a union of plane curves (HTTP 200). [Retrieved address](https://arxiv.org/abs/2510.15332v2).
- Citation-index seed records. [Blocking sets from a union of plane curves](https://doi.org/10.1007/s10623-026-01958-z) · [On (k, n)-blocking sets which can be obtained as a union of conics](https://doi.org/10.1007/bf00183016) · [Blocking semiovals containing conics](https://doi.org/10.1515/advgeom-2012-0025).
- Crossref query “Asgarli–Ghioca–Yip blocking-pencil problem asgarli ghioca yip blocking pencil” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite-field blocking pencils — exit 0. [Command and output](../evidence/replays/016.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
