# Coulter–Do–Moskovsky's conjecture: independent priority review

Review date: November 21, 2026. Research issue: [193](https://github.com/1337isnot1337/solved-conjectures/issues/193). The mathematical theorem is in [ASYMPTOTIC.md](ASYMPTOTIC.md); the independent mathematical audit is in [AUDIT.md](AUDIT.md).

**Status: research only; no completed-conjecture count.** No earlier proof of the all-profile root limits and eventual strict monotonicity was identified in the bounded searches below. The distinction between eventual monotonicity and monotonicity from genus zero remains explicit. The small-profile reversal is already an immediate consequence of polynomial data published by Moskovsky in 2022, and is not claimed as new polynomial computation or counted as a new resolution.

## 1. Source and scope

The published [Coulter–Do–Moskovsky article](https://www.cambridge.org/core/journals/canadian-journal-of-mathematics/article/integration-on-complex-grassmannians-deformed-monotone-hurwitz-numbers-and-interlacing-phenomena/1D1EAFA4F78A147F6B88ECD63EEA9850), *Integration on complex Grassmannians, deformed monotone Hurwitz numbers, and interlacing phenomena*, appeared online June 30, 2025, DOI [10.4153/S0008414X25101168](https://doi.org/10.4153/S0008414X25101168). Its preprint is [arXiv:2308.04015](https://arxiv.org/abs/2308.04015).

I independently read Definition 3.1, Proposition 3.3, and the root discussion containing Conjectures 3.13–3.15 and Figures 2–3. Conjecture 3.15 fixes an arbitrary positive profile and asserts genus-asymptotic root limits, followed by the stated direction of monotone convergence on either side of −1. Its monotonicity sentence has no explicit starting-genus qualifier. Figure 3 illustrates genera 10 through 20; that illustration does not impose a hypothesis on the conjecture. The manuscript therefore states exactly the tail theorem it proves and retains the scope distinction.

The character formula used in the proof is a theorem of the source. The all-genus real-rootedness and profile-increment interlacing statements are separate Conjectures 3.13–3.14. An eventual root theorem does not establish them.

## 2. Earlier primary sources and the initial reversal

[Ellena Moskovsky's 2022 doctoral thesis](https://inspirehep.net/files/76c60abef78363928c5c00e2f01417b6), *Enumerative geometry, topological recursion, and the semi-infinite wedge*, was inspected at the title and declaration pages, Chapter 8's representation formula, Sections 8.2.5–8.3, and the relevant data tables in Section 8.4. These sections state real-rootedness and profile-increment interlacing conjectures, explain obstacles to extending the classical Narayana argument, and discuss further enumerative questions. No genus-asymptotic root theorem appears in the inspected sections. This is not represented as a line-by-line reading of the entire thesis.

Printed pages 157–158, PDF pages 168–169, already contain

```math
4H_0(t)=4t^3+10t^2+4t,\qquad
4H_1(t)=50t^3+128t^2+50t
```

for the profile $`(2,2)`$. The same two entries appear on page 5 of the authors' [MATRIX note](https://www.matrix-inst.org.au/wp_Matrix2016/wp-content/uploads/2023/07/Coulter.pdf), *Topological Narayana polynomials and interlacing conjectures*. I read that five-page note, including its definitions, recursions, conjectures, and table. It states the real-rootedness and profile-interlacing conjectures, not a genus-asymptotic assertion.

The first nonzero smallest roots of these already published polynomials are

```math
-2,\qquad \frac{-32-\sqrt{399}}{25}<-2.
```

Thus the genus-zero-to-one reversal follows from existing data by the quadratic formula. It is useful for documenting the scope issue, but supplies no new finite-case credit. The possible new contribution in this directory is the theorem for every fixed profile, including the exact second dominant term and the eventual direction of convergence.

## 3. Later and related papers

| Source read | Actual scope relevant to this audit | Relation to the present theorem |
|---|---|---|
| [Coulter–Do, arXiv:2506.04002v1](https://arxiv.org/html/2506.04002v1), introduction and Section 4.3 | Two-parameter $`bt`$ deformation; real-rootedness and profile-increment interlacing are again conjectural | No root-limit or eventual-monotonicity theorem is given in those sections; full-text search for “asymptot” returned no match |
| [Fesler–Hahn–Karev–Markwig, arXiv:2508.06188v1](https://arxiv.org/html/2508.06188v1), introduction and main-results discussion | Refined Jucys–Murphy actions, centrality, self-adjointness, tropical interpretations, and polynomiality | Its stated partial resolution concerns operator Conjecture 5.4 of Coulter–Do, a different assertion; full-text searches for “root” and “asymptot” returned no match |
| [Barazer–Louf, arXiv:2604.01190v1](https://arxiv.org/pdf/2604.01190), introduction and Theorem 1 | One-part undeformed monotone Hurwitz numbers, with size tending to infinity and varying genus | This is scalar enumeration at $`t=1`$, not zeros of the deformation polynomial at fixed arbitrary profile |

The last paper is a substantive high-genus asymptotic result, so a title-only exclusion would have been inadequate. Its definition of the scalar quantity and its main theorem were read directly. No deformation parameter is present in that theorem. None of the three papers is claimed to have been checked line by line in full.

The current [SymCat page](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) reproduces the separate real-rootedness/interlacing statements, not a resolution of the genus limits. [MathDB 359426](https://mathdb.com/p/359426/genus-asymptotic-roots-conjecture-for-deformed-monotone-hurw) lists the asymptotic question with no posted solution. These are discovery aids, not authoritative proof of present open status.

## 4. Repository and global issue searches

All three comments of the repo's [issue 88](https://github.com/1337isnot1337/solved-conjectures/issues/88) were read. They document a parameter reduction and bounded diagnostic checks for the different $`bt`$ root conjectures, followed by an explicit unresolved status. They contain no prior genus-asymptotic theorem.

Fresh global GitHub issue searches used the following terms; counts describe the search snapshot, not permanent totals.

| Query, with `is:issue` | Result |
|---|---|
| `"2308.04015"` | One hit, our issue 193 |
| `"Coulter" "Moskovsky"` | Two hits, our issues 193 and 156 |
| `"deformed monotone" "roots"` | One hit, our issue 193 |
| `"topological Narayana"` | No hits |
| `"mathdb-359426"` | No hits |
| `"S0008414X25101168"` | No hits |
| `"Coulter" "3.15"` | Our issue 193 and an unrelated imaging-data issue |
| `"deformed monotone"` | Our issue 193 and the operator problem in trureturing issue 17676 |
| `"monotone Hurwitz" "limit"` | Our issue 193 and two operator-problem issues |
| `"Coulter" repo:the-omega-institute/trureturing` | Three issues, all concerning operator Conjectures 5.4 or 5.8 |

The full body of [trureturing issue 17676](https://github.com/the-omega-institute/trureturing/issues/17676) was read. Its target is a Laplace–Beltrami identity for deformed Jucys–Murphy operators; its discussion of [issues 11521](https://github.com/the-omega-institute/trureturing/issues/11521) and [12182](https://github.com/the-omega-institute/trureturing/issues/12182) concerns noncommutation. These do not resolve the polynomial root-limit question.

Broader searches for Hurwitz with roots, genus, or asymptotic returned many unrelated uses of Hurwitz stability, Hurwitz's theorem, and Hurwitz zeta functions. The 55 results for Hurwitz/root/genus, 61 for Hurwitz/roots/asymptotic, and all 156 results across two pages for Hurwitz/asymptotic were screened by titles and targeted body passages. No external exact root-limit claim was identified. This screening is not a full reading of all their linked papers or comment histories.

One bulk hit was [TauCetiReviewSite issue 1](https://github.com/TauCetiProject/TauCetiReviewSite/issues/1). All 2,500 current comment bodies, fetched in the preceding independent priority audit, were searched for the authors, source identifier, MathDB identifier, topological Narayana, and monotone Hurwitz. There were no matches.

The bare numeric query 359426 was noisy and was replaced by exact problem phrases and the qualified identifier; its first 100 of 136 results are not treated as a complete corpus audit.

## 5. Public proof corpora and web coverage

The [Principia public archive manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/main/site-backup/MANIFEST.json), blob `e258a2e1f173e03f393d701950a72327ef389f72`, contained 493 file records for 249 projects in the inspected snapshot. It was screened across titles, identifiers, and filenames for Coulter, Moskovsky, Hurwitz, Narayana, and 359426. No exact target appeared. The only broad-name hits concerned Narayana-related integrality or unrelated Hurwitz-stability questions.

The [KnowledgeSense preprint inventory](https://github.com/KnowledgeSense/math/tree/main/preprints), 56 directories in the inspected snapshot, had no target-name or subject match. These are inventory-level exclusions, not full-text searches of every archived manuscript.

Both built-in web engines were used, with exact author/title/source-number queries and broader combinations of deformation, monotone Hurwitz, genus, root limits, limiting polynomials, convergence, monotonicity, dominant poles, proofs, and counterexamples. Date-filtered recent searches were included. The concrete high-genus paper and the older thesis lead were followed as described above; a lack of search hits alone was not used to discard them.

Global GitHub code search was unavailable under the shared quota and was not retried. No exhaustive full-text search of every public proof repository is claimed. Unindexed manuscripts, newly changed files, and differently titled results remain possible.

## Conclusion

No earlier all-profile genus-asymptotic root theorem or eventual-monotonicity proof was located in this review. The research manuscript remains a potentially new, internally audited general theorem within those explicit search limits. It remains outside the completed-conjecture tally because the source-scope distinction is being preserved. The genus-zero reversal is credited to existing 2022 polynomial data, and the source character formula remains a credited input.
