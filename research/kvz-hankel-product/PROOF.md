# Karp–Vishnyakova–Zhang's Hankel-product conjecture

## Statement and source

Karp, Vishnyakova, and Zhang proposed that the pointwise product of two sign-regular Hankel kernels of every order on the positive quadrant is again sign regular of every order. A Hankel kernel has the form $`K(x,y)=F(x+y)`$. There is no hypothesis that the two factors have the same signature.

This is **Conjecture 1 in the first preprint version**, [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), Section 3, item 11. It is also an explicit conjecture on slide 20 of [Karp's 15 October 2024 Sofia talk](https://math.bas.bg/wp-content/uploads/2024/10/JointSeminarSlides-20241015.pdf). The [second preprint version](https://arxiv.org/html/2408.01755v2) and [published paper](https://doi.org/10.1007/s00025-025-02431-4) retain the general product assertion as a belief, without the numbered label. The published Conjecture 1 concerns a different Bessel-function problem.

The result below refutes the entire product assertion. It does not decide the nearby assertion about $`\Gamma(c+x+y)/\Gamma(d+x+y)`$ or the reciprocal q-gamma kernel.

## Definition

A real kernel $`K`$ is sign regular of every order, denoted $`SR_\infty`$, if there are signs $`\epsilon_r\in\{-1,1\}`$, one for each positive integer $`r`$, such that

```math
\epsilon_r\det[K(x_i,y_j)]_{i,j=1}^r\geq0
```

whenever $`0\lt x_1<\cdots<x_r`$ and $`0\lt y_1<\cdots<y_r`$. The kernel is strictly sign regular if all these inequalities are strict. It is strictly totally positive when every $`\epsilon_r=1`$ and the inequalities are strict.

## The counterexample

**Theorem.** Both kernels

```math
K_1(x,y)=\frac1{x+y},\qquad
K_2(x,y)=\exp(-(x+y)^2)
```

are strictly sign regular of every order on $`(0,\infty)^2`$. Their pointwise product

```math
H(x,y)=\frac{\exp(-(x+y)^2)}{x+y}
```

is not sign regular of order two. In particular, it is not $`SR_\infty`$.

Thus the failure persists when both factors are strict in every order.

### 1. The Cauchy factor

The Cauchy determinant identity gives

```math
\det\left[\frac1{x_i+y_j}\right]_{i,j=1}^r
=\frac{\displaystyle\prod_{i<j}(x_j-x_i)(y_j-y_i)}
{\displaystyle\prod_{i,j}(x_i+y_j)}>0.
```

For completeness, the identity follows by multiplying by its displayed denominator. The resulting numerator is alternating separately in the $`x`$ variables and the $`y`$ variables, and has total degree $`r(r-1)`$. Hence it is a constant times the two Vandermonde products. Taking the residue at $`x_r=-y_r`$ reduces the constant to the one for size $`r-1`$, starting from one at size one. This proves the formula and strict total positivity in every order.

### 2. The exponential determinant

We use the elementary fact

```math
\det[e^{u_i v_j}]_{i,j=1}^r>0
\quad\text{if}\quad
u_1<\cdots<u_r,\quad v_1<\cdots<v_r,
```

where the variables can be arbitrary real numbers.

Here is a proof. A nonzero linear combination of $`r`$ exponentials with distinct real exponents has at most $`r-1`$ distinct real zeros. Induct on the number of nonzero coefficients: divide by the exponential with smallest exponent, differentiate, and apply Rolle's theorem and the induction hypothesis. Consequently the determinant never vanishes on the connected domain of increasing $`v`$ tuples.

To determine its sign, let $`v_j=v_0+\eta w_j`$, with increasing fixed $`w_j`$ and $`\eta>0`$ tending to zero. Taylor expansion and multilinearity give

```math
\det[e^{u_i(v_0+\eta w_j)}]
=e^{v_0\sum_i u_i}\eta^{\binom r2}
\frac{\displaystyle\prod_{i<j}(u_j-u_i)(w_j-w_i)}
{\displaystyle\prod_{k=0}^{r-1}k!}
+O\!\left(\eta^{\binom r2+1}\right).
```

The leading coefficient is positive. Nonvanishing and connectedness prove the claimed sign everywhere.

### 3. The Gaussian Hankel factor

Factor the entries as

```math
\exp(-(x_i+y_j)^2)
=\exp(-x_i^2)\exp(-y_j^2)\exp(-2x_i y_j).
```

The first two factors scale rows and columns by positive numbers. The sequence $`-2y_1,\ldots,-2y_r`$ is decreasing. Reverse the columns of the remaining exponential matrix and apply the preceding lemma. Reversal has sign $`(-1)^{\binom r2}`$. It follows that

```math
(-1)^{\binom r2}\det[K_2(x_i,y_j)]_{i,j=1}^r>0.
```

Therefore $`K_2`$ is strictly sign regular in every order, with the single global signature $`\epsilon_r=(-1)^{\binom r2}`$.

### 4. Two opposite signs for the product

For any $`t>0`$, choose the increasing tuples

```math
(x_1,x_2)=(y_1,y_2)=(t,2t).
```

The product-kernel determinant is

```math
\begin{aligned}
\Delta(t)
&=\frac{e^{-4t^2}}{2t}\frac{e^{-16t^2}}{4t}
-\left(\frac{e^{-9t^2}}{3t}\right)^2\\
&=\frac{e^{-20t^2}}{9t^2}
\left(\frac98-e^{2t^2}\right).
\end{aligned}
```

The prefactor is positive. If $`t=1/10`$, the exponential series and the geometric series imply

```math
e^{1/50}<\sum_{k=0}^{\infty}(1/50)^k
=\frac{50}{49}<\frac98.
```

Thus $`\Delta(1/10)>0`$. If $`t=1`$, then $`e^2>1+2=3>9/8`$, and hence $`\Delta(1)<0`$.

No sign $`\epsilon_2`$ works for both determinants. This proves the theorem. The two evaluations are exact witnesses to failure of a universal closure property; no numerical approximation is used.

The mechanism is also visible in

```math
\frac{d^2}{ds^2}\log\left(\frac{e^{-s^2}}s\right)
=\frac1{s^2}-2.
```

Its change of sign explains the opposing local order-two minors. The explicit determinants above make the argument independent of a limiting-minor criterion.

## Independent rational certificate

A second pair of Hankel factors gives entirely rational determinant values:

```math
G_1(x,y)=x+y,\qquad
G_2(x,y)=(1+x+y)^{-2}.
```

The first kernel has positive entries, order-two determinants $`-(x_2-x_1)(y_2-y_1)`$, and zero determinants in every order at least three. It is therefore $`SR_\infty`$ under the source's non-strict definition.

The second kernel is strictly totally positive in every order. Indeed,

```math
(1+x+y)^{-2}=\int_0^\infty t e^{-t}e^{-xt}e^{-yt}\,dt.
```

Expanding determinants under the integral gives the continuous Cauchy–Binet identity

```math
\det[G_2(x_i,y_j)]
=\int_{0<t_1<\cdots<t_r<\infty}
\det[e^{-x_i t_j}]\det[e^{-y_i t_j}]
\prod_{j=1}^r t_j e^{-t_j}\,dt_j>0.
```

The two exponential determinants have the same strictly nonzero sign. The integral is finite, as follows by expanding its finitely many terms and integrating products of decaying exponentials. This justifies both the identity and strict positivity.

For the product $`R(x,y)=(x+y)/(1+x+y)^2`$, the equal tuples $`x=y=(1/2,1)`$ give

```math
\det\begin{pmatrix}1/4&6/25\\6/25&2/9\end{pmatrix}
=-\frac{23}{11250}<0.
```

The equal tuples $`x=y=(1,2)`$ give

```math
\det\begin{pmatrix}2/9&3/16\\3/16&4/25\end{pmatrix}
=\frac{23}{57600}>0.
```

This independently refutes the original non-strict assertion. The first counterexample proves the stronger failure with strict factors in every order.

## Scope and status

The proof is self-contained apart from elementary determinant algebra, Taylor expansion, Rolle's theorem, and integration of exponential functions, all used explicitly above. A local exact verifier checks the rational witnesses and the rational bounds used for the exponential witnesses. Those checks supplement the proof.

The original numbered conjecture's later presentation as a prose belief is recorded in the source audit. The proof does not assert that the separate gamma-quotient sign-regularity problem is false. Prior-resolution review is ongoing in [issue 94](https://github.com/1337isnot1337/solved-conjectures/issues/94); the research note is unrefereed.
