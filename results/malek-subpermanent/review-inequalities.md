# Independent review of the Malek subpermanent transform argument

Review date: 20 November 2026 (America/Chicago). This receipt checks the mathematical argument communicated by the root researcher, including the new capacity-cost estimate, its constants, the transformed upper bound, the small cases, and extension to matrices with zero entries. A separate source audit is required for the historical status and any priority claim.

## Statement and normalization

Let `n>=2`, let `A` be a nonnegative doubly stochastic matrix, and write

```math
J=\frac1n\mathbf1\mathbf1^{\mathsf T},\qquad
X=A-J,\qquad
\tau(A)=\frac{nJ-A}{n-1}=J-\frac{X}{n-1}.
```

The claimed comparison is

```math
\sigma_k(A)\ge\sigma_k(\tau(A)),\qquad 1\le k\le n,
```

where `sigma_k` is the sum of all permanents of square submatrices of order `k`. The degree-one case is an identity. The full permanent case `k=n` is the previously proved Marcus–Minc theorem. The new argument covers every proper degree `2<=k<n`, rather than a bounded collection of orders.

For these proper degrees set

```math
S_{n,k}=k!\binom nk^2 n^{-k},\qquad
\alpha_{n,k}=\frac{k(k-1)}{n(n-1)},\qquad
\Delta=\alpha_{n,k}\|X\|_F^2.
```

The key new lower bound, checked below, is

```math
\frac{\sigma_k(A)}{S_{n,k}}
\ge \exp\!\left(\frac{5\Delta}{4n^2}\right)
\qquad(n\ge5,\ 2\le k<n). \tag{1}
```

## Published inputs inspected

The following full primary texts were read for this review.

- Y. Lavi, *The Kopotun Subpermanent Transform Inequality*, [hexagon:2611.00201v1](https://hexagonmath.org/pdf/2611.00201v1), dated 11 October 2026. Sections 3.1–3.3 give the polynomial normalization, optimized slices, and root-movement estimate used here. Lemma 2.2 and equation (3.8) give the coefficient consequence. The proposed argument replaces the capacity-cost estimate of Section 4.1 and its subsequent constants; it does not claim the already published Kopotun comparison as new.
- Y. Lavi, *The Marcus–Minc Transform Inequality*, [arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1), 24 September 2026. Lemma 3.1 supplies the centered subpermanent estimate, including its contraction hypothesis and positivity of `sigma_r(I-J)`. Section 5 gives the rational bound for the full-degree upper constant. Theorem 1.1 supplies the full permanent case and its equality exceptions.

Both inputs were checked at the indicated arguments, not inferred solely from their abstracts.

## Polynomial and slice hypotheses

First assume every entry of `A` is positive. Define

```math
P(z)=\frac{e_k(Az)}{\binom nk}
\left(\frac{z_1+\cdots+z_n}{n}\right)^{n-k}.
```

This is stable, homogeneous of degree `n`, and has positive coefficients in every degree-`n` monomial. It satisfies `P(1)=1`, `grad P(1)=1`, and has capacity one. Its central coefficient is

```math
[z_1\cdots z_n]P=\frac{n!}{n^n}\frac{\sigma_k(A)}{S_{n,k}}.
```

For a fixed column `j`, fix all other positive coordinates `x_h`. Let `t_*` minimize `P(x_1,...,t,...,x_n)/t`. Positivity and stability give `n` strictly negative roots and a unique positive minimizer. The associated probability vectors `p=p(x)` and `p^0=p(1)`, the variances `d=||p-1/n||_2^2`, `d_0=||p^0-1/n||_2^2`, and the cost

```math
F=\log\frac{P(x_1,\ldots,t_*,\ldots,x_n)}{t_*\prod_{h\ne j}x_h}
```

satisfy

```math
F\ge0,\qquad d_0=\alpha_{n,k}\|X_{:j}\|_2^2,
\qquad 0\le d_0\le1-\frac1n.
```

If `R=log(max_(h≠j) x_h/min_(h≠j) x_h)`, the inspected root-movement argument gives

```math
\sqrt{d_0}\le\sqrt d+\sqrt{p_{\max}}\sinh(R/2),
\qquad
p_{\max}\le\frac1n+\sqrt{(1-1/n)d}. \tag{2}
```

The root pairing in that source is legitimate even with repeated roots: the `e_k` roots are ordered within that factor, while the `n-k` uniform-factor roots are paired separately. The optimized scale `t_*` cancels from the range of the logarithmic likelihood ratios. Thus (2) does not assume that the slice optimizer stays at one.

Finally, writing `M_j=inf_(x>0)(F+d/2)`, the scalar capacity step and the remaining Gurvits induction give

```math
\frac{\sigma_k(A)}{S_{n,k}}\ge\exp(\max_j M_j). \tag{3}
```

This takes a lower bound before the infimum; it does not confuse evaluation at `x=1` with a lower estimate for `M_j`.

## The stronger capacity cost

For positive `z`, put `E_r(z)=e_r(z)/binom(n,r)`. Since `Az` is majorized by `z` and `e_k` is Schur-concave,

```math
E_k(Az)\ge E_k(z).
```

Newton's inequalities imply that `E_(r+1)(z)/E_r(z)<=E_1(z)`. Multiplying these ratios gives

```math
E_k(z)E_1(z)^{n-k-1}\ge E_{n-1}(z).
```

Here `k<n` is essential; at `k=n-1` the last comparison is an equality. Using `E_(n-1)(z)/prod z=E_1(1/z)`, we obtain

```math
\frac{P(z)}{\prod_i z_i}\ge E_1(z)E_1(1/z). \tag{4}
```

To bound the last product with two coordinates in ratio `e^R`, scale those two to `e^(R/2)` and `e^(-R/2)`. Put `C=2 cosh(R/2)` and let `S,T` be the sums of the other coordinates and their reciprocals. Then `S+T>=2(n-2)` and `ST>=(n-2)^2`. Consequently

```math
E_1(z)E_1(1/z)
=\frac{(C+S)(C+T)}{n^2}
\ge\left[1+\frac2n(\cosh(R/2)-1)\right]^2.
```

This remains true when one of the other coordinates is the optimized `t_*`. Equations (4) and the definition of `F` prove

```math
F\ge2\log\left[1+\frac2n(\cosh(R/2)-1)\right]. \tag{5}
```

## Constant audit for the lower bound

If `d_0=0`, the required pointwise bound follows from `F,d>=0`. Otherwise suppose, for contradiction,

```math
F+\frac d2\le\frac{5d_0}{4n}.
```

Write `s=sqrt(d/d_0)` and `w=5/4-ns^2/2`. Then

```math
0\le s\le\sqrt{5/(2n)}<1,\qquad
0\le w\le5/4,\qquad
0\le F\le\frac{d_0w}{n}\le\frac14
```

for `n>=5`. The estimate `exp(F/2)-1<=8F/15` holds on this whole interval. One rational verification uses `exp(x)-1<=x+x^2/[2(1-x/3)]` for `0<=x<=1/8`; the latter bound is at most `(49/46)x<(16/15)x`.

Equation (5) therefore gives

```math
\cosh(R/2)-1\le\frac4{15}d_0w,
```

and, using `d_0w<=5/4`,

```math
\sinh^2(R/2)
\le d_0w\left(\frac8{15}+\frac{16d_0w}{225}\right)
\le\frac{28}{45}d_0w. \tag{6}
```

Also (2) and `d_0<=1-1/n` give `np_max<=1+(n-1)s`. Substituting in (2), dividing by `sqrt(d_0)`, and using (6) yields

```math
1\le s+\sqrt{\frac{28}{45}(1+(n-1)s)
\left(\frac5{4n}-\frac{s^2}{2}\right)}. \tag{7}
```

For fixed `0<=s<1`, the expression before the factor `28/45` under the square root decreases with `n`. At `n=5`, its separation from `(1-s)^2` is

```math
\frac{56s^3+59s^2-118s+38}{45}>0.
```

The positivity has the exact certificate

```math
\begin{aligned}
56s^3+59s^2-118s+38
={}&59s^2-\frac{1786}{27}s+\frac{13702}{729}\\
&+\frac{56}{729}(9s-5)^2(9s+10).
\end{aligned}
```

For `s>=0`, the last term is nonnegative. The quadratic has positive leading coefficient and discriminant `-43876/729<0`. This makes the right side of (7) strictly less than one, a contradiction.

Thus `M_j>=5d_0/(4n)`. Because the sum over columns of `d_0` is `Delta`, some column has `d_0>=Delta/n`. Equation (3) proves (1).

## Upper bound and its constants

The centered estimate applies to `X=A-J` because `X` has zero margins and `||X||_(2→2)<=1`. Put `Q=I-J` and `rho=1/(n-1)`. The exact centered expansion has coefficients

```math
c_{n,k,r}=(k-r)!\binom{n-r}{k-r}^2n^{-(k-r)}.
```

Taking the odd terms in absolute value gives

```math
\frac{\sigma_k(\tau(A))}{S_{n,k}}\le1+b_{n,k}\Delta,
\qquad
b_{n,k}=\frac1{(n-1)\alpha_{n,k}S_{n,k}}
\sum_{r=2}^k c_{n,k,r}\rho^r\sigma_r(Q). \tag{8}
```

All summands are nonnegative. The identity

```math
\frac{c_{n,k,r}}{S_{n,k}}=
\frac{n^r(k)_r}{(n)_r^2}
```

shows that, after division by `alpha_(n,k)`, the dependence on `k` is through `(k-2)_(r-2)`. Hence `b_(n,k)` is nondecreasing in `k`. There is no assumption on the signs of the centered coefficients of `X`.

Independent exact evaluation gives

```math
\begin{array}{c|c|c}
\text{constant used}&\text{value}&5/(4n^2)-\text{value}\\\hline
b_{5,4}&3685/73728&7/368640\\
b_{6,5}&4767/156250&47401/11250000\\
b_{7,7}&4421129/201553920&35307079/9876142080
\end{array}
```

For `n>=8`, the published full-degree estimate implies

```math
b_{n,k}\le b_{n,n}
<\frac{n}{(n-1)(2(n-2)^2-n)}<\frac5{4n^2}.
```

After multiplying positive denominators, the last strict inequality is equivalent to

```math
6n^3-55n^2+85n-40>0.
```

At `n=8+u` this is `6u^3+89u^2+357u+192`, which is positive for every `u>=0`. Thus (8) has a strictly smaller coefficient than (1) for every proper degree with `n>=5`.

## Small cases, boundary, and equality

For `k=2`, the exact identity `sigma_2(X)=||X||_F^2/2` gives

```math
\sigma_2(A)-\sigma_2(\tau(A))
=\left(1-\frac1{(n-1)^2}\right)\sigma_2(X).
```

This is strict for `n>=3` unless `A=J`. The only remaining proper degree below order five is `(n,k)=(4,3)`. The centered expansion and `sigma_3(X)=(2/3)sum x_ij^3` give

```math
\sigma_3(A)-\sigma_3(\tau(A))
=\frac89\sigma_2(X)+\frac{28}{27}\sigma_3(X)
\ge\frac{44}{81}\sigma_2(X).
```

The last inequality uses only `x_ij>=-1/4`, which implies `x_ij^3>=-x_ij^2/4`. It is again strict away from `J`.

For arbitrary nonnegative `A`, apply (1) first to `A_epsilon=(1-epsilon)A+epsilon J`. The lower estimate passes to the limit using only continuity of `sigma_k` and the Frobenius norm. The centered upper estimate already holds on the boundary. Strictness then follows from the positive difference between the constants in (1) and (8), not from taking a limit of strict inequalities.

Accordingly every proper-degree comparison `2<=k<n` is strict unless `A=J`. The cases `k=n` retain the established Marcus–Minc equality classification: all doubly stochastic matrices in order two; `J_3` and the six complements of permutation matrices in order three; only `J_n` when `n>=4`. Degree one is always an equality.

## Review conclusion

No mathematical gap was found in the argument described above. Its new lower bound and strict upper-constant separation cover all proper degrees and all support boundaries. The original Malek source, the exact historical scope of that conjecture, and whether a prior full proof exists must be audited separately before claiming a newly resolved named conjecture.

### Final draft read

The complete draft at `/workspace/scratch/0c03194a47dc/proof.md` was read after this derivation was checked. Its equations (1)–(26), normalization, initial cases, support-boundary argument, and equality list agree with the reviewed proof. In particular, its identity-entry expansion (22) has the correct factor `(k)_j/(n)_j`, and its simpler geometric-series proof of `exp(F/2)-1<=8F/15` is valid on `0<=F<=1/4`.

The draft's additional bound `u<=t_*<=v` is also valid: substituting `t=u` and `t=v` into the increasing minimizing equation brackets one. For clarity, the following identity makes its subsequent likelihood-ratio claim explicit. If `c_i=lambda_i(x)/lambda_i(1)`, then

```math
\frac{p_i^0}{p_i}
=\frac1{1+\lambda_i(1)}
+\frac{c_i}{t_*}\frac{\lambda_i(1)}{1+\lambda_i(1)}
\in\left[\frac{u}{t_*},\frac{v}{t_*}\right].
```

Thus the ratio of the largest to smallest likelihood ratio is at most `v/u`. This supplies the intermediate step in the prose following equation (10); no stronger root comparison is needed.
