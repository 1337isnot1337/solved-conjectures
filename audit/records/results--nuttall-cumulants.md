# Nuttall's conjecture

**Screened.** Ranked. Rank 2 on the original main table, marker ✅. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/README.md).

## Recorded scope

The source describes the result as follows.

> Complete Lean verification of Conjecture 1 in §4.5: for each finite order r, every sufficiently high repeated-tail cumulant of the Riemann theta kernel is strictly reverse regular through order r on the entire nonnegative node domain. The separate RH-equivalent Toeplitz positivity problem remains unresolved.

## Audit finding

The argument fixes the matrix order first. Its eventual theta-kernel signs and positive integral estimate furnish an order-dependent sufficiently high cumulant. The determinant sign is read by coalescing ordered nodes after a Rolle argument. No order-independent derivative cutoff or resolution of the Riemann hypothesis follows. The earlier receipt for the theta-kernel file matches the historical receipt commit.

## Source outline

- [1. Exact target](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L5).
- [2. A determinant sign criterion](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L34).
- [3. Eventual signs for the theta kernel](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L69).
- [4. Exact integral for cumulant Wronskians](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L129).
- [5. Uniform upper bound on the possibly negative part](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L168).
- [6. A positive part that dominates uniformly](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L206).
- [7. Scope and relation to the RH campaign](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L290).
- [8. Prior-art audit](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L298).
- [9. Independent review](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md#L316).

## Provenance

- Path first added on the first-parent history on 2026-11-24T07:42:06Z. [Commit 0f49db3f7](https://github.com/1337isnot1337/solved-conjectures/commit/0f49db3f7d2b82ad3d72233cd14e13792956dc10).
- Latest change to this landing file at the snapshot on 2026-11-25T11:48:52Z. [Commit bbbfa70d7](https://github.com/1337isnot1337/solved-conjectures/commit/bbbfa70d74248d1d2eca5ff90b2387687489667d).
- Coordination and prior review. [#121](https://github.com/1337isnot1337/solved-conjectures/issues/121).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/PROOF.md) · [FORMALIZATION.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/nuttall-cumulants/FORMALIZATION.md)

## Literature checks

- [Source PDF](https://publish.uwo.ca/~jnuttall/det3CAEXP_2.pdf) (16 pages). conjecture 1 on PDF p. 13, 14, 15 · problem 1 on PDF p. 15.
- [Source PDF](https://publish.uwo.ca/~jnuttall/wronskRH.pdf) (7 pages). conjecture 1 on PDF p. 5.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- J. Nuttall (2013-06-27). [Wronskians, Cumulants, and the Riemann Hypothesis](https://doi.org/10.1007/s00365-013-9200-8).
- Karlheinz Gröchenig (2023-01-01). [Schoenberg’s Theory of Totally Positive Functions and the Riemann Zeta Function](https://doi.org/10.1007/978-3-031-41130-4_9).
- Jaume de Dios Pont, Karlheinz Gröchenig, Lukas Liehr, Irina Shafkulovska et al. (2026-08-05). [Gabor Frames of Totally Positive Functions: A Complete Characterization](https://doi.org/10.48550/arxiv.2608.04992).
- Bao-Xuan Zhu (2026-10-31). [Coefficientwise Hankel-total positivity from a universal cumulant lifting](https://doi.org/10.48550/arxiv.2611.01172).

- PDF header (HTTP 200). [Retrieved address](https://publish.uwo.ca/~jnuttall/det3CAEXP_2.pdf).
- Client Challenge (HTTP 200). [Retrieved address](https://doi.org/10.1007/s00365-013-9200-8).
- PDF header (HTTP 200). [Retrieved address](https://publish.uwo.ca/~jnuttall/wronskRH.pdf).
- Citation-index seed records. [Wronskians, Cumulants, and the Riemann Hypothesis](https://doi.org/10.1007/s00365-013-9200-8) · [Schoenberg’s Theory of Totally Positive Functions and the Riemann Zeta Function](https://doi.org/10.1007/978-3-031-41130-4_9) · [Gabor Frames of Totally Positive Functions: A Complete Characterization](https://doi.org/10.48550/arxiv.2608.04992) · [Coefficientwise Hankel-total positivity from a universal cumulant lifting](https://doi.org/10.48550/arxiv.2611.01172).
- Crossref query “Nuttall's conjecture nuttall cumulants” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 2 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

The computational runs in this audit do not include a separate executable check for this entry.

16 of 17 associated historical Lean receipts with source hashes match all listed Lean sources in the snapshot. [Per-receipt comparisons](../evidence/lean-receipts.json).
