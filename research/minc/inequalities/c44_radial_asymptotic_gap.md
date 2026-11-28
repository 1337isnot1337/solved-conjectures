# Zero-diagonal minimum: the radial asymptotic gap

Date: 20 November 2026 (America/Chicago). This records a determinant-model estimate and two exact
obstructions to importing existing asymptotic theorems. It does not prove
Conjecture 44, a large-order version, or a new finite case. The [independent review](c44_radial_gap_review.md) checks the determinant estimate, feasibility of both families and source hypotheses.

The [live C44 page](https://yair-lavi.com/mincs-list/conjecture-44/index.html)
states that any counterexample satisfies
$`\|A-U_n\|_F^2\le\sqrt{2/n}+O(1/n)`$, where
$`U_n=(\mathcal J-I)/(n-1)`$. It does not provide the full constants or the
proof of that bound. The existing negative-curvature and quasiconvexity
obstructions remain in force. The argument considered here uses only rays
from $`U_n`$.

## 1. The determinant model has the required quadratic margin

Write


```math
\Pi=\mathcal J/n,\quad Q=I-\Pi,\quad d=n-1,\quad
X_0=U_n-\Pi=-Q/d.
```


Let $`n\ge3`$, and let $`D`$ have zero diagonal and zero row and column
sums. Put $`X=X_0+D`$, $`s=\|D\|_F`$, and assume $`\|X\|_{\rm op}<1`$,
where the operator norm is the largest singular value. Define


```math
\Psi(X)=-\tfrac12\log\det(I-X^TX).
```


Then


```math
\boxed{\quad\Psi(X_0+D)-\Psi(X_0)\ge\tfrac12\|D\|_F^2.\quad}       \tag{1}
```


Here is a direct proof. Both $`X_0`$ and $`D`$ act on the $`d`$-dimensional
space $`\mathbf1^\perp`$. Since
$`\langle X_0,D\rangle=-\mathop{\mathrm{tr}}D/d=0`$,


```math
\|X\|_F^2=1/d+s^2.
```


Let $`\lambda_1,\ldots,\lambda_d`$ be the squared singular values on this
space. Jensen's inequality for $`-\log(1-x)`$ gives


```math
\begin{aligned}
\Psi(X)-\Psi(X_0)
&\ge -\frac d2\log\left(1-\frac{d s^2}{d^2-1}\right)
\\ &\ge \frac{d^2}{2(d^2-1)}s^2\ge\tfrac12s^2.
\end{aligned}
```


The logarithm's argument is positive because every $`\lambda_i<1`$.
Alternatively, expand $`\Psi`$ as
$`\sum_{k\ge1}\|X\|_{2k}^{2k}/(2k)`$: every higher Schatten-power term is
convex and has zero first variation at $`-Q/d`$ in the direction $`D`$.
The quadratic term contributes exactly $`s^2/2`$. That proof was
independently checked by the sign-matrices agent.

This is a statement about $`\Psi`$, not about the permanent. It does not
assert positivity of the permanent Hessian away from $`U_n`$.

## 2. What the source theorems actually assume

### McCullagh

P. McCullagh, *An asymptotic approximation for the permanent of a doubly
stochastic matrix*, [primary author PDF](https://www.stat.uchicago.edu/~pmcc/pubs/dspermanent.pdf),
[arXiv:1205.5723](https://arxiv.org/abs/1205.5723),
[DOI](https://doi.org/10.1080/00949655.2012.712122).

Section 3 requires $`E_n=n(A_n-\Pi)`$ to have bounded empirical absolute
moments of every fixed order:


```math
\limsup_n n^{-2}\sum_{ij}|(E_n)_{ij}|^p\lt \infty\qquad(p\ge1),
```


as well as a spectral-gap condition. Its main formula is


```math
\log\frac{\mathop{\mathrm{per}}A_n}{n!/n^n}
=-\tfrac12\log\det(I+\Pi-A_n^TA_n)+O(n^{-1}).
```


Since $`A_n=\Pi+X_n`$, this determinant is exactly $`I-X_n^TX_n`$.
Equation (1) later introduces $`I-\kappa X_n^TX_n`$,
$`\kappa=n/(n-1)`$, as a numerical improvement. These parameters must not
be conflated.

The terminology in Section 3 is inconsistent: its norm description uses
the largest eigenvalue modulus, while Section 4.1 explicitly assumes
spectral norm below one. Both families below have largest singular value
of $`A_n-\Pi`$ tending to zero, so this ambiguity does not affect the
hypothesis obstructions.

### Li

E. Li, *The Godsil–McKay Asymptotic for Latin Rectangles in the Sublinear
Range of Erdős Problem 725*, [arXiv:2608.01671v1, Theorem 2.1](https://arxiv.org/html/2608.01671v1).
The theorem and the surrounding definitions were inspected; no formal
verification work was performed or used here.

For $`A=(\mathcal J+E)/n`$, it requires a fixed entry bound
$`\max|E_{ij}|\le C_0`$ and


```math
L(E)=\max\left\{\max_i\sum_j|E_{ij}|,\max_j\sum_i|E_{ij}|\right\}
\le\eta_n n,\qquad \eta_n\longrightarrow0.
```


Its determinant is $`I-E^TE/n^2=I-X^TX`$, and its logarithmic error is
bounded by $`C_{\rm perm}(C_0)L(E)/n^2`$ for sufficiently large $`n`$.
The threshold depends on $`C_0`$ and the prescribed sequence $`\eta_n`$.
Neither a varying entry bound nor an all-order numerical constant can be
substituted without another argument. The row/column norm here is an
absolute $`\ell_1`$ line norm, not a Frobenius or singular-value norm.

## 3. Frobenius confinement does not imply the moment hypothesis

Choose any derangement permutation matrix $`P_n`$, put
$`t_n=n^{-3/4}`$, and define


```math
A_n=(1-t_n)U_n+t_nP_n.
```


This is zero-diagonal and doubly stochastic, and


```math
\|A_n-U_n\|_F^2
=t_n^2\frac{n(n-2)}{n-1}
=\frac{n-2}{(n-1)\sqrt n}\lt n^{-1/2}.                \tag{2}
```


Thus it lies strictly inside the reported asymptotic confinement scale.
At every one of the $`n`$ permutation positions, the corresponding entry
of $`E_n=n(A_n-\Pi)`$ is


```math
\frac1{n-1}+n^{-3/4}\frac{n(n-2)}{n-1}\sim n^{1/4}.
```


Consequently


```math
n^{-2}\sum_{ij}|(E_n)_{ij}|^p
\ge n^{-1}\left(\frac1{n-1}+n^{-3/4}\frac{n(n-2)}{n-1}\right)^p
\longrightarrow\infty\qquad(p>4).                \tag{3}
```


The fixed-entry hypothesis in Li's theorem fails as well. This has nothing
to do with loss of a spectral gap: on $`\mathbf1^\perp`$,


```math
\|A_n-\Pi\|_{\rm op}
\le (1-t_n)/(n-1)+t_n\longrightarrow0.
```


No permanent comparison is asserted for this family. It witnesses only
the failure of a proposed implication between hypotheses.

## 4. Even bounded entries do not imply small absolute line norms

Let $`n\ge4`$ be even, fix $`0\lt a<1`$, and choose a vector $`y`$ with
$`y_1=y_2=0`$ and equal numbers of $`+1`$ and $`-1`$ among its remaining
$`n-2`$ coordinates. Set


```math
x=e_1-e_2,\qquad D_n=\frac anxy^T,\qquad A_n=U_n+D_n.
```


The row and column sums of $`D_n`$ vanish, and its diagonal vanishes because
the supports of $`x`$ and $`y`$ are disjoint. Its negative entries have
magnitude $`a/n<1/(n-1)`$, so $`A_n`$ is positive off the diagonal. Also


```math
\|D_n\|_F^2=\frac{2a^2(n-2)}{n^2}=O(n^{-1}),      \tag{4}
```


well inside the outer scale. For $`E_n=n(A_n-\Pi)`$, all entries are
bounded by two. But for sufficiently large $`n`$, the absolute sum of the
first row is exactly


```math
\sum_j|(E_n)_{1j}|=a(n-2)+1+\frac1{n-1}.
```


The second row has the same sum; the other row and column sums do not
alter its leading order. Hence


```math
L(E_n)/n\longrightarrow a>0.                     \tag{5}
```


Li's small-line-norm premise fails, although entries are bounded and
$`\|A_n-\Pi\|_{\rm op}\le1/(n-1)+\|D_n\|_F\to0`$.

## 5. The required error comparison

Put $`d_n=n!/n^n`$ and define the exact remainder


```math
R_n(A)=\log\frac{\mathop{\mathrm{per}}A}{d_n}-\Psi(A-\Pi).
```


The first variation of $`R_n`$ at $`U_n`$ vanishes on every zero-diagonal,
zero-margin tangent. For the permanent, simultaneous relabeling makes all
off-diagonal cofactors equal, so their contraction with $`D`$ is zero. For
$`\Psi`$, its gradient at $`-Q/(n-1)`$ is a scalar multiple of $`Q`$,
whose contraction with $`D`$ is $`\mathop{\mathrm{tr}}D=0`$.

By (1), one sufficient missing estimate is a uniform bound of the form


```math
\boxed{\quad
R_n(U_n+D)-R_n(U_n)
\ge-\bigl(\tfrac12-\varepsilon\bigr)\|D\|_F^2,
\quad\varepsilon>0,
\quad}                                                          \tag{6}
```


throughout the remaining region, with justified constants and all required
orders covered. A radial second-derivative bound would suffice if it
implied (6); a full Hessian assertion is unnecessary and must not be
imported from this formulation.

A raw value estimate $`R_n(A)=O(n^{-1})`$, or even $`O(n^{-2})`$, does not
give (6) when $`\|D\|_F`$ is arbitrarily small. Subtracting the estimate
at $`U_n`$ does not make its error vanish quadratically in $`D`$.
Qualitative local minimality does not supply a quantitative overlap with
an asymptotic estimate. The two families above also show that the existing
theorems cannot be applied uniformly to the whole candidate region merely
from its Frobenius confinement.

No estimate of the form (6) was proved here. The unresolved analytic step
is a cancellation-preserving, uniform radial remainder bound, together
with explicit constants sufficient for every still-open order.
