# Gyárfás’s nearly bipartite graph conjecture

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/README.md).

## Recorded scope

The source describes the result as follows.

> If Gyárfás’s conjecture has a counterexample, one exists on at most 330 vertices. The conjecture holds for arbitrary subdivisions of rectangular Möbius grids.

## Audit finding

The finite reduction requires lifting each branch path with its parity so that a totally odd subdivision in the shortened graph lifts to the original. The bound 5(2k²−k) gives 330 at k=6. This is a size bound for a hypothetical counterexample. The published argument does not enumerate those graphs. The Möbius grid case is a separate positive theorem.

## Source outline

- [Proofs](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/README.md#L9).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#808](https://github.com/1337isnot1337/solved-conjectures/issues/808).

The original record contains 7 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/PROOF.md) · [core.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/core.md) · [finite.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/finite.md) · [grids.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/gyarfas-nearly-bipartite/grids.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~gyarfas/Cikkek/ar2erdos.pdf) (13 pages). conjecture 1 on PDF p. 3.
- [Source PDF](https://arxiv.org/pdf/1509.07716) (15 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Bruce A. Reed (1999-02-01). [Mangoes and Blueberries](https://doi.org/10.1007/s004930050056).
- DANIEL C. SLILATY (2007-01-05). [Projective-planar signed graphs and tangled signed graphs](https://doi.org/10.1016/j.jctb.2006.10.002).

- Fruit Salad (HTTP 200). [Retrieved address](https://www.combinatorics.org/ojs/index.php/eljc/article/view/v4i1r8).
- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~gyarfas/Cikkek/ar2erdos.pdf).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/s004930050056).
- Citation-index seed records. [Mangoes and Blueberries](https://doi.org/10.1007/s004930050056) · [Projective-planar signed graphs and tangled signed graphs](https://doi.org/10.1016/j.jctb.2006.10.002).
- Crossref query “Gyárfás’s nearly bipartite graph conjecture gyarfas nearly bipartite” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite cases for five open-problem results — exit 0. [Command and output](../evidence/replays/013.txt).

The original result page marks independent proof review pending.
