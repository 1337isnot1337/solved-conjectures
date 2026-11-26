# Benfield–Lippard’s stable Waring-gap symmetry conjecture

**Screened.** Ranked. Rank 108 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/README.md).

## Recorded scope

The source describes the result as follows.

> Full refutation of Conjecture 10.1 and its intended reflection formulation (10.2), via exact nonsymmetric numerical semigroups at exponents 64 and 128.

## Audit finding

The Omega same-paper record addresses oscillation in Conjecture 10.5. The repository records separately concern parity in 10.4 and reflection symmetry in 10.1/10.2. An oscillation theorem alone implies neither parity nor failure of reflection.

## Source outline

- [1. Stable offsets and Frobenius symmetry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L5).
- [2. A finite truncation that is exact](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L11).
- [3. The nonsymmetric smaller semigroup](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L23).
- [4. Nonsymmetry survives the last generator](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L42).
- [Source and scope notes](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L53).
- [Optional independent certificate for nonsymmetry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md#L59).

## Provenance

- Path first added on the first-parent history on 2026-11-24T10:07:17Z. [Commit a2ec695e1](https://github.com/1337isnot1337/solved-conjectures/commit/a2ec695e12f4bb6a1e0c38ab60dd7fec7824f409).
- Latest change to this landing file at the snapshot on 2026-11-25T07:36:08Z. [Commit 029fa9d62](https://github.com/1337isnot1337/solved-conjectures/commit/029fa9d62294ed1b2efa1f6ffafc4b4a4ad8ef98).
- Coordination and prior review. [#398](https://github.com/1337isnot1337/solved-conjectures/issues/398).

The original record contains 5 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/PROOF.md) · [LEAN.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/benfield-lippard-waring-gap-symmetry/LEAN.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2404.08193v2) (20 pages). conjecture 10.1 on PDF p. 10 · conjecture 10.2 on PDF p. 10 · conjecture 10.3 on PDF p. 10 · conjecture 10.4 on PDF p. 10.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- J�rgen Herzog (1970-06-01). [Generators and relations of abelian semigroups and semigroup rings](https://doi.org/10.1007/bf01273309).
- Brennan Benfield, Oliver Lippard (2024-04-12). [Integers that are not the sum of positive powers](https://doi.org/10.48550/arxiv.2404.08193).

- Integers that are not the sum of positive powers (HTTP 200). [Retrieved address](https://arxiv.org/abs/2404.08193v2).
- Oscillation of stable exception-set sizes - trureturing — Discovering truth (HTTP 200). [Retrieved address](https://the-omega-institute.github.io/trureturing-mdbook/Problems/benfield-lippard-2025-exception-set-oscillation.html).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/BF01273309).
- Citation-index seed records. [Generators and relations of abelian semigroups and semigroup rings](https://doi.org/10.1007/bf01273309) · [Integers that are not the sum of positive powers](https://doi.org/10.48550/arxiv.2404.08193).
- External solution records sharing a cited identifier. [Problems/benfield-lippard-2025-exception-set-oscillation.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/benfield-lippard-2025-exception-set-oscillation.md).
- Crossref query “Benfield–Lippard’s stable Waring-gap symmetry conjecture benfield lippard waring gap symmetry” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Certify the two stable Waring-gap symmetry defects — exit 0. [Command and output](../evidence/replays/023.txt).
