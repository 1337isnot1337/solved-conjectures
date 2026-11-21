# Pula–Song–Wanless conjecture: further priority audit

Date: 20 November 2026 (America/Chicago). Coordination: [issue 142](https://github.com/1337isnot1337/solved-conjectures/issues/142).

This adds new citation tracing and alternate-notation checks to the existing
[source audit](source-audit.md). It does not repeat the mathematical
review or the already completed full readings of the 2011, 2013, and 2024
closest papers. No numerical cases or proof tests were run in this pass.

## Exact priority question

The proposed result concerns


```math
V_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&J_m\end{pmatrix},
```


with positive integer $`m`$ and integer $`n>1`$. The remaining priority question
is whether an earlier work proves the entire noncohesive range
$`n\ge m+\sqrt m`$, including equality, and the uniqueness on the full face
$`\Omega(V_{m,n})`$ of


```math
A_0=\begin{pmatrix}(n-m)I_n/n&J_{n,m}/n\\J_{m,n}/n&0_m\end{pmatrix}.
```


The previously known cohesive direction, non-barycentricity, and results on
the smaller face with the zero lower-right block are not new claims.

**Finding:** this additional pass did not locate an earlier matching full
threshold or full-face uniqueness theorem. This remains a bounded search
finding, not an exhaustive novelty certificate. The access limits below are
part of the finding.

## 1. Alternate notation: the Hwang–Lee boundary face

S.-G. Hwang and E.-Y. Lee, *Permanents of doubly stochastic matrices with
diagonal submatrices of fixed order*, Linear Algebra and its Applications
376 (2004), 97–108. [DOI](https://doi.org/10.1016/j.laa.2003.06.006).
[Retrieved article text](https://www.academia.edu/27402370/Permanents_of_doubly_stochastic_matrices_with_diagonal_submatrices_of_fixed_order).

The article uses


```math
D_{r,n}=\begin{pmatrix}0_r&J\\J&I_n\end{pmatrix},\qquad n\ge r+1.
```


A simultaneous block permutation identifies this with $`U_{r,n}`$, the
zero-block boundary support, rather than $`V_{r,n}`$. The abstract,
introduction, Theorem 6, and Theorem 7 were read in the retrieved article
text. Theorem 6 gives local minimality of the barycenter. Theorem 7 says a
global minimizer satisfying
$`a_{ii}\le(n-r)/(n-1)`$ on the identity block must be the barycenter. The
paragraph following Theorem 6 explicitly leaves general global minimality
unsettled, apart from $`r\le3`$ and $`r=n-1`$.

This source therefore supplies neither the full $`V`$-face threshold nor
its equality case. Its alternate notation is now accounted for. The direct
publisher page was inaccessible during this pass; the article text was
available through the linked author-paper host.

## 2. New forward-citation lead: Dulio–Laeng, 2025

P. Dulio and E. Laeng, *Best constants for the $`l^p`$ inequalities associated
to some particular matrices*, Results in Mathematics 80 (2025), article 176.
[DOI](https://doi.org/10.1007/s00025-025-02487-2).
[University repository](https://re.public.polimi.it/handle/11311/1298646).
[Publisher-version PDF in that repository](https://re.public.polimi.it/retrieve/c46a9548-8f13-4b5e-925f-4890d2550d16/Versione_Pubblicata_Online.pdf).

This appeared as a citation to Song–Beasley. The complete 19-page PDF was
accessible. Its abstract, introduction, operator-norm statements, and the
Song–Beasley citation context were inspected. The subject is sharp matrix
operator norms. On PDF page 8, Song–Beasley is reference [32] in a general
list of work about the Birkhoff polytope. The retrieved citation context
contains no permanent-minimum threshold, boundary minimizer, or PSW
uniqueness claim. This is a general background citation, not evidence of a
later threshold solution. The whole article was not independently reviewed
for mathematical correctness.

## 3. New forward-citation lead: Singh–Morneau-Guérin, 2026

S. Singh and F. Morneau-Guérin, *Arithmetic complexity of Erdős matrices*,
Linear Algebra and its Applications, available online 26 August 2026.
[DOI](https://doi.org/10.1016/j.laa.2026.08.031).
[Primary publisher record](https://www.sciencedirect.com/science/article/pii/S0024379526003502).

The publisher's indexed abstract, introduction, section outline, and main
theorem snippet were retrieved. The paper concerns denominator growth for
equality cases of the Marcus–Ree inequality, with graph-Laplacian and
Smith-normal-form arguments. Its accessible statements do not claim a
permanent-minimum threshold for $`V_{m,n}`$.

The full article was not retrieved. Direct opening returned HTTP 403;
targeted searches for the exact title, a PDF, and a copy in the author's
institutional repository did not supply one. Consequently this is an
abstract/introduction-level scope check, not a full-paper exclusion. Only the accessible statements were checked; the inaccessible full text remains a search limit.

## 4. Citation-index metadata collision

The following [SciSpace record](https://scispace.com/papers/minimum-permanents-on-two-faces-of-the-polytope-of-doubly-22zm5qspsm)
merges different papers. It displays the PSW title and the authors Pula,
Song, and Wanless, but assigns the year 1997, volume 259, pages 169–182,
and DOI `10.1016/S0024-3795(96)00248-0`.

Those bibliographic fields belong to Song, Hong, Jun, and Kim,
*Minimum permanents on a face of the polytope of doubly stochastic
matrices*. The journal's own [2024 reference list](https://articles.math.cas.cz/10.21136/CMJ.2023.0186-23)
separately identifies both this 1997 article and PSW2011 with its correct
DOI `10.1016/j.laa.2010.08.015`.

The merged record's citation list includes papers from 2002 and 2004.
It is therefore unsuitable as a clean forward-citation list for PSW2011.
It was used only to obtain titles, then checked against primary work.
The Hwang–Lee paper above was one such lead. Neither this index's citation
count nor its automated summary is evidence for the priority conclusion.

## 5. Other title collisions and access limits

- Song, *Minimum permanents on certain doubly stochastic matrices*, LAA
  143 (1991), 49–56, [DOI](https://doi.org/10.1016/0024-3795(91)90005-H):
  the indexed primary abstract specifies faces of order $`n+2`$ containing
  an identity submatrix of order $`n`$. This is a fixed complementary-block
  case, not an arbitrary-$`m`$ theorem. The direct publisher page returned
  HTTP 403. No claim of a full-paper reading is made.
- Song, Hwang, and Cheon, *Minimum Permanents on a Face of the Polytope of
  Doubly Stochastic Matrices II*, LMA 50 (2002), 101–111,
  [DOI](https://doi.org/10.1080/03081080290019603): the indexed primary
  abstract likewise specifies order $`n+3`$ and an identity submatrix of
  order $`n`$. This is another fixed-block predecessor. Its direct
  publisher page returned HTTP 403.
- Song, *Minimum permanents on certain faces of matrices containing an
  identity submatrix*, LAA 108 (1988), 263–280,
  [DOI](https://doi.org/10.1016/0024-3795(88)90192-9): the publisher abstract
  was retrieved, but its description of selected faces does not establish
  their full parameter ranges. A full copy was not located in this pass.
  It must not be represented as fully checked here.
- Subramanian and Somasundaram, *Some Conjectures on Permanents of Doubly
  Stochastic Matrices*, Journal of Discrete Mathematical Sciences and
  Cryptography 19 (2016), 997–1011,
  [DOI](https://doi.org/10.1080/09720529.2015.1130813),
  [author-institution abstract](https://www.amrita.edu/publication/some-conjectures-on-permanents-of-doubly-stochastic-matrices/):
  the accessible abstract concerns radial subpermanent inequalities. It
  does not identify a result about this prescribed support. Full text was
  not read.

The inaccessible full text of Song–Beasley remains the more relevant limit
already stated in the main audit. Renewed exact-title and DOI searches
found the publisher abstract and the same professional review, but no
new full copy. No claim is made that its theorems apply when the review's
positive parameter $`\ell`$ is set to zero.

## Search coverage and interpretation

Two search engines were used. Search strings included the exact PSW,
Hwang–Lee, and Song–Beasley titles and DOIs; `V_{m,n}`, `D_{r,n}`,
`m+sqrt(m)`, `m+√m`, and `square root` combined with permanent, cohesive,
barycenter, uniqueness, and boundary; and exact-author searches with known
hosts excluded. Current-literature checks included recency-filtered
searches for 2025–2026 and the new forward citations above. Citation-index
results were treated as pointers and checked against available primary
text. Queries yielding only irrelevant uses of the notation provide no
mathematical evidence.

The search adds an alternate-notation exclusion, two later citation scope
checks, a metadata-error warning, and explicit additional access limits.
It changes neither the mathematical claim nor the count of complete
numbered Minc-list resolutions. It does not turn the absence of a located
counterexample to novelty into a proof of historical priority.
