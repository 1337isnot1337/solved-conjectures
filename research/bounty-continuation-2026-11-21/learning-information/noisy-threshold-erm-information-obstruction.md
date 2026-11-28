# Noisy-label threshold ERM has unbounded CMI on one iid distribution

Date: 21 November 2026. Coordinator review and a [second independent review](NOISY_ERM_REVIEW.md) passed.

This concerns the particular proper learner in the [threshold route note](agnostic-threshold-cmi-route.md): independently flip labels with a fixed probability $`0\lt p<1/2`$, then choose the **earliest** empirical-loss-minimizing cut, using a threshold at the next input feature or infinity. The accuracy proof there remains valid, but this note gives an iid obstruction to its required information bound.

This is not a negative resolution of the agnostic-threshold bounty, which permits other learners. No claim is made here about every tie-breaking rule, every perturbation scheme, or prior novelty of the lower bound.

## 1. Statement

Use the same fixed data distribution for every sample size:

```math
X\sim\mathop{\mathrm{Uniform}}[0,1],\qquad
Y\sim\mathop{\mathrm{Bernoulli}}(1/2),\qquad X\perp Y.
```

Let $`A_{n,p}`$ be the learner above and put $`\mu=1-2p>0`$. For $`n\ge2`$, define

```math
K_n=\max\left(0,\left\lfloor\log_4\lceil n/2\rceil\right\rfloor-1\right).
```

The bound is

```math
\mathop{\mathrm{CMI}}_D(A_{n,p})
\ge\frac{\mu^2K_n^2}{576(1+2\log(n+1))}.
\tag{1}
```

In particular it is $`\Omega_p(\log n)`$. All information is measured in nats. The input features are distinct almost surely, so no atom or tie approximation is used in this counterexample.

## 2. A weighted membership-score lower bound

For a finite threshold parameter $`w\in[0,1]`$, define

```math
g_w(x)=\frac{1[x\ge w]}{\sqrt{x-w+1/n}},
\qquad g_\infty(x)=0.
```

For a full paired supersample $`T=((X_{ib},Y_{ib}))`$, a selector $`S`$, and the learner output $`W`$, write $`a_{ib}=2Y_{ib}-1`$ and define

```math
F(W,T,S)=\sum_{i=1}^n
\left[a_{iS_i}g_W(X_{iS_i})
-a_{i,1-S_i}g_W(X_{i,1-S_i})\right],
```

```math
V(W,T)=\sum_{i=1}^n\sum_{b=0}^1g_W(X_{ib})^2.
```

Under the conditional-information reference law, keep the actual joint marginal of $`(W,T)`$ but replace $`S`$ by independent unbiased bits. For fixed $`W,T`$, the score is a sum of independent signs times

```math
D_i=a_{i0}g_W(X_{i0})-a_{i1}g_W(X_{i1}).
```

Since $`\cosh t\le e^{t^2/2}`$ and $`D_i^2\le2(g_W(X_{i0})^2+g_W(X_{i1})^2)`$,

```math
\mathbb E_{\mathrm{ref}}
\exp\{\alpha F-\alpha^2V\}\le1
\quad\text{for every real }\alpha.
```

The variational inequality for relative entropy yields

```math
\mathop{\mathrm{CMI}}_D(A_{n,p})
\ge\alpha\mathbb EF-\alpha^2\mathbb EV.
```

Optimizing the scalar $`\alpha`$ gives

```math
\mathop{\mathrm{CMI}}_D(A_{n,p})
\ge\frac{(\mathbb EF)^2}{4\mathbb EV}.
\tag{2}
```

All variables in this argument are bounded for a fixed $`n`$, so there is no integrability or limiting interchange issue.

## 3. Reducing the expected score to a fair random walk

Sort the selected training features as $`X_{(1)}<\cdots<X_{(n)}`$. Let $`A_i=2Y_{(i)}-1`$ be the original label signs and let $`B_i`$ be their independently flipped signs. The $`B_i`$ are iid fair signs, independent of the ordered features. Also

```math
\mathbb E[A_i\mid B_1,\ldots,B_n,X_{(1)},\ldots,X_{(n)}]
=\mu B_i.
```

Put $`S_0=0`$ and $`S_j=\sum_{i=1}^jB_i`$. The perturbed threshold loss differs from $`S_j`$ by a constant. Let $`J`$ be the earliest index minimizing $`S_j`$ over $`0\le j\le n`$. Then the output is

```math
W=X_{(J+1)}\quad(J\lt n),\qquad W=\infty\quad(J=n).
```

The ghost sample is independent of the learner output and its original labels have mean zero. Therefore

```math
\mathbb EF
=\mu\,\mathbb E\sum_{i=1}^nB_i g_W(X_{(i)}).
\tag{3}
```

Conditional on $`J=j<n`$, the future increments $`B_{j+1},\ldots,B_n`$ are a fair simple random walk conditioned to stay nonnegative for $`m=n-j`$ steps. Indeed, the earliest-minimum event factors into a strict reversed-past condition and an independent nonnegative-future condition. The geometry of the ordered features is unchanged by conditioning on $`J`$.

## 4. Mean height of the conditioned future walk

Let $`Q_r`$ denote the probability that a fair walk stays nonnegative for $`r`$ steps. Reflection and telescoping the endpoint counts give

```math
Q_r=2^{-r}\binom r{\lfloor r/2\rfloor}.
```

Let $`\tau=\inf\{k\ge0:S_k=-1\}`$. The stopped process $`S_{k\wedge\tau}+1`$ is a martingale, and optional stopping at the bounded time $`r\wedge\tau`$ gives expectation $`1`$. On $`\tau\le r`$ it is zero; on $`\tau>r`$ it equals $`S_r+1`$. Since a nearest-neighbor walk leaves the nonnegative integers by hitting $`-1`$, the event $`\tau>r`$ is exactly $`\{S_1,\ldots,S_r\ge0\}`$. Therefore

```math
\mathbb E[(S_r+1)1_{\{S_1,\ldots,S_r\ge0\}}]=1,
```

and hence the conditional mean height at time $`r`$ is $`Q_r^{-1}-1`$.

The elementary central-binomial bound

```math
Q_r\le\frac1{\sqrt{r+1}}
```

follows by induction on the even indices using $`Q_{2a+2}/Q_{2a}=(2a+1)/(2a+2)`$, and then the corresponding odd-index relation. Consequently, for $`r\ge2`$,

```math
\mathbb E[S_r\mid S_1,\ldots,S_r\ge0]
\ge\sqrt{r+1}-1\ge\tfrac12\sqrt r.
```

Conditioning on survival for a longer time $`m\ge r`$ only increases this mean: the law of $`S_r`$ under survival to time $`r`$ is reweighted by the future-survival probability from height $`S_r`$, a nondecreasing function of that height. The covariance of two nondecreasing functions of a real random variable is nonnegative. Thus, for the future walk conditional on $`J=j`$,

```math
\mathbb E[S_r^{\mathrm{future}}\mid J=j]\ge\tfrac12\sqrt r
\quad(2\le r\le m).
\tag{4}
```

Its mean height is nonnegative also at $`r=0,1`$.

## 5. Inverse-square-root spacings extract every scale

Conditional on $`J=j<n`$, put

```math
w_r=\frac1{\sqrt{X_{(j+r)}-X_{(j+1)}+1/n}}
\quad(1\le r\le m).
```

These weights decrease with $`r`$. Summation by parts gives the exact identity

```math
\sum_{r=1}^mB_{j+r}w_r
=S_m^{\mathrm{future}}w_m
+\sum_{r=1}^{m-1}S_r^{\mathrm{future}}(w_r-w_{r+1}).
\tag{5}
```

For each $`r`$, the spacing $`X_{(j+r)}-X_{(j+1)}`$ has mean $`(r-1)/(n+1)`$, independently of $`j`$. Convexity therefore gives

```math
\mathbb Ew_r\ge\sqrt{n/r}.
```

For $`r\ge3`$, that spacing has beta parameters $`r-1,n+2-r`$, so its reciprocal mean is $`n/(r-2)`$. Cauchy–Schwarz yields

```math
\mathbb Ew_r\le\sqrt{n/(r-2)}.
\tag{6}
```

For any $`R\ge4`$ with $`4R\le m`$, (6) implies

```math
\mathbb Ew_R-\mathbb Ew_{4R}
\ge\left(1-\frac1{\sqrt3}\right)\sqrt{n/R}
\ge\tfrac13\sqrt{n/R}.
```

The walk and the spacings are independent after conditioning on $`J=j`$. By (4), the terms in (5) for $`R\le r<4R`$ contribute at least

```math
\tfrac12\sqrt R\,
(\mathbb Ew_R-\mathbb Ew_{4R})
\ge\frac{\sqrt n}{6}.
```

All other expected terms in (5) are nonnegative. Taking $`R=4,4^2,\ldots`$ gives

```math
\mathbb E\left[\sum_iB_i g_W(X_{(i)})\,\middle|\,J=j\right]
\ge\frac{\sqrt n}{6}
\max(0,\lfloor\log_4(n-j)\rfloor-1).
\tag{7}
```

Finally, $`\Pr(J\le n/2)\ge1/2`$. To see this without an asymptotic arcsine theorem, let $`J_{\mathrm{last}}`$ be the last minimum index. Reversing and negating the fair increments sends the earliest minimum to $`n-J_{\mathrm{last}}`$, without changing the walk law. Since $`J\le J_{\mathrm{last}}`$, the events $`J\le n/2`$ and $`J_{\mathrm{last}}\ge n/2`$ cover every path and have equal probabilities.

Combining this with (3) and (7) proves

```math
\mathbb EF\ge\frac{\mu\sqrt n}{12}K_n.
\tag{8}
```

## 6. The quadratic penalty is only order n log n

Conditional on $`J=j<n`$, the boundary feature contributes $`n`$ to the sum of squared training weights. If $`m=n-j\ge2`$ and $`W=x`$, the other $`m-1`$ larger features are uniform on $`(x,1)`$, giving expected squared-weight sum

```math
\frac{m-1}{1-x}\log(1+n(1-x)).
```

Here $`W=X_{(j+1)}`$ has beta parameters $`j+1,m`$, so

```math
\mathbb E\frac1{1-W}=\frac n{m-1}.
```

Using $`\log(1+n(1-x))\le\log(n+1)`$ proves

```math
\mathbb E\sum_{\mathrm{train}}g_W(X)^2
\le n(1+\log(n+1)).
```

The case $`m=1`$ has just the boundary contribution, and $`J=n`$ contributes zero. For each independent ghost feature,

```math
\mathbb E[g_W(X)^2\mid W=w]
=\log(1+n(1-w))\le\log(n+1),
```

with zero when $`w=\infty`$. Thus

```math
\mathbb EV\le n(1+2\log(n+1)).
\tag{9}
```

Substituting (8)–(9) into (2) proves (1).

## 7. Scope of the obstruction

This proof uses a single fixed iid distribution, a fixed label-flip probability, and all growing sample sizes. It is not a specially chosen paired supersample and not a numerical case.

The information detected by the weighted score comes from the conditioned walk at every spatial scale after its exact minimum. The sampling error of the learner is still of the required order; the obstruction is specifically its original conditional mutual information.

Uniform sampling from a randomized **near**-minimum band does not impose the same exact-minimum future-walk condition. No conclusion about that candidate, the existence of another proper learner, or the bounty itself follows from (1).
