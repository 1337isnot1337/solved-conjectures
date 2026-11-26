# Komjáth’s property B problem

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/README.md).

## Recorded scope

The source describes the result as follows.

> There is an almost-disjoint family of infinite sets on a countable ground set, with no singleton intersections, that admits a proper two-coloring yet defeats every attempt to put two points of each color in every edge.

## Audit finding

Checked the diagonal construction on finite binary strings and both cases for the private pairs. A mixed pair and a monochromatic private edge leave exactly one point of the opposite color. If all pairs are monochromatic, a diagonal edge is entirely monochromatic. The construction itself admits an ordinary proper coloring by splitting every pair. It disproves the two-occurrence strengthening and leaves the original one-occurrence question open.

## Source outline

- [Sharp obstruction to two points of each color](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/PROOF.md#L5).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#846](https://github.com/1337isnot1337/solved-conjectures/issues/846).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/PROOF.md) · [CLOSED-FAMILY.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/CLOSED-FAMILY.md) · [WITNESSES.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/komjath-property-b/WITNESSES.md)

## Literature checks

- [Source PDF](https://shelah.logic.at/files/95606/19.pdf) (8 pages). Full text retrieved.
- [Source PDF](https://www.renyi.hu/~soukup/setop/otka61600/conflict_free.pdf) (46 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- 602 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/602).
- PDF header (HTTP 200). [Retrieved address](https://shelah.logic.at/files/95606/19.pdf).
- PDF header (HTTP 200). [Retrieved address](https://www.renyi.hu/~soukup/setop/otka61600/conflict_free.pdf).
- Crossref query “Komjáth’s property B problem komjath property b” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

The original result page marks independent proof review pending.
