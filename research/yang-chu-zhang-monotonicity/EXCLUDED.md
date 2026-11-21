# Yang–Chu–Zhang's monotonicity conjecture

Status: excluded on 21 November 2026. The exact conjecture was already proved in a public source before this work. The independently derived proof and checks in this scratch directory must not be promoted as a new result.

## Decisive earlier source

*A covariance proof and a boundary counterexample for two digamma conjectures*, byline “Principia Math In Progress,” is available at this [immutable source file](https://github.com/PrincipiaMathOrg/math-solutions/blob/34b8b155d7db464ad7306f70b16d3af9cee34501/site-backup/mathdb-328867/mathdb-328867-solution.tex).

The file entered the public repository in [commit 34b8b155d7db464ad7306f70b16d3af9cee34501](https://github.com/PrincipiaMathOrg/math-solutions/commit/34b8b155d7db464ad7306f70b16d3af9cee34501), timestamp 2026-10-27T02:59:18Z. The file blob is `28e7199c73f0942f9443214c1b90fba238edbaeb`. Its internal document date is 11 September 2026; the independently observed October public commit alone suffices for exclusion. No inference about the internal date or earliest priority is needed.

The paper explicitly proves the whole increasing-function assertion, Conjecture 1(i) of Yang, Chu and Zhang, *Necessary and sufficient conditions for functions involving the psi function to be completely monotonic*, [JIA 2015:157](https://link.springer.com/article/10.1186/s13660-015-0674-8). The source introduces (i) and (ii) as two conjectures. Both are resolved by the earlier note: (i) positively, (ii) negatively. Our candidate targeted only (i), but that exact assertion is already covered.

## Mathematical audit of the earlier proof

The original quotient is

```math
H(x)=\frac{-24(x^4-31/336)R(x)+x^2-7/40}{24(x^2+7/40)R(x)-1},
\qquad R(x)=\psi(x+1/2)-\log x.
```

The earlier proof obtains from Binet's identity and duplication a positive probability density

```math
\frac{24}{e^{2\pi\sqrt u}+1},\qquad u>0.
```

For a variable $`U`$ with this density, set $`m=\mathbb E U=7/40`$, $`b=\mathbb E U^2=31/336`$, $`v=b-m^2>0`$, $`S(s)=\mathbb E(s+U)^{-1}=24R(\sqrt s)`$, and $`D(s)=(s+m)S(s)-1`$. Strict Jensen gives $`D(s)>0`$. Exact algebra gives

```math
H(\sqrt s)=m-s+v\frac{S(s)}{D(s)}.
```

Writing $`V_s=(s+U)^{-1}`$, differentiation gives

```math
\frac{d}{ds}H(\sqrt s)=
\frac{\mathop{\mathrm{Var}}(U)\mathop{\mathrm{Var}}(V_s)
-\mathop{\mathrm{Cov}}(U,V_s)^2}{D(s)^2}>0.
```

Cauchy–Schwarz gives the sign. Equality would require the reciprocal function to be affine on the support of a positive density, which is impossible. The moments are finite and differentiation is justified locally on $`s>0`$. The proof covers all positive $`x`$ and also gives exactly the endpoints $`155/294`$ and $`11165/8284`$. No missing hypothesis, parameter restriction, or mathematical gap was found.

## Why earlier screening missed this source

The [MathDB page](https://mathdb.com/p/328867/conjecture-on-the-monotonicity-threshold-and-complete-monoto) still described (i) as open. The [trureturing problem record](https://www.trureturing.org/research/ycz2015-psicm/), [issue 21602](https://github.com/the-omega-institute/trureturing/issues/21602), and [8 November issue 29330](https://github.com/the-omega-institute/trureturing/issues/29330) likewise explicitly left quotient monotonicity unresolved in their work, while discussing the separate refutation of (ii). They linked the PrincipiaMath source but their descriptions did not reflect its proof of (i).

A direct fetch of the linked current primary file revealed the complete earlier proof. Its file history then established the public date. These primary bytes override the stale or scope-limited status labels.

The preceding search also inspected the original 2014 preprint, the published 2015 article, the 2015 sharp-bounds paper, the 2017 gamma-monotonicity paper, the 2018 Laplace-ratio paper, the 2024 continued-fraction paper, the 2024 psi-remainder paper, and Yang's 2025 majorization paper. Those checks did not find this resolution. GitHub's global code search timed out or returned rate limits; all-state issue searches remained available. A broad literature search cannot replace reading a directly linked proof.

## Work retained and disposition

The independent two-variable ensemble proof is mathematically valid and was independently reviewed twice; its standard-library checker passed 83 exact rational checks. That work provides no new conjecture resolution because the exact statement was already proved. Only this exclusion record should be integrated into repository research/history. Do not add a result directory or a Results-table entry.
