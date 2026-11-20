# Karp–Vishnyakova–Zhang's gamma-quotient conjecture

Historical checkpoint, 20 November 2026. [Issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97).

**Superseded:** the full conjecture is now proved by the gamma-convolution argument in [results/kvz-gamma-quotient](../../results/kvz-gamma-quotient/README.md). The root and analysis agents independently reviewed the complete proof. The earlier derivative-matrix approach below is retained as research history; its unresolved leading-block step is not used by the final proof.

## Full target

Section 3, item 11 of [Karp–Vishnyakova–Zhang](https://arxiv.org/html/2408.01755v2) proposes all-order sign regularity of $`\Gamma(c+x+y)/\Gamma(d+x+y)`$ for $`c>d`$, in the positive-argument setting. Put $`\delta=c-d>0`$ and

```math
f_\delta(s)=\frac{\Gamma(s+\delta)}{\Gamma(s)},\qquad s>0.
```

The conjectured full property is separate from the general product claim refuted in issue 94. A correction to the source's proposed fixed order-three signature is not a full solution.

## Candidate signature

For nonintegral $`\delta>0`$, the candidate sign for an order-$`r`$ minor is

```math
\epsilon_r=\mathop{\mathrm{sgn}}\left[
(-1)^{\binom r2}\prod_{j=0}^{r-1}
\delta(\delta-1)\cdots(\delta-j+1)\right],
```

where the empty product is one. Integer $`\delta`$ gives a polynomial and eventual rank deficiency. In particular, for $`0\lt\delta<1`$ the candidate signature is $`(-1)^{r-1}`$, not the fixed third-order sign printed in the source.

Exploratory calculations of arbitrary-grid determinants through order seven and derivative Hankel determinants through order fifteen found no disagreement with this signature. These computations are diagnostics, not an argument for the conjecture.

## Derivative-matrix route

Let

```math
D_r(s)=\det[f_\delta^{(i+j)}(s)]_{i,j=0}^{r-1}.
```

A possible route to arbitrary grids is the complete-Chebyshev criterion, applied twice. If every mixed coalescent determinant of a smooth kernel is nonzero with a fixed order-dependent sign, first fix the second variable and apply the Wronskian criterion to its successive derivatives as functions of the first variable. Then fix an increasing tuple of first-variable points and apply the criterion again in the second variable. This transfer must be written and checked before it is used as a theorem here.

For $`0\lt\delta<1`$, the exact representation

```math
f_\delta(s)=\frac{\delta}{\Gamma(1-\delta)}
\int_0^\infty (1-e^{-st})
\frac{e^t}{(e^t-1)^{\delta+1}}\,dt
```

shows that $`f_\delta'`$ is completely monotone. After a diagonal sign congruence, the lower-right block of the derivative Hankel matrix is negative definite, while its upper-left entry is positive. Thus that matrix has one positive eigenvalue and $`r-1`$ negative eigenvalues. This suggests the stated signature on the whole first parameter interval, subject to the transfer lemma.

For $`1\lt\delta<2`$, $`f_\delta''`$ is completely monotone, so the corresponding lower-right block is positive definite. Log-concavity of $`f_\delta`$ gives a negative order-two determinant. Interlacing then forces exactly one negative eigenvalue at every larger order, suggesting $`D_r(s)<0`$ for every $`r\ge2`$. Again, this parameter interval alone would not resolve the full target.

For general $`m<\delta<m+1`$, a sufficiently deep derivative block has a definite sign, which bounds the number of eigenvalues of the opposite sign. The unresolved part is a finite leading block whose required size grows with $`m`$. Proving its signature uniformly in $`m`$ would settle the route.

## A useful exact factorization

For $`m<\delta<m+1`$,

```math
f_\delta(s)=(s)_{m+1}
\frac{\Gamma(s+\delta)}{\Gamma(s+m+1)}.
```

The second factor is a Stieltjes function. Its positive discrete representing measure is supported at $`\delta,\delta+1,\ldots`$, strictly beyond the numbers $`0,1,\ldots,m`$ that determine the polynomial's negative zeros. This separation may supply the missing leading-block argument. It has not yet been converted into a determinant proof.

The recent [Koumandos–Pedersen paper](https://arxiv.org/html/2507.03551v1), *Some two-parameter families of generalized Bernstein functions*, concerns related normalized gamma ratios. Its definition of generalized Bernstein order differs from the statement that a fixed higher derivative is completely monotone. Do not identify those properties without an argument.

## Status

Initial exact-name and kernel-formula searches through both web engines found the source and adjacent results, but no full resolution. The source author publication lists and nearby public solution bodies have also been checked. This is an initial bounded audit and must be extended if a full proof is found.

Work paused temporarily for an independent audit of another agent's complete proof candidate. The uniform leading-block argument and the precise two-stage Chebyshev transfer remain the next tasks.
