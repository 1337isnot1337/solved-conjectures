# Currie's conjecture on complexity 2n+1 and critical exponent

**Screened.** Ranked. Rank 128 on the original main table, marker ⬜. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/README.md).

## Recorded scope

The source describes the result as follows.

> Currie, Electron. J. Combin. 33(3) #P3.31, Conjecture 19 (arXiv Conjecture 1): each of the ten listed morphic images of the fixed point `G` of `[01,2,02]` or of its reversal has factor complexity `2n+1` and critical exponent exactly `μ = 2+1/(λ²-1)`, where `λ` is the real root of `x³-2x²+x-1`; the supremum is not attained. The proof reduces the words to three languages, describes all their bispecial factors and proves the final inequalities by exact arithmetic in `Q(λ)`. One independent model referee pass.

## Audit finding

The target is the exclusion of the specified Rauzy graphs at the stated factor complexity and critical exponent. Journal Conjecture 19 is numbered 1 in the preprint. A separate 2026 paper with Rauzy in its title settles a conjecture on abelian complexity, a different invariant. The repository describes its mathematical review as internal to the research effort.

## Source outline

- [Statement](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L6).
- [Reduction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L40).
- [Lemmas](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L111).
- [Proof](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L236).
- [Step 1: the bispecial factors of $`G`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L238).
- [Step 2: the bispecial factors of $`V=a_4(G)`$ and $`U=a_1(G)`$](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L316).
- [Step 3: complexity](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L392).
- [Step 4: critical exponent](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L399).
- [What is new](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L460).
- [Verification](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L468).
- [Sources](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md#L493).

## Provenance

- Path first added on the first-parent history on 2026-11-21T08:38:00-06:00. [Commit 93ebcfc2c](https://github.com/1337isnot1337/solved-conjectures/commit/93ebcfc2cf089ea4febff31f3d15ea66bac3d29c).
- Latest change to this landing file at the snapshot on 2026-11-21T15:17:58+01:00. [Commit 32efcb11a](https://github.com/1337isnot1337/solved-conjectures/commit/32efcb11ade9c76c325ee5fb7089c6c97dc3992c).
- Coordination and prior review. [#148](https://github.com/1337isnot1337/solved-conjectures/issues/148).

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/README.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/currie-conjecture-19/PROOF.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/2507.09387v3) (20 pages). open problem 1 on PDF p. 14 · conjecture 1 on PDF p. 14.
- [Source PDF](https://arxiv.org/pdf/1801.05376) (29 pages). conjecture 1 on PDF p. 27.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

- Words with Factor Complexity $2n+1$ and Minimal Critical Exponent (HTTP 200). [Retrieved address](https://doi.org/10.37236/14527).
- Words with factor complexity $2n+1$ and minimal critical exponent (HTTP 200). [Retrieved address](https://arxiv.org/abs/2507.09387v3).
- Citation-index seed records. [Words with Factor Complexity $2n+1$ and Minimal Critical Exponent](https://doi.org/10.37236/14527) · [Subword complexity and power avoidance](https://doi.org/10.1016/j.tcs.2018.09.010) · [Almost everywhere balanced sequences of complexity 2n + 1](https://doi.org/10.2140/moscow.2022.11.287).
- Crossref query “Currie's conjecture on complexity 2n+1 and critical exponent” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check Currie's conjecture on complexity 2n+1 and critical exponent — exit 0. [Command and output](../evidence/replays/109.txt).
