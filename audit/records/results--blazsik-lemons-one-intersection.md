# Blázsik–Lemons one-intersection conjecture

**Correction.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/blazsik-lemons-one-intersection/README.md).

## Recorded scope

The source describes the result as follows.

> A finite hypergraph with no singleton intersections admits a proper weak coloring that is rainbow on every part of any prescribed partition into equal-sized blocks of size at least two.

## Audit finding

Missing edge-size hypothesis. A single edge {a} on the vertex set {a,b} satisfies the distinct-edge intersection condition vacuously, yet no weak coloring makes that edge nonmonochromatic. Added the hypothesis that every edge has at least two vertices. Under it, the swap argument increases the number of designated transversal vertices of the color under repair, and an edge newly monochromatic in the other color would intersect the old bad edge only at the swapped vertex.

## Source outline

- [Independent transversals that partition all vertices](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/blazsik-lemons-one-intersection/PROOF.md#L5).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#842](https://github.com/1337isnot1337/solved-conjectures/issues/842).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/blazsik-lemons-one-intersection/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/blazsik-lemons-one-intersection/PROOF.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2406.12118) (6 pages). conjecture 3.1 on PDF p. 5.
- [Source PDF](https://arxiv.org/pdf/1509.00551) (10 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Redirecting (HTTP 200). [Retrieved address](https://doi.org/10.1016/j.disc.2025.114810).
- The connection between the chromatic numbers of a hypergraph and its $1$-intersection graph (HTTP 200). [Retrieved address](https://arxiv.org/abs/2406.12118).
- Chromatic Ramsey number of acyclic hypergraphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/1509.00551).
- Citation-index seed records. [The connection between the chromatic numbers of a hypergraph and its 1-intersection graph](https://doi.org/10.1016/j.disc.2025.114810).
- Crossref query “Blázsik–Lemons one-intersection conjecture blazsik lemons one intersection” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

The original result page marks independent proof review pending.
