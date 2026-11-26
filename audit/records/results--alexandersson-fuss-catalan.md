# Alexandersson's Fuss–Catalan conjecture

**Screened.** Ranked. Rank 141 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/README.md).

## Recorded scope

The source describes the result as follows.

> A short classical deduction proves real-rootedness for all parameters: changing the Fuss parameter only multiplies the known ordinary-Dyck polynomial by a positive scalar. Prior-resolution audit qualified.

## Audit finding

Priority is qualified in the source. Classical enumeration gives the coefficient formula; ordinary-Dyck real-rootedness is prior. The repository supplies the argument that fixing the number of north runs makes the Fuss parameter only a positive scalar. A parking-descent refinement has different statistics.

## Source outline

- [The theorem](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md#L5).
- [1. Counting north runs by cyclic rotation](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md#L37).
- [2. The real-zero argument](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md#L68).
- [3. Relation to the ordinary-Dyck results](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md#L102).
- [Sources and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md#L117).

## Provenance

- Path first added on the first-parent history on 2026-11-20T13:12:55-06:00. [Commit 292fa5270](https://github.com/1337isnot1337/solved-conjectures/commit/292fa5270ae9b2ce7010a53790c2b2eb013c21cc).
- Latest change to this landing file at the snapshot on 2026-11-21T04:53:54-06:00. [Commit cb558ee0c](https://github.com/1337isnot1337/solved-conjectures/commit/cb558ee0c8776ac6a9009d9156358bc21f757ce2).
- Coordination and prior review. [#95](https://github.com/1337isnot1337/solved-conjectures/issues/95).

The original record contains 4 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and Cinna Davis as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/PROOF.md) · [NOVELTY.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/alexandersson-fuss-catalan/NOVELTY.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/1807.03271) (151 pages). Full text retrieved.
- [Source PDF](https://arxiv.org/pdf/2212.10586) (23 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Miklós Bóna, Stoyan Ivanov Dimitrov, Gilbert Labelle, Yifei Li et al. (2025-06-06). [A Combinatorial Proof of a Symmetry for a Refinement of the Narayana Numbers](https://doi.org/10.37236/12681).
- Bo Wang, Candice X. T. Zhang (2024-03-22). [Interlacing Property of a Family of Generating Polynomials over Dyck Paths](https://doi.org/10.37236/12375).
- Germain Kreweras (1972-02-01). [Sur les partitions non croisees d'un cycle](https://doi.org/10.1016/0012-365x(72)90041-6).
- Per Alexandersson (2026-09-07). [Real-rooted Eulerian polynomials from permutations, words, and paths](https://doi.org/10.48550/arxiv.2609.07325).
- Per Alexandersson (2026-09-04). [Real-rootedness and interlacing for parking functions and Chow polynomials](https://doi.org/10.48550/arxiv.2609.05131).

- Real-rooted polynomials: open problems \| SymCat (HTTP 200). [Retrieved address](https://www.symmetricfunctions.com/realRootedOpenProblems.htm).
- Real-rooted polynomials: Catalan families \| SymCat (HTTP 200). [Retrieved address](https://www.symmetricfunctions.com/realRootedCatalan.htm).
- A Combinatorial Proof of a Symmetry for a Refinement of the Narayana Numbers (HTTP 200). [Retrieved address](https://doi.org/10.37236/12681).
- Citation-index seed records. [A Combinatorial Proof of a Symmetry for a Refinement of the Narayana Numbers](https://doi.org/10.37236/12681) · [Interlacing Property of a Family of Generating Polynomials over Dyck Paths](https://doi.org/10.37236/12375) · [Sur les partitions non croisees d'un cycle](https://doi.org/10.1016/0012-365x(72)90041-6) · [Real-rooted Eulerian polynomials from permutations, words, and paths](https://doi.org/10.48550/arxiv.2609.07325) · [Real-rootedness and interlacing for parking functions and Chow polynomials](https://doi.org/10.48550/arxiv.2609.05131).
- External solution records sharing a cited identifier. [Problems/alexandersson-2026-parking-descent-refinement.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/alexandersson-2026-parking-descent-refinement.md) · [stirling/INTERVAL-PATH-REVIEW.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-all-targets-2026-10-13/stirling/INTERVAL-PATH-REVIEW.md) · [paths/UPPER-TAIL.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-all-targets-2026-10-13/paths/UPPER-TAIL.md) · [paths/ATTEMPTS.md](https://github.com/10m-u/open-problems-catalog/blob/ca8d4d44ba3db527f19f28928c240168f545ecfe/solutions/b3-all-targets-2026-10-13/paths/ATTEMPTS.md).
- Crossref query “Alexandersson's Fuss–Catalan conjecture alexandersson fuss catalan” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 3 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check Fuss–Catalan path conventions and exact formula — exit 0. [Command and output](../evidence/replays/056.txt).
