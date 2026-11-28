# Malek's subpermanent conjecture

Research date: 20 November 2026 (America/Chicago).

Status: complete proposed proof. Two independent internal reviews found no mathematical gap; the bounded source audit found no prior full endpoint theorem. The proof is unrefereed. This is the named all-degree extension attributed to Malek in Cheon and Wanless's discussion of Minc Conjecture 3. It is a subsidiary in the Minc source chain, not a second resolution of the already proved permanent case. No Lean verification is part of this work.

## Statement

Let $`\Omega_n`$ be the nonnegative doubly stochastic matrices of order $`n`$, let $`J_n=\mathbf1\mathbf1^T/n`$, and let $`\sigma_k(A)`$ be the sum of the permanents of all $`k`$-by-$`k`$ submatrices, with $`\sigma_0=1`$. Define

```math
\mathcal T_n(A)=\frac{nJ_n-A}{n-1}
              =J_n-\frac{A-J_n}{n-1}.
```

**Theorem.** For every integer $`n\ge2`$, every $`A\in\Omega_n`$, and every $`0\le k\le n`$,

```math
\sigma_k(A)\ge \sigma_k(\mathcal T_n(A)).
\tag{1}
```

For $`k=0,1`$, equality always holds. For $`k\ge2`$, the equality cases are:

- $`n=2,\ k=2`$: every doubly stochastic matrix;
- $`n=3,\ k=2`$: only $`J_3`$;
- $`n=3,\ k=3`$: $`J_3`$ and $`(\mathbf1\mathbf1^T-P)/2`$, where $`P`$ is a permutation matrix;
- $`n\ge4`$: only $`J_n`$.

The case $`k=n`$, including its equality cases, is Lavi's previously proved Marcus–Minc theorem [2]. The new argument covers every proper degree simultaneously. It does not assert monotonicity along the entire segment from $`A`$ to its transform; that stronger statement is false.

## Inputs and normalization

Put

```math
d_n=\frac{n!}{n^n},\qquad
S_{n,k}=\binom nk^2\frac{k!}{n^k},\qquad
\alpha_{n,k}=\frac{k(k-1)}{n(n-1)},\qquad
X=A-J_n,\qquad r^2=\|X\|_F^2,
```

and write $`q_k(A)=\sigma_k(A)/S_{n,k}`$. The proof establishes, for $`n\ge5`$ and $`2\le k<n`$,

```math
q_k(A)\ge
\exp\!\left(\frac{5}{4n^2}\alpha_{n,k}r^2\right).
\tag{2}
```

It then compares this with a strictly smaller linear upper coefficient for $`q_k(\mathcal T_n(A))`$.

We use two published analytic inputs, with their roles kept separate:

1. Gurvits's coefficient–capacity inequality: if $`p`$ is homogeneous of degree $`m`$ in $`m`$ variables, real stable, and has nonnegative coefficients, then
   $`[z_1\cdots z_m]p\ge d_m\mathop{\mathrm{Cap}}(p)`$, where
   $`\mathop{\mathrm{Cap}}(p)=\inf_{z>0}p(z)/\prod_i z_i`$ [4].
2. Lavi's centered-subpermanent estimate [2, Lemma 3.1; 3, Lemma 5.1]: if $`Y`$ has zero row and column sums and $`\|Y\|_{2\to2}\le1`$, and $`Q=I-J_n`$, then
   $`|\sigma_j(Y)|\le \sigma_j(Q)\|Y\|_F^2/(n-1)`$ for $`2\le j\le n`$.

The stable polynomial, optimized-slice notation, root movement, and scalar coefficient step below are those of [3, Sections 2–3]. They are reproduced to make the improvement in their capacity estimate explicit.

## 1. A stronger capacity cost for proper degrees

Initially suppose every entry of $`A`$ is positive. Let $`2\le k<n`$, $`m=n-k`$, and define

```math
P(z)=\frac{e_k(Az)}{\binom nk}
     \left(\frac{z_1+\cdots+z_n}{n}\right)^m.
\tag{3}
```

The elementary symmetric polynomial $`e_k`$ is real stable. Composition with the positive linear forms in $`Az`$, and multiplication by the uniform linear factors, preserve stability. Thus $`P`$ is real stable, homogeneous of degree $`n`$, and has positive coefficients. Direct differentiation gives

```math
P(\mathbf1)=1,\qquad
\partial_jP(\mathbf1)=1,\qquad
\nabla^2\log P(\mathbf1)=-J_n-\alpha_{n,k}X^TX.
\tag{4}
```

Its central coefficient is

```math
[z_1\cdots z_n]P
=\frac{(n-k)!}{\binom nk\,n^{n-k}}\sigma_k(A)
=d_nq_k(A).
\tag{5}
```

For a positive vector $`z`$, write $`E_j(z)=e_j(z)/\binom nj`$. Since $`A`$ is doubly stochastic, $`Az`$ is majorized by $`z`$. Elementary symmetric polynomials are Schur-concave on the positive orthant, hence $`E_k(Az)\ge E_k(z)`$. One can see this Schur-concavity directly: averaging a pair of coordinates with fixed sum increases their product, and the coefficient of that product in $`e_k`$ is nonnegative.

Newton's inequalities imply that $`E_{j+1}(z)/E_j(z)`$ is nonincreasing in $`j`$. Therefore

```math
E_{n-1}(z)\le E_k(z)E_1(z)^{n-1-k}.
```

Combining these facts yields the capacity-cost estimate

```math
\frac{P(z)}{\prod_i z_i}
\ge
\frac{E_{n-1}(z)E_1(z)}{\prod_i z_i}
=
\left(\frac{\sum_i z_i}{n}\right)
\left(\frac{\sum_i z_i^{-1}}{n}\right).
\tag{6}
```

This replaces the weaker estimate that keeps only the $`n-k`$ uniform factors. It uses $`k<n`$ essentially.

Fix a coordinate $`j`$, hold the other coordinates $`x=(x_h)_{h\ne j}`$ positive, and set $`z_j=t`$. The polynomial $`h_x(t)=P(z)`$ has degree $`n`$, positive coefficients and negative real roots. The function $`h_x(t)/t`$ has a unique minimizer $`t_*>0`$. Write

```math
h_x(t)=h_x(0)\prod_{i=1}^n\left(1+\frac t{\lambda_i(x)}\right),
\qquad
p_i=\frac{t_*}{t_*+\lambda_i(x)},\qquad
d=\sum_i p_i^2-\frac1n,
```

```math
F=\log\frac{h_x(t_*)}{t_*\prod_{h\ne j}x_h},
\qquad
R=\log\frac{\max_{h\ne j}x_h}{\min_{h\ne j}x_h}.
\tag{7}
```

The minimizing equation is $`\sum_i p_i=1`$. At $`x=\mathbf1`$, equation (4) gives $`t_*=1`$; write the corresponding probability vector as $`p^0`$. Then

```math
d_0:=\left\|p^0-\frac{\mathbf1}{n}\right\|_2^2
=\alpha_{n,k}\|X_{:j}\|_2^2,\qquad
0\le d_0\le1-\frac1n.
\tag{8}
```

To apply (6), choose two of the fixed coordinates with ratio $`e^R`$. Their sums in $`z`$ and $`z^{-1}`$ have product $`4\cosh^2(R/2)`$. If $`S,T`$ are the corresponding sums of the other $`n-2`$ coordinates and their reciprocals, then $`ST\ge(n-2)^2`$. Cauchy–Schwarz on the cross terms gives

```math
\left(\sum_i z_i\right)\left(\sum_i z_i^{-1}\right)
\ge\left(n-2+2\cosh(R/2)\right)^2.
```

Consequently, for every positive $`x`$,

```math
F\ge
2\log\left[1+\frac2n\left(\cosh(R/2)-1\right)\right].
\tag{9}
```

In particular, $`F\ge0`$.

## 2. The root-movement estimate

We recall the root comparison in [3, Lemma 3.1 and equations (3.10)–(3.14)]. Set

```math
a_i=a_{ij},\qquad
b_i=\sum_{h\ne j}a_{ih}x_h,\qquad
b_i^0=1-a_i,
```

and let $`u=\min_{h\ne j}x_h`$, $`v=\max_{h\ne j}x_h`$. Then $`ub^0\le b\le vb^0`$ coordinatewise.

The ordered negative roots of $`e_k(b+at)`$ are nonincreasing in every coordinate of $`b`$, and scale linearly when $`b`$ is scaled. For completeness, varying one coordinate of $`b`$ gives a pencil $`H(t)+sL(t)`$. Real stability places $`H`$ and $`L`$ in proper position; their zeros interlace and the ordered zeros of this pencil move to the left as $`s`$ increases. The monotonicity extends across multiple roots by continuity. The additional uniform factors have root $`-\sum_{h\ne j}x_h`$, with the same bounds. After merging the ordered root lists,

```math
u\lambda_i(\mathbf1)\le\lambda_i(x)\le v\lambda_i(\mathbf1),
\qquad
u\le t_*\le v.
\tag{10}
```

The second assertion follows from the strictly increasing equation
$`\sum_i t/(t+\lambda_i(x))=1`$. Therefore the likelihood ratios $`p_i^0/p_i`$ lie in an interval whose largest-to-smallest ratio is at most $`v/u=e^R`$.

Here is the probability calculation that converts this to a Euclidean bound. If two positive probability vectors have likelihood ratios $`L_i=p_i^0/p_i`$ between $`\ell`$ and $`q\ell`$, with $`q\le e^R`$, then $`\sum_i p_iL_i=1`$ and

```math
\sum_i p_i(L_i-1)^2
\le(q\ell-1)(1-\ell)
\le\frac{(q-1)^2}{4q}
\le\sinh^2(R/2).
```

Writing $`p_{\max}=\max_i p_i`$, this gives

```math
\|p^0-p\|_2^2\le p_{\max}\sinh^2(R/2),
\qquad
\sqrt{d_0}\le\sqrt d+\sqrt{p_{\max}}\sinh(R/2).
\tag{11}
```

Also, since the deviations of the coordinates of $`p`$ from $`1/n`$ sum to zero,

```math
p_{\max}\le\frac1n+\sqrt{\frac{n-1}{n}\,d}.
\tag{12}
```

## 3. A uniform slice bound

We prove that, for $`n\ge5`$,

```math
F+\frac d2\ge\frac{5}{4n}d_0.
\tag{13}
```

If $`d_0=0`$, this follows from $`F,d\ge0`$. Otherwise suppose, for a contradiction, that the reverse weak inequality holds. Set

```math
s=\sqrt{\frac d{d_0}},\qquad
w=\frac54-\frac n2s^2.
```

Then $`w\ge0`$, $`s^2\le5/(2n)\le1/2`$, and

```math
0\le F\le\frac{d_0w}{n}\le\frac14,\qquad
np_{\max}\le1+(n-1)s.
\tag{14}
```

For $`0\le F\le1/4`$, the exponential series gives

```math
e^{F/2}-1
\le\frac{F/2}{1-F/4}
\le\frac8{15}F.
\tag{15}
```

Indeed, $`r!\ge2^{r-1}`$ for $`r\ge1`$ bounds the series by the displayed geometric series.

Equation (9) implies
$`\cosh(R/2)\le1+\frac n2(e^{F/2}-1)`$. Applying (14) and (15), and using $`d_0\le1`$ and $`w\le5/4`$, we obtain

```math
\begin{aligned}
\sinh^2(R/2)
&\le n(e^{F/2}-1)+\frac{n^2}{4}(e^{F/2}-1)^2
\\ &\le \frac8{15}d_0w+\frac{16}{225}d_0^2w^2
\\ &\le\frac{28}{45}d_0w.
\end{aligned}
\tag{16}
```

Dividing (11) by $`\sqrt{d_0}`$ now gives

```math
1\le
s+\sqrt{\frac{28}{45}
 (1+(n-1)s)\left(\frac5{4n}-\frac{s^2}{2}\right)}.
\tag{17}
```

This is impossible. For fixed $`0\le s<1`$, the expression

```math
(1+(n-1)s)\left(\frac5{4n}-\frac{s^2}{2}\right)
=\frac54s+\frac{5(1-s)}{4n}
-\frac{s^2(1-s)}2-\frac{ns^3}2
```

decreases with $`n`$. At $`n=5`$, the difference between $`(1-s)^2`$ and the expression under the square root in (17) is

```math
\frac{56s^3+59s^2-118s+38}{45}>0.
\tag{18}
```

To verify this strictly and without numerical approximation, convexity of $`s^3`$ on $`s\ge0`$, with its tangent at $`5/9`$, gives

```math
56s^3+59s^2-118s+38
\ge59s^2-\frac{1786}{27}s+\frac{13702}{729}.
```

The quadratic has positive leading coefficient and discriminant
$`-43876/729`$. It is strictly positive for every real $`s`$. Since $`s<1`$, equation (18) makes the right side of (17) strictly less than one. This proves (13).

## 4. From slices to the subpermanent lower bound

The scalar step of Gurvits's proof has a useful refinement, reproduced in [3, Lemma 2.2]. For the optimized slice in (7),

```math
h_x'(0)\ge
\left(\frac{n-1}{n}\right)^{n-1}
\frac{h_x(t_*)}{t_*}e^{d/2}.
\tag{19}
```

It also follows directly. In terms of the probability vector $`p`$,

```math
\frac{h_x'(0)}{h_x(t_*)/t_*}
=\sum_i p_i\prod_{\ell\ne i}(1-p_\ell)
\ge\prod_i(1-p_i)^{1-p_i}
\ge\left(\frac{n-1}{n}\right)^{n-1}e^{d/2}.
```

The first inequality is weighted AM–GM. For the second, expand
$`(1-t)\log(1-t)=-t+\sum_{\ell\ge2}t^\ell/[\ell(\ell-1)]`$. The linear terms cancel; the quadratic term contributes $`d/2`$; convexity makes every higher contribution relative to the uniform probability vector nonnegative.

Let $`P_j=\partial_jP|_{z_j=0}`$. Equations (13) and (19) give

```math
\mathop{\mathrm{Cap}}(P_j)
\ge
\left(\frac{n-1}{n}\right)^{n-1}
\exp\!\left(\frac{5}{4n}d_0\right).
```

The polynomial $`P_j`$ is stable, homogeneous of degree $`n-1`$ in $`n-1`$ variables, and has nonnegative coefficients. Applying the coefficient–capacity inequality and using
$`d_{n-1}((n-1)/n)^{n-1}=d_n`$, equations (5) and (8) imply

```math
q_k(A)\ge
\exp\!\left(\frac{5}{4n}\alpha_{n,k}\|X_{:j}\|_2^2\right)
\quad\text{for every }j.
```

Some column has squared norm at least $`r^2/n`$. This proves (2) for positive $`A`$. Replacing an arbitrary $`A\in\Omega_n`$ by
$`(1-\varepsilon)A+\varepsilon J_n`$ and taking $`\varepsilon\downarrow0`$ proves (2) on the whole polytope, including its boundary.

## 5. The transformed upper bound

For a matrix $`Y`$ with zero margins, selecting the entries supplied by $`Y`$ in a subpermanent gives

```math
q_k(J_n+tY)
=1+\sum_{j=2}^k
 \frac{(k)_j n^j}{(n)_j^2}\,\sigma_j(Y)t^j.
\tag{20}
```

Here $`(a)_j=a(a-1)\cdots(a-j+1)`$. A doubly stochastic matrix is a convex combination of permutation matrices and hence has Euclidean operator norm at most one. Its restriction to $`\mathbf1^\perp`$ is $`X=A-J_n`$, so $`\|X\|_{2\to2}\le1`$.

Apply the centered estimate from [2,3] term by term in (20), with $`t=-1/(n-1)`$. Since $`\sigma_j(Q)\ge0`$, the result is

```math
q_k(\mathcal T_n(A))
\le1+b_{n,k}\alpha_{n,k}r^2,
\qquad
b_{n,k}:=
\frac{q_k(J_n+Q/(n-1))-1}{(n-1)\alpha_{n,k}}.
\tag{21}
```

The positivity of $`\sigma_j(Q)`$ also follows from the tensor identity
$`\sigma_j(Q)=\langle u_j,Q^{\otimes j}u_j\rangle\ge0`$, with $`u_j`$ the sum of the normalized square-free symmetric basis tensors.

For fixed $`n`$, $`b_{n,k}`$ is nondecreasing in $`k\ge2`$. In the centered expansion, division by $`\alpha_{n,k}`$ leaves the $`j`$-th coefficient proportional to $`(k-2)_{j-2}`$, with every other factor nonnegative. Terms first appearing at a larger $`k`$ are nonnegative as well.

For exact evaluation, selecting identity entries gives

```math
q_k(J_n+tQ)=
\sum_{j=0}^k
\frac{(k)_j}{(n)_j}
\frac{(nt)^j(1-t)^{k-j}}{j!}.
\tag{22}
```

The following rational comparisons handle the initial orders:

| Range | Upper coefficient used | Exact gap from $`5/(4n^2)`$ |
| --- | --- | --- |
| $`n=5,\ 2\le k<5`$ | $`b_{5,4}=3685/73728`$ | $`7/368640`$ |
| $`n=6,\ 2\le k<6`$ | $`b_{6,5}=4767/156250`$ | $`47401/11250000`$ |
| $`n=7,\ 2\le k<7`$ | $`b_{7,7}=4421129/201553920`$ | $`35307079/9876142080`$ |

These are checks of three scalar constants in an all-order proof, not finite matrix tests.

For $`n\ge8`$, use $`b_{n,k}\le b_{n,n}=\beta_n`$ and [2, Section 5]'s bound

```math
\beta_n\le
\frac{n}{(n-1)(2(n-2)^2-n)}
<\frac5{4n^2}.
\tag{23}
```

The first bound can be checked directly from (22) at $`k=n`$. For $`0<t<1`$,

```math
q_n(J_n+tQ)\le
(1-t)^n\exp\!\left(\frac{nt}{1-t}\right).
```

Its logarithm is at most

```math
n\left(\log(1-t)+\frac{t}{1-t}\right)
=n\sum_{\ell\ge2}\frac{\ell-1}{\ell}t^\ell
\le\frac{nt^2}{2(1-t)^2}.
```

At $`t=1/(n-1)`$, put $`x=n/[2(n-2)^2]<1`$. The estimate
$`e^x-1\le x/(1-x)`$ gives the first inequality in (23).

The second inequality is equivalent to
$`6n^3-55n^2+85n-40>0`$. On writing $`n=8+m`$, this polynomial is
$`6m^3+89m^2+357m+192`$, positive for every $`m\ge0`$.

Thus $`b_{n,k}<5/(4n^2)`$ for all $`n\ge5,\ 2\le k<n`$. Combining (2) and (21) gives

```math
q_k(A)-q_k(\mathcal T_n(A))
\ge
\left(\frac5{4n^2}-b_{n,k}\right)\alpha_{n,k}r^2.
\tag{24}
```

This proves the inequality and strictness away from $`J_n`$ for all those parameters.

## 6. Initial orders and equality

The degrees $`k=0,1`$ are constant on $`\Omega_n`$. The full degree $`k=n`$ is [2, Theorem 1.1], with the equality cases listed above.

For proper degree two, the centered expansion is exact and

```math
\sigma_2(A)-\sigma_2(\mathcal T_n(A))
=\left(1-\frac1{(n-1)^2}\right)\sigma_2(X),
\qquad
\sigma_2(X)=\frac12\|X\|_F^2.
\tag{25}
```

This is strictly positive for $`n\ge3`$ unless $`A=J_n`$.

The only remaining pair is $`n=4,\ k=3`$. For every zero-margin matrix,

```math
\sigma_3(X)=\frac23\sum_{i,j}x_{ij}^3.
```

The identity follows by inclusion–exclusion on the repeated row and column indices in the ordered triple sum. Since $`x_{ij}\ge-1/n`$,

```math
\sigma_3(X)\ge-\frac4{3n}\sigma_2(X).
```

Using

```math
\sigma_3(J_n+tX)
=\sigma_3(J_n)+\frac{(n-2)^2}{n}t^2\sigma_2(X)
+t^3\sigma_3(X)
```

at $`n=4`$, $`t=1`$ and $`t=-1/3`$, gives

```math
\sigma_3(A)-\sigma_3(\mathcal T_4(A))
\ge\frac{44}{81}\sigma_2(X).
\tag{26}
```

It is strict away from $`J_4`$. Together with the prior full-degree theorem, this completes every parameter and every equality case.

## Scope, dependency, and review status

This proves one named historical subsidiary conjecture if the argument withstands review. The full-permanent endpoint, the centered estimate, the stable polynomial, and the root-movement estimate are prior work. The proposed new step is the reciprocal-mean capacity cost (6), its slice consequence (13), and their use to close the negative transform for every proper degree.

It does not solve Lih–Wang's half-segment inequality, the false Holens–Djokovic conjecture, Gyires's inequality, or the full boundary-monotonicity classification. It supplies no new claim for the already resolved numbered Conjecture 3.

The narrow order-five rational margin is explicit. The proof of its lower coefficient is an all-order analytic inequality, and the scalar checks accompany the proof for reproducibility. They do not replace the proof, and internal review is not external refereeing. See the separate source audit for priority and eligibility limits.

## References

1. G.-S. Cheon and I. M. Wanless, *An update on Minc's survey of open problems involving permanents*, Linear Algebra and its Applications 403 (2005), 314–342, DOI [10.1016/j.laa.2005.02.030](https://doi.org/10.1016/j.laa.2005.02.030). The Conjecture 3 discussion, equation (9), attributes the all-degree endpoint to Malek. [Author PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
2. Y. Lavi, *The Marcus–Minc Transform Inequality*, 24 September 2026, [arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1). Theorem 1.1, Lemma 3.1, and Section 5 are used. [Numbered Minc page](https://yair-lavi.com/mincs-list/conjecture-3/index.html).
3. Y. Lavi, *The Kopotun Subpermanent Transform Inequality*, manuscript dated 11 October 2026, [Hexagon 2611.00201v1](https://hexagonmath.org/pdf/2611.00201v1). Sections 2–3 supply the polynomial and optimized-root method. Its proved transform is $`(nJ_n+A)/(n+1)`$, distinct from (1).
4. L. Gurvits, *Van der Waerden/Schrijver–Valiant like conjectures and stable (aka hyperbolic) homogeneous polynomials: one theorem for all*, Electronic Journal of Combinatorics 15 (2008), R66, DOI [10.37236/790](https://doi.org/10.37236/790).
5. M. Malek, *A note on a permanental conjecture of M. Marcus and H. Minc*, Linear and Multilinear Algebra 25 (1989), 71–73, DOI [10.1080/03081088908817929](https://doi.org/10.1080/03081088908817929). The exact conjecture is transcribed from [1]; full-text access limits for this original paper are stated in the source audit.
