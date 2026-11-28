# Independent review of the eventual convexity proof

Date: 20 November 2026 (America/Chicago).

Reviewed draft: proof.md.

Final priority status: the earlier centered bound already implies eventual global convexity. The complete deduction is in [prior-bound-implication.md](prior-bound-implication.md); this is an uncounted quantitative refinement.

## Scope and conclusion

The written proof establishes the following mathematical statement:
for every integer $`k\geq3`$, every $`n\geq16k^2`$, every nonnegative doubly stochastic matrix $`A`$, and every real matrix $`D`$ with zero row and column sums,

```math
D^2\sigma_k(A)[D,D]
\geq
\sigma_k(J_n)\frac{k(k-1)}{2(n-1)^2}\|D\|_F^2.
\tag{1}
```

I found no mathematical gap in the tensor normalization, mixed derivative estimate, coefficient generating function, or constants. The argument is uniform over all such orders, matrices, and directions; it is not a computation at selected orders. It applies directly at boundary matrices.

This review does not establish the historical priority of (1) or certify that its corollary is the complete statement of Kopotun's 1996 eventual convexity conjecture. Those questions require the separate primary-source audit. The full permanent version of Lih–Wang is not covered, since $`n\geq16k^2`$ excludes $`k=n`$.

## Tensor normalization

For each $`j`$-set $`S`$, let

```math
v_S=(j!)^{-1/2}\sum_{\pi\in S_j}
e_{i_{\pi(1)}}\otimes\cdots\otimes e_{i_{\pi(j)}}.
```

There are $`j!`$ distinct orthonormal terms, so $`v_S`$ has norm one. In
$`\langle v_S,Y^{\otimes j}v_T\rangle`$, each of the $`j!`$ matching monomials occurs $`j!`$ times before division by $`j!`$. Therefore the inner product equals the permanent, with no extra factorial.

Write $`u_j=\sum_S v_S`$, $`Q=I-J_n`$, and $`w_j=Q^{\otimes j}u_j`$. For a zero-margin matrix $`Y`$, $`Y=QYQ`$, and hence

```math
\sigma_j(Y)=\langle w_j,Y^{\otimes j}w_j\rangle,
\qquad
\|w_j\|^2=\sigma_j(Q).
\tag{2}
```

The reduced matrix on any tensor position commutes with simultaneous permutations of the $`n`$ coordinates and annihilates the all-ones vector. A matrix commuting with all coordinate permutations has constant diagonal and constant off-diagonal entries. Restricting to $`\mathbf1^\perp`$ therefore makes it scalar. Its trace is $`\|w_j\|^2`$, so the reduced matrix is exactly

```math
\frac{\sigma_j(Q)}{n-1}Q
```

when extended by zero to the full coordinate space. This proves the one-position norm identity without assuming an irreducibility theorem.

## Mixed Hessian estimate

Slot symmetry of $`w_j`$ gives

```math
D^2\sigma_j(X)[D,D]
=j(j-1)\langle w_j,
(D\otimes D\otimes X^{\otimes(j-2)})w_j\rangle.
\tag{3}
```

The factor is $`j(j-1)`$, because the derivative chooses an ordered pair of distinct slots. The first $`D`$ can be moved to the left as $`D^{\mathsf T}`$. The remaining $`X`$ operators act on slots different from the second $`D`$, so they are a contraction when $`\|X\|_{2\to2}\leq1`$. The reduced-matrix identity then gives

```math
\begin{aligned}
|\langle w_j,(D\otimes D\otimes X^{\otimes(j-2)})w_j\rangle|
&\leq
\|(D^{\mathsf T}\otimes I)w_j\|
\|(I\otimes D\otimes I)w_j\|
\\ &=
\frac{\sigma_j(Q)}{n-1}\|D\|_F^2.
\end{aligned}
\tag{4}
```

Both norms in (4) use the reduced matrix of the original $`w_j`$. No isotropy of a transformed tensor is used. The transpose is essential to the displayed identity but causes no norm loss, because $`\|D^{\mathsf T}\|_F=\|D\|_F`$. Thus (4) is valid for arbitrary real, nonsymmetric $`X,D`$ with zero margins.

For doubly stochastic $`A`$, Jensen's inequality gives $`\|A\|_{2\to2}\leq1`$, and $`X=A-J_n=QAQ`$ is also a contraction. Zero entries of $`A`$ cause no problem.

## Centered expansion and positive majorant

The matching expansion is

```math
\frac{\sigma_k(J_n+X)}{\sigma_k(J_n)}
=\sum_{j=0}^k
\frac{n^j(k)_j}{(n)_j^2}\sigma_j(X).
\tag{5}
```

On the zero-margin space,
$`\sigma_2(X)=\|X\|_F^2/2`$. Thus the quadratic term in (5) contributes the Hessian

```math
\frac{(k)_2}{(n-1)^2}\|D\|_F^2.
\tag{6}
```

Let $`c_{n,j}=n^j\sigma_j(Q)/(n)_j`$. The permanent of $`tI+(1-t)J_n`$ gives

```math
\sum_{j=0}^n c_{n,j}t^j
=(1-t)^n\sum_{\ell=0}^n
\frac{1}{\ell!}\left(\frac{nt}{1-t}\right)^\ell.
```

Replacing the finite sum by the exponential changes no coefficient of degree at most $`n`$. Consequently

```math
c_{n,j}=[t^j]E_n(t),\quad
E_n(t)=\exp\!\left(n\left[\log(1-t)+\frac{t}{1-t}\right]\right)
\quad (j\leq n).
\tag{7}
```

The exponent has the series
$`n\sum_{\ell\geq2}(\ell-1)t^\ell/\ell`$, so every coefficient of $`E_n`$ is nonnegative. In particular $`c_{n,2}=n/2`$.

The inequality $`(k)_j/(n)_j\leq(k/n)^j`$ follows factor by factor for $`j\leq k\leq n`$. Writing $`u=k/n`$, equations (4)–(7) give

```math
\frac{D^2(\sigma_k/\sigma_k(J_n))(A)[D,D]}{\|D\|_F^2}
\geq
\frac{(k)_2}{(n-1)^2}
-\frac{u^2}{n-1}\bigl(E_n''(u)-n\bigr).
\tag{8}
```

The subtracted constant $`n`$ is exactly $`2c_{n,2}`$. This normalization is needed; replacing it by $`n-1`$ or inserting an additional $`j!`$ would invalidate the later estimate.

## Exact constants

For $`k\geq3`$ and $`n\geq16k^2`$,
$`u\leq1/48`$ and $`nu^2\leq1/16`$. Put
$`g(u)=\log(1-u)+u/(1-u)`$. Then

```math
g'(u)=\frac{u}{(1-u)^2},\qquad
g''(u)=\frac{1+u}{(1-u)^3}.
```

The following bounds are exact rational comparisons:

```math
ng(u)\leq\frac1{32}\left(\frac{48}{47}\right)^2
=\frac{72}{2209}<\frac1{16},
```

```math
g''(u)\leq\frac{112896}{103823}<\frac98,\qquad
n(g'(u))^2\leq\frac1{16}\left(\frac{48}{47}\right)^4<\frac18.
```

Since $`e^x\leq(1-x)^{-1}`$ for $`0\leq x<1`$, the first bound gives $`E_n(u)<16/15`$. Therefore

```math
\frac{E_n''(u)}n
=E_n(u)\bigl(g''(u)+n(g'(u))^2\bigr)
<\frac{16}{15}\left(\frac98+\frac18\right)=\frac43.
\tag{9}
```

Substitution into (8) leaves

```math
\frac{(k)_2}{(n-1)^2}-\frac{k^2}{3n(n-1)}.
```

This is at least half the first term because

```math
3n(k-1)-2k(n-1)=(k-3)n+2k\geq0.
\tag{10}
```

Equations (9)–(10) prove (1). Integrating (1) along a segment gives the stated strong-convexity chord deficit, with the coefficient divided by two:

```math
\sigma_k((1-t)A+tB)
\leq(1-t)\sigma_k(A)+t\sigma_k(B)
-\sigma_k(J_n)\frac{k(k-1)}{4(n-1)^2}
t(1-t)\|A-B\|_F^2.
```

## Reproducibility and source scope

The companion file verify.py checks the rational constants, the coefficient identity in (7), and the tensor normalization using exact rational arithmetic. Its small tensor examples are checks for factorials, transposes, and contraction placement, not a proof by testing orders. The proof above is independent of those checks.

The one-position tensor construction is attributed in the reviewed draft to Lemma 3.1 of Yair Lavi, [The Marcus–Minc Transform Inequality](https://arxiv.org/html/2609.29262v1). The positive-transform subpermanent paper is [The Kopotun Subpermanent Transform Inequality](https://hexagonmath.org/pdf/2611.00201v1), especially Lemma 5.1 and Section 6. These supplied ingredients are separated from the proposed mixed-Hessian consequence.

The historical target is K. A. Kopotun, [A note on the convexity of the sum of subpermanents](https://doi.org/10.1016/0024-3795(94)00228-2), Linear Algebra and its Applications 245 (1996), 157–169. Its full source statement and later status remain the responsibility of the parallel source audit. This review does not label a conjecture solved before that audit is complete.
