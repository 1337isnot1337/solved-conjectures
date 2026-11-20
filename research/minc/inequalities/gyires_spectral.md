# Gyires’s ratio inequality

Research note, 2026-11-20. This note proves a sufficient spectral condition in every order. It does not resolve the full conjecture. The proof uses two results from a September 2026 preprint; an independent check of that dependency is required before treating this note as a verified contribution. No priority claim is made.

## Statement

Write `J = 11ᵀ/n`, `d_n = n!/n^n`, and let `|| · ||op` and `|| · ||F` denote the Euclidean operator and Frobenius norms. Suppose that `A` is a real, nonnegative, doubly stochastic matrix of order `n >= 2`, and

\[
\|A-J\|_{\mathrm{op}}\le n^{-1/2}.
\]

Then

\[
\operatorname{per}(AA^{\mathsf T})
\le \frac{(\operatorname{per}A)^2}{d_n},
\qquad
\operatorname{per}(A^{\mathsf T}A)
\le \frac{(\operatorname{per}A)^2}{d_n}.
\tag{1}
\]

Both inequalities are strict unless `A=J`. Consequently Gyires’s ratio inequality holds, with equality precisely at `J`, on this class. In particular this includes the Frobenius ball `||A−J||F <= n^(−1/2)` inside the doubly stochastic polytope.

## Two input estimates

The source is Y. Lavi, *The Marcus–Minc Transform Inequality*, arXiv:2609.29262v1, 24 September 2026, https://arxiv.org/html/2609.29262v1 . The estimates used are Theorem 1.2 and Lemma 3.1, not the transform inequality itself.

Put `a_n = 1/(2n) + 1/(3n²)`. The first input is

\[
\frac{\operatorname{per}A}{d_n}
\ge \exp\bigl(a_n\|A-J\|_F^2\bigr)
\quad(A\in\Omega_n).
\tag{2}
\]

For a matrix `Z`, let `σ_k(Z)` be the sum of its `k×k` subpermanents; let `Q=I−J`. The second input, after scaling, is

\[
|\sigma_k(Z)|
\le \frac{\sigma_k(Q)}{n-1}\|Z\|_F^2 s^{k-2}
\quad(2\le k\le n),
\tag{3}
\]

whenever `Z` is real, has zero row and column sums, and `s=||Z||op>0`. To obtain (3), apply the source’s Lemma 3.1 to `Z/s` and use homogeneity. The same lemma proves `σ_k(Q)>=0`.

## A one-variable estimate

Define

\[
T_n(t)=\frac{\operatorname{per}(J+tQ)}{d_n}
=\sum_{j=0}^{n}\frac{(nt)^j(1-t)^{n-j}}{j!}.
\tag{4}
\]

The second formula follows by selecting diagonal terms in `(1−t)J+tI`. Expanding instead around `J` gives

\[
T_n(t)=\sum_{k=0}^{n}\frac{n^k}{(n)_k}\sigma_k(Q)t^k,
\tag{5}
\]

where `(n)_k=n!/(n−k)!`. Here `σ_0(Q)=1`, `σ_1(Q)=0`, and all remaining coefficients are nonnegative. Thus `(T_n(t)−1)/t` is increasing for `t>0`.

We claim that

\[
c_n:=\frac{n}{n-1}\bigl(T_n(1/n)-1\bigr)<2a_n
\quad(n\ge2).
\tag{6}
\]

For `0<t<1`, extending the positive sum in (4) gives

\[
T_n(t)<(1-t)^n\exp\!\left(\frac{nt}{1-t}\right)
=\exp\left(n\left[\log(1-t)+\frac{t}{1-t}\right]\right).
\]

Since

\[
\log(1-t)+\frac{t}{1-t}
=\sum_{j\ge2}\frac{j-1}{j}t^j
\le\frac{t^2}{2(1-t)^2},
\]

and `exp(x)<1/(1−x)` for `0<x<1`, evaluation at `t=1/n` yields, for `n>=3`,

\[
T_n(1/n)-1
<\frac{n}{2(n-1)^2-n}.
\]

In particular

\[
c_n<\frac{n^2}{(n-1)(2n^2-5n+2)}.
\tag{7}
\]

For `n>=6` the right side of (7) is smaller than `2a_n=(3n+2)/(3n²)`. After positive denominators are cleared, this assertion is equivalent to

\[
3n^4-17n^3+7n^2+8n-4>0.
\]

Writing `m=n−6>=0`, the left side equals

\[
3m^4+55m^3+349m^2+848m+512,
\]

which is positive. The four remaining orders follow from the exact table:

| n | c_n | 2a_n−c_n |
|---|---|---|
| 2 | 1/2 | 1/6 |
| 3 | 13/36 | 5/108 |
| 4 | 143/576 | 25/576 |
| 5 | 10621/60000 | 993/20000 |

This proves (6).

## Proof of the Gram inequality

Set `X=A−J`, `r²=||X||F²`, and `q=||X||op²`. If `r=0` the claim is immediate. Otherwise `0<q<=1/n`. Since `X` has zero margins,

\[
AA^{\mathsf T}=J+Y,\qquad Y=XX^{\mathsf T}.
\]

The matrix `Y` also has zero margins and satisfies

\[
\|Y\|_{\mathrm{op}}=q,
\qquad
\|Y\|_F^2\le q r^2.
\tag{8}
\]

The second estimate is the singular-value inequality `Σs_i⁴ <= (max s_i²)Σs_i²`. The expansion around `J`, (3), and (8) give

\[
\begin{aligned}
\frac{\operatorname{per}(AA^{\mathsf T})}{d_n}
&\le 1+\frac{\|Y\|_F^2}{(n-1)q^2}\bigl(T_n(q)-1\bigr)\\
&\le 1+\frac{r^2}{n-1}\frac{T_n(q)-1}{q}\\
&\le 1+c_n r^2.
\end{aligned}
\tag{9}
\]

The last step uses (5) and `q<=1/n`. By (2) and (6),

\[
\left(\frac{\operatorname{per}A}{d_n}\right)^2
\ge e^{2a_n r^2}
\ge1+2a_n r^2
>1+c_n r^2
\ge\frac{\operatorname{per}(AA^{\mathsf T})}{d_n}.
\]

This proves the first assertion of (1), including strictness. Applying the same proof to `Aᵀ` gives the second assertion.

## Passage to Gyires’s original expression

For a real square matrix `M`, write

\[
\prod_{i=1}^{n}\left(\sum_{j=1}^{n}m_{ij}x_j\right)
=\sum_{|\alpha|=n}c_\alpha(M)x^\alpha.
\]

Direct expansion gives the permanent form of the Cauchy–Binet identity

\[
\operatorname{per}(MN^{\mathsf T})
=\sum_{|\alpha|=n}\alpha!\,c_\alpha(M)c_\alpha(N).
\tag{10}
\]

Thus it is an inner product of coefficient vectors, and

\[
2\operatorname{per}(MN^{\mathsf T})
\le\operatorname{per}(MM^{\mathsf T})+
\operatorname{per}(NN^{\mathsf T}).
\tag{11}
\]

Use `M=A`, `N=Aᵀ`. Then

\[
\begin{aligned}
&\operatorname{per}(AA^{\mathsf T})+
\operatorname{per}(A^{\mathsf T}A)+2\operatorname{per}(A^2)\\
&\quad\le2\left[\operatorname{per}(AA^{\mathsf T})+
\operatorname{per}(A^{\mathsf T}A)\right]
\le\frac{4(\operatorname{per}A)^2}{d_n}.
\end{aligned}
\]

The last inequality is strict when `A!=J`. Its denominator in ratio form is positive: `AAᵀ` is doubly stochastic and the van der Waerden lower bound gives `per(AAᵀ)>=d_n>0`. At `A=J`, equality holds by direct substitution.

## Scope and prior-art check

The target page https://yair-lavi.com/mincs-list/conjecture-20/index.html lists the full conjecture as open and records a Frobenius radius `3/[4(n−1)]` for `n>=5`. The spectral condition here contains that ball and also implies the larger sufficient Frobenius radius `n^(−1/2)`. The listed entrywise condition of Chang (1990) is different. Searches for Gyires with spectral, operator norm, and singular-value terminology did not locate this condition. That search is incomplete and does not establish novelty.

The remaining matrices may have `||A−J||op>1/sqrt(n)`. Nothing in this proof covers all of them. This note must not be entered as a solved conjecture or used to satisfy a quota of full resolutions.
