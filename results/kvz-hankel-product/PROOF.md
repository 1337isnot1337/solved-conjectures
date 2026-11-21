# Karp–Vishnyakova–Zhang's Hankel-product conjecture

Status: complete proposed disproof, with two independent internal mathematical reviews. This work is unrefereed. [Discussion](https://github.com/1337isnot1337/solved-conjectures/issues/169). The pointwise product of two sign-regular Hankel kernels need not be sign regular even at order two. This remains false when both factors are strictly sign regular at every order. The two constructions below resolve the same conjecture.

## 1. The source statement

Karp, Vishnyakova, and Zhang explicitly state Conjecture 1 in Section 3, item 11, of [arXiv:2408.01755v1](https://arxiv.org/html/2408.01755v1), dated 3 August 2024. Its mathematical content is

```math
\begin{gathered}
K_i(x,y)=F_i(x+y)\in SR_\infty
\quad\text{on }(0,\infty)^2,\qquad i=1,2,\\
\Longrightarrow\quad
K_1(x,y)K_2(x,y)\in SR_\infty
\quad\text{on }(0,\infty)^2.
\end{gathered}
```

The March 2025 revision, [arXiv:2408.01755v2](https://arxiv.org/html/2408.01755v2), Section 3, item 11, retains this claim as an unnumbered general belief. The paper is *Unimodality preservation by ratios of functional series and integral transforms*, Results in Mathematics **80** (2025), 112, [DOI 10.1007/s00025-025-02431-4](https://doi.org/10.1007/s00025-025-02431-4). The checked conjecture text is the versioned arXiv text; the published first-page preview does not expose item 11. See SOURCES.md for the version audit.

By Definition 2.1 of the source, sign regularity means that, for every positive integer $`r`$, there is a sign $`\varepsilon_r\in\{-1,1\}`$ such that

```math
\varepsilon_r\det[K(x_i,y_j)]_{i,j=1}^r\ge0
\quad\text{whenever}\quad
0<x_1<\cdots<x_r,\quad0<y_1<\cdots<y_r.
```

The signs may depend on the order. There is no assumption that the two kernels have the same signature. Weak sign regularity permits zero determinants. Strict sign regularity replaces every inequality by a strict one. Total positivity is the case in which every sign is positive.

## 2. An elementary counterexample family

**Theorem 1.** For every real $`c\ge3`$, the kernels

```math
K_{1,c}(x,y)=x+y+c,
\qquad
K_2(x,y)=1+2^{-x-y}
\tag{1}
```

are sign regular at every order on the positive quadrant, but their pointwise product is not sign regular at order two.

**Proof.** The entries of both kernels are positive. For arbitrary increasing two-point node sets,

```math
\det[K_{1,c}(x_i,y_j)]_{i,j=1}^2
=-(x_2-x_1)(y_2-y_1)<0,
\tag{2}
```

and

```math
\det[K_2(x_i,y_j)]_{i,j=1}^2
=(2^{-x_1}-2^{-x_2})(2^{-y_1}-2^{-y_2})>0.
\tag{3}
```

Each kernel is a sum of two separated products of a function of $`x`$ and a function of $`y`$. Its rank on every finite grid is therefore at most two. Every determinant of order at least three vanishes. Equations (2)–(3) prove $`K_{1,c}\in SR_\infty`$ and $`K_2\in TP_\infty`$.

Set

```math
h_c(s)=(s+c)(1+2^{-s}),\qquad s>0.
```

For the positive nodes $`x_1=y_1=s/2`$, $`x_2=y_2=s/2+1`$, the product kernel has the minor

```math
\begin{aligned}
\Delta_c(s)
&=h_c(s)h_c(s+2)-h_c(s+1)^2\\
&=-1+
\frac{\big((s+c)^2+2(s+c)-4\big)2^{-s}-2^{-2s}}{4}.
\end{aligned}
\tag{4}
```

Consequently,

```math
\Delta_c(2)=\frac{4(c+3)^2-85}{64}>0
\qquad(c\ge3),
\tag{5}
```

whereas

```math
\lim_{s\to\infty}\Delta_c(s)=-1.
\tag{6}
```

The latter limit follows because an exponential decay dominates the quadratic polynomial in (4). Thus a second minor is negative for all sufficiently large $`s`$. No one sign works for all order-two minors. This proves the theorem and refutes the conjecture. ∎

The proof covers a whole family of kernels on the full positive quadrant. For a short exact certificate, take $`c=3`$. The grids $`x=y=(1,2)`$ and $`x=y=(5,6)`$ give, respectively,

```math
\Delta_3(2)=\frac{59}{64}>0,
\qquad
\Delta_3(10)=-\frac{3998721}{4194304}<0.
\tag{7}
```

These rational certificates can be checked without floating-point arithmetic. The finite grids witness failure of the universal kernel claim; they are not the claimed scope of a positive theorem.

## 3. A counterexample with strictly sign-regular factors

The next construction shows that zero higher-order minors are not responsible for the failure.

**Theorem 2.** For every real $`c>0`$, both kernels

```math
A_c(x,y)=\sqrt{x+y+c},
\qquad
B(x,y)=\frac{1}{1-2^{-x-y}}
\tag{8}
```

are strictly sign regular at every order on the positive quadrant. The signature of $`A_c`$ is $`\varepsilon_r=(-1)^{r-1}`$, and $`B`$ is strictly totally positive. Their pointwise product fails sign regularity at order two.

We first give the determinant criterion used to verify the factors.

### A Wronskian criterion

Let $`f_1,\ldots,f_r`$ be smooth real functions on an interval, and write

```math
W_k(t)=\det[f_j^{(i-1)}(t)]_{i,j=1}^k.
```

If all initial Wronskians $`W_k`$, $`1\le k\le r`$, are everywhere nonzero, then

```math
\det[f_j(t_i)]_{i,j=1}^r\ne0
\quad(t_1<\cdots<t_r),
```

and its sign equals that of $`W_r`$.

Here is a proof. Induct on $`r`$ to show that a nonzero linear combination of the first $`r`$ functions has at most $`r-1`$ distinct zeros. Divide such a combination by the nonvanishing $`f_1`$ and differentiate. The remaining functions are

```math
g_j=(f_{j+1}/f_1)',\qquad1\le j\le r-1,
```

and their initial Wronskians satisfy

```math
W(g_1,\ldots,g_k)
=\frac{W(f_1,\ldots,f_{k+1})}{f_1^{k+1}}.
\tag{9}
```

The identity follows by the triangular Leibniz-rule matrix for multiplying every column function by $`1/f_1`$, then expanding along the resulting constant first column. Every right side is nonzero. Rolle's theorem and induction therefore prove the zero bound. If the derivative vanishes identically, nonvanishing of its full Wronskian forces all coefficients except that of $`f_1`$ to vanish, and that case has no zeros. A zero evaluation determinant would contradict the zero bound. Its sign is constant on the connected ordered-node region, and coalescing equally spaced nodes determines the sign: its leading Taylor term is

```math
\frac{W_r(t)}{\prod_{i=0}^{r-1}i!}
\prod_{i<j}(t_j-t_i),
```

whose Vandermonde factor is positive.

### Strict sign regularity of the square-root kernel

Fix $`0<y_1<\cdots<y_r`$ and put $`f_j(x)=(x+y_j+c)^{1/2}`$. For general $`\alpha`$, differentiation and the Vandermonde identity give

```math
\begin{aligned}
W_k(x)
={}&(-1)^{\binom{k}{2}}
\left(\prod_{i=0}^{k-1}\alpha^{\underline i}\right)
\left(\prod_{j=1}^k(x+y_j+c)^{\alpha-k+1}\right)
\prod_{i<j}(y_j-y_i),\\
&\alpha^{\underline0}=1,\qquad
\alpha^{\underline i}=\alpha(\alpha-1)\cdots(\alpha-i+1).
\end{aligned}
\tag{10}
```

Indeed, factor $`\alpha^{\underline i}`$ from derivative row $`i`$, and $`(x+y_j+c)^{\alpha-k+1}`$ from column $`j`$. The remaining matrix has descending integer powers from $`k-1`$ to zero. Reversing its rows gives the usual Vandermonde determinant and the sign in (10).

For $`\alpha=1/2`$, none of the falling factorials vanishes. Their signs make the sign in (10) equal to

```math
(-1)^{k(k-1)/2+(k-1)(k-2)/2}=(-1)^{k-1}.
```

The Wronskian criterion proves the asserted strict signature of $`A_c`$ at every order.

### Strict total positivity of the geometric-series kernel

For positive $`x,y`$,

```math
B(x,y)=\sum_{n=0}^{\infty}2^{-nx}2^{-ny}.
\tag{11}
```

For distinct increasing integers $`n_1<\cdots<n_r`$, the determinant

```math
\det[2^{-n_jx_i}]_{i,j=1}^r
```

is nonzero with sign $`(-1)^{\binom r2}`$. One can again use the Wronskian criterion: the exponents $`-n_j\log2`$ strictly decrease, so each Wronskian is an exponential positive factor times the Vandermonde product of these exponents. The same statement holds for the $`y`$ nodes.

Truncate (11) at $`n=N`$, with $`N\ge r-1`$. Cauchy–Binet expresses its order-$`r`$ minor as a sum over $`0\le n_1<\cdots<n_r\le N`$ of products of these two exponential determinants. Every term is strictly positive. The term with indices $`0,\ldots,r-1`$ is positive and independent of $`N`$. Entrywise geometric convergence, followed by continuity of the determinant, therefore proves that the minor of $`B`$ is strictly positive. This proves $`B\in STP_\infty`$.

### Failure of the product at order two

Set

```math
Q_c(s)=\frac{\sqrt{s+c}}{1-2^{-s}},\qquad L_c(s)=\log Q_c(s).
```

A direct differentiation yields

```math
L_c''(s)
=-\frac{1}{2(s+c)^2}
+\frac{(\log2)^2\,2^{-s}}{(1-2^{-s})^2}.
\tag{12}
```

As $`s\downarrow0`$, the second term is asymptotic to $`s^{-2}`$ and the first stays bounded because $`c>0`$. Thus $`L_c''`$ is positive near zero. As $`s\to\infty`$, the second term is $`O(2^{-s})`$ while the first is asymptotic to $`-1/(2s^2)`$. Thus $`L_c''`$ is negative for all sufficiently large $`s`$.

For any fixed $`s>0`$, Taylor expansion gives

```math
Q_c(s)Q_c(s+2h)-Q_c(s+h)^2
=h^2Q_c(s)^2L_c''(s)+O(h^3)
\qquad(h\downarrow0).
\tag{13}
```

This is a minor on the allowed node sets $`x=y=(s/2,s/2+h)`$. Choose one $`s`$ where (12) is positive and another where it is negative, then choose a sufficiently small positive $`h`$ for each. Equation (13) provides minors of both signs. The product is not $`SR_2`$, completing the proof of Theorem 2. ∎

For $`c=3`$, no limiting argument is needed to certify the two signs. On $`x=y=(1,2)`$, the minor is

```math
64\left(\frac{\sqrt{35}}{45}-\frac{6}{49}\right)>0,
```

because both quantities being compared are positive and

```math
35\cdot49^2-(6\cdot45)^2=11135>0.
```

On $`x=y=(5,6)`$, the minor is

```math
2^{22}\left(\frac{\sqrt{195}}{1023\cdot4095}
-\frac{14}{2047^2}\right)<0,
```

because

```math
196(1023\cdot4095)^2-195\cdot2047^4
=15876073570305>0.
```

## 4. Scope of the conclusion

The conjecture as stated is false, including under the stronger assumption of strict sign regularity of both factors. Both constructions use factors with different order-two signatures, as the source explicitly permits. No conclusion about a conjecture restricted to equal signatures is asserted.

The source's separate gamma-quotient conjecture does not follow or fail as a consequence of this counterexample. It concerns a particular product, whereas the refuted conjecture quantifies over all sign-regular Hankel kernels. The classical closure theorem for totally positive Hankel matrices also remains unaffected: one factor here has negative order-two minors.

The proof is exact and does not rely on a numerical search, external formalization, or an unproved mathematical premise. The accompanying standard-library script verifies the polynomial identity (4), the rational witnesses (7), and the integer inequalities for the strict-factor witnesses.
