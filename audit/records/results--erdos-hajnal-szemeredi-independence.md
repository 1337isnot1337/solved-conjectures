# Erdős–Hajnal–Szemerédi independence-ratio problem

**Screened.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/README.md).

## Recorded scope

The source describes the result as follows.

> A graph of cardinality at most the continuum is countably colorable if its finite subgraphs have bounded vector chromatic number. Finite graphs can have bounded Hall ratio and arbitrarily large vector chromatic number.

## Audit finding

For a fixed vector-coloring bound K, compactness gives a global Gram representation. On at most continuum many vertices the basis elements admit distinct binary strings. Same finite-prefix sign tables give nonnegative inner product after truncation; Cauchy–Schwarz bounds the error below the required edge gap. This is a countable-colorability criterion for bounded finite vector chromatic number. A uniform Hall-ratio bound alone is precisely the missing implication.

## Source outline

- [An obstruction at the continuum](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/PROOF.md#L5).
- [Arbitrary finite vertex multiplicities](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/PROOF.md#L15).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#836](https://github.com/1337isnot1337/solved-conjectures/issues/836).

The original record contains 4 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/PROOF.md) · [order-types.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/order-types.md) · [vector-hall.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-hajnal-szemeredi-independence/vector-hall.md)

## Literature checks

- [Source PDF](https://users.renyi.hu/~p_erdos/1982-11.pdf) (7 pages). problem 2 on PDF p. 4.
- [Source PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/0C1F8456C5441CEE76B2304FAC4EC541/S0008439500014132a.pdf/the-s-linkedness-of-the-measure-algebra.pdf) (4 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Adam Blumenthal, Bernard Lidický, Ryan R. Martin, Sergey Norin et al. (2022-07-18). [Counterexamples to a Conjecture of Harris on Hall Ratio](https://doi.org/10.1137/18m1229420).
- Raphael Steiner (2025-07-04). [Fractional Chromatic Number Vs. Hall Ratio](https://doi.org/10.1007/s00493-025-00164-0).

- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~p_erdos/1982-11.pdf).
- 75 \| Erdős Problems (HTTP 200). [Retrieved address](https://www.erdosproblems.com/75).
- PDF header (HTTP 200). [Retrieved address](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/0C1F8456C5441CEE76B2304FAC4EC541/S0008439500014132a.pdf/the-s-linkedness-of-the-measure-algebra.pdf).
- Citation-index seed records. [Counterexamples to a Conjecture of Harris on Hall Ratio](https://doi.org/10.1137/18m1229420) · [Fractional Chromatic Number Vs. Hall Ratio](https://doi.org/10.1007/s00493-025-00164-0).
- Crossref query “Erdős–Hajnal–Szemerédi independence-ratio problem erdos hajnal szemeredi independence” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

The original result page marks independent proof review pending.
