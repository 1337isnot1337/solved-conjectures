# Brown–Cameron’s independence-root sector and stability problems

**Screened.** Ranked. Rank 71 on the original main table, marker ⬜. [Pinned entry](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/README.md).

## Recorded scope

The source describes the result as follows.

> For every fixed edge probability $`0\lt p<1`$, a root in the open right half-plane occurs with limsup probability at least $`1-e^{-(1-p)^2}`$. The limsup probability of failure of log-concavity is at least $`1-e^{-(1-p)}`$. This refutes the sector conjecture and answers the closed-half-plane stability question in the negative. Contributed by @adamben04.

## Audit finding

The upper-half-plane assertion concerns independence polynomials of random graphs at a fixed p strictly between zero and one. The stated failure bounds are subsequential limsups. Stability of well-covered Ferrers graphs treats a different carrier. The p=1/2 headlines 1−exp(−1/4) and 1−exp(−1/2) evaluate to about 22.1% and 39.3%.

## Source outline

- [Statements](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md#L3).
- [1. Deterministic root obstruction](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md#L16).
- [2. Tune the graph order to the threshold](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md#L26).
- [3. Fluctuations: the top count need not concentrate](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md#L49).
- [4. Violate the inequalities](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md#L78).

## Provenance

- Path first added on the first-parent history on 2026-11-26T10:20:12-06:00. [Commit 5dde76d0a](https://github.com/1337isnot1337/solved-conjectures/commit/5dde76d0aca154a1da6a0d6c7deb9e81d9dcc174).
- Latest change to this landing file at the snapshot on 2026-11-26T10:50:36-06:00. [Commit 2e54a945a](https://github.com/1337isnot1337/solved-conjectures/commit/2e54a945aa14bb6965f88f9fc21c63e1d9183921).
- Coordination and prior review. [#573](https://github.com/1337isnot1337/solved-conjectures/issues/573) · [#74](https://github.com/1337isnot1337/solved-conjectures/issues/74) · [#838](https://github.com/1337isnot1337/solved-conjectures/pull/838).

The original record contains 6 tracked files. Its code, verification assets and nested documents are included in the [full Git object manifest](../evidence/tracked-files.tsv.gz).

The first addition of the landing file lists Cinna Davis as Git author and GitHub as committer. The mathematical credits are recorded in the source documents.

All source-document paths and SHA-256 hashes are in the machine-readable ledger.

[README.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/README.md) · [AUDIT.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/AUDIT.md) · [PROOF.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/PROOF.md) · [REVIEW.md](https://github.com/1337isnot1337/solved-conjectures/blob/d676ae52308b71d65beac020fb2a1a591a9e6d34/results/brown-cameron-stability/REVIEW.md)

## Literature checks

- [Source PDF](https://arxiv.org/pdf/1802.02478) (22 pages). problem 2 on PDF p. 21.
- [Source PDF](https://arxiv.org/pdf/1709.08236) (11 pages). conjecture 3.2 on PDF p. 8.

The page matches use numbered labels from the dossier. Each PDF digest is in the [source inventory](../evidence/source-pdfs.json).

**Bibliographic attribution for cited works**

- Jason I. Brown, Ben Cameron (2018-03-02). [On the Stability of Independence Polynomials](https://doi.org/10.37236/7280).
- Vadim E. Levit, Eugen Mândrescu (2005-06-14). [Independence polynomials of well-covered graphs: Generic counterexamples for the unimodality conjecture](https://doi.org/10.1016/j.ejc.2005.04.007).
- Jason I. Brown, Ben Cameron (2017-10-28). [On the unimodality of independence polynomials of very well-covered graphs](https://doi.org/10.1016/j.disc.2017.10.007).
- Jason I. Brown, Richard J. Nowakowski (2004-12-13). [Average independence polynomials](https://doi.org/10.1016/j.jctb.2004.10.001).
- Wei Li, Wei Li, Tong Zhang (2026-09-27). [Unimodality of Forest Independence Polynomials](https://doi.org/10.48550/arxiv.2610.07943).
- Vsevolod Gubarev (2018-08-12). [$PC$-polynomial of graph](https://doi.org/10.48550/arxiv.1808.03932).

- adamben04 · GitHub (HTTP 200). [Retrieved address](https://github.com/adamben04).
- On the Stability of Independence Polynomials (HTTP 200). [Retrieved address](https://doi.org/10.37236/7280).
- On the Stability of Independence Polynomials (HTTP 200). [Retrieved address](https://arxiv.org/abs/1802.02478).
- Citation-index seed records. [On the Stability of Independence Polynomials](https://doi.org/10.37236/7280) · [Independence polynomials of well-covered graphs: Generic counterexamples for the unimodality conjecture](https://doi.org/10.1016/j.ejc.2005.04.007) · [On the unimodality of independence polynomials of very well-covered graphs](https://doi.org/10.1016/j.disc.2017.10.007) · [Average independence polynomials](https://doi.org/10.1016/j.jctb.2004.10.001) · [Unimodality of Forest Independence Polynomials](https://doi.org/10.48550/arxiv.2610.07943) · [$PC$-polynomial of graph](https://doi.org/10.48550/arxiv.1808.03932).
- External solution records sharing a cited identifier. [Problems/ta-hoang-nguyen-2026-ferrers-question-4-1.md](https://github.com/the-omega-institute/trureturing/blob/12036e5e3cc8d8d9f92467546faa8e37a61702b4/Problems/ta-hoang-nguyen-2026-ferrers-question-4-1.md).
- Crossref query “Brown–Cameron’s independence-root sector and stability problems brown cameron stability” returned 12 displayed records (HTTP 200).
- DataCite Zenodo search returned 0 displayed records (HTTP 200).
- A separate web search is recorded with its query, titles and URLs in the ledger.

## Verification

- Check the Brown–Cameron independence-root obstructions — exit 0. [Command and output](../evidence/replays/008.txt).
