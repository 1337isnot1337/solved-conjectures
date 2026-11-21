# Audit of Minc Problems 8, 11, 12, and 13

Research checkpoint: 20 November 2026, America/Chicago. No full resolution or new theorem is claimed.

## Scope of the remaining questions

The live pages were read directly, with the 2005 Cheon–Wanless survey checked against them. The survey is at https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf , DOI https://doi.org/10.1016/j.laa.2005.02.030 . Its Problems 8 and 11–13 occur on printed pages 335–337.

| Entry | Full remaining target | Why the apparent shorter task does not close it |
| --- | --- | --- |
| [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html) | Describe boundary doubly stochastic matrices A for which per((1−t)J+tA) is increasing on [0,1]. | The current page already covers all row- or column-transitive matrices, hence circulants and finite-group matrices. Nonmonotone examples are already known in every order at least nine. |
| [Problem 11](https://yair-lavi.com/mincs-list/problem-11/index.html) | Determine the pairs (n,k) for which a k-regular binary matrix has permanent below every circulant with the same parameters. | Fixed-degree and fixed-complement-degree existence for all sufficiently large orders is already available. Another threshold or finite pair would not give the all-pair classification. |
| [Problem 12](https://yair-lavi.com/mincs-list/problem-12/index.html) | Determine which parameter pairs admit a regular binary matrix above every circulant. | Its other request, an explicit circulant upper bound strictly below Brègman when k does not divide n, already has a general bound on the live page. |
| [Problem 13](https://yair-lavi.com/mincs-list/problem-13/index.html) | Determine the exact largest Frobenius radius around J on the real line-sum-one affine space where the van der Waerden lower bound holds. | Exact orders three and four are already on the page. The repository also has an all-order lower bound of order n^(−1/2); a new bound would not determine the sharp radius. |

The live Problem 13 page specifies the Frobenius norm as its convention, while noting that the historical catalogue did not specify the norm. This convention must remain explicit.

## Problem 8 reductions already blocked in the repository

The Bernstein expansion is already recorded in `research/minc/sign-matrices/boundary_monotonicity.md`. With

```math
a_k=\frac{n^k\sigma_k(A)}{k!\binom nk^2},\qquad d_n=\frac{n!}{n^n},
```

it reads

```math
\operatorname{per}((1-t)J+tA)
=d_n\sum_{k=0}^n\binom nk a_k t^k(1-t)^{n-k}.
```

Coefficientwise increase of the sequence a_k is sufficient, but not necessary, for monotonicity of the polynomial. This does not provide a characterization by coefficient signs.

The newer repository note `research/minc/combinatorial/boundary_endpoint_obstruction.md` proves that even a strictly positive derivative at t=1 does not suffice. It uses a core with a large ratio of near-perfect to perfect matching counts, doubles that core by direct sum, and perturbs the core parameter. The resulting boundary matrix has positive derivative at one and a negative derivative at an interior point. This also excludes a universal single-turning-point argument.

The required core is supplied by I. M. Wanless, *The Holens–Đoković conjecture on permanents fails!*, Linear Algebra and its Applications 286 (1999), 273–285, https://users.monash.edu.au/~iwanless/papers/HolDjokLAA.pdf , DOI https://doi.org/10.1016/S0024-3795(98)10177-5 . The present audit does not reproduce that repository result as a new advance.

A generic univariate nonnegativity test, Sturm procedure, or sum-of-squares formulation applied to the radial derivative is an exact decision method after all subpermanents are known. It does not supply the missing structural description of matrices and is not counted as solving Problem 8.

## Additional prior-art lead for the transitive examples

Dmitry Falikman published *The permanent of a class of matrices associated with a finite group*, Linear and Multilinear Algebra **42**(4) (1997), 323–347. The bibliographic record is independently visible in the journal bibliography at https://ftp.math.utah.edu/pub/tex/bib/toc/linmultalgebra.html and in the references displayed at https://www.mathnet.ru/paperfwl/rus/mzm6253/3 .

An indexed abstract, displayed in the citing-paper list at https://www.researchgate.net/publication/233223174_Monotonicity_of_permanents_of_doubly_stochastic_matrices , explicitly describes monotonicity for every subpermanent sum of a finite-group construction and states that the class includes all doubly stochastic circulants. This is a concrete priority lead for the live page's finite-group and circulant examples. The full 1997 paper and primary publisher abstract were not retrieved in this branch. Its precise hypotheses and proof have therefore not been independently reviewed here. Do not label the finite-group theorem new without checking this paper.

## Problems 11 and 12: primary structural literature

The following primary papers were opened and their displayed statements checked:

1. I. M. Wanless, *Maximising the permanent and complementary permanent of (0,1)-matrices with constant line sum*, Discrete Mathematics **205** (1999), 191–205, https://users.monash.edu.au/~iwanless/papers/complementDM.pdf , DOI https://doi.org/10.1016/S0012-365X(99)00048-5 . For fixed degree and sufficiently large order it proves bounded component size for maximizers, with fewer than k components different from the k-by-k all-ones block, and eventual stability under adjoining such a block. The thresholds and exceptional components are not an all-parameter answer to Problem 12.
2. I. M. Wanless, *A lower bound on the maximum permanent in Λ_n^k*, Linear Algebra and its Applications **373** (2003), 153–167, https://users.monash.edu.au/~iwanless/papers/pohang.LAA.pdf , DOI https://doi.org/10.1016/S0024-3795(02)00715-2 . If n=tk+r, 0≤r<k, it gives a lower bound (k!)^t r! and derives asymptotics and component restrictions. Comparing this bound with a strict circulant upper bound produces existence regimes, not an exact classification for every n,k.

The current Problem 11 page already states eventual beaters for each fixed k≥3, the broader sparse regime k^3 log n=o(n), and dense-complement beaters whenever n≥16r^3 with r=n−k≥3. These leave a substantial range of parameter pairs. No argument found here fills that range or identifies every exceptional pair.

## Problem 13: no reduction to the existing bound

The repository note `research/minc/sinkhorn_frobenius_radius.md` gives an all-order radius through a zero-margin subpermanent estimate. It does not give a sharp upper construction with the same radius. The live page's sharper small-order values also show that extending a numerical sequence would be a finite-order improvement, which is outside the present task's scope.

The sharp-radius problem is a constrained polynomial optimization problem. An elimination formula that merely enumerates all critical points does not identify the minimizing geometry and would be a generic restatement, not a substantive closure of the named problem.

## Outcome

No overlooked tractable full entry was found in these four targets. Both search engines were used for exact titles, authors, monotonicity characterizations, circulant extrema, and real Sinkhorn neighborhoods. The current catalogue and the cited primary literature remain consistent with the full questions being unresolved. This is a bounded literature audit, not proof of absence of unpublished work. Work now returns to a different all-order construction for Problem 7.
