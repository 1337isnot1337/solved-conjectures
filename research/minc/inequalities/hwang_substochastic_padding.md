# Substochastic cores in the Hwang padding construction

Research checkpoint, 20 November 2026 (America/Chicago). This extends the exact padding formula to every doubly substochastic core. It supplies a counterexample transfer test, not a curvature sign or a resolution of Hwang's conjecture.

## Completion

Let $`B`$ be a nonnegative matrix of order $`m`$ with row and column sums at most one. Put


```math
r=B\mathbf1,\qquad c=B^{\mathsf T}\mathbf1,\qquad
s=\sum_{i,j}b_{ij},\qquad q=m-s,
```


```math
u=\mathbf1-r,\qquad v=\mathbf1-c.
```


For an integer $`M\geq m`$, let $`\mathbf1_M`$ be the all-ones column vector and define


```math
A_M=
\begin{pmatrix}
B&u\mathbf1_M^{\mathsf T}/M\\
\mathbf1_Mv^{\mathsf T}/M&(M-q)\mathbf1_M\mathbf1_M^{\mathsf T}/M^2
\end{pmatrix}.
\tag{1}
```


Every entry is nonnegative. Its top row sums and top column sums are one. A tail row has sum $`q/M+(M-q)/M=1`$, and the same holds for a tail column. Thus $`A_M`$ is doubly stochastic. If $`B`$ is already doubly stochastic, $`q=0,u=v=0`$, and this reduces to $`B\oplus J_M`$, with $`J_M`$ the normalized flat matrix.

Write $`N=m+M`$ and


```math
p_M(t)=\mathop{\mathrm{per}}\bigl((1-t)J_N+tA_M\bigr),
\qquad d_N=N!/N^N.
```


## Exact finite formula

Set


```math
a=\frac{1-t}{N},\quad
C=tB+a\mathbf1_m\mathbf1_m^{\mathsf T},\quad
\ell_i=a+\frac{tu_i}{M},\quad
\rho_j=a+\frac{tv_j}{M},
```


```math
b=a+\frac{t(M-q)}{M^2}.
\tag{2}
```


For sets $`S,T\subseteq[m]`$ with $`|S|=|T|=k`$, let $`h=m-k`$. A permutation whose core-to-core edges have exactly row set $`S`$ and column set $`T`$ contributes


```math
\mathop{\mathrm{per}}C[S,T]\,
\frac{(M!)^2}{(M-h)!}\,
b^{M-h}
\prod_{i\notin S}\ell_i
\prod_{j\notin T}\rho_j.
\tag{3}
```


Indeed, the $`h`$ remaining core rows must use distinct tail columns and the $`h`$ remaining core columns must receive distinct tail rows. There are $`(M)_h^2`$ such choices and assignments. The remaining uniform tail block contributes $`(M-h)!b^{M-h}`$. Their product is the factorial factor in (3). The empty minor has permanent one.

Summing (3) over $`k,S,T`$ gives an exact formula for $`p_M`$. After dividing by $`d_N`$, it can be written


```math
\frac{p_M(t)}{d_N}
=\frac{M!b^M}{d_N}
\sum_{\substack{S,T\subseteq[m]\\|S|=|T|}}
\mathop{\mathrm{per}}C[S,T]\,
(M)_{m-|S|}b^{-(m-|S|)}
\prod_{i\notin S}\ell_i
\prod_{j\notin T}\rho_j.
\tag{4}
```


On the half interval $`0\leq t\leq1/2`$, $`b>0`$, so this expression has no zero denominator.

## Limit and its derivatives

As $`M\to\infty`$,


```math
C\longrightarrow tB,\quad
M\ell_i\longrightarrow1-tr_i,\quad
M\rho_j\longrightarrow1-tc_j,\quad
Mb\longrightarrow1.
\tag{5}
```


Also


```math
\frac{M!b^M}{d_N}
=\frac{d_M}{d_N}(Mb)^M
\longrightarrow e^{st}.
\tag{6}
```


For (6), $`d_M/d_{m+M}\to e^m`$, and


```math
Mb=1-\frac{m(1-t)}{m+M}-\frac{tq}{M},
```


so


```math
M\log(Mb)\longrightarrow-m(1-t)-tq=-m+st.
```


The convergence, including the first two derivatives with respect to $`t`$, is uniform on $`[0,1/2]`$. This follows by differentiating the displayed logarithm: its affine decrement and its derivatives are $`O(M^{-1})`$, uniformly on the interval, and $`Mb`$ is bounded away from zero for all sufficiently large $`M`$. The independent factor $`d_M/d_N`$ has no $`t`$ derivatives.

The other factors in (4) are finite products of polynomials and reciprocals of $`Mb`$, after cancelling powers of $`M`$. In particular,


```math
\begin{aligned}
&(M)_h b^{-h}
\prod_{i\notin S}\ell_i
\prod_{j\notin T}\rho_j\\
&\quad=
\frac{(M)_h}{M^h}(Mb)^{-h}
\prod_{i\notin S}(M\ell_i)
\prod_{j\notin T}(M\rho_j).
\end{aligned}
```


They therefore converge uniformly with their first two derivatives. There are only finitely many pairs $`S,T`$, and each fixed-size permanent is a polynomial. Hence


```math
\frac{p_M}{d_N}\longrightarrow F_B^{\mathrm{ext}}
\quad\hbox{in }C^2([0,1/2]),
\tag{7}
```


where


```math
F_B^{\mathrm{ext}}(t)=
e^{st}
\sum_{\mathcal M}
t^{|\mathcal M|}
\prod_{(i,j)\in\mathcal M}b_{ij}\,
\prod_{i\notin V_L(\mathcal M)}(1-tr_i)
\prod_{j\notin V_R(\mathcal M)}(1-tc_j).
\tag{8}
```


The sum runs over all matchings in the core bipartite graph. When $`B`$ is doubly stochastic, (8) is exactly the previously studied $`F_B(t)`$.

Thus a doubly substochastic core with


```math
(F_B^{\mathrm{ext}})''(t_0)<0
\qquad\text{for some }0\lt t_0\leq1/2
\tag{9}
```


would disprove Hwang's conjecture through the finite matrices (1), for every sufficiently large $`M`$. No core satisfying (9) has been established here.

## Balanced Poisson representation

Take independent variables


```math
Z_{ij}\sim\mathop{\mathrm{Poisson}}(tb_{ij}),\quad
U_i\sim\mathop{\mathrm{Poisson}}(1-tr_i),\quad
V_j\sim\mathop{\mathrm{Poisson}}(1-tc_j).
```


Set $`X_i=U_i+\sum_jZ_{ij}`$, $`Y_j=V_j+\sum_iZ_{ij}`$. Each marginal has mean one, and the coordinates within each of the vectors $`X`$ and $`Y`$ are independent.

On the event that every coordinate of $`X`$ and $`Y`$ equals one, the positive $`Z_{ij}`$ variables form a matching and equal one. Its contribution is the corresponding term in (8), multiplied by $`\exp(-2m+st)`$. Therefore


```math
F_B^{\mathrm{ext}}(t)
=e^{2m}\mathbb P(X_1=\cdots=X_m=Y_1=\cdots=Y_m=1).
\tag{10}
```


This identity does not establish monotonicity or convexity. In particular, the all-core monotonicity theorem for doubly stochastic cores cannot be transferred to arbitrary substochastic $`B`$ by dropping its balance hypotheses.

## A limitation of vertexwise arguments

The doubly stochastic mean-occupancy theorem is an average statement. For the $`N`$-arm core


```math
H_N=
\begin{pmatrix}
0&\mathbf1_N^{\mathsf T}/N\\
\mathbf1_N/N&(1-1/N)I_N
\end{pmatrix},
```


put $`d=1-1/N`$ and $`X=1+dz`$. Its exact rook partition and the partition after deletion of one hub row are


```math
R_{H_N}(z)=X^{N-2}\left[(X+z)^2+\frac dN z^3\right],
\qquad
R_{\text{hub deleted}}(z)=X^{N-1}(X+z).
\tag{11}
```


They follow by counting whether neither hub, one hub, or both hubs are matched; the two matched hubs may use the same arm or different arms. The hub monomer probability is


```math
\frac{X(X+z)}{(X+z)^2+(d/N)z^3}.
```


At $`N=4,z=2`$, it is $`15/29>1/2`$, although the average monomer probability is $`311/725<1/2`$. As $`N\to\infty`$, the hub probability tends to $`(1+z)/(1+2z)`$.

Thus a proof cannot replace the average bound by a uniform vertexwise comparison to $`1-t`$. This is an exact obstruction to an auxiliary argument, not a counterexample to Hwang.

## Scope

The completion, finite counting formula, $`C^2`$ limit, and Poisson representation are elementary deductions supplied here. They extend the prior uniform-block calculation. No novelty or solved-conjecture claim is attached to them. The remaining step is a curvature sign for (8), or an exact core with negative curvature; neither has been obtained.



## Full-interval C2 strengthening

The limit (7) in fact holds in \(C^2([0,1])\), for **every** fixed
nonnegative doubly substochastic core \(B\), provided \(M\) tends to
infinity through integers greater than \(q=m-s\). This strengthens
the half-interval assertion without assuming that \(B\) is PSD.

The only potential endpoint obstruction in formula (4) is the factor
\(b^{-h}\). But the exact affine identity from (2) is

~~~math
Mb=1-\frac{m(1-t)}{M+m}-\frac{qt}{M}.
~~~

For all \(0\le t\le1\) and sufficiently large \(M\), this is bounded
below by \(1-\max\{m/(M+m),q/M\}\ge1/2\). Its first derivative is
\(O(1/M)\), its second derivative vanishes. Consequently
\((Mb)^{-h}\) and its first two derivatives converge uniformly to one.
The remaining factors in formula (4), rewritten using \(M\ell_i\),
\(M\rho_j\), and \((M)_h/M^h\), also converge in \(C^2([0,1])\).
Monomer factors may vanish at \(t=1\); we never divide by them.

The common prefactor satisfies

~~~math
\frac{M!b^M}{d_{M+m}}=\frac{d_M}{d_{M+m}}(Mb)^M,\qquad
M\log(Mb)\longrightarrow -m(1-t)-qt=-m+st
\quad\text{in }C^2([0,1]).
~~~

The convergence of the logarithm and its first two derivatives is
uniform: its affine decrement is \(O(1/M)\); the second derivative of
the logarithm after multiplication by \(M\) is \(O(1/M)\).
As \(d_M/d_{M+m}\to e^m\), the prefactor converges to \(e^{st}\)
in \(C^2([0,1])\). The sum in (4) has finitely many terms depending
only on \(m\), proving

~~~math
\frac{p_M}{d_{M+m}}\longrightarrow F_B^{\mathrm{ext}}
\quad\text{in }C^2([0,1]).
~~~

This is not a curvature theorem for arbitrary cores. A strictly
negative derivative of the limiting function at an interior point
would transfer to finite nonmonotone doubly stochastic segments.
For symmetric PSD cores, the independent
[Gram-square theorem](hwang_psd_gram_core.md) gives
\(F_B''(t)\ge\|B\|_F^2>0\) for all \(t\ge0\), so the entire
finite segment is strictly convex and increasing for all sufficiently
large \(M\), even in some indefinite boundary completions.
Neither complete P8 classification nor unrestricted C34 follows.
