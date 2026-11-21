# Border and diagonal-similarity identities for Brualdi's family

Research checkpoint, 20 November 2026 (America/Chicago).

This is a necessary-condition reduction for a global minimizer on
$`C_n=J_n-I_n+E_{nn}`$, $`n\ge4`$. It does not eliminate the extra-zero DAG and does not prove cohesiveness.

The starting structural facts are those proved in [the Brualdi structural reduction](../combinatorial/brualdi_structure.md): the free row and column are positive; every positive-entry cofactor equals the permanent $`P`$; forbidden diagonal cofactors are strictly smaller than $`P`$; allowed-zero cofactors are at least $`P`$; and all two-row and two-column permanent forms satisfy strict Alexandrov--Fenchel. The primary references and their scope are audited in [the source review](brualdi_source_audit.md).

## Border notation and stationary equations

Put $`m=n-1`$ and write


```math
A=\begin{pmatrix} B&u\\v^{\mathsf T}&w\end{pmatrix}.
```


Here $`B`$ is $`m\times m`$, every diagonal entry of $`B`$ is zero, and $`u,v,w`$ are positive. Double stochasticity gives


```math
u=\mathbf1-B\mathbf1,\qquad
v=\mathbf1-B^{\mathsf T}\mathbf1,\qquad
w=\sum_{i,j}B_{ij}-m+1.
\tag{1}
```


Define


```math
p=\mathop{\mathrm{per}}B,\qquad
C_{ij}=\mathop{\mathrm{per}}B(i\mid j),\qquad S=C/p.
```


Expanding through the border yields


```math
\mathop{\mathrm{per}}A=w p+u^{\mathsf T}Cv.
\tag{2}
```


The free-position cofactor equations give


```math
\boxed{\quad p=P,\qquad Cv=P\mathbf1,\qquad C^{\mathsf T}u=P\mathbf1.\quad}
\tag{3}
```


Thus $`Sv=\mathbf1`$ and $`S^{\mathsf T}u=\mathbf1`$.
Separately, row and column Laplace expansions in $`B`$ show that
$`B\circ S`$ is doubly stochastic. Since every row sum of $`B`$ is $`1-u_i<1`$, its spectral radius is strictly below one.

These identities retain the full free-row and free-column stationarity. Equality of the maximal minors alone is weaker, as the earlier counterexamples show.

## A feasible diagonal-similarity path

Fix $`h\in\mathbb R^m`$, let
$`D(t)=\mathop{\mathrm{diag}}(e^{t h_1},\ldots,e^{t h_m})`$, and put


```math
B(t)=D(t)BD(t)^{-1}.
```


Restore the border using (1). This preserves double stochasticity and every zero in the top block. The positive free row and column ensure that the resulting $`A(t)`$ is feasible for both signs of sufficiently small $`t`$.

Diagonal similarity preserves $`p`$, while the cofactor matrix transforms as


```math
C(t)=D(t)^{-1}CD(t).
```


Set $`x=D(t)^{-1}\mathbf1`$ and $`y=D(t)\mathbf1`$. Direct substitution gives


```math
D(t)^{-1}u(t)=(I-B)x,\qquad
D(t)v(t)=(I-B^{\mathsf T})y,
```


and $`w(t)=1-m+x^{\mathsf T}B^{\mathsf T}y`$. Hence


```math
\boxed{\quad
\frac{\mathop{\mathrm{per}}A(t)}P
=1-m+x^{\mathsf T}My
=1-m+\sum_{i,j}M_{ij}e^{t(h_j-h_i)},
\quad}
\tag{4}
```


where


```math
M=B^{\mathsf T}+(I-B^{\mathsf T})S(I-B^{\mathsf T}).
\tag{5}
```


Equation (3) implies exactly


```math
M\mathbf1=\mathbf1,\qquad M^{\mathsf T}\mathbf1=\mathbf1.
\tag{6}
```


For example, the first identity follows from
$`(I-B^{\mathsf T})\mathbf1=v`$ and $`Sv=\mathbf1`$.
The second follows from
$`\mathbf1^{\mathsf T}(I-B^{\mathsf T})=u^{\mathsf T}`$ and
$`u^{\mathsf T}S=\mathbf1^{\mathsf T}`$.

The matrix $`M`$ need not have nonnegative entries by any argument established here. Calling it a stochastic matrix would therefore add an unsupported claim.

At the minimum, the second derivative in (4) must be nonnegative. Using (6), this gives the necessary condition


```math
\boxed{\qquad 2I-M-M^{\mathsf T}\succeq0.\qquad}
\tag{7}
```


Indeed,


```math
\frac1P\left.\frac{d^2}{dt^2}\mathop{\mathrm{per}}A(t)\right|_{t=0}
=\sum_{i,j}M_{ij}(h_j-h_i)^2
=h^{\mathsf T}(2I-M-M^{\mathsf T})h.
```


The all-ones vector is in the kernel, as it must be: adding a constant to all coordinates of $`h`$ leaves $`B(t)`$ unchanged.

## A scalar consequence: the free diagonal is below one half

Write the top block of normalized full cofactors as


```math
\frac{G_{\rm top}}P
=J_m-\mathop{\mathrm{diag}}(\delta_1,\ldots,\delta_m)+T,
\tag{8}
```


where $`\delta_i>0`$, $`T\ge0`$, and $`T`$ is supported on the extra zeros. The DAG permits a topological ordering in which $`T`$ is strictly upper triangular, although triangularity is not needed for the following bound.

For rows $`i,n`$, the repeated-row permanent with two copies of row $`i`$ equals $`P`$, because every free-row cofactor equals $`P`$. The mixed permanent is also $`P`$. The two rows differ at coordinate $`i`$, where row $`i`$ is zero and the free row is positive. Strict Alexandrov--Fenchel therefore makes the permanent with two copies of the free row strictly smaller than $`P`$. Using (8), this is


```math
\delta_i v_i>\sum_jT_{ij}v_j.
\tag{9}
```


The transposed argument gives
$`\delta_i u_i>\sum_jT_{ji}u_j`$.
In particular,


```math
L=\sum_i u_i\delta_i v_i-\sum_{i,j}u_iT_{ij}v_j>0.
\tag{10}
```


Put $`q=\sum_i u_i=\sum_i v_i=1-w`$, and define the nonnegative number


```math
r_2=\frac1P
\left.\frac{d^2}{dt^2}\mathop{\mathrm{per}}(B+tuv^{\mathsf T})\right|_{t=0}.
```


Nonnegativity follows from the coefficient expansion; no real-rootedness assertion is used. Contracting the full top cofactors with $`uv^{\mathsf T}`$ in (8) gives $`q^2-L`$. Expanding those same cofactors through the free border gives $`wq+r_2`$, since $`u^{\mathsf T}Sv=q`$. Therefore


```math
L=2q^2-q-r_2>0.
\tag{11}
```


It follows that $`q>1/2`$, hence


```math
\boxed{\quad 0\lt a_{nn}=w\lt \frac12.\quad}
\tag{12}
```


This is a necessary scalar restriction. It does not exclude $`T\ne0`$, and $`T=0`$ by itself would still not exclude an extra zero whose cofactor equals $`P`$.

## Exact unresolved step

Equations (1)--(3), the nonlinear doubly stochastic identity $`B\circ S\in\Omega_m`$, the cofactor inequalities (8), and the second-variation condition (7) all hold simultaneously at the proposed boundary minimizer. No proof has been obtained that these conditions force the extra-zero graph to be empty.

In particular, neither an entrywise sign condition on $`M`$, a generic sign rule for an inverse permanent kernel, nor a universal decrease under transpose averaging has been established. The earlier audits refute the latter two shortcuts without the complete minimizing hypotheses. The identities in this note are retained as a concrete route for further work, without a solved-conjecture or priority claim.
