# Han–Sabag–Kostina–Hassibi: independent priority and source review

Audit date: 21 November 2026.

**Decision:** source scope passes. No earlier resolution of the exact sparse-optimality conjecture was located in this independent supplementary search. This is a bounded prior-art assessment, not a proof of historical novelty.

This review concerns [issue 197](https://github.com/1337isnot1337/solved-conjectures/issues/197) and [the written disproof](../../results/han-sabag-kostina-hassibi/PROOF.md), first published at [e7d536adb9e0d5d87c2e8e2ec833539a2de48278](https://github.com/1337isnot1337/solved-conjectures/commit/e7d536adb9e0d5d87c2e8e2ec833539a2de48278). It supplements the package's [SOURCES.md](../../results/han-sabag-kostina-hassibi/SOURCES.md). The separate [mathematical audit](AUDIT.md) reproduces the exact feasibility and sparse-infimum calculations. This document adds no result and makes no change to campaign counts.

## 1. Exact source and version comparison

The primary target is Barron Han, Oron Sabag, Victoria Kostina and Babak Hassibi, [*Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*, arXiv:2406.17196v2](https://arxiv.org/html/2406.17196v2), Conjecture 1, equations (23)–(24), printed page 6.

The current [arXiv version history](https://arxiv.org/abs/2406.17196) lists v1 on 25 June 2024 and v2 on 5 August 2025. No later revision was listed when this review was made. The v2 conjecture, surrounding discussion, conditional necessity theorem and relevant portions of Appendix A were independently read.

The displayed optimization fixes diagonal matrices $`B`$ and $`H`$, allows an arbitrary real matrix $`\Gamma`$, minimizes $`\mathop{\mathrm{tr}}\Pi`$, and requires diagonal $`\Pi\succeq0`$ and $`J\succ0`$ satisfying

```math
J=BJB-\Gamma^{T}(I+H\Pi H)^{-1}\Gamma+B\Gamma^{T}\Gamma B.
```

Its proposed optimal encoder has exactly one nonzero entry in each column. The displayed feasible set contains no further equation or inequality relating $`\Pi`$ to $`\Gamma`$. Appendix A explains the connection with a coding problem; that discussion does not insert another constraint into the stated matrix conjecture.

The proposed counterexample has positive, distinct diagonal entries of $`B`$ strictly below one. Thus it does not exploit the source's shorthand stability condition or a failure of uniqueness of the Lyapunov solution. Its strict separation of unrestricted and sparse infima also survives replacing the source's optimizer wording by an infimum formulation.

The [v1 HTML](https://arxiv.org/html/2406.17196v1) was successfully retrieved and read. This closes the original source audit's failed v1 access lead. Conjecture 1 there is equations (27)–(28); it has the same independent variables, diagonal power matrix, positivity requirement and column-sparsity conclusion. V2 makes the feasible-instance qualification explicit. This change does not remove the counterexample.

The conjecture is a universal assertion. An exact feasible instance whose power is below every sparse infimum refutes that assertion; the continuous family in the package is supporting structure for the same refutation. Neither the instance nor separate gain values are counted as distinct results.

The conclusion is confined to this matrix optimization. The original paper's separate result that linear codes can be inferior to nonlinear codes is not the sparse-optimality conjecture, and the package does not claim an additional theorem about the implementability of all dense feasible matrices.

## 2. New literature leads followed

The existing SOURCES.md already records readings of the scalar predecessor, the Chen–Wang–Qiu majorization papers and the authors' publication list. Those checks are credited there, rather than represented as new full-paper readings in this review.

Additional searches used both available search engines with the exact title and identifier, author combinations, and combinations of “coded Kalman,” “Lyapunov positivity,” “sparse optimality,” “partitioning,” “proof” and “counterexample.” Results did not identify a later paper resolving the exact matrix conjecture. The following concrete leads were checked.

| Lead | What was read and why it does not supply the claimed prior resolution |
|---|---|
| Sabag–Kostina–Hassibi, [*Feedback Capacity of Gaussian Channels with Memory*, arXiv:2207.10580](https://arxiv.org/html/2207.10580v1) | The primary introduction, optimization context and Section III-B were read. Its Conjecture 1 concerns redundancy of a detectability condition at a capacity optimizer. It is not the column-sparse minimum-power Lyapunov assertion. |
| Sabag–Kostina–Hassibi, [*Feedback Capacity of MIMO Gaussian Channels*, arXiv:2106.01994v2](https://arxiv.org/html/2106.01994v2) | The primary model, main-result discussion and Section VII-2 were read. It gives a feedback-capacity characterization for colored Gaussian noise and separately discusses explicit MIMO coding schemes. No strict sparse-versus-unrestricted power separation for the present conjecture was identified there. |
| GitHub daily-paper announcements | Entries from August 2025 linked directly to arXiv:2406.17196v2. They announce the source paper and contain no later proof. |
| A NewX exact-title summary | A search snippet appeared to describe necessity without the original paper's conditional qualification. Direct access redirected to a sign-in page. The accessible record identifies the original paper, not a separately authored resolution; the snippet is not treated as proof or as evidence of novelty. |

A search found a [conference-paper PDF deposited with NSF](https://par.nsf.gov/servlets/purl/10635587), but retrieval returned HTTP 502. The conference version therefore remains an explicit access gap. The exact target is the independently read v2 conjecture, and the successful v1 comparison provides an additional source check.

## 3. Global GitHub issue review

Global issue searches were made through GitHub's issue-search API. Returned issue bodies were screened for the target identifiers and mathematical subject; relevant digest passages were read. Search counts describe the returned index on the audit date.

| Query, with `is:issue` | Returned count | Outcome |
|---|---:|---|
| `"2406.17196"` | 0 | Even the newly created repository issue was absent. This is evidence of incomplete indexing, not evidence that no prior work exists. |
| `"Lyapunov positivity"` | 13 | The direct target references were this repository's issues 197 and 156. Other results concerned software definiteness checks, unrelated Lyapunov problems, sum-of-squares work, or broad digests. |
| `"Sabag" "conjecture"` | 3 | This repository and a 2022 digest of arXiv:2207.10580; the latter's detectability conjecture was checked in the primary paper. |
| `"coded Kalman"` | 27 | Original-paper announcements and ordinary Kalman-filter implementation issues; no separate prior refutation appeared. |
| `"sparse optimality" "Lyapunov"` | 3 | Polynomial-optimization material and broad digests in which the search terms occurred in separate entries. No target theorem appeared. |
| `"partitioning" "Kostina"` | 3 | One digest led to arXiv:2106.01994; the other two concerned variable-length bursty-feedback codes, arXiv:2306.13743. |
| `repo:the-omega-institute/trureturing "Kalman"` | 6 | The same unrelated quantum, algebraic and sparse-controllability issues recorded in the package's source audit. |

Representative primary issue records are [zoq/arxiv-updates#307](https://github.com/zoq/arxiv-updates/issues/307), [zoq/arxiv-updates#73](https://github.com/zoq/arxiv-updates/issues/73), [thw1021/DailyArXiv#3](https://github.com/thw1021/DailyArXiv/issues/3) and [QuantumSOS/NCTSSoS.jl#273](https://github.com/QuantumSOS/NCTSSoS.jl/issues/273). The relevant records do not provide a proof of the present sparse-optimality claim or its negation.

## 4. Public proof-corpus checks

The following available inventories were independently screened for the exact title, author surnames, arXiv number, MathDB identifier 363679 and closely related Kalman/Lyapunov labels:

- The [PrincipiaMath site-backup manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/MANIFEST.json), 493 records, retrieved blob `e258a2e1f173e03f393d701950a72327ef389f72`.
- The [KnowledgeSense preprint directory listing](https://github.com/KnowledgeSense/math/tree/main/preprints), 56 entries.
- The 2,500 previously retrieved comments from [TauCetiReviewSite#1](https://github.com/TauCetiProject/TauCetiReviewSite/issues/1), searched for the exact identifiers and author names.

No matching entry or comment was found. These are inventory and comment checks, not a full semantic reading of every archived proof.

The package's SOURCES.md separately records broader completed path-tree scans, including KnowledgeSense's 5,377-entry recursive tree, several trureturing collections and its Estimation and Entropy trees. It also records unsuccessful attempts to fetch complete pudim and CoPEER trees. Those failed requests contribute no negative evidence.

## 5. Limits and disposition

GitHub global code search was unavailable and was not retried during this review. Issue indexes can omit known relevant records, and archive path labels can conceal a result filed under another name. The conference PDF and the NewX summary were not accessible as full text. This review does not cover all unpublished work, private repositories, subscription citation databases or every nonindexed page.

Within the successful searches and primary-source comparisons above, no earlier full resolution was found and no source-scope blocker remains. The package may be described as a proposed exact disproof of Han–Sabag–Kostina–Hassibi's Conjecture 1 with a documented, bounded novelty audit. Neither this assessment nor the independent mathematical audit is external peer review. Any concrete earlier proof should trigger a fresh priority comparison and, if it covers the same statement, withdrawal from the new-result tally.
