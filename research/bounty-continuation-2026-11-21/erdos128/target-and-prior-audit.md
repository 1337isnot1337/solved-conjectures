# Erdős 128: target, payment, and prior-work audit

21 November 2026. **Status: reserved research, no complete proof or counterexample.** The campaign's one internally reviewed proposed threshold solution is separate. Nothing in this directory adds a completed bounty.

## Exact target

For every finite simple triangle-free graph G on n vertices, there is a subset of floor(n/2) vertices inducing at most n²/50 edges. Equivalently, a graph all of whose subsets of at least floor(n/2) vertices induce more than n²/50 edges contains a triangle. The exact live [Conjectures.io target](https://conjectures.io/problems/erdos128-erdos-128) uses the condition 2|V′|+1≥n, so its rounding convention is explicit.

This is the sparse-half conjecture, not the different conjecture that at most n²/25 edge deletions make a triangle-free graph bipartite. A single exact finite counterexample would refute the original universal statement. Verifying more graph orders, proving a special family, or reducing a larger general constant is not a full resolution.

The statement is Conjecture 1.1 in [Norin–Yepremyan](https://arxiv.org/pdf/1311.5818) and Conjecture 1 in [Razborov](https://arxiv.org/pdf/2104.09406). [Keevash–Sudakov](https://people.math.ethz.ch/~sudakovb/sparse-halves.pdf) attributes the question to Erdős's 1975 conference paper, published in 1976, and the historical $250 offer to his 1997 paper. The 1997 publisher scan was located at DOI [10.1016/S0012-365X(96)00173-2](https://doi.org/10.1016/S0012-365X(96)00173-2), but direct PDF retrieval returned 403 during this audit. No claim of reading that scan or of current historical-prize administration is made.

## Direct solver reward

The live platform page displayed **$2,711** and no full proof or refutation attempts when reserved. This is a dynamic dollar estimate, paid in Subnet 66 Alpha to the accepted solver's wallet; it is not guaranteed cash. The [FAQ](https://conjectures.io/faq) and [submission terms](https://conjectures.io/submission-terms), v13 effective 11 November 2026, require exact Lean verification, review, and original proof-producing chat logs. Prior complete public conventional proofs can disqualify a result even if no Lean proof existed. Up to half the bounty can be allocated to recognized contributions. Submission needs a paid verification attempt. No submission, fee, account action, or log upload has been made.

The exact task identifiers and reservation receipt are in [eligibility-snapshot.json](eligibility-snapshot.json). A public full proof before platform acceptance can affect novelty eligibility, so publication and reward acceptance must not be conflated.

## Primary-source comparison

| Primary source read | Exact scope relevant here |
| --- | --- |
| Keevash–Sudakov, *Sparse halves in triangle-free graphs*, JCTB 96 (2006), 614–620; [author PDF](https://people.math.ethz.ch/~sudakovb/sparse-halves.pdf), introduction and theorem statements | Proves the target in the low-edge and high-edge regimes, including e(G)≤n²/12 and e(G)≥n²/5. This leaves an intermediate range. |
| Norin–Yepremyan, *Sparse halves in dense triangle-free graphs*, JCTB 115 (2015), 1–25; [arXiv v2](https://arxiv.org/pdf/1311.5818), Sections 1–2 and Theorems 1.1, 1.2, 6.3 | Minimum degree at least 5n/14, a neighborhood below edge density n²/5, and a neighborhood of the balanced Petersen blow-up. Its weighted-half framework is established prior work. |
| Razborov, *More about sparse halves in triangle-free graphs*, Sb. Math. 213 (2022), 109–128; [arXiv v2](https://arxiv.org/pdf/2104.09406), definitions, Section 3, and relevant proof-method passages | General constant 27/1024; exact conjecture for several classes, including independence ratio at least 2/5, girth at least five, strongly regular graphs, and graphs without an induced two-edge matching. Neighborhood-completion and C₄-density methods are already developed there. |
| Balogh–Clemen–Lidický–Norin–Volec, *The Spectrum of Triangle-free Graphs*, SIAM J. Discrete Math. 37 (2023), 1173–1179; [current arXiv v4](https://arxiv.org/pdf/2204.00093), Sections 1–2, revised 9 September 2026 | Theorem 1.6 gives the signless-Laplacian bound q_min≤15n/94. The paper still states sparse halves as Conjecture 1.1; its proved Brandt theorem is a consequence of the desired conjecture, not its converse. |
| [pma1999/erdos-128-sparse-halves](https://github.com/pma1999/erdos-128-sparse-halves), current author README and scope discussion | Claims 2587/100000 under the published max-cut input and explicitly leaves 1/50 open. Its discussion identifies the earlier Sarid 131/5000 claim as partial. The numerical certificates were not replayed here; neither stated constant is the full target. |

Current exact-title, problem-number, sparse-half, and resolution searches found no primary full-resolution claim. The current [problem registry](https://erdosproblems.ai/wiki/problems/extremal_graph_theory/E0128) was used to locate sources and recent claims, not as a replacement for those papers. The exact phrase “sparse half” returned no existing issue in the owner's repository before reservation. This is a bounded literature search, not a proof that no unindexed result exists.

## Why this target and what was attempted

The conjecture is a sharp local-density threshold for forcing a triangle. The sustained work cited above, and its explicit relation to the spectral and max-cut questions, meet the repository's target-selection standard. The balanced pentagon and Petersen examples explain why the constant cannot be improved. The intended work is the exact unrestricted theorem or a complete counterexample, not another numerical constant.

The first concrete bridge tested was whether an induced C₄ always permits an opposite-vertex merge without reducing the minimum-half density. The unconditional claim fails exactly on the Clebsch graph. Its density is below 1/50, so this does not defeat a version restricted to counterexamples. A second check rules out searching for a counterexample among uniform binary Cayley graphs: the published spectral theorem already settles that entire class. The precise arguments and their limitations are in [compression-and-spectral-gap.md](compression-and-spectral-gap.md).

The [conditional continuation](conditional-compression-gap.md) derives a valid union-neighborhood compression and a necessary weighted-codegree inequality for a minimum-support counterexample. It does not force an available compression. It also records a separate terminal gap: the known unweighted girth-five theorem does not automatically apply to a weighted quotient after mass merging.

The missing step remains a reduction or rounding theorem for arbitrary triangle-free graphs. No controlled replacement with enough slack has been proved. The notes make no novelty claim for elementary spectral consequences, and do not count these route checks as bounty progress.

## Coordination

Reservation: [issue 223, comment 7070403592](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070403592). The posted body was fetched and matched exactly. Root publishes any repository checkpoint; these scratch sources do not modify shared indices or the live submission target.

The structural checkpoint is recorded in [comment 7070535994](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7070535994), also fetched and matched exactly. It explicitly retains the threshold-conditional and weighted-terminal gaps.
