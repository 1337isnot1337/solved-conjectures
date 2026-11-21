# Source audit for the centered coefficient bound

Date: 2026-11-20 (America/Chicago).

This is a targeted literature-search record, not a certificate of novelty.
The accompanying [proof](centered_permanental_coefficients.md) establishes
its estimate directly. No full problem from Minc's list is claimed solved
by that estimate or by this search.

## 1. The statement being compared

The question for prior art is whether an existing result gives absolute
constants independent of the order and degree, bounding the sum of all
permanental minors of a matrix with zero row and column sums by an
exponential in the degree times the corresponding power of its Frobenius
norm. The proved estimate here additionally bounds the entire absolute
coefficient generating function by an exponential of the squared
Frobenius norm inside an absolute operator-norm radius.

The Gaussian reformulation is an upper bound for the squared norm of
the product of affine factors with a proper complex Gaussian input whose
coordinates sum to zero. This cancellation condition matters: generic
product bounds can introduce a trace term that depends on dimension.

## 2. Search coverage

Both available web search engines were used. Query groups included:

- permanent, Frobenius norm, neighborhood, uniform bound, zero-free;
- centered or doubly centered matrix, zero margins, zero row sums,
  subpermanent coefficients;
- Gaussian product, Wick product, Hilbert-Schmidt covariance, canonical
  product, holomorphic functions;
- exact titles of Roos's approximation papers, Sinkhorn's neighborhood
  paper, and Gaussian product references.

Primary papers and author-hosted manuscripts were preferred. Search
summaries and aggregators were used to find papers, not to establish the
content of a theorem. The distinction between a complete source read,
a relevant section read, and an abstract-only lead is recorded below.

## 3. Sources examined

### Roos: approximation through centered columns

[B. Roos, On Bobkov's approximate de Finetti representation via
approximation of permanents of complex rectangular matrices,
arXiv:1203.2871v2](https://arxiv.org/pdf/1203.2871).

Read Lemmas 2.1, 2.2, 2.5 and Theorem 2.8, with their displayed estimates
and proofs. Lemma 2.2 assumes zero column sums and uses a symmetric
multilinear-form theorem and Cauchy's formula. Theorem 2.8 gives
higher-order normalized-permanent approximation under an entry bound,
with its stated parameter gamma. These are relevant prior methods.
No dimension-independent, two-sided-centered Frobenius coefficient bound
was identified in the portions examined. A new derivation from the full
collection of Roos's results has not been ruled out.

[B. Roos, New permanent approximation inequalities via identities,
arXiv:1612.03702v3](https://arxiv.org/html/1612.03702v3).

Read the introduction, the earlier higher-order bounds it reproduces,
the definitions of its approximation parameters, and its main-result
descriptions. The paper supplies explicit normalized-permanent
approximation inequalities and second-order refinements. The previously
quoted higher-order theorem uses column averages and a gamma parameter.
It is not presented there in the form of the estimate proved in this
repository. That observation is narrower than a non-implication claim.

### Roos: coefficients of products of linear forms

[B. Roos, Generalization of a Hadamard type inequality for permanents,
arXiv:1709.05225v2](https://arxiv.org/html/1709.05225v2).

Read the main-result introduction and Section 2, including Theorem 2.1.
The coefficient estimate there uses products of averages of squared
entries over subsets. It applies without the two zero-margin
conditions. No direct reduction to the present uniform centered
generating-function bound was found.

### McCullagh: centered expansions and determinant approximation

[P. McCullagh, An asymptotic approximation for the permanent of a doubly
stochastic matrix, author-hosted manuscript dated 2 August
2012](https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf).

Read the moderate-deviation hypotheses and the centered expansion in
Sections 4.1-4.2. The expansion removes singleton blocks and gives
partition formulas with coefficients depending on block sizes. The
asymptotic statement assumes weak bounds for every entry moment of
the rescaled deviations, together with a spectral gap. A small
Frobenius norm of an arbitrary centered matrix does not by itself
state those hypotheses. The paper is an important prior source for
the partition expansion, which should not be presented as new.

### Lavi: an operator-norm subpermanent estimate

[Y. Lavi, The Marcus-Minc Transform Inequality,
arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1).

Read Section 3 and its tensor proof. Lemma 3.1 bounds each centered
subpermanent sum using the Frobenius norm squared and a coefficient
of the projection onto the zero-sum subspace, under an operator
contraction hypothesis. The projection coefficient depends on order.
Its one-factor isotropy and singular-value argument are prior art.
The displayed lemma is not the all-degree dimension-independent
Frobenius-power estimate proved here. No claim is made that every
possible consequence of the paper has been exhausted.

### Gaussian representations of permanents

[T. Mukerji and W.-S. Yang, Additive estimates of the permanent using
Gaussian fields, arXiv:2212.10672v2](https://arxiv.org/html/2212.10672v2).

Read the introduction and Theorems 1.2-1.5. The paper explicitly records
the relation between Wick products and permanents and uses a Gaussian
embedding to obtain additive estimation bounds. Thus the general
Gaussian/permanent representation is established prior machinery.
Its displayed variance bounds concern a different estimator and do
not state the centered affine-product upper bound at issue here.

[J. Arias-de-Reyna, Gaussian variables, polynomials and permanents,
Linear Algebra and its Applications 285 (1998),
107-114](https://www.sciencedirect.com/science/article/pii/S0024379598101258).

The publisher abstract and bibliographic record were retrieved.
They identify a Gaussian/permanent proof of a complex polynomial
polarization result. The full paper was not retrieved in this audit.
Its results are also discussed in the following accessible primary
paper.

[F. Barthe and D. Cordero-Erausquin, A Gaussian correlation inequality
for plurisubharmonic functions, author-hosted manuscript dated
14 May 2024](https://webusers.imj-prg.fr/~dario.cordero/Docs/articles/corr_psh_2.pdf).

Read the introduction and Theorems 1-3. These prove positive
correlation and lower product bounds for circular-invariant
plurisubharmonic functions and homogeneous holomorphic polynomials.
The theorem direction and hypotheses differ from the upper bound
for the nonhomogeneous affine product used here. This source confirms
that complex Gaussian products and permanent inequalities have a
substantial existing literature.

### Wick-product norm inequalities

[P. Da Pelo, A. Lanconelli and A. I. Stan, A sharp interpolation between
the Holder and Gaussian Young inequalities,
arXiv:1504.06156](https://arxiv.org/abs/1504.06156).

The primary abstract was retrieved; the attempted HTML full text was
unavailable. The work gives norm inequalities for an interpolation
between pointwise and Wick multiplication. Its possible consequences
for the particular centered affine product have not been fully
checked. This is an unresolved priority lead, not a source ruled out.

### Gaussian concentration inputs

[M. Ledoux, Concentration of measure and logarithmic Sobolev
inequalities](https://www.math.univ-toulouse.fr/~ledoux/Berlin.pdf),
published in Seminaire de Probabilites XXXIII (1999), 120-216.

The author-hosted notes and their Gaussian logarithmic-Sobolev and
Herbst statements were examined. Gaussian Poincare and Lipschitz
concentration are standard inputs, not new results of this work.
The specific rotation comparison needed in the proof is supplied
there independently rather than attributed as a new concentration
theorem.

### Random-matrix zero-free bounds

[F. Koehler and P. K. Leung, Approximating the Permanent of a Random
Matrix with Polynomially Small Mean: Zeros and Universality,
arXiv:2604.01367v1](https://arxiv.org/html/2604.01367v1).

Read the abstract, organization, and descriptions of its
random-matrix zero-free results. Its matrices have independent
mean-zero random entries before the bias is added. That probabilistic
centering differs from exact zero row and column sums. The long
paper was not read in full; no deterministic corollary covering every
matrix in the present Frobenius ball was identified in the sections
examined.

## 4. The relevant local-minimum literature

[R. Sinkhorn, A neighborhood in which the van der Waerden permanent
conjecture is valid, Linear and Multilinear Algebra 10 (1981),
217-221](https://doi.org/10.1080/03081088108817413), and
[J. B. Burghduff, Minimum permanents of doubly stochastic matrices
with zero main diagonal, Linear and Multilinear Algebra 40 (1995),
125-140](https://doi.org/10.1080/03081089508818428), are direct priority
leads for the later local-minimum applications. Their full texts
were not retrieved here.

The live catalogue's
[Problem 13](https://yair-lavi.com/mincs-list/problem-13/index.html)
and
[Conjecture 44](https://yair-lavi.com/mincs-list/conjecture-44/index.html)
pages were read in full. They report order-dependent radius bounds,
strict local minimality, and a shrinking confinement region. A catalogue
summary does not exclude stronger statements inside an inaccessible
paper.

## 5. Conclusion of this audit

No source examined here was found to state the exact uniform
generating-function estimate. That is the limit of the search result.
The Gaussian representation, concentration inequalities, partition
expansions, and tensor methods all have prior sources.

The proof may be used as a self-contained auxiliary theorem with those
inputs credited. It should not be labeled a novel theorem on the strength
of this search. The unresolved full-text leads above remain relevant
before any historical-priority claim.
