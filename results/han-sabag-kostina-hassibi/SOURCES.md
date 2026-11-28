# Source and prior-art audit

**Addition (28 November 2026).** The searches recorded below did not list Jin, Li, Hara and Chen, [arXiv:2608.29511](https://arxiv.org/abs/2608.29511), 30 August 2026, which cites the source papers and characterizes the same coding problem. See the related-work note in the [proof](PROOF.md).

Audit date: 21 November 2026. This is a bounded search record, not a guarantee that no earlier proof exists.

## Exact target

Barron Han, Oron Sabag, Victoria Kostina and Babak Hassibi, *Coded Kalman Filtering over MIMO Gaussian Channels with Feedback*, [arXiv:2406.17196v2](https://arxiv.org/pdf/2406.17196v2), 5 August 2025, Conjecture 1, printed page 6, equations (23)–(24). The [HTML version](https://arxiv.org/html/2406.17196v2) was also read independently.

The target is the displayed matrix optimization with diagonal positive semidefinite Π, arbitrary real Γ and positive definite J. Its proposed optimizer has exactly one nonzero entry per column. The displayed feasible set has no additional relation between Π and Γ. The proof uses positive, distinct entries of B below one and a strict gap between infima; neither a stability omission nor nonattainment explains the contradiction.

The conference publication is ISIT 2024, pages 3261–3266, [DOI 10.1109/ISIT57864.2024.10619600](https://doi.org/10.1109/ISIT57864.2024.10619600). Its bibliographic record and abstract were checked through the [authors' institutional publication record](https://cris.huji.ac.il/en/publications/coded-kalman-filtering-over-mimo-gaussian-channels-with-feedback/). The exact target here is v2; the conference PDF was not independently compared. Direct retrieval of the v1 abstract failed.

The paper itself proves the conjecture in scalar-source or scalar-channel cases. Our example has two source coordinates and two channels. Its stated counterexample concerning the suboptimality of linear codes is a separate result, not a disproof of Conjecture 1.

## Related primary sources checked

1. Han, Sabag and Hassibi, [*Coded Kalman Filtering Over Gaussian Channels with Feedback*, arXiv:2310.11747](https://arxiv.org/pdf/2310.11747). The scalar-channel and scalar-source theorems do not settle the present two-by-two matrix assertion. The conclusion treats the general MIMO extension as further work.
2. Chen, Wang and Qiu, [*MIMO Control Using MIMO Communication: A Majorization Condition for Networked Stabilizability*](https://eeqiu.people.ust.hk/wp-content/uploads/2021/09/MIMO-Control-Using-MIMO-Communication-A-Majorization-Condition-for-Networked-Stabilizability.pdf), ACC 2015. Section II studies a continuous-time plant, a controller-to-plant transceiver with an encoder/decoder constraint RT = I, and fixed AWGN subchannel capacities. Its majorization theorem concerns that different model; it is not a resolution of the discrete-time matrix optimization above.
3. Chen, Wang and Qiu, [*A Majorization Condition for MIMO Stabilizability via MIMO Transceivers with Pure Fading Subchannels*](https://eeqiu.people.ust.hk/wp-content/uploads/2021/09/A-Majorization-Condition-for-MIMO-Stabilizability-via-MIMO-Transceivers.pdf). Its continuous-time pure-fading model is also distinct.
4. [Oron Sabag's publication list](https://sites.google.com/view/oronsabag/publications). The target and predecessor are listed; no listed item was found to resolve Conjecture 1. This page is not assumed to be a complete, current citation index.

These distinctions matter because general claims that mixing channels can help do not by themselves prove the exact strict separation required here.

## Indexed searches

Both available web search engines were used with combinations of the exact title, arXiv identifier, author names, and the phrases “Lyapunov positivity,” “partitioning conjecture,” “coded Kalman,” “proof,” and “counterexample.” Searches also covered MIMO linear stabilization, mode-to-channel assignment and follow-up work through the audit date. Results located the original paper, its predecessor, institutional records, bibliographic listings and the different majorization papers above. No earlier complete proof or counterexample to the exact matrix statement was found.

MathDB entry 363679 was used only as a discovery lead. Its open-status label is not treated as evidence of novelty.

## Public proof archives and issue histories

- A global GitHub issue search for the exact arXiv identifier returned no earlier result before this repository's issue 197 was created. Searches for the exact conjecture phrase and for coded Kalman work found no matching prior proof.
- The full returned “Kalman” issue set in the-omega-institute/trureturing contained six unrelated issues, concerning quantum channels, algebraic topics or sparse controllability. None addressed this conjecture.
- Available complete path inventories were checked for the title, authors, arXiv identifier and MathDB identifier: PrincipiaMath; the trureturing Problems, S0, S1, analytic, combinatorics, zeros, Hilbert-operator and evidence collections; and additional Estimation and Entropy trees. The latter contain 258 and 228 entries respectively. No matching path appeared.
- KnowledgeSense/math's complete recursive tree at b95a52a54597e8b01c1a28486f2a9b29a3a54c58 contains 5,377 entries and no matching identifier or title path.
- The public APPLICATIONS.md index of pudim and the CoPEER README were checked for the same identifiers. No match appeared. Attempts to retrieve their complete recursive trees failed with a transport error; those unsuccessful requests are not counted as negative evidence.
- GitHub's global code-search quota was unavailable. Path and issue searches are narrower than a full search of repository contents.

Archive paths and issue titles can miss a result stored under another name. The audit therefore combines them with exact-source and broader subject searches. It does not claim exhaustive coverage of all repositories, unpublished work, inaccessible citation databases or nonindexed pages.

## Decision and claim boundary

No earlier full resolution of the explicit v2 Conjecture 1 was found in the sources and searches above. The package is admitted as a complete proposed disproof, subject to correction if earlier work is identified.

The mathematical conclusion is the failure of the proposed sparse optimality assertion. No separate universal claim about implementable communication codes or stabilization is counted. The rational example and its continuous family form one resolution, not multiple parameter-case results.

Two independent internal reviews reproduce the source scope, feasible point, all four sparse alternatives and open family. They certify only their stated mathematical checks, not priority or peer review.


## Additional independent review

The [additional mathematical audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-han-sabag-independent-review/AUDIT.md) reconstructs the original Lyapunov system, exhausts all sparse assignments, and verifies the open family with a separate exact checker. The [additional priority audit](https://github.com/1337isnot1337/solved-conjectures/blob/research/research/2026-11-21-han-sabag-independent-review/PRIORITY.md) successfully reads v1's HTML and confirms that its Conjecture 1 has the same feasible set and sparse assertion as v2; this closes the earlier v1 access gap. It also checks the concrete global issue leads and related primary papers, while retaining the conference-PDF and indexing limits. Both reviews passed within their stated scope.
