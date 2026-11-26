# Erdős–Purdy conjecture

**Correction.** Result directory. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/README.md).

## Recorded scope

The source describes the result as follows.

> In a design on $`v`$ points with transitive abelian symmetry, at least $`v`$ blocks have one size. A power improvement over the square-root lower bound also holds for point configurations over every field.

## Audit finding

Missing design and noncollinearity hypotheses. One block containing all v≥2 points admits a transitive cyclic group but has only one block of its size. Likewise v collinear points determine just one line. The proofs require proper blocks, exactly one block through each pair, and a noncollinear configuration for the field bound. The landing page and collection summaries now state these restrictions.

## Source outline

- [Prior work and scope](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/PROOF.md#L7).

## Provenance

- Path first added on the first-parent history on 2026-11-26T09:42:48-06:00. [Commit 675bcb73b](https://github.com/1337isnot1337/solved-conjectures/commit/675bcb73bd751dacf531e1accc8abdefa03a7d89).
- Latest change to this landing file at the snapshot on 2026-11-26T09:31:25-06:00. [Commit 44df818f6](https://github.com/1337isnot1337/solved-conjectures/commit/44df818f6acde0c803cbca15127bdb5a27190054).
- Coordination and prior review. [#156](https://github.com/1337isnot1337/solved-conjectures/issues/156) · [#780](https://github.com/1337isnot1337/solved-conjectures/issues/780).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/PROOF.md) · [field-obstruction.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/field-obstruction.md) · [prime-planes.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/prime-planes.md) · [profiles.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/profiles.md) · [regularity.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/regularity.md) · [restriction.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/restriction.md) · [small-projections.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/small-projections.md) · [symmetry.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/symmetry.md) · [windows.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/erdos-block-size-multiplicity/windows.md)

## Literature checks

- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~p_erdos/1978-42.pdf).
- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf).
- PDF header (HTTP 200). [Retrieved address](https://users.renyi.hu/~p_erdos/1981-16.pdf).
- Citation-index seed records. [Block Sizes in Pairwise Balanced Designs](https://doi.org/10.4153/cmb-1984-057-0) · [Constructions for point-regular linear spaces](https://doi.org/10.1016/s0378-3758(00)00247-0) · [A Szemerédi-Trotter Theorem in Arbitrary Fields](https://doi.org/10.48550/arxiv.2609.27023).
- Crossref query “Erdős–Purdy conjecture erdos block size multiplicity” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check finite cases for five open-problem results — exit 0. [Command and output](../evidence/replays/013.txt).

The original result page marks independent proof review pending.
