# Pula–Song–Wanless conjecture

Date: 2026-11-20; revised 2026-11-21 UTC. Status: complete proposed proof of the previously missing threshold direction, including an independent repair of the face reduction, with three independent internal reviews. The [source audit](source-audit.md) found no earlier full threshold proof; priority remains provisional. This is a named subsidiary conjecture discussed under Minc Problems 14 and 15. It does **not** characterize all cohesive or barycentric supports, and is not a solution of either complete Minc entry.

## Statement and prior results

Write `J_{r,s}` for the all-ones rectangular matrix and define

```math
 U_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&0_m\end{pmatrix},
 \qquad
 V_{m,n}=\begin{pmatrix}I_n&J_{n,m}\\J_{m,n}&J_m\end{pmatrix}.
```
For a binary support D, let Ω(D) be the doubly stochastic matrices vanishing at its zero positions. A support is cohesive if this face has a permanent minimizer positive on its entire active support. It is barycentric if the average of its supported permutation matrices is a minimizer.

Pula, Song and Wanless, *Minimum permanents on two faces of the polytope of doubly stochastic matrices*, Linear Algebra Appl. 434 (2011), 232–238, Conjecture 2.1, proposed that for positive m and n>1:

1. V_{m,n} is cohesive but not barycentric when n<m+√m.
2. V_{m,n} is not cohesive when n≥m+√m, and the barycenter of Ω(U_{m,n}) minimizes the permanent on Ω(V_{m,n}).

The equality sign at the threshold is confirmed in the PDF image and the publisher abstract; text extraction sometimes changes ≥ to >. The cases m<4 or n<4 were already settled by the literature cited in the original introduction and are not new here. In particular m=1 was covered by Brualdi. The original paper states the cohesive direction and the noncohesive direction for n≥2m. Song (2013) identifies a boundary issue in its reduction and proves the m=4 threshold case. Independently, the displayed perturbation of formula (4) in the available 2011 preprint does not follow from the identities used to obtain that formula: some identities hold only at the candidate minimizer. Section 1 below replaces this reduction with a real-rooted-polynomial proof, handling both boundary and interior cases. We do not rely on the original paper's asserted uniqueness on Ω(U_{m,n}).

Cheon–Song (2024) still treats only special cases of the threshold conjecture. Lavi's current Problem 15 page already states non-barycentricity for every m,n≥2. That assertion is credited as prior progress; an independent proof is supplied below to make the combination checkable. We also rederive the known cohesive direction after the repaired reduction.

The proposed new theorem is:

> For all positive m and n>1 with n≥m+√m, the permanent on Ω(V_{m,n}) has the unique minimizer
> ```math
> A_0=\begin{pmatrix}
> \frac{n-m}{n}I_n&\frac1nJ_{n,m}
> \\ \frac1nJ_{m,n}&0_m
> \end{pmatrix}.
> ```
> Its permanent is
> ```math
> \frac{n!m!(n-m)^{n-m}}{(n-m)!n^{n+m}}.
> ```
Together with Sections 4.2 and 5, this settles the stated subsidiary conjecture for all its parameters.

## 1. An independent repair of the face reduction

Two established ingredients are used here. Minc's repeated-support averaging theorem permits averaging rows or columns with identical allowed support at a permanent minimizer, preserving minimality. Foregger's minimizer lemma says that on a fully indecomposable binary support D, every minimizing matrix Y is fully indecomposable, and its permanental cofactors satisfy

```math
 \mathop{\mathrm{per}}Y(i\mid j)=\mathop{\mathrm{per}}Y
 \quad\text{when }y_{ij}>0,
 \qquad
 \mathop{\mathrm{per}}Y(i\mid j)\ge\mathop{\mathrm{per}}Y
 \quad\text{when }D_{ij}=1, y_{ij}=0.
\tag{R1}
```
These are the averaging theorem of Minc (1984) and the lemma of Foregger (1980), quoted as Lemma 1.1 in the 2011 paper. The supports V_{m,n} are fully indecomposable for m≥1,n>1.

The averaging step can also be checked directly from (R1) and the Alexandrov–Fenchel inequality for permanents. Hold all but two rows fixed and write the permanent as the symmetric bilinear form F(u,v). Suppose the two rows have the same allowed support S and the current permanent is P. The cofactor inequalities (R1) give F(u,u)≥P and F(v,v)≥P, since each row sums to one. Alexandrov–Fenchel gives F(u,v)²≥F(u,u)F(v,v). Since F(u,v)=P, both diagonal terms equal P. Bilinearity then gives F((u+v)/2,(u+v)/2)=P. Repeated pair averaging and continuity give averaging over any collection of identical-support rows. Columns follow by transposition. This use of averaging is restricted to minimizers.

Start with any minimizer and average its last m rows and then its last m columns. The resulting minimizer Y has entries

```math
 y_{ii}=x_i=1-ma_i\quad(1\le i\le n),\qquad
 y_{ij}=0\quad(i\ne j\le n),
```
```math
 y_{i,n+r}=y_{n+r,i}=a_i,
 \qquad y_{n+r,n+s}=x.
```
Here 0<a_i≤1/m; positivity follows from full indecomposability because a_i=0 would isolate row and column i. The equality of the two cross-block parameters follows from the row and column sum constraints. We prove that every a_i is equal.

### 1.1 A minor polynomial is log-concave

For diagonal D=diag(D_1,...,D_N) with D_i≥0 and a nonnegative vector b, define

```math
 q(y)=\mathop{\mathrm{per}}
 \begin{pmatrix}D&b\mathbf1_m^{\mathsf T}
 \\ \mathbf1_m b^{\mathsf T}&yJ_m\end{pmatrix}.
```
Expanding by the subset of top vertices that use cross-block edges gives the exact differential-operator identity

```math
 q(y)=m!\left[\prod_{i=1}^{N}
 \left(D_i+b_i^2\frac{d}{dy}\right)\right]y^m.
\tag{R2}
```
For a subset of size k, both sides have coefficient
$`(m!)^2/(m-k)!`$ times the corresponding product of b_i² and the remaining D_i. Each operator c+e(d/dy), with c,e≥0, preserves real-rootedness of a polynomial whose roots are real and nonpositive, or produces zero. This follows from derivative interlacing for c,e>0, with the derivative and constant cases immediate. Nonnegative coefficients keep all resulting real roots nonpositive. Thus q is zero or has only real nonpositive roots. For every y≥0 it satisfies

```math
 q'(y)^2\ge q(y)q''(y).
\tag{R3}
```
For q(y)>0 this is obtained by differentiating the logarithm of its factorization; at zero it follows by continuity. This proof also covers zero D_i directly, with no division or limit in (R2).

### 1.2 Equalization from cofactor inequalities

Assume m≥2 and suppose two cross parameters differ. Relabel them as u=a_1<v=a_n. Put

```math
 p_0=\mathop{\mathrm{per}}Y(1,n\mid1,n),
```
```math
 p_1=\mathop{\mathrm{per}}Y(1,n,n+1\mid1,n,n+1),
 \qquad
 p_2=\mathop{\mathrm{per}}Y(1,n,n+1,n+2\mid1,n,n+1,n+2).
```
The two positive cross-block cofactors in (R1) give, by expansion,

```math
 \mathop{\mathrm{per}}Y
 =mu\bigl((1-mv)p_1+(m-1)^2v^2p_2\bigr)
 =mv\bigl((1-mu)p_1+(m-1)^2u^2p_2\bigr).
```
Subtracting and using u<v yields

```math
 (m-1)^2uvp_2=p_1.
\tag{R4}
```
Also p_1>0: otherwise (R4) gives p_2=0, and the preceding expression would force per Y=0, impossible for a doubly stochastic matrix.

Since u<v≤1/m, the upper diagonal entry 1-mu is positive. If 1-mv is also positive, the two diagonal cofactors equal per Y. If 1-mv=0, its cofactor is at least per Y. In both cases,

```math
 (1-mu)p_0+m^2u^2p_1
 \ge (1-mv)p_0+m^2v^2p_1,
```
so

```math
 p_0\ge m(u+v)p_1.
\tag{R5}
```
Now regard the bottom-block entry y of the minor defining p_0 as variable. It has the form in (R2), with the other top diagonal entries D_i=1-ma_i. At the actual y=x,

```math
 q(x)=p_0,\qquad q'(x)=m^2p_1,\qquad
 q''(x)=m^2(m-1)^2p_2.
```
Using (R3) and (R4),

```math
 p_0\le m^2uvp_1.
\tag{R6}
```
Together (R5) and (R6) imply

```math
 \frac1u+\frac1v\le m.
```
But u,v≤1/m gives 1/u+1/v≥2m. This contradiction proves that all a_i are equal. It treats boundary and interior upper diagonal entries without perturbing identities that hold only at a critical point.

If m=1, the same cross-cofactor equality has no p_2 term. It reads u(1-v)p_1=v(1-u)p_1; the cofactor is positive, so p_1>0 and u=v immediately. Thus equalization also holds for m=1.

### 1.3 Consequences for the full face

The row and column sums now show that an averaged minimizer has the form

```math
 A_x=\begin{pmatrix}
 \frac{n-m+m^2x}{n}I_n&\frac{1-mx}{n}J_{n,m}
 \\ \frac{1-mx}{n}J_{m,n}&xJ_m
 \end{pmatrix}.
```
For n≥m the admissible interval is 0≤x≤1/m; for m>n it is (m-n)/m²≤x≤1/m. Averaging preserves the sum of all entries in the lower-right m-by-m block and preserves every upper diagonal entry. Therefore, if A_0 is the only reduced minimizer in the threshold range, every original minimizer has a zero lower-right block and upper diagonal (n-m)I_n/n. This proves noncohesiveness once the scalar theorem is established. Full-face uniqueness will be proved separately by the ordinary van der Waerden theorem in Section 4.1, without importing the original paper's disputed reduction.

## 2. A polynomial identity

Set d=n-m>0 and t=mx. Define

```math
 F_{m,d}(z)=\sum_{i=0}^{m}\binom mi\frac{z^i}{(d+1)_i},
 \qquad
 (d+1)_i=(d+1)(d+2)\cdots(d+i).
```
Here (d+1)_0=1. Counting a permutation according to the number i of its lower-right-block entries gives

```math
 \mathop{\mathrm{per}}A_x
 =\sum_{i=0}^{m}
 \binom mi\frac{n!m!}{(d+i)!n^{n+m-i}}
 x^i(1-mx)^{2m-2i}(d+m^2x)^{d+i}.
\tag{1}
```
For completeness, the coefficient before the matrix weights is
$`\binom{n}{i'}\binom{m}{i}^2 i!(m-i)!^2`$, where i'=d+i counts the top diagonal entries; simplification yields $`\binom mi n!m!/(d+i)!`$. Equivalently choose the top diagonal positions, the lower-right rows and columns, and the three remaining bijections.

Put

```math
 z(t)=\frac{n\,t(d+mt)}{m(1-t)^2},
 \qquad
 C=\frac{n!m!}{d!n^{n+m}},
 \qquad
 f(t)=\mathop{\mathrm{per}}A_{t/m}.
```
Equation (1) becomes, for 0≤t<1,

```math
 f(t)=C(1-t)^{2m}(d+mt)^d F_{m,d}(z(t)).
\tag{2}
```
Every coefficient of F is positive. The ratio of successive coefficients is

```math
 \frac{[z^{i+1}]F}{[z^i]F}
 =\frac{m-i}{(i+1)(d+i+1)}.
```
It follows by comparing coefficients that

```math
 zF''(z)+(d+1+z)F'(z)-mF(z)=0.
\tag{3}
```
Thus no special-function theorem is needed for the threshold proof. This is also the differential equation of a generalized Laguerre polynomial evaluated at -z.

## 3. The logarithmic derivative

Define

```math
 \mu(z)=\frac{zF'(z)}{F(z)}.
```
Equation (3) gives the Riccati identity

```math
 z\mu'(z)=z(m-\mu(z))-\mu(z)(d+\mu(z)).
\tag{4}
```
Since F(0)=1, μ is analytic near zero. Direct differentiation of z(t) gives

```math
 K(t):=\frac{z'(t)}{z(t)}
 =\frac{d+(d+2m)t}{t(d+mt)(1-t)}>0
 \qquad(0\lt t<1).
\tag{5}
```
Differentiating (2), the elementary factors combine to

```math
 \frac{f'(t)}{f(t)}
 =K(t)h(t),\qquad
 h(t)=\mu(z(t))-mt.
\tag{6}
```
Indeed their contribution is -mtK(t). Hence it remains to prove h(t)>0 for 0<t<1 when d²≥m.

## 4. A first-zero argument

Suppose h(t)=0 at some interior t, so μ(z(t))=mt. Substituting into (4) yields

```math
 z\mu'(z)
 =zm(1-t)-mt(d+mt)
 =\frac{t(d+mt)^2}{1-t}.
```
Together with (5), this gives at every zero of h:

```math
 h'(t)=
 \frac{(d+mt)(d+(d+2m)t)-m(1-t)^2}{(1-t)^2}
\tag{7}
```
and therefore

```math
 h'(t)=\frac{
 (d^2-m)+(d^2+3dm+2m)t+m(d+2m-1)t^2
 }{(1-t)^2}>0
\tag{8}
```
whenever d²≥m and t>0.

We also need the initial sign; h(0)=0 is not enough. The coefficient expansion is

```math
 \mu(z)=\frac{m}{d+1}z
 -\frac{m(m+d+1)}{(d+1)^2(d+2)}z^2+O(z^3),
```
while

```math
 z(t)=\frac{n}{m}\bigl(dt+(m+2d)t^2+O(t^3)\bigr).
```
Thus

```math
 h'(0)=\frac{d^2-m}{d+1}.
\tag{9}
```
When d²>m, h is positive for sufficiently small positive t. At equality m=d², the next coefficient is

```math
 h(t)=\frac{3d^2(d+1)}{d+2}t^2+O(t^3),
\tag{10}
```
which is again positive for sufficiently small positive t.

If h later became nonpositive, continuity would give a first positive zero reached from positive values. Differentiability at that zero would force h'≤0. This contradicts (8). Hence h>0 on (0,1).

By (6), f is strictly increasing on (0,1), and continuity at both endpoints gives f(t)>f(0) for every 0<t≤1. Equation (2) gives

```math
 f(0)=\frac{n!m!d^d}{d!n^{n+m}}.
```
The repaired averaging argument in Section 1 shows that this is the global minimum on Ω(V_{m,n}), attained by A_0, and that every full-face minimizer has zero lower-right block. In particular V_{m,n} is not cohesive when n≥m+√m, including every equality case m=d², n=d²+d.

### 4.1 Uniqueness on the entire face

Let Y be any minimizer in this range. Section 1.3 shows that

```math
 Y=\begin{pmatrix}aI_n&L\\K&0_m\end{pmatrix},
 \qquad a=\frac dn,\quad d=n-m>0.
```
The n-by-m matrix L has row sums m/n and column sums 1. The m-by-n matrix K has row sums 1 and column sums m/n. Average only the bottom m rows; Minc's theorem preserves the minimum and replaces K by J_{m,n}/n while leaving L unchanged. The permanent of the result is

```math
 a^d\frac{m!}{n^m}\sum_{|S|=m}\mathop{\mathrm{per}}L[S,:].
\tag{U1}
```
Complete L to the n-by-n doubly stochastic matrix

```math
 B=[L\mid J_{n,d}/n].
```
Its permanent is

```math
 \mathop{\mathrm{per}}B=\frac{d!}{n^d}
 \sum_{|S|=m}\mathop{\mathrm{per}}L[S,:].
\tag{U2}
```
Combining (U1), (U2), and the already proved minimum value forces per B=n!/n^n. Equality in the van der Waerden theorem therefore gives B=J_n/n, so L=J_{n,m}/n. This L was unchanged by the bottom-row averaging. Apply the same expansion to the original Y, now with L uniform, and use the doubly stochastic completion [K^{\mathsf T}|J_{n,d}/n]. Equality again forces K=J_{m,n}/n. Thus Y=A_0.

### 4.2 The known cohesive side, after the repaired reduction

We rederive this side to avoid depending implicitly on the original equalization argument. Suppose n<m+√m. If n>m, put d=n-m. The expansions in Section 4 show

```math
 (\log f)'(0)=\frac{d^2-m}{d+1}<0.
```
At the opposite endpoint, the i=m term of (1) has first derivative f'(1)=2m f(1)>0, and every other term vanishes to order at least two at t=1. Neither endpoint minimizes, so a reduced minimizer is interior and V_{m,n} is cohesive.

If m≥n, put d=m-n and use the upper diagonal parameter a. The reduced family has cross entries (1-a)/m and bottom entries (d+na)/m², with 0≤a≤1. Its permanent is a positive constant times

```math
 (1-a)^{2n}(d+na)^dF_{n,d}\left(\frac{a(d+na)}{(1-a)^2}\right).
```
For d>0 its logarithmic derivative at a=0 is -n/(d+1)<0. For d=0, the F factor is 1+O(a²), giving logarithmic derivative -2n<0. At a=1 the logarithmic derivative is 2n>0, as seen from the leading term. Compactness and the repaired reduction therefore produce a minimizer with 0<a<1, positive at every allowed entry. This proves cohesiveness for all n<m+√m, the already known side of the conjecture.

## 5. Independent proof of the already stated non-barycentricity

Lavi's current Problem 15 page already asserts this result for every m,n≥2. We do not claim it as new. The following proof verifies that it can be combined with the threshold theorem without an unproved subsidiary assumption.

### A variance lemma

For positive integers q and nonnegative integers d, let

```math
 F_{q,d}(z)=\sum_{i=0}^{q}\binom qi\frac{z^i}{(d+1)_i}.
```
This polynomial has q distinct negative roots. A short proof avoids an external zero theorem. Put Q(x)=F_{q,d}(-x). For every integer j with 0≤j<q,

```math
 \int_0^\infty Q(x)x^{d+j}e^{-x}\,dx
 =d!\sum_{i=0}^{q}(-1)^i\binom qi(d+i+1)_j=0.
```
The last sum is the qth finite difference of a polynomial in i of degree j<q. Orthogonality against every polynomial of degree below q, with strictly positive weight on (0,∞), forces Q to have q distinct positive roots: otherwise the polynomial having exactly its sign-changing roots would have degree below q, and its product with Q would have constant nonzero sign, contradicting orthogonality.

Write F(z)=∏_{r=1}^q(1+z/λ_r), λ_r>0 distinct. The distribution

```math
 \Pr(I=i)=\frac{[z^i]F(z)}{F(1)}
```
is the sum of q independent Bernoulli variables with distinct success probabilities p_r=1/(1+λ_r). With u=E I and v=Var I, Cauchy–Schwarz gives

```math
 0\lt u\lt q,
 \qquad
 v=\sum_r p_r(1-p_r)
 <\frac{u(q-u)}q\quad(q≥2).
\tag{11}
```
At q=1 the displayed strict inequality becomes equality. Also, the Riccati identity at z=1 gives

```math
 u(d+u)=q-u-v.
\tag{12}
```
### Case n≥m

Set q=m and d=n-m≥0. Under a uniform supported permutation of V_{m,n}, let I count its lower-right entries. Its distribution is the coefficient distribution of F_{m,d}. Consequently the barycenter B has entries

```math
 a=\frac{d+u}{n}\quad\text{on the upper diagonal},\qquad
 c=\frac{m-u}{mn}\quad\text{in the cross blocks},\qquad
 b=\frac{u}{m^2}\quad\text{in the lower-right block}.
```
For m≥2, (11) gives

```math
 nv<\frac{nu(m-u)}m≤(m-u)(d+u),
```
where the last inequality uses u≤m and n=m+d. Using (12),

```math
 n u(d+u)>(m-u)^2.
\tag{13}
```
At the barycenter t=u/m, the z(t) of Section 2 equals the left side of (13) divided by its right side, so z(t)>1. The function μ(z) is strictly increasing on z>0 because zμ'(z) is the variance of the tilted coefficient distribution. Thus μ(z(t))>μ(1)=u=mt. Equation (6) shows that f is strictly increasing at the barycenter. Decreasing t slightly produces a matrix in the same face with smaller permanent, so B is not a minimizer. The calculation also covers d=0, since t>0 and all logarithms used here are finite.

For m=1 and n>1, the variance inequality is equality but the subsequent comparison is strict because d>0 and u<m. The same conclusion follows, consistently with Brualdi's prior result.

### Case m≥n

Set q=n and d=m-n≥0. Now let I count the chosen upper diagonal entries of a uniform supported permutation. Its count distribution is the coefficient distribution of F_{n,d}. The barycenter has

```math
 a=\frac un,\qquad c=\frac{n-u}{mn},\qquad b=\frac{d+u}{m^2}.
```
For the one-parameter doubly stochastic family with upper diagonal entry a,

```math
 c(a)=\frac{1-a}{m},\qquad
 b(a)=\frac{d+na}{m^2},\qquad
 z(a)=\frac{a(d+na)}{(1-a)^2},
```
the permanent is a positive constant times

```math
 (1-a)^{2n}(d+na)^dF_{n,d}(z(a)).
```
Its logarithmic derivative is

```math
 \frac{z'(a)}{z(a)}\bigl(\mu(z(a))-na\bigr),
 \qquad \frac{z'(a)}{z(a)}>0.
```
Since n≥2, (11) and (12) imply

```math
 n u(d+u)=n(n-u-v)>(n-u)^2.
```
Hence z(u/n)>1 and the same increasing-derivative argument shows that the barycenter is not minimizing.

This proves non-barycentricity throughout m≥1, n>1. The excluded case n=1 has V_{m,1}=J_{m+1}, which is barycentric.

## 6. Scope and sources

This settles the named Pula–Song–Wanless parameter-family conjecture, subject to the limitations of the source audit. The face equalization and uniqueness arguments have been proved independently above; the proof uses the older repeated-support averaging theorem, Foregger's minimizer lemma, and the ordinary van der Waerden theorem. It does not resolve the unrestricted characterization problems on Minc's list. No fixed-order computation is used in the proof.

Primary sources:

1. Pula, Song and Wanless (2011), [DOI](https://doi.org/10.1016/j.laa.2010.08.015), [complete author preprint](https://cs.du.edu/~mathfiles/preprints/nsm-math-preprint-1022.pdf). Section 2, Theorem 2.1, formula (6), Corollary 2.5, Conjecture 2.1; Section 3, Theorem 3.1.
2. Brualdi (1985), *An interesting face of the polytope of doubly stochastic matrices*, [DOI](https://doi.org/10.1080/03081088508817637). The m=1 case is explicitly credited to this source by Pula–Song–Wanless.
3. Cheon and Song (2024), *A conjecture on minimum permanents*, [DOI](https://doi.org/10.21136/CMJ.2023.0186-23), [complete primary PDF](https://dml.cz/bitstream/handle/10338.dmlcz/152279/CzechMathJ_74-2024-1_15.pdf). This proves special cases including V_{4,5} and V_{4k,7k}, not the general threshold.
4. Lavi, [Problem 14](https://yair-lavi.com/mincs-list/problem-14/index.html) and [Problem 15](https://yair-lavi.com/mincs-list/problem-15/index.html), checked 2026-11-20. Both full classification problems remain open. The latter records non-barycentricity for all m,n≥2 as existing progress.
5. Song (2013), *Minimum permanents on doubly stochastic matrices with prescribed zeros*, Honam Math. J. 35, 211–223, [DOI](https://doi.org/10.5831/hmj.2013.35.2.211), [public primary PDF](https://koreascience.or.kr/article/JAKO201319133640171.pdf). Full 13-page text inspected. Remarks 2.4 and 4.4 flag the diagonal-positivity issue. Theorems 4.5 and 4.6 settle V_{4,n} for n≥7 and n=6 respectively, not the general threshold.
6. Minc (1984), *Minimum permanents of doubly stochastic matrices with prescribed zero entries*, [DOI](https://doi.org/10.1080/03081088408817592), Theorem 1 on averaging repeated-support rows and columns.
7. Foregger (1980), *On the minimum value of the permanent of a nearly decomposable doubly stochastic matrix*, [DOI](https://doi.org/10.1016/0024-3795(80)90008-7), minimizer lemma as quoted in the 2011 and 2013 primary papers.

The separate audit file records searches for later resolutions and the distinction between the flawed published reduction and the replacement proof above.
