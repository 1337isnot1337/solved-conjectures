# Multicolor Steiner triple system sail problem

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/multicolor-steiner-sail/README.md).

## Recorded scope

The source describes the result as follows.

> For every fixed number of colors, almost every Steiner triple system has a positive density of monochromatic sails in every vertex subset of fixed positive density, simultaneously for all block colorings.

## Audit finding

For a nonexceptional center, each internal block in the selected color-neighbor set produces a distinct sail. Linearity rules out two transversal vertices on a single center block. The nested induced sets therefore control every used color simultaneously. The union bound for dense vertex sets and the triangle-removal transfer are statements about uniformly random hosts, whereas the separate packing assertion assumes a small independence number. The all-host multicolor target stays open.

## Source outline

- [A polynomial independence obstruction in every number of colors](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/multicolor-steiner-sail/PROOF.md#L5).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#852](https://github.com/1337isnot1337/solved-conjectures/issues/852).

The original record contains 3 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/multicolor-steiner-sail/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/multicolor-steiner-sail/PROOF.md) · [random-systems.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/multicolor-steiner-sail/random-systems.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~gyarfas/Cikkek/182_jcd1.pdf) (10 pages). Full text retrieved.
- [Source PDF](https://real.mtak.hu/162638/1/98.pdf) (13 pages). problem 1.3 on PDF p. 2, 3, 12.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- David A. Grable, Kevin T. Phelps, Vojt?ch R�dl (1995-06-01). [The minimum independence number for designs](https://doi.org/10.1007/bf01200754).

- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~gyarfas/Cikkek/182_jcd1.pdf).
- PDF header (HTTP 200). [Retrieved address](https://real.mtak.hu/162638/1/98.pdf).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/BF01200754).
- Citation-index seed records. [The minimum independence number for designs](https://doi.org/10.1007/bf01200754).
- Crossref query “Multicolor Steiner triple system sail problem multicolor steiner sail” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

The original result page marks independent proof review pending.
