# Independent combinatorial and source audit

Audit date: 20 November 2026. Scope: the exact source statement, all four symmetric-function identities, the conditional probability model, the parameter specialization, and additional prior-resolution screening. The analytic Fourier proof is being reviewed separately.

## Source statement and conventions

The [published Sagan–Swanson manuscript](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf), printed page 32, Conjecture 7.8, asks for all four unshifted families, along every sequence with $n,k\to\infty$ and $k/n\to\alpha\in(0,1)$. The standardization uses the actual mean and variance of each coefficient distribution.

Definitions 1.1, 1.3, and 1.5 give the recurrences used in the proof. Theorem 2.1(a,b), printed page 5, gives the type-B identities directly. The type-A identities follow from the same elementary/complete-homogeneous recurrences and the source's initial conditions.

| Family | Exact identity | Endpoint check |
| --- | --- | --- |
| $c[n,k]$ | $e_{n-k}([1]_q,\ldots,[n-1]_q)$ | There are $n-1$ variables. For $k=0$ and $n>0$, the elementary degree exceeds the number of variables, giving zero. |
| $c_B[n,k]$ | $e_{n-k}([1]_q,[3]_q,\ldots,[2n-1]_q)$ | There are $n$ variables, ending at $2n-1$. |
| $S[n,k]$ | $h_{n-k}([1]_q,\ldots,[k]_q)$ | At $k=0$, the empty-variable convention gives the delta initial case. |
| $S_B[n,k]$ | $h_{n-k}([1]_q,[3]_q,\ldots,[2k+1]_q)$ | There are $k+1$ variables, not $k$. At $k=0$, $h_n(1)=1$, agreeing with the type-B recurrence. |

The source also defines a shifted type-A second-kind family and ordered versions. Neither is silently substituted for the four displayed families.

## Conditional model audit

Let $a_j$ be a positive integer and let $U$ be uniform on $`\{0,\ldots,a_j-1\}`$, so $\mathbb E q^U=[a_j]_q/a_j$.

For a Bernoulli count with odds $\lambda a_j$ and a sum of $K_j$ independent uniform marks,

```math
\mathbb E[z^{K_j}q^{Y_j}]
=\frac{1+\lambda z[a_j]_q}{1+\lambda a_j}.
```

For a geometric count on $`\{0,1,\ldots\}`$ with ratio $\lambda a_j<1$,

```math
\mathbb E[z^{K_j}q^{Y_j}]
=\frac{1-\lambda a_j}{1-\lambda z[a_j]_q}.
```

Multiplying the independent factors and extracting $z^m$ gives a constant independent of $q$, times $\lambda^m e_m([a_j]_q)$ or $\lambda^m h_m([a_j]_q)$. Dividing by the same expression at $q=1$ cancels both the constant and $\lambda^m$. Therefore conditioning on $\sum K_j=m$ produces exactly the desired coefficient distribution. No multinomial coefficient is missing: the product of geometric series enumerates exponent vectors once, exactly as $h_m$ does.

The parameter table in PROOF.md is correct: $d=1,\beta=0$ in type A and $d=2,\beta=-1$ in type B; $L=n-1,n,k,k+1$ in the four respective cases; $m=n-k$. The elementary occupancy proportion is strictly between zero and its capacity because $0<\alpha<1$. The complete-homogeneous models impose no upper bound on $m/L$.

## Additional literature screen

Both available search engines were used for the exact conjecture number and author names, q-Stirling coefficient asymptotic normality, conditional central limit theorems, proportional $k/n$ regimes, and inversion statistics on restricted growth words.

- The [authors' complex-reflection-group followup](https://arxiv.org/html/2408.13874v1) extends the algebraic and combinatorial definitions; the inspected text contains no asymptotic-normality theorem.
- [Billey–Swanson, Cyclotomic Generating Functions](https://arxiv.org/html/2305.07620v3) treats products and quotients of q-integers. Its Theorem 5 is a criterion for cyclotomic generating functions. The q-Stirling polynomial here is an elementary or complete-homogeneous sum of products; it is not generally cyclotomic. For example, $S[3,2]=2+q$ has a root at $-2$. The theorem therefore is not a direct prior solution of the four-family assertion.
- Older papers on distributions expressed using q-Stirling numbers commonly keep q as a parameter and vary the Stirling index. That differs from the distribution of the coefficients in q at specified n and k. Search matches about records and generalized Bernoulli trials were screened with this distinction.
- Janson's *Moment convergence in conditional limit theorems* is relevant methodological background for conditioned sums. The current proof supplies its own non-identically-distributed triangular-array argument, including the lattice tail estimate and moment convergence. No novelty is claimed for conditioning independent variables or Fourier inversion.
- The [recent bottom-heaviness dossier](https://www.trureturing.org/research/ss2205-bottomheavy/) and [its public issue](https://github.com/the-omega-institute/trureturing/issues/21443) explicitly distinguish their Conjecture 7.6 resolution from asymptotic normality and say that it does not establish the latter. This is supporting status evidence, not a substitute for primary literature.
- GitHub issue and pull-request searches for the author pair with normality, and for q-Stirling with asymptotics, found no earlier explicit resolution of Conjecture 7.8. The relevant other result was the separate bottom-heaviness proof.

This is a bounded prior-resolution audit. It does not establish exclusive priority or exhaust inaccessible publisher material. No Lean code was run, modified, or verified.

## Audit finding

The combinatorial model, source statement, and four specializations pass this independent audit. The target is the full proportional regime, not a fixed-rank verification or numerical extension. Final acceptance also requires the independent analytic audit.
