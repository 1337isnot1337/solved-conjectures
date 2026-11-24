# Quantifying the tetrahedral comparison

Status: proved consequences of spectral duality and the cited complete-graph bound. The inequalities below do not determine whether the required overhead exponent is zero. No novelty claim is made.

Work over $`\mathbb C`$, fix an integer $`q\ge2`$, and regroup all products by the four parties $`I=\{A,B,C,D\}`$. Set

```math
H_q=\prod_{|S|=3}U_S(q),\qquad
K_q=\prod_{|e|=2}W_e(q).
```

The normalized spectrum of four-party tensors is denoted by $`\Delta_4`$. For $`F\in\Delta_4`$, write

```math
h_F=\log_qF(H_q),\qquad k_F=\log_qF(K_q).
```

These quantities do not depend on the choice of integer $`q\ge2`$. This follows from the dimension-independent power law for every wire and every subset unit, proved by the monotonicity and multiplicativity sandwich in the companion notes.

## Exact operational meaning of the gap

Let $`r_n`$ be the least positive integer such that

```math
U_I(r_n)\otimes H_q^{\otimes n}\ \ge\ K_q^{\otimes n},
```

where $`\ge`$ is ordinary local restriction. The integer exists because $`H_q^{\otimes n}`$ restricts to the scalar tensor and every finite tensor is a restriction of a sufficiently large full unit. Products of two such restrictions show $`r_{m+n}\le r_mr_n`$. Hence

```math
\gamma_q=\lim_{n\to\infty}\frac{\log_q r_n}{n}
=\inf_{n\ge1}\frac{\log_qr_n}{n}
```

exists. Then

```math
\gamma_q=\max_{F\in\Delta_4}(k_F-h_F).                 \tag{1}
```

In particular the value is independent of $`q`$; write it as $`\gamma`$.

Here the imported result is Strassen's spectral theorem, in Christandl, Vrana and Zuiddam, *Universal points in the asymptotic spectrum of tensors*, [arXiv:1709.07851v3](https://arxiv.org/html/1709.07851v3), Theorem 1.1. For fixed tensors $`S,T`$, it states that $`S\gtrsim T`$ if and only if $`F(S)\ge F(T)`$ for every normalized spectral point. The relation $`S\gtrsim T`$ means $`S^{\otimes(n+o(n))}\ge T^{\otimes n}`$. Remark 1.2 gives the equivalent asymptotic degeneration formulation. We now supply the conversion from that statement to (1), since its source overhead is slightly different.

Applying any $`F`$ to the defining restriction for $`r_n`$ gives

```math
\frac{\log_qr_n}{n}\ge k_F-h_F.
```

This proves the lower bound in (1). Let $`\delta`$ denote the maximum on its right. The maximum exists by compactness of the normalized spectrum; both evaluated tensors are nonzero. Balanced-cut flattening points give $`h_F=k_F=4`$, so $`\delta\ge0`$.

Fix a nonnegative rational number $`a/b>\delta`$, with integers $`a\ge0,b\ge1`$. For every $`F`$,

```math
F\bigl(U_I(q^a)H_q^{\otimes b}\bigr)
\ge F(K_q^{\otimes b}).
```

Spectral duality therefore gives an integer sequence $`s_n=o(n)`$ and restrictions

```math
U_I(q^{a(n+s_n)})H_q^{\otimes b(n+s_n)}
\ \ge\ K_q^{\otimes bn}.
```

The elementary rank decomposition of $`H_q`$ has $`q^4`$ terms. Thus a full unit of size $`q^{4bs_n}`$ can supply the extra $`bs_n`$ copies of $`H_q`$. Consequently

```math
U_I\!\left(q^{an+(a+4b)s_n}\right)H_q^{\otimes bn}
\ \ge\ K_q^{\otimes bn}.
```

It follows that $`\gamma_q\le a/b`$. Taking rationals decreasing to $`\delta`$ proves (1). This argument supplies an infimum of overhead exponents; it does not construct explicit local maps achieving the infimum.

## Bounds in terms of the matrix multiplication exponent

Let $`\omega=\omega_{\mathbb C}`$. Then

```math
\boxed{\quad\omega-2\ \le\ \gamma\ \le\ 4-\frac8\omega.\quad}       \tag{2}
```

For the lower bound, take any normalized three-party point $`G`$ on $`A,B,C`$, and evaluate four-party tensors by first merging $`D`$ into $`C`$. This gives a normalized four-party point: products and restrictions commute with regrouping, and regrouping a direct sum is the same direct sum after deleting zero cross blocks. The full unit stays a full unit. Under this regrouping,

```math
H_q\cong U_{ABC}(q^2)W_{AC}(q)W_{BC}(q),\qquad
K_q\cong W_{AB}(q)W_{AC}(q^2)W_{BC}(q^2).
```

If $`d_{AB},d_{AC},d_{BC}`$ are the wire exponents of $`G`$, their logarithmic ratio is

```math
\log_q\frac{G(K_q^{D\to C})}{G(H_q^{D\to C})}
=d_{AB}+d_{AC}+d_{BC}-2.
```

Maximizing over $`G`$ and applying the spectral perimeter characterization of $`\omega`$ proves $`\gamma\ge\omega-2`$.

For the upper bound, fix $`F\in\Delta_4`$ and let $`u(S)=\log_qF(U_S(q))`$ for each three-party face $`S`$. Restricting $`F`$ to tensors supported on $`S`$ gives a cover functional. By Lemma 1a of `NORMALIZED_EXTENSION.md`, it is either constant one on nonzero tensors, or the $`u(S)`$-th power of a normalized three-party point. In either case its triangle wire sum satisfies

```math
\sum_{e\subseteq S,\ |e|=2}d_e\le\omega u(S).
```

Summing over the four faces counts every edge twice. Therefore

```math
2k_F\le\omega h_F.                                  \tag{3}
```

The other imported input is Zhou, *Asymptotic Rank of Weighted Graph Tensors via Completely Positive Bounds*, [arXiv:2610.34273v3](https://arxiv.org/html/2610.34273v3), Theorem 4.10 and Corollary 4.11. They give $`\widetilde R(K_q)=q^4`$; the statement for arbitrary integer $`q`$ follows from the wire power law and spectral rank duality. Consequently $`k_F\le4`$. Since $`\omega\ge2`$, (3) yields

```math
k_F-h_F\le\left(1-\frac2\omega\right)k_F
\le4-\frac8\omega.
```

Taking the maximum in (1) proves (2).

Using the published bound $`\omega\le9/4`$, also contained in Zhou's Theorem 4.10 at three vertices, gives

```math
0\le\gamma\le\frac49.
```

Thus the known theorems imply an asymptotic conversion with source full-unit overhead $`q^{(4/9+o(1))n}`$. This is a consequence of spectral duality; it is not an explicit algorithm or a subexponential-overhead conversion.

Finally, (2) shows $`\gamma=0`$ if and only if $`\omega=2`$. Equivalently, $`H_q\gtrsim K_q`$ if and only if $`\omega=2`$. To reconcile the first equivalence with the extra-source-power convention for $`\gtrsim`$, note that $`H_q`$ restricts to $`U_I(q)`$: keep its $`ABC`$ and $`ABD`$ unit factors, contract the other two to scalars, and identify the two remaining indices at $`A`$ and $`B`$. Hence $`o(n)`$ additional copies of $`H_q`$ can supply every overhead $`q^{o(n)}`$.

The finite determinant obstruction for $`H_q\unrhd K_q`$, including equal powers and common full-unit catalysts, is compatible with $`\gamma=0`$. It excludes overhead exactly one at each finite stage; it does not imply that $`r_n`$ grows exponentially.
