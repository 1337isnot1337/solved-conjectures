# A small-loss corollary of the published rank-one matrix potential

Date: 21 November 2026. Status: an analytic corollary of Carmon–Duchi–Sidford–Tian (2019), not a new solution of the paid runtime problem. No priority claim is made for this corollary.

Primary source: [A Rank-1 Sketch for Matrix Multiplicative Weights](https://proceedings.mlr.press/v99/carmon19a/carmon19a.pdf), especially Section 2.3, Lemmas 5 and 7, and equation (14).

## 1. The prior potential

For a symmetric matrix $`Y`$ and an independent uniform unit vector $`u`$, define

```math
P_u(Y)=\frac{e^{Y/2}uu^\top e^{Y/2}}{u^\top e^Yu},
\qquad
\overline P(Y)=\mathbb E_uP_u(Y),
\qquad
\overline p(Y)=\mathbb E_u\log(u^\top e^Yu).
```

The cited paper proves that $`\overline p`$ is smooth and convex, that $`\nabla\overline p=\overline P`$, and that

```math
\lambda_{\max}(Y)-a\le\overline p(Y)\le\lambda_{\max}(Y),
\qquad a=\log(4n),
\qquad \overline p(0)=0.
\tag{1}
```

Its Lemma 7 gives, for every symmetric $`D`$,

```math
0\le\nabla^2\overline p(Y)[D,D]
\le3\langle D^2,\overline P(Y)\rangle.
\tag{2}
```

Neither $`P_u`$ nor the individual log-quadratic function is being treated as a convex-gradient pair. The averaging in these statements is essential.

## 2. Negative shifts

For $`H\succeq0`$, write

```math
\phi(t)=\langle H,\overline P(Y-tH)\rangle.
```

Convexity implies

```math
\phi'(t)=-\nabla^2\overline p(Y-tH)[H,H]\le0.
```

Since $`H^2\preceq\|H\|_{\mathrm{op}}H`$, equation (2) and Taylor's integral remainder yield

```math
\begin{aligned}
V_Y(Y-H)
&=\int_0^1(1-t)\,
  \nabla^2\overline p(Y-tH)[H,H]\,dt
\\ &\le3\|H\|_{\mathrm{op}}
  \int_0^1(1-t)\phi(t)\,dt
\\ &\le\frac32\|H\|_{\mathrm{op}}\,
  \langle H,\overline P(Y)\rangle.
\end{aligned}
\tag{3}
```

Here $`V_Y(Y')=\overline p(Y')-\overline p(Y)-\langle Y'-Y,\overline P(Y)\rangle`$. No commutativity assumption is used.

## 3. Small-loss regret

Let $`0\preceq L_t\preceq I`$, $`Y_1=0`$, and

```math
Y_{t+1}=Y_t-\eta L_t,
\qquad
\overline L=\sum_{t=1}^T
\langle L_t,\overline P(Y_t)\rangle,
\qquad
L_*=\lambda_{\min}\!\left(\sum_{t=1}^T L_t\right).
```

Combining (1) and (3) with the exact potential telescoping identity gives

```math
-\eta L_*-a
\le\overline p(Y_{T+1})
\le-\eta\overline L+\frac32\eta^2\overline L.
```

Thus, for $`0<\eta\le1/3`$,

```math
\overline L-L_*
\le
\frac{\frac32\eta L_*+a/\eta}
     {1-\frac32\eta}
\le3\eta L_*+\frac{2a}{\eta}.
\tag{4}
```

For a deterministic upper bound $`\widehat L\ge L_*`$, choose

```math
\eta=
\begin{cases}
\min\{1/3,\sqrt{2a/(3\widehat L)}\},&\widehat L>0,
\\ 1/3,&\widehat L=0.
\end{cases}
```

If $`\widehat L\ge6a`$, equation (4) is at most $`2\sqrt{6a\widehat L}`$; otherwise it is at most $`12a`$. In particular,

```math
\overline L-L_*
\le2\sqrt{6a\widehat L}+12a.
\tag{5}
```

For fresh independent $`u_t`$, the randomized rank-one action $`P_{u_t}(Y_t)`$ has conditional mean $`\overline P(Y_t)`$. Therefore (4)–(5) also bound expected regret against an oblivious adversary, or against a nonanticipating adversary whose current loss is independent of $`u_t`$ conditional on the past. For an adaptive sequence, a deterministic almost-sure bound $`L_*\le\widehat L`$ suffices. This does not allow the adversary to inspect the current sampled action before choosing its loss.

## 4. What an approximate implementation must prove

Suppose an implementation produces a trace-one positive semidefinite action $`\widetilde P_t`$ coupled with the exact action so that, conditional on the past,

```math
\mathbb E\,
\|\widetilde P_t-P_{u_t}(Y_t)\|_1
\le\varepsilon_t.
\tag{6}
```

If the current loss satisfies the same nonanticipation condition, trace-norm duality bounds the increase in expected cumulative loss by $`\sum_t\varepsilon_t`$. Consequently a sufficiently small error sum preserves (5).

The cited paper gives a finite-precision Lanczos method for (6), but its number of matrix-vector products depends on the exponent, accuracy, and failure probability. This note proves no horizon-independent $`O(n^2)`$ implementation. Reusing one vector by an ordered product of current-round updates does not have the law in Section 1; the [companion obstruction](oja-oblivious-block-obstruction.md) shows why that substitution is invalid.
