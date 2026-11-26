# González D’León–Wachs's complete-graph specialization question

The Omega Institute published the complete-graph answer to González D’León–Wachs Question 7.1 on 23 November 2026, before this repository’s 24 November publication. Its polynomial factor is the normalized associated Laguerre polynomial in equation (4) here. The Gamma-moment representation, strict coefficient log-concavity and exact real-zero count are the scope of this supplement. [Earlier proof](https://github.com/the-omega-institute/trureturing/pull/33676).

For integers $`n\ge 1`$ and $`r\ge 2`$, let $`P_{n,r}(t)=\Psi_{K_n}(t,\ldots,t,0,\ldots)`$, with $`r`$ copies of $`t`$. Let $`\alpha_1,\ldots,\alpha_{r-2}`$ be the positive zeros of $`L_{r-2}^{(1)}`$, the associated Laguerre polynomial. Empty products and sums apply when $`r=2`$. Then
```math
 P_{n,r}(t)=(n-1)![z^{n-1}]\,
       e^{(1-nt)z}\prod_{i=1}^{r-2}(1+tz/\alpha_i)^{-n}.
 \tag{1}
```
Equivalently, if $`Y_i`$ are independent gamma variables of shape $`n`$ and rate $`\alpha_i`$, and $`Z=n+\sum_iY_i`$, then
```math
 P_{n,r}(t)=\mathbb E(1-tZ)^{n-1}.
 \tag{2}
```
This answers Question 7.1 of [González D’León–Wachs, *Weighted bond posets and a new chromatic symmetric function*, arXiv:2608.08692v2 §7.1](https://arxiv.org/html/2608.08692v2#S7.SS1). It also gives strict coefficient log-concavity for the equal-variable specialization of $`\Psi_{K_n}`$, for all $`n`$ and $`r`$ with a nonvacuous interior. It does not decide their Schur-log-concavity Conjecture 7.3, even for complete graphs.

**Conventions and prior work.** We use the rank-generating convention in the defining (7.1), so the constant coefficient equals 1. The paper's printed (7.3) and (7.4) instead use the rank-reversed convention; for $`r=2`$, (1) gives $`(1-nt)^{n-1}`$, whose rank reversal is precisely $`(t-n)^{n-1}`$. The latter was already proved in [González D’León–Wachs, *On the (co)homology of the poset of weighted partitions*, Theorem 2.8](https://arxiv.org/abs/1309.5527). The inverse series underlying this proof already occurs in their work on multibracketed Lie algebras. The earlier formula already evaluates the equal-variable specialization. The moment representation below yields the coefficient and zero results.

## 1. The Laguerre product

Let $`M_m=M_{K_m}(\mathbf{x})`$, with $`M_1=1`$, and put
```math
 B(z)=\sum_{m\ge1}M_m\frac{z^m}{m!},\qquad
 F(z)=\sum_{m\ge1}h_{m-1}(\mathbf{x})\frac{z^m}{m!}.
```
For $`K_m`$, all set partitions are connected-block partitions. Therefore the Schur-basis-free Möbius recurrence in the authors' Theorem 5.7 gives $`F(B(z))=z`$: the coefficient of $`z^m/m!`$ in $`F(B(z))`$ is the sum over all set partitions $`\pi`$ of $`h_{|\pi|-1}\prod_{C\in\pi}M_{|C|}`$. The defining equation (7.1) likewise gives
```math
 \Psi_{K_n}(\mathbf{x})=n![z^n]e^{B(z)}
  =(n-1)![z^{n-1}]e^z(z/F(z))^n ,
 \tag{3}
```
where the last equality is Lagrange inversion.

Specialize $`\mathbf{x}=(t,\ldots,t,0,\ldots)`$, with $`r`$ nonzero slots, so $`h_j=\binom{r+j-1}{j}t^j`$. Then
```math
 \frac{F(z)}z
 =\sum_{j\ge0}\binom{r+j-1}{j}\frac{(tz)^j}{(j+1)!}
 =e^{tz}\frac{L_{r-2}^{(1)}(-tz)}{r-1}.
 \tag{4}
```
The last equality is the usual Kummer transformation of $`{}_1F_1(r;2;tz)`$, or follows by comparing coefficients: the finite polynomial $`L_{r-2}^{(1)}(-u)/(r-1)`$ has coefficient $`\binom{r-2}{k}/(k+1)!`$ at $`u^k`$. After multiplication by $`e^u`$ and then by $`(j+1)!`$, the degree-$`j`$ coefficient is $`\sum_k\binom{r-2}{k}\binom{j+1}{k+1}=\binom{r+j-1}{j}`$ by Vandermonde.

The classical Laguerre orthogonality against $`xe^{-x}\,dx`$ on $`(0,\infty)`$ gives $`r-2`$ simple positive roots (see [NIST DLMF §18.2(vi)](https://dlmf.nist.gov/18.2.vi) and [§18.3](https://dlmf.nist.gov/18.3)); (4) has constant term 1. Substituting the root factorization in (3) proves (1). The gamma Laplace transforms $`\mathbb E e^{-tzY_i}=(1+tz/\alpha_i)^{-n}`$ then prove (2) by expansion at $`z=0`$.

For example the $`r=3`$ case has a single root $`\alpha_1=2`$, and
```math
 P_{n,3}(t)=
 \sum_{j=0}^{n-1}(-1)^j\binom{n-1}{j}
  \left(\sum_{k=0}^{j}\binom{j}{k}
                   \frac{(n+k-1)!}{(n-1)!}\frac{n^{j-k}}{2^k}\right)t^j.
```
Equations (1) and (2) use the convention of $`\Psi`$; for the ordinary characteristic polynomial of $`\Pi_{K_n}^r`$, take $`t^{n-1}P_{n,r}(1/t)=\mathbb E(t-Z)^{n-1}`$.

## 2. Strict log-concavity and real zeros

Write $`P_{n,r}(t)=\sum_{j=0}^{n-1}(-1)^j c_jt^j`$, with $`c_j>0`$. From (2),
```math
 c_j=(n-1)_{\underline j}\,b_j,\qquad
 \sum_{j\ge0}b_j z^j=\mathbb E e^{zZ}
              =e^{nz}\prod_i(1-z/\alpha_i)^{-n}.
```
The coefficients of each factor are positive and log-concave: for the exponential this follows from the adjacent ratio $`n/(j+1)`$, and for a gamma factor from $`(n+j)/((j+1)\alpha_i)`$. Convolution of nonnegative log-concave sequences without internal zeros is log-concave. One direct proof forms their lower triangular Toeplitz matrices: decreasing adjacent ratios give all order-two minors nonnegative, multiplying matrices realizes convolution, and the order-two Cauchy–Binet formula gives the conclusion using finite lower triangular sections. Thus $`b_j`$ is log-concave, while the adjacent ratios of $`(n-1)_{\underline j}`$ are strictly decreasing. It follows that $`c_j^2>c_{j-1}c_{j+1}`$ for $`1\le j\le n-2`$. For $`r=1`$, the usual complete graph chromatic polynomial gives $`P_{n,1}=\prod_{i=1}^{n-1}(1-it)`$, whose strict log-concavity follows from Newton's inequalities.

For $`r\ge3`$, $`Z`$ is continuous and positive. If $`n`$ is odd, the expectation $`\mathbb E(1-tZ)^{n-1}`$ is strictly positive for every real $`t`$ (including the constant case $`n=1`$), so it has no real zeros. If $`n`$ is even, its derivative is
```math
 -(n-1)\mathbb E\bigl[Z(1-tZ)^{n-2}\bigr]<0
```
on the real line; its value at zero is 1 and its leading coefficient is negative. Hence it has exactly one simple real zero, positive. The remaining roots, when $`n\ge3`$, are nonreal. In particular, unrestricted real-rootedness in the number of colors fails for every complete graph with at least three vertices and $`r\ge3`$, even though ordinary log-concavity holds. No such real-rootedness claim is attributed to the authors.
