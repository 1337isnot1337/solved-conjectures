# Independent source and prior-resolution audit: Chen–Khare–Sahi

Date: 2026-11-21 UTC. Reviewer: combinatorics lane. This audit concerns the full Macdonald equivalence in Conjecture 5 of arXiv:2509.19649v2. It is independent of the algebra lane's exact separation computation. No claim of global publication priority follows from a bounded search.

## Scope checked directly

The [primary arXiv record](https://arxiv.org/abs/2509.19649) lists v1 on 24 September 2025 and latest v2 on 13 February 2026, with no later version or journal reference displayed. I read [Conjecture 5, equations (5.5)–(5.9)](https://arxiv.org/html/2509.19649v2#S5), and independently checked the author's [32-page PDF](https://math.iisc.ac.in/~khare/papers/Jack.pdf), printed pages 29–30. The PDF is dated 13 February 2026; the HTML's internal August date does not change the conjecture statements.

Condition (5) is majorization. Condition (2') says that for every pair of parameters in the open unit square, the difference of Macdonald polynomials normalized at the all-ones vector belongs to the Muirhead semiring over nonnegative real numbers. Thus one exact majorization pair and one allowed parameter pair outside that semiring refute the whole numbered equivalence. This is not a proof of a bounded case or a disproof of a newly strengthened assertion. It does not refute the separate pointwise inequality in condition (3).

The semiring is defined above Theorem 1.4: nonnegative linear combinations of finite products of normalized monomial symmetric polynomials and their majorization differences. Membership in the smaller linear cone is not enough for the proposed separation certificate; all semiring products must be covered.

The algebra lane's reported candidate is three variables, partitions (4,2,0) majorizing (4,1,1), and parameters q=1/10, t=9/10. This lies within the primary quantifiers. Mathematical verification of its separating functional is recorded separately.

## Material earlier results distinguished

| Earlier primary source | What was checked | Relationship to this target |
|---|---|---|
| Chen–Khare–Sahi, Example 4.1 in [the same paper](https://arxiv.org/html/2509.19649v2#S4.SS1) | The Schur difference for (5,2,0) and (5,1,1) is outside the Muirhead cone but has an explicit Muirhead-semiring expansion, also for Jack parameter values. | The known cone obstruction does not refute semiring membership. The parameter and partition difference must not be hidden. |
| Chen–Khare–Sahi, Example 4.7 | A monomial difference is outside a Schur semiring when the two parameters are in the reverse order from the subsequent varying-parameter conjecture. | This uses a different generating semiring; it is not a counterexample to Conjecture 5's Muirhead semiring. |
| Suvrit Sra, [*On inequalities for normalized Schur functions*](https://optml.mit.edu/papers/sra_schur_published.pdf), EJC 51 (2016), 492–494 | Read the complete three-page published paper. Theorem 2 proves normalized Schur evaluation inequalities using the HCIZ integral. | A theorem about values on positive vectors, not a semiring decomposition or a Macdonald semiring counterexample. |
| Suvrit Sra, [*On majorization inequalities for normalized Jack and Macdonald polynomials*](https://hexagonmath.org/pdf/2610.00725v1), first released 8 October 2026, Hexagon posting 2 November | Read the main results and exact Certificate 4.1 on printed page 8, the degree-eight certificate, and the open-problem and normalization discussion. Full-text search finds no occurrence of “semiring.” | Certificate 4.1 proves the ordinary evaluation inequality for the **same** pair (4,2,0), (4,1,1), for all parameters in the open square. This is compatible with and highlights the proposed failure of the stronger, explicitly conjectured semiring property. It is not a prior resolution of that property. |
| McSwiggen–Sahi, [*Majorization inequalities from logarithmic convexity*, arXiv:2605.12680v2](https://arxiv.org/html/2605.12680v2) | Read Section 2.1's normalization, Theorem 2.1, and corresponding majorization results. | The finite-q normalization is at the principal specialization, with evaluations on a shifted q-lattice. This is different from normalization at the all-ones vector. |
| Sra's [Count ex Machina Macdonald package](https://github.com/suvrit/count-ex-machina/tree/635da722d12a630a7a1dfa64ac4a56566691f846/counterexamples/macdonald-schur-convexity) | Read its README and compared it with the preceding primary theorem and Sra's discussion. | The existing counterexample refutes McSwiggen–Sahi's principal-specialization lattice statement; it is not a Muirhead-semiring counterexample. |

In particular, it would be false to present the (4,2)/(4,1,1) pointwise inequality as newly unresolved or newly disproved. The package must keep the precise semiring claim in its theorem and scope statements.

## Author and current-version checks

The author-hosted Chen–Khare–Sahi PDF still contains the full conjecture. [Hong Chen's former Rutgers page](https://sites.math.rutgers.edu/~hc813/) lists the preprint and points to his [current page](https://sites.google.com/view/hong-chen-math); the latter is under construction and contains no research-status update. [Siddhartha Sahi's page](https://sites.math.rutgers.edu/~sahi/) has a 2021 publications list and no update for this problem. Khare's HTML publication list and CV PDF were blocked by the web tool, although the primary Jack.pdf itself was accessible. Those failed accesses are not negative evidence.

[Sra's current preprint page](https://suvrit.github.io/papers/jackratio/) identifies v1 as the only version. His `suvrit/preprints` complete tree at commit `cd53b549a7fd5a7a903e4b3147fef8f4d4b4e39e` has 352 entries and is nontruncated; the only matching Jack/Macdonald paths are the v1 Jack-ratio package. His `suvrit/count-ex-machina` complete tree at `635da722d12a630a7a1dfa64ac4a56566691f846` has 200 entries, also nontruncated; the Macdonald paths all belong to the principal-specialization counterexample discussed above.

The original Sra GitHub Pages PDF request failed in the web tool, but the complete primary PDF was read through its Hexagon publication. The newer McSwiggen–Sahi arXiv:2606.15185v1 HTML endpoint was disabled; Sra's paper describes its distinct type-A evaluation-point scope. This audit does not claim to have read that disabled full text.

## Repository and public-resolution archives

I independently fetched the current solved-conjectures HISTORY and searched for the arXiv identifier, Muirhead, Khare, Sahi, and the target title; no earlier target package appeared. Global GitHub issue searches for the exact identifier and for “Muirhead semiring” found no mathematical target thread except our newly opened [issue #201](https://github.com/1337isnot1337/solved-conjectures/issues/201). Broader “Muirhead” plus “Macdonald” results were inspected by title and separated from unrelated software and listing issues. A repository-specific Khare search found only #201.

The following public archive files were fetched and searched for the target authors, identifier, semiring, and Macdonald terminology:

- [10m-u/open-problems-catalog](https://github.com/10m-u/open-problems-catalog): source-letter indexes C, K, and S. No target entry appeared.
- [xzwwwwww/math](https://github.com/xzwwwwww/math): README. No target entry appeared.
- [mxym/math](https://github.com/mxym/math): README. No target entry appeared; a Wakhare entropy-polynomial entry was an unrelated substring match.
- [suvrit/count-ex-machina](https://github.com/suvrit/count-ex-machina): README and full path inventory, with the one relevant Macdonald entry read as above.

These are bounded index and file checks, not full audits of every proof in each repository.

The algebra lane additionally attempted global GitHub code search for the
exact identifier and later for `"Muirhead" "Macdonald"`. Both were blocked
by a shared API rate limit. That unavailable content search is not counted
as negative evidence. The local full path inventories for Principia and
Trure Turing were screened separately without a matching target path.

Both web search engines were used, with and without recent-date restrictions, for the exact arXiv identifier, author combinations, “Muirhead semiring,” Macdonald majorization, counterexample, refutation, and disproof. Domain-restricted searches also covered public solution archives including Trure Turing and Principia. No earlier semiring separation, disproof, or full resolution was found. Searches located the relevant Sra paper and the older cone counterexample, both of which were checked in primary sources rather than dismissed by title.

[MathDB 370539](https://mathdb.com/p/370539/cgs-and-muirhead-conjecture-for-macdonald-polynomials) lists zero solutions but says its progress summary has never been refreshed. It was used only for discovery. Its compressed parameter wording is not the source for our statement.

## Conclusion

The retrieved primary statements support the proposed scope: a correct exact semiring separator at the reported parameters refutes Conjecture 5 as stated. No earlier resolution of this semiring assertion was found. The closest recent result proves ordinary positivity for the same partition pair, which is a separate property. The independent mathematical checks of exhaustive generator coverage, polynomial identification, and rational separation subsequently passed; they are recorded separately in ANALYSIS_REVIEW.md and ROOT_REVIEW.md.
