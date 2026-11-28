# A weighted certificate for identical cross-validation models

21 November 2026. Independently checked research related to Langford's cross-validation problem. The [prior-coverage correction](prior-coverage-correction.md) establishes that the zero-error improvement regime is already covered by an existing theorem. No separate still-open funded criterion for the further weighted result has been established, so this work is not counted as a newly resolved bounty. No sponsor acceptance or payment is asserted.

The weighted leave-one-out argument was independently obtained by the coordinator and this worker. The coordinator supplied the exact-count binomial extension in Section 3; the worker supplied the block-indicator extension in Section 4. The shared leave-two-fold coupling is the common proof.

## 1. Protocol and the computable event

Let $`K,n\ge1`$ and $`m=Kn`$. Draw an ordered iid sample from an arbitrary distribution $`D`$ on $`\mathcal X\times\{0,1\}`$, and divide it into $`K`$ consecutive blocks $`Z_1,\ldots,Z_K`$ of size $`n`$. A fixed learning procedure $`A`$ trains on all but one block, preserving the order of the remaining observations. Denote the resulting classifiers by $`h_1,\ldots,h_K`$.

There is no invariance or stability assumption on $`A`$. It may depend arbitrarily on the order of its input. The calls may use independent random seeds. The classifier produced by each call is represented by a finite stored description, and equal descriptions specify equal measurable binary functions. Comparing descriptions is a finite computation. We do not test semantic equality of arbitrary programs.

Define the observed event

```math
E=\{\text{the stored descriptions of }h_1,\ldots,h_K\text{ are identical}\}.
```

On $`E`$, write $`h`$ for the common classifier and let $`r`$ be its total number of errors on the sample. This is also the ordinary cross-validation error count on $`E`$. Off $`E`$, let $`h`$ be the Gibbs classifier that chooses one of the $`K`$ learned classifiers uniformly on every prediction. Its risk is

```math
R(h)=\frac1K\sum_{i=1}^K R(h_i),
\qquad R(g)=\Pr_{(X,Y)\sim D}\{g(X)\ne Y\}.
```

This formula holds on $`E`$ as well. The certificate uses only the supplied fold models and their observed errors. The extra models appearing below belong to the proof; the procedure does not fit them.

The block ordering is part of the protocol. A fixed balanced partition can be put into this form by arranging its blocks before training. We do not claim that an arbitrary data-dependent or stratified partition, or an incoherent reordering between fits, automatically satisfies this theorem.

## 2. The shared-model counting argument

Draw $`K+1`$ iid blocks of size $`n`$. For every unordered pair $`\{i,j\}`$, fit

```math
h_{ij}=h_{ji}
=A(Z_1,\ldots,\widehat Z_i,\ldots,\widehat Z_j,\ldots,Z_{K+1}),
```

where the remaining blocks retain their order. For a randomized procedure, assign one independent seed to each unordered pair. Thus the two occurrences of $`h_{ij}`$ share their seed, while for any fixed $`j`$ the $`K`$ fits $`\{h_{ij}:i\ne j\}`$ have independent seeds, exactly as in the actual protocol.

Let $`E_j`$ mean that these $`K`$ stored descriptions coincide. On $`E_j`$, denote their common classifier by $`h^{(j)}`$, let $`X_j`$ count its errors on block $`Z_j`$, and let $`r_j`$ count its errors on the other $`K`$ blocks.

If $`E_i`$ and $`E_j`$ both occur, their common classifiers are equal because both equal $`h_{ij}`$. Consequently all the unanimous deletion views share one classifier $`h^*`$. If there is only one such view, use its classifier as $`h^*`$. Let $`q`$ be the number of errors of $`h^*`$ on all $`K+1`$ blocks. For every unanimous view,

```math
r_j+X_j=q.
```

The held-out blocks are disjoint, so, with the convention $`0/0=0`$,

```math
\sum_{j=1}^{K+1}
\mathbf1_{E_j}\frac{X_j}{r_j+X_j}
\le1. \tag{1}
```

When $`q>0`$, the left side is the number of errors in the blocks indexed by unanimous views, divided by $`q`$. When $`q=0`$, it vanishes.

No joint permutation-invariance assertion is needed. For each fixed $`j`$, the ordered list of the other $`K`$ blocks has exactly the original ordered iid law, its fitting seeds have the original independent law, and $`Z_j`$ is independent of them. Thus all $`K+1`$ summands in (1) have equal expectations even for an order-sensitive $`A`$.

## 3. Exact error-count certificate for every fold size

For integers $`n\ge1`$ and $`r\ge0`$, define the finite polynomial

```math
F_{n,r}(p)
=\sum_{x=1}^n
\frac{x}{r+x}\binom nx p^x(1-p)^{n-x}
=\mathbb E_{X\sim\mathop{\mathrm{Bin}}(n,p)}\frac{X}{r+X}. \tag{2}
```

Conditional on a unanimous deletion view and its training data and fitting seeds, $`X_j`$ has distribution $`\mathop{\mathrm{Bin}}(n,R(h^{(j)}))`$. Taking expectations in (1) therefore proves

```math
\boxed{
\mathbb E\!\left[\mathbf1_E F_{n,r}(R(h))\right]
\le\frac1{K+1}.
} \tag{3}
```

This is an unconditional statement over the sample and the learning calls. It does not divide by $`\Pr(E)`$ or assert coverage conditional on having observed $`E`$.

The function $`F_{n,r}`$ is continuous and strictly increasing on $`[0,1]`$, with

```math
F_{n,r}(0)=0,\qquad F_{n,r}(1)=\frac n{r+n}.
```

For $`r=0`$ this follows from $`F_{n,0}(p)=1-(1-p)^n`$. For $`r>0`$, couple the binomial variables using $`n`$ independent uniforms: increasing $`p`$ increases their sum, with positive probability of a strict increase, and $`x/(r+x)`$ is strictly increasing.

For a chosen $`\gamma\in(0,1)`$, put $`c=1/((K+1)\gamma)`$. Define

```math
U_{K,n,r}(\gamma)=
\begin{cases}
1,&c\ge n/(r+n),
\\ F_{n,r}^{-1}(c),&c\lt n/(r+n).
\end{cases} \tag{4}
```

Markov's inequality applied to (3), followed by pointwise monotonicity for the observed integer $`r`$, gives

```math
\Pr\{E\text{ and }R(h)>U_{K,n,r}(\gamma)\}\le\gamma. \tag{5}
```

There is no union bound over possible values of $`r`$. The random observed error count is already present inside (3).

For rational confidence inputs, (2) has rational coefficients and (4) is computable by certified bisection; using an upper approximation preserves the guarantee. The theorem does not require computing an unknown distributional quantity.

Two specializations make the scale clear:

```math
n=1:
\quad U_{K,1,r}(\gamma)
=\min\left\{1,\frac{r+1}{(K+1)\gamma}\right\}; \tag{6}
```

```math
r=0:
\quad U_{K,n,0}(\gamma)
=1-\left(1-\min\left\{1,\frac1{(K+1)\gamma}\right\}\right)^{1/n}. \tag{7}
```

## 4. A second certificate from erroneous folds

On $`E`$, let $`b`$ be the number of blocks containing at least one error of the common classifier. Repeating (1) with each block's error indicator instead of its error count yields

```math
\mathbb E\!\left[
\mathbf1_E\frac{1-(1-R(h))^n}{b+1}
\right]\le\frac1{K+1}. \tag{8}
```

Indeed, if the common augmented classifier errs on $`q`$ blocks, a bad held-out block leaves $`b_j=q-1`$ bad blocks in its training view. At most $`q`$ bad held-out blocks contribute, each with weight $`1/q`$.

Consequently another valid bound on $`E`$, at failure probability $`\gamma`$, is

```math
V_{K,n,b}(\gamma)
=1-\left(1-\min\left\{1,\frac{b+1}{(K+1)\gamma}\right\}\right)^{1/n}. \tag{9}
```

No pointwise dominance between (4) and (9) is claimed. Taking their minimum requires another failure-budget allocation unless a joint calibration is proved. The exact-count certificate alone is enough for the following full procedure.

## 5. A bound defined on every sample

Let $`\widehat R_{\mathrm{CV}}`$ be the ordinary average CV error. The prior Blum–Kalai–Langford argument gives, for the Gibbs classifier and every $`\alpha\in(0,1)`$,

```math
\Pr\left\{
R(h)>\widehat R_{\mathrm{CV}}
+\sqrt{\frac{\log(1/\alpha)}{2n}}
\right\}\le\alpha. \tag{10}
```

For completeness, conditional on the training data for fold $`i`$, its $`n`$ held-out errors are independent Bernoulli variables. Their centered exponential moment is bounded by $`\exp(\lambda^2n/8)`$. Jensen's inequality averages these exponential moments across folds; optimizing the resulting Chernoff bound gives (10). This is prior work, not a claimed contribution.

Fix $`0<\gamma<\delta<1`$ before observing the sample. Set

```math
B_0=\min\left\{1,\widehat R_{\mathrm{CV}}
+\sqrt{\frac{\log(1/(\delta-\gamma))}{2n}}\right\},
\qquad
B_1=\begin{cases}U_{K,n,r}(\gamma),&E,\\1,&E^c.\end{cases}
```

Output the Gibbs classifier and the computable certificate $`B=\min\{B_0,B_1\}`$. Equations (5) and (10) give the sponsor's displayed form,

```math
\boxed{\Pr\{R(h)\le B\}\ge1-\delta,}
```

for every $`A,D,K,n`$ in the stated protocol, with independent randomized learning calls included. Unanimity is an observed event, not an assumption about the learning algorithm or distribution. Off that event the standard CV certificate remains available.

This combination spends $`\gamma`$ of the confidence budget on the new certificate. It is not claimed to dominate the ordinary bound evaluated at the full failure budget $`\delta`$ on every sample. It does improve the held-out-fold scale on identifiable samples: with $`r=0`$, fixed $`n,\gamma`$, and $`K\to\infty`$, (7) is asymptotic to $`1/(Kn\gamma)=1/(m\gamma)`$, whereas the held-out-fold bound retains its dependence on $`n`$ alone.

## 6. What has and has not been established

The proof establishes the computable all-learner confidence certificate above. It does not establish a conditional-on-unanimity confidence guarantee, a binomial law for the aggregate CV count, an empirical stability theorem, or a statement about a separately retrained full-sample model.

The original sponsor offered $100 for an improvement without extra assumptions and up to $500 at the sponsor's judgment. The separate primary-source audit and common-order reduction show that prior CV-CRC already supplies the zero-error improvement used to motivate this connection. The weighted result is retained as further research, without a new bounty count or a verified further-payment offer. Fixed-level jackknife-minmax coverage, conformal e-prediction, algorithmic luckiness, and data-dependent stability remain credited in that audit.

Primary target: [Langford's COLT 2005 writeup](https://hunch.net/~jl/projects/prediction_bounds/cv_open/cv_open.ps) and [prize slides](https://hunch.net/~jl/projects/prediction_bounds/cv_open/cv_open_presentation.ps). Prior baseline: [Blum–Kalai–Langford, COLT 1999](https://www.cs.cmu.edu/~jcl/papers/progressive_validation/coltfinal.pdf), Theorems 1–3. Closely related prior: [Barber–Candès–Ramdas–Tibshirani, jackknife-minmax Theorem 3](https://arxiv.org/pdf/1905.02928v3), including Appendix B.1.
