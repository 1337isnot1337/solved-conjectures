# Independent-Y obstruction for ordered coherent maps

Research status: this is an exact obstruction for the stated separated
operator class. It strengthens [COHERENT_COMMON_IMAGE_OBSTRUCTION.md](COHERENT_COMMON_IMAGE_OBSTRUCTION.md):
the A images may be different, and their X operators may be arbitrary.
The result does not cover Y-dependent outside operators or more general
middle coefficients.

## 1. Complete coefficient and hypotheses

Let X and Y be independent flag systems. Write y_(t,j) for commuting
Y variables and d_(t,b) for their derivatives. Fix p target outer
labels and m internal labels. In family z, let V_z be any p-by-m
matrix of X operators, and S_z any m-by-m matrix of X operators.
The X operators need not commute with each other or with the middle
X factors. They commute with every Y variable and derivative.

There are source H labels h in [m] and endpoint Q labels b in [p].
At each source vertex v fix a C subspace C_v^z of dimension at most
w. For each independently chosen target D label (i,j), use

```math
f_v^{z,ij}=\sum_{t=1}^m x_{it}y_{tj}v_{v,t}^{z,ij},
\qquad v_{v,t}^{z,ij}\in C_v^z.                    \tag{1}
```

Here x_(i,t) can be any fixed X operators for which all displayed
compositions make sense. The ordered construction has endpoint term
V_z S_z d_Y f_b and intermediate term
-V_z diag_h(f_h) S_z d_Y. Its complete coefficient at A output a,
B output b, and D label (i,j) is

```math
\begin{aligned}
\mathcal O_{ab}^{ij}
={}&\sum_{r,t}y_{tj}d_{rb}
 \left[\sum_z (V_zS_z)_{ar}x_{it}v_{b,t}^{z,ij}
       -\sum_{z,h}(V_z)_{ah}x_{it}v_{h,t}^{z,ij}(S_z)_{hr}
 \right]\\
&+\delta_{bj}\sum_t\sum_z(V_zS_z)_{at}x_{it}
                                      v_{j,t}^{z,ij}. \tag{2}
\end{aligned}
```

Only Y derivatives have been normal ordered. In particular, every
X factor remains in its actual order in (2).

Assume the complete output is independent of the Y flag, in the
form

```math
\mathcal O_{ab}^{ij}=\delta_{bj}Q_{ai}L_{ij}\otimes I_Y,
                                                               \tag{3}
```

where the X-operator column Q_(bullet,i) is nonzero for every i.
For finite flags it suffices that the constant and degree-one Y
polynomials are retained and all displayed prefix operations on
them are exact. The calculation also applies to identities of
polynomial differential operators with arbitrary X-operator
coefficients. Rational X coefficients are permitted wherever their
algebraic identities or a specified realization are defined.

## 2. Endpoint intersection

Define the W-valued X-operator column

```math
K_{b,t,r}^{ij}
 =\sum_z(V_zS_z)_{\bullet r}x_{it}v_{b,t}^{z,ij}.       \tag{4}
```

First apply (2) to the constant Y polynomial. The derivative line
vanishes, so the second line is the target coefficient (3). Subtract
this equality. Apply what remains to y_(r,b), and read its coefficient
at y_(t,j). This isolates each bracket in (2). Consequently

```math
K_{b,t,r}^{ij}
 =\sum_{z,h}(V_z)_{\bullet h}x_{it}
                  v_{h,t}^{z,ij}(S_z)_{hr}.            \tag{5}
```

The right side is independent of the endpoint b. For each b, every
C coefficient of the left side belongs to sum_z C_b^z. Therefore
every C coefficient of the common operator in (5) belongs to the
fixed space

```math
W_0=\bigcap_{b=1}^p\left(\sum_z C_b^z\right),
\qquad \dim W_0\le r w.                              \tag{6}
```

This conclusion does not require independence of the columns of
V_z, a common V_z image, invertibility of S_z, or commutation among
the X operators. It uses equality of the complete operator-valued
C coefficients, not equality of a selected scalar term.

The second line of (2) is the diagonal contraction
delta_(bj) sum_t K_(j,t,t). Its C coefficients also belong to W_0.
Since Q_(bullet,i) is nonzero, applying a suitable scalar linear
functional to its finite operator coefficient space in (3), or
to its finite-dimensional linear span in the algebraic formulation,
gives L_(ij) in W_0. Hence

```math
\mathop{\mathrm{rank}} L\le r w.                       \tag{7}
```

## 3. Scope and consequence

With r=p^(o(1)) and w=p^(1+o(1)), (7) prevents the C rank
p^(2-o(1)) required by the geodesic trade. In particular, replacing
a common multiplication pseudoinverse by genuinely different
X-only images does not repair the ordered linear-Y construction.
X-only Ward commutators and operator-valued flavour changes remain
inside the theorem when their middle dependence is (1).

Y-dependent outside maps, a target with a nontrivial Y channel,
and more general middle operators are outside the statement.
Those changes require a new complete coefficient calculation.

The constructive worker identified this extension of the common-image
obstruction. The operator worker independently checked (2), the
constant/degree-one argument, and the endpoint intersection deduction.
