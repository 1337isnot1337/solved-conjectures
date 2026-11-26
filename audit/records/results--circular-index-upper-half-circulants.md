# Circulants with circular chromatic index in the upper half

**Screened.** Ranked. Rank 149 on the original main table, marker 🟡. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/README.md).

## Recorded scope

The source describes the result as follows.

> Mazák–Zrubák, arXiv:2603.08822, Section 8: no graph with `Δ>=8` and circular chromatic index in `(Δ+1/2, Δ+1)` was known. For every `g>=2` the circulant `C_{6g+1}(1,...,2g-2, 2g+1, 3g)` is `4g`-regular and `4g`-connected with `χ'_c = 4g+2/3`, and `C_25(1,2,3,7,...,12)` is 18-regular and 18-connected with `χ'_c = 75/4`. This answers the non-trivial reading of their Problem 6 for `d ≡ 0 mod 4`, `d>=8`, and for `d=18`; Problem 7 is not answered. Computer-certified further examples include `C_31(1,2,3,7,...,12)` with `χ'_c = 93/5` and non-regular graphs with `Δ ≡ 1, 2 mod 4`, `25<=Δ<=54`. One independent model referee pass.

## Source outline

- [0. Context](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L5).
- [1. Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L16).
- [2. Proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L35).
- [2.1 Two general lemmas on $`chi'_c`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L37).
- [2.2 The graph](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L52).
- [2.3 Upper bound: an explicit $`(2n, 3)`$-edge-colouring](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L62).
- [2.4 Lower bound and conclusion](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L106).
- [2.5 Connectivity](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L114).
- [2.6 Proof of Theorem 2 ($`Delta = 18`$)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L153).
- [6. Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L193).
- [7. Further searches (Part 2; computer-certified examples, no new general theorem)](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L206).
- [Problem 7: Multigraph qualification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md#L223).

The ledger includes the intervening sections.

## Provenance

- Path first added on the first-parent history on 2026-11-21T08:38:06-06:00. [Commit 2d906f69e](https://github.com/1337isnot1337/solved-conjectures/commit/2d906f69eae6ba6700c96cdca385c82d59398403).
- Latest change to this landing file at the snapshot on 2026-11-26T02:24:25-06:00. [Commit bc09c3407](https://github.com/1337isnot1337/solved-conjectures/commit/bc09c34073edb60f8a41b094446fba7cc6e5f495).
- Coordination and prior review. [#152](https://github.com/1337isnot1337/solved-conjectures/issues/152) · [#752](https://github.com/1337isnot1337/solved-conjectures/pull/752).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/circular-index-upper-half-circulants/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2603.08822) (15 pages). problem 6 on PDF p. 13 · problem 7 on PDF p. 13.
- [Source PDF](https://www.cs.uleth.ca/~morris/Research/SpecialFamily.pdf) (11 pages). Full text retrieved.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Circular chromatic index of small graphs (HTTP 200). [Retrieved address](https://arxiv.org/abs/2603.08822).
- Redirecting (HTTP 200). [Retrieved address](https://doi.org/10.1016/0012-365X%2894%2900311-6).
- PDF header (HTTP 200). [Retrieved address](https://www.cs.uleth.ca/~morris/Research/SpecialFamily.pdf).
- Citation-index seed records. [Circular chromatic number](https://doi.org/10.1016/s0012-365x(00)00217-x) · [Connectivity of transitive graphs](https://doi.org/10.1016/s0021-9800(70)80005-9) · [Circular chromatic index of small graphs](https://doi.org/10.48550/arxiv.2603.08822).
- Crossref query “Circulants with circular chromatic index in the upper half” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the upper-half circulant theorems and supplementary certificates — exit 0. [Command and output](../evidence/replays/099.txt).

2 of 2 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).

The recorded checks do not certify every inference or establish exclusive priority. A shared paper identifier or a search hit alone does not establish an earlier solution.
