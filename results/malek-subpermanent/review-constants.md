# Malek negative-transform constants review

Research date: 2026-11-20 (America/Chicago).

This independently checks the proposed strengthened subpermanent lower bound and the constants needed to compare it with the negative transform. The proof in this note covers $`n\geq5`$ and $`2\leq k<n`$. The permanent case $`k=n`$, the smaller orders, and the historical scope of Malek's conjecture must be supplied separately when stating the full result. No matrix search or finite-order extension is used.

The two source inputs inspected were Yair Lavi's [Kopotun paper](https://hexagonmath.org/pdf/2611.00201v1), especially Sections 3, 5, and 6, and his [Marcus–Minc paper](https://arxiv.org/html/2609.29262v1), especially Sections 3–5. The former supplies the stable-polynomial slice framework, root-motion estimate, and centered subpermanent bound. The latter supplies the rational upper bound on the full permanent comparison constant. The stronger capacity estimate below is the campaign's proposed improvement; it is not attributed to those papers.

## Notation

Let $`A`$ be doubly stochastic of order $`n`$, let $`J=\mathbf1\mathbf1^{\mathsf T}/n`$, and set

```math
X=A-J,\quad Q=I-J,\quad r^2=\|X\|_F^2,
\quad S_{n,k}=\binom nk^2\frac{k!}{n^k},
\quad q_k(D)=\frac{\sigma_k(D)}{S_{n,k}},
\quad \alpha_{n,k}=\frac{k(k-1)}{n(n-1)}.
```

The transform is $`T(A)=(nJ-A)/(n-1)=J-X/(n-1)`$. It is doubly stochastic because every entry of $`A`$ lies in $`[0,1]`$.

## 1. The improved capacity cost

Assume first that $`A`$ is positive, put $`m=n-k\geq1`$, and use the degree-$`n`$ stable polynomial

```math
P(z)=E_k(Az)E_1(z)^m,
\qquad E_j(z)=\frac{e_j(z)}{\binom nj}.
```

For positive $`z`$, double stochasticity implies $`Az\prec z`$. The elementary symmetric polynomial is Schur-concave, so $`E_k(Az)\geq E_k(z)`$. The normalized Newton inequalities make $`E_{j+1}/E_j`$ nonincreasing in $`j`$; hence

```math
E_{n-1}(z)\leq E_k(z)E_1(z)^{m-1}.
```

The direction of this inequality matters. It yields

```math
\frac{P(z)}{\prod_i z_i}
\geq \frac{E_1(z)E_{n-1}(z)}{E_n(z)}
=\left(\frac1n\sum_i z_i\right)
 \left(\frac1n\sum_i z_i^{-1}\right).
\tag{1}
```

Fix a slice coordinate $`j`$. For the other coordinates $`x_h>0`$, let $`R=\log(\max x_h/\min x_h)`$. At the optimizing slice coordinate $`z_j=t_*`$, set $`F=\log(P(z)/\prod z_i)`$. Choose two of the other coordinates with ratio $`e^R`$, and scale all coordinates so that these two are $`e^{-R/2},e^{R/2}`$. If the remaining coordinates have sums $`u`$ and reciprocal sum $`v`$, then $`uv\geq(n-2)^2`$ and $`u+v\geq2(n-2)`$. Therefore (1) gives

```math
F\geq2\log\left(1+\frac{2}{n}\bigl(\cosh(R/2)-1\bigr)\right).
\tag{2}
```

This also covers $`R=0`$. The argument uses two distinct other coordinates, available because $`n\geq5`$.

## 2. The pointwise lower bound

Use the slice probabilities $`p_i=t_*/(t_*+\lambda_i)`$, their values $`p_i^0`$ when all other coordinates equal one, and

```math
d=\sum_i p_i^2-\frac1n,\qquad
d_0=\sum_i(p_i^0)^2-\frac1n
=\alpha_{n,k}\|X_{:j}\|_2^2.
```

The inspected root-motion estimate gives

```math
\sqrt{d_0}\leq\sqrt d+\sqrt{p_{\max}}\sinh(R/2),
\qquad
p_{\max}\leq\frac1n+\sqrt{\frac{n-1}{n}d}.
\tag{3}
```

If $`d_0=0`$, then $`F+d/2\geq0`$ suffices. Otherwise suppose, for contradiction, that

```math
F+\frac d2\leq\frac{5d_0}{4n}.
```

Write $`s=\sqrt{d/d_0}`$ and $`w=5/4-ns^2/2`$. Then

```math
0\leq s\leq\sqrt{\frac{5}{2n}}<1,
\quad 0\leq w\leq\frac54,
\quad F\leq\frac{d_0w}{n}\leq\frac14.
```

For $`0\leq F\leq1/4`$, the factorial bound $`\ell!\geq2^{\ell-1}`$ gives

```math
e^{F/2}-1\leq\frac{F/2}{1-F/4}\leq\frac{8F}{15}.
```

Equation (2) consequently implies

```math
\cosh(R/2)-1\leq\frac4{15}d_0w,
\qquad
\sinh^2(R/2)\leq\frac{28}{45}d_0w.
\tag{4}
```

For the second estimate use $`d_0w\leq5/4`$ in $`\sinh^2 u=2(\cosh u-1)+(\cosh u-1)^2`$. Also $`d_0\leq(n-1)/n`$, so (3) gives $`np_{\max}\leq1+(n-1)s`$. Substitution into (3) now forces

```math
1\leq s+\sqrt{\frac{28}{45}
 (1+(n-1)s)\left(\frac{5}{4n}-\frac{s^2}{2}\right)}.
\tag{5}
```

For fixed $`0\leq s<1`$, the product under the radical before the factor $`28/45`$ decreases with $`n`$: it equals

```math
\frac54s+\frac{5(1-s)}{4n}
-\frac{s^2(1-s)}2-\frac{ns^3}2.
```

Replacing $`n`$ by 5 in (5) is therefore an upper bound. But

```math
45\left[(1-s)^2-
\frac{28}{45}(1+4s)\left(\frac14-\frac{s^2}{2}\right)\right]
=56s^3+59s^2-118s+38>0
```

for every $`s\geq0`$. An exact certificate is

```math
56s^3+59s^2-118s+38
=59s^2-\frac{1786}{27}s+\frac{13702}{729}
 +56\left(s-\frac59\right)^2\left(s+\frac{10}{9}\right).
```

The quadratic has positive leading coefficient and discriminant $`-43876/729`$; the last term is nonnegative on $`s\geq0`$. Since $`s<1`$, this contradicts (5). Thus the proposed pointwise estimate is valid:

```math
F+\frac d2\geq\frac{5d_0}{4n}.
\tag{6}
```

The stable coefficient argument in the inspected Kopotun paper converts (6) into

```math
q_k(A)\geq
\exp\left(\frac{5\alpha_{n,k}}{4n^2}\|A-J\|_F^2\right).
\tag{7}
```

Indeed, take the infimum over the positive slice coordinates, then choose $`j`$ with $`d_0\geq\alpha_{n,k}r^2/n`$. For an arbitrary doubly stochastic matrix, apply the positive-matrix argument to $`A_\varepsilon=(1-\varepsilon)A+\varepsilon J`$ and let $`\varepsilon\downarrow0`$. Every quantity in (7) is continuous. This handles all support boundaries.

## 3. The upper constant increases with $`k`$

For falling factorials $`(a)_j`$, expansion by the entries selected from $`X`$ gives

```math
q_k(J+tX)=\sum_{j=0}^k
\frac{(k)_j n^j}{(n)_j^2}\,t^j\sigma_j(X).
\tag{8}
```

The centered estimate applies to $`X=A-J`$: it has zero margins and operator norm at most one. It gives

```math
|\sigma_j(X)|\leq\frac{r^2}{n-1}\sigma_j(Q),
\qquad \sigma_j(Q)\geq0.
```

Use (8), including absolute values for odd $`j`$, and put $`t=1/(n-1)`$. This gives

```math
q_k(T(A))\leq1+b_{n,k}\alpha_{n,k}r^2,
\qquad
b_{n,k}=\frac{q_k(J+tQ)-1}{(n-1)\alpha_{n,k}}.
\tag{9}
```

After division by $`\alpha_{n,k}=(k)_2/(n)_2`$, the $`j`$-th coefficient in $`q_k(J+tQ)-1`$ is a nonnegative constant independent of $`k`$ times $`(k-2)_{j-2}`$. Increasing $`k`$ increases every existing term and introduces only nonnegative terms. Therefore

```math
b_{n,k}\leq b_{n,n-1}\leq b_{n,n}=\beta_n.
\tag{10}
```

This is the same coefficient monotonicity mechanism as the source's positive-transform upper bound, applied at a different positive value of $`t`$.

The exact diagonal-plus-uniform evaluation is

```math
q_k(J+tQ)=\sum_{j=0}^k
\frac{(k)_j}{(n)_j}\frac{(nt)^j(1-t)^{k-j}}{j!}.
\tag{11}
```

It follows by expanding $`J+tQ=tI+(1-t)J`$; no sign condition on a centered coefficient is substituted for this calculation.

## 4. Exact separation of the constants

The necessary small scalar calculations are:

| $`n`$ | Constant used | Exact value | Gap below $`5/(4n^2)`$ |
|---|---|---|---|
| 5 | $`b_{5,4}`$ | $`3685/73728`$ | $`7/368640`$ |
| 6 | $`b_{6,5}`$ | $`4767/156250`$ | $`47401/11250000`$ |
| 7 | $`\beta_7`$ | $`4421129/201553920`$ | $`35307079/9876142080`$ |

For $`n\geq8`$, the Marcus–Minc paper proves

```math
\beta_n<\frac{n}{(n-1)(2(n-2)^2-n)}.
```

All denominators are positive. Comparison with $`5/(4n^2)`$ reduces to

```math
6n^3-55n^2+85n-40>0.
```

Writing $`n=8+v`$ gives the exact positive expression

```math
6v^3+89v^2+357v+192>0\qquad(v\geq0).
```

Thus $`b_{n,k}<5/(4n^2)`$ for every $`n\geq5`$ and $`2\leq k<n`$. Combining (7) and (9) proves the proposed strict comparison when $`A\ne J`$, and equality at $`J`$. The upper comparison must retain $`k<n`$ for the small constants: $`\beta_5`$ and $`\beta_6`$ themselves exceed $`5/(4n^2)`$. This does not affect the argument, since (10) permits the sharper $`b_{n,n-1}`$ at those two orders and the permanent case has a separate theorem.

## Verification scope

The accompanying script verifies the scalar evaluations, two independent expansions for them, the cubic decomposition and its discriminant, and the shifted positive polynomial. It does not test a finite collection of matrices or substitute computation for the quantified inequalities. This review found no gap in the stated $`n\geq5,\ k<n`$ argument.

## Comparison with the complete draft

The complete draft at proof.md was then read independently. Its displayed scalar values, normalizations, the factor $`5/(4n^2)`$, the cubic certificate, and the final strictness argument agree with this check.

Two details in the expanded draft deserve an explicit check. First, the ordered root bounds $`u\lambda_i^0\leq\lambda_i\leq v\lambda_i^0`$ imply $`u\leq t_*\leq v`$ by the increasing slice equation. Setting $`a_i=\lambda_i/(t_*\lambda_i^0)`$, the likelihood ratio is

```math
\frac{p_i^0}{p_i}
=\frac{1+a_i\lambda_i^0}{1+\lambda_i^0}.
```

It lies between $`1`$ and $`a_i`$, hence between $`u/t_*`$ and $`v/t_*`$. This directly gives the needed ratio bound $`v/u`$. Sorting the two component root lists does not invalidate their coordinatewise bounds.

Second, the remaining small proper degree is $`(n,k)=(4,3)`$. The zero-margin identities

```math
\sigma_2(X)=\frac12\sum x_{ij}^2,\qquad
\sigma_3(X)=\frac23\sum x_{ij}^3
```

and $`x_{ij}\geq-1/n`$ imply
$`\sigma_3(X)\geq-4\sigma_2(X)/(3n)`$. At $`n=4`$, the transform difference is

```math
\frac89\sigma_2(X)+\frac{28}{27}\sigma_3(X)
\geq\frac{44}{81}\sigma_2(X).
```

The draft's constant and equality conclusion are correct. Degree two is strict away from $`J`$ for $`n\geq3`$, and degrees zero and one are constant. The full degree and its exceptional order-three equality cases are imported from the cited Marcus–Minc theorem rather than claimed as new work.

This completes the mathematical audit of the written argument. The historical attribution and the search for prior all-degree resolutions remain the root agent's separate source audit.
