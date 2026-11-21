# Low permanent does not force geometric symmetrization descent

Research checkpoint, 21 November 2026 UTC. This is an exact obstruction to
a proposed proof route for Brualdi's C_n family. It does not resolve Minc
Problem 14, the subsidiary cohesiveness conjecture, or any finite-order
instance. The full minimizing cofactor conditions remain unaddressed.

The [symmetric-support note](brualdi_symmetric_support.md) proves that at a
global minimizer on C_n=J_n−I_n+E_nn, geometric transpose symmetrization has
a symmetric doubly stochastic scaling. Its missing step is a permanent
comparison. One proposed sufficient hypothesis was merely

```math
\operatorname{per}A<p_n:=\frac{D_n}{(n-1)^n}.
```

That hypothesis is insufficient, even when A is positive everywhere on C_n.
The certificate below uses exact rational inequalities throughout.

## 1. The two rational weight matrices

Fix n=24. Let W agree with C_n except that w_12=9/100. Let V agree with
C_n except that v_12=v_21=3/10. Thus

```math
V_{ij}=\sqrt{W_{ij}W_{ji}}.
```

Both have fully indecomposable support C_n. Let A and B be their unique
doubly stochastic scalings. In particular B is symmetric. If
A=RWC with R,C positive diagonal, then

```math
\sqrt{A\circ A^T}
=\sqrt{RC}\,V\sqrt{RC}.
```

Consequently B is also the doubly stochastic scaling obtained by applying
geometric transpose symmetrization to A. The notation √RC here denotes
the positive diagonal matrix with i-th entry √(R_ii C_ii).

Exact capacity brackets in Section 3 prove

```math
0.9999835\,p_{24}<\operatorname{per}A
<0.9999836\,p_{24}<p_{24},
\tag{1}
```

```math
p_{24}<1.0001147\,p_{24}<\operatorname{per}B
<1.0001148\,p_{24}.
\tag{2}
```

All displayed terminating decimals in (1) and (2) are exact rational
bounds, not rounded permanent estimates. Thus the operation increases
the permanent at a point strictly below p_24. Every allowed entry of A
is positive, so it also has majority row/column support and an empty
extra-zero DAG. These support conditions do not repair the comparison.

## 2. Exact weight permanents

Multilinearity and elementary forbidden-fixed-point counting give

```math
\operatorname{per}C_n=D_n+D_{n-1},
\qquad c_n=D_{n-1}+2D_{n-2}+D_{n-3},
\qquad e_n=D_{n-2}+D_{n-3}.
```

Here c_n is the permanent after removing row 1 and column 2 from C_n;
e_n is the permanent after removing rows 1,2 and columns 1,2. Indeed the
first minor has n−1 positions, of which n−3 fixed points are forbidden.
The second is C_(n−2). Therefore

```math
\operatorname{per}W=D_n+D_{n-1}-\frac{91}{100}c_n,
\tag{3}
```

```math
\operatorname{per}V=D_n+D_{n-1}-\frac75c_n+\frac{49}{100}e_n.
\tag{4}
```

The proof uses these formulas at n=24. It does not estimate a permanent
by Monte Carlo, enumerate candidate matrices, or infer a theorem from a
range of order tests.

## 3. Rational capacity brackets

For any nonnegative matrix M, write

```math
\operatorname{cap}(M)=\inf_{x>0}
\frac{\prod_i(Mx)_i}{\prod_j x_j}.
```

A doubly stochastic matrix has capacity one by weighted AM–GM. Capacity
is monotone under entrywise comparison, is homogeneous of degree n, and
is multiplied by ∏r_i∏c_j under positive diagonal row and column scaling.
Consequently the doubly stochastic scaling S(M) satisfies

```math
\operatorname{per}S(M)=\frac{\operatorname{per}M}{\operatorname{cap}(M)}.
\tag{5}
```

For W choose rational row multipliers with common denominator 10^12,
whose numerators, in order, are

```text
1088477592759, 1045432090519,
1043471932248 repeated 21 times, 1000000000000.
```

For V choose

```text
1078938778453 repeated twice,
1043428329348 repeated 21 times, 1000000000000.
```

For either weight matrix M and its chosen r define exactly

```math
c_j=\frac1{\sum_i r_iM_{ij}},\qquad
T_{ij}=r_iM_{ij}c_j,
\qquad h_i=1-\sum_jT_{ij}.
```

Every column of T sums to one and ∑h_i=0. Define an explicit correction
with zero diagonal by

```math
\Delta_{ii}=0,\qquad
\Delta_{ij}=\frac{(n-1)h_i+h_j}{n(n-2)}\quad(i\ne j).
\tag{6}
```

Its row sums are h_i and its column sums are zero. The rational checker
verifies, for every entry of both matrices, that

```math
|\Delta_{ij}|\le\eta T_{ij},\qquad\eta=10^{-10}.
\tag{7}
```

Hence Q=T+Δ is doubly stochastic and
(1−η)T≤Q≤(1+η)T entrywise. Applying monotonicity and homogeneity of
capacity gives

```math
(1+\eta)^{-n}\le\operatorname{cap}(T)\le(1-\eta)^{-n}.
```

Combining this with (5), and noting that S(T)=S(M), yields the fully
rational permanent interval

```math
\boxed{\quad
\operatorname{per}T(1-\eta)^n
\le\operatorname{per}S(M)
\le\operatorname{per}T(1+\eta)^n.
\quad}
\tag{8}
```

The value per T=(∏r_i)(∏c_j)per M is rational and uses (3) or (4).
Exact integer comparisons of the endpoints in (8) imply (1) and (2).
The multipliers were located numerically; their discovery procedure is
irrelevant to the certificate because all subsequent premises and
inequalities are exact rational assertions.

## 4. Why this says nothing against cohesiveness

The matrix A is not a global minimizer on C_24. This can also be checked
exactly. Take the symmetric feasible matrix H with its entire last row
and column equal to y=1/n, top diagonal zero, and all other entries equal
to x=(n−1)/(n(n−2)). With m=n−1, border expansion gives

```math
\operatorname{per}H
=yD_mx^m+y^2m x^{m-1}(D_m+D_{m-1}).
```

The certificate verifies that this rational number is smaller than the
lower endpoint for per A in (8). The obstruction therefore targets the
weaker condition per A<p_n. It does not establish failure of a comparison
that also uses all full-minimizer cofactor equations and inequalities.

Run `python brualdi_low_permanent_scaling_obstruction.py`. The script
uses only Python's standard library and exact rational arithmetic.

The current problem statements are [Minc Problem 14](https://yair-lavi.com/mincs-list/problem-14/index.html)
and [Problem 15](https://yair-lavi.com/mincs-list/problem-15/index.html).
The capacity formalism is classical; see Gurvits,
[primary full text](https://arxiv.org/pdf/0711.3496), Definition 2.1 and Fact 2.2.
The calculation above claims no new resolution or historical priority.
