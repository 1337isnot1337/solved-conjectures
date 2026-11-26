# Haralambis’s three-difference conjecture

**Screened.** Ranked. Rank 4 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/README.md).

## Recorded scope

The source describes the result as follows.

> For every triple of positive integer differences, the extremal density equals the circle rotation bound. One pair sum is a period of an optimal set.

## Audit finding

The passage from a maximizing rotation to a pair-sum period uses two active triangular waves of opposite slope, with a separate half-height case. Independently computed the maximum cycle mean in the binary shift automaton for every one of the 220 triples from 1 through 12. Exact integer comparisons give both the upper bound and attainment in each case. The finite computation tests the general proof on small inputs.

## Source outline

- [A finite interval inequality](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L15).
- [Sign the edges with two empty endpoints](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L27).
- [Read the three interval counts on the same torus](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L37).
- [From intervals to density and attainment](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L56).
- [An algebraic check on the period argument](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L66).
- [Verification and priority](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md#L80).

## Provenance

- Path first added on the first-parent history on 2026-11-18T18:47:28-06:00. [Commit 56b5895f5](https://github.com/1337isnot1337/solved-conjectures/commit/56b5895f522ed30bd92b8e629a9326db672f73fc).
- Latest change to this landing file at the snapshot on 2026-11-18T19:30:16-06:00. [Commit 22f3a5a83](https://github.com/1337isnot1337/solved-conjectures/commit/22f3a5a833d5ab1101c5ee0e55ada6d42e323244).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/PROOF.md) · [LEAN.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/haralambis-three-differences/LEAN.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/1611.03940) (18 pages). conjecture 3 on PDF p. 12.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Redirecting (HTTP 200). [Retrieved address](https://doi.org/10.1016/0097-3165(77)90076-0).
- Sequences of Integers with Three Missing Separations (HTTP 200). [Retrieved address](https://arxiv.org/abs/1611.03940).
- Citation-index seed records. [Sets of integers with missing differences](https://doi.org/10.1016/0097-3165(77)90076-0).
- Crossref query “Haralambis’s three-difference conjecture haralambis three differences” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

[Independent finite comparison](../evidence/check_proof_steps.py).

- Check Haralambis three-difference rotation certificates — exit 0. [Command and output](../evidence/replays/098.txt).
