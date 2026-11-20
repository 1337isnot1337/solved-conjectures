# Source and prior-resolution audit

Audit date: 20 November 2026.

## Current conclusion

The written proof establishes the complete coefficient-positivity
assertion in Section 4.4 of Baricz and Pogány's 2023 paper. Independent
mathematical review has passed. Searches and the inspected primary texts
have not located an earlier proof or disproof of that exact assertion.
This is a bounded literature conclusion, not a claim that every public
or unpublished source has been checked.

One material access limit remains: Baricz's current publication page
lists an unlinked submitted paper on the four-parameter generalized
Kaiser–Bessel distribution. Its full text was not located, and this
audit makes no claim about what it proves. Final promotion is pending
the parent review of this audit and the expanded public-solution-archive
screen below.

## 1. Exact primary statement

Á. Baricz and T. K. Pogány, *Probabilistic and Analytical Aspects of the
Symmetric and Generalized Kaiser–Bessel Window Function*, *Constructive
Approximation* 58 (2023), 713–783, published online 2 March 2023:

- [Publisher full text and DOI](https://link.springer.com/article/10.1007/s00365-023-09627-3).
- The unnumbered conjecture is in Section 4.4, printed page 750.
- Equations (3.5)–(3.6) give the standard large-argument Bessel expansion
  and its coefficient product.
- Section 4.4 defines the quotient coefficients by an explicit recurrence,
  prints degrees two through six, and conjectures strict positivity in
  every degree at least two for every real order of absolute value less
  than one half.

The candidate uses exactly those coefficients and the whole stated
parameter range. Its lower bound strengthens the conjectured strict
positivity. The proof does not claim a new pointwise Bessel inequality
or convergence of a divergent asymptotic expansion.

The repository title identifies the authors and this specific assertion.
The paper does not assign the assertion a separate formal name or number.

## 2. Closest earlier analytical source

Z.-H. Yang and J.-F. Tian, *Convexity of ratios of the modified Bessel
functions of the first kind with applications*, *Revista Matemática
Complutense* 36 (2023), 799–825; online 9 August 2022:

- [Publisher record](https://link.springer.com/article/10.1007/s13163-022-00439-w).
- [Complete primary article in PMC](https://pmc.ncbi.nlm.nih.gov/articles/PMC9361280/).

The complete article was accessed. Section 2.2, especially equation
(2.19) and Lemma 3, contains the quotient recurrence and an expansion
through the inverse-square term. These are prior ingredients.
The main results concern convexity of an adjacent-order Bessel ratio,
concavity after changes of variable, and pointwise bounds. Its final
conjectures concern other derivative and complete-monotonicity
properties. No assertion proving every coefficient larger than the
corresponding power was located in that text.

The source paper itself already states the recurrence used here. No
novelty is claimed for the recurrence, the classical Bessel coefficient
product, formal power-series division, or the geometric-series inverse.
The proposed contribution is the coefficientwise positive factorization
which proves the full conjectured comparison.

## 3. Current author records and the inaccessible follow-up

The current [Baricz publication list](https://sites.google.com/site/bariczocsi/publications)
and [Pogány institutional publication record](https://portal.uniri.hr/portfelj/1281)
were inspected.

Baricz's page lists *Properties of the four-parameter generalized
Kaiser-Bessel distribution*, with D. Jankov Maširević, T. K. Pogány,
L. Teofanov, and N. Ujić, as submitted to *Constructive Mathematical
Analysis*. The entry has no manuscript link. Exact-title searches,
coauthor searches, and journal-domain searches with both web engines
located the listing but no public abstract or full manuscript.

This is a nearby follow-up by the original authors, so its unknown scope
is recorded explicitly. The absence of a public file is not evidence
that it leaves the coefficient assertion open. No correspondence was
sent to the authors.

Other current author entries on Bessel distribution properties,
asymptotic expansions for geometric radii, and zeros of derivatives did
not yield an exact resolution in the inspected records. Records and
titles alone are not treated as mathematical exclusions of uninspected
full papers.

## 4. Public solution archives

The archive screen was expanded after an exact earlier solution to
Ulgenes's inverse-gamma Newton-series conjecture was found in a public
solution body despite ordinary web searches finding no resolution.
Author-name searches and database status labels alone are insufficient.
For this target the screen therefore includes exact source identifiers,
distinctive coefficient terminology, archive catalogues, and full bodies
of the closest matches.

### Principia Math

Inspected [PrincipiaMathOrg/math-solutions](https://github.com/PrincipiaMathOrg/math-solutions)
at commit 47371706c400c79d06e3fb62190fcf6f7a725c85:

- The complete [site-backup manifest](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/MANIFEST.json)
  was fetched and its 493 records screened. Its blob is
  e258a2e1f173e03f393d701950a72327ef389f72.
- The complete MathDB catalogue was read.
- Repository code searches used Kaiser, Pogany, Pogány, Baricz,
  asymptotic-coefficient, and Bessel, together with the source DOI.
  The Bessel search returned 45 files; mathematical prose matches were
  distinguished from unrelated numerical libraries and Fourier
  inequalities. No proof-assistant work was undertaken.
- The complete [MathDB 321003 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-321003/mathdb-321003-solution.tex)
  proves increasing minima of a normalized Turán expression for the
  ordinary Bessel function J. It concerns a different conjecture of
  Baricz, repeated with Pogány in an older paper.
- The complete [MathDB 345410 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-345410/mathdb-345410-solution.tex)
  concerns variance-gamma medians and an adjacent-order K-Bessel ratio.
- The complete [MathDB 345411 solution](https://github.com/PrincipiaMathOrg/math-solutions/blob/47371706c400c79d06e3fb62190fcf6f7a725c85/site-backup/mathdb-345411/mathdb-345411-solution.tex)
  concerns McKay medians. Its I-Bessel lemma is a pointwise adjacent-order
  ratio bound, not the all-degree asymptotic-coefficient assertion.

None of these full bodies resolves the present statement. Other Bessel
matches concern zeros, q-Bessel coefficient denominators, a truncated
kernel, an integral inequality, or a Euclidean-ball asymptotic.

### Knowledge Sense

The complete [README](https://github.com/KnowledgeSense/math/blob/b95a52a54597e8b01c1a28486f2a9b29a3a54c58/README.md)
and [contents](https://github.com/KnowledgeSense/math/blob/b95a52a54597e8b01c1a28486f2a9b29a3a54c58/CONTENTS.md)
of KnowledgeSense/math were read at commit
b95a52a54597e8b01c1a28486f2a9b29a3a54c58.
Kaiser and Pog searches returned no matching files. Bessel matches were
unrelated Fourier Bessel inequalities. Searches for the coefficient
notation returned q-Charlier and oscillatory orthogonal-polynomial
recurrences. The catalogue has no entry for the present assertion.

### Pudim and Trure

The complete Pudim application catalogue was fetched at blob
4f5f4a47f4ad858198fc790f78bfebf073636e9e. Its Bessel entries were screened.
The most plausible generic positivity lead, APP0060, was checked in the
full theory text: it refutes a coefficient-ratio complete-monotonicity
transfer assertion from Baricz's 2010 paper using a different pair of
power series. It does not address the present asymptotic coefficients.
The theory text had no Kaiser or Pogány match.

Repository searches covering the public Trure sources and Pudim used
Kaiser and the author/statement terminology. No exact resolution was
located. This is an archive search result, not a claim to have read every
document in those collections.

### Global source and formula searches

Global GitHub code searches for the full DOI
10.1007/s00365-023-09627-3 and its distinctive suffix returned no matching
file. This included an exact quoted DOI suffix combined with the
coefficient terminology, rather than only an unquoted identifier search.
Global searches combining Kaiser–Bessel with conjecture and Bessel
with pi_n or alpha_n were also screened. The latter generic notation
queries reached a 100-result cap and were dominated by numerical
libraries, unrelated zeros, and signal processing. They are explicitly
incomplete and are not treated as exhaustive negative evidence.

The sampling-window shape-parameter conjecture and its public solution
claims concern approximation-error optimization, a different assertion.
No inference about coefficient positivity is drawn from those titles.

### CoPEER and the editable source corpus

The [CoPEER repository](https://github.com/qqliu/CoPEER) was checked at
commit 105523fdaf018b62eaf2883347724dfe79935611. The complete repository
README, discovery README, and twelve-record discovery index were read.
Bessel code search returned no match; Kaiser returned only an unrelated
author name in a bibliography. The larger 661-entry retrieval snapshot
could not be inspected through the contents API, which returned empty
content. No claim is made to have read that snapshot.

The [editable source corpus](https://github.com/AlexenderSokolov/cross-theory-formal-database)
was also searched at commit 3b9207c03d9dc146f393f68bcb683bbc4583979a.
Its exact quoted Kaiser–Bessel and source-DOI searches returned no match.
The broad Bessel search reached its 100-result cap and is not exhaustive.

The closest result was Salazar's *Riccati Reductions for Modified Bessel
Ratios: Bernstein Positivity, Exact Certificates, and Transfer
Obstructions*, arXiv:2607.05538v1. The
[archived primary source](https://github.com/AlexenderSokolov/cross-theory-formal-database/blob/3b9207c03d9dc146f393f68bcb683bbc4583979a/editable-corpus/sources/204547/source0.tex)
was fetched. Its abstract, main-result table, and all conjecture and
asymptotic-coefficient loci were inspected. It proves the Yang–Tian
Bernstein property, addresses Baricz–Ponnusamy–Vuorinen questions, and
refutes Baricz's older complete-monotonicity transfer assertion. It does
not state the present all-degree coefficient comparison. Its pointwise
Bernstein property is not a coefficientwise asymptotic-series theorem.

## 5. Web search coverage

Both available search engines were used. Representative queries included:

- Baricz Pogány coefficients conjecture;
- Kaiser Bessel pi_n conjecture;
- Kaiser–Bessel Window conjecture proof;
- Bessel quotient asymptotic coefficients positivity;
- the exact paper title with conjecture, proof, solved, and resolution;
- the DOI with proof and conjecture;
- the exact submitted follow-up title and its coauthors;
- MathDB, Trure, GitHub, and author-site restrictions.

The searches covered current records as of the audit date and related
2024–2026 material. The inspected results did not supply an earlier exact
resolution. Search-index coverage is incomplete; unpublished work and
unavailable manuscripts are outside this conclusion.

## 6. Review and diagnostic status

The [independent analysis audit](AUDIT-ANALYSIS.md) checks the exact primary
statement, coefficient products, telescoping signs, formal inverse,
identity, and strict lower bound. It reports no mathematical gap.
It was committed at f42fe35c0ffaec2661ea0bf5a448c5f29bcf8c9e.

The exact diagnostic in [verify.py](verify.py) separately constructs the
source product coefficients, uses the source quotient recurrence, and
compares the positive identity. It checks every printed coefficient
through degree six at seven rational parameters. Its result is:
455 exact identities, 49 source fixtures, and 105 strict lower bounds
passed. These finite checks are supporting diagnostics, not the proof.

The mathematical conclusion and the prior-resolution conclusion are
separate. The latter remains bounded by the searches and explicit access
limits recorded above.
