# Alexandersson’s graphical dist conjecture

**Screened.** Ranked. Rank 149 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/README.md).

## Recorded scope

The source describes the result as follows.

> A 71-vertex ordered graph gives an exact counterexample. Connected chordal graphs of treewidth two can have arbitrarily many distinct nonreal zeros.

## Audit finding

Graphical dist real-rootedness and the fundamental-basis length enumerator are separate questions. The record supplies a 71-vertex witness and a connected chordal family. The root-density note is supporting work for this record.

## Source outline

- [An edge shared by triangles](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/proof.md#L7).
- [Counting distinct values above a threshold](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/proof.md#L25).
- [Supplying all lower values in the same graph](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/proof.md#L39).
- [An explicit 71-vertex counterexample](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/proof.md#L47).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:37:09-06:00. [Commit ade9e4de5](https://github.com/1337isnot1337/solved-conjectures/commit/ade9e4de5471c8b840fe7dbd3132c954a5ed6fdf).
- Latest change to this landing file at the snapshot on 2026-11-26T09:45:22-06:00. [Commit 31c0d06c3](https://github.com/1337isnot1337/solved-conjectures/commit/31c0d06c302f22f5af4b01a5cbe614fb0584c5c7).
- Coordination and prior review. [#823](https://github.com/1337isnot1337/solved-conjectures/issues/823).

The original record contains 8 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/README.md) · [proof.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/proof.md) · [sources.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/sources.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/FORMALIZATION.md) · [review.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-graphical-dist/review.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2610.41502) (30 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Per Alexandersson, Leonardo Saud Maia Leite (2026-10-30). [Sink polynomials of line graphs and weighted matching polynomials](https://doi.org/10.48550/arxiv.2610.41502).

- Sink polynomials of line graphs and weighted matching polynomials (HTTP 200). [Retrieved address](https://arxiv.org/abs/2610.41502).
- Real-rooted polynomials: graphs and combinatorics \| SymCat (HTTP 200). [Retrieved address](https://www.symmetricfunctions.com/realRootedGraphs.htm).
- Citation-index seed records. [Sink polynomials of line graphs and weighted matching polynomials](https://doi.org/10.48550/arxiv.2610.41502).
- External solution records sharing a cited identifier. [Problems/alexandersson-leite-2026-fundamental-length-real-rootedness.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/alexandersson-leite-2026-fundamental-length-real-rootedness.md).
- Crossref query “Alexandersson’s graphical dist conjecture alexandersson graphical dist” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check both graphical dist orientation counts — exit 0. [Command and output](../evidence/replays/001.txt).

1 of 1 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
