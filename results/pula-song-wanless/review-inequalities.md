# Pula–Song–Wanless threshold: independent review

Date: 2026-11-20; dependency repair checked 2026-11-21. Reviewer: inequalities research agent.

This checks the combinatorial agent's proposed proof of the threshold assertion in Pula, Song and Wanless, *Minimum permanents on two faces of the polytope of doubly stochastic matrices*, Linear Algebra Appl. 434 (2011), 232–238, DOI 10.1016/j.laa.2010.08.015. The full primary preprint was inspected at https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf . This is a subsidiary conjecture cited under Minc Problems 14 and 15, not a solution of either general characterization problem.

## Original scope

The support is

```math
V_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&J_m\end{pmatrix}.
```
Conjecture 2.1 asserts that it is cohesive but not barycentric when `1<n<m+sqrt(m)`, and is not cohesive when `n>=m+sqrt(m)`, with the minimum attained at the matrix whose lower-right block vanishes. The original PDF's extracted text can lose the equality bar in `>=`; the publisher abstract confirms the inclusive threshold. The paper already proves cohesiveness below the threshold. Its Theorem 2.1 asserts the reduction, after averaging the last `m` rows and columns, to the one-parameter family `A_x`. A later audit uncovered a problem with its proof; the direct repair below replaces the problematic step.

The source restricts Section 2 to `m,n>2`, but the repaired reduction below is proved directly and does not import that restricted theorem. It covers all `m>=2,n>1`; when `m=1`, the cross-cofactor equality has no second-minor term and directly forces equal cross parameters. The cases `m<4` or `n<4` remain prior results, as the source's introduction records, even though the revised argument also includes them.

## Dependency gap and direct repair

Song (2013), https://koreascience.or.kr/article/JAKO201319133640171.pdf , Remarks 2.4 and 4.4, flags the boundary issue in the original equalization argument. There is also a problem with varying two parameters in equation (4) of the 2011 preprint: that displayed simplification uses cofactor identities holding at the candidate minimum, and those identities need not persist under the proposed variation. The following argument avoids that variation entirely.

After the valid averaging of repeated-support bottom rows and columns, write the top diagonal entries as `x_i=1-ma_i`, the cross entries in top row/column `i` as `a_i`, and the bottom block as `xJ_m`. Fully indecomposability of a minimizer implies `a_i>0`, so `0<a_i<=1/m`. Suppose two cross parameters are unequal, say `u<v`. Let `p_0` be the permanent after deleting those two top rows and columns, and let `p_1,p_2` additionally delete respectively one and two bottom rows and columns.

Equality of the two positive cross-entry cofactors gives

```math
(m-1)^2uv\,p_2=p_1.
```
The top diagonal belonging to `u` is positive. Comparing the two top diagonal cofactors, using equality for positive entries and the cofactor inequality for a zero diagonal, gives

```math
p_0\ge m(u+v)p_1.
```
Moreover `p_1>0`: if `p_1=0`, the first identity gives `p_2=0`, and expansion of either positive cross-entry cofactor gives `per Y=0`, impossible for a doubly stochastic matrix.

Replace the remaining bottom block in the matrix defining `p_0` by `yJ_m`, and denote its permanent by `q(y)`. If the remaining top diagonal entries are `D_i>=0` and their cross parameters are `b_i`, direct counting gives

```math
q(y)=m!\prod_i\left(D_i+b_i^2\frac{d}{dy}\right)y^m.
```
Each factor `c+e d/dy`, with `c,e>=0`, preserves real-rootedness by derivative interlacing, or gives zero; derivative and constant cases are immediate. The polynomial has nonnegative coefficients, so all of its roots are nonpositive. This includes zero top diagonals directly, without division or a limiting argument. The polynomial is not identically zero here because `q(x)=p_0>0`. Therefore

```math
q'(x)^2\ge q(x)q''(x).
```
Differentiating the permanent directly gives

```math
q'(x)=m^2p_1,\qquad q''(x)=m^2(m-1)^2p_2.
```
The preceding identities imply `p_0<=m^2uv p_1`, hence

```math
1/u+1/v\le m.
```
But `u,v<=1/m` imply `1/u+1/v>=2m`, a contradiction. Thus all `a_i` are equal, including when some original top diagonal is zero. This establishes the reduction needed by the threshold proof without the invalid variation.

Lavi's Problem 15 page, https://yair-lavi.com/mincs-list/problem-15/index.html , separately announces non-barycentricity for every `m,n>=2`. That is prior work, not a new contribution here. The argument below provides an independent proof of that part so the proposed completion does not depend on an unavailable proof of the announcement. The original conjecture excludes `n=1`, when the support is all ones and is barycentric.

## Check of the threshold calculation

Put `d=n-m>0`, `t=mx`, and

```math
F(z)=\sum_{i=0}^{m}\binom mi\frac{z^i}{(d+1)_i},\qquad
z(t)=\frac{(d+m)t(d+mt)}{m(1-t)^2}.
```
The permanent formula (6) of the source gives

```math
f(t):=\mathop{\mathrm{per}}A_{t/m}
=\frac{n!m!}{d!n^{n+m}}(1-t)^{2m}(d+mt)^dF(z(t)).
```
All omitted factors in the proposed comparison are therefore positive and independent of `t`. The coefficients of `F` are positive, so `F(z)>0` for `z>=0`. Its coefficient recurrence gives the Kummer equation

```math
zF''+(d+1+z)F'-mF=0.
```
Define `mu=zF'/F` and `h(t)=mu(z(t))-mt`. Direct differentiation yields

```math
\frac{d\mu}{dz}=m-\mu-\frac{\mu(d+\mu)}{z},\quad
K(t):=\frac{z'}z=\frac{d+(d+2m)t}{t(d+mt)(1-t)}>0,
```
and

```math
(\log f)'=K(t)h(t).
```
At a zero of `h` in `(0,1)`, substitution of `mu=mt` into its derivative gives

```math
h'(t)=\frac{d^2-m+(d^2+3dm+2m)t+m(d+2m-1)t^2}{(1-t)^2}.
```
This is strictly positive whenever `d^2>=m` and `0<t<1`. At the left endpoint,

```math
h'(0)=\frac{d^2-m}{d+1}.
```
When `d^2=m`, expansion of the first two coefficients of `F` instead gives

```math
h(t)=\frac{3d^2(d+1)}{d+2}t^2+O(t^3)>0
```
for sufficiently small positive `t`. Thus `h` starts positive in both cases. If it had a zero later, its first such zero would have derivative at most zero, contradicting the displayed formula. Hence `f` is strictly increasing on `(0,1)` when `d^2>=m`. Continuity also gives `f(1)>f(0)`.

The parameter condition is exactly `n>=m+sqrt(m)`. Any global minimizer can be averaged into `A_0`, and the averaging preserves the sum of the lower-right block. Nonnegativity forces that entire block of every original minimizer to vanish. Consequently `A_0` attains the minimum and the support is not cohesive, exactly as the conjecture requires. This transfer does not assume that averaging preserves every entry or that every minimizer initially has the displayed symmetric form. It does not by itself prove uniqueness; the independent argument below supplies it without relying on the old uniqueness proof.

## Independent global uniqueness argument

The same initial bottom-row and bottom-column averaging leaves every top diagonal entry unchanged. Since the averaged minimizer is `A_0`, every original minimizer therefore has the form

```math
Y=\begin{pmatrix}aI_n&L\\K&0_m\end{pmatrix},\qquad a=d/n.
```
Here `L` has row sums `m/n` and column sums `1`, while `K` has row sums `1` and column sums `m/n`. Averaging just the last `m` rows preserves minimality and leaves `L` unchanged, while replacing `K` by `J_(m,n)/n`. The permanent of this averaged matrix is

```math
a^d\frac{m!}{n^m}\sum_{|S|=m}\mathop{\mathrm{per}}L[S,:].
```
Complete `L` to the doubly stochastic `n`-square matrix

```math
B=[L\ \ J_{n,d}/n].
```
Expansion along its first `m` columns gives

```math
\mathop{\mathrm{per}}B=\frac{d!}{n^d}
\sum_{|S|=m}\mathop{\mathrm{per}}L[S,:].
```
Thus the averaged minimizer's permanent equals

```math
\frac{d^dm!}{d!n^m}\mathop{\mathrm{per}}B.
```
The already proved minimum value forces `per B=n!/n^n`. The equality case of van der Waerden's theorem gives `B=J_n/n`, hence `L=J_(n,m)/n` in the original minimizer. Repeating the same expansion in the original matrix, now with `L` uniform, and completing `K^T` by `d` uniform columns, forces `K=J_(m,n)/n`. Therefore `Y=A_0`.

All constants and row/column sums in this completion argument have been independently checked. This gives global uniqueness using van der Waerden's equality case and the valid bottom-row averaging theorem; it does not invoke the potentially problematic original proof of Theorem 3.1.

## Independent non-barycentricity check

For `q>=1,d>=0`, write

```math
F_{q,d}(z)=\sum_{i=0}^q\binom qi\frac{z^i}{(d+1)_i}.
```
This is a positive multiple of `L_q^{(d)}(-z)`. Generalized Laguerre polynomials have distinct positive roots when `d>-1`, so `F` has distinct negative roots. Normalizing `F(z)/F(1)` gives the probability generating function of a sum of `q` independent Bernoulli variables with distinct probabilities. If `u` and `v` are its mean and variance, then

```math
v\le u(q-u)/q,
```
with strict inequality for `q>=2`. The Kummer equation at `z=1` also gives

```math
u(d+u)=q-u-v.
```
If `n>=m`, set `q=m,d=n-m`. The barycenter has upper diagonal entry `a=(d+u)/n`, cross-block entry `c=(m-u)/(mn)`, and bottom entry `b=u/m^2`. The preceding equations imply

```math
nv < (m-u)(d+u),\qquad
nu(d+u)>(m-u)^2,
```
and therefore `ab>c^2`. For `m>=2` the first inequality is strict from the variance bound. For `m=1,n>1`, the variance bound is an equality but the comparison `nu/m<d+u` is strict, so the conclusion still holds.

If `m>=n`, put `q=n,d=m-n`. The corresponding entries are `a=u/n`, `c=(n-u)/(mn)` and `b=(d+u)/m^2`. Since `n>1`, strictness in `nv<u(n-u)` gives

```math
nu(d+u)>(n-u)^2,
```
again giving `ab>c^2`.

For completeness, `ab=c^2` is a necessary condition for this barycenter to minimize the permanent. If an interior barycenter `B` were minimizing, the source's cofactor lemma gives `per B(i|j)=per B` on its support. Consequently the weighted permutation law `P_B(sigma)` proportional to `product_i b_{i,sigma(i)}` has marginals `B`. The uniform law on the supported permutations also has marginals `B` by the definition of barycenter. Their symmetrized relative entropy equals

```math
\sum_{ij}(\operatorname{marginal}(P_B)_{ij}-B_{ij})\log b_{ij}=0.
```
Thus the two laws coincide and all supported permutation products of `B` are equal. A supported permutation using one upper diagonal edge and one bottom edge can be changed to use the two corresponding cross edges; all other upper vertices can use their diagonal edges and all other bottom vertices can be matched within the bottom block. Equality of these two products forces `ab=c^2`, contrary to the strict inequality above. This proves non-barycentricity for every `m>=1,n>1`.

## Review conclusion and limits

The repaired reduction, threshold algebra, initial behavior at equality, crossing argument, endpoint handling, and conclusion that every minimizer has zero lower-right block pass this independent check. The independent completion argument also proves global uniqueness. The independent Laguerre/variance argument supplies the already announced non-barycentric half. Together with the original paper's cohesiveness theorem below threshold, this would resolve the full Pula–Song–Wanless conjecture in its stated parameter range. A separate status search is still required before claiming novelty. Neither Minc Problem 14 nor Problem 15 is thereby solved.

Additional primary source read: Cheon and Song, *A conjecture on minimum permanents*, Czechoslovak Mathematical Journal 74 (2024), 273–282, DOI 10.21136/CMJ.2023.0186-23, https://dml.cz/bitstream/handle/10338.dmlcz/152279/CzechMathJ_74-2024-1_15.pdf . It proves the interior case `V_(4,5)` and a noncohesive family `V_(4k,7k)` for `k>=2`; it does not give the full threshold. Searches combining Pula, Song, Wanless, Laguerre, threshold, and recent proof terminology found no full-threshold resolution. This is a bounded literature check, not proof of priority.
