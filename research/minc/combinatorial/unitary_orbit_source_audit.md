# Maximum permanent on a unitary orbit: current source audit

Research date: 20 November 2026 (America/Chicago). No new formula for the general maximum is established here. This note records prior results that rule out several apparent new targets and identifies the remaining structural problem.

## Exact scope

[Minc Problem 1](https://yair-lavi.com/mincs-list/problem-1/index.html) asks for

```math
M_n(\lambda)=\max_{U\in\mathcal U_n}
\mathop{\mathrm{per}}(U^*\mathop{\mathrm{diag}}(\lambda)U)
```

for every nonnegative spectrum and arbitrary order. The live page remains marked open. A new fixed-order case, a special spectral family, or generic algebraic enumeration is not counted as a full solution in this campaign.

The page records the commutation condition with the permanental adjoint, the completed order-three problem, and necessary degeneracy conditions. Mehta's constant-diagonal maximizer assertion is already false. None is a usable new conjecture to count.

## A general algebraic prescription already exists

The public repository [OpenProblemsInNLA, MI-16](https://github.com/ajt60gaibb/OpenProblemsInNLA/tree/main/matrix-inequalities-and-norms/MI-16) contains Sidney Holden's dossier dated 12 September 2026, *An exact algebraic determination and a sharp exceptional-spectrum formula*.

Primary text inspected through the GitHub connector:

- [README](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/matrix-inequalities-and-norms/MI-16/README.md), content SHA `9ccaf4c84766206a0d0a98ef33d0fb9b98a5d1c6`.
- [Full LaTeX source](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/main/matrix-inequalities-and-norms/MI-16/solution.tex), content SHA `b1ae1fd5a6ac4fa80997ef2c1040fd5d3b501d6d`.
- [PDF at the commit cited by the external registry](https://github.com/ajt60gaibb/OpenProblemsInNLA/blob/eb7c9d64f91757a82fbe9167e80ab9c1b7f36c22/matrix-inequalities-and-norms/MI-16/solution.pdf).

The current README labels the entry solved, while [clopen's October registry record](https://clopen.solutions/OP-00263/) labels the same submission a partial, unverified resolution. The primary dossier itself explicitly distinguishes its algebraic answer from a compact structural formula or efficient algorithm. These different completion criteria must not be silently merged.

Theorem 2.1 constructs a finite set of critical values by Gröbner elimination, then selects the correct value using explicitly computed Haar moments at a sufficiently large but finite order. Its orbit equations include a square-free minimal-polynomial constraint to handle repeated eigenvalues. The selector accounts for real critical values not realized by Hermitian matrices. The argument was read; the accompanying programs and informal review were not rerun here. No claim of community acceptance or independent certification is made.

This is prior work, regardless of how its status is labeled. Repackaging the same elimination or moment-limit mechanism would neither meet this campaign's structural target nor establish novelty.

## The one-exceptional-eigenvalue family is also prior work

The same dossier's Theorem 8.1 gives a complete formula for spectra $`(\alpha,\beta,\ldots,\beta)`$, for every order and all nonnegative $`\alpha,\beta`$:

```math
M_n(\alpha,\beta^{n-1})=
\max\{P_{n,2}(\alpha,\beta),P_{n,n}(\alpha,\beta)\},
```

```math
P_{n,k}(\alpha,\beta)=\sum_{j=0}^k
\binom{k}{j}j!\,\beta^{n-j}
\left(\frac{\alpha-\beta}{k}\right)^j.
```

The notation $`\beta^{n-1}`$ in the spectral argument means $`n-1`$ repetitions. The paper also proves the unique transition for $`\alpha<\beta`$ and classifies its maximizers. This closes the rank-one-perturbation/equal-support route before it can be proposed as a new result here.

## Equality in the classical bound was settled in 1966

M. Marcus and H. Minc, *A Permanental Inequality—The Case of Equality*, Canadian Journal of Mathematics 18 (1966), 1085–1090, DOI [10.4153/CJM-1966-108-x](https://doi.org/10.4153/CJM-1966-108-x), gives the full equality characterization for

```math
|\mathop{\mathrm{per}}A|\le\frac1n\sum_i|\lambda_i|^n
```

when $`A`$ is normal. The [primary six-page PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/CDA25C1389456CF0B80AEB9D7332F557/S0008414X00041043a.pdf/a-permanental-inequalitythe-case-of-equality.pdf) was inspected. At orders at least three, equality requires a scalar multiple of a monomial unitary matrix. In the positive semidefinite class this forces $`A`$ to be scalar: a nonzero scalar multiple of a unitary PSD matrix has all eigenvalues equal and nonnegative. Thus strictness for nonscalar PSD spectra, including repeated or zero eigenvalues, is not a new result.

The live Minc page states strictness for positive distinct spectra among its progress. The broader 1966 equality theorem is the relevant prior source for any attempted extension.

## Remaining structural obstacle

For a unitary $`U`$, expand the product of its row linear forms as

```math
\prod_{i=1}^n\left(\sum_jU_{ij}z_j\right)
=\sum_{|\alpha|=n}c_\alpha(U)z^\alpha.
```

The permanent Cauchy–Binet identity gives

```math
\mathop{\mathrm{per}}(U\mathop{\mathrm{diag}}(\lambda)U^*)
=\sum_{|\alpha|=n}\alpha!|c_\alpha(U)|^2\lambda^\alpha.
```

The weights $`w_\alpha=\alpha!|c_\alpha|^2`$ are nonnegative, sum to one, and have first moments $`\sum_\alpha\alpha_jw_\alpha=1`$. The sum identity follows by setting all eigenvalues equal to one. For the first-moment identity, differentiate at that spectrum: the matrix perturbation is $`I+tuu^*`$ with $`u`$ a unit column, whose permanent has linear coefficient $`\|u\|^2=1`$.

Dropping the requirement that these weights come from one unitary product gives the classical upper bound by the weighted arithmetic–geometric mean inequality. That relaxation loses the optimizer information. The exact attainable set of weights retains the orthogonality and common factorization constraints on all row forms; no description of that set sufficient to compute its support function for arbitrary spectra has been obtained here.

The nearby maximum-permanent theorem for nonnegative stochastic matrices of bounded rank is also already claimed in [Lavi's 2026 paper](https://yair-lavi.com/publications/bounded-rank-permanent/), [primary text](https://hexagonmath.org/pdf/2611.00353v1). Its hypotheses do not include general complex PSD matrices or arbitrary unitary orbits. Taking entrywise absolute values does not preserve the spectrum or rank, so it supplies no immediate reduction of Problem 1.

No new structural formula or qualifying named subsidiary has emerged from this pass. The P8 endpoint obstruction is recorded separately; neither note changes the solved-conjecture count.

## Fourth-order expansion follow-up

The [quartic priority addendum](unitary_orbit_quartic_priority_addendum.md) separates the classical principal-subpermanent and cycle expansions from the proposed optimized fourth-order asymptotic. It obtains the 1986 Grone–Johnson–de Sá–Wolkowicz paper and checks the relevant Grover derivative and graph-cycle formulas. The elementary deficit inequality and matching-support equality are not assigned separate novelty. The optimized diagonal-drift argument is the potentially distinct claim; no earlier full counterpart was found in this bounded audit. Drew–Johnson and Hu full-text access limits remain. The local result does not compute the full P1 maximum.
